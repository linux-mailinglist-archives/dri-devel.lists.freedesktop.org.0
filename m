Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E9CCCB41
	for <lists+dri-devel@lfdr.de>; Sat,  5 Oct 2019 18:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443256E3B0;
	Sat,  5 Oct 2019 16:37:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE2BB6E0C0;
 Sat,  5 Oct 2019 02:37:37 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 08A88F4C61F62CB10FBC;
 Sat,  5 Oct 2019 10:37:34 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.439.0; Sat, 5 Oct 2019
 10:37:25 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <harry.wentland@amd.com>, <sunpeng.li@amd.com>,
 <alexander.deucher@amd.com>, <christian.koenig@amd.com>,
 <David1.Zhou@amd.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <amd-gfx@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 3/5] drm/amd/display: Remove set but not used variables
 'h_ratio_chroma', 'v_ratio_chroma'
Date: Sat, 5 Oct 2019 10:44:34 +0800
Message-ID: <1570243476-44419-4-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
References: <1570243476-44419-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 05 Oct 2019 16:37:29 +0000
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
cHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2R3Yl9zY2wuYzogSW4gZnVuY3Rpb24g
ZHdiX3Byb2dyYW1faG9yel9zY2FsYXI6CmRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9kd2Jfc2NsLmM6NzI1OjExOiB3YXJuaW5nOiB2YXJpYWJsZSBoX3JhdGlvX2No
cm9tYSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQpkcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHdiX3NjbC5jOiBJbiBmdW5jdGlv
biBkd2JfcHJvZ3JhbV92ZXJ0X3NjYWxhcjoKZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX2R3Yl9zY2wuYzo4MDY6MTE6IHdhcm5pbmc6IHZhcmlhYmxlIHZfcmF0aW9f
Y2hyb21hIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCgpUaGV5
IGFyZSBub3QgdXNlZCBzaW5jZSBjb21taXQgMzQ1NDI5YTY3YzQ4ICgiZHJtL2FtZC9kaXNwbGF5
OgpBZGQgRENOMiBEV0IiKQoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1bGtjaUBodWF3ZWku
Y29tPgpTaWduZWQtb2ZmLWJ5OiB6aGVuZ2JpbiA8emhlbmdiaW4xM0BodWF3ZWkuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kd2Jfc2NsLmMgfCA0
IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kY24yMC9kY24yMF9kd2Jfc2NsLmMgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHdiX3NjbC5jCmluZGV4IGNkOGJj
OTIuLjg4MDk1NGEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9k
Y24yMC9kY24yMF9kd2Jfc2NsLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2Rj
L2RjbjIwL2RjbjIwX2R3Yl9zY2wuYwpAQCAtNzIyLDcgKzcyMiw2IEBAIGJvb2wgZHdiX3Byb2dy
YW1faG9yel9zY2FsYXIoc3RydWN0IGRjbjIwX2R3YmMgKmR3YmMyMCwKIAkJc3RydWN0IHNjYWxp
bmdfdGFwcyBudW1fdGFwcykKIHsKIAl1aW50MzJfdCBoX3JhdGlvX2x1bWEgPSAxOwotCXVpbnQz
Ml90IGhfcmF0aW9fY2hyb21hID0gMTsKIAl1aW50MzJfdCBoX3RhcHNfbHVtYSA9IG51bV90YXBz
LmhfdGFwczsKIAl1aW50MzJfdCBoX3RhcHNfY2hyb21hID0gbnVtX3RhcHMuaF90YXBzX2M7CiAJ
aW50MzJfdCBoX2luaXRfcGhhc2VfbHVtYSA9IDA7CkBAIC03NDcsNyArNzQ2LDYgQEAgYm9vbCBk
d2JfcHJvZ3JhbV9ob3J6X3NjYWxhcihzdHJ1Y3QgZGNuMjBfZHdiYyAqZHdiYzIwLAogCQloX3Jh
dGlvX2x1bWEgPSAtMTsKIAllbHNlCiAJCWhfcmF0aW9fbHVtYSA9IGRjX2ZpeHB0X3UzZDE5KHRt
cF9oX3JhdGlvX2x1bWEpIDw8IDU7Ci0JaF9yYXRpb19jaHJvbWEgPSBoX3JhdGlvX2x1bWEgKiAy
OwoKIAkvKlByb2dyYW0gcmF0aW8qLwogCVJFR19VUERBVEUoV0JTQ0xfSE9SWl9GSUxURVJfU0NB
TEVfUkFUSU8sIFdCU0NMX0hfU0NBTEVfUkFUSU8sIGhfcmF0aW9fbHVtYSk7CkBAIC04MDMsNyAr
ODAxLDYgQEAgYm9vbCBkd2JfcHJvZ3JhbV92ZXJ0X3NjYWxhcihzdHJ1Y3QgZGNuMjBfZHdiYyAq
ZHdiYzIwLAogCQllbnVtIGR3Yl9zdWJzYW1wbGVfcG9zaXRpb24gc3Vic2FtcGxlX3Bvc2l0aW9u
KQogewogCXVpbnQzMl90IHZfcmF0aW9fbHVtYSA9IDE7Ci0JdWludDMyX3Qgdl9yYXRpb19jaHJv
bWEgPSAxOwogCXVpbnQzMl90IHZfdGFwc19sdW1hID0gbnVtX3RhcHMudl90YXBzOwogCXVpbnQz
Ml90IHZfdGFwc19jaHJvbWEgPSBudW1fdGFwcy52X3RhcHNfYzsKIAlpbnQzMl90IHZfaW5pdF9w
aGFzZV9sdW1hID0gMDsKQEAgLTgyNyw3ICs4MjQsNiBAQCBib29sIGR3Yl9wcm9ncmFtX3ZlcnRf
c2NhbGFyKHN0cnVjdCBkY24yMF9kd2JjICpkd2JjMjAsCiAJCXZfcmF0aW9fbHVtYSA9IC0xOwog
CWVsc2UKIAkJdl9yYXRpb19sdW1hID0gZGNfZml4cHRfdTNkMTkodG1wX3ZfcmF0aW9fbHVtYSkg
PDwgNTsKLQl2X3JhdGlvX2Nocm9tYSA9IHZfcmF0aW9fbHVtYSAqIDI7CgogCS8qUHJvZ3JhbSBy
YXRpbyovCiAJUkVHX1VQREFURShXQlNDTF9WRVJUX0ZJTFRFUl9TQ0FMRV9SQVRJTywgV0JTQ0xf
Vl9TQ0FMRV9SQVRJTywgdl9yYXRpb19sdW1hKTsKLS0KMi43LjQKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJp
LWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
