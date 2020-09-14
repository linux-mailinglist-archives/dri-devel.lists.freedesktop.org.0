Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414802699D2
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 01:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57E1B6E81F;
	Mon, 14 Sep 2020 23:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 275306E81F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:40:40 +0000 (UTC)
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BA36221D41
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 23:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600126840;
 bh=7YxhV2xZvx6nrVGCgI8yLCt9xE01+z6rpckv6HeDiOE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=F5kaa6bDRZsnqgJGDMMmyNFrKwzGHueqBd6WRKMgYu9urtYGZwverk0IH0Rhg7VEB
 rH8RmZ+WayMCTXd+FI77zXckVabDIWc6xRMn4rIKVV+WOc6d1tKVajNp1PuCl+KMAU
 CQf0DVw7gP2BTeslaKe2/Fqfk4CW/GcaYQqM9fdY=
Received: by mail-ed1-f53.google.com with SMTP id n13so1216560edo.10
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 16:40:39 -0700 (PDT)
X-Gm-Message-State: AOAM530E8br4DGqw+3JFswXkrtC/UxyCnT7njBVE7P/fR/KgW665FHJA
 hcrBXIonL1EbDCsd1rXafmF6dD7+pZ4ImF1log==
X-Google-Smtp-Source: ABdhPJy5v5jvk9nSph1QBw9pjsPnW7VLL4rfeN5p0mGA8rEDQJvTN+DhAO3VLkzSupQ7VClzUOPWvQWNgPXdD9WbwZ0=
X-Received: by 2002:a50:cbc7:: with SMTP id l7mr19619839edi.148.1600126838289; 
 Mon, 14 Sep 2020 16:40:38 -0700 (PDT)
MIME-Version: 1.0
References: <20200911112119.3218073-1-yukuai3@huawei.com>
In-Reply-To: <20200911112119.3218073-1-yukuai3@huawei.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Tue, 15 Sep 2020 07:40:28 +0800
X-Gmail-Original-Message-ID: <CAAOTY__776k8oZRH-DEEO1JZx6Sf0vDMjPVDDXkFH=51nQvJBg@mail.gmail.com>
Message-ID: <CAAOTY__776k8oZRH-DEEO1JZx6Sf0vDMjPVDDXkFH=51nQvJBg@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: add missing put_device() call in
 mtk_drm_kms_init()
To: Yu Kuai <yukuai3@huawei.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, yi.zhang@huawei.com,
 David Airlie <airlied@linux.ie>, linux-kernel <linux-kernel@vger.kernel.org>,
 littlecvr@chromium.org,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFl1IEt1YWk6CgpZdSBLdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+IOaWvCAyMDIw5bm0Oeac
iDEx5pelIOmAseS6lCDkuIvljYg3OjIy5a+r6YGT77yaCj4KPiBpZiBvZl9maW5kX2RldmljZV9i
eV9ub2RlKCkgc3VjY2VlZCwgbXRrX2RybV9rbXNfaW5pdCgpIGRvZXNuJ3QgaGF2ZQo+IGEgY29y
cmVzcG9uZGluZyBwdXRfZGV2aWNlKCkuIFRodXMgYWRkIGp1bXAgdGFyZ2V0IHRvIGZpeCB0aGUg
ZXhjZXB0aW9uCj4gaGFuZGxpbmcgZm9yIHRoaXMgZnVuY3Rpb24gaW1wbGVtZW50YXRpb24uCgpS
ZXZpZXdlZC1ieTogQ2h1bi1LdWFuZyBIdSA8Y2h1bmt1YW5nLmh1QGtlcm5lbC5vcmc+Cgo+Cj4g
Rml4ZXM6IDExOWY1MTczNjI4YSAoImRybS9tZWRpYXRlazogQWRkIERSTSBEcml2ZXIgZm9yIE1l
ZGlhdGVrIFNvQyBNVDgxNzMuIikKPiBTaWduZWQtb2ZmLWJ5OiBZdSBLdWFpIDx5dWt1YWkzQGh1
YXdlaS5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5j
IHwgMTEgKysrKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgNCBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRr
X2RybV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jCj4gaW5k
ZXggMDQwYThmMzkzZmUyLi43YWNlYWNlOTRlYmYgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0
ZWsvbXRrX2RybV9kcnYuYwo+IEBAIC0xNjUsNyArMTY1LDcgQEAgc3RhdGljIGludCBtdGtfZHJt
X2ttc19pbml0KHN0cnVjdCBkcm1fZGV2aWNlICpkcm0pCj4KPiAgICAgICAgIHJldCA9IGRybW1f
bW9kZV9jb25maWdfaW5pdChkcm0pOwo+ICAgICAgICAgaWYgKHJldCkKPiAtICAgICAgICAgICAg
ICAgcmV0dXJuIHJldDsKPiArICAgICAgICAgICAgICAgZ290byBwdXRfbXV0ZXhfZGV2Owo+Cj4g
ICAgICAgICBkcm0tPm1vZGVfY29uZmlnLm1pbl93aWR0aCA9IDY0Owo+ICAgICAgICAgZHJtLT5t
b2RlX2NvbmZpZy5taW5faGVpZ2h0ID0gNjQ7Cj4gQEAgLTE4Miw3ICsxODIsNyBAQCBzdGF0aWMg
aW50IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPgo+ICAgICAgICAg
cmV0ID0gY29tcG9uZW50X2JpbmRfYWxsKGRybS0+ZGV2LCBkcm0pOwo+ICAgICAgICAgaWYgKHJl
dCkKPiAtICAgICAgICAgICAgICAgcmV0dXJuIHJldDsKPiArICAgICAgICAgICAgICAgZ290byBw
dXRfbXV0ZXhfZGV2Owo+Cj4gICAgICAgICAvKgo+ICAgICAgICAgICogV2UgY3VycmVudGx5IHN1
cHBvcnQgdHdvIGZpeGVkIGRhdGEgc3RyZWFtcywgZWFjaCBvcHRpb25hbCwKPiBAQCAtMjI5LDcg
KzIyOSw3IEBAIHN0YXRpYyBpbnQgbXRrX2RybV9rbXNfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAq
ZHJtKQo+ICAgICAgICAgfQo+ICAgICAgICAgaWYgKCFkbWFfZGV2LT5kbWFfcGFybXMpIHsKPiAg
ICAgICAgICAgICAgICAgcmV0ID0gLUVOT01FTTsKPiAtICAgICAgICAgICAgICAgZ290byBlcnJf
Y29tcG9uZW50X3VuYmluZDsKPiArICAgICAgICAgICAgICAgZ290byBwdXRfZG1hX2RldjsKPiAg
ICAgICAgIH0KPgo+ICAgICAgICAgcmV0ID0gZG1hX3NldF9tYXhfc2VnX3NpemUoZG1hX2Rldiwg
KHVuc2lnbmVkIGludClETUFfQklUX01BU0soMzIpKTsKPiBAQCAtMjU2LDkgKzI1NiwxMiBAQCBz
dGF0aWMgaW50IG10a19kcm1fa21zX2luaXQoc3RydWN0IGRybV9kZXZpY2UgKmRybSkKPiAgZXJy
X3Vuc2V0X2RtYV9wYXJtczoKPiAgICAgICAgIGlmIChwcml2YXRlLT5kbWFfcGFybXNfYWxsb2Nh
dGVkKQo+ICAgICAgICAgICAgICAgICBkbWFfZGV2LT5kbWFfcGFybXMgPSBOVUxMOwo+ICtwdXRf
ZG1hX2RldjoKPiArICAgICAgIHB1dF9kZXZpY2UocHJpdmF0ZS0+ZG1hX2Rldik7Cj4gIGVycl9j
b21wb25lbnRfdW5iaW5kOgo+ICAgICAgICAgY29tcG9uZW50X3VuYmluZF9hbGwoZHJtLT5kZXYs
IGRybSk7Cj4gLQo+ICtwdXRfbXV0ZXhfZGV2Ogo+ICsgICAgICAgcHV0X2RldmljZShwcml2YXRl
LT5tdXRleF9kZXYpOwo+ICAgICAgICAgcmV0dXJuIHJldDsKPiAgfQo+Cj4gLS0KPiAyLjI1LjQK
PgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2
ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
