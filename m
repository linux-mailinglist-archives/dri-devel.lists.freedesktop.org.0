Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A39B92B5330
	for <lists+dri-devel@lfdr.de>; Mon, 16 Nov 2020 21:50:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 984CE89BB3;
	Mon, 16 Nov 2020 20:50:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 672CB89FF6;
 Mon, 16 Nov 2020 20:50:17 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id m6so3118200wrg.7;
 Mon, 16 Nov 2020 12:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=0+p+lwTAkx0WkxKPZ4xVckDZCPwAFxnOPzsImUi2cyA=;
 b=GUGSBhgLZOtfL7rQYotQSp6ZL/vNWyg8KehLOStBKNbuGO/dmM4FIk77geFIddKKvd
 hGBs5gSjUtjGn6Qw+pRAQnfcXgs3kqH2CvwFamtuwrAdSa24sy3TONWME4QfZgs/y/M2
 wPagNgwv6qhjOD9mFu5TWSoeg2YMqVZq9xV4O8EVKQwRrKkVVzim/FqCQHz5gMw8ySzk
 G8NffHdg/f2O0ekrXOP9GsmQFdre6/7aqlvk+4eSbbpEJb0N5BxaoFk9K8QVOBPmJbr+
 f1vjp+hibBADcSzqP/FuJsmiLuGYmiAtQ6D1iXCdKCu/DhzM48WzK6xtpyAYbzq0mXcr
 B9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0+p+lwTAkx0WkxKPZ4xVckDZCPwAFxnOPzsImUi2cyA=;
 b=YDXymF2RuF0md8dJ+SGpi1u6f594CUginp14oDaQirhecf5XzINXj85TVNMniJJRvt
 V1ZRjQvwFpYoO5B23yyq6JIFoeS2w7giSgOujdsRh7TMu4QfXqq1aQIy410kqzlmCM4y
 PRvpHGseZvn8RcUo4+aB5YYhZRieTn28c7cM9NsWZmqVz9bR8fjWkzN78sy/Y9jFCc3Q
 j4ZEozLnWZYUTx5NSLdJx7S2HA4t6eCzflO2QEs5Xgl9BDf2C7hO1bwkd9n+4bRihADQ
 lQz3hYhkrcN6Z7n5clduakB1uO2bbid4nVWtezAFrFw+tKbCToalI861Cp3yZsv5iyNB
 Bxuw==
X-Gm-Message-State: AOAM530AN+P58axpZFhgQbOfEtJWz0t0ggOa8JSilX5m7YpM5JhJRuEP
 b8ewJegkR5Ch6OPW3JIxOxcOGs15RGBjzPnVkKw=
X-Google-Smtp-Source: ABdhPJxwnuvWeaJotgk7P7QCmD0P5Avbs5HEAHeBcaRXxSdZpoy3y5G0ow1/CdAi0vXkticNqq2Y70MbrvPjFOxooX0=
X-Received: by 2002:adf:9144:: with SMTP id j62mr4657270wrj.419.1605559816179; 
 Mon, 16 Nov 2020 12:50:16 -0800 (PST)
MIME-Version: 1.0
References: <20201116173700.1830487-1-lee.jones@linaro.org>
 <20201116173700.1830487-44-lee.jones@linaro.org>
In-Reply-To: <20201116173700.1830487-44-lee.jones@linaro.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 16 Nov 2020 15:50:05 -0500
Message-ID: <CADnq5_M64-_VQKUmBCusCreZgPAoyW8-oM3S+Hf66iH151c2GQ@mail.gmail.com>
Subject: Re: [PATCH 43/43] drm/radeon/radeon_drv: Move
 'radeon_gem_prime_import_sg_table()'s prototype to shared header
To: Lee Jones <lee.jones@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Gareth Hughes <gareth@valinux.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gTW9uLCBOb3YgMTYsIDIwMjAgYXQgMTI6MzggUE0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5jOjQz
OjI0OiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHJhZGVvbl9nZW1fcHJp
bWVfaW1wb3J0X3NnX3RhYmxl4oCZIFstV21pc3NpbmctcHJvdG90eXBlc10KPiAgNDMgfCBzdHJ1
Y3QgZHJtX2dlbV9vYmplY3QgKnJhZGVvbl9nZW1fcHJpbWVfaW1wb3J0X3NnX3RhYmxlKHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsCj4gIHwgXn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+fn4K
Pgo+IENjOiBBbGV4IERldWNoZXIgPGFsZXhhbmRlci5kZXVjaGVyQGFtZC5jb20+Cj4gQ2M6ICJD
aHJpc3RpYW4gS8O2bmlnIiA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgo+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiBDYzogR2FyZXRoIEh1Z2hlcyA8Z2FyZXRoQHZhbGludXguY29tPgo+IENjOiBhbWQt
Z2Z4QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCj4gU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxsZWUuam9uZXNAbGluYXJvLm9yZz4K
CkFwcGxpZWQuICBUaGFua3MhCgpBbGV4Cgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vcmFkZW9u
L3JhZGVvbl9kcnYuYyAgIHwgNCArLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X3ByaW1lLmggfCAzICsrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVv
bl9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2Rydi5jCj4gaW5kZXggMjEx
OTMyZDczYjE5MS4uN2EwOTg5YjM5N2RhMSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
cmFkZW9uL3JhZGVvbl9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2Rydi5jCj4gQEAgLTU1LDYgKzU1LDcgQEAKPiAgI2luY2x1ZGUgInJhZGVvbl90dG0uaCIKPiAg
I2luY2x1ZGUgInJhZGVvbi5oIgo+ICAjaW5jbHVkZSAicmFkZW9uX2RldmljZS5oIgo+ICsjaW5j
bHVkZSAicmFkZW9uX3ByaW1lLmgiCj4KPiAgLyoKPiAgICogS01TIHdyYXBwZXIuCj4gQEAgLTEy
OSw5ICsxMzAsNiBAQCBpbnQgcmFkZW9uX21vZGVfZHVtYl9tbWFwKHN0cnVjdCBkcm1fZmlsZSAq
ZmlscCwKPiAgaW50IHJhZGVvbl9tb2RlX2R1bWJfY3JlYXRlKHN0cnVjdCBkcm1fZmlsZSAqZmls
ZV9wcml2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX2RldmljZSAq
ZGV2LAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZHJtX21vZGVfY3JlYXRl
X2R1bWIgKmFyZ3MpOwo+IC1zdHJ1Y3QgZHJtX2dlbV9vYmplY3QgKnJhZGVvbl9nZW1fcHJpbWVf
aW1wb3J0X3NnX3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gLSAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBzdHJ1Y3QgZG1hX2J1Zl9h
dHRhY2htZW50ICosCj4gLSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICBzdHJ1Y3Qgc2dfdGFibGUgKnNnKTsKPgo+ICAvKiBhdHB4IGhhbmRsZXIg
Ki8KPiAgI2lmIGRlZmluZWQoQ09ORklHX1ZHQV9TV0lUQ0hFUk9PKQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9wcmltZS5oIGIvZHJpdmVycy9ncHUvZHJtL3Jh
ZGVvbi9yYWRlb25fcHJpbWUuaAo+IGluZGV4IDExYjdmODA5ODc4MzQuLjI0ZGRmZDRiNDhhNmQg
MTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fcHJpbWUuaAo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX3ByaW1lLmgKPiBAQCAtMzUsNSArMzUs
OCBAQCBpbnQgcmFkZW9uX2dlbV9wcmltZV9waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpvYmop
Owo+ICB2b2lkIHJhZGVvbl9nZW1fcHJpbWVfdW5waW4oc3RydWN0IGRybV9nZW1fb2JqZWN0ICpv
YmopOwo+ICB2b2lkICpyYWRlb25fZ2VtX3ByaW1lX3ZtYXAoc3RydWN0IGRybV9nZW1fb2JqZWN0
ICpvYmopOwo+ICB2b2lkIHJhZGVvbl9nZW1fcHJpbWVfdnVubWFwKHN0cnVjdCBkcm1fZ2VtX29i
amVjdCAqb2JqLCB2b2lkICp2YWRkcik7Cj4gK3N0cnVjdCBkcm1fZ2VtX29iamVjdCAqcmFkZW9u
X2dlbV9wcmltZV9pbXBvcnRfc2dfdGFibGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwKPiArICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVj
dCBkbWFfYnVmX2F0dGFjaG1lbnQgKiwKPiArICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCBzZ190YWJsZSAqc2cpOwo+Cj4gICNlbmRp
ZiAgICAgICAgICAgICAgICAgICAgICAgICAvKiBfX1JBREVPTl9QUklNRV9IX18gKi8KPiAtLQo+
IDIuMjUuMQo+Cj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KPiBkcmktZGV2ZWwgbWFpbGluZyBsaXN0Cj4gZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
