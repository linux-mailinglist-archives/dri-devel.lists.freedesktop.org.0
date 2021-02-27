Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 57026326D12
	for <lists+dri-devel@lfdr.de>; Sat, 27 Feb 2021 13:58:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE4406E064;
	Sat, 27 Feb 2021 12:57:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A43536E41D
 for <dri-devel@lists.freedesktop.org>; Sat, 27 Feb 2021 11:58:27 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DnlP65k9bzjSTy;
 Sat, 27 Feb 2021 19:56:42 +0800 (CST)
Received: from mdc.huawei.com (10.175.112.208) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.498.0; Sat, 27 Feb 2021 19:58:09 +0800
From: Chen Jun <chenjun102@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH] rockchip: Make cdn_dp_resume depend on CONFIG_PM_SLEEP
Date: Sat, 27 Feb 2021 11:56:28 +0000
Message-ID: <20210227115628.104177-1-chenjun102@huawei.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Originating-IP: [10.175.112.208]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 27 Feb 2021 12:57:58 +0000
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
Cc: airlied@linux.ie, hjc@rock-chips.com, dri-devel@lists.freedesktop.org,
 rui.xiang@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgYnVpbGQgSW1hZ2Ugd2l0aG91dCBDT05GSUdfUE1fU0xFRVAsIHRoZXJlIHdvdWxkIGJlIGEg
Y29tcGlsZSB3YXJuaW5nOgp3YXJuaW5nOiDigJhjZG5fZHBfcmVzdW1l4oCZIGRlZmluZWQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1mdW5jdGlvbl0KCkJlY2F1c2UgU0VUX1NZU1RFTV9TTEVFUF9Q
TV9PUFMgd2lsbCBkbyBub3RoaW5nIHdpdGhvdXQgQ09ORklHX1BNX1NMRUVQLgoKTWFrZSBjZG5f
ZHBfcmVzdW1lIGRlcGVuZCBvbiBDT05GSUdfUE1fU0xFRVAKClNpZ25lZC1vZmYtYnk6IENoZW4g
SnVuIDxjaGVuanVuMTAyQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlw
L2Nkbi1kcC1jb3JlLmMgfCAyICsrCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMgYi9kcml2
ZXJzL2dwdS9kcm0vcm9ja2NoaXAvY2RuLWRwLWNvcmUuYwppbmRleCBhNGE0NWRhZjkzZjIuLjA2
M2E2MGQyMTNiYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1j
b3JlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JvY2tjaGlwL2Nkbi1kcC1jb3JlLmMKQEAgLTEx
MjEsNiArMTEyMSw3IEBAIHN0YXRpYyBpbnQgY2RuX2RwX3N1c3BlbmQoc3RydWN0IGRldmljZSAq
ZGV2KQogCXJldHVybiByZXQ7CiB9CiAKKyNpZmRlZiBDT05GSUdfUE1fU0xFRVAKIHN0YXRpYyBp
bnQgY2RuX2RwX3Jlc3VtZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGNkbl9kcF9k
ZXZpY2UgKmRwID0gZGV2X2dldF9kcnZkYXRhKGRldik7CkBAIC0xMTMzLDYgKzExMzQsNyBAQCBz
dGF0aWMgaW50IGNkbl9kcF9yZXN1bWUoc3RydWN0IGRldmljZSAqZGV2KQogCiAJcmV0dXJuIDA7
CiB9CisjZW5kaWYKIAogc3RhdGljIGludCBjZG5fZHBfcHJvYmUoc3RydWN0IHBsYXRmb3JtX2Rl
dmljZSAqcGRldikKIHsKLS0gCjIuMjUuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVsCg==
