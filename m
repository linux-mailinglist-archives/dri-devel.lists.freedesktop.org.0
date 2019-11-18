Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98BB8101ADF
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:04:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B396EBC8;
	Tue, 19 Nov 2019 08:04:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7110C89E5B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:27:33 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id A318FF52307FB9401DF0;
 Mon, 18 Nov 2019 20:27:29 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:27:23 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 5/5] drm/sun4i: Use PTR_ERR_OR_ZERO() to simplify code in
 sun8i_phy_clk_create
Date: Mon, 18 Nov 2019 20:34:44 +0800
Message-ID: <1574080484-48744-6-git-send-email-zhengbin13@huawei.com>
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

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2hk
bWlfcGh5X2Nsay5jOjE3NDoxLTM6IFdBUk5JTkc6IFBUUl9FUlJfT1JfWkVSTyBjYW4gYmUgdXNl
ZAoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2Zm
LWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9zdW40aS9zdW44aV9oZG1pX3BoeV9jbGsuYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vc3VuNGkvc3VuOGlfaGRtaV9waHlfY2xrLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3Vu
OGlfaGRtaV9waHlfY2xrLmMKaW5kZXggYTRkMzFmZS4uZmIwZDc3ZCAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL3N1bjRpL3N1bjhpX2hkbWlfcGh5X2Nsay5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9zdW40aS9zdW44aV9oZG1pX3BoeV9jbGsuYwpAQCAtMTcxLDggKzE3MSw1IEBAIGludCBz
dW44aV9waHlfY2xrX2NyZWF0ZShzdHJ1Y3Qgc3VuOGlfaGRtaV9waHkgKnBoeSwgc3RydWN0IGRl
dmljZSAqZGV2LAogCXByaXYtPmh3LmluaXQgPSAmaW5pdDsKCiAJcGh5LT5jbGtfcGh5ID0gZGV2
bV9jbGtfcmVnaXN0ZXIoZGV2LCAmcHJpdi0+aHcpOwotCWlmIChJU19FUlIocGh5LT5jbGtfcGh5
KSkKLQkJcmV0dXJuIFBUUl9FUlIocGh5LT5jbGtfcGh5KTsKLQotCXJldHVybiAwOworCXJldHVy
biBQVFJfRVJSX09SX1pFUk8ocGh5LT5jbGtfcGh5KTsKIH0KLS0KMi43LjQKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
