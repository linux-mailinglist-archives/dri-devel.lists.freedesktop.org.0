Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE623E0006
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 10:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBE5F6E487;
	Tue, 22 Oct 2019 08:53:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31AC56E487
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 08:53:16 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id l10so16639029wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2019 01:53:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=agY8WP3yE/uQO2gmFFN3fwZkYl2zF3wjEGLcaMSXZlQ=;
 b=NoZjo24YBeET1siQjtimmTDwAbe7M3jCpl0VhGslyQiK9VD//dnBy5XsFtr90sbRDc
 T6OLwhgSw7napchNCLgtve2CTZrKT5Ojima56YQlk5qtZMzwc8+tLxEH0i3ZActzTdUO
 TLiPx3Wz6JIeN5J08N6wQguEuSbp4IWLU6ZIyYRLwDp9WLi4ag5zfBZQQsr/zUOve8Vm
 ALGlRO53mfOIHYujGjc30YPsmAV+/pDwzP0IF3nw2DqeYdfywpbqSu9M06+YkGyeArde
 L+DZDqO6xFtuihMyxDQSh0WTiQ3qgHEsLTNrx5CDMqaIYNYOytqkRSLPvhbLYy17ykUU
 lldw==
X-Gm-Message-State: APjAAAWuo6VZdOVkFLvmI+M3kSbgqX5uRwzy7ZysgIU3Vlc31EoNqjFW
 VEMaaNelgVUGz5j4hyAnMGaYBMLzNsk=
X-Google-Smtp-Source: APXvYqyxiYdQNpkfLhfWzE12V86FdpAXGS/f8px1YBcmTE533WIPwRi4xYTOrFxh+B4LMI0IvGVCEA==
X-Received: by 2002:adf:8123:: with SMTP id 32mr2524177wrm.300.1571734394764; 
 Tue, 22 Oct 2019 01:53:14 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id d202sm10951169wmd.47.2019.10.22.01.53.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Oct 2019 01:53:14 -0700 (PDT)
Date: Tue, 22 Oct 2019 10:53:12 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 0/5] drm/qxl: a collection of small tweaks.
Message-ID: <20191022085312.GY11828@phenom.ffwll.local>
References: <20191017132638.9693-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017132638.9693-1-kraxel@redhat.com>
X-Operating-System: Linux phenom 5.2.0-2-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=agY8WP3yE/uQO2gmFFN3fwZkYl2zF3wjEGLcaMSXZlQ=;
 b=SfjeH5HDxhaiBFQzqdlanOR0GQkbcaBtabDsXZH0fJ+0i9xV6YHcaGA0/BIOxtI2w5
 HNEHmAlHxEZKBMS1OWE4MlSURclATcvJYzX5L4KXyNEWOfI5RF9wl81F7igiGOoNEWvb
 oUsU3mhx5PanfQd71Q7uNFIyyOOz8Rpd8hXP4=
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTcsIDIwMTkgYXQgMDM6MjY6MzNQTSArMDIwMCwgR2VyZCBIb2ZmbWFubiB3
cm90ZToKPiBTd2l0Y2ggcXhsIGRyaXZlciB0byB0aGUgbmV3IG1tYXAgd29ya2Zsb3csCj4gc29t
ZSBjbGVhbnVwcywgcmVkdWNlIG1lbW9yeSBmcmFnbWVudGF0aW9uLgo+IAo+IFNlcmllcyBuZWVk
cyBsYXRlc3QgZHJtLW1pc2MtbmV4dCB0byBidWlsZC4KCk5pY2Ugc3R1ZmYuIE9uIHRoZSBzZXJp
ZXM6CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
Cj4gCj4gR2VyZCBIb2ZmbWFubiAoNSk6Cj4gICBkcm0vcXhsOiBkcm9wIHF4bF90dG1fZmF1bHQK
PiAgIGRybS9xeGw6IHN3aXRjaCBxeGwgdG8gJmRybV9nZW1fb2JqZWN0X2Z1bmNzLm1tYXAKPiAg
IGRybS9xeGw6IGRyb3AgdmVyaWZ5X2FjY2Vzcwo+ICAgZHJtL3F4bDogdXNlIERFRklORV9EUk1f
R0VNX0ZPUFMoKQo+ICAgZHJtL3F4bDogYWxsb2NhdGUgc21hbGwgb2JqZWN0cyB0b3AtZG93bgo+
IAo+ICBkcml2ZXJzL2dwdS9kcm0vcXhsL3F4bF9kcnYuaCAgICB8ICAxIC0KPiAgZHJpdmVycy9n
cHUvZHJtL3F4bC9xeGxfZHJ2LmMgICAgfCAxMCArLS0tLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9x
eGwvcXhsX29iamVjdC5jIHwgIDggKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL3F4bC9xeGxfdHRt
LmMgICAgfCA1MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+ICA0IGZpbGVzIGNo
YW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNjEgZGVsZXRpb25zKC0pCj4gCj4gLS0gCj4gMi4xOC4x
Cj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBk
cmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+
IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
CgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24K
aHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZHJpLWRldmVs
