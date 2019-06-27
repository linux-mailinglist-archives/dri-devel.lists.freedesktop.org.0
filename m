Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56BDB58684
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2019 17:57:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F7D96E822;
	Thu, 27 Jun 2019 15:57:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7580E6E822
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 15:57:26 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id z25so7561135edq.9
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jun 2019 08:57:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=LDJI/EyKBg8ucr5UG/9RrlUOzsbOLr6xbCxweAYiBoA=;
 b=Zpgn2P7oNFha5EtNQ3NAP/1XnIJi/6YQkerBD5Ew/crkFEkL/aEkPrlN3Yp3DelFx6
 /+L0vWdmeTjzk5n8CJHiONQqcRXgHvgKcRZxEk0of9o2ueJU/Y4dnwpTRxJho5q3orx8
 NOkaKovSFEhO9nM10zzpzmFbfvEMhZwwsvSXRCdj3ZYB3icVAoZvi6bFKgjVqiqcjoOn
 hvg5yXyjNPolLSW0XG6O3o9Z9B7KZ/TQDVcyxKwftEfyREwlcXSLIvjqD0EHvd2aPOlq
 cnPrf4oKIrkM4+R0YC2G3+SU//1I5oSkskKiK+Oh4GLoQ/J2cl7hgcbaZIcjlL9mZqLj
 Tohw==
X-Gm-Message-State: APjAAAVQwhFvEJAZIH/SZDm6mCGbY3p1owhb6l36kt3P+b8Aa+99Jse/
 qqCKXGWfab1lApezaec730vLog==
X-Google-Smtp-Source: APXvYqxMOnHfGtCpD9F+AspecX/d/CFarSD3l2LQFAFlfKi6ewZTubeNjnQcZPWcK8XEwxN5XWMlUQ==
X-Received: by 2002:a17:906:1dcc:: with SMTP id
 v12mr3974357ejh.110.1561651045048; 
 Thu, 27 Jun 2019 08:57:25 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id f24sm882186edf.30.2019.06.27.08.57.23
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 27 Jun 2019 08:57:24 -0700 (PDT)
Date: Thu, 27 Jun 2019 17:57:22 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH v2 00/18] drm/ttm: make ttm bo a gem bo subclass
Message-ID: <20190627155722.GM12905@phenom.ffwll.local>
References: <20190621115755.8481-1-kraxel@redhat.com>
 <20190627073239.GF12905@phenom.ffwll.local>
 <20190627122218.aiqa5qbujwqgd24m@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627122218.aiqa5qbujwqgd24m@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=LDJI/EyKBg8ucr5UG/9RrlUOzsbOLr6xbCxweAYiBoA=;
 b=iMTRDRN3mbHg5HWKbWdvUDDbumwHZOFnaPkp7wstS+DmT9lYCPPypJf7q+6O2yN6P8
 hJCx7KDLPZYqf9sOdTlx/dlqGhHr8MvoB/4PwJ1cugxHeyJVlknxmlnB5SPOQp0/PfT2
 0w5SmL+JDc57SKpX1DiN26e8CJUhG0RYo7mfo=
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDI6MjI6MThQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiAgIEhpLAo+IAo+ID4gSW1vIGdldCBtYXliZSBhbm90aGVyIHR0bStnZW0gc3Rha2Vo
b2xkZXIgdG8gcmV2aWV3IHRoaXMgKFRob21hcyBmb3IgdnJhbQo+ID4gaGVscGVycyBvciBCZW4g
Zm9yIG5vdXZlYXUpIGFuZCB0aGVuIHRoaXMgY2FuIGxhbmQuIEkgdGhpbmsgVGhvbWFzCj4gPiBI
ZWxsc3Ryb20gdHVuZWQgZG93biBoaXMgY2F0ZWdvcmljYWwgIm5hayIgdG8gIndlJ2xsIHNlZSB3
aGVyZSB0aGlzIGdvZXMsCj4gPiBJIG1pZ2h0IG5lZWQgdG8ganVtcCBpbiBhbmQgaGVscCBjb3Vy
c2UtY29ycmVjdCIuCj4gCj4gWWVwLCBzZWVtcyBoZSBhbHNvIGlzIG9uIHN1bW1lciB2YWNhdGlv
biBub3cgLi4uCj4gCj4gPiBidHcgSSBhbHNvIHJlc3VibWl0dGVkIG15IHByaW1lIHJlc3Zfb2Jq
IGNsZWFudXAgc2VyaWVzOgo+ID4gCj4gPiBodHRwczovL3BhdGNod29yay5mcmVlZGVza3RvcC5v
cmcvc2VyaWVzLzYyNzM1Lwo+IAo+IFdoYXQgaXMgdGhlIG1lcmdlIHBsYW4gZm9yIHRoaXM/ICBM
b29rcyBsaWtlIHRoaXMgaXMgcHJldHR5IG11Y2ggcmVhZHkKPiB0byBnby4KCk5lZWRzIGFuIHIt
YiBmcm9tIGFtZCBhbmQgbWF5YmUgQmVuLCB0aGVuIEknbGwgbWVyZ2UgdGhhdCBJIHRoaW5rLgoK
PiA+IEkgdGhpbmsgdGhlIG9ubHkgY29uZmxpY3RzIHdpdGggeW91ciBzZXJpZXMgaGVyZSBpcyB0
aGF0IHRoZSBzZXR0aW5nIG9mCj4gPiBnZW1fYm8ucmVzdiB0aGF0IEkgYWRkIGluIHJhZGVvbi9h
bWRncHUvbm91dmVhdSBjYW4gYmUgcmVtb3ZlZCBhZ2FpbiB3aGVuCj4gPiB5b3VyIHN0dWZmIGxh
bmRzLgo+IAo+IFllcCwgZG9lc24ndCBsb29rIHRvbyBiYWQuICBJIGNhbiByZWJhc2Ugb24gdG9w
IG9mIHlvdXIgc2VyaWVzLCBJIHBsYW4KPiB0byBzZW5kIHYzIGFueXdheSwgSSBoYXZlIHNvbWUg
c21hbGxlciAoY29tbWVudCkgdXBkYXRlcyBwZW5kaW5nLgoKSXQncyBqdXN0IDMgbGluZXMgd2Ug
bmVlZCB0byByZW1vdmUgaW4gdGhlIGVuZCAodGhlIG9uZXMgdGhhdCBzZXQKZ2VtX2JvLnJlc3Yp
LCBhbmQgdGhvc2UgMyBsaW5lcyBhcmUgaGFybWxlc3MgSSB0aGluay4gSSB0aGluayB3ZSBjYW4g
anVzdAptZXJnZSB3aGVuZXZlciBhbmQgdGhlbiBkbyB0aGUgZm9sbG93IHVwIG9uY2UgYm90aCBz
ZXJpZXMgaGF2ZSBsYW5kZWQuCi1EYW5pZWwKLS0gCkRhbmllbCBWZXR0ZXIKU29mdHdhcmUgRW5n
aW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9nLmZmd2xsLmNoCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
