Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C4361DCE53
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2019 20:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FF536EB97;
	Fri, 18 Oct 2019 18:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F3236E086;
 Wed, 16 Oct 2019 11:16:11 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EACCDA952248D822D464;
 Wed, 16 Oct 2019 19:16:04 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Wed, 16 Oct 2019
 19:15:57 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>, <Jun.Lei@amd.com>, <Anthony.Koo@amd.com>,
 <Eric.Yang2@amd.com>, <Wenjing.Liu@amd.com>, <David.Francis@amd.com>,
 <nikola.cornij@amd.com>, <Chris.Park@amd.com>, <martin.leung@amd.com>,
 <david.galiffi@amd.com>
Subject: [PATCH -next] drm/amd/display: Make dc_link_detect_helper static
Date: Wed, 16 Oct 2019 19:15:41 +0800
Message-ID: <20191016111541.20208-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 18 Oct 2019 18:37:46 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9kYy9jb3JlL2RjX2xpbmsuYzo3NDY6NjoKIHdhcm5pbmc6IHN5bWJvbCAnZGNfbGlua19kZXRl
Y3RfaGVscGVyJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKUmVwb3J0
ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBZdWVI
YWliaW5nIDx5dWVoYWliaW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9k
aXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIHwgMyArKy0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkv
ZGMvY29yZS9kY19saW5rLmMKaW5kZXggZmIxODY4MS4uOTM1MDUzNiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jCisrKyBiL2RyaXZlcnMv
Z3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3JlL2RjX2xpbmsuYwpAQCAtNzQzLDcgKzc0Myw4IEBA
IHN0YXRpYyBib29sIHdhaXRfZm9yX2FsdF9tb2RlKHN0cnVjdCBkY19saW5rICpsaW5rKQogICog
VGhpcyBkb2VzIG5vdCBjcmVhdGUgcmVtb3RlIHNpbmtzIGJ1dCB3aWxsIHRyaWdnZXIgRE0KICAq
IHRvIHN0YXJ0IE1TVCBkZXRlY3Rpb24gaWYgYSBicmFuY2ggaXMgZGV0ZWN0ZWQuCiAgKi8KLWJv
b2wgZGNfbGlua19kZXRlY3RfaGVscGVyKHN0cnVjdCBkY19saW5rICpsaW5rLCBlbnVtIGRjX2Rl
dGVjdF9yZWFzb24gcmVhc29uKQorc3RhdGljIGJvb2wgZGNfbGlua19kZXRlY3RfaGVscGVyKHN0
cnVjdCBkY19saW5rICpsaW5rLAorCQkJCSAgZW51bSBkY19kZXRlY3RfcmVhc29uIHJlYXNvbikK
IHsKIAlzdHJ1Y3QgZGNfc2lua19pbml0X2RhdGEgc2lua19pbml0X2RhdGEgPSB7IDAgfTsKIAlz
dHJ1Y3QgZGlzcGxheV9zaW5rX2NhcGFiaWxpdHkgc2lua19jYXBzID0geyAwIH07Ci0tIAoyLjcu
NAoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1k
ZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
