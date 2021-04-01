Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FC92352164
	for <lists+dri-devel@lfdr.de>; Thu,  1 Apr 2021 23:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DA376ED8A;
	Thu,  1 Apr 2021 21:15:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA076ED85;
 Thu,  1 Apr 2021 21:15:40 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 l12-20020a9d6a8c0000b0290238e0f9f0d8so3329222otq.8; 
 Thu, 01 Apr 2021 14:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Mz7i+O/62DXgGIQyQsg18R3Fvz4BySpF9dt5BSlgKK8=;
 b=EvINbiO5R9MEULvTambjfGRw/tggaCs6bGmgVlfnQ7EYfraVpcPhuVPvf15SpEqwIA
 x2SM2sD8JrCgB8leKbD2u0UFdCNZGUD9dXtR+AMaVjMXv8SkVyAlcyxMzmV/dknauBVP
 tUGfa3cSqdGoPDuTn7gXG9rQ1+8XPNYSyftQAebbFF3g0sdC2BFU1k8pz1SsAQYS095Q
 c28dAsQnSKv/OVKqpUbboI6WP5Ye1fCtaNneik0QTYeKgAYF9x3hlKqUqw+fUyWF4upe
 WG/QkSOq/qitsybcG/jGtGzOAOBzgZO0cHVj3WNmL3wZ5qxpw2CO5YnbE/KBi06evgBJ
 7W+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Mz7i+O/62DXgGIQyQsg18R3Fvz4BySpF9dt5BSlgKK8=;
 b=FIffOaz0qFkoeid8naBYzd+/pk8720Fbsm5NK3uwLk3El8j2f13xZUaP0sdvB2jiyI
 3UKAiwNqkkMRKZ0hCDTPDImFJcJ+nQHtCwts9uqznamivvntvKX/URhHQ3Jo1EMkJ3er
 PrQ1p0FKgnbI0fBt+4nly6XJqsJnp2M1eX/AgPESD4q1mtJKJnIW9F8OfTfm61REnsbu
 nT3SSvW/e4vg/O0VtEAR0Iyhm071YTthqdN9jHTwuLqbd773zzal6rFqREnEiADJVeSp
 VvvjRNT38dewhqExC6q1Qz8Qbu+kNldG2bO0yl6EKQC4T8yfkpx1kHCP8Kx297Op7vHw
 KI2A==
X-Gm-Message-State: AOAM533RSyjPCdCHr1OAi24iReaxo3+deCI8A6IX1zFdktzIPqTFDr54
 nPkmQlPdul3bbubq+zv/yeuiMdl0DDNzaHA/cKQ=
X-Google-Smtp-Source: ABdhPJwIGFK9P8QDS7j0r2S0z8pKk2Wh3QtwP8CPlBpqBbniOgq3YXMIAV9/NOXJYPtybSuUj4XTX7uBFCk+yDYZcE8=
X-Received: by 2002:a9d:d89:: with SMTP id 9mr8507614ots.23.1617311739900;
 Thu, 01 Apr 2021 14:15:39 -0700 (PDT)
MIME-Version: 1.0
References: <20201024004706.24518-1-linux@rasmusvillemoes.dk>
 <d09f16d8-528e-2815-8f26-ab85c27b1fea@gmail.com>
In-Reply-To: <d09f16d8-528e-2815-8f26-ab85c27b1fea@gmail.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 1 Apr 2021 17:15:29 -0400
Message-ID: <CADnq5_PLZoz0Ns0i8ur2i6YY1H==g+WRvFJZ6K3EDDvd9Qfmyw@mail.gmail.com>
Subject: Re: [PATCH] drm/ttm: add __user annotation in radeon_ttm_vram_read
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q3VycmVudCBjb2RlIGFscmVhZHkgY29udGFpbnMgdGhlIGZpeC4KCkFsZXgKCgpPbiBUaHUsIEFw
ciAxLCAyMDIxIGF0IDk6MDkgQU0gQ2hyaXN0aWFuIEvDtm5pZwo8Y2tvZW5pZy5sZWljaHR6dW1l
cmtlbkBnbWFpbC5jb20+IHdyb3RlOgo+Cj4gQW0gMjQuMTAuMjAgdW0gMDI6NDcgc2NocmllYiBS
YXNtdXMgVmlsbGVtb2VzOgo+ID4gS2VlcCBzcGFyc2UgaGFwcHkgYnkgcHJlc2VydmluZyB0aGUg
X191c2VyIGFubm90YXRpb24gd2hlbiBjYXN0aW5nLgo+ID4KPiA+IFJlcG9ydGVkLWJ5OiBrZXJu
ZWwgdGVzdCByb2JvdCA8bGtwQGludGVsLmNvbT4KPiA+IFNpZ25lZC1vZmYtYnk6IFJhc211cyBW
aWxsZW1vZXMgPGxpbnV4QHJhc211c3ZpbGxlbW9lcy5kaz4KPgo+IFJldmlld2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Cj4KPiBHb2luZyBvdmVyIG9s
ZCBwYXRjaGVzIGFuZCBzdHVtYmxlZCBvdmVyIHRoYXQgb25jZS4KPgo+IEFsZXggZGlkIHlvdSBt
aXNzZWQgdG8gcGljayBpdCB1cD8KPgo+IFJlZ2FyZHMsCj4gQ2hyaXN0aWFuLgo+Cj4gPiAtLS0K
PiA+Cj4gPiBrZXJuZWwgdGVzdCByb2JvdCBoYXMgYWxyZWFkeSBzdGFydGVkIHNwYW1taW5nIG1l
IGR1ZSB0byA5YzU3NDNkZmYuIElmCj4gPiBJIGRvbid0IGZpeCB0aG9zZSB3YXJuaW5ncyBJJ2xs
IGtlZXAgZ2V0dGluZyB0aG9zZSBlbWFpbHMgZm9yCj4gPiBtb250aHMsIHNvIGxldCBtZSBkbyB0
aGUgZWFzeSBvbmVzLgo+ID4KPiA+Cj4gPiAgIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X3R0bS5jIHwgMiArLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fdHRtLmMgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl90dG0uYwo+ID4gaW5kZXgg
MzYxNTBiN2YzMWE5MGFhMWVlY2UuLmVjZmU4OGIwYTM1ZDhmMzE3NzEyIDEwMDY0NAo+ID4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fdHRtLmMKPiA+ICsrKyBiL2RyaXZlcnMv
Z3B1L2RybS9yYWRlb24vcmFkZW9uX3R0bS5jCj4gPiBAQCAtMTAwNSw3ICsxMDA1LDcgQEAgc3Rh
dGljIHNzaXplX3QgcmFkZW9uX3R0bV92cmFtX3JlYWQoc3RydWN0IGZpbGUgKmYsIGNoYXIgX191
c2VyICpidWYsCj4gPiAgICAgICAgICAgICAgIHZhbHVlID0gUlJFRzMyKFJBREVPTl9NTV9EQVRB
KTsKPiA+ICAgICAgICAgICAgICAgc3Bpbl91bmxvY2tfaXJxcmVzdG9yZSgmcmRldi0+bW1pb19p
ZHhfbG9jaywgZmxhZ3MpOwo+ID4KPiA+IC0gICAgICAgICAgICAgciA9IHB1dF91c2VyKHZhbHVl
LCAodWludDMyX3QgKilidWYpOwo+ID4gKyAgICAgICAgICAgICByID0gcHV0X3VzZXIodmFsdWUs
ICh1aW50MzJfdCBfX3VzZXIgKilidWYpOwo+ID4gICAgICAgICAgICAgICBpZiAocikKPiA+ICAg
ICAgICAgICAgICAgICAgICAgICByZXR1cm4gcjsKPiA+Cj4KPiBfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IGFtZC1nZnggbWFpbGluZyBsaXN0Cj4gYW1k
LWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2FtZC1nZngKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
