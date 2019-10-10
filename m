Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E76FD2E82
	for <lists+dri-devel@lfdr.de>; Thu, 10 Oct 2019 18:23:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4560B6E312;
	Thu, 10 Oct 2019 16:23:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f196.google.com (mail-vk1-f196.google.com
 [209.85.221.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82F406E312
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 16:23:18 +0000 (UTC)
Received: by mail-vk1-f196.google.com with SMTP id w3so1491910vkm.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Oct 2019 09:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KBjP/c0OKbAYMhFk+/MWcTlhvk8Dj6HOEt+fBr53HAk=;
 b=uS8Ts5cn3z4zbVEiVGOUrQnQbowZPeHlkPPDV8lPV4sLPI+ZsY5NIGKogijiauHgRZ
 hxsHnfJknS9cqqu35F6TNz5JNdRHQf2QzbFvjyh54E1bM6nMwgxmNDgROiojO0l5sK/I
 KO4FtFU01sW7VDO091d69tvSO/tiZCXCFn3oowwwF4MWf8EB9VqnX0Je1pLfR821T+J5
 DuYglmOe+t9RuvazeDpvrEnXK+MM/ot9HErwSvmvsNurWmtH9ektuw0bH5PZOPTtbkP+
 rVXziqHdh5uFmkbOHaO4AC6VNmn2SVLS/e98sQktUAN2leWgka7PXcxRf7DM16u8cZJX
 DSwA==
X-Gm-Message-State: APjAAAXQws1Dg4TDECMXUvOAgxqbgdkmN5+tgKIEQMO6P5rSpagGJltE
 u1JtxMtGN4ZtfzxrZ5pNyaT8s2mD06sLK5TmfAk=
X-Google-Smtp-Source: APXvYqxR5nObCEPHTyxfZVEjMwGluSVjyDTAju7pr0IKOuLXRkT9sFsva0PDisUmx53NIWYO7d0j9h/xhWamFO8Of1Y=
X-Received: by 2002:a1f:3811:: with SMTP id f17mr5853576vka.56.1570724597472; 
 Thu, 10 Oct 2019 09:23:17 -0700 (PDT)
MIME-Version: 1.0
References: <20191008230038.24037-1-ezequiel@collabora.com>
 <20191008230038.24037-3-ezequiel@collabora.com>
 <20191009180136.GE85762@art_vandelay>
 <CAAEAJfDP0PsGAoRfGyDyWj7DxgP6nwwwA1_gwLQuVy-fRDa-UA@mail.gmail.com>
 <20191010160059.GJ85762@art_vandelay>
In-Reply-To: <20191010160059.GJ85762@art_vandelay>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 10 Oct 2019 12:23:05 -0400
Message-ID: <CAKb7UvhWWYcpmyMZgerdJiG=sZjQUBVkeEwev+PdYzBW6+xsbQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] drm/rockchip: Add optional support for CRTC gamma
 LUT
To: Sean Paul <sean@poorly.run>
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 devicetree <devicetree@vger.kernel.org>, Jacopo Mondi <jacopo@jmondi.org>,
 Rob Herring <robh+dt@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Sean Paul <seanpaul@chromium.org>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, kernel@collabora.com,
 Ezequiel Garcia <ezequiel@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVGh1LCBPY3QgMTAsIDIwMTkgYXQgMTI6MDEgUE0gU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5y
dW4+IHdyb3RlOgo+ID4gPiA+ICtzdGF0aWMgaW50IHZvcF9jcnRjX2F0b21pY19jaGVjayhzdHJ1
Y3QgZHJtX2NydGMgKmNydGMsCj4gPiA+ID4gKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
IHN0cnVjdCBkcm1fY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSkKPiA+ID4gPiArewo+ID4gPiA+ICsg
ICAgIHN0cnVjdCB2b3AgKnZvcCA9IHRvX3ZvcChjcnRjKTsKPiA+ID4gPiArCj4gPiA+ID4gKyAg
ICAgaWYgKHZvcC0+bHV0X3JlZ3MgJiYgY3J0Y19zdGF0ZS0+Y29sb3JfbWdtdF9jaGFuZ2VkICYm
Cj4gPiA+ID4gKyAgICAgICAgIGNydGNfc3RhdGUtPmdhbW1hX2x1dCkgewo+ID4gPiA+ICsgICAg
ICAgICAgICAgdW5zaWduZWQgaW50IGxlbjsKPiA+ID4gPiArCj4gPiA+ID4gKyAgICAgICAgICAg
ICBsZW4gPSBkcm1fY29sb3JfbHV0X3NpemUoY3J0Y19zdGF0ZS0+Z2FtbWFfbHV0KTsKPiA+ID4g
PiArICAgICAgICAgICAgIGlmIChsZW4gIT0gY3J0Yy0+Z2FtbWFfc2l6ZSkgewo+ID4gPiA+ICsg
ICAgICAgICAgICAgICAgICAgICBEUk1fREVCVUdfS01TKCJJbnZhbGlkIExVVCBzaXplOyBnb3Qg
JWQsIGV4cGVjdGVkICVkXG4iLAo+ID4gPiA+ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIGxlbiwgY3J0Yy0+Z2FtbWFfc2l6ZSk7Cj4gPiA+ID4gKyAgICAgICAgICAgICAgICAg
ICAgIHJldHVybiAtRUlOVkFMOwo+ID4gPiA+ICsgICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiBP
dmVyZmxvdyBpcyBhdm9pZGVkIGluIGRybV9tb2RlX2dhbW1hX3NldF9pb2N0bCgpLCBzbyBJIGRv
bid0IHRoaW5rIHlvdSBuZWVkCj4gPiA+IHRoaXMgZnVuY3Rpb24uCj4gPiA+Cj4gPgo+ID4gQnV0
IHRoYXQgb25seSBhcHBsaWVzIHRvIHRoZSBsZWdhY3kgcGF0aC4gSXNuJ3QgdGhpcyBuZWVkZWQg
dG8gZW5zdXJlCj4gPiBhIGdhbW1hIGJsb2IKPiA+IGhhcyB0aGUgcmlnaHQgc2l6ZT8KPgo+IFll
YWgsIGdvb2QgcG9pbnQsIHdlIGNoZWNrIHRoZSBlbGVtZW50IHNpemUgaW4gdGhlIGF0b21pYyBw
YXRoLCBidXQgbm90IHRoZSBtYXgKPiBzaXplLiBJIGhhdmVuJ3QgbG9va2VkIGF0IGVub3VnaCBj
b2xvciBsdXQgc3R1ZmYgdG8gaGF2ZSBhbiBvcGluaW9uIHdoZXRoZXIgdGhpcwo+IGNoZWNrIHdv
dWxkIGJlIHVzZWZ1bCBpbiBhIGhlbHBlciBmdW5jdGlvbiBvciBub3QsIHNvbWV0aGluZyB0byBj
b25zaWRlciwgSQo+IHN1cHBvc2UuCgpTb21lIGltcGxlbWVudGF0aW9ucyBzdXBwb3J0IG11bHRp
cGxlIHNpemVzIChlLmcuIDI1NiBhbmQgMTAyNCkgYnV0Cm5vdCBhbnl0aGluZyBpbiBiZXR3ZWVu
LiBJdCB3b3VsZCBiZSBkaWZmaWN1bHQgdG8gZXhwb3NlIHRoaXMKZ2VuZXJpY2FsbHksIEkgd291
bGQgaW1hZ2luZS4gVGhlIDI1NiBzaXplIGlzIGtpbmQgb2Ygc3BlY2lhbCwgc2luY2UKYmFzaWNh
bGx5IGFsbCBsZWdhY3kgdXNhZ2UgYXNzdW1lcyB0aGF0IDI1NiBpcyB0aGUgb25lIHRydWUgcXVh
bnRpdHkKb2YgTFVUIGVudHJpZXMuLi4KCiAgLWlsaWEKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
