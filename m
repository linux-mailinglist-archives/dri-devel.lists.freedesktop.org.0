Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F70D833E6
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 16:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 138236E3A8;
	Tue,  6 Aug 2019 14:25:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E32B6E388;
 Tue,  6 Aug 2019 14:25:33 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id EC7A12173B;
 Tue,  6 Aug 2019 14:25:32 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id s22so63066960qkj.12;
 Tue, 06 Aug 2019 07:25:32 -0700 (PDT)
X-Gm-Message-State: APjAAAUBkKyM1eXf5WdDNiVDK7Hsu4zgeQMLCAPddLDHX/EgVMRnmt/K
 Hev7F3Ra1gcmcn2ERN2+8BmQn7qKeRV6Gk7waQ==
X-Google-Smtp-Source: APXvYqwsgHOWjSNZlTFoCySBRr/BWi6+wCXB6KNoZzNAa71uRncLLvoG7FSHHSRZXuuxPr+OK6iZFItp6i/k1n7jlNU=
X-Received: by 2002:a37:a48e:: with SMTP id n136mr3546010qke.223.1565101532131; 
 Tue, 06 Aug 2019 07:25:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190803104719.gwb6hmreeaqyye6n@flea>
 <CAPM=9tygocpAnOzJHy3TW2UQc0_6A86e7CpQT1CCMEhWfjzheg@mail.gmail.com>
 <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
In-Reply-To: <CAKMK7uEHt2KBJoG21F_zqxbfkyVFRAoir__vZt1yheEFxpwUcg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Tue, 6 Aug 2019 08:25:20 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+h9m9yjSOQ-q6PVmzzjLL=2h6m8WxMhgSfYNdp-bZm7Q@mail.gmail.com>
Message-ID: <CAL_Jsq+h9m9yjSOQ-q6PVmzzjLL=2h6m8WxMhgSfYNdp-bZm7Q@mail.gmail.com>
Subject: Re: [PULL] drm-misc-next
To: Daniel Vetter <daniel.vetter@ffwll.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=kernel.org; s=default; t=1565101533;
 bh=92u/KZeeMnRhvhDLLV4lhEwCEJFV1ah4kIShpawlcbI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hyPULchrhp01fPr9Fft0bvRvdCZ50cAfX2J2qs4bySRR2/2gZrQd8dgjhwBQlr5pw
 RPDv9bV488R8/A5FRzx0473QCj+nI8Od0GWXYgxVbXL/JCddjfvjzBNvg72uOS/M/x
 KboTxFzC/78WhyLmZyD/1w/okIXhaehDBV/p0ahE=
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
Cc: "DRM maintainer tools announcements, discussion,
 and development" <dim-tools@lists.freedesktop.org>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Emil Velikov <emil.l.velikov@gmail.com>, Maxime Ripard <mripard@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBBdWcgNiwgMjAxOSBhdCAxOjM0IEFNIERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAZmZ3bGwuY2g+IHdyb3RlOgo+Cj4gT24gVHVlLCBBdWcgNiwgMjAxOSBhdCAyOjM0IEFNIERh
dmUgQWlybGllIDxhaXJsaWVkQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gT24gU2F0LCAzIEF1
ZyAyMDE5IGF0IDIwOjQ3LCBNYXhpbWUgUmlwYXJkIDxtYXhpbWUucmlwYXJkQGJvb3RsaW4uY29t
PiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgRGFuaWVsLCBEYXZlLAo+ID4gPgo+ID4gPiBIZXJlIGlz
IHRoZSBmaXJzdCAoYW5kIHByZXR0eSBsYXRlKSBkcm0tbWlzYy1uZXh0IFBSLgo+ID4gPgo+ID4g
PiBJdCdzIHByZXR0eSBiaWcgZHVlIHRvIHRoZSBsYXRlbmVzcywgYnV0IHRoZXJlJ3Mgbm90aGlu
ZyByZWFsbHkgbWFqb3IKPiA+ID4gc2hvd2luZyB1cC4gSXQncyBwcmV0dHkgbXVjaCB0aGUgdXN1
YWwgYnVuY2ggb2YgcmV3b3JrcywgZml4ZXMsIGFuZAo+ID4gPiBuZXcgaGVscGVycyBiZWluZyBp
bnRyb2R1Y2VkLgo+ID4gPgo+ID4KPiA+IGRpbTogNDE1ZDJlOWUwNzU3ICgiUmV2ZXJ0ICJkcm0v
Z2VtOiBSZW5hbWUgZHJtX2dlbV9kdW1iX21hcF9vZmZzZXQoKQo+ID4gdG8gZHJtX2dlbV9tYXBf
b2Zmc2V0KCkiIik6IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+IGRpbTogYmU4NTUzODJi
YWNiICgiUmV2ZXJ0ICJkcm0vcGFuZnJvc3Q6IFVzZSBkcm1fZ2VtX21hcF9vZmZzZXQoKSIiKToK
PiA+IG1hbmRhdG9yeSByZXZpZXcgbWlzc2luZy4KPiA+IGRpbTogZTRlZWU5M2QyNTc3ICgiZHJt
L3ZnZW06IGRyb3AgRFJNX0FVVEggdXNhZ2UgZnJvbSB0aGUgZHJpdmVyIik6Cj4gPiBtYW5kYXRv
cnkgcmV2aWV3IG1pc3NpbmcuCj4gPiBkaW06IDg4MjA5ZDJjNTAzNSAoImRybS9tc206IGRyb3Ag
RFJNX0FVVEggdXNhZ2UgZnJvbSB0aGUgZHJpdmVyIik6Cj4gPiBtYW5kYXRvcnkgcmV2aWV3IG1p
c3NpbmcuCj4gPiBkaW06IGNjZGFlNDI1NzU2OSAoImRybS9ub3V2ZWF1OiByZW1vdmUgb3Blbi1j
b2RlZCBkcm1faW52YWxpZF9vcCgpIik6Cj4gPiBtYW5kYXRvcnkgcmV2aWV3IG1pc3NpbmcuCj4g
Pgo+ID4gUHJldHR5IHN1cmUgcmV2aWV3IGluIGRybS1taXNjLW5leHQgaXMgYSBydWxlLiBJIGRv
bid0IGV2ZW4gc2VlIGFja3MKPiA+IG9uIG1vc3Qgb2YgdGhlc2UuCj4KPiBZZXMuIEkgZ3Vlc3Mg
Zm9yIHJldmVydHMgaXQncyBub3QgY29vbCwgYnV0IGFsc28gbm90IHRoZSB3b3JzdC4gU3RpbGwK
PiBiZXR0ZXIgdG8gZ2V0IHNvbWVvbmUgdG8gYWNrLCBoZWNrIEkgY2FuIHB1bGwgdGhhdCBvZmYg
Zm9yIGVtZXJnZW5jeQo+IHJldmVydHMgd2l0aCBhIGZldyBwaW5ncyBvbiBpcmMsIGFuZCB0aGUg
MiByZXZlcnRzIGxhbmRlZCBtdWNoIGxhdGVyLgo+IEJ1dCBmb3Igbm9ybWFsIHBhdGNoZXMgaXQn
cyBkZWZpbml0ZWx5IG5vdCBvayBhdCBhbGwuIEFsc28gb25seQo+IHBvc3NpYmxlIGlmIHBlb3Bs
ZSBieXBhc3MgdGhlIHRvb2xpbmcsIG9yIG92ZXJyaWRlIHRoZSB0b29saW5nIHdpdGgKPiB0aGUg
LWYgZmxhZyB0byBmb3JjZSBhIHB1c2guCj4KPiBSb2IsIEVtaWwsIHdoYXQncyB1cCBoZXJlPwoK
SSBjb21taXR0ZWQgdGhlIGNoYW5nZXMsIHRoZXkgdHVybmVkIG91dCB0byBjbGVhcmx5IGJyZWFr
IHRoaW5ncyBhbmQKbm90IGJlIGZpeGFibGUgaW4gYW55IHdheS4gSSBzYWlkIEkgd2FzIGdvaW5n
IHRvIHJldmVydCB0aGVtWzFdIGluCnJlcGx5IHRvIHRoZSBvcmlnaW5hbCwgZ290IG5vIHJlcGx5
LCBhbmQgc28gSSByZXZlcnRlZCB0aGVtLiBTZWVtZWQKc3VmZmljaWVudCB0byBtZSwgYnV0IG5l
eHQgdGltZSBJJ2xsIGtlZXAgdGhlIHRvb2wgaGFwcHkuCgpSb2IKClsxXSBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9kcmktZGV2ZWwvMjAxOS1KdWx5LzIyNTA5Mi5odG1s
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
