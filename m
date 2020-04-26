Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 937E01B8FE5
	for <lists+dri-devel@lfdr.de>; Sun, 26 Apr 2020 14:35:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31F746E2E1;
	Sun, 26 Apr 2020 12:35:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B48CB6E233;
 Sun, 26 Apr 2020 09:44:12 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 4BD7DA9657B9E3F3B1E8;
 Sun, 26 Apr 2020 17:44:08 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Sun, 26 Apr 2020
 17:43:58 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <robdclark@gmail.com>, <sean@poorly.run>, <airlied@linux.ie>,
 <daniel@ffwll.ch>, <ddavenport@chromium.org>,
 <linux-arm-msm@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <freedreno@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] drm/msm/dpu: remove set but not used 'topology'
Date: Sun, 26 Apr 2020 17:43:25 +0800
Message-ID: <20200426094325.24265-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 26 Apr 2020 12:35:16 +0000
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
Cc: Hulk Robot <hulkci@huawei.com>, Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgZ2NjIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3Av
ZHB1MS9kcHVfZW5jb2Rlci5jOjk1ODozMDogd2FybmluZzogdmFyaWFibGUK4oCYdG9wb2xvZ3ni
gJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KICBzdHJ1Y3Qg
bXNtX2Rpc3BsYXlfdG9wb2xvZ3kgdG9wb2xvZ3k7CiAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIF5+fn5+fn5+CgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+
ClNpZ25lZC1vZmYtYnk6IEphc29uIFlhbiA8eWFuYWlqaWVAaHVhd2VpLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jIHwgMyAtLS0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20v
ZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9k
cHVfZW5jb2Rlci5jCmluZGV4IGExYjc5ZWUyYmQ5ZC4uOWQ1NzdjZTlkNThkIDEwMDY0NAotLS0g
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfZW5jb2Rlci5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9lbmNvZGVyLmMKQEAgLTk1NSw3ICs5NTUsNiBA
QCBzdGF0aWMgdm9pZCBkcHVfZW5jb2Rlcl92aXJ0X21vZGVfc2V0KHN0cnVjdCBkcm1fZW5jb2Rl
ciAqZHJtX2VuYywKIAlzdHJ1Y3QgZHJtX2NydGMgKmRybV9jcnRjOwogCXN0cnVjdCBkcHVfY3J0
Y19zdGF0ZSAqY3N0YXRlOwogCXN0cnVjdCBkcHVfZ2xvYmFsX3N0YXRlICpnbG9iYWxfc3RhdGU7
Ci0Jc3RydWN0IG1zbV9kaXNwbGF5X3RvcG9sb2d5IHRvcG9sb2d5OwogCXN0cnVjdCBkcHVfaHdf
YmxrICpod19wcFtNQVhfQ0hBTk5FTFNfUEVSX0VOQ107CiAJc3RydWN0IGRwdV9od19ibGsgKmh3
X2N0bFtNQVhfQ0hBTk5FTFNfUEVSX0VOQ107CiAJc3RydWN0IGRwdV9od19ibGsgKmh3X2xtW01B
WF9DSEFOTkVMU19QRVJfRU5DXTsKQEAgLTk5OCw4ICs5OTcsNiBAQCBzdGF0aWMgdm9pZCBkcHVf
ZW5jb2Rlcl92aXJ0X21vZGVfc2V0KHN0cnVjdCBkcm1fZW5jb2RlciAqZHJtX2VuYywKIAkJaWYg
KGRybV9jcnRjLT5zdGF0ZS0+ZW5jb2Rlcl9tYXNrICYgZHJtX2VuY29kZXJfbWFzayhkcm1fZW5j
KSkKIAkJCWJyZWFrOwogCi0JdG9wb2xvZ3kgPSBkcHVfZW5jb2Rlcl9nZXRfdG9wb2xvZ3koZHB1
X2VuYywgZHB1X2ttcywgYWRqX21vZGUpOwotCiAJLyogUXVlcnkgcmVzb3VyY2UgdGhhdCBoYXZl
IGJlZW4gcmVzZXJ2ZWQgaW4gYXRvbWljIGNoZWNrIHN0ZXAuICovCiAJbnVtX3BwID0gZHB1X3Jt
X2dldF9hc3NpZ25lZF9yZXNvdXJjZXMoJmRwdV9rbXMtPnJtLCBnbG9iYWxfc3RhdGUsCiAJCWRy
bV9lbmMtPmJhc2UuaWQsIERQVV9IV19CTEtfUElOR1BPTkcsIGh3X3BwLAotLSAKMi4yMS4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
