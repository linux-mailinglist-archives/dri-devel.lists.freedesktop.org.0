Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC5876CF07
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 15:42:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEE326E3C6;
	Thu, 18 Jul 2019 13:42:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A9BC6E3C6
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 13:42:54 +0000 (UTC)
Received: from threadripper.lan ([149.172.19.189]) by mrelayeu.kundenserver.de
 (mreue107 [212.227.15.145]) with ESMTPA (Nemesis) id
 1MysFQ-1ib6Sk0g0g-00vua9; Thu, 18 Jul 2019 15:42:44 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: Andrzej Hajda <a.hajda@samsung.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/bridge: fix RC_CORE dependency
Date: Thu, 18 Jul 2019 15:42:24 +0200
Message-Id: <20190718134240.2265724-1-arnd@arndb.de>
X-Mailer: git-send-email 2.20.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:LalC3fueD8ns/zVd1zUacsqU9/+XR1XYXbOtp5D2bbPKXX/+BVp
 pih72gFX2h3gXxMbIh6oAihZdwH+/zSdgbm4Y7bfVsDmTY6G5T3jf7i2UeGAM3F7/NhQS7x
 +uktKDqfLMK3uI0kgmWZoIlXK1TVxNOL/rDWwUnatfP7uVfpGNnlQOBWndwsJJ+XqMr5b1c
 P3Pgiqsmjam1WjkypwzAA==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SL2m0TBWswY=:c4RPZmLcftwWBIHOBql1ST
 Aj7g3NbIsK/RqoAvvZS4zv14zCFTUDURjXMcPEpPoL1ANhtfgPatR8MDdJGEXACdmtI6OiUJP
 KpfO9ZJiqVnUgz8M6plbm/SErsdODRZsN76lQ8PWs02Kk8hgpgPpKvgQ7EUV1gNfFSVz5c9FW
 vcM8zBE/RJR1sY1BBMEWrAwVWhXm5djLGsW8whrHOH+YNhi24tnCYlOFcpeGTxtNfk1xPb5re
 nyRGtqVVA/6oahbrPJKVDKxkSXojMfwZN2iqo4XXdDLHHbkVURnMYlDHSfK2qN83BehQvvAEf
 pd+h/0SmQef8O4SmrUOTq+VO7P4q1XV+tWsCSNAEzQltgZlE+EvF3D+djKDVpxuS8OMTUh/J/
 eKS6dSAXzHuiZXiMNe8vEwCfsRQ/rX2uom7j8scK3y4Vts9evB3QQy8xMtjNolJ5UbWznAPtr
 R3S/hr+Ljg1UEbumD/AcnWjZU7J4LiUmH9JpXntzT8HliOc3nww+G45i00fIKlBLMUc93BZhw
 NRzpOAeLwAxn+3bx/jeUWDlIghYldlztzWIMdbG568tJC9zAJcOnoVzh1gdRtdg0c4s64blVF
 rc+yMf+XJmkdWXS/whosAHGE8zySqupOx1bFq/3vsBBvdGkurVRMrTUVaIE/VooOK5jlH4c44
 ar19zSgnKQiIa7F4tTC13ZBjYTnLecbEygJDs2KlNSAUlvRS17+6bUnPymbvi0WozPJSwEzCK
 13nxZFneJ+klscHMykjxh6SU23zJzYiwBVf00A==
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
Cc: Arnd Bergmann <arnd@arndb.de>,
 =?UTF-8?q?Ronald=20Tschal=C3=A4r?= <ronald@innovation.ch>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNpbmcgJ2ltcGx5JyBjYXVzZXMgYSBuZXcgcHJvYmxlbSwgYXMgaXQgYWxsb3dzIHRoZSBjYXNl
IG9mCkNPTkZJR19JTlBVVD1tIHdpdGggUkNfQ09SRT15LCB3aGljaCBmYWlscyB0byBsaW5rOgoK
ZHJpdmVycy9tZWRpYS9yYy9yYy1tYWluLm86IEluIGZ1bmN0aW9uIGBpcl9kb19rZXl1cCc6CnJj
LW1haW4uYzooLnRleHQrMHgyYjQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBpbnB1dF9ldmVu
dCcKZHJpdmVycy9tZWRpYS9yYy9yYy1tYWluLm86IEluIGZ1bmN0aW9uIGByY19yZXBlYXQnOgpy
Yy1tYWluLmM6KC50ZXh0KzB4MzUwKTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgaW5wdXRfZXZl
bnQnCmRyaXZlcnMvbWVkaWEvcmMvcmMtbWFpbi5vOiBJbiBmdW5jdGlvbiBgcmNfYWxsb2NhdGVf
ZGV2aWNlJzoKcmMtbWFpbi5jOigudGV4dCsweDkwYyk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGlucHV0X2FsbG9jYXRlX2RldmljZScKCkFkZCBhICdkZXBlbmRzIG9uJyB0aGF0IGFsbG93cyBi
dWlsZGluZyBib3RoIHdpdGggYW5kIHdpdGhvdXQKQ09ORklHX1JDX0NPUkUsIGJ1dCBkaXNhbGxv
d3MgY29tYmluYXRpb25zIHRoYXQgZG9uJ3QgbGluay4KCkZpeGVzOiA1MDIzY2YzMjIxMGQgKCJk
cm0vYnJpZGdlOiBtYWtlIHJlbW90ZSBjb250cm9sIG9wdGlvbmFsIikKU2lnbmVkLW9mZi1ieTog
QXJuZCBCZXJnbWFubiA8YXJuZEBhcm5kYi5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L0tjb25maWcgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKaW5kZXggZjY0YzkxZGVmZGMzLi43MGE4ZWQyNTA1
YWEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvS2NvbmZpZworKysgYi9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL0tjb25maWcKQEAgLTg1LDggKzg1LDggQEAgY29uZmlnIERSTV9T
SUxfU0lJODYyMAogCXRyaXN0YXRlICJTaWxpY29uIEltYWdlIFNJSTg2MjAgSERNSS9NSEwgYnJp
ZGdlIgogCWRlcGVuZHMgb24gT0YKIAlzZWxlY3QgRFJNX0tNU19IRUxQRVIKKwlkZXBlbmRzIG9u
IFJDX0NPUkUgfHwgIVJDX0NPUkUKIAlpbXBseSBFWFRDT04KLQlpbXBseSBSQ19DT1JFCiAJaGVs
cAogCSAgU2lsaWNvbiBJbWFnZSBTSUk4NjIwIEhETUkvTUhMIGJyaWRnZSBjaGlwIGRyaXZlci4K
IAotLSAKMi4yMC4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2
ZWw=
