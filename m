Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 830723618E
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jun 2019 18:45:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 507F889D77;
	Wed,  5 Jun 2019 16:44:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A0889D77
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 16:44:58 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id w13so6712584eds.4
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Jun 2019 09:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=/ueJp6/EMM6awkVjvxr/UTSiSEJOsN0YiE/KsZCgf98=;
 b=ehLvhQgJH2QPNOwupm3Izf6YYtm6SAFJcoP+Jet7b1YDr35NyoIfVpCwQ+wwd6qEbb
 o+sR0bO2sb6iQIjzzjcHtTW+eCDlVsTSqYJ3B0GvMvuwZuzKrmpX2/3EwJlVe5gsVIfl
 E3gSPBV89oaR8lsroksrP9Ynr7xbYW9YX8ZigoLaAi3W9mNLxJsuhzgQAqJiLOCH/1NM
 emeislfCmdKeEjyShc0ETD+J19E1vKGE9CjjfImElAS2BFdNgwZpt8zCfYG75oO+bX8A
 h5jzO73Y3bsnRFwwHMhL6dot50HQFUWIl3xUkV8MB3er5UpUyQUENpyp98+rqZqHWzYH
 ez6w==
X-Gm-Message-State: APjAAAWHbx3YyBZexw7xf0FBTYx9ls2/WGmxJl/CcqGm2FtLKLEuZ21H
 TerPCAlrY4yOsE2S8ziqKtdpFQ==
X-Google-Smtp-Source: APXvYqw5n6B257BTDyBHGwVIdknsJe8RI8Yj5gCnrvIOAIdKczsXsBz5/ogzD+pGfAArUe2knL5oyQ==
X-Received: by 2002:a17:906:1496:: with SMTP id
 x22mr13988105ejc.191.1559753096758; 
 Wed, 05 Jun 2019 09:44:56 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id z3sm4097717edh.71.2019.06.05.09.44.55
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 05 Jun 2019 09:44:55 -0700 (PDT)
Date: Wed, 5 Jun 2019 18:44:53 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH v1 2/2] drm/savage: drop use of drmP.h
Message-ID: <20190605164453.GW21222@phenom.ffwll.local>
References: <20190605140313.13629-1-sam@ravnborg.org>
 <20190605140313.13629-3-sam@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190605140313.13629-3-sam@ravnborg.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=/ueJp6/EMM6awkVjvxr/UTSiSEJOsN0YiE/KsZCgf98=;
 b=ktHKJSn/ftxc9WD+Ahw5XG7bTSKQAZSBdxp4ZiuvqZoQe10Pk80KrSpMYelp8SE4hf
 LJsaVK9RZpasQmsM621EurhsNSO8a6lMP9tyOPahXIQ/OCTk6mNLbkjtXYESdrADEAJB
 Nt+44CDxB9kxElJWjVV0YCDKIzMMni1AvoDis=
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
Cc: David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMDUsIDIwMTkgYXQgMDQ6MDM6MTRQTSArMDIwMCwgU2FtIFJhdm5ib3JnIHdy
b3RlOgo+IERyb3AgdXNlIG9mIHRoZSBkZXByZWNhdGVkIGRybVAuaCBoZWFkZXIgZmlsZS4KPiBS
ZXBsYWNlIGl0IHdpdGggdGhlIG5lY2Vzc2FyeSBpbmNsdWRlcyBvZiBvdGhlciBoZWFkZXJzLgo+
IAo+IFNpZ25lZC1vZmYtYnk6IFNhbSBSYXZuYm9yZyA8c2FtQHJhdm5ib3JnLm9yZz4KPiBDYzog
RGF2aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5p
ZWxAZmZ3bGwuY2g+CgpBc3N1bWluZyBpdCBhbGwgY29tcGlsZXMgc3RpbGwsIG9uIHRoZSBzZXJp
ZXM6CgpSZXZpZXdlZC1ieTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4K
ClNpbmNlIHNpcy9zYXZhZ2UgYXJlIHVubWFpbnRhaW5lZCBJIHRoaW5rIHlvdSBjYW4ganVzdCBn
byBhaGVhZCBhbmQgcHVzaAp0aG9zZS4KLURhbmllbAoKPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJt
L3NhdmFnZS9zYXZhZ2VfYmNpLmMgICB8IDggKysrKysrKy0KPiAgZHJpdmVycy9ncHUvZHJtL3Nh
dmFnZS9zYXZhZ2VfZHJ2LmMgICB8IDkgKysrKystLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9zYXZh
Z2Uvc2F2YWdlX2Rydi5oICAgfCA0ICsrKysKPiAgZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZh
Z2Vfc3RhdGUuYyB8IDkgKysrKysrKystCj4gIDQgZmlsZXMgY2hhbmdlZCwgMjQgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Nh
dmFnZS9zYXZhZ2VfYmNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vc2F2YWdlL3NhdmFnZV9iY2kuYwo+
IGluZGV4IGFhMDBjZjExNzQzMy4uNjg4OWQ2NTM0ZWJhIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2JjaS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3NhdmFn
ZS9zYXZhZ2VfYmNpLmMKPiBAQCAtMjQsOSArMjQsMTUgQEAKPiAgICovCj4gIAo+ICAjaW5jbHVk
ZSA8bGludXgvZGVsYXkuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3BjaS5oPgo+ICsjaW5jbHVkZSA8
bGludXgvc2xhYi5oPgo+ICsjaW5jbHVkZSA8bGludXgvdWFjY2Vzcy5oPgo+ICAKPiAtI2luY2x1
ZGUgPGRybS9kcm1QLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2RldmljZS5oPgo+ICsjaW5jbHVk
ZSA8ZHJtL2RybV9maWxlLmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+Cj4gICNpbmNs
dWRlIDxkcm0vc2F2YWdlX2RybS5oPgo+ICsKPiAgI2luY2x1ZGUgInNhdmFnZV9kcnYuaCIKPiAg
Cj4gIC8qIE5lZWQgYSBsb25nIHRpbWVvdXQgZm9yIHNoYWRvdyBzdGF0dXMgdXBkYXRlcyBjYW4g
dGFrZSBhIHdoaWxlCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdl
X2Rydi5jIGIvZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2VfZHJ2LmMKPiBpbmRleCAyYmRk
ZWI4YmY0NTcuLjI5NjZmY2ZkOTU0OCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vc2F2
YWdlL3NhdmFnZV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX2Ry
di5jCj4gQEAgLTI1LDEyICsyNSwxMyBAQAo+ICAKPiAgI2luY2x1ZGUgPGxpbnV4L21vZHVsZS5o
Pgo+ICAKPiAtI2luY2x1ZGUgPGRybS9kcm1QLmg+Cj4gLSNpbmNsdWRlIDxkcm0vc2F2YWdlX2Ry
bS5oPgo+IC0jaW5jbHVkZSAic2F2YWdlX2Rydi5oIgo+IC0KPiArI2luY2x1ZGUgPGRybS9kcm1f
ZHJ2Lmg+Cj4gKyNpbmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1f
cGNpLmg+Cj4gICNpbmNsdWRlIDxkcm0vZHJtX3BjaWlkcy5oPgo+ICAKPiArI2luY2x1ZGUgInNh
dmFnZV9kcnYuaCIKPiArCj4gIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldmljZV9pZCBwY2lpZGxpc3Rb
XSA9IHsKPiAgCXNhdmFnZV9QQ0lfSURTCj4gIH07Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9zYXZhZ2Uvc2F2YWdlX2Rydi5oIGIvZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2Vf
ZHJ2LmgKPiBpbmRleCAzOGFhYjYyNWYxMmUuLmIwMDgxYmI2NDc3NiAxMDA2NDQKPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vc2F2YWdlL3NhdmFnZV9kcnYuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9zYXZhZ2Uvc2F2YWdlX2Rydi5oCj4gQEAgLTI2LDcgKzI2LDExIEBACj4gICNpZm5kZWYgX19T
QVZBR0VfRFJWX0hfXwo+ICAjZGVmaW5lIF9fU0FWQUdFX0RSVl9IX18KPiAgCj4gKyNpbmNsdWRl
IDxsaW51eC9pby5oPgo+ICsKPiArI2luY2x1ZGUgPGRybS9kcm1faW9jdGwuaD4KPiAgI2luY2x1
ZGUgPGRybS9kcm1fbGVnYWN5Lmg+Cj4gKyNpbmNsdWRlIDxkcm0vc2F2YWdlX2RybS5oPgo+ICAK
PiAgI2RlZmluZSBEUklWRVJfQVVUSE9SCSJGZWxpeCBLdWVobGluZyIKPiAgCj4gZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX3N0YXRlLmMgYi9kcml2ZXJzL2dwdS9k
cm0vc2F2YWdlL3NhdmFnZV9zdGF0ZS5jCj4gaW5kZXggZWJiOGI3ZDMyYjMzLi5hMmFjMjVjMTFj
OTAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3NhdmFnZS9zYXZhZ2Vfc3RhdGUuYwo+
ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9zYXZhZ2Uvc2F2YWdlX3N0YXRlLmMKPiBAQCAtMjIsOCAr
MjIsMTUgQEAKPiAgICogQ09OVFJBQ1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00s
IE9VVCBPRiBPUiBJTiBDT05ORUNUSU9OCj4gICAqIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBV
U0UgT1IgT1RIRVIgREVBTElOR1MgSU4gVEhFIFNPRlRXQVJFLgo+ICAgKi8KPiAtI2luY2x1ZGUg
PGRybS9kcm1QLmg+Cj4gKwo+ICsjaW5jbHVkZSA8bGludXgvc2xhYi5oPgo+ICsjaW5jbHVkZSA8
bGludXgvdWFjY2Vzcy5oPgo+ICsKPiArI2luY2x1ZGUgPGRybS9kcm1fZGV2aWNlLmg+Cj4gKyNp
bmNsdWRlIDxkcm0vZHJtX2ZpbGUuaD4KPiArI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KPiAg
I2luY2x1ZGUgPGRybS9zYXZhZ2VfZHJtLmg+Cj4gKwo+ICAjaW5jbHVkZSAic2F2YWdlX2Rydi5o
Igo+ICAKPiAgdm9pZCBzYXZhZ2VfZW1pdF9jbGlwX3JlY3RfczNkKGRybV9zYXZhZ2VfcHJpdmF0
ZV90ICogZGV2X3ByaXYsCj4gLS0gCj4gMi4yMC4xCj4gCgotLSAKRGFuaWVsIFZldHRlcgpTb2Z0
d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KaHR0cDovL2Jsb2cuZmZ3bGwuY2gKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
