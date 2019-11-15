Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C684FF911
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF916E323;
	Sun, 17 Nov 2019 11:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C6B56E53E;
 Fri, 15 Nov 2019 12:05:50 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id C9DE1C77C573A40A9CDD;
 Fri, 15 Nov 2019 20:05:46 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 20:05:37 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/6] drm/radeon: remove set but not used variable
 'backbias_response_time'
Date: Fri, 15 Nov 2019 20:12:56 +0800
Message-ID: <1573819980-54523-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
References: <1573819980-54523-1-git-send-email-zhengbin13@huawei.com>
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
Cc: zhengbin13@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgZ2NjICctV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlJyB3YXJuaW5nOgoKZHJpdmVycy9n
cHUvZHJtL3JhZGVvbi9zaV9kcG0uYzogSW4gZnVuY3Rpb24gc2lfcHJvZ3JhbV9yZXNwb25zZV90
aW1lczoKZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYzozNjQwOjI5OiB3YXJuaW5nOiB2
YXJpYWJsZSBiYWNrYmlhc19yZXNwb25zZV90aW1lIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCBhOWU2MTQxMDky
MWIgKCJkcm0vcmFkZW9uL2ttczoKYWRkIGRwbSBzdXBwb3J0IGZvciBTSSAodjcpIiksIGJ1dCBu
ZXZlciB1c2VkLCBzbyByZW1vdmUgaXQuCgpSZXBvcnRlZC1ieTogSHVsayBSb2JvdCA8aHVsa2Np
QGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IHpoZW5nYmluIDx6aGVuZ2JpbjEzQGh1YXdlaS5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYyB8IDMgKy0tCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL3JhZGVvbi9zaV9kcG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vc2lf
ZHBtLmMKaW5kZXggYTBiMzgyYS4uODE0OGE3OCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3JhZGVvbi9zaV9kcG0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3NpX2RwbS5jCkBA
IC0zNjQwLDE0ICszNjQwLDEzIEBAIHN0YXRpYyBpbnQgc2lfbm90aWZ5X3NtY19kaXNwbGF5X2No
YW5nZShzdHJ1Y3QgcmFkZW9uX2RldmljZSAqcmRldiwKCiBzdGF0aWMgdm9pZCBzaV9wcm9ncmFt
X3Jlc3BvbnNlX3RpbWVzKHN0cnVjdCByYWRlb25fZGV2aWNlICpyZGV2KQogewotCXUzMiB2b2x0
YWdlX3Jlc3BvbnNlX3RpbWUsIGJhY2tiaWFzX3Jlc3BvbnNlX3RpbWUsIGFjcGlfZGVsYXlfdGlt
ZSwgdmJpX3RpbWVfb3V0OworCXUzMiB2b2x0YWdlX3Jlc3BvbnNlX3RpbWUsIGFjcGlfZGVsYXlf
dGltZSwgdmJpX3RpbWVfb3V0OwogCXUzMiB2ZGRjX2RseSwgYWNwaV9kbHksIHZiaV9kbHk7CiAJ
dTMyIHJlZmVyZW5jZV9jbG9jazsKCiAJc2lfd3JpdGVfc21jX3NvZnRfcmVnaXN0ZXIocmRldiwg
U0lfU01DX1NPRlRfUkVHSVNURVJfbXZkZF9jaGdfdGltZSwgMSk7CgogCXZvbHRhZ2VfcmVzcG9u
c2VfdGltZSA9ICh1MzIpcmRldi0+cG0uZHBtLnZvbHRhZ2VfcmVzcG9uc2VfdGltZTsKLQliYWNr
Ymlhc19yZXNwb25zZV90aW1lID0gKHUzMilyZGV2LT5wbS5kcG0uYmFja2JpYXNfcmVzcG9uc2Vf
dGltZTsKCiAJaWYgKHZvbHRhZ2VfcmVzcG9uc2VfdGltZSA9PSAwKQogCQl2b2x0YWdlX3Jlc3Bv
bnNlX3RpbWUgPSAxMDAwOwotLQoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
