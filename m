Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB70A31A3F5
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 18:46:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3814B6E197;
	Fri, 12 Feb 2021 17:46:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E6AC6E155
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 17:46:28 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id AED6980380;
 Fri, 12 Feb 2021 18:46:23 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/3] GUD USB Display driver
Date: Fri, 12 Feb 2021 18:46:06 +0100
Message-Id: <20210212174609.58977-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Kb38TzQD c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20
 a=bKmTZf8EAmjS18ln50IA:9 a=QEXdDO2ut3YA:10 a=7zwkRhCwzGnCyznlyk9i:22
 a=Z5ABNNGmrOfJ6cZ5bIyy:22 a=jd6J4Gguk5HxikPWLKER:22
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
Cc: hudson@trmm.net, markus@raatikainen.cc, sam@ravnborg.org,
 linux-usb@vger.kernel.org, th020394@gmail.com, lkundrak@v3.sk,
 pontus.fuchs@gmail.com, peter@stuge.se
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksCgpBIHdoaWxlIGJhY2sgSSBoYWQgdGhlIGlkZWEgdG8gdHVybiBhIFJhc3BiZXJyeSBQaSBa
ZXJvIGludG8gYSAkNQpVU0IgdG8gSERNSS9TRFRWL0RQSSBkaXNwbGF5IGFkYXB0ZXIuCgpUaGUg
cHJvdG9jb2wgaXMgb3BlbiBzbyBwZW9wbGUgYXJlIGZyZWUgdG8gbWFrZSBkaXNwbGF5cyBpbXBs
ZW1lbnRpbmcgaXQgYW5kCnVzZSB0aGlzIGRyaXZlciwgYWxsIHRoYXQncyBuZWVkZWQgaXMgdG8g
YWRkIGEgVVNCIHZpZDpwaWQgdG8gdGhlIGRyaXZlciBmb3IKdGhlIGRpc3BsYXkuCgpTZWUgdGhl
IHdpa2lbMV0gZm9yIG1vcmUgaW5mb3JtYXRpb24gYW5kIGltYWdlcyBmb3IgdGhlIFJhc3BiZXJy
eSBQaSBaZXJvLzQuCgpNaW5vciBjaGFuZ2VzIHRoaXMgdGltZSwgbm8gcHJvdG9jb2wgY2hhbmdl
cy4KCk5vcmFsZi4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vbm90cm8vZ3VkL3dpa2kKCgpOb3Jh
bGYgVHLDuG5uZXMgKDMpOgogIGRybS91YXBpOiBBZGQgVVNCIGNvbm5lY3RvciB0eXBlCiAgZHJt
L3Byb2JlLWhlbHBlcjogQ2hlY2sgZXBvY2ggY291bnRlciBpbiBvdXRwdXRfcG9sbF9leGVjdXRl
KCkKICBkcm06IEFkZCBHZW5lcmljIFVTQiBEaXNwbGF5IGRyaXZlcgoKIE1BSU5UQUlORVJTICAg
ICAgICAgICAgICAgICAgICAgICAgIHwgICA4ICsKIGRyaXZlcnMvZ3B1L2RybS9LY29uZmlnICAg
ICAgICAgICAgIHwgICAyICsKIGRyaXZlcnMvZ3B1L2RybS9NYWtlZmlsZSAgICAgICAgICAgIHwg
ICAxICsKIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgICAgIHwgICAxICsKIGRyaXZl
cnMvZ3B1L2RybS9kcm1fcHJvYmVfaGVscGVyLmMgIHwgICA3ICstCiBkcml2ZXJzL2dwdS9kcm0v
Z3VkL0tjb25maWcgICAgICAgICB8ICAxNCArCiBkcml2ZXJzL2dwdS9kcm0vZ3VkL01ha2VmaWxl
ICAgICAgICB8ICAgNCArCiBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9jb25uZWN0b3IuYyB8IDcz
NyArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9k
cnYuYyAgICAgICB8IDYyNSArKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJt
L2d1ZC9ndWRfaW50ZXJuYWwuaCAgfCAxNDkgKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1
ZF9waXBlLmMgICAgICB8IDQ3NSArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2d1ZC5o
ICAgICAgICAgICAgICAgICAgIHwgMzU2ICsrKysrKysrKysrKysrCiBpbmNsdWRlL3VhcGkvZHJt
L2RybV9tb2RlLmggICAgICAgICB8ICAgMSArCiAxMyBmaWxlcyBjaGFuZ2VkLCAyMzc5IGluc2Vy
dGlvbnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9k
cm0vZ3VkL0tjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL01h
a2VmaWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfY29ubmVj
dG9yLmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9kcnYuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2ludGVybmFsLmgKIGNy
ZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBpbmNsdWRlL2RybS9ndWQuaAoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
