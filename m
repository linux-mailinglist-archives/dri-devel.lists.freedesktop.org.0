Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBCB28DA0C
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2019 19:15:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B046E790;
	Wed, 14 Aug 2019 17:15:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com
 [IPv6:2a00:1450:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58CC6E78F
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 17:15:22 +0000 (UTC)
Received: by mail-ed1-x541.google.com with SMTP id r12so7720544edo.5
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2019 10:15:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=7wVyQbmHMBgJiNe2IaAAmZahUUbtslcJYT2bZuqIBz8=;
 b=iOfGXgeiVqBD6ggU2GVwbrUoPb++yLVhjGuSQeQjcJ3pWkJsmctgN1AsWKhXymqMa5
 fbBWjdYEsFi2QMyLRxoubQYvyPemrh/kKW+xvqaslkkluXXJOLjhc9RxBA+m5ssVDuOo
 c8lph+e6OkZQN9qxz9UxDn4Mf2RaDByhzy6xn26yLNo6WZkfoVhFllSzAwv5BrEr5lua
 i5jZ71R2JyweIfgqJTVzilBF8ZPYIhrAEYAq0MCgfwdOa/Dhcae1vQmlErW6bF6rPcW9
 dxrA+J68iuSTlp8DvniHEMQxKYf65b2Dr+0CoHEP9QcPL8s7iymK5uSCntOYb0Nixg7F
 BmQQ==
X-Gm-Message-State: APjAAAXer4E349mLVkTIAUwoQtJYoCdJfzM1TMVObjs4XBTsXXlrv03W
 N5QH3+M+xJv1WtyalqBvXf3WWsH4Zg/lNA==
X-Google-Smtp-Source: APXvYqwDn5igPSo2uRjPxBHCYM/uBSXfwd5qTUDJX5qCMB5DD3sHFIS8PkGJpTtbjdBBTlfszPyTcg==
X-Received: by 2002:aa7:cf90:: with SMTP id z16mr760487edx.228.1565802921470; 
 Wed, 14 Aug 2019 10:15:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id g14sm29104ejh.45.2019.08.14.10.15.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 14 Aug 2019 10:15:20 -0700 (PDT)
Date: Wed, 14 Aug 2019 19:15:18 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Heinrich <heinrich.fink@daqri.com>
Subject: Re: [PATCH] drm: Add high-precision time to vblank trace event
Message-ID: <20190814171518.GL7444@phenom.ffwll.local>
References: <20190809153639.14193-1-heinrich.fink@daqri.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190809153639.14193-1-heinrich.fink@daqri.com>
X-Operating-System: Linux phenom 4.19.0-5-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=7wVyQbmHMBgJiNe2IaAAmZahUUbtslcJYT2bZuqIBz8=;
 b=R0Le6FxcJi/i6dqRrE+SmA4qwG/nSe0PJ1FWfI8pCtl8cOUpaqcJrxIVIOz1e71mO+
 IBUs5lgd5fmKLGLTUZbyRhc64RYzKAyowta7x9Gd6tPjnOJWaVvJYpjM9iN9nN3Sv7Xk
 PRJBZ8qdcPqiMMHY8KvZOlJFRie/S9M/Gmulc=
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
Cc: Keith Packard <keithp@keithp.com>, intel-gfx@lists.freedesktop.org,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMDksIDIwMTkgYXQgMDU6MzY6MzlQTSArMDIwMCwgSGVpbnJpY2ggd3JvdGU6
Cj4gU3RvcmUgdGhlIHRpbWVzdGFtcCBvZiB0aGUgY3VycmVudCB2YmxhbmsgaW4gdGhlIG5ldyBm
aWVsZCAndGltZScgb2YgdGhlCj4gdmJsYW5rIHRyYWNlIGV2ZW50LiBJZiB0aGUgdGltZXN0YW1w
IGlzIGNhbGN1bGF0ZWQgYnkgYSBkcml2ZXIgdGhhdAo+IHN1cHBvcnRzIGhpZ2gtcHJlY2lzaW9u
IHZibGFuayB0aW1pbmcsIHNldCB0aGUgZmllbGQgJ2hpZ2gtcHJlYycgdG8KPiAndHJ1ZScuCj4g
Cj4gVXNlciBzcGFjZSBjYW4gbm93IGFjY2VzcyBhY3R1YWwgaGFyZHdhcmUgdmJsYW5rIHRpbWVz
IHZpYSB0aGUgdHJhY2luZwo+IGluZnJhc3RydWN0dXJlLiBUcmFjaW5nIGFwcGxpY2F0aW9ucyAo
c3VjaCBhcyBHUFVWaXMsIHNlZSBbMF0gZm9yCj4gcmVsYXRlZCBkaXNjdXNzaW9uKSwgY2FuIHVz
ZSB0aGUgbmV3bHkgYWRkZWQgaW5mb3JtYXRpb24gdG8gY29uZHVjdCBhCj4gbW9yZSBhY2N1cmF0
ZSBhbmFseXNpcyBvZiBkaXNwbGF5IHRpbWluZy4KPiAKPiBbMF0gaHR0cHM6Ly9naXRodWIuY29t
L21pa2VzYXJ0L2dwdXZpcy9pc3N1ZXMvMzAKPiAKPiBTaWduZWQtb2ZmLWJ5OiBIZWlucmljaCA8
aGVpbnJpY2guZmlua0BkYXFyaS5jb20+CgpsZ3RtLCBhbmQgSSB0aGluayByYXRoZXIgdXNlZnVs
LgoKUmV2aWV3ZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+CgpJ
IHRoaW5rIHdlIHNob3VsZCBsZXQgdGhpcyBoYW5nIG91dCBvbiB0aGUgbS1sIGZvciAyIHdlZWtz
IG9yIHNvIGluIGNhc2UKb2YgY29tbWVudHMgYW5kIHdoYXQgbm90LiBQbGVhc2UgcGluZyBtZSBh
Z2FpbiAoc2luY2UgbW9zdCBsaWtlbHkgSSdsbApmb3JnZXQpLgoKQWxzbyBhZGRpbmcgS2VpdGgs
IGhlJ3MgYmVlbiBwbGF5aW5nIGFyb3VuZCBhIGxvdCBsYXRlbHkgd2l0aCB2YmxhbmsKdGltZXN0
YW1wcyBhbmQgc3R1ZmYsIG1pZ2h0IGJlIGludGVyZXN0ZWQgaW4gdGhpcyB0b28uCgpUaGFua3Ms
IERhbmllbAoKCgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vZHJtX3RyYWNlLmggIHwgMTQgKysr
KysrKysrKy0tLS0KPiAgZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYyB8ICAzICsrLQo+ICAy
IGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4gCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdHJhY2UuaCBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fdHJhY2UuaAo+IGluZGV4IGJhY2NjNjNkYjEwNi4uNDVmMjFkN2ZjZmExIDEwMDY0NAo+IC0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdHJhY2UuaAo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9k
cm1fdHJhY2UuaAo+IEBAIC0xMSwxNyArMTEsMjMgQEAKPiAgI2RlZmluZSBUUkFDRV9JTkNMVURF
X0ZJTEUgZHJtX3RyYWNlCj4gIAo+ICBUUkFDRV9FVkVOVChkcm1fdmJsYW5rX2V2ZW50LAo+IC0J
ICAgIFRQX1BST1RPKGludCBjcnRjLCB1bnNpZ25lZCBpbnQgc2VxKSwKPiAtCSAgICBUUF9BUkdT
KGNydGMsIHNlcSksCj4gKwkgICAgVFBfUFJPVE8oaW50IGNydGMsIHVuc2lnbmVkIGludCBzZXEs
IGt0aW1lX3QgdGltZSwgYm9vbCBoaWdoX3ByZWMpLAo+ICsJICAgIFRQX0FSR1MoY3J0Yywgc2Vx
LCB0aW1lLCBoaWdoX3ByZWMpLAo+ICAJICAgIFRQX1NUUlVDVF9fZW50cnkoCj4gIAkJICAgIF9f
ZmllbGQoaW50LCBjcnRjKQo+ICAJCSAgICBfX2ZpZWxkKHVuc2lnbmVkIGludCwgc2VxKQo+ICsJ
CSAgICBfX2ZpZWxkKGt0aW1lX3QsIHRpbWUpCj4gKwkJICAgIF9fZmllbGQoYm9vbCwgaGlnaF9w
cmVjKQo+ICAJCSAgICApLAo+ICAJICAgIFRQX2Zhc3RfYXNzaWduKAo+ICAJCSAgICBfX2VudHJ5
LT5jcnRjID0gY3J0YzsKPiAgCQkgICAgX19lbnRyeS0+c2VxID0gc2VxOwo+IC0JCSAgICApLAo+
IC0JICAgIFRQX3ByaW50aygiY3J0Yz0lZCwgc2VxPSV1IiwgX19lbnRyeS0+Y3J0YywgX19lbnRy
eS0+c2VxKQo+ICsJCSAgICBfX2VudHJ5LT50aW1lID0gdGltZTsKPiArCQkgICAgX19lbnRyeS0+
aGlnaF9wcmVjID0gaGlnaF9wcmVjOwo+ICsJCQkpLAo+ICsJICAgIFRQX3ByaW50aygiY3J0Yz0l
ZCwgc2VxPSV1LCB0aW1lPSVsbGQsIGhpZ2gtcHJlYz0lcyIsCj4gKwkJCV9fZW50cnktPmNydGMs
IF9fZW50cnktPnNlcSwgX19lbnRyeS0+dGltZSwKPiArCQkJX19lbnRyeS0+aGlnaF9wcmVjID8g
InRydWUiIDogImZhbHNlIikKPiAgKTsKPiAgCj4gIFRSQUNFX0VWRU5UKGRybV92YmxhbmtfZXZl
bnRfcXVldWVkLAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jIGIv
ZHJpdmVycy9ncHUvZHJtL2RybV92YmxhbmsuYwo+IGluZGV4IGExYjY1ZDI2ZDc2MS4uZmIwODlh
ODhiNTE2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fdmJsYW5rLmMKPiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ZibGFuay5jCj4gQEAgLTE3MDYsNyArMTcwNiw4IEBAIHN0
YXRpYyB2b2lkIGRybV9oYW5kbGVfdmJsYW5rX2V2ZW50cyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LCB1bnNpZ25lZCBpbnQgcGlwZSkKPiAgCQlzZW5kX3ZibGFua19ldmVudChkZXYsIGUsIHNlcSwg
bm93KTsKPiAgCX0KPiAgCj4gLQl0cmFjZV9kcm1fdmJsYW5rX2V2ZW50KHBpcGUsIHNlcSk7Cj4g
Kwl0cmFjZV9kcm1fdmJsYW5rX2V2ZW50KHBpcGUsIHNlcSwgbm93LAo+ICsJCQlkZXYtPmRyaXZl
ci0+Z2V0X3ZibGFua190aW1lc3RhbXAgIT0gTlVMTCk7Cj4gIH0KPiAgCj4gIC8qKgo+IC0tIAo+
IDIuMjMuMC5yYzEKPiAKPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwo+IGRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKPiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWwKCi0tIApEYW5pZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBD
b3Jwb3JhdGlvbgpodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
