Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A66CF3BD
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 09:28:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248F06E1D3;
	Tue,  8 Oct 2019 07:28:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD8B6E1D3
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 07:09:02 +0000 (UTC)
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id CF6209AB091693E9969C;
 Tue,  8 Oct 2019 15:08:58 +0800 (CST)
Received: from huawei.com (10.90.53.225) by DGGEMS403-HUB.china.huawei.com
 (10.3.19.203) with Microsoft SMTP Server id 14.3.439.0; Tue, 8 Oct 2019
 15:08:38 +0800
From: zhengbin <zhengbin13@huawei.com>
To: <tomi.valkeinen@ti.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/4] drm/omap: Remove set but not used variable 'plane'
Date: Tue, 8 Oct 2019 15:15:46 +0800
Message-ID: <1570518949-47574-2-git-send-email-zhengbin13@huawei.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
References: <1570518949-47574-1-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 08 Oct 2019 07:28:36 +0000
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
cHUvZHJtL29tYXBkcm0vb21hcF9mYi5jOiBJbiBmdW5jdGlvbiBvbWFwX2ZyYW1lYnVmZmVyX3Vw
ZGF0ZV9zY2Fub3V0Ogpkcml2ZXJzL2dwdS9kcm0vb21hcGRybS9vbWFwX2ZiLmM6MTMwOjE2OiB3
YXJuaW5nOiB2YXJpYWJsZSBwbGFuZSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0
LXZhcmlhYmxlXQoKSXQgaXMgbm90IHVzZWQgc2luY2UgY29tbWl0IDJlY2NlZWI1M2IxOSAoImRy
bS9vbWFwOgpNb3ZlIGJ1ZmZlciBwaXRjaC9vZmZzZXQgdG8gZHJtX2ZyYW1lYnVmZmVyIikKClJl
cG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTog
emhlbmdiaW4gPHpoZW5nYmluMTNAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vb21h
cGRybS9vbWFwX2ZiLmMgfCAzIC0tLQogMSBmaWxlIGNoYW5nZWQsIDMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL29tYXBkcm0vb21hcF9mYi5jIGIvZHJpdmVycy9n
cHUvZHJtL29tYXBkcm0vb21hcF9mYi5jCmluZGV4IDFiOGI1MTAuLjAwMWY0MjUgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvZ3B1L2RybS9vbWFwZHJtL29tYXBfZmIuYworKysgYi9kcml2ZXJzL2dwdS9k
cm0vb21hcGRybS9vbWFwX2ZiLmMKQEAgLTEzNSw3ICsxMzUsNiBAQCB2b2lkIG9tYXBfZnJhbWVi
dWZmZXJfdXBkYXRlX3NjYW5vdXQoc3RydWN0IGRybV9mcmFtZWJ1ZmZlciAqZmIsCiB7CiAJc3Ry
dWN0IG9tYXBfZnJhbWVidWZmZXIgKm9tYXBfZmIgPSB0b19vbWFwX2ZyYW1lYnVmZmVyKGZiKTsK
IAljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICpmb3JtYXQgPSBvbWFwX2ZiLT5mb3JtYXQ7
Ci0Jc3RydWN0IHBsYW5lICpwbGFuZSA9ICZvbWFwX2ZiLT5wbGFuZXNbMF07CiAJdTMyIHgsIHks
IG9yaWVudCA9IDA7CgogCWluZm8tPmZvdXJjYyA9IGZiLT5mb3JtYXQtPmZvcm1hdDsKQEAgLTIw
OSw4ICsyMDgsNiBAQCB2b2lkIG9tYXBfZnJhbWVidWZmZXJfdXBkYXRlX3NjYW5vdXQoc3RydWN0
IGRybV9mcmFtZWJ1ZmZlciAqZmIsCiAJaW5mby0+c2NyZWVuX3dpZHRoIC89IGZvcm1hdC0+Y3Bw
WzBdOwoKIAlpZiAoZmItPmZvcm1hdC0+Zm9ybWF0ID09IERSTV9GT1JNQVRfTlYxMikgewotCQlw
bGFuZSA9ICZvbWFwX2ZiLT5wbGFuZXNbMV07Ci0KIAkJaWYgKGluZm8tPnJvdGF0aW9uX3R5cGUg
PT0gT01BUF9EU1NfUk9UX1RJTEVSKSB7CiAJCQlXQVJOX09OKCEob21hcF9nZW1fZmxhZ3MoZmIt
Pm9ialsxXSkgJiBPTUFQX0JPX1RJTEVEKSk7CiAJCQlvbWFwX2dlbV9yb3RhdGVkX2RtYV9hZGRy
KGZiLT5vYmpbMV0sIG9yaWVudCwgeC8yLCB5LzIsCi0tCjIuNy40CgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
