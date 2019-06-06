Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528173725C
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 13:00:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BB6B89471;
	Thu,  6 Jun 2019 11:00:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 160808944A
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:00:55 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id f20so708913ual.0
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 04:00:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O9qTEhHZ5nCVWuvJPOytL5ZDrvZE56pYpKwH/rOd0Wg=;
 b=OzsS0PbUzM1uK0v1TB5di77YFoR8eeFGT+M5ZW4F3Yx26J3KHx6auka3Ljd0AExGy3
 VL4NTiQ6yJImS64AfN7cJG72iorVvEAkyNqTVGNaj/fxM86yKavFWKqeUU3VLmwOfvGC
 zSGSTyR9zIzCeL0/2C21PAHPoXx82iAEuRoXpy4NCXqnQqumwApssIh628Jm2+qeOgsz
 dP3LDs5IXn+88z10i6ufcQsPUnConynA3DHdHaSaG6p6RWLqvWUMb1eIvNSxdA5xz92R
 hhIePjsYE9goZlHT+PBn9ldW5bpV3TrcAy4Jtj1OkYIjf75L4dIK+LC/DKnANJT1gbHx
 Jieg==
X-Gm-Message-State: APjAAAWFt1Ii80b78bD3qW9s0NZU3INe6P/0rJPZiS3gHo2TPUMm/Oyw
 6rA96pjjVQuJsP+hj1T1BjWSHQICaBliBcJogBOMNy8K
X-Google-Smtp-Source: APXvYqzETH0N5viE0dXOb6NsnZKCE743l1wuxFCSP4zKcRCe8NQakdwu96aP7VRvFLPErYNzt919Ax7FbTh6HobzBx8=
X-Received: by 2002:ab0:74c7:: with SMTP id f7mr5526179uaq.106.1559818854087; 
 Thu, 06 Jun 2019 04:00:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-11-emil.l.velikov@gmail.com>
In-Reply-To: <20190527081741.14235-11-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 6 Jun 2019 11:59:02 +0100
Message-ID: <CACvgo52TtqAKxbt_JR9tR8W9u47sec4fic1n+vkQ1ePopMP9QQ@mail.gmail.com>
Subject: Re: [PATCH 11/13] drm/vgem: drop DRM_AUTH usage from the driver
To: ML dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=O9qTEhHZ5nCVWuvJPOytL5ZDrvZE56pYpKwH/rOd0Wg=;
 b=KYRTXaZcp9li23DKBKSRiHepP1zWj0lZeeKxickiEa7bt7/5gSxtPr/HOOeqysaIqU
 cjXvS/go0yrT6s0rNHIvNBqqlzdYTpiSy5jb1jVHrMs3JcHiOmazdwuGvX5qxBfnPem5
 U/6QSLy/AAu+snayvcdNRHofcTNFOmR448k8EPOk0OAAuzzqE6Lc2VeU/jB3PAlQpEJ5
 pqbWy/+IbRpb85ZLNuiFxzJnC3jCOko1Gz7UN9ZlT0WF9vgg1nkDtkrYjNytrasOYjDU
 exGzQ8YKu1dnGU3Rs3Aun8sbETT/Ij2QmdDMayOOGWNvr41ESAmV+x5NxSl7JyAwmddm
 rUbA==
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
Cc: David Airlie <airlied@linux.ie>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNyBNYXkgMjAxOSBhdCAwOToxOSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZA
Y29sbGFib3JhLmNvbT4KPgo+IFRoZSBhdXRoZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVk
LCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSByZW5kZXIKPiBub2RlLgo+Cj4gRnJvbSB0aGUgZHJp
dmVyIFBPViB0aGVyZSBpcyBubyBkaXN0aW5jdGlvbiBiZXR3ZWVuIHByaW1hcnkgYW5kIHJlbmRl
cgo+IG5vZGVzLCB0aHVzIHdlIGNhbiBkcm9wIHRoZSB0b2tlbi4KPgo+IENjOiBEYXZpZCBBaXJs
aWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5j
aD4KPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEu
Y29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jIHwgNCArKy0tCj4g
IDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2Ry
bS92Z2VtL3ZnZW1fZHJ2LmMKPiBpbmRleCAxMWE4Zjk5YmExOGMuLjBiYTA3OWYxYjMwMiAxMDA2
NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vdmdlbS92Z2VtX2Rydi5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL3ZnZW0vdmdlbV9kcnYuYwo+IEBAIC0yNDYsOCArMjQ2LDggQEAgc3RhdGljIGlu
dCB2Z2VtX2dlbV9kdW1iX21hcChzdHJ1Y3QgZHJtX2ZpbGUgKmZpbGUsIHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCj4gIH0KPgo+ICBzdGF0aWMgc3RydWN0IGRybV9pb2N0bF9kZXNjIHZnZW1faW9j
dGxzW10gPSB7Cj4gLSAgICAgICBEUk1fSU9DVExfREVGX0RSVihWR0VNX0ZFTkNFX0FUVEFDSCwg
dmdlbV9mZW5jZV9hdHRhY2hfaW9jdGwsIERSTV9BVVRIfERSTV9SRU5ERVJfQUxMT1cpLAo+IC0g
ICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoVkdFTV9GRU5DRV9TSUdOQUwsIHZnZW1fZmVuY2Vfc2ln
bmFsX2lvY3RsLCBEUk1fQVVUSHxEUk1fUkVOREVSX0FMTE9XKSwKPiArICAgICAgIERSTV9JT0NU
TF9ERUZfRFJWKFZHRU1fRkVOQ0VfQVRUQUNILCB2Z2VtX2ZlbmNlX2F0dGFjaF9pb2N0bCwgRFJN
X1JFTkRFUl9BTExPVyksCj4gKyAgICAgICBEUk1fSU9DVExfREVGX0RSVihWR0VNX0ZFTkNFX1NJ
R05BTCwgdmdlbV9mZW5jZV9zaWduYWxfaW9jdGwsIERSTV9SRU5ERVJfQUxMT1cpLAo+ICB9Owo+
Cj4gIHN0YXRpYyBpbnQgdmdlbV9tbWFwKHN0cnVjdCBmaWxlICpmaWxwLCBzdHJ1Y3Qgdm1fYXJl
YV9zdHJ1Y3QgKnZtYSkKPiAtLQo+IDIuMjEuMAo+CgpIdW1ibGUgcG9rZT8KClRoYW5rcywKRW1p
bApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
