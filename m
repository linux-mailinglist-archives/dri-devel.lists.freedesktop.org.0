Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D1C022C0D7C
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 15:30:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 164CE89ECB;
	Mon, 23 Nov 2020 14:30:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9522589ECB
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:30:41 +0000 (UTC)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0AD3B2083E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 14:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1606141839;
 bh=KLPAvAxVgBh/EfteBChKMiZqtTEU7DgUM7QQy95Ctjw=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Oz5Qll+2GGuPXYNZD0KEIT0+NXyIoujW0YGhpVvWA1FWHd+TCwDjW19QSXMQYNCjI
 xgIjgFoOSb92kD33i7Z5Z3JgOTRU+Wwqxdw7Gum4PfO7n0ZyVXRRRyfLoFDAkKiH/8
 XtPTs+pr8Zn0Locs8zgeHHPmJz6DNzDX4P0WucaU=
Received: by mail-ed1-f52.google.com with SMTP id a15so17313593edy.1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 06:30:38 -0800 (PST)
X-Gm-Message-State: AOAM533oZGbF7Z7U0aIZBDiqRwn4Zz3jnZQr/JBrxtVMLyWkJ1CeNyTZ
 F27lpLfzL8PDU61acaxJ+lBSzK55IGhV1U8KMQ==
X-Google-Smtp-Source: ABdhPJzQPN09/o15bRrKCutv+RWMNNb2GzylRxTOKOSHwYw5WeYSFcIdLyi0ge0oOxLKG1dWvGEHZCmCSdfuKLitYdk=
X-Received: by 2002:a50:f742:: with SMTP id j2mr39313857edn.72.1606141837508; 
 Mon, 23 Nov 2020 06:30:37 -0800 (PST)
MIME-Version: 1.0
References: <20201113134938.4004947-1-lee.jones@linaro.org>
 <20201113134938.4004947-8-lee.jones@linaro.org>
In-Reply-To: <20201113134938.4004947-8-lee.jones@linaro.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Mon, 23 Nov 2020 22:30:25 +0800
X-Gmail-Original-Message-ID: <CAAOTY_90iwNUChw46qeetimRPtA16Ws573sXDo0XaKRgogKVUA@mail.gmail.com>
Message-ID: <CAAOTY_90iwNUChw46qeetimRPtA16Ws573sXDo0XaKRgogKVUA@mail.gmail.com>
Subject: Re: [PATCH 07/40] drm/mediatek/mtk_disp_rdma: Fix formatting and
 supply missing struct member description
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIExlZToKCkxlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+IOaWvCAyMDIw5bm0MTHm
nIgxM+aXpSDpgLHkupQg5LiL5Y2IOTo0OeWvq+mBk++8mgo+Cj4gRml4ZXMgdGhlIGZvbGxvd2lu
ZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6Cj4KPiAgZHJpdmVycy9ncHUvZHJtL21lZGlh
dGVrL210a19kaXNwX3JkbWEuYzo2Njogd2FybmluZzogRnVuY3Rpb24gcGFyYW1ldGVyIG9yIG1l
bWJlciAnZGRwX2NvbXAnIG5vdCBkZXNjcmliZWQgaW4gJ210a19kaXNwX3JkbWEnCj4gIGRyaXZl
cnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmM6NjY6IHdhcm5pbmc6IEZ1bmN0aW9u
IHBhcmFtZXRlciBvciBtZW1iZXIgJ2NydGMnIG5vdCBkZXNjcmliZWQgaW4gJ210a19kaXNwX3Jk
bWEnCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmM6NjY6IHdhcm5p
bmc6IEZ1bmN0aW9uIHBhcmFtZXRlciBvciBtZW1iZXIgJ2RhdGEnIG5vdCBkZXNjcmliZWQgaW4g
J210a19kaXNwX3JkbWEnCj4KCkFwcGxpZWQgdG8gbWVkaWF0ZWstZHJtLW5leHQgWzFdLCB0aGFu
a3MuCgpbMV0gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQv
Y2h1bmt1YW5nLmh1L2xpbnV4LmdpdC9sb2cvP2g9bWVkaWF0ZWstZHJtLW5leHQKClJlZ2FyZHMs
CkNodW4tS3VhbmcuCgo+IENjOiBDaHVuLUt1YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9y
Zz4KPiBDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBwZW5ndXRyb25peC5kZT4KPiBDYzogRGF2
aWQgQWlybGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxA
ZmZ3bGwuY2g+Cj4gQ2M6IE1hdHRoaWFzIEJydWdnZXIgPG1hdHRoaWFzLmJnZ0BnbWFpbC5jb20+
Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbGludXgtYXJtLWtl
cm5lbEBsaXN0cy5pbmZyYWRlYWQub3JnCj4gQ2M6IGxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3Jn
Pgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jIHwgNSAr
KystLQo+ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZGlzcF9yZG1hLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCj4gaW5kZXggZTA0MzE5
ZmVkZjQ2My4uZDQ2YjhhZTFkMDgwMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVk
aWF0ZWsvbXRrX2Rpc3BfcmRtYS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210
a19kaXNwX3JkbWEuYwo+IEBAIC01Niw4ICs1Niw5IEBAIHN0cnVjdCBtdGtfZGlzcF9yZG1hX2Rh
dGEgewo+Cj4gIC8qKgo+ICAgKiBzdHJ1Y3QgbXRrX2Rpc3BfcmRtYSAtIERJU1BfUkRNQSBkcml2
ZXIgc3RydWN0dXJlCj4gLSAqIEBkZHBfY29tcCAtIHN0cnVjdHVyZSBjb250YWluaW5nIHR5cGUg
ZW51bSBhbmQgaGFyZHdhcmUgcmVzb3VyY2VzCj4gLSAqIEBjcnRjIC0gYXNzb2NpYXRlZCBjcnRj
IHRvIHJlcG9ydCBpcnEgZXZlbnRzIHRvCj4gKyAqIEBkZHBfY29tcDogc3RydWN0dXJlIGNvbnRh
aW5pbmcgdHlwZSBlbnVtIGFuZCBoYXJkd2FyZSByZXNvdXJjZXMKPiArICogQGNydGM6IGFzc29j
aWF0ZWQgY3J0YyB0byByZXBvcnQgaXJxIGV2ZW50cyB0bwo+ICsgKiBAZGF0YTogbG9jYWwgZHJp
dmVyIGRhdGEKPiAgICovCj4gIHN0cnVjdCBtdGtfZGlzcF9yZG1hIHsKPiAgICAgICAgIHN0cnVj
dCBtdGtfZGRwX2NvbXAgICAgICAgICAgICAgZGRwX2NvbXA7Cj4gLS0KPiAyLjI1LjEKPgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
