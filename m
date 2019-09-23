Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 49769BAE1E
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:56:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2EC6E121;
	Mon, 23 Sep 2019 06:55:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D78C6E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 01:24:32 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 506207C9861F3A22CD27;
 Mon, 23 Sep 2019 09:24:30 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Mon, 23 Sep 2019 09:24:22 +0800
From: zhong jiang <zhongjiang@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>
Subject: [PATCH] drm/vkms: Fix an undefined reference error in
 vkms_composer_worker
Date: Mon, 23 Sep 2019 09:21:11 +0800
Message-ID: <1569201671-18489-1-git-send-email-zhongjiang@huawei.com>
X-Mailer: git-send-email 1.7.12.4
MIME-Version: 1.0
X-Originating-IP: [10.175.102.37]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 23 Sep 2019 06:55:22 +0000
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
Cc: airlied@linux.ie, zhongjiang@huawei.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogWXVlSGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgoKSSBoaXQgdGhlIGZvbGxv
d2luZyBlcnJvciB3aGVuIGNvbXBpbGUgdGhlIGtlcm5lbC4KCmRyaXZlcnMvZ3B1L2RybS92a21z
L3ZrbXNfY29tcG9zZXIubzogSW4gZnVuY3Rpb24gYHZrbXNfY29tcG9zZXJfd29ya2VyJzoKdmtt
c19jb21wb3Nlci5jOigudGV4dCsweDVlNCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGNyYzMy
X2xlJwptYWtlOiAqKiogW3ZtbGludXhdIEVycm9yIDEKClNpZ25lZC1vZmYtYnk6IFl1ZUhhaWJp
bmcgPHl1ZWhhaWJpbmdAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogemhvbmcgamlhbmcgPHpo
b25namlhbmdAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyB8IDEgKwog
MSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZwppbmRleCBlNjdjMTk0Li4yODVk
NjQ5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vS2NvbmZpZworKysgYi9kcml2ZXJzL2dw
dS9kcm0vS2NvbmZpZwpAQCAtMjU3LDYgKzI1Nyw3IEBAIGNvbmZpZyBEUk1fVktNUwogCXRyaXN0
YXRlICJWaXJ0dWFsIEtNUyAoRVhQRVJJTUVOVEFMKSIKIAlkZXBlbmRzIG9uIERSTQogCXNlbGVj
dCBEUk1fS01TX0hFTFBFUgorCXNlbGVjdCBDUkMzMgogCWRlZmF1bHQgbgogCWhlbHAKIAkgIFZp
cnR1YWwgS2VybmVsIE1vZGUtU2V0dGluZyAoVktNUykgaXMgdXNlZCBmb3IgdGVzdGluZyBvciBm
b3IKLS0gCjEuNy4xMi40CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
