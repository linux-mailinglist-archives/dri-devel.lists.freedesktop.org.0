Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C2012AD08
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2019 15:33:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC1B389B11;
	Thu, 26 Dec 2019 14:32:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FDA089BD4
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 12:12:53 +0000 (UTC)
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 28C8010A0751C49DFDE7;
 Thu, 26 Dec 2019 20:12:48 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS404-HUB.china.huawei.com
 (10.3.19.204) with Microsoft SMTP Server id 14.3.439.0; Thu, 26 Dec 2019
 20:12:41 +0800
From: yu kuai <yukuai3@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: cdns: remove set but not used variable 'bpp'
Date: Thu, 26 Dec 2019 20:12:07 +0800
Message-ID: <20191226121207.2099-1-yukuai3@huawei.com>
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
cHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jOiBJbiBmdW5jdGlvbgrigJhjZG5zX2RzaV9icmlkZ2Vf
ZW5hYmxl4oCZOgpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2NkbnMtZHNpLmM6Nzg4OjY6IHdhcm5p
bmc6IHZhcmlhYmxlIOKAmGJwcOKAmQpzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQoKSXQgaXMgbmV2ZXIgdXNlZCwgYW5kIHNvIGNhbiBiZSByZW1vdmVkLgoKU2ln
bmVkLW9mZi1ieTogeXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvY2Rucy1kc2kuYyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRp
b24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9jZG5zLWRzaS5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jCmluZGV4IGE2
YWIyZDI4MWE5Yi4uYjdjOTdmMDYwMjQxIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL2NkbnMtZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9jZG5zLWRzaS5jCkBA
IC03ODQsMTMgKzc4NCwxMiBAQCBzdGF0aWMgdm9pZCBjZG5zX2RzaV9icmlkZ2VfZW5hYmxlKHN0
cnVjdCBkcm1fYnJpZGdlICpicmlkZ2UpCiAJdW5zaWduZWQgbG9uZyB0eF9ieXRlX3BlcmlvZDsK
IAlzdHJ1Y3QgY2Ruc19kc2lfY2ZnIGRzaV9jZmc7CiAJdTMyIHRtcCwgcmVnX3dha2V1cCwgZGl2
OwotCWludCBicHAsIG5sYW5lczsKKwlpbnQgbmxhbmVzOwogCiAJaWYgKFdBUk5fT04ocG1fcnVu
dGltZV9nZXRfc3luYyhkc2ktPmJhc2UuZGV2KSA8IDApKQogCQlyZXR1cm47CiAKIAltb2RlID0g
JmJyaWRnZS0+ZW5jb2Rlci0+Y3J0Yy0+c3RhdGUtPmFkanVzdGVkX21vZGU7Ci0JYnBwID0gbWlw
aV9kc2lfcGl4ZWxfZm9ybWF0X3RvX2JwcChvdXRwdXQtPmRldi0+Zm9ybWF0KTsKIAlubGFuZXMg
PSBvdXRwdXQtPmRldi0+bGFuZXM7CiAKIAlXQVJOX09OX09OQ0UoY2Ruc19kc2lfY2hlY2tfY29u
Zihkc2ksIG1vZGUsICZkc2lfY2ZnLCBmYWxzZSkpOwotLSAKMi4xNy4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
