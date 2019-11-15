Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE340FF8FF
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2019 12:44:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53F7F6E31E;
	Sun, 17 Nov 2019 11:44:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C83D6E550;
 Fri, 15 Nov 2019 12:05:50 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id CF7134E9CFC477931C9A;
 Fri, 15 Nov 2019 20:05:46 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.439.0; Fri, 15 Nov 2019
 20:05:38 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 6/6] drm/radeon: remove set but not used variable
 'tv_pll_cntl1'
Date: Fri, 15 Nov 2019 20:13:00 +0800
Message-ID: <1573819980-54523-7-git-send-email-zhengbin13@huawei.com>
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
cHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X3R2LmM6IEluIGZ1bmN0aW9uIHJhZGVvbl9sZWdh
Y3lfdHZfbW9kZV9zZXQ6CmRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2xlZ2FjeV90di5j
OjUzODoyNDogd2FybmluZzogdmFyaWFibGUgdHZfcGxsX2NudGwxIHNldCBidXQgbm90IHVzZWQg
Wy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpJdCBpcyBpbnRyb2R1Y2VkIGJ5IGNvbW1pdCA0
Y2UwMDFhYmFmYWYgKCJkcm0vcmFkZW9uL2ttczoKYWRkIGluaXRpYWwgcmFkZW9uIHR2LW91dCBz
dXBwb3J0LiIpLCBidXQgbmV2ZXIgdXNlZCwKc28gcmVtb3ZlIGl0LgoKUmVwb3J0ZWQtYnk6IEh1
bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhl
bmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9uX2xl
Z2FjeV90di5jIHwgOCArLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA3
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9yYWRlb24vcmFkZW9u
X2xlZ2FjeV90di5jIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fbGVnYWN5X3R2LmMK
aW5kZXggZjEzMmVlYy4uZDlkZjdmMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3JhZGVv
bi9yYWRlb25fbGVnYWN5X3R2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25f
bGVnYWN5X3R2LmMKQEAgLTUzNyw3ICs1MzcsNyBAQCB2b2lkIHJhZGVvbl9sZWdhY3lfdHZfbW9k
ZV9zZXQoc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyLAogCXVpbnQzMl90IHR2X21hc3Rlcl9j
bnRsLCB0dl9yZ2JfY250bCwgdHZfZGFjX2NudGw7CiAJdWludDMyX3QgdHZfbW9kdWxhdG9yX2Nu
dGwxLCB0dl9tb2R1bGF0b3JfY250bDI7CiAJdWludDMyX3QgdHZfdnNjYWxlcl9jbnRsMSwgdHZf
dnNjYWxlcl9jbnRsMjsKLQl1aW50MzJfdCB0dl9wbGxfY250bCwgdHZfcGxsX2NudGwxLCB0dl9m
dG90YWw7CisJdWludDMyX3QgdHZfcGxsX2NudGwsIHR2X2Z0b3RhbDsKIAl1aW50MzJfdCB0dl95
X2ZhbGxfY250bCwgdHZfeV9yaXNlX2NudGwsIHR2X3lfc2F3X3Rvb3RoX2NudGw7CiAJdWludDMy
X3QgbSwgbiwgcDsKIAljb25zdCB1aW50MTZfdCAqaG9yX3RpbWluZzsKQEAgLTcwOSwxMiArNzA5
LDYgQEAgdm9pZCByYWRlb25fbGVnYWN5X3R2X21vZGVfc2V0KHN0cnVjdCBkcm1fZW5jb2RlciAq
ZW5jb2RlciwKIAkJKCgobiA+PiA5KSAmIFJBREVPTl9UVl9OMEhJX01BU0spIDw8IFJBREVPTl9U
Vl9OMEhJX1NISUZUKSB8CiAJCSgocCAmIFJBREVPTl9UVl9QX01BU0spIDw8IFJBREVPTl9UVl9Q
X1NISUZUKTsKCi0JdHZfcGxsX2NudGwxID0gKCgoNCAmIFJBREVPTl9UVlBDUF9NQVNLKSA8PCBS
QURFT05fVFZQQ1BfU0hJRlQpIHwKLQkJCSgoNCAmIFJBREVPTl9UVlBWR19NQVNLKSA8PCBSQURF
T05fVFZQVkdfU0hJRlQpIHwKLQkJCSgoMSAmIFJBREVPTl9UVlBEQ19NQVNLKSA8PCBSQURFT05f
VFZQRENfU0hJRlQpIHwKLQkJCVJBREVPTl9UVkNMS19TUkNfU0VMX1RWUExMIHwKLQkJCVJBREVP
Tl9UVlBMTF9URVNUX0RJUyk7Ci0KIAl0dl9kYWMtPnR2LnR2X3V2X2FkciA9IDB4Yzg7CgogCWlm
ICh0dl9kYWMtPnR2X3N0ZCA9PSBUVl9TVERfTlRTQyB8fAotLQoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
