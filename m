Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E34D81A90B
	for <lists+dri-devel@lfdr.de>; Sat, 11 May 2019 20:23:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29A84896C7;
	Sat, 11 May 2019 18:22:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 095736E7BD
 for <dri-devel@lists.freedesktop.org>; Sat, 11 May 2019 02:18:24 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5B88A99C3A03DAD11F8E;
 Sat, 11 May 2019 10:18:20 +0800 (CST)
Received: from localhost (10.177.31.96) by DGGEMS413-HUB.china.huawei.com
 (10.3.19.213) with Microsoft SMTP Server id 14.3.439.0; Sat, 11 May 2019
 10:18:11 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <fatemeh.darbehani@amd.com>
Subject: [PATCH] drm/amd/display: Make two functions static
Date: Sat, 11 May 2019 10:17:37 +0800
Message-ID: <20190511021737.8796-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.177.31.96]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 11 May 2019 18:22:57 +0000
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
Cc: amd-gfx@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvLi4vZGlzcGxh
eS9kYy9kY24xMC9kY24xMF9jbGtfbWdyLmM6MjYwOjU6CiB3YXJuaW5nOiBzeW1ib2wgJ2RjbjEw
X3NldF9kaXNwY2xrJyB3YXMgbm90IGRlY2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwpkcml2
ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS8uLi9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2Nsa19tZ3Iu
YzoyODY6NToKIHdhcm5pbmc6IHN5bWJvbCAnZGNuMTBfc2V0X2RwcmVmY2xrJyB3YXMgbm90IGRl
Y2xhcmVkLiBTaG91bGQgaXQgYmUgc3RhdGljPwoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1
bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiBZdWVIYWliaW5nIDx5dWVoYWliaW5nQGh1
YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEw
X2Nsa19tZ3IuYyB8IDUgKysrLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjEwL2RjbjEwX2Nsa19tZ3IuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24xMC9kY24xMF9jbGtfbWdyLmMKaW5kZXggOWYyZmZjZS4uYWU4YzQwYyAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjEwL2RjbjEwX2Nsa19tZ3IuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMTAvZGNuMTBfY2xrX21nci5jCkBA
IC0yNTcsNyArMjU3LDggQEAgc3RhdGljIHZvaWQgZGNuMV91cGRhdGVfY2xvY2tzKHN0cnVjdCBj
bGtfbWdyICpjbGtfbWdyLAogI2RlZmluZSBWQklPU1NNQ19NU0dfU2V0RGlzcGNsa0ZyZXEgICAg
ICAgICAgIDB4NAogI2RlZmluZSBWQklPU1NNQ19NU0dfU2V0RHByZWZjbGtGcmVxICAgICAgICAg
IDB4NQogCi1pbnQgZGNuMTBfc2V0X2Rpc3BjbGsoc3RydWN0IGNsa19tZ3IgKmNsa19tZ3JfYmFz
ZSwgaW50IHJlcXVlc3RlZF9kaXNwY2xrX2toeikKK3N0YXRpYyBpbnQgZGNuMTBfc2V0X2Rpc3Bj
bGsoc3RydWN0IGNsa19tZ3IgKmNsa19tZ3JfYmFzZSwKKwkJCSAgICAgaW50IHJlcXVlc3RlZF9k
aXNwY2xrX2toeikKIHsKIAlpbnQgYWN0dWFsX2Rpc3BjbGtfc2V0X2toeiA9IC0xOwogCXN0cnVj
dCBkY2VfY2xrX21nciAqY2xrX21ncl9kY2UgPSBUT19EQ0VfQ0xLX01HUihjbGtfbWdyX2Jhc2Up
OwpAQCAtMjgzLDcgKzI4NCw3IEBAIGludCBkY24xMF9zZXRfZGlzcGNsayhzdHJ1Y3QgY2xrX21n
ciAqY2xrX21ncl9iYXNlLCBpbnQgcmVxdWVzdGVkX2Rpc3BjbGtfa2h6KQogCiB9CiAKLWludCBk
Y24xMF9zZXRfZHByZWZjbGsoc3RydWN0IGNsa19tZ3IgKmNsa19tZ3JfYmFzZSkKK3N0YXRpYyBp
bnQgZGNuMTBfc2V0X2RwcmVmY2xrKHN0cnVjdCBjbGtfbWdyICpjbGtfbWdyX2Jhc2UpCiB7CiAJ
aW50IGFjdHVhbF9kcHJlZmNsa19zZXRfa2h6ID0gLTE7CiAJc3RydWN0IGRjZV9jbGtfbWdyICpj
bGtfbWdyX2RjZSA9IFRPX0RDRV9DTEtfTUdSKGNsa19tZ3JfYmFzZSk7Ci0tIAoyLjcuNAoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBt
YWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
