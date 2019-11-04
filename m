Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33C60EE8B5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3BE3C6E836;
	Mon,  4 Nov 2019 19:35:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B65246E428;
 Mon,  4 Nov 2019 13:20:16 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 95B992AB0576AC205C75;
 Mon,  4 Nov 2019 21:20:09 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 21:20:02 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jammy.Zhou@amd.com>, <tianci.yin@amd.com>, <sam@ravnborg.org>,
 <luben.tuikov@amd.com>
Subject: [PATCH 1/7] drm/amdgpu: remove 4 set but not used variable in
 amdgpu_atombios_get_connector_info_from_object_table
Date: Mon, 4 Nov 2019 21:27:20 +0800
Message-ID: <1572874046-30996-2-git-send-email-yukuai3@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572874046-30996-1-git-send-email-yukuai3@huawei.com>
References: <1572874046-30996-1-git-send-email-yukuai3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 04 Nov 2019 19:35:10 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com,
 amd-gfx@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0b21iaW9zLmM6IEluIGZ1bmN0aW9uCidhbWRncHVf
YXRvbWJpb3NfZ2V0X2Nvbm5lY3Rvcl9pbmZvX2Zyb21fb2JqZWN0X3RhYmxlJzoKZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0b21iaW9zLmM6Mzc2OjI2OiB3YXJuaW5nOiB2YXJp
YWJsZQonZ3JwaF9vYmpfbnVtJyBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWJpb3MuYzozNzY6
MTM6IHdhcm5pbmc6IHZhcmlhYmxlCidncnBoX29ial9pZCcgc2V0IGJ1dCBub3QgdXNlZCBbLVd1
bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2F0b21iaW9zLmM6MzQxOjM3OiB3YXJuaW5nOiB2YXJpYWJsZQonY29uX29ial90eXBlJyBzZXQg
YnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQpkcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfYXRvbWJpb3MuYzozNDE6MjQ6IHdhcm5pbmc6IHZhcmlhYmxlCidj
b25fb2JqX251bScgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0K
ClRoZXkgYXJlIG5ldmVyIHVzZWQsIHNvIGNhbiBiZSByZW1vdmVkLgoKRml4ZXM6IGQzOGNlYWY5
OWVkMCAoImRybS9hbWRncHU6IGFkZCBjb3JlIGRyaXZlciAodjQpIikKU2lnbmVkLW9mZi1ieTog
eXUga3VhaSA8eXVrdWFpM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvYW1k
Z3B1L2FtZGdwdV9hdG9tYmlvcy5jIHwgMTkgKystLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNo
YW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMTcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X2F0b21iaW9zLmMgYi9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWJpb3MuYwppbmRleCA3MjIzMmZjLi5iZTZkMGNmIDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWJpb3MuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfYXRvbWJpb3MuYwpAQCAtMzM4
LDE3ICszMzgsOSBAQCBib29sIGFtZGdwdV9hdG9tYmlvc19nZXRfY29ubmVjdG9yX2luZm9fZnJv
bV9vYmplY3RfdGFibGUoc3RydWN0IGFtZGdwdV9kZXZpY2UgKgogCQlwYXRoX3NpemUgKz0gbGUx
Nl90b19jcHUocGF0aC0+dXNTaXplKTsKIAogCQlpZiAoZGV2aWNlX3N1cHBvcnQgJiBsZTE2X3Rv
X2NwdShwYXRoLT51c0RldmljZVRhZykpIHsKLQkJCXVpbnQ4X3QgY29uX29ial9pZCwgY29uX29i
al9udW0sIGNvbl9vYmpfdHlwZTsKLQotCQkJY29uX29ial9pZCA9CisJCQl1aW50OF90IGNvbl9v
YmpfaWQgPQogCQkJICAgIChsZTE2X3RvX2NwdShwYXRoLT51c0Nvbm5PYmplY3RJZCkgJiBPQkpF
Q1RfSURfTUFTSykKIAkJCSAgICA+PiBPQkpFQ1RfSURfU0hJRlQ7Ci0JCQljb25fb2JqX251bSA9
Ci0JCQkgICAgKGxlMTZfdG9fY3B1KHBhdGgtPnVzQ29ubk9iamVjdElkKSAmIEVOVU1fSURfTUFT
SykKLQkJCSAgICA+PiBFTlVNX0lEX1NISUZUOwotCQkJY29uX29ial90eXBlID0KLQkJCSAgICAo
bGUxNl90b19jcHUocGF0aC0+dXNDb25uT2JqZWN0SWQpICYKLQkJCSAgICAgT0JKRUNUX1RZUEVf
TUFTSykgPj4gT0JKRUNUX1RZUEVfU0hJRlQ7CiAKIAkJCS8qIFNraXAgVFYvQ1Ygc3VwcG9ydCAq
LwogCQkJaWYgKChsZTE2X3RvX2NwdShwYXRoLT51c0RldmljZVRhZykgPT0KQEAgLTM3MywxNCAr
MzY1LDcgQEAgYm9vbCBhbWRncHVfYXRvbWJpb3NfZ2V0X2Nvbm5lY3Rvcl9pbmZvX2Zyb21fb2Jq
ZWN0X3RhYmxlKHN0cnVjdCBhbWRncHVfZGV2aWNlICoKIAkJCXJvdXRlci5kZGNfdmFsaWQgPSBm
YWxzZTsKIAkJCXJvdXRlci5jZF92YWxpZCA9IGZhbHNlOwogCQkJZm9yIChqID0gMDsgaiA8ICgo
bGUxNl90b19jcHUocGF0aC0+dXNTaXplKSAtIDgpIC8gMik7IGorKykgewotCQkJCXVpbnQ4X3Qg
Z3JwaF9vYmpfaWQsIGdycGhfb2JqX251bSwgZ3JwaF9vYmpfdHlwZTsKLQotCQkJCWdycGhfb2Jq
X2lkID0KLQkJCQkgICAgKGxlMTZfdG9fY3B1KHBhdGgtPnVzR3JhcGhpY09iaklkc1tqXSkgJgot
CQkJCSAgICAgT0JKRUNUX0lEX01BU0spID4+IE9CSkVDVF9JRF9TSElGVDsKLQkJCQlncnBoX29i
al9udW0gPQotCQkJCSAgICAobGUxNl90b19jcHUocGF0aC0+dXNHcmFwaGljT2JqSWRzW2pdKSAm
Ci0JCQkJICAgICBFTlVNX0lEX01BU0spID4+IEVOVU1fSURfU0hJRlQ7CisJCQkJdWludDhfdCBn
cnBoX29ial90eXBlPQogCQkJCWdycGhfb2JqX3R5cGUgPQogCQkJCSAgICAobGUxNl90b19jcHUo
cGF0aC0+dXNHcmFwaGljT2JqSWRzW2pdKSAmCiAJCQkJICAgICBPQkpFQ1RfVFlQRV9NQVNLKSA+
PiBPQkpFQ1RfVFlQRV9TSElGVDsKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
