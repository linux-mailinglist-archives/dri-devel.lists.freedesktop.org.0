Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23A3FF92F
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:46:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAE506E46C;
	Sun, 17 Nov 2019 11:45:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6E08957B;
 Sat, 16 Nov 2019 03:36:39 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 459D3232D7737EC5CC9D;
 Sat, 16 Nov 2019 11:36:33 +0800 (CST)
Received: from localhost.localdomain (10.90.53.225) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.439.0; Sat, 16 Nov 2019 11:36:27 +0800
From: Chen Wandun <chenwandun@huawei.com>
To: <alexander.deucher@amd.com>, <evan.quan@amd.com>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/amd/powerplay: remove variable 'result' set but not used
Date: Sat, 16 Nov 2019 11:43:19 +0800
Message-ID: <1573875799-83572-1-git-send-email-chenwandun@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 17 Nov 2019 11:44:18 +0000
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
Cc: chenwandun@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvLi4vcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYzogSW4g
ZnVuY3Rpb24gdmVnYW1fcG9wdWxhdGVfc21jX2Jvb3RfbGV2ZWw6CmRyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1Ly4uL3Bvd2VycGxheS9zbXVtZ3IvdmVnYW1fc211bWdyLmM6MTM2NDo2OiB3YXJu
aW5nOiB2YXJpYWJsZSByZXN1bHQgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12
YXJpYWJsZV0KClNpZ25lZC1vZmYtYnk6IENoZW4gV2FuZHVuIDxjaGVud2FuZHVuQGh1YXdlaS5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1n
ci5jIHwgMTMgKysrKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwg
NyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxh
eS9zbXVtZ3IvdmVnYW1fc211bWdyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL3Bvd2VycGxheS9z
bXVtZ3IvdmVnYW1fc211bWdyLmMKaW5kZXggMjA2OGViMC4uZmFkNzhiZiAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9wb3dlcnBsYXkvc211bWdyL3ZlZ2FtX3NtdW1nci5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9hbWQvcG93ZXJwbGF5L3NtdW1nci92ZWdhbV9zbXVtZ3IuYwpAQCAt
MTM2MSwyMCArMTM2MSwxOSBAQCBzdGF0aWMgaW50IHZlZ2FtX3BvcHVsYXRlX3NtY191dmRfbGV2
ZWwoc3RydWN0IHBwX2h3bWdyICpod21nciwKIHN0YXRpYyBpbnQgdmVnYW1fcG9wdWxhdGVfc21j
X2Jvb3RfbGV2ZWwoc3RydWN0IHBwX2h3bWdyICpod21nciwKIAkJc3RydWN0IFNNVTc1X0Rpc2Ny
ZXRlX0RwbVRhYmxlICp0YWJsZSkKIHsKLQlpbnQgcmVzdWx0ID0gMDsKIAlzdHJ1Y3Qgc211N19o
d21nciAqZGF0YSA9IChzdHJ1Y3Qgc211N19od21nciAqKShod21nci0+YmFja2VuZCk7CiAKIAl0
YWJsZS0+R3JhcGhpY3NCb290TGV2ZWwgPSAwOwogCXRhYmxlLT5NZW1vcnlCb290TGV2ZWwgPSAw
OwogCiAJLyogZmluZCBib290IGxldmVsIGZyb20gZHBtIHRhYmxlICovCi0JcmVzdWx0ID0gcGht
X2ZpbmRfYm9vdF9sZXZlbCgmKGRhdGEtPmRwbV90YWJsZS5zY2xrX3RhYmxlKSwKLQkJCWRhdGEt
PnZiaW9zX2Jvb3Rfc3RhdGUuc2Nsa19ib290dXBfdmFsdWUsCi0JCQkodWludDMyX3QgKikmKHRh
YmxlLT5HcmFwaGljc0Jvb3RMZXZlbCkpOworCXBobV9maW5kX2Jvb3RfbGV2ZWwoJihkYXRhLT5k
cG1fdGFibGUuc2Nsa190YWJsZSksCisJCQkgICAgZGF0YS0+dmJpb3NfYm9vdF9zdGF0ZS5zY2xr
X2Jvb3R1cF92YWx1ZSwKKwkJCSAgICAodWludDMyX3QgKikmKHRhYmxlLT5HcmFwaGljc0Jvb3RM
ZXZlbCkpOwogCi0JcmVzdWx0ID0gcGhtX2ZpbmRfYm9vdF9sZXZlbCgmKGRhdGEtPmRwbV90YWJs
ZS5tY2xrX3RhYmxlKSwKLQkJCWRhdGEtPnZiaW9zX2Jvb3Rfc3RhdGUubWNsa19ib290dXBfdmFs
dWUsCi0JCQkodWludDMyX3QgKikmKHRhYmxlLT5NZW1vcnlCb290TGV2ZWwpKTsKKwlwaG1fZmlu
ZF9ib290X2xldmVsKCYoZGF0YS0+ZHBtX3RhYmxlLm1jbGtfdGFibGUpLAorCQkJICAgIGRhdGEt
PnZiaW9zX2Jvb3Rfc3RhdGUubWNsa19ib290dXBfdmFsdWUsCisJCQkgICAgKHVpbnQzMl90ICop
Jih0YWJsZS0+TWVtb3J5Qm9vdExldmVsKSk7CiAKIAl0YWJsZS0+Qm9vdFZkZGMgID0gZGF0YS0+
dmJpb3NfYm9vdF9zdGF0ZS52ZGRjX2Jvb3R1cF92YWx1ZSAqCiAJCQlWT0xUQUdFX1NDQUxFOwot
LSAKMi43LjQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
