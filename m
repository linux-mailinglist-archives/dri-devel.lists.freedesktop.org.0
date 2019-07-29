Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A797578622
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2019 09:18:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59C589CCE;
	Mon, 29 Jul 2019 07:18:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD1089C3F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 06:54:03 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 57F4BE75CF37FCE21D54;
 Mon, 29 Jul 2019 14:54:01 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019
 14:53:54 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <eric@anholt.net>
Subject: [PATCH] drm/bridge: lvds-encoder: Fix build error while
 CONFIG_DRM_KMS_HELPER=m
Date: Mon, 29 Jul 2019 14:53:44 +0800
Message-ID: <20190729065344.9680-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 29 Jul 2019 07:16:44 +0000
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

SWYgRFJNX0xWRFNfRU5DT0RFUj15IGJ1dCBDT05GSUdfRFJNX0tNU19IRUxQRVI9bSwKYnVpbGQg
ZmFpbHM6Cgpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2x2ZHMtZW5jb2Rlci5vOiBJbiBmdW5jdGlv
biBgbHZkc19lbmNvZGVyX3Byb2JlJzoKbHZkcy1lbmNvZGVyLmM6KC50ZXh0KzB4MTU1KTogdW5k
ZWZpbmVkIHJlZmVyZW5jZSB0byBgZGV2bV9kcm1fcGFuZWxfYnJpZGdlX2FkZCcKZHJpdmVycy9n
cHUvZHJtL2JyaWRnZS90YzM1ODc2NC5vOigucm9kYXRhKzB4MjI4KTogdW5kZWZpbmVkIHJlZmVy
ZW5jZSB0byBgZHJtX2F0b21pY19oZWxwZXJfY29ubmVjdG9yX3Jlc2V0Jwpkcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL3RjMzU4NzY0Lm86KC5yb2RhdGErMHgyNDApOiB1bmRlZmluZWQgcmVmZXJlbmNl
IHRvIGBkcm1faGVscGVyX3Byb2JlX3NpbmdsZV9jb25uZWN0b3JfbW9kZXMnCmRyaXZlcnMvZ3B1
L2RybS9icmlkZ2UvdGMzNTg3NjQubzooLnJvZGF0YSsweDI2OCk6IHVuZGVmaW5lZCByZWZlcmVu
Y2UgdG8gYGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kdXBsaWNhdGVfc3RhdGUnCmRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQubzooLnJvZGF0YSsweDI3MCk6IHVuZGVmaW5lZCBy
ZWZlcmVuY2UgdG8gYGRybV9hdG9taWNfaGVscGVyX2Nvbm5lY3Rvcl9kZXN0cm95X3N0YXRlJwoK
UmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpGaXhlczogZGJiNThi
ZmQ5YWU2IGRybS9icmlkZ2U6ICgiRml4IGx2ZHMtZW5jb2RlciBzaW5jZSB0aGUgcGFuZWxfYnJp
ZGdlIHJld29yay4iKQpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1YXdl
aS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIHwgMSArCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJp
ZGdlL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKaW5kZXggYTZlZWM5
MC4uNzdlNGI5NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZwpAQCAtNDgsNiArNDgsNyBAQCBjb25m
aWcgRFJNX0RVTUJfVkdBX0RBQwogY29uZmlnIERSTV9MVkRTX0VOQ09ERVIKIAl0cmlzdGF0ZSAi
VHJhbnNwYXJlbnQgcGFyYWxsZWwgdG8gTFZEUyBlbmNvZGVyIHN1cHBvcnQiCiAJZGVwZW5kcyBv
biBPRgorCXNlbGVjdCBEUk1fS01TX0hFTFBFUgogCXNlbGVjdCBEUk1fUEFORUxfQlJJREdFCiAJ
aGVscAogCSAgU3VwcG9ydCBmb3IgdHJhbnNwYXJlbnQgcGFyYWxsZWwgdG8gTFZEUyBlbmNvZGVy
cyB0aGF0IGRvbid0IHJlcXVpcmUKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
