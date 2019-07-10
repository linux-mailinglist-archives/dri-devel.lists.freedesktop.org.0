Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2953564AD8
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 18:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721766E10F;
	Wed, 10 Jul 2019 16:39:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C32E6E10F
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 16:39:10 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w20so2815025edd.2
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 09:39:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=rlLfC63UIGnR7CzSg0i2HcatUSkKiFrrWG5f+oOFkIc=;
 b=EWvpXWl4tUlHnV//x1Gb5DOZsveRQwOtZdl+sGSrnLLXAEOUt87N5KUJm1YRThxfUo
 xtIv7J8s8oiwKKKCwhvnRTIY1BBtgeUA0YzpDpy8iOfN0yuekH+2WSLOvvZJbEPyfEIp
 aEOTZdzmEtiNL5K4Hlpt1vRLY4B/lXx14aurradLqtreuWna4ArfsjFTIQjHiV26d0YP
 lJ323xK/YkQCUe1cHqSDzG64aiP3uwgDlvo9dQuhVRPUszj9D014Gybb1zX+AOtlKuh+
 TOdXGFJ0iGuvFde3lBKPJapftsczmWxdnSgax2Fv060406MqYNflT6exaGIZZRHgQYQ5
 cc4Q==
X-Gm-Message-State: APjAAAUgHxkMNFNTylj57zu4mw8HQ83etXW5qfAn3P5mfiTC879zVqF8
 pQ3L8RI6XVfh876ZmZmQsdYKnQ==
X-Google-Smtp-Source: APXvYqxgif9mEQwbpanZhXyq12GDBwkYsFo+G3E2khBED/Gn/prNt8SbYtINxkLUk03TDm+c7lkDVg==
X-Received: by 2002:a17:906:4ed8:: with SMTP id
 i24mr26934782ejv.118.1562776749121; 
 Wed, 10 Jul 2019 09:39:09 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g16sm890951edc.76.2019.07.10.09.39.07
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 09:39:08 -0700 (PDT)
Date: Wed, 10 Jul 2019 18:39:06 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: "Vasilev, Oleg" <oleg.vasilev@intel.com>
Subject: Re: [PATCH] drm/vkms: prime import support
Message-ID: <20190710163906.GY15868@phenom.ffwll.local>
References: <20190704085410.12749-1-oleg.vasilev@intel.com>
 <20190710153146.GT15868@phenom.ffwll.local>
 <574b6b7e4c734e18debbd5b4a4d278197c850727.camel@intel.com>
 <1224e87e61bce015c8c72a9abec55ce25ef5d240.camel@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1224e87e61bce015c8c72a9abec55ce25ef5d240.camel@intel.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=rlLfC63UIGnR7CzSg0i2HcatUSkKiFrrWG5f+oOFkIc=;
 b=Hfl8Adfomvs+HLsgX1hNd8SqY3yalaG8jEOf2E9uEBZ1gwPlUFrkZK9VM9iqfReTs1
 8gHAH8zQGZk2Iep4GqPJ7cDY24NTPBP9xFIyXtSxHLFwJwURld95DGGo7BKOLVFWL3zh
 p0bpvqdCngdBPmBvnG9hfKJPLZjUJoKcCldiE=
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
Cc: "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMTAsIDIwMTkgYXQgMDM6Mzg6MTNQTSArMDAwMCwgVmFzaWxldiwgT2xlZyB3
cm90ZToKPiBPbiBXZWQsIDIwMTktMDctMTAgYXQgMTg6MzUgKzAzMDAsIE9sZWcgVmFzaWxldiB3
cm90ZToKPiA+IE9uIFdlZCwgMjAxOS0wNy0xMCBhdCAxNzozMSArMDIwMCwgRGFuaWVsIFZldHRl
ciB3cm90ZToKPiA+ID4gT24gVGh1LCBKdWwgMDQsIDIwMTkgYXQgMTE6NTQ6MTBBTSArMDMwMCwg
T2xlZyBWYXNpbGV2IHdyb3RlOgo+ID4gPiA+IEJyaW5nIGRtYWJ1ZiBzaGFyaW5nIHRocm91Z2gg
aW1wbGVtZW50aW5nIHByaW1lX2ltcG9ydF9zZ190YWJsZQo+ID4gPiA+IGNhbGxiYWNrLgo+ID4g
PiA+IFRoaXMgd2lsbCBoZWxwIHRvIHZhbGlkYXRlIHVzZXJzcGFjZSBjb25mb3JtYW5jZSBpbiBw
cmltZQo+ID4gPiA+IGNvbmZpZ3VyYXRpb25zCj4gPiA+ID4gd2l0aG91dCB1c2luZyBhbnkgYWN0
dWFsIGhhcmR3YXJlIChlLmcuIGluIHRoZSBjbG91ZCkuCj4gPiA+ID4gCj4gPiA+ID4gQ2M6IFJv
ZHJpZ28gU2lxdWVpcmEgPHJvZHJpZ29zaXF1ZWlyYW1lbG9AZ21haWwuY29tPgo+ID4gPiA+IENj
OiBIYW5lZW4gTW9oYW1tZWQgPGhhbW9oYW1tZWQuc2FAZ21haWwuY29tPgo+ID4gPiA+IENjOiBE
YW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwuY2g+Cj4gPiA+ID4gU2lnbmVkLW9mZi1ieTogT2xl
ZyBWYXNpbGV2IDxvbGVnLnZhc2lsZXZAaW50ZWwuY29tPgo+ID4gPiAKPiA+ID4gQnR3IHdoaWNo
IGlndCB0ZXN0Y2FzZXMgZG9lcyB0aGlzIGVuYWJsZT8gQXJlIHRoZSBpZ3QgcGF0Y2hlcwo+ID4g
PiBhbHJlYWR5Cj4gPiA+IG1lcmdlZCAoSSB0aGluayBhcy1pcyB0aGUgaWd0IHByaW1lIHRlc3Rz
IHdvbid0IHJ1biBvbiB2a21zKS4KPiA+ID4gCj4gPiA+IEltbyBmb3IgdmttcyB3ZSByZWFsbHkg
d2FudCB0byBtYWtlIHN1cmUgdGhlcmUncyB0ZXN0cyBmb3IKPiA+ID4gZXZlcnl0aGluZywKPiA+
ID4gb3RoZXJ3aXNlIGEgZmFrZSBkcml2ZXIgZm9yIHRlc3RpbmcvdmFsaWRhdGlvbiBpcyBraW5k
YSBwb2ludGxlc3MKPiA+ID4gLi4uCj4gPiA+IC1EYW5pZWwKPiA+IAo+ID4gSSd2ZSBzdWJtaXR0
ZWQgYSBwYXRjaCB0byBJR1QsIGJ1dCBpdCBpcyBub3QgbWVyZ2VkIHlldDoKPiA+IGh0dHBzOi8v
cGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9zZXJpZXMvNjMyMTMvCj4gCj4gT29wcywgdGhpcyBv
bmU6IAo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC8zMTU2NTkvP3Nl
cmllcz02MzIxNiZyZXY9MQoKQWgsIHJlcGxpZWQgdGhlcmUuIExldCdzIHBvbGlzaCB0aGUgdGVz
dGNhc2UgZmlyc3QsIHRoZW4gbGFuZCB0aGUga2VybmVsCnNpZGUuCi1EYW5pZWwKLS0gCkRhbmll
bCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9ibG9n
LmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
