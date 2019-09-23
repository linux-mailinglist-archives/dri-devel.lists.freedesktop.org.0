Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5C8ABAE1A
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2019 08:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42D8F6E10F;
	Mon, 23 Sep 2019 06:55:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26DE26E0C1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Sep 2019 01:28:12 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 5BDD59934B6DB95F0B3E;
 Mon, 23 Sep 2019 09:28:07 +0800 (CST)
Received: from linux-ibm.site (10.175.102.37) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Mon, 23 Sep 2019 09:27:59 +0800
From: zhong jiang <zhongjiang@huawei.com>
To: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <sean@poorly.run>
Subject: [PATCH v2] drm/vkms: Fix an undefined reference error in
 vkms_composer_worker
Date: Mon, 23 Sep 2019 09:24:43 +0800
Message-ID: <1569201883-18779-1-git-send-email-zhongjiang@huawei.com>
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

SSBoaXQgdGhlIGZvbGxvd2luZyBlcnJvciB3aGVuIGNvbXBpbGUgdGhlIGtlcm5lbC4KCmRyaXZl
cnMvZ3B1L2RybS92a21zL3ZrbXNfY29tcG9zZXIubzogSW4gZnVuY3Rpb24gYHZrbXNfY29tcG9z
ZXJfd29ya2VyJzoKdmttc19jb21wb3Nlci5jOigudGV4dCsweDVlNCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYGNyYzMyX2xlJwptYWtlOiAqKiogW3ZtbGludXhdIEVycm9yIDEKClNpZ25lZC1v
ZmYtYnk6IHpob25nIGppYW5nIDx6aG9uZ2ppYW5nQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9n
cHUvZHJtL0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL0tjb25m
aWcKaW5kZXggZTY3YzE5NC4uMjg1ZDY0OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL0tj
b25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL0tjb25maWcKQEAgLTI1Nyw2ICsyNTcsNyBAQCBj
b25maWcgRFJNX1ZLTVMKIAl0cmlzdGF0ZSAiVmlydHVhbCBLTVMgKEVYUEVSSU1FTlRBTCkiCiAJ
ZGVwZW5kcyBvbiBEUk0KIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKKwlzZWxlY3QgQ1JDMzIKIAlk
ZWZhdWx0IG4KIAloZWxwCiAJICBWaXJ0dWFsIEtlcm5lbCBNb2RlLVNldHRpbmcgKFZLTVMpIGlz
IHVzZWQgZm9yIHRlc3Rpbmcgb3IgZm9yCi0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
