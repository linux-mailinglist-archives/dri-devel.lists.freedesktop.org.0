Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E585A253A8E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Aug 2020 01:04:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422FC6EB0D;
	Wed, 26 Aug 2020 23:04:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA4F06EB0D
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 23:03:59 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com
 [209.85.218.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5CF842087C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 23:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1598483039;
 bh=XwRld9s4bWwSDqk7OpTV0iyuBoFpuxzcSD+6/QSrZvM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=MUn7URfhQyTV1VF8JhUC/cDazTURdvZBO9Rga7T98BYIbyOtKnJgA5z4kQss/r4TM
 lzyTXT+Y2Y6WObbuB3pcozz7BXDy7XYQuSpF4AkYuPD3IlBXTOya5ID869/CuP62yP
 Wl3TyDBUf2i9y5GOsPyy3m+B+WIsIrbIZcBxOZaE=
Received: by mail-ej1-f54.google.com with SMTP id b17so5097465ejq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Aug 2020 16:03:59 -0700 (PDT)
X-Gm-Message-State: AOAM533gcrDAFW3FLaddPDU3IjrM7Lbf/RWfudQ+0iauXvXy2XZryPjY
 4j6xg9HZBIFf7cZq8zdRNpHaCgJgvSnqrxO4VQ==
X-Google-Smtp-Source: ABdhPJyg/7oRktjfShagR7wzytYd2W8ziwXzaMzApSrhbBtU/OM2q8Cna8GCDosKqDdIi9fWnzLjClLR0M24ndzIs6Q=
X-Received: by 2002:a17:906:3a41:: with SMTP id
 a1mr17890476ejf.260.1598483037963; 
 Wed, 26 Aug 2020 16:03:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200819025829.57545-1-wanghai38@huawei.com>
 <CAAOTY_8-iB9sg4+-AyFpGACc2pW+ZzsJqUbvgReNcfu5kSX6Qw@mail.gmail.com>
In-Reply-To: <CAAOTY_8-iB9sg4+-AyFpGACc2pW+ZzsJqUbvgReNcfu5kSX6Qw@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Thu, 27 Aug 2020 07:03:46 +0800
X-Gmail-Original-Message-ID: <CAAOTY_9DUUZuZO3Nu+bq-t0SyabRRqwW3B+V=--K_nHJ9sAxMg@mail.gmail.com>
Message-ID: <CAAOTY_9DUUZuZO3Nu+bq-t0SyabRRqwW3B+V=--K_nHJ9sAxMg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/mediatek: remove duplicate include
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Wang Hai <wanghai38@huawei.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFdhbmcgSGFpOgoKQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+IOaW
vCAyMDIw5bm0OOaciDIx5pelIOmAseS6lCDkuIrljYg3OjIz5a+r6YGT77yaCj4KPiBIaSwgV2Fu
ZyBIYWk6Cj4KPiBXYW5nIEhhaSA8d2FuZ2hhaTM4QGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0OOac
iDE55pelIOmAseS4iSDkuIrljYgxMTowMOWvq+mBk++8mgo+ID4KPiA+IFJlbW92ZSBtdGtfZHJt
X2RkcC5oIHdoaWNoIGlzIGluY2x1ZGVkIG1vcmUgdGhhbiBvbmNlCj4gPgo+Cj4gUmV2aWV3ZWQt
Ynk6IENodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPgo+CgpBcHBsaWVkIHRv
IG1lZGlhdGVrLWRybS1maXhlcyBbMV0sIHRoYW5rcy4KClsxXSBodHRwczovL2dpdC5rZXJuZWwu
b3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC9jaHVua3VhbmcuaHUvbGludXguZ2l0L2xvZy8/
aD1tZWRpYXRlay1kcm0tZml4ZXMKClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+ID4gUmVwb3J0ZWQt
Ynk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgo+ID4gU2lnbmVkLW9mZi1ieTogV2Fu
ZyBIYWkgPHdhbmdoYWkzOEBodWF3ZWkuY29tPgo+ID4gLS0tCj4gPiAgZHJpdmVycy9ncHUvZHJt
L21lZGlhdGVrL210a19kcm1fZHJ2LmMgfCAxIC0KPiA+ICAxIGZpbGUgY2hhbmdlZCwgMSBkZWxl
dGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gPiBp
bmRleCAwNDBhOGYzOTNmZTIuLmEzNGZkODA1Y2U2ZCAxMDA2NDQKPiA+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0v
bWVkaWF0ZWsvbXRrX2RybV9kcnYuYwo+ID4gQEAgLTI3LDcgKzI3LDYgQEAKPiA+Cj4gPiAgI2lu
Y2x1ZGUgIm10a19kcm1fY3J0Yy5oIgo+ID4gICNpbmNsdWRlICJtdGtfZHJtX2RkcC5oIgo+ID4g
LSNpbmNsdWRlICJtdGtfZHJtX2RkcC5oIgo+ID4gICNpbmNsdWRlICJtdGtfZHJtX2RkcF9jb21w
LmgiCj4gPiAgI2luY2x1ZGUgIm10a19kcm1fZHJ2LmgiCj4gPiAgI2luY2x1ZGUgIm10a19kcm1f
Z2VtLmgiCj4gPiAtLQo+ID4gMi4xNy4xCj4gPgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
