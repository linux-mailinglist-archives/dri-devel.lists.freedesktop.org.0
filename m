Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7919932F015
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 17:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141F96EBD0;
	Fri,  5 Mar 2021 16:31:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0A76E220
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 16:31:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 3F3268016B;
 Fri,  5 Mar 2021 17:31:12 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 0/3] GUD USB Display driver
Date: Fri,  5 Mar 2021 17:31:01 +0100
Message-Id: <20210305163104.30756-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20 a=e5mUnYsNAAAA:8
 a=YwjdnX4TFwikY6-GU-cA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=BPzZvq435JnGatEyYwdK:22 a=pHzHmUro8NiASowvMSCR:22
 a=Ew2E2A-JSTLzCXPT_086:22
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
eSBQaSBaZXJvLzQuCgpDaGFuZ2VzIGluIHRoaXMgdmVyc2lvbjoKLSBMWjRfY29tcHJlc3NfZGVm
YXVsdCgpIGNhbiByZXR1cm4gemVybywgY2hlY2sgZm9yIHRoYXQKLSBGaXggbWVtb3J5IGxlYWsg
aW4gZ3VkX3BpcGVfY2hlY2soKSBlcnJvciBwYXRoIChQZXRlcikKLSBJbXByb3ZlIGRlYnVnIGFu
ZCBlcnJvciBtZXNzYWdlcyAoUGV0ZXIpCi0gRG9uJ3QgcGFzcyBsZW5ndGggaW4gcHJvdG9jb2wg
c3RydWN0cyAoUGV0ZXIpCi0gUGFzcyBVU0IgaW50ZXJmYWNlIHRvIGd1ZF91c2JfY29udHJvbF9t
c2coKSBldCBhbC4gKFBldGVyKQotIEltcHJvdmUgZ3VkX2Nvbm5lY3Rvcl9maWxsX3Byb3BlcnRp
ZXMoKSAoUGV0ZXIpCi0gQWRkIEdVRF9QSVhFTF9GT1JNQVRfUkdCMTExIChQZXRlcikKLSBSZW1v
dmUgR1VEX1JFUV9TRVRfVkVSU0lPTiAoUGV0ZXIpCi0gRml4IERSTV9JT0NUTF9NT0RFX09CSl9T
RVRQUk9QRVJUWSBhbmQgdGhlIHJvdGF0aW9uIHByb3BlcnR5Ci0gRml4IGRtYS1idWYgaW1wb3J0
IChUaG9tYXMpCgpOb3RlOiBUaGVyZSBhcmUgc2V2ZXJhbCBjaGFuZ2VzIHRvIHRoZSBwcm90b2Nv
bC4KCkkgcGxhbiB0byBhcHBseSB0aGUgcGF0Y2hlcyBpbiBhIHdlZWsgb3Igc28gdW5sZXNzIHNv
bWV0aGluZyB0dXJucyBvdXQgdG8gYmUKYnJva2VuLgoKRGVwZW5kZW5jeToKZHJtOiBVc2UgVVNC
IGNvbnRyb2xsZXIncyBETUEgbWFzayB3aGVuIGltcG9ydGluZyBkbWFidWZzWzJdCihjdXJyZW50
bHkgaW4gZHJtLW1pc2MtZml4ZXMgYnV0IG5vdCBpbiBkcm0tbWlzYy1uZXh0IHlldCwgYWxzbyBw
cmVzZW50IGluCmRybS10aXAgYW5kIGxpbnV4LW5leHQpCgpOb3JhbGYuCgpbMV0gaHR0cHM6Ly9n
aXRodWIuY29tL25vdHJvL2d1ZC93aWtpClsyXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvcGF0Y2gvbXNnaWQvMjAyMTAzMDMxMzMyMjkuMzI4OC0xLXR6aW1tZXJtYW5uQHN1c2Uu
ZGUKCgpOb3JhbGYgVHLDuG5uZXMgKDMpOgogIGRybS91YXBpOiBBZGQgVVNCIGNvbm5lY3RvciB0
eXBlCiAgZHJtL3Byb2JlLWhlbHBlcjogQ2hlY2sgZXBvY2ggY291bnRlciBpbiBvdXRwdXRfcG9s
bF9leGVjdXRlKCkKICBkcm06IEFkZCBHVUQgVVNCIERpc3BsYXkgZHJpdmVyCgogTUFJTlRBSU5F
UlMgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDggKwogZHJpdmVycy9ncHUvZHJtL0tjb25m
aWcgICAgICAgICAgICAgfCAgIDIgKwogZHJpdmVycy9ncHUvZHJtL01ha2VmaWxlICAgICAgICAg
ICAgfCAgIDEgKwogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyAgICAgfCAgIDEgKwog
ZHJpdmVycy9ncHUvZHJtL2RybV9wcm9iZV9oZWxwZXIuYyAgfCAgIDcgKy0KIGRyaXZlcnMvZ3B1
L2RybS9ndWQvS2NvbmZpZyAgICAgICAgIHwgIDE0ICsKIGRyaXZlcnMvZ3B1L2RybS9ndWQvTWFr
ZWZpbGUgICAgICAgIHwgICA0ICsKIGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Nvbm5lY3Rvci5j
IHwgNzI5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMvZ3B1L2RybS9ndWQv
Z3VkX2Rydi5jICAgICAgIHwgNjU5ICsrKysrKysrKysrKysrKysrKysrKysrKysKIGRyaXZlcnMv
Z3B1L2RybS9ndWQvZ3VkX2ludGVybmFsLmggIHwgMTU0ICsrKysrKwogZHJpdmVycy9ncHUvZHJt
L2d1ZC9ndWRfcGlwZS5jICAgICAgfCA1MzUgKysrKysrKysrKysrKysrKysrKysKIGluY2x1ZGUv
ZHJtL2d1ZC5oICAgICAgICAgICAgICAgICAgIHwgMzMzICsrKysrKysrKysrKysKIGluY2x1ZGUv
dWFwaS9kcm0vZHJtX21vZGUuaCAgICAgICAgIHwgICAxICsKIDEzIGZpbGVzIGNoYW5nZWQsIDI0
NDcgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZl
cnMvZ3B1L2RybS9ndWQvS2NvbmZpZwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2Ry
bS9ndWQvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1
ZF9jb25uZWN0b3IuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3Vk
X2Rydi5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfaW50ZXJu
YWwuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX3BpcGUuYwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2d1ZC5oCgotLSAKMi4yMy4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
