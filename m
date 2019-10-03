Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C24AC957B
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2019 02:18:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BF356E1E2;
	Thu,  3 Oct 2019 00:18:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18946E1E2
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2019 00:18:30 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id c195so387441lfg.9
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 17:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oSAsF+Pq89SRM7cc3NOl6X+bMBZjWImRQS9j9EadC/0=;
 b=RvExjzpBFI+mjZGEORwK94faabTve67WW/V1liFc+nqO7wBuI4Z2hihbGCGg1UBoH5
 KeA8T0j44aLJv0Mb497CWLVElnasBsH5hLosW8Ys2/tJnsdYWvq1rW/Q/4kXCqQ5Ho94
 I9qBdE7QM8K+w5I2PJIb9bYfqt52nwCp3S3U4636rSTQXUfV//ZPzNu/04oaB3BBtHTr
 IvMfADvogB8Wk6sFHixp5Mj6Z0oxmHOTxOW4knoWba/rcbiYwkb9oQqXy7P0yWiYUSNl
 TO4Kvm+jTHtbICmequ8Qa+D1lKoEroIBSk+LAatmLp3zIX8FFRnU6yNvm+7XbCtKAYDv
 wnaw==
X-Gm-Message-State: APjAAAVcRxgLlOCsbSn+aTuq8zy/4hW9eg5Jot6lgnpDCQ/kiZEDc2y1
 9W48JVNTX2mVEi7g31Fc52cz044hxxk=
X-Google-Smtp-Source: APXvYqx0/vZPLcufzeOT3+zJ0DJTggGYfqNwGXTFpAXPzsIMBQJwMlZeWQVhn9dbn9XMxj6HI4CWHQ==
X-Received: by 2002:ac2:4552:: with SMTP id j18mr3971597lfm.120.1570061908422; 
 Wed, 02 Oct 2019 17:18:28 -0700 (PDT)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com.
 [209.85.167.45])
 by smtp.gmail.com with ESMTPSA id t82sm108059lff.58.2019.10.02.17.18.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Oct 2019 17:18:27 -0700 (PDT)
Received: by mail-lf1-f45.google.com with SMTP id d17so396788lfa.7
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Oct 2019 17:18:27 -0700 (PDT)
X-Received: by 2002:a19:4f5a:: with SMTP id a26mr3823745lfk.116.1570061907355; 
 Wed, 02 Oct 2019 17:18:27 -0700 (PDT)
MIME-Version: 1.0
References: <20191002014935.33171-1-gurchetansingh@chromium.org>
 <20191002014935.33171-2-gurchetansingh@chromium.org>
 <20191002084942.jnm6brnuadwztonh@sirius.home.kraxel.org>
In-Reply-To: <20191002084942.jnm6brnuadwztonh@sirius.home.kraxel.org>
From: Gurchetan Singh <gurchetansingh@chromium.org>
Date: Wed, 2 Oct 2019 17:18:16 -0700
X-Gmail-Original-Message-ID: <CAAfnVB=NBvsAsFX_iDuqfyS12jp=S=1kXDjvWr8-tFAaN5aEMQ@mail.gmail.com>
Message-ID: <CAAfnVB=NBvsAsFX_iDuqfyS12jp=S=1kXDjvWr8-tFAaN5aEMQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] [RFC] drm/virtgpu: modify uapi with
 stride/layer_stride fix
To: Gerd Hoffmann <kraxel@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=oSAsF+Pq89SRM7cc3NOl6X+bMBZjWImRQS9j9EadC/0=;
 b=D0KaG8wPxn4sjQZ5WUWChNPhm9aLO/1u0hoFMwU66tm4Q+Nm0KfGEenMQvnFomh2dV
 8KCQl9sGVtJXiNj2/yIhqz7pEm/8MNH460vaSdVanR3nInH6lry7OzQ+eudZ45DcydF5
 p08qFd7pEsxCe1YwtqB5OcIAKU4NwQhheXXJE=
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
 ML dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBPY3QgMiwgMjAxOSBhdCAxOjQ5IEFNIEdlcmQgSG9mZm1hbm4gPGtyYXhlbEByZWRo
YXQuY29tPiB3cm90ZToKPgo+IE9uIFR1ZSwgT2N0IDAxLCAyMDE5IGF0IDA2OjQ5OjM1UE0gLTA3
MDAsIEd1cmNoZXRhbiBTaW5naCB3cm90ZToKPiA+IFRoaXMgZG9lc24ndCByZWFsbHkgYnJlYWsg
dXNlcnNwYWNlLCBzaW5jZSBpdCBhbHdheXMgcGFzc2VzIGRvd24KPiA+IDAgZm9yIHN0cmlkZS9s
YXllcl9zdHJpZGUgY3VycmVudGx5LiBXZSBjb3VsZDoKPiA+Cj4gPiAoMSkgbW9kaWZ5IFVBUEkg
bm93IGFuZCBhZGQgYSBWSVJUR1BVX1BBUkFNX1NUUklERV9GSVggZmVhdHVyZQo+Cj4gVGhpcyBJ
IHRoaW5rLgo+IEJ1dCBJTU8gaXQncyBub3QgYSBmaXgsIGl0IGlzIGFuIGFkZGVkIGZlYXR1cmUg
Li4uCj4KPiBBbHNvIG1pc3NpbmcgdGhlIGJpZyBwaWN0dXJlIGhlcmUuICBXaHkgZG8gd2UgbmVl
ZCB0aGlzPwoKVHdvIHJlYXNvbnM6CgphKSB3YXlsYW5kLXByb3hpbmcuICBHZW5lcmFsbHksIGhv
c3Rfc3RyaWRlICE9IGd1ZXN0X3N0cmlkZSBhbmQKYWxpZ25pbmcgdG8gNjQgaXMgaW5zdWZmaWNp
ZW50IChmb3IgZXhhbXBsZSwgSW50ZWwgeC10aWxlZCBidWZmZXJzKS4KVGhlcmUgYXJlIGdlbmVy
YWxseSB0aHJlZSBwbGFjZXMgd2UgY2FuIG1ha2UgYW4gYWRqdXN0bWVudDoKCjEpIEluIHRoZSB3
YXlsYW5kIGd1ZXN0IHByb3h5LCBiZWZvcmUgY3Jvc3NpbmcgdGhlIFZNIGJvdW5kYXJ5CjIpIElu
IHRoZSB3YXlsYW5kIGhvc3QgcHJveHksIGJlZm9yZSBzZW5kaW5nIHRvIHRoZSBzZXJ2ZXIKMykg
TWFrZSBzdXJlIGhvc3Rfc3RyaWRlID09IGd1ZXN0X3N0cmlkZSBhdCBhbGxvY2F0aW9uIHRpbWUK
CkZvciAoMSksIHdlJ2QgaGF2ZSB0byBleHRlbmQgZHJtX3ZpcnRncHVfcmVzb3VyY2VfaW5mbyB0
byBhY3R1YWxseQpyZXR1cm4gdGhlIHN0cmlkZS4gIFRoaXMgcmFpc2VzIHF1ZXN0aW9ucyBhYm91
dCBzdHJpZGVzIG9mIDFEIGJ1ZmZlcnMsCmN1YmVtYXBzLCBldGMuLgoKRm9yICgyKSwgc29tZWJv
ZHkgYWN0dWFsbHkgbmVlZHMgdG8gd3JpdGUgYSB3YXlsYW5kIGhvc3QgcHJveHkuICBJdCdzCnRv
byBtdWNoIHdvcmsganVzdCBmb3IgdGhpcyBidWcuCgpGb3IgKDMpLCBzaW5jZSB3ZSBoYXZlIHRv
IGRvIHNvbWV0aGluZyBsaWtlClZJUlRJT19HUFVfQ01EX01FVEFEQVRBX1FVRVJZIChvciB3aGF0
ZXZlciB3ZSBjYWxsIGl0KSBmb3IgVnVsa2FuIGFuZAp6ZXJvLWNvcHkgYW55d2F5cywgdGhpcyBz
ZWVtZWQgbGlrZSB0aGUgbW9zdCBuYXR1cmFsIGNob2ljZS4KQ29uc2VxdWVudGx5LCB3aGVuIGd1
ZXN0X3N0cmlkZSAhPSBicHAgKiB3aWR0aCwgd2UnbGwgaGF2ZSB0byBtYWtlCnNvbWUgZml4ZXMg
aW4gTWVzYS92aXJ0aW8tZ3B1LiAgVGhlIG9ubHkgdHJpY2t5IHBhcnQgaXMgbW9kaWZpZXJzIC0t
IEkKc3VzcGVjdCB3ZSdsbCBrZWVwIGEgbWFwcGluZyBvZiB2aXJ0dWFsaXplZCBtb2RpZmllcnMg
dG8gaG9zdAptb2RpZmllcnMuCgpJdCBjb3VsZCBtYWtlIHNvbWUgc2Vuc2UgdG8gd2FpdCBmb3Ig
VklSVElPX0dQVV9DTURfTUVUQURBVEFfUVVFUlkgdG8KbGFuZC4gIElmIHdlIGFncmVlICgzKSBp
cyBhIHByYWN0aWNhbCBzb2x1dGlvbiB0byB0aGlzLCBJIHJlY29tbWVuZCB3ZQpqdXN0IGxhbmQg
dGhlIGZpcnN0IHBhdGNoIGFzIGEgc3RhdGVtZW50IG9mIHB1cnBvc2UgdG8gc2F2ZSBzb21lCmZl
YXR1cmUgYml0cy4gIFdlIGNhbiBtb2RpZnkgdGhlIHVhcGkgbGF0ZXIuCgpiKSBXZSBjdXJyZW50
bHkgaGF2ZSBoYWNrcyBmb3IgWVVWIHdlIGNhbiByZW1vdmUgW2ldW2lpXS4gIFRoaXMgaXMKcmVs
YXRlZCB0byB0aGUgcmVzdHJpY3Rpb24gaW1wb3NlZCBieSBBbmRyb2lkIGd1ZXN0IHVzZXJzcGFj
ZSB0aGF0IHRoZQpzdHJpZGUgbXVzdCBiZSBhbGlnbmVkIHRvIGEgY2VydGFpbiBhbW91bnQgb2Yg
Ynl0ZXMuCgpbaV0gaHR0cHM6Ly9naXRsYWIuZnJlZWRlc2t0b3Aub3JnL3ZpcmdsL3ZpcmdscmVu
ZGVyZXIvYmxvYi9tYXN0ZXIvc3JjL3ZpcmdsX2dibS5jI0wzMjkKW2lpXSBodHRwczovL2Nocm9t
aXVtLmdvb2dsZXNvdXJjZS5jb20vY2hyb21pdW1vcy9wbGF0Zm9ybS9taW5pZ2JtLysvcmVmcy9o
ZWFkcy9tYXN0ZXIvdmlydGlvX2dwdS5jIzI3OAoKPiBJIGRvbid0IHRoaW5rIHdlIGNhbiBzaW1w
bHkgdXNlIHRoZSBhcmdzIGhlcmUgd2l0aG91dCBjaGVja2luZyB3ZQphY3R1YWxseSBnb3Qgc29t
ZXRoaW5nIGZyb20gdXNlcnNwYWNlIC4uLgoKQ29ycmVjdCBtZSBpZiBJJ20gd3JvbmcsIGJ1dCBk
b2Vzbid0IGRybV9pb2N0bCguLikgYWxyZWFkeSBtYWtlIHN1cmUKdGhhdCB0aGUgcG9pbnRlciBp
cyB0aGUgaW50ZXJzZWN0aW9uIG9mIHRoZSBrZXJuZWwgYW5kIHVzZXJzcGFjZQpzaXplcywgc28g
d2UgY2FuIHNhZmVseSBhcHBlbmQgZGF0YT8gIGkuZSwgbGF5ZXJfc3RyaWRlIGFuZCBzdHJpZGUK
d2lsbCBiZSB6ZXJvIGZvciBvbGQgdXNlciBzcGFjZSArIGEgbmV3IGtlcm5lbC4KCgoKCj4KPiBG
b3IgZ3Vlc3Qgb2JqZWN0IHdlIGRvbid0IGhhdmUgc3RyaWRlcyAodmlydGlvX2dwdV9yZXNvdXJj
ZV9jcmVhdGVfM2QKPiBkb2Vzbid0IGFsbG93IHRoaXMpLgo+Cj4gRm9yIGhvc3Qgb2JqZWN0cyB0
aGUgaG9zdCBzaG91bGQga25vdyB0aGUgc3RyaWRlcy4KPgo+IFdoaWNoIEkgdGhpbmsgaXMgdGhl
IHJlYXNvbiB3aHkgdGhlIHN0cmlkZSBhbmQgbGF5ZXJfc3RyaWRlIGZpZWxkcyBpbgo+IHRoZSB0
cmFuc2ZlciBjb21tYW5kcyBhcmUgZWZmZWN0aXZlbHkgdW51c2VkIC4uLgo+Cj4gPiAtICAgICAv
KiBUT0RPOiBhZGQgdGhlIGNvcnJlY3Qgc3RyaWRlIC8gbGF5ZXJfc3RyaWRlLiAqLwo+ID4gICAg
ICAgdmlydGlvX2dwdV9jbWRfdHJhbnNmZXJfZnJvbV9ob3N0XzNkCj4gPiAtICAgICAgICAgICAg
ICh2Z2RldiwgdmZwcml2LT5jdHhfaWQsIG9mZnNldCwgYXJncy0+bGV2ZWwsIDAsIDAsCj4gPiAt
ICAgICAgICAgICAgICAmYm94LCBvYmpzLCBmZW5jZSk7Cj4gPiArICAgICAgICAgICAgICh2Z2Rl
diwgdmZwcml2LT5jdHhfaWQsIG9mZnNldCwgYXJncy0+bGV2ZWwsIGFyZ3MtPnN0cmlkZSwKPiA+
ICsgICAgICAgICAgICAgIGFyZ3MtPmxheWVyX3N0cmlkZSwgJmJveCwgb2JqcywgZmVuY2UpOwo+
Cj4gV2hhdCBoYXBwZW5zIHdpdGggb2xkIHVzZXJzcGFjZSBydW5uaW5nIG9uIGEgbmV3IGtlcm5l
bD8KPgo+IEkgZG9uJ3QgdGhpbmsgd2UgY2FuIHNpbXBseSB1c2UgdGhlIGFyZ3MgaGVyZSB3aXRo
b3V0IGNoZWNraW5nIHdlCj4gYWN0dWFsbHkgZ290IHNvbWV0aGluZyBmcm9tIHVzZXJzcGFjZSAu
Li4KPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvdWFwaS9kcm0vdmlydGdwdV9kcm0uaCBiL2lu
Y2x1ZGUvdWFwaS9kcm0vdmlydGdwdV9kcm0uaAo+ID4gaW5kZXggZjA2YTc4OWYzNGNkLi5iMmZj
OTJjM2QyYmUgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3VhcGkvZHJtL3ZpcnRncHVfZHJtLmgK
PiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9kcm0vdmlydGdwdV9kcm0uaAo+ID4gQEAgLTExNyw2ICsx
MTcsOCBAQCBzdHJ1Y3QgZHJtX3ZpcnRncHVfM2RfdHJhbnNmZXJfdG9faG9zdCB7Cj4gPiAgICAg
ICBzdHJ1Y3QgZHJtX3ZpcnRncHVfM2RfYm94IGJveDsKPiA+ICAgICAgIF9fdTMyIGxldmVsOwo+
ID4gICAgICAgX191MzIgb2Zmc2V0Owo+ID4gKyAgICAgX191MzIgc3RyaWRlOwo+ID4gKyAgICAg
X191MzIgbGF5ZXJfc3RyaWRlOwo+ID4gIH07Cj4KPiBjaGVlcnMsCj4gICBHZXJkCj4KX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
