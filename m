Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20EB03725B
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 13:00:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6A08893B9;
	Thu,  6 Jun 2019 11:00:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B6A89471
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jun 2019 11:00:40 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id v129so915504vsb.11
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jun 2019 04:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9+HN9sDwvokG7uBhcb8B13K0fQkE12BZ1OLWFLvjOHg=;
 b=p1fEQyM+2CtQwuQIpNNvPqLtZNcbQqROCx6sh7Jb7CGdlJvGdBYCwUfZ4uA3uJBkRg
 UVF5WTAIx/okIEQVgCixmJFlsHIkXss1PxIDTmwwRJdWu/qAFqfz6OHbZtUzg2uw1RsT
 cDb4pYsWXfbX5Hik6lw1+kEMRTPzPjogPR0ptF2qBdYxBdKHhRnpVfOKQCc2r4u1Brel
 jgc2PmDJaZg6/DeBjSB/rIuNyTECXg4Baf25QYbBtqiAmLegCUYlLGW4wqQC5c6OspcT
 xLnCZehsM8SYq8x2aSB5JR0NsrJ8VUz5+r+W642pyO0b3COTEQ2snMQmfzUqF1YzTqqs
 azug==
X-Gm-Message-State: APjAAAUnSUNDYoe1MAK4DVwcTS1Cx59FaDHB7M1sYGFupAbfFtkC69QQ
 Sm532L6sAeYJIc0Ga/i7FCxiVxV6f25vhcuY6yTcmceJ
X-Google-Smtp-Source: APXvYqyx4vAaGgqRx0mkfSXr+PM1uIE2Yp/nHktjI8coPUGWCelDGkU+pJywSA2mgEKsSPOiiHecVYUUGg55I/u43ms=
X-Received: by 2002:a67:eb87:: with SMTP id e7mr13033714vso.118.1559818839528; 
 Thu, 06 Jun 2019 04:00:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190527081741.14235-1-emil.l.velikov@gmail.com>
 <20190527081741.14235-9-emil.l.velikov@gmail.com>
In-Reply-To: <20190527081741.14235-9-emil.l.velikov@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Thu, 6 Jun 2019 11:58:47 +0100
Message-ID: <CACvgo532qR7QRE+sBBQB_i1skvD2KZTAs=NiNvVVj5okzpv9YA@mail.gmail.com>
Subject: Re: [PATCH 09/13] drm/omap: drop DRM_AUTH from DRM_RENDER_ALLOW ioctls
To: ML dri-devel <dri-devel@lists.freedesktop.org>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=9+HN9sDwvokG7uBhcb8B13K0fQkE12BZ1OLWFLvjOHg=;
 b=LF9LBt51UlhAykrGwigUq81PSEOF+/YW+cK63VBHG68nSPpKh2S4Yl7G0l6Ajqtrqg
 wKnD06SjbmnZpEsUnNBuIsxMnVqMyscNIukPvNokuejavB9Hu8KCQlJGXeZ2oF0wH4ni
 3DpNJZ8YTkvihCNv/g66dtibuKWir4W+i7vdf26kSoJEV1pgBE094AwNtAaCObUGNIrI
 B2UVrLmDdfy2J6gWUGAi8llzIxo3coo8Y1AaG6V0iYF1R4Z8qGMpghT5xX8U5XpyRNxj
 5p4o03zG02JCZ6i9hVNcMmQf7UwUgVuqbjyqr+8d0lqbhmory8327aCIJsMPq346DuQ0
 4qog==
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
Cc: David Airlie <airlied@linux.ie>, Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCAyNyBNYXkgMjAxOSBhdCAwOToxOSwgRW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtv
dkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gRnJvbTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZA
Y29sbGFib3JhLmNvbT4KPgo+IFRoZSBhdXRoZW50aWNhdGlvbiBjYW4gYmUgY2lyY3VtdmVudGVk
LCBieSBkZXNpZ24sIGJ5IHVzaW5nIHRoZSByZW5kZXIKPiBub2RlLgo+Cj4gRnJvbSB0aGUgZHJp
dmVyIFBPViB0aGVyZSBpcyBubyBkaXN0aW5jdGlvbiBiZXR3ZWVuIHByaW1hcnkgYW5kIHJlbmRl
cgo+IG5vZGVzLCB0aHVzIHdlIGNhbiBkcm9wIHRoZSB0b2tlbi4KPgo+IE5vdGU6IHRoZSBvdXRz
dGFuZGluZyBEUk1fQVVUSCBpbnN0YW5jZSBpczoKPiAgLSAoYmFkbHkgY29wZWQpIGxlZ2FjeSBE
UkkxIGlvY3RsLCB3aGljaCBpcyBhIG5vb3AKPgo+IENjOiBUb21pIFZhbGtlaW5lbiA8dG9taS52
YWxrZWluZW5AdGkuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBTaWduZWQtb2ZmLWJ5OiBFbWls
IFZlbGlrb3YgPGVtaWwudmVsaWtvdkBjb2xsYWJvcmEuY29tPgo+Cj4gU2lnbmVkLW9mZi1ieTog
RW1pbCBWZWxpa292IDxlbWlsLmwudmVsaWtvdkBnbWFpbC5jb20+Cj4gLS0tCj4gIGRyaXZlcnMv
Z3B1L2RybS9vbWFwZHJtL29tYXBfZHJ2LmMgfCAxMCArKysrKy0tLS0tCj4gIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJt
L29tYXBfZHJ2LmMKPiBpbmRleCAxYjliNmY1ZTQ4ZTEuLmY5Nzc4MWY5ZDkzNiAxMDA2NDQKPiAt
LS0gYS9kcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2Rydi5jCj4gKysrIGIvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9kcnYuYwo+IEBAIC00OTEsMTkgKzQ5MSwxOSBAQCBzdGF0aWMg
aW50IGlvY3RsX2dlbV9pbmZvKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCj4K
PiAgc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1faW9jdGxfZGVzYyBpb2N0bHNbRFJNX0NPTU1BTkRf
RU5EIC0gRFJNX0NPTU1BTkRfQkFTRV0gPSB7Cj4gICAgICAgICBEUk1fSU9DVExfREVGX0RSVihP
TUFQX0dFVF9QQVJBTSwgaW9jdGxfZ2V0X3BhcmFtLAo+IC0gICAgICAgICAgICAgICAgICAgICAg
ICAgRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKPiArICAgICAgICAgICAgICAgICAgICAg
ICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICAgICAgICAgRFJNX0lPQ1RMX0RFRl9EUlYoT01BUF9T
RVRfUEFSQU0sIGlvY3RsX3NldF9wYXJhbSwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIERS
TV9BVVRIIHwgRFJNX01BU1RFUiB8IERSTV9ST09UX09OTFkpLAo+ICAgICAgICAgRFJNX0lPQ1RM
X0RFRl9EUlYoT01BUF9HRU1fTkVXLCBpb2N0bF9nZW1fbmV3LAo+IC0gICAgICAgICAgICAgICAg
ICAgICAgICAgRFJNX0FVVEggfCBEUk1fUkVOREVSX0FMTE9XKSwKPiArICAgICAgICAgICAgICAg
ICAgICAgICAgIERSTV9SRU5ERVJfQUxMT1cpLAo+ICAgICAgICAgLyogRGVwcmVjYXRlZCwgdG8g
YmUgcmVtb3ZlZC4gKi8KPiAgICAgICAgIERSTV9JT0NUTF9ERUZfRFJWKE9NQVBfR0VNX0NQVV9Q
UkVQLCBkcm1fbm9vcCwKPiAtICAgICAgICAgICAgICAgICAgICAgICAgIERSTV9BVVRIIHwgRFJN
X1JFTkRFUl9BTExPVyksCj4gKyAgICAgICAgICAgICAgICAgICAgICAgICBEUk1fUkVOREVSX0FM
TE9XKSwKPiAgICAgICAgIC8qIERlcHJlY2F0ZWQsIHRvIGJlIHJlbW92ZWQuICovCj4gICAgICAg
ICBEUk1fSU9DVExfREVGX0RSVihPTUFQX0dFTV9DUFVfRklOSSwgZHJtX25vb3AsCj4gLSAgICAg
ICAgICAgICAgICAgICAgICAgICBEUk1fQVVUSCB8IERSTV9SRU5ERVJfQUxMT1cpLAo+ICsgICAg
ICAgICAgICAgICAgICAgICAgICAgRFJNX1JFTkRFUl9BTExPVyksCj4gICAgICAgICBEUk1fSU9D
VExfREVGX0RSVihPTUFQX0dFTV9JTkZPLCBpb2N0bF9nZW1faW5mbywKPiAtICAgICAgICAgICAg
ICAgICAgICAgICAgIERSTV9BVVRIIHwgRFJNX1JFTkRFUl9BTExPVyksCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgICBEUk1fUkVOREVSX0FMTE9XKSwKPiAgfTsKPgo+ICAvKgo+IC0tCj4gMi4y
MS4wCj4KSHVtYmxlIHBva2U/CgpUaGFua3MsCkVtaWwKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
