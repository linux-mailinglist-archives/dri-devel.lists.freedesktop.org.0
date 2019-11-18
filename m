Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D47E5101AFE
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2019 09:06:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC766EBED;
	Tue, 19 Nov 2019 08:04:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26D1D89E5B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2019 12:27:31 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 755BEB9B4AEEF483D0EE;
 Mon, 18 Nov 2019 20:27:29 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Mon, 18 Nov 2019
 20:27:22 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <mripard@kernel.org>, <wens@csie.org>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH 3/5] drm/sun4i: Use PTR_ERR_OR_ZERO() to simplify code in
 sun4i_dclk_create
Date: Mon, 18 Nov 2019 20:34:42 +0800
Message-ID: <1574080484-48744-4-git-send-email-zhengbin13@huawei.com>
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

Rml4ZXMgY29jY2ljaGVjayB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2Rv
dGNsb2NrLmM6MTk0OjEtMzogV0FSTklORzogUFRSX0VSUl9PUl9aRVJPIGNhbiBiZSB1c2VkCgpS
ZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6
IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjRpX2RvdGNsb2NrLmMgfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3N1bjRp
L3N1bjRpX2RvdGNsb2NrLmMgYi9kcml2ZXJzL2dwdS9kcm0vc3VuNGkvc3VuNGlfZG90Y2xvY2su
YwppbmRleCA0MTdhZGUzZC4uYjRkYjM2YyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3N1
bjRpL3N1bjRpX2RvdGNsb2NrLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3N1bjRpL3N1bjRpX2Rv
dGNsb2NrLmMKQEAgLTE5MSwxMCArMTkxLDcgQEAgaW50IHN1bjRpX2RjbGtfY3JlYXRlKHN0cnVj
dCBkZXZpY2UgKmRldiwgc3RydWN0IHN1bjRpX3Rjb24gKnRjb24pCiAJZGNsay0+aHcuaW5pdCA9
ICZpbml0OwoKIAl0Y29uLT5kY2xrID0gY2xrX3JlZ2lzdGVyKGRldiwgJmRjbGstPmh3KTsKLQlp
ZiAoSVNfRVJSKHRjb24tPmRjbGspKQotCQlyZXR1cm4gUFRSX0VSUih0Y29uLT5kY2xrKTsKLQot
CXJldHVybiAwOworCXJldHVybiBQVFJfRVJSX09SX1pFUk8odGNvbi0+ZGNsayk7CiB9CiBFWFBP
UlRfU1lNQk9MKHN1bjRpX2RjbGtfY3JlYXRlKTsKCi0tCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
