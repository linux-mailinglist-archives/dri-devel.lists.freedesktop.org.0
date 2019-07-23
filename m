Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 969FF71F9B
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jul 2019 20:50:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69C96E394;
	Tue, 23 Jul 2019 18:50:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8830F6E393;
 Tue, 23 Jul 2019 18:50:08 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id p74so39507276wme.4;
 Tue, 23 Jul 2019 11:50:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CN2tNXbOxjbGVP/EEYoEmk5JyHi0LtwAS7W9SVzRNG0=;
 b=QogOdqBLg5DT/16/fgo1qUrxR+MjjPnP4fsDtCJ4MH/LO8lrMYKL9iwKm00ZEYnEcM
 YvixkEV3ekb8CRumu0wJK5PgSXxif1Ude406pTsvELKpSAGDWuxM+K/k6tMhUwcEyF7r
 VFQ0kZy3EwB7UT6Rs1fKJbfkel0b8eo3zBWH04fMqSayK/xsfwKea3DU0gNtqv3GSdZq
 goWkbK1wkkSYdKZd7qtmWX14KLwmHkYGC7zZOmjIhAHInPeR5VfAz8TcrnNUqze7ndr/
 BqW9RgBVOksjZFXZhv8cbuLixTgt3vFqp37ubJnyr9Xs4OqakEPPw8jTyAjEGtSG5fIx
 U0OQ==
X-Gm-Message-State: APjAAAUjXu2iJ2rR6dPS0T1apnvhp1bP2tUfTKYHBo930sSoamas2Ubl
 fJpHdK6xpqvalMAYI3aCsphMnTEiLZ+m0M5C1kc=
X-Google-Smtp-Source: APXvYqyF2orFVVIC2XK+vfV7OwNetJLVQX8lPzD2VkkTWWNfz0kNi6p3M8QDQi8vD79GXJc8LC3AdHGkATw0J3Ub3mE=
X-Received: by 2002:a1c:67c3:: with SMTP id b186mr66210938wmc.34.1563907807023; 
 Tue, 23 Jul 2019 11:50:07 -0700 (PDT)
MIME-Version: 1.0
References: <20190723111008.10955-1-hslester96@gmail.com>
In-Reply-To: <20190723111008.10955-1-hslester96@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 23 Jul 2019 14:49:55 -0400
Message-ID: <CADnq5_O3R1KFRZK3CSKbNNzwYH+qkNSX_icb678KRJ0Ak+UTLg@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Use dev_get_drvdata where possible
To: Chuhong Yuan <hslester96@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=CN2tNXbOxjbGVP/EEYoEmk5JyHi0LtwAS7W9SVzRNG0=;
 b=KAXU6pu0tAbxDMLV1cJDWvfmDYD8RIG2WS3SfSd5DPuUuu8GNdjCctsnUg1uif5Fyo
 ZYz30/FBDWDBLLO3QC/qK/PdfZUwzWXdCpslxmR/sefWX9AEws38Qp228HuYG6g5KwPU
 +jj5uwlD6rLl2yV5JQMVmWjBEtqmrieVliTkLCNp1kgEuqS2ov6VOW03XdOJqrbnSqfR
 98eKhk5xrHpzMBs+fNlJllfa1LgL/yz+nDT8Y/0dkC0SBZwtgip2TbGkZ3h0Vivg95ow
 BZdXTOla2IkdQbzWuMyg1e0Exnjv1RnYJDCGtjND7ZLdExg/mhAoWx560qkZg7ISvStE
 zxyQ==
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgOTozNiBBTSBDaHVob25nIFl1YW4gPGhzbGVzdGVyOTZA
Z21haWwuY29tPiB3cm90ZToKPgo+IEluc3RlYWQgb2YgdXNpbmcgdG9fcGNpX2RldiArIHBjaV9n
ZXRfZHJ2ZGF0YSwKPiB1c2UgZGV2X2dldF9kcnZkYXRhIHRvIG1ha2UgY29kZSBzaW1wbGVyLgo+
Cj4gU2lnbmVkLW9mZi1ieTogQ2h1aG9uZyBZdWFuIDxoc2xlc3Rlcjk2QGdtYWlsLmNvbT4KCkFw
cGxpZWQuICB0aGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3Jh
ZGVvbl9kcnYuYyB8IDE1ICsrKysrLS0tLS0tLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Ry
di5jCj4gaW5kZXggYTZjYmUxMWY3OWM2Li5iMmJiNzRkNWJmZmIgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcnYuYwo+IEBAIC0zNTgsMTUgKzM1OCwxMyBAQCByYWRlb25fcGNpX3No
dXRkb3duKHN0cnVjdCBwY2lfZGV2ICpwZGV2KQo+Cj4gIHN0YXRpYyBpbnQgcmFkZW9uX3Btb3Bz
X3N1c3BlbmQoc3RydWN0IGRldmljZSAqZGV2KQo+ICB7Cj4gLSAgICAgICBzdHJ1Y3QgcGNpX2Rl
diAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsKPiAtICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpk
cm1fZGV2ID0gcGNpX2dldF9kcnZkYXRhKHBkZXYpOwo+ICsgICAgICAgc3RydWN0IGRybV9kZXZp
Y2UgKmRybV9kZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKPiAgICAgICAgIHJldHVybiByYWRl
b25fc3VzcGVuZF9rbXMoZHJtX2RldiwgdHJ1ZSwgdHJ1ZSwgZmFsc2UpOwo+ICB9Cj4KPiAgc3Rh
dGljIGludCByYWRlb25fcG1vcHNfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKPiAgewo+IC0g
ICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0b19wY2lfZGV2KGRldik7Cj4gLSAgICAgICBz
dHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBjaV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiArICAg
ICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4K
PiAgICAgICAgIC8qIEdQVSBjb21lcyB1cCBlbmFibGVkIGJ5IHRoZSBiaW9zIG9uIHJlc3VtZSAq
Lwo+ICAgICAgICAgaWYgKHJhZGVvbl9pc19weChkcm1fZGV2KSkgewo+IEBAIC0zODAsMTUgKzM3
OCwxMyBAQCBzdGF0aWMgaW50IHJhZGVvbl9wbW9wc19yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2
KQo+Cj4gIHN0YXRpYyBpbnQgcmFkZW9uX3Btb3BzX2ZyZWV6ZShzdHJ1Y3QgZGV2aWNlICpkZXYp
Cj4gIHsKPiAtICAgICAgIHN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOwo+
IC0gICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBwY2lfZ2V0X2RydmRhdGEocGRl
dik7Cj4gKyAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IGRldl9nZXRfZHJ2ZGF0
YShkZXYpOwo+ICAgICAgICAgcmV0dXJuIHJhZGVvbl9zdXNwZW5kX2ttcyhkcm1fZGV2LCBmYWxz
ZSwgdHJ1ZSwgdHJ1ZSk7Cj4gIH0KPgo+ICBzdGF0aWMgaW50IHJhZGVvbl9wbW9wc190aGF3KHN0
cnVjdCBkZXZpY2UgKmRldikKPiAgewo+IC0gICAgICAgc3RydWN0IHBjaV9kZXYgKnBkZXYgPSB0
b19wY2lfZGV2KGRldik7Cj4gLSAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAqZHJtX2RldiA9IHBj
aV9nZXRfZHJ2ZGF0YShwZGV2KTsKPiArICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2
ID0gZGV2X2dldF9kcnZkYXRhKGRldik7Cj4gICAgICAgICByZXR1cm4gcmFkZW9uX3Jlc3VtZV9r
bXMoZHJtX2RldiwgZmFsc2UsIHRydWUpOwo+ICB9Cj4KPiBAQCAtNDQ3LDggKzQ0Myw3IEBAIHN0
YXRpYyBpbnQgcmFkZW9uX3Btb3BzX3J1bnRpbWVfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikK
Pgo+ICBzdGF0aWMgaW50IHJhZGVvbl9wbW9wc19ydW50aW1lX2lkbGUoc3RydWN0IGRldmljZSAq
ZGV2KQo+ICB7Cj4gLSAgICAgICBzdHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2
KTsKPiAtICAgICAgIHN0cnVjdCBkcm1fZGV2aWNlICpkcm1fZGV2ID0gcGNpX2dldF9kcnZkYXRh
KHBkZXYpOwo+ICsgICAgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybV9kZXYgPSBkZXZfZ2V0X2Ry
dmRhdGEoZGV2KTsKPiAgICAgICAgIHN0cnVjdCBkcm1fY3J0YyAqY3J0YzsKPgo+ICAgICAgICAg
aWYgKCFyYWRlb25faXNfcHgoZHJtX2RldikpIHsKPiAtLQo+IDIuMjAuMQo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBhbWQtZ2Z4IG1haWxpbmcg
bGlzdAo+IGFtZC1nZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9hbWQtZ2Z4Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
