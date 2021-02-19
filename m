Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F8131F947
	for <lists+dri-devel@lfdr.de>; Fri, 19 Feb 2021 13:17:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7540A6EB25;
	Fri, 19 Feb 2021 12:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D7516E8C9
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Feb 2021 12:17:13 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 6E45680173;
 Fri, 19 Feb 2021 13:17:08 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/3] GUD USB Display driver
Date: Fri, 19 Feb 2021 13:16:59 +0100
Message-Id: <20210219121702.50964-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Kb38TzQD c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20
 a=hV_BJ6Dg7UyOQLaYyLEA:9 a=QEXdDO2ut3YA:10 a=7zwkRhCwzGnCyznlyk9i:22
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
eSBQaSBaZXJvLzQuCgpDaGFuZ2VzIGluIHRoaXMgdmVyc2lvbjoKLSBVc2Ugb2JqLXkgaW4gTWFr
ZWZpbGUgKFBldGVyKQotIEZpeCBtaXNzaW5nIGxlMzJfdG9fY3B1KCkgd2hlbiB1c2luZyBHVURf
RElTUExBWV9NQUdJQyAoUGV0ZXIpCi0gU2V0IGluaXRpYWwgYnJpZ2h0bmVzcyBvbiBiYWNrbGln
aHQgZGV2aWNlCgoKTm9yYWxmLgoKWzFdIGh0dHBzOi8vZ2l0aHViLmNvbS9ub3Ryby9ndWQvd2lr
aQoKCk5vcmFsZiBUcsO4bm5lcyAoMyk6CiAgZHJtL3VhcGk6IEFkZCBVU0IgY29ubmVjdG9yIHR5
cGUKICBkcm0vcHJvYmUtaGVscGVyOiBDaGVjayBlcG9jaCBjb3VudGVyIGluIG91dHB1dF9wb2xs
X2V4ZWN1dGUoKQogIGRybTogQWRkIEdVRCBVU0IgRGlzcGxheSBkcml2ZXIKCiBNQUlOVEFJTkVS
UyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCArCiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZp
ZyAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dwdS9kcm0vTWFrZWZpbGUgICAgICAgICAg
ICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jICAgICB8ICAgMSArCiBk
cml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5jICB8ICAgNyArLQogZHJpdmVycy9ncHUv
ZHJtL2d1ZC9LY29uZmlnICAgICAgICAgfCAgMTQgKwogZHJpdmVycy9ncHUvZHJtL2d1ZC9NYWtl
ZmlsZSAgICAgICAgfCAgIDQgKwogZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfY29ubmVjdG9yLmMg
fCA3MzggKysrKysrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2d1ZC9n
dWRfZHJ2LmMgICAgICAgfCA2MjUgKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1
L2RybS9ndWQvZ3VkX2ludGVybmFsLmggIHwgMTQ5ICsrKysrKwogZHJpdmVycy9ncHUvZHJtL2d1
ZC9ndWRfcGlwZS5jICAgICAgfCA0NzUgKysrKysrKysrKysrKysrKysrCiBpbmNsdWRlL2RybS9n
dWQuaCAgICAgICAgICAgICAgICAgICB8IDM1NiArKysrKysrKysrKysrKwogaW5jbHVkZS91YXBp
L2RybS9kcm1fbW9kZS5oICAgICAgICAgfCAgIDEgKwogMTMgZmlsZXMgY2hhbmdlZCwgMjM4MCBp
bnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9n
cHUvZHJtL2d1ZC9LY29uZmlnCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2d1
ZC9NYWtlZmlsZQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Nv
bm5lY3Rvci5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfZHJ2
LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9pbnRlcm5hbC5o
CiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfcGlwZS5jCiBjcmVh
dGUgbW9kZSAxMDA2NDQgaW5jbHVkZS9kcm0vZ3VkLmgKCi0tIAoyLjIzLjAKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
