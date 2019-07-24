Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21424723FE
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 03:49:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 560BB6E41A;
	Wed, 24 Jul 2019 01:49:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [210.61.82.183])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92C689388
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jul 2019 01:49:21 +0000 (UTC)
X-UUID: 517c04dad5a54f7aa85127aa0890d8b9-20190724
X-UUID: 517c04dad5a54f7aa85127aa0890d8b9-20190724
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (mhqrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1467029798; Wed, 24 Jul 2019 09:49:16 +0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n1.mediatek.inc (172.21.101.77) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Wed, 24 Jul 2019 09:49:15 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Wed, 24 Jul 2019 09:49:15 +0800
Message-ID: <1563932955.26104.0.camel@mtksdaap41>
Subject: Re: [PATCH -next] drm/mediatek: Remove duplicated include from
 mtk_drm_drv.c
From: CK Hu <ck.hu@mediatek.com>
To: YueHaibing <yuehaibing@huawei.com>
Date: Wed, 24 Jul 2019 09:49:15 +0800
In-Reply-To: <20190724013348.153144-1-yuehaibing@huawei.com>
References: <20190724013348.153144-1-yuehaibing@huawei.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFl1ZUhhaWJpbmc6CgpPbiBXZWQsIDIwMTktMDctMjQgYXQgMDE6MzMgKzAwMDAsIFl1ZUhh
aWJpbmcgd3JvdGU6Cj4gUmVtb3ZlIGR1cGxpY2F0ZWQgaW5jbHVkZS4KPiAKPiBTaWduZWQtb2Zm
LWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+CgpSZXZpZXdlZC1ieTogQ0sg
SHUgPGNrLmh1QG1lZGlhdGVrLmNvbT4KCj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9tZWRpYXRl
ay9tdGtfZHJtX2Rydi5jIHwgMSAtCj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCj4g
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Rydi5jIGIv
ZHJpdmVycy9ncHUvZHJtL21lZGlhdGVrL210a19kcm1fZHJ2LmMKPiBpbmRleCAyZWU4MDlhNmYz
ZGMuLmUzYjY0YTI2NmRjZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbWVkaWF0ZWsv
bXRrX2RybV9kcnYuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9tZWRpYXRlay9tdGtfZHJtX2Ry
di5jCj4gQEAgLTIzLDcgKzIzLDYgQEAKPiAgCj4gICNpbmNsdWRlICJtdGtfZHJtX2NydGMuaCIK
PiAgI2luY2x1ZGUgIm10a19kcm1fZGRwLmgiCj4gLSNpbmNsdWRlICJtdGtfZHJtX2RkcC5oIgo+
ICAjaW5jbHVkZSAibXRrX2RybV9kZHBfY29tcC5oIgo+ICAjaW5jbHVkZSAibXRrX2RybV9kcnYu
aCIKPiAgI2luY2x1ZGUgIm10a19kcm1fZmIuaCIKPiAKPiAKPiAKPiAKPiAKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
