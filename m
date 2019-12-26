Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B42E12AD0E
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2019 15:33:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F3689BD4;
	Thu, 26 Dec 2019 14:33:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A45E689BD4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 12:15:01 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 12B0587488DA07FE6DF0;
 Thu, 26 Dec 2019 20:15:00 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Thu, 26 Dec 2019
 20:14:49 +0800
From: yu kuai <yukuai3@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: cdns: remove set but not used variable 'nlanes'
Date: Thu, 26 Dec 2019 20:14:15 +0800
Message-ID: <20191226121415.39483-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 26 Dec 2019 14:32:55 +0000
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
Cc: zhengbin13@huawei.com, yukuai3@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, yi.zhang@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jOiBJbiBmdW5jdGlvbiDigJhjZG5zX2RzaV9tb2RlMmNm
Z+KAmToKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jOjUxNToxMTogd2FybmluZzog
dmFyaWFibGUg4oCYbmxhbmVz4oCZCnNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCgpJdCBpcyBuZXZlciB1c2VkLCBhbmQgc28gY2FuIGJlIHJlbW92ZWQuCgpTaWdu
ZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL2JyaWRnZS9jZG5zLWRzaS5jIHwgMyArLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L2NkbnMtZHNpLmMgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtZHNpLmMKaW5kZXggM2E1
YmQ0ZTdmZDFlLi5hNmFiMmQyODFhOWIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2UvY2Rucy1kc2kuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtZHNpLmMKQEAg
LTUxMiw3ICs1MTIsNyBAQCBzdGF0aWMgaW50IGNkbnNfZHNpX21vZGUyY2ZnKHN0cnVjdCBjZG5z
X2RzaSAqZHNpLAogCXN0cnVjdCBjZG5zX2RzaV9vdXRwdXQgKm91dHB1dCA9ICZkc2ktPm91dHB1
dDsKIAl1bnNpZ25lZCBpbnQgdG1wOwogCWJvb2wgc3luY19wdWxzZSA9IGZhbHNlOwotCWludCBi
cHAsIG5sYW5lczsKKwlpbnQgYnBwOwogCiAJbWVtc2V0KGRzaV9jZmcsIDAsIHNpemVvZigqZHNp
X2NmZykpOwogCkBAIC01MjAsNyArNTIwLDYgQEAgc3RhdGljIGludCBjZG5zX2RzaV9tb2RlMmNm
ZyhzdHJ1Y3QgY2Ruc19kc2kgKmRzaSwKIAkJc3luY19wdWxzZSA9IHRydWU7CiAKIAlicHAgPSBt
aXBpX2RzaV9waXhlbF9mb3JtYXRfdG9fYnBwKG91dHB1dC0+ZGV2LT5mb3JtYXQpOwotCW5sYW5l
cyA9IG91dHB1dC0+ZGV2LT5sYW5lczsKIAogCWlmIChtb2RlX3ZhbGlkX2NoZWNrKQogCQl0bXAg
PSBtb2RlLT5odG90YWwgLQotLSAKMi4xNy4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWwK
