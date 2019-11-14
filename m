Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66261FD7A6
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2019 09:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AD4B6E13A;
	Fri, 15 Nov 2019 08:05:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD7896E22C;
 Thu, 14 Nov 2019 12:29:15 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 5D8EFEE254581B469C02;
 Thu, 14 Nov 2019 20:29:14 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.439.0; Thu, 14 Nov 2019
 20:29:03 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/4] drm/amd/display: remove set but not used variable 'bp' in
 bios_parser2.c
Date: Thu, 14 Nov 2019 20:36:25 +0800
Message-ID: <1573734987-119703-3-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573734987-119703-1-git-send-email-zhengbin13@huawei.com>
References: <1573734987-119703-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 15 Nov 2019 08:05:26 +0000
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
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2Jpb3MvYmlvc19wYXJzZXIyLmM6IEluIGZ1bmN0aW9uIGJp
b3NfZ2V0X2JvYXJkX2xheW91dF9pbmZvOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMv
Ymlvcy9iaW9zX3BhcnNlcjIuYzoxODI2OjIyOiB3YXJuaW5nOiB2YXJpYWJsZSBicCBzZXQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgaXMgaW50cm9kdWNlZCBi
eSBjb21taXQgMWVlZWRiY2MyMGQ2ICgiZHJtL2FtZC9kaXNwbGF5OgpnZXQgYm9hcmQgbGF5b3V0
IGZvciBlZGlkIGVtdWxhdGlvbiIpLCBidXQgbmV2ZXIgdXNlZCwKc28gcmVtb3ZlIGl0LgoKUmVw
b3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6
aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQv
ZGlzcGxheS9kYy9iaW9zL2Jpb3NfcGFyc2VyMi5jIHwgMiAtLQogMSBmaWxlIGNoYW5nZWQsIDIg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2Jpb3MvYmlvc19wYXJzZXIyLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlv
cy9iaW9zX3BhcnNlcjIuYwppbmRleCA2ZTI5YmE4Li45ZGM4ZDRlIDEwMDY0NAotLS0gYS9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjIuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvYmlvcy9iaW9zX3BhcnNlcjIuYwpAQCAtMTgzOCw3
ICsxODM4LDYgQEAgc3RhdGljIGVudW0gYnBfcmVzdWx0IGJpb3NfZ2V0X2JvYXJkX2xheW91dF9p
bmZvKAogCXN0cnVjdCBib2FyZF9sYXlvdXRfaW5mbyAqYm9hcmRfbGF5b3V0X2luZm8pCiB7CiAJ
dW5zaWduZWQgaW50IGk7Ci0Jc3RydWN0IGJpb3NfcGFyc2VyICpicDsKIAllbnVtIGJwX3Jlc3Vs
dCByZWNvcmRfcmVzdWx0OwoKIAljb25zdCB1bnNpZ25lZCBpbnQgc2xvdF9pbmRleF90b192Ymlv
c19pZFtNQVhfQk9BUkRfU0xPVFNdID0gewpAQCAtMTg0Nyw3ICsxODQ2LDYgQEAgc3RhdGljIGVu
dW0gYnBfcmVzdWx0IGJpb3NfZ2V0X2JvYXJkX2xheW91dF9pbmZvKAogCQkwLCAwCiAJfTsKCi0J
YnAgPSBCUF9GUk9NX0RDQihkY2IpOwogCWlmIChib2FyZF9sYXlvdXRfaW5mbyA9PSBOVUxMKSB7
CiAJCURDX0xPR19ERVRFQ1RJT05fRURJRF9QQVJTRVIoIkludmFsaWQgYm9hcmRfbGF5b3V0X2lu
Zm9cbiIpOwogCQlyZXR1cm4gQlBfUkVTVUxUX0JBRElOUFVUOwotLQoyLjcuNAoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
