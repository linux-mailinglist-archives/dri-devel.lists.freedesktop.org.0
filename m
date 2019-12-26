Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39CA812AD0B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Dec 2019 15:33:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F62A89B61;
	Thu, 26 Dec 2019 14:32:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C193689838
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Dec 2019 12:08:38 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 784B49C11E75D703A5D1;
 Thu, 26 Dec 2019 20:08:34 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS401-HUB.china.huawei.com
 (10.3.19.201) with Microsoft SMTP Server id 14.3.439.0; Thu, 26 Dec 2019
 20:08:24 +0800
From: yu kuai <yukuai3@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/radeon: remove three set but not used variable
Date: Thu, 26 Dec 2019 20:07:50 +0800
Message-ID: <20191226120750.15106-1-yukuai3@huawei.com>
X-Mailer: git-send-email 2.17.2
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 26 Dec 2019 14:32:55 +0000
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
Cc: yi.zhang@huawei.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, zhengbin13@huawei.com,
 amd-gfx@lists.freedesktop.org, yukuai3@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3MuYzogSW4gZnVuY3Rpb24K4oCYcmFkZW9uX2dl
dF9hdG9tX2Nvbm5lY3Rvcl9pbmZvX2Zyb21fb2JqZWN0X3RhYmxl4oCZOgpkcml2ZXJzL2dwdS9k
cm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlvcy5jOjY1MToyNjogd2FybmluZzogdmFyaWFibGUK4oCY
Z3JwaF9vYmpfbnVt4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFi
bGVdCmRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmM6NjUxOjEzOiB3YXJu
aW5nOiB2YXJpYWJsZQrigJhncnBoX29ial9pZOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNl
ZC1idXQtc2V0LXZhcmlhYmxlXQpkcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdG9tYmlv
cy5jOjU3MzozNzogd2FybmluZzogdmFyaWFibGUK4oCYY29uX29ial90eXBl4oCZIHNldCBidXQg
bm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpUaGV5IGFyZSBuZXZlciB1c2Vk
LCBhbmQgc28gY2FuIGJlIHJlbW92ZWQuCgpTaWduZWQtb2ZmLWJ5OiB5dSBrdWFpIDx5dWt1YWkz
QGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXRvbWJpb3Mu
YyB8IDE1ICsrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwg
MTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRl
b25fYXRvbWJpb3MuYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmMK
aW5kZXggMDcyZTZkYWVkZjdhLi44NDhlZjY4ZDkwODYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2F0b21iaW9zLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fYXRvbWJpb3MuYwpAQCAtNTcwLDcgKzU3MCw3IEBAIGJvb2wgcmFkZW9uX2dldF9h
dG9tX2Nvbm5lY3Rvcl9pbmZvX2Zyb21fb2JqZWN0X3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpCiAJCXBhdGhfc2l6ZSArPSBsZTE2X3RvX2NwdShwYXRoLT51c1NpemUpOwogCiAJCWlmIChk
ZXZpY2Vfc3VwcG9ydCAmIGxlMTZfdG9fY3B1KHBhdGgtPnVzRGV2aWNlVGFnKSkgewotCQkJdWlu
dDhfdCBjb25fb2JqX2lkLCBjb25fb2JqX251bSwgY29uX29ial90eXBlOworCQkJdWludDhfdCBj
b25fb2JqX2lkLCBjb25fb2JqX251bTsKIAogCQkJY29uX29ial9pZCA9CiAJCQkgICAgKGxlMTZf
dG9fY3B1KHBhdGgtPnVzQ29ubk9iamVjdElkKSAmIE9CSkVDVF9JRF9NQVNLKQpAQCAtNTc4LDkg
KzU3OCw2IEBAIGJvb2wgcmFkZW9uX2dldF9hdG9tX2Nvbm5lY3Rvcl9pbmZvX2Zyb21fb2JqZWN0
X3RhYmxlKHN0cnVjdCBkcm1fZGV2aWNlICpkZXYpCiAJCQljb25fb2JqX251bSA9CiAJCQkgICAg
KGxlMTZfdG9fY3B1KHBhdGgtPnVzQ29ubk9iamVjdElkKSAmIEVOVU1fSURfTUFTSykKIAkJCSAg
ICA+PiBFTlVNX0lEX1NISUZUOwotCQkJY29uX29ial90eXBlID0KLQkJCSAgICAobGUxNl90b19j
cHUocGF0aC0+dXNDb25uT2JqZWN0SWQpICYKLQkJCSAgICAgT0JKRUNUX1RZUEVfTUFTSykgPj4g
T0JKRUNUX1RZUEVfU0hJRlQ7CiAKIAkJCS8qIFRPRE8gQ1Ygc3VwcG9ydCAqLwogCQkJaWYgKGxl
MTZfdG9fY3B1KHBhdGgtPnVzRGV2aWNlVGFnKSA9PQpAQCAtNjQ4LDE1ICs2NDUsNyBAQCBib29s
IHJhZGVvbl9nZXRfYXRvbV9jb25uZWN0b3JfaW5mb19mcm9tX29iamVjdF90YWJsZShzdHJ1Y3Qg
ZHJtX2RldmljZSAqZGV2KQogCQkJcm91dGVyLmRkY192YWxpZCA9IGZhbHNlOwogCQkJcm91dGVy
LmNkX3ZhbGlkID0gZmFsc2U7CiAJCQlmb3IgKGogPSAwOyBqIDwgKChsZTE2X3RvX2NwdShwYXRo
LT51c1NpemUpIC0gOCkgLyAyKTsgaisrKSB7Ci0JCQkJdWludDhfdCBncnBoX29ial9pZCwgZ3Jw
aF9vYmpfbnVtLCBncnBoX29ial90eXBlOwotCi0JCQkJZ3JwaF9vYmpfaWQgPQotCQkJCSAgICAo
bGUxNl90b19jcHUocGF0aC0+dXNHcmFwaGljT2JqSWRzW2pdKSAmCi0JCQkJICAgICBPQkpFQ1Rf
SURfTUFTSykgPj4gT0JKRUNUX0lEX1NISUZUOwotCQkJCWdycGhfb2JqX251bSA9Ci0JCQkJICAg
IChsZTE2X3RvX2NwdShwYXRoLT51c0dyYXBoaWNPYmpJZHNbal0pICYKLQkJCQkgICAgIEVOVU1f
SURfTUFTSykgPj4gRU5VTV9JRF9TSElGVDsKLQkJCQlncnBoX29ial90eXBlID0KKwkJCQl1aW50
OF90IGdycGhfb2JqX3R5cGUgPQogCQkJCSAgICAobGUxNl90b19jcHUocGF0aC0+dXNHcmFwaGlj
T2JqSWRzW2pdKSAmCiAJCQkJICAgICBPQkpFQ1RfVFlQRV9NQVNLKSA+PiBPQkpFQ1RfVFlQRV9T
SElGVDsKIAotLSAKMi4xNy4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
