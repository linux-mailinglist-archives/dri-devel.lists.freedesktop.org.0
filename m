Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2970B2A2BD6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 14:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 801FB6EB89;
	Mon,  2 Nov 2020 13:43:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C44F56E4B1;
 Mon,  2 Nov 2020 11:57:06 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CPrxP73n0zLrF6;
 Mon,  2 Nov 2020 19:56:57 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 19:56:53 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH -next] drm/amd/pm: remove unused variable
Date: Mon, 2 Nov 2020 20:08:47 +0800
Message-ID: <1604318927-11896-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 02 Nov 2020 13:43:21 +0000
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
Cc: dri-devel@lists.freedesktop.org, Zou Wei <zou_wei@huawei.com>,
 amd-gfx@lists.freedesktop.org, Xiaojian.Du@amd.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHZhcmlhYmxlIHNldCBidXQgbm90IHVzZWQgY29tcGlsYXRpb24gd2FybmluZzoKCi4vdmFu
Z29naF9wcHQuYzozOTc6Njogd2FybmluZzogdmFyaWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAgaW50IHJldCA9IDA7CiAgICAgIF5+
fgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2Zm
LWJ5OiBab3UgV2VpIDx6b3Vfd2VpQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2Ft
ZC9wbS9zd3NtdS9zbXUxMS92YW5nb2doX3BwdC5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9z
bXUxMS92YW5nb2doX3BwdC5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9wbS9zd3NtdS9zbXUxMS92
YW5nb2doX3BwdC5jCmluZGV4IDZlMjYwMjUuLjM1NWFkZTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9hbWQvcG0vc3dzbXUvc211MTEvdmFuZ29naF9wcHQuYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vYW1kL3BtL3N3c211L3NtdTExL3ZhbmdvZ2hfcHB0LmMKQEAgLTM5NCw4ICszOTQsNiBA
QCBzdGF0aWMgaW50IHZhbmdvZ2hfZ2V0X2N1cnJlbnRfYWN0aXZpdHlfcGVyY2VudChzdHJ1Y3Qg
c211X2NvbnRleHQgKnNtdSwKIAkJCQkJICAgICAgIGVudW0gYW1kX3BwX3NlbnNvcnMgc2Vuc29y
LAogCQkJCQkgICAgICAgdWludDMyX3QgKnZhbHVlKQogewotCWludCByZXQgPSAwOwotCiAJaWYg
KCF2YWx1ZSkKIAkJcmV0dXJuIC1FSU5WQUw7CiAKLS0gCjIuNi4yCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
