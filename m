Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E386324BFD
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 09:25:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1741C6EC61;
	Thu, 25 Feb 2021 08:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9EF76EC4D;
 Thu, 25 Feb 2021 07:26:23 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DmPRl0XdtzlPlk;
 Thu, 25 Feb 2021 15:24:19 +0800 (CST)
Received: from huawei.com (10.69.192.56) by DGGEMS408-HUB.china.huawei.com
 (10.3.19.208) with Microsoft SMTP Server id 14.3.498.0; Thu, 25 Feb 2021
 15:26:12 +0800
From: Luo Jiaxing <luojiaxing@huawei.com>
To: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <bskeggs@redhat.com>
Subject: [PATCH v1 1/2] drm/nouveau/kms/nv50-: Remove several set but not used
 variables "ret" in disp.c
Date: Thu, 25 Feb 2021 15:27:06 +0800
Message-ID: <1614238026-43279-1-git-send-email-luojiaxing@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 25 Feb 2021 08:25:29 +0000
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
Cc: luojiaxing@huawei.com, linux-kernel@vger.kernel.org, linuxarm@openeuler.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyB3YXJuaW5nIHdoZW4gdXNpbmcgVz0xIHRvIGJ1aWxkIGtlcm5l
bDoKCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzogSW4gZnVuY3Rpb24g
4oCYbnY1MF9tc3RtX2NsZWFudXDigJk6CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUw
L2Rpc3AuYzoxMzg5OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1
c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogMTM4OSB8ICBpbnQgcmV0OwogICAgICB8
ICAgICAgXn5+CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzogSW4gZnVu
Y3Rpb24g4oCYbnY1MF9tc3RtX3ByZXBhcmXigJk6CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuYzoxNDEzOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQogMTQxMyB8ICBpbnQgcmV0Owog
ICAgICB8ICAgICAgXn5+CgpTaWduZWQtb2ZmLWJ5OiBMdW8gSmlheGluZyA8bHVvamlheGluZ0Bo
dWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8
IDggKysrLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5j
IGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCmluZGV4IDE5NjYxMmEu
LjgyOGY0OGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKQEAgLTEz
ODYsMTIgKzEzODYsMTEgQEAgbnY1MF9tc3RtX2NsZWFudXAoc3RydWN0IG52NTBfbXN0bSAqbXN0
bSkKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG1zdG0tPm91dHAt
PmJhc2UuYmFzZS5kZXYpOwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgcmV0
OwogCiAJTlZfQVRPTUlDKGRybSwgIiVzOiBtc3RtIGNsZWFudXBcbiIsIG1zdG0tPm91dHAtPmJh
c2UuYmFzZS5uYW1lKTsKLQlyZXQgPSBkcm1fZHBfY2hlY2tfYWN0X3N0YXR1cygmbXN0bS0+bWdy
KTsKKwlkcm1fZHBfY2hlY2tfYWN0X3N0YXR1cygmbXN0bS0+bWdyKTsKIAotCXJldCA9IGRybV9k
cF91cGRhdGVfcGF5bG9hZF9wYXJ0MigmbXN0bS0+bWdyKTsKKwlkcm1fZHBfdXBkYXRlX3BheWxv
YWRfcGFydDIoJm1zdG0tPm1ncik7CiAKIAlkcm1fZm9yX2VhY2hfZW5jb2RlcihlbmNvZGVyLCBt
c3RtLT5vdXRwLT5iYXNlLmJhc2UuZGV2KSB7CiAJCWlmIChlbmNvZGVyLT5lbmNvZGVyX3R5cGUg
PT0gRFJNX01PREVfRU5DT0RFUl9EUE1TVCkgewpAQCAtMTQxMCwxMCArMTQwOSw5IEBAIG52NTBf
bXN0bV9wcmVwYXJlKHN0cnVjdCBudjUwX21zdG0gKm1zdG0pCiB7CiAJc3RydWN0IG5vdXZlYXVf
ZHJtICpkcm0gPSBub3V2ZWF1X2RybShtc3RtLT5vdXRwLT5iYXNlLmJhc2UuZGV2KTsKIAlzdHJ1
Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7Ci0JaW50IHJldDsKIAogCU5WX0FUT01JQyhkcm0sICIl
czogbXN0bSBwcmVwYXJlXG4iLCBtc3RtLT5vdXRwLT5iYXNlLmJhc2UubmFtZSk7Ci0JcmV0ID0g
ZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZtc3RtLT5tZ3IpOworCWRybV9kcF91cGRhdGVf
cGF5bG9hZF9wYXJ0MSgmbXN0bS0+bWdyKTsKIAogCWRybV9mb3JfZWFjaF9lbmNvZGVyKGVuY29k
ZXIsIG1zdG0tPm91dHAtPmJhc2UuYmFzZS5kZXYpIHsKIAkJaWYgKGVuY29kZXItPmVuY29kZXJf
dHlwZSA9PSBEUk1fTU9ERV9FTkNPREVSX0RQTVNUKSB7Ci0tIAoyLjcuNAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
