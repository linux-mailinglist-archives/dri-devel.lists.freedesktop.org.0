Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96D40101AF8
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:05:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EBEE6EBD2;
	Tue, 19 Nov 2019 08:04:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B7489CF5
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:27:31 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 7A159BDF2B337B1C1BC6;
 Mon, 18 Nov 2019 20:27:29 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:27:22 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 4/5] drm/sun4i: Use PTR_ERR_OR_ZERO() to simplify code in
 sun4i_ddc_create
Date: Mon, 18 Nov 2019 20:34:43 +0800
Message-ID: <1574080484-48744-5-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1574080484-48744-1-git-send-email-zhengbin13@huawei.com>
References: <1574080484-48744-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 19 Nov 2019 08:04:07 +0000
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hk
bWlfZGRjX2Nsay5jOjEzODoxLTM6IFdBUk5JTkc6IFBUUl9FUlJfT1JfWkVSTyBjYW4gYmUgdXNl
ZAoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2Zm
LWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW40aV9oZG1pX2RkY19jbGsuYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuNGlfaGRtaV9kZGNfY2xrLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
NGlfaGRtaV9kZGNfY2xrLmMKaW5kZXggMmZmNzgwMS4uY2Y3ZTQ0MiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2hkbWlfZGRjX2Nsay5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW40aV9oZG1pX2RkY19jbGsuYwpAQCAtMTM1LDggKzEzNSw1IEBAIGludCBz
dW40aV9kZGNfY3JlYXRlKHN0cnVjdCBzdW40aV9oZG1pICpoZG1pLCBzdHJ1Y3QgY2xrICpwYXJl
bnQpCiAJZGRjLT5tX29mZnNldCA9IGhkbWktPnZhcmlhbnQtPmRkY19jbGtfbV9vZmZzZXQ7Cgog
CWhkbWktPmRkY19jbGsgPSBkZXZtX2Nsa19yZWdpc3RlcihoZG1pLT5kZXYsICZkZGMtPmh3KTsK
LQlpZiAoSVNfRVJSKGhkbWktPmRkY19jbGspKQotCQlyZXR1cm4gUFRSX0VSUihoZG1pLT5kZGNf
Y2xrKTsKLQotCXJldHVybiAwOworCXJldHVybiBQVFJfRVJSX09SX1pFUk8oaGRtaS0+ZGRjX2Ns
ayk7CiB9Ci0tCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
