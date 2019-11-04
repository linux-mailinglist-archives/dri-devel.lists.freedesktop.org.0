Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D4FBEE8C5
	for <lists+dri-devel@lfdr.de>; Mon,  4 Nov 2019 20:35:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F676E846;
	Mon,  4 Nov 2019 19:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C5CC6E445;
 Mon,  4 Nov 2019 13:20:28 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id AA8CC467E437E7B21A1D;
 Mon,  4 Nov 2019 21:20:14 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Mon, 4 Nov 2019
 21:20:04 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <Jammy.Zhou@amd.com>, <tianci.yin@amd.com>, <sam@ravnborg.org>,
 <luben.tuikov@amd.com>
Subject: [PATCH 4/7] drm/amdgpu: remove set but not used variable
 'dig_connector'
Date: Mon, 4 Nov 2019 21:27:23 +0800
Message-ID: <1572874046-30996-5-git-send-email-yukuai3@huawei.com>
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
cHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZHAuYzogSW4gZnVuY3Rpb24K4oCYYW1kZ3B1X2F0
b21iaW9zX2RwX2dldF9wYW5lbF9tb2Rl4oCZOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9h
dG9tYmlvc19kcC5jOjM2NDozNjogd2FybmluZzogdmFyaWFibGUK4oCYZGlnX2Nvbm5lY3RvcuKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgbmV2
ZXIgdXNlZCwgc28gY2FuIGJlIHJlbW92ZWQuCgpGaXhlczogZDM4Y2VhZjk5ZWQwICgiZHJtL2Ft
ZGdwdTogYWRkIGNvcmUgZHJpdmVyICh2NCkiKQpTaWduZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1
YWkzQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYXRvbWJpb3Nf
ZHAuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19kcC5jIGIvZHJpdmVycy9ncHUv
ZHJtL2FtZC9hbWRncHUvYXRvbWJpb3NfZHAuYwppbmRleCA2ODU4Y2RlLi45NDI2NTMwIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hdG9tYmlvc19kcC5jCisrKyBiL2Ry
aXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2F0b21iaW9zX2RwLmMKQEAgLTM2MSw3ICszNjEsNiBA
QCBpbnQgYW1kZ3B1X2F0b21iaW9zX2RwX2dldF9wYW5lbF9tb2RlKHN0cnVjdCBkcm1fZW5jb2Rl
ciAqZW5jb2RlciwKIAkJCSAgICAgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yKQog
ewogCXN0cnVjdCBhbWRncHVfY29ubmVjdG9yICphbWRncHVfY29ubmVjdG9yID0gdG9fYW1kZ3B1
X2Nvbm5lY3Rvcihjb25uZWN0b3IpOwotCXN0cnVjdCBhbWRncHVfY29ubmVjdG9yX2F0b21fZGln
ICpkaWdfY29ubmVjdG9yOwogCWludCBwYW5lbF9tb2RlID0gRFBfUEFORUxfTU9ERV9FWFRFUk5B
TF9EUF9NT0RFOwogCXUxNiBkcF9icmlkZ2UgPSBhbWRncHVfY29ubmVjdG9yX2VuY29kZXJfZ2V0
X2RwX2JyaWRnZV9lbmNvZGVyX2lkKGNvbm5lY3Rvcik7CiAJdTggdG1wOwpAQCAtMzY5LDggKzM2
OCw2IEBAIGludCBhbWRncHVfYXRvbWJpb3NfZHBfZ2V0X3BhbmVsX21vZGUoc3RydWN0IGRybV9l
bmNvZGVyICplbmNvZGVyLAogCWlmICghYW1kZ3B1X2Nvbm5lY3Rvci0+Y29uX3ByaXYpCiAJCXJl
dHVybiBwYW5lbF9tb2RlOwogCi0JZGlnX2Nvbm5lY3RvciA9IGFtZGdwdV9jb25uZWN0b3ItPmNv
bl9wcml2OwotCiAJaWYgKGRwX2JyaWRnZSAhPSBFTkNPREVSX09CSkVDVF9JRF9OT05FKSB7CiAJ
CS8qIERQIGJyaWRnZSBjaGlwcyAqLwogCQlpZiAoZHJtX2RwX2RwY2RfcmVhZGIoJmFtZGdwdV9j
b25uZWN0b3ItPmRkY19idXMtPmF1eCwKLS0gCjIuNy40CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
