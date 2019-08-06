Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AA6982EF9
	for <lists+dri-devel@lfdr.de>; Tue,  6 Aug 2019 11:45:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854D86E348;
	Tue,  6 Aug 2019 09:45:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x941.google.com (mail-ua1-x941.google.com
 [IPv6:2607:f8b0:4864:20::941])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C29566E348
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Aug 2019 09:45:06 +0000 (UTC)
Received: by mail-ua1-x941.google.com with SMTP id o19so33399808uap.13
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Aug 2019 02:45:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KlPP6c8m+D3UQ9XrDkvefQHaegsf0c17KTmpEmbMh1w=;
 b=Db3n1ohT7STsS2GavSaaIGzhnjbYn3DMuYcNqejdJXQqFUveeIoHVl0mHjn6Arp4os
 QPN4Bn49ARUTc0n13mOzCJEWujiXdUVEa8hMVV/QSbfgC23L4IjbMWlJsn4CSBaQni6t
 XdNpVR/hK2KUo5liCzKmdMRRfWqPz1pLMUPazPStfqoEMD28R/xUWLL+JhUPGgjYbLzF
 YMDZRHgdWX/rLQ9JLT3F+JE9d5k3vdc7fJSmyXfDnMqgJIU+zeBV8wFKVzzOLPONN5QH
 LnIEVv+iyrXJZOfJZLiCrZ5307KRwNJi04S6haRPG1O8VVqMhC39nfSL1FiUepVzmIz3
 pU4A==
X-Gm-Message-State: APjAAAXBocUP0i58Vi6gVsEgS6nVVUWii5skeIEJMk0oYXLDlIirDqaT
 7bzmgP/ZO1GNm6CGx9MbZqaK7JjiIkNFZzKT0uBTL7pZ
X-Google-Smtp-Source: APXvYqx2Vc0SCxD6E732ixGUfyQEayEZbtr+cf6iEf+GBh0hyfYNruxMrnqmDZsiM2jtmbcpA5YoiD8kxSfyx/DnF3M=
X-Received: by 2002:ab0:5973:: with SMTP id o48mr1647360uad.19.1565084705724; 
 Tue, 06 Aug 2019 02:45:05 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-11-emil.l.velikov@gmail.com>
In-Reply-To: <20190527081741.14235-11-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 6 Aug 2019 10:44:16 +0100
Message-ID: <CACvgo53ttDLx0vhbuM8SEcCiCEh5VFCZei1N+=Kritn1Gee-VA@mail.gmail.com>
Subject: Re: [PATCH 11/13] drm/vgem: drop DRM_AUTH usage from the driver
To: ML dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=KlPP6c8m+D3UQ9XrDkvefQHaegsf0c17KTmpEmbMh1w=;
 b=lrqY7mfO2f26J3PBNKXbkHL4DI2jDe9Eu6J5P3cNSZTqbuwmDe+sK5ko3rUJtxoH9f
 bXmuRIxkaiA3qBqfdjf1uZxDO4hH+uonwVhU/y8mrygKbIpxTPpvPajyxxMX5pyvA9YQ
 y5rz466C5wB4n9KNKXabcTaVJ/K+DGoQNa/eVTRYuCNcIPSRIf8Xjqg8ymoOCAiDBNSa
 DCMQW6j/kkXZX29VCbjEC6NKXBZA8pYCt4ALrrEkf2nIKj1ZGKJ90lkxgTKsMS/6exKV
 Y74wJHtvSErQYyl9TMMpGfozeo6o8HZn7q2EijhG+LkVnUVg46ZSawqazrjyMAAcWEN/
 b1Tw==
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
YV9zdHJ1Y3QgKnZtYSkKPiAtLQoKSHVtYmxlIHBpbmc/CgpUaGFua3MsCkVtaWwKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
