Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17AD6D07F9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 09:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9346E901;
	Wed,  9 Oct 2019 07:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD146E8DA;
 Wed,  9 Oct 2019 06:18:12 +0000 (UTC)
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 8B05A3C555409C355852;
 Wed,  9 Oct 2019 14:18:08 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS409-HUB.china.huawei.com
 (10.3.19.209) with Microsoft SMTP Server id 14.3.439.0; Wed, 9 Oct 2019
 14:18:02 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <amd-gfx@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/3] drm/amd/display: Remove set but not used variables
 'regval', 'speakers'
Date: Wed, 9 Oct 2019 14:25:12 +0800
Message-ID: <1570602312-49690-4-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
References: <1570602312-49690-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 09 Oct 2019 07:12:51 +0000
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
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIuYzogSW4gZnVuY3Rp
b24gZGNlMTEwX3VwZGF0ZV9nZW5lcmljX2luZm9fcGFja2V0Ogpkcml2ZXJzL2dwdS9kcm0vYW1k
L2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5jOjY4OjExOiB3YXJuaW5nOiB2YXJp
YWJsZSByZWd2YWwgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0K
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIuYzog
SW4gZnVuY3Rpb24gZGNlMTEwX3NlX2F1ZGlvX3NldHVwOgpkcml2ZXJzL2dwdS9kcm0vYW1kL2Rp
c3BsYXkvZGMvZGNlL2RjZV9zdHJlYW1fZW5jb2Rlci5jOjEzMzE6MTE6IHdhcm5pbmc6IHZhcmlh
YmxlIHNwZWFrZXJzIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVd
CgpUaGV5IGFyZSBub3QgdXNlZCBzaW5jZSBjb21taXQgNDU2MjIzNmIzYmMwICgiZHJtL2FtZC9k
YzoKQWRkIGRjIGRpc3BsYXkgZHJpdmVyICh2MikiKQoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3Qg
PGh1bGtjaUBodWF3ZWkuY29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0Bo
dWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY2UvZGNlX3N0
cmVhbV9lbmNvZGVyLmMgfCA1ICstLS0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyks
IDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5
L2RjL2RjZS9kY2Vfc3RyZWFtX2VuY29kZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kY2UvZGNlX3N0cmVhbV9lbmNvZGVyLmMKaW5kZXggNmVkOTIyYS4uMWE1YjY3MyAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjZS9kY2Vfc3RyZWFtX2Vu
Y29kZXIuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNlL2RjZV9zdHJl
YW1fZW5jb2Rlci5jCkBAIC02Nyw3ICs2Nyw2IEBAIHN0YXRpYyB2b2lkIGRjZTExMF91cGRhdGVf
Z2VuZXJpY19pbmZvX3BhY2tldCgKIAl1aW50MzJfdCBwYWNrZXRfaW5kZXgsCiAJY29uc3Qgc3Ry
dWN0IGRjX2luZm9fcGFja2V0ICppbmZvX3BhY2tldCkKIHsKLQl1aW50MzJfdCByZWd2YWw7CiAJ
LyogVE9ET0ZQR0EgRmlndXJlIG91dCBhIHByb3BlciBudW1iZXIgZm9yIG1heF9yZXRyaWVzIHBv
bGxpbmcgZm9yIGxvY2sKIAkgKiB1c2UgNTAgZm9yIG5vdy4KIAkgKi8KQEAgLTk5LDcgKzk4LDcg
QEAgc3RhdGljIHZvaWQgZGNlMTEwX3VwZGF0ZV9nZW5lcmljX2luZm9fcGFja2V0KAogCX0KIAkv
KiBjaG9vc2Ugd2hpY2ggZ2VuZXJpYyBwYWNrZXQgdG8gdXNlICovCiAJewotCQlyZWd2YWwgPSBS
RUdfUkVBRChBRk1UX1ZCSV9QQUNLRVRfQ09OVFJPTCk7CisJCVJFR19SRUFEKEFGTVRfVkJJX1BB
Q0tFVF9DT05UUk9MKTsKIAkJUkVHX1VQREFURShBRk1UX1ZCSV9QQUNLRVRfQ09OVFJPTCwKIAkJ
CQlBRk1UX0dFTkVSSUNfSU5ERVgsIHBhY2tldF9pbmRleCk7CiAJfQpAQCAtMTMzNSw3ICsxMzM0
LDYgQEAgc3RhdGljIHZvaWQgZGNlMTEwX3NlX2F1ZGlvX3NldHVwKAogewogCXN0cnVjdCBkY2Ux
MTBfc3RyZWFtX2VuY29kZXIgKmVuYzExMCA9IERDRTExMFNUUkVOQ19GUk9NX1NUUkVOQyhlbmMp
OwoKLQl1aW50MzJfdCBzcGVha2VycyA9IDA7CiAJdWludDMyX3QgY2hhbm5lbHMgPSAwOwoKIAlB
U1NFUlQoYXVkaW9faW5mbyk7CkBAIC0xMzQzLDcgKzEzNDEsNiBAQCBzdGF0aWMgdm9pZCBkY2Ux
MTBfc2VfYXVkaW9fc2V0dXAoCiAJCS8qIFRoaXMgc2hvdWxkIG5vdCBoYXBwZW4uaXQgZG9lcyBz
byB3ZSBkb24ndCBnZXQgQlNPRCovCiAJCXJldHVybjsKCi0Jc3BlYWtlcnMgPSBhdWRpb19pbmZv
LT5mbGFncy5pbmZvLkFMTFNQRUFLRVJTOwogCWNoYW5uZWxzID0gc3BlYWtlcnNfdG9fY2hhbm5l
bHMoYXVkaW9faW5mby0+ZmxhZ3Muc3BlYWtlcl9mbGFncykuYWxsOwoKIAkvKiBzZXR1cCB0aGUg
YXVkaW8gc3RyZWFtIHNvdXJjZSBzZWxlY3QgKGF1ZGlvIC0+IGRpZyBtYXBwaW5nKSAqLwotLQoy
LjcuNAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
