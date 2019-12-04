Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DAE2112C55
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2019 14:10:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FAB36E897;
	Wed,  4 Dec 2019 13:10:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A32D6E897
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2019 13:10:19 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id y23so4828819wma.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2019 05:10:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=ya3ULspfRCxqb9BJ+lx6dOJ4biNd6N6uQMSWdH/X0D0=;
 b=Z+zxHWEwmF5j2u/hcHVtLTGC3wnHfp98IUeoAVics7fYAR1jpbWI3VNlowEtNI1qO9
 RYyRG46yPqN0d8Rt9G4dHaSJaihx+fLF22y1xpiLZsMbWDXbd+yCEKbExO10X/58QP0a
 3OWIHf4FVtmKhFwH71XBZKYt0fhBVVS0AA+rUYhxx1QQU/bnji95xfFimXUuKycI39bd
 XTygkY2oagXRt+uLFJDLt6ldc3txEdV2iAALFFCMfueJhpweHyVr5LbmwyrflFV8LJrs
 rWUsN5HwS8HOaLWKSjrBGzOJFcCtf1XSDJ8gpqkCGNnNRh44TEhX2YRLJFI11yiJZZzy
 Qitw==
X-Gm-Message-State: APjAAAXK4Zmr6da7PcgX8QV/ilReZenBAIIPFuX/L8tC739RA7G5iJn9
 uD2h/FVDx7OErygzKawqsqutcw==
X-Google-Smtp-Source: APXvYqyQBy6592ScOME/ngkja2wqo9+13JFobmHRZmXuTp4Zb4qokOGf8zh8oomBaXZ//Qm01GI/hA==
X-Received: by 2002:a7b:cd82:: with SMTP id y2mr37626595wmj.58.1575465018010; 
 Wed, 04 Dec 2019 05:10:18 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id e16sm8132348wrj.80.2019.12.04.05.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Dec 2019 05:10:17 -0800 (PST)
Date: Wed, 4 Dec 2019 14:10:15 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Mihail Atanassov <Mihail.Atanassov@arm.com>
Subject: Re: [PATCH v2 01/28] drm: Introduce drm_bridge_init()
Message-ID: <20191204131015.GM624164@phenom.ffwll.local>
Mail-Followup-To: Mihail Atanassov <Mihail.Atanassov@arm.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20191204114732.28514-1-mihail.atanassov@arm.com>
 <20191204114732.28514-2-mihail.atanassov@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191204114732.28514-2-mihail.atanassov@arm.com>
X-Operating-System: Linux phenom 5.3.0-2-amd64 
User-Agent: Mutt/1.12.2 (2019-09-21)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ya3ULspfRCxqb9BJ+lx6dOJ4biNd6N6uQMSWdH/X0D0=;
 b=TLtiOByYiqqBKccq8pcm8/MxTUNlQqnIG0q25Qu4YEAvv/Q076tchnUAy4Oie3yuKF
 RgCMK4EKG+mz6y4jzNr+gdtAJk2ukGoyKei/9Tur8JBncaB/OyuUfWSkMrlLDM+gXx4H
 mOIPRcpVzdh/SJnkZ9UHQ4OlPtJdDtzoI1vnA=
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
Cc: David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 nd <nd@arm.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBEZWMgMDQsIDIwMTkgYXQgMTE6NDg6MDJBTSArMDAwMCwgTWloYWlsIEF0YW5hc3Nv
diB3cm90ZToKPiBBIHNpbXBsZSBjb252ZW5pZW5jZSBmdW5jdGlvbiB0byBpbml0aWFsaXplIHRo
ZSBzdHJ1Y3QgZHJtX2JyaWRnZS4gVGhlCj4gZ29hbCBpcyB0byBzdGFuZGFyZGl6ZSBpbml0aWFs
aXphdGlvbiBmb3IgYW55IGJyaWRnZSByZWdpc3RlcmVkIHdpdGgKPiBkcm1fYnJpZGdlX2FkZCgp
IHNvIHRoYXQgd2UgY2FuIGxhdGVyIGFkZCBkZXZpY2UgbGlua3MgZm9yIGNvbnN1bWVycyBvZgo+
IHRob3NlIGJyaWRnZXMuCj4gCj4gdjI6Cj4gIC0gcy9XQVJOX09OKCFmdW5jcykvV0FSTl9PTigh
ZnVuY3MgfHwgIWRldikvIGFzIHN1Z2dlc3RlZCBieSBEYW5pZWwKPiAgLSBleHBhbmQgb24gc29t
ZSBrZXJuZWxkb2MgY29tbWVudHMgYXMgc3VnZ2VzdGVkIGJ5IERhbmllbAo+ICAtIHVwZGF0ZSBj
b21taXQgbWVzc2FnZSBhcyBzdWdnZXN0ZWQgYnkgRGFuaWVsCj4gCj4gU2lnbmVkLW9mZi1ieTog
TWloYWlsIEF0YW5hc3NvdiA8bWloYWlsLmF0YW5hc3NvdkBhcm0uY29tPgoKUmV2aWV3ZWQtYnk6
IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+Cgo+IC0tLQo+ICBkcml2ZXJz
L2dwdS9kcm0vZHJtX2JyaWRnZS5jIHwgMzQgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KysrLQo+ICBpbmNsdWRlL2RybS9kcm1fYnJpZGdlLmggICAgIHwgMTUgKysrKysrKysrKysrKyst
Cj4gIDIgZmlsZXMgY2hhbmdlZCwgNDcgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9icmlkZ2UuYyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fYnJpZGdlLmMKPiBpbmRleCBjYmE1MzdjOTllNDMuLjUwZTFjMWI0NmUyMCAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2JyaWRnZS5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL2RybV9icmlkZ2UuYwo+IEBAIC02NCw3ICs2NCwxMCBAQCBzdGF0aWMgREVGSU5FX01V
VEVYKGJyaWRnZV9sb2NrKTsKPiAgc3RhdGljIExJU1RfSEVBRChicmlkZ2VfbGlzdCk7Cj4gIAo+
ICAvKioKPiAtICogZHJtX2JyaWRnZV9hZGQgLSBhZGQgdGhlIGdpdmVuIGJyaWRnZSB0byB0aGUg
Z2xvYmFsIGJyaWRnZSBsaXN0Cj4gKyAqIGRybV9icmlkZ2VfYWRkIC0gYWRkIHRoZSBnaXZlbiBi
cmlkZ2UgdG8gdGhlIGdsb2JhbCBicmlkZ2UgbGlzdC4KPiArICoKPiArICogRHJpdmVycyBzaG91
bGQgY2FsbCBkcm1fYnJpZGdlX2luaXQoKSBwcmlvciBhZGRpbmcgaXQgdG8gdGhlIGxpc3QuCj4g
KyAqIERyaXZlcnMgc2hvdWxkIGNhbGwgZHJtX2JyaWRnZV9yZW1vdmUoKSB0byBjbGVhbiB1cCB0
aGUgYnJpZGdlIGxpc3QuCj4gICAqCj4gICAqIEBicmlkZ2U6IGJyaWRnZSBjb250cm9sIHN0cnVj
dHVyZQo+ICAgKi8KPiBAQCAtODksNiArOTIsMzUgQEAgdm9pZCBkcm1fYnJpZGdlX3JlbW92ZShz
dHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKQo+ICB9Cj4gIEVYUE9SVF9TWU1CT0woZHJtX2JyaWRn
ZV9yZW1vdmUpOwo+ICAKPiArLyoqCj4gKyAqIGRybV9icmlkZ2VfaW5pdCAtIGluaXRpYWxpc2Ug
YSBkcm1fYnJpZGdlIHN0cnVjdHVyZQo+ICsgKgo+ICsgKiBAYnJpZGdlOiBicmlkZ2UgY29udHJv
bCBzdHJ1Y3R1cmUKPiArICogQGZ1bmNzOiBjb250cm9sIGZ1bmN0aW9ucwo+ICsgKiBAZGV2OiBk
ZXZpY2UgYXNzb2NpYXRlZCB3aXRoIHRoaXMgZHJtX2JyaWRnZQo+ICsgKiBAdGltaW5nczogdGlt
aW5nIHNwZWNpZmljYXRpb24gZm9yIHRoZSBicmlkZ2U7IG9wdGlvbmFsIChtYXkgYmUgTlVMTCkK
PiArICogQGRyaXZlcl9wcml2YXRlOiBwb2ludGVyIHRvIHRoZSBicmlkZ2UgZHJpdmVyIGludGVy
bmFsIGNvbnRleHQgKG1heSBiZSBOVUxMKQo+ICsgKi8KPiArdm9pZCBkcm1fYnJpZGdlX2luaXQo
c3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwgc3RydWN0IGRldmljZSAqZGV2LAo+ICsJCSAgICAg
Y29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgKmZ1bmNzLAo+ICsJCSAgICAgY29uc3Qgc3Ry
dWN0IGRybV9icmlkZ2VfdGltaW5ncyAqdGltaW5ncywKPiArCQkgICAgIHZvaWQgKmRyaXZlcl9w
cml2YXRlKQo+ICt7Cj4gKwlXQVJOX09OKCFmdW5jcyB8fCAhZGV2KTsKPiArCj4gKwlicmlkZ2Ut
PmRldiA9IE5VTEw7Cj4gKwlicmlkZ2UtPmVuY29kZXIgPSBOVUxMOwo+ICsJYnJpZGdlLT5uZXh0
ID0gTlVMTDsKPiArCj4gKyNpZmRlZiBDT05GSUdfT0YKPiArCWJyaWRnZS0+b2Zfbm9kZSA9IGRl
di0+b2Zfbm9kZTsKPiArI2VuZGlmCj4gKwlicmlkZ2UtPnRpbWluZ3MgPSB0aW1pbmdzOwo+ICsJ
YnJpZGdlLT5mdW5jcyA9IGZ1bmNzOwo+ICsJYnJpZGdlLT5kcml2ZXJfcHJpdmF0ZSA9IGRyaXZl
cl9wcml2YXRlOwo+ICt9Cj4gK0VYUE9SVF9TWU1CT0woZHJtX2JyaWRnZV9pbml0KTsKPiArCj4g
IC8qKgo+ICAgKiBkcm1fYnJpZGdlX2F0dGFjaCAtIGF0dGFjaCB0aGUgYnJpZGdlIHRvIGFuIGVu
Y29kZXIncyBjaGFpbgo+ICAgKgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdl
LmggYi9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiBpbmRleCBjMGEyMjg2YTgxZTkuLjk0OWU0
ZjQwMWE1MyAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiArKysgYi9p
bmNsdWRlL2RybS9kcm1fYnJpZGdlLmgKPiBAQCAtMzczLDcgKzM3MywxNiBAQCBzdHJ1Y3QgZHJt
X2JyaWRnZV90aW1pbmdzIHsKPiAgfTsKPiAgCj4gIC8qKgo+IC0gKiBzdHJ1Y3QgZHJtX2JyaWRn
ZSAtIGNlbnRyYWwgRFJNIGJyaWRnZSBjb250cm9sIHN0cnVjdHVyZQo+ICsgKiBzdHJ1Y3QgZHJt
X2JyaWRnZSAtIGNlbnRyYWwgRFJNIGJyaWRnZSBjb250cm9sIHN0cnVjdHVyZS4KPiArICoKPiAr
ICogQnJpZGdlIGRyaXZlcnMgc2hvdWxkIGNhbGwgZHJtX2JyaWRnZV9pbml0KCkgdG8gaW5pdGlh
bGl6ZSBhIGJyaWRnZQo+ICsgKiBkcml2ZXIsIGFuZCB0aGVuIHJlZ2lzdGVyIGl0IHdpdGggZHJt
X2JyaWRnZV9hZGQoKS4KPiArICoKPiArICogVXNlcnMgb2YgYnJpZGdlcyBsaW5rIGEgYnJpZGdl
IGRyaXZlciBpbnRvIHRoZWlyIG92ZXJhbGwgZGlzcGxheSBvdXRwdXQKPiArICogcGlwZWxpbmUg
YnkgY2FsbGluZyBkcm1fYnJpZGdlX2F0dGFjaCgpLgo+ICsgKgo+ICsgKiBNb2R1bGFyIGRyaXZl
cnMgaW4gT0Ygc3lzdGVtcyBjYW4gcXVlcnkgdGhlIGxpc3Qgb2YgcmVnaXN0ZXJlZCBicmlkZ2Vz
Cj4gKyAqIHdpdGggb2ZfZHJtX2ZpbmRfYnJpZGdlKCkuCj4gICAqLwo+ICBzdHJ1Y3QgZHJtX2Jy
aWRnZSB7Cj4gIAkvKiogQGRldjogRFJNIGRldmljZSB0aGlzIGJyaWRnZSBiZWxvbmdzIHRvICov
Cj4gQEAgLTQwMiw2ICs0MTEsMTAgQEAgc3RydWN0IGRybV9icmlkZ2Ugewo+ICAKPiAgdm9pZCBk
cm1fYnJpZGdlX2FkZChzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKTsKPiAgdm9pZCBkcm1fYnJp
ZGdlX3JlbW92ZShzdHJ1Y3QgZHJtX2JyaWRnZSAqYnJpZGdlKTsKPiArdm9pZCBkcm1fYnJpZGdl
X2luaXQoc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwgc3RydWN0IGRldmljZSAqZGV2LAo+ICsJ
CSAgICAgY29uc3Qgc3RydWN0IGRybV9icmlkZ2VfZnVuY3MgKmZ1bmNzLAo+ICsJCSAgICAgY29u
c3Qgc3RydWN0IGRybV9icmlkZ2VfdGltaW5ncyAqdGltaW5ncywKPiArCQkgICAgIHZvaWQgKmRy
aXZlcl9wcml2YXRlKTsKPiAgc3RydWN0IGRybV9icmlkZ2UgKm9mX2RybV9maW5kX2JyaWRnZShz
dHJ1Y3QgZGV2aWNlX25vZGUgKm5wKTsKPiAgaW50IGRybV9icmlkZ2VfYXR0YWNoKHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2Rlciwgc3RydWN0IGRybV9icmlkZ2UgKmJyaWRnZSwKPiAgCQkgICAg
ICBzdHJ1Y3QgZHJtX2JyaWRnZSAqcHJldmlvdXMpOwo+IC0tIAo+IDIuMjMuMAo+IAoKLS0gCkRh
bmllbCBWZXR0ZXIKU29mdHdhcmUgRW5naW5lZXIsIEludGVsIENvcnBvcmF0aW9uCmh0dHA6Ly9i
bG9nLmZmd2xsLmNoCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
