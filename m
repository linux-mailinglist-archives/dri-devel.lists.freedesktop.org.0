Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 816C7F8A37
	for <lists+dri-devel@lfdr.de>; Tue, 12 Nov 2019 09:13:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 708AB6EA5E;
	Tue, 12 Nov 2019 08:13:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (unknown [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AC056E915;
 Mon, 11 Nov 2019 13:34:52 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 312FB89CD03CBF2F7C3C;
 Mon, 11 Nov 2019 21:34:39 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Mon, 11 Nov 2019
 21:34:30 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Bhawanpreet.Lakha@amd.com>, <Jun.Lei@amd.com>, <David.Francis@amd.com>,
 <Dmytro.Laktyushkin@amd.com>, <nicholas.kazlauskas@amd.com>,
 <martin.leung@amd.com>, <Chris.Park@amd.com>
Subject: [PATCH -next] drm/amd/display: Fix old-style declaration
Date: Mon, 11 Nov 2019 20:28:01 +0800
Message-ID: <20191111122801.18584-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 12 Nov 2019 08:13:33 +0000
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

Rml4IGEgYnVpbGQgd2FybmluZzoKCmRyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1Ly4uL2Rpc3Bs
YXkvZGMvY29yZS9kYy5jOjc1OjE6CiB3YXJuaW5nOiAnc3RhdGljJyBpcyBub3QgYXQgYmVnaW5u
aW5nIG9mIGRlY2xhcmF0aW9uIFstV29sZC1zdHlsZS1kZWNsYXJhdGlvbl0KClNpZ25lZC1vZmYt
Ynk6IFl1ZUhhaWJpbmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kYy5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5z
ZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2Ft
ZC9kaXNwbGF5L2RjL2NvcmUvZGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9j
b3JlL2RjLmMKaW5kZXggMWZkYmExMy4uMGQ4YzY2MyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvY29yZS9kYy5jCkBAIC02OSw3ICs2OSw3IEBACiAjZGVmaW5lIERDX0xPR0dFUiBc
CiAJZGMtPmN0eC0+bG9nZ2VyCiAKLWNvbnN0IHN0YXRpYyBjaGFyIERDX0JVSUxEX0lEW10gPSAi
cHJvZHVjdGlvbi1idWlsZCI7CitzdGF0aWMgY29uc3QgY2hhciBEQ19CVUlMRF9JRFtdID0gInBy
b2R1Y3Rpb24tYnVpbGQiOwogCiAvKioKICAqIERPQzogT3ZlcnZpZXcKLS0gCjIuNy40CgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1h
aWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
