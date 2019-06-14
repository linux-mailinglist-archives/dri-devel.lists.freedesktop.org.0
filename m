Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88DA4750C
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jun 2019 16:03:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C521892A1;
	Sun, 16 Jun 2019 14:02:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3225C89A77
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2019 15:36:51 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CEE5175455AD766310F0;
 Fri, 14 Jun 2019 23:36:42 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Fri, 14 Jun 2019
 23:36:32 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <a.hajda@samsung.com>, <Laurent.pinchart@ideasonboard.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <jsarha@ti.com>
Subject: [PATCH -next] drm/bridge: sii902x: Make sii902x_audio_digital_mute
 static
Date: Fri, 14 Jun 2019 23:36:23 +0800
Message-ID: <20190614153623.28708-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 16 Jun 2019 14:01:48 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmM6NjY1
OjU6IHdhcm5pbmc6CiBzeW1ib2wgJ3NpaTkwMnhfYXVkaW9fZGlnaXRhbF9tdXRlJyB3YXMgbm90
IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3Qg
PGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5n
QGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMgfCAzICsr
LQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJt
L2JyaWRnZS9zaWk5MDJ4LmMKaW5kZXggZGQ3YWE0Ni4uYzJmOTdlNSAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9zaWk5MDJ4LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRn
ZS9zaWk5MDJ4LmMKQEAgLTY2Miw3ICs2NjIsOCBAQCBzdGF0aWMgdm9pZCBzaWk5MDJ4X2F1ZGlv
X3NodXRkb3duKHN0cnVjdCBkZXZpY2UgKmRldiwgdm9pZCAqZGF0YSkKIAljbGtfZGlzYWJsZV91
bnByZXBhcmUoc2lpOTAyeC0+YXVkaW8ubWNsayk7CiB9CiAKLWludCBzaWk5MDJ4X2F1ZGlvX2Rp
Z2l0YWxfbXV0ZShzdHJ1Y3QgZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsIGJvb2wgZW5hYmxlKQor
c3RhdGljIGludCBzaWk5MDJ4X2F1ZGlvX2RpZ2l0YWxfbXV0ZShzdHJ1Y3QgZGV2aWNlICpkZXYs
CisJCQkJICAgICAgdm9pZCAqZGF0YSwgYm9vbCBlbmFibGUpCiB7CiAJc3RydWN0IHNpaTkwMngg
KnNpaTkwMnggPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKIAotLSAKMi43LjQKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBs
aXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
