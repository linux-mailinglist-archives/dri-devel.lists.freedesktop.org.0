Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AECB3D6FEC
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 09:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD7A46E605;
	Tue, 15 Oct 2019 07:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF906E124
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 07:44:23 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 81F729852E26A585A6E0;
 Mon, 14 Oct 2019 15:44:18 +0800 (CST)
Received: from localhost.localdomain (10.67.212.132) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.439.0; Mon, 14 Oct 2019 15:44:12 +0800
From: Shaokun Zhang <zhangshaokun@hisilicon.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH -next] drm/dp-mst: Fix unused variable warning
Date: Mon, 14 Oct 2019 15:41:20 +0800
Message-ID: <1571038880-22019-1-git-send-email-zhangshaokun@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Fixes: 83fa9842afe7 ("drm/dp-mst: Drop connection_mutex check")
Signed-off-by: Shaokun Zhang <zhangshaokun@hisilicon.com>
X-Originating-IP: [10.67.212.132]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 15 Oct 2019 07:12:31 +0000
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
Cc: Shaokun Zhang <zhangshaokun@hisilicon.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMgYi9kcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDkzNjRlNGY0Mjk3NS4uOWNj
Y2M1ZTYzMzA5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9n
eS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKQEAgLTQxODQs
OCArNDE4NCw2IEBAIEVYUE9SVF9TWU1CT0woZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZV9mdW5j
cyk7CiBzdHJ1Y3QgZHJtX2RwX21zdF90b3BvbG9neV9zdGF0ZSAqZHJtX2F0b21pY19nZXRfbXN0
X3RvcG9sb2d5X3N0YXRlKHN0cnVjdCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZSwKIAkJCQkJCQkJ
ICAgIHN0cnVjdCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyKQogewotCXN0cnVjdCBkcm1f
ZGV2aWNlICpkZXYgPSBtZ3ItPmRldjsKLQogCXJldHVybiB0b19kcF9tc3RfdG9wb2xvZ3lfc3Rh
dGUoZHJtX2F0b21pY19nZXRfcHJpdmF0ZV9vYmpfc3RhdGUoc3RhdGUsICZtZ3ItPmJhc2UpKTsK
IH0KIEVYUE9SVF9TWU1CT0woZHJtX2F0b21pY19nZXRfbXN0X3RvcG9sb2d5X3N0YXRlKTsKLS0g
CjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
