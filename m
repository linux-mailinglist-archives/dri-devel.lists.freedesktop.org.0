Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C512A2FD689
	for <lists+dri-devel@lfdr.de>; Wed, 20 Jan 2021 18:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8764E6E0C6;
	Wed, 20 Jan 2021 17:10:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 113406E3D8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Jan 2021 17:10:52 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 5310580142;
 Wed, 20 Jan 2021 18:00:52 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/3] Generic USB Display driver
Date: Wed, 20 Jan 2021 18:00:30 +0100
Message-Id: <20210120170033.38468-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=LfoSFAXi c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20
 a=LXfqoFB-L96-znvajxUA:9 a=QEXdDO2ut3YA:10 a=7zwkRhCwzGnCyznlyk9i:22
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
ZXJvIGludG8gYSAkNQpVU0IgdG8gSERNSS9TRFRWL0RTSS9EUEkgZGlzcGxheSBhZGFwdGVyLgoK
VGhlIHJlYXNvbiBmb3IgY2FsbGluZyBpdCAnR2VuZXJpYycgaXMgc28gYW55b25lIGNhbiBtYWtl
IGEgVVNCCmRpc3BsYXkvYWRhcHRlciBhZ2FpbnN0IHRoaXMgZHJpdmVyLCBhbGwgdGhhdCdzIG5l
ZWRlZCBpcyB0byBhZGQgYSBVU0IKdmlkOnBpZC4KClVuZm9ydHVuYXRlbHkgSSd2ZSBoYWQgc29t
ZSBjb21wb3VuZGluZyBoZWFsdGggcHJvYmxlbXMgdGhhdCBoYXZlCnNldmVyYWxseSBsaW1pdGVk
IHRoZSB0aW1lIEkgY2FuIHNwZW5kIGluIGZyb250IG9mIGEgY29tcHV0ZXIuIEZvciB0aGlzCnJl
YXNvbiBJJ3ZlIGRlY2lkZWQgdG8ga2VlcCB0aGUgZ2FkZ2V0IGRyaXZlciBvdXQtb2YtdHJlZSBh
bmQgZm9jdXMgb24KZ2V0dGluZyB0aGUgaG9zdCBkcml2ZXIgbWVyZ2VkIGZpcnN0LgoKU2VlIHRo
ZSB3aWtpWzFdIGZvciBtb3JlIGluZm9ybWF0aW9uIGFuZCBpbWFnZXMgZm9yIHRoZSBSYXNwYmVy
cnkgUGkKWmVyby80LgoKT25lIGJpZyBjaGFuZ2UgdGhpcyB0aW1lIGlzIHRoYXQgSSd2ZSBmb2xs
b3dlZCBQZXRlciBTdHVnZSdzIGFkdmljZSB0bwpub3QgbGV0IERSTSBzdHVmZiBsZWFrIGludG8g
dGhlIFVTQiBwcm90b2NvbC4gVGhpcyBoYXMgbWFkZSB0aGUgcHJvdG9jb2wKZWFzaWVyIHRvIHVu
ZGVyc3RhbmQganVzdCBmcm9tIHJlYWRpbmcgdGhlIGhlYWRlciBmaWxlLgoKTm9yYWxmLgoKWzFd
IGh0dHBzOi8vZ2l0aHViLmNvbS9ub3Ryby9ndWQvd2lraQoKCk5vcmFsZiBUcsO4bm5lcyAoMyk6
CiAgZHJtL3VhcGk6IEFkZCBVU0IgY29ubmVjdG9yIHR5cGUKICBkcm0vcHJvYmUtaGVscGVyOiBD
aGVjayBlcG9jaCBjb3VudGVyIGluIG91dHB1dF9wb2xsX2V4ZWN1dGUoKQogIGRybTogQWRkIEdl
bmVyaWMgVVNCIERpc3BsYXkgZHJpdmVyCgogTUFJTlRBSU5FUlMgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDggKwogZHJpdmVycy9ncHUvZHJtL0tjb25maWcgICAgICAgICAgICAgfCAgIDIg
KwogZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAgICAgfCAgIDEgKwogZHJpdmVycy9n
cHUvZHJtL2RybV9wcm9iZV9oZWxwZXIuYyAgfCAgIDcgKy0KIGRyaXZlcnMvZ3B1L2RybS9ndWQv
S2NvbmZpZyAgICAgICAgIHwgIDE0ICsKIGRyaXZlcnMvZ3B1L2RybS9ndWQvTWFrZWZpbGUgICAg
ICAgIHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Nvbm5lY3Rvci5jIHwgNzIyICsr
KysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Rydi5j
ICAgICAgIHwgNjIwICsrKysrKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2d1
ZC9ndWRfaW50ZXJuYWwuaCAgfCAxNDggKysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9w
aXBlLmMgICAgICB8IDQ3MiArKysrKysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2d1ZC5oICAg
ICAgICAgICAgICAgICAgIHwgMzU2ICsrKysrKysrKysrKysrCiBpbmNsdWRlL3VhcGkvZHJtL2Ry
bV9tb2RlLmggICAgICAgICB8ICAgMSArCiAxMiBmaWxlcyBjaGFuZ2VkLCAyMzU0IGluc2VydGlv
bnMoKyksIDEgZGVsZXRpb24oLSkKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0v
Z3VkL0tjb25maWcKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL01ha2Vm
aWxlCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfY29ubmVjdG9y
LmMKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9kcnYuYwogY3Jl
YXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2ludGVybmFsLmgKIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMKIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBpbmNsdWRlL2RybS9ndWQuaAoKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
