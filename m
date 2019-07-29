Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134B77A297
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jul 2019 09:55:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879116E42D;
	Tue, 30 Jul 2019 07:55:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53398898AF
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jul 2019 09:07:08 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 39A4953CA7CE7A5079F3;
 Mon, 29 Jul 2019 17:07:03 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS407-HUB.china.huawei.com
 (10.3.19.207) with Microsoft SMTP Server id 14.3.439.0; Mon, 29 Jul 2019
 17:06:55 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <a.hajda@samsung.com>, <narmstrong@baylibre.com>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@siol.net>, <airlied@linux.ie>, <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: tc358764: Fix build error
Date: Mon, 29 Jul 2019 17:05:20 +0800
Message-ID: <20190729090520.25968-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 30 Jul 2019 07:55:03 +0000
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
Cc: YueHaibing <yuehaibing@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SWYgQ09ORklHX0RSTV9UT1NISUJBX1RDMzU4NzY0PXkgYnV0IENPTkZJR19EUk1fS01TX0hFTFBF
Uj1tLApidWlsZGluZyBmYWlsczoKCmRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvdGMzNTg3NjQubzoo
LnJvZGF0YSsweDIyOCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGRybV9hdG9taWNfaGVscGVy
X2Nvbm5lY3Rvcl9yZXNldCcKZHJpdmVycy9ncHUvZHJtL2JyaWRnZS90YzM1ODc2NC5vOigucm9k
YXRhKzB4MjQwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZHJtX2hlbHBlcl9wcm9iZV9zaW5n
bGVfY29ubmVjdG9yX21vZGVzJwpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0Lm86KC5y
b2RhdGErMHgyNjgpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1fYXRvbWljX2hlbHBlcl9j
b25uZWN0b3JfZHVwbGljYXRlX3N0YXRlJwpkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3RjMzU4NzY0
Lm86KC5yb2RhdGErMHgyNzApOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBkcm1fYXRvbWljX2hl
bHBlcl9jb25uZWN0b3JfZGVzdHJveV9zdGF0ZScKCkxpa2UgVEMzNTg3NjcsIHNlbGVjdCBEUk1f
S01TX0hFTFBFUiB0byBmaXggdGhpcywgYW5kCmNoYW5nZSB0byBzZWxlY3QgRFJNX1BBTkVMIHRv
IGF2b2lkIHJlY3Vyc2l2ZSBkZXBlbmRlbmN5LgoKUmVwb3J0ZWQtYnk6IEh1bGsgUm9ib3QgPGh1
bGtjaUBodWF3ZWkuY29tPgpGaXhlczogZjM4YjdjY2E2ZDBlICgiZHJtL2JyaWRnZTogdGMzNTg3
NjQ6IEFkZCBEU0kgdG8gTFZEUyBicmlkZ2UgZHJpdmVyIikKU2lnbmVkLW9mZi1ieTogWXVlSGFp
YmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2Uv
S2NvbmZpZyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnIGIvZHJp
dmVycy9ncHUvZHJtL2JyaWRnZS9LY29uZmlnCmluZGV4IGE2ZWVjOTAuLjMyM2Y3MmQgMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9k
cm0vYnJpZGdlL0tjb25maWcKQEAgLTExNiw5ICsxMTYsMTAgQEAgY29uZmlnIERSTV9USElORV9U
SEM2M0xWRDEwMjQKIAogY29uZmlnIERSTV9UT1NISUJBX1RDMzU4NzY0CiAJdHJpc3RhdGUgIlRD
MzU4NzY0IERTSS9MVkRTIGJyaWRnZSIKLQlkZXBlbmRzIG9uIERSTSAmJiBEUk1fUEFORUwKIAlk
ZXBlbmRzIG9uIE9GCiAJc2VsZWN0IERSTV9NSVBJX0RTSQorCXNlbGVjdCBEUk1fS01TX0hFTFBF
UgorCXNlbGVjdCBEUk1fUEFORUwKIAloZWxwCiAJICBUb3NoaWJhIFRDMzU4NzY0IERTSS9MVkRT
IGJyaWRnZSBkcml2ZXIuCiAKLS0gCjIuNy40CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
