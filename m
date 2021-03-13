Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD2E7339DC3
	for <lists+dri-devel@lfdr.de>; Sat, 13 Mar 2021 12:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75C356E0A2;
	Sat, 13 Mar 2021 11:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A36A26E10E
 for <dri-devel@lists.freedesktop.org>; Sat, 13 Mar 2021 11:26:00 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id B13BE8003A;
 Sat, 13 Mar 2021 12:25:57 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v8 0/3] GUD USB Display driver
Date: Sat, 13 Mar 2021 12:25:42 +0100
Message-Id: <20210313112545.37527-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=gAmX6pxEAAAA:20 a=e5mUnYsNAAAA:8
 a=YwjdnX4TFwikY6-GU-cA:9 a=QEXdDO2ut3YA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=Ew2E2A-JSTLzCXPT_086:22
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
eSBQaSBaZXJvLzQuCgpDaGFuZ2VzIGluIHRoaXMgdmVyc2lvbjoKLSBGb3Jnb3QgdG8gZmlsdGVy
IFJHQjExMSBmcm9tIHJlYWNoaW5nIHVzZXJzcGFjZQotIEhhbmRsZSBhIGRldmljZSB0aGF0IG9u
bHkgcmV0dXJucyB1bmtub3duIGRldmljZSBwcm9wZXJ0aWVzIChQZXRlcikKLSBzL0dVRF9QSVhF
TF9GT1JNQVRfUkdCMTExL0dVRF9QSVhFTF9GT1JNQVRfWFJHQjExMTEvIChQZXRlcikKLSBGaXgg
UjEgYW5kIFhSR0IxMTExIGZvcm1hdCBjb252ZXJzaW9uCi0gQWRkIEZJWE1FIGFib3V0IEJpZyBF
bmRpYW4gYmVpbmcgYnJva2VuIChQZXRlciwgSWxpYSkKCkkgd2lsbCBhcHBseSB0aGUgcGF0Y2hl
cyBhcyBzb29uIGFzIHRoZSBkZXBlbmRlbmN5IHNob3dzIHVwIGluIGRybS1taXNjLW5leHQuCgpE
ZXBlbmRlbmN5Ogpkcm06IFVzZSBVU0IgY29udHJvbGxlcidzIERNQSBtYXNrIHdoZW4gaW1wb3J0
aW5nIGRtYWJ1ZnNbMl0KKGN1cnJlbnRseSBpbiBkcm0tbWlzYy1maXhlcyBidXQgbm90IGluIGRy
bS1taXNjLW5leHQgeWV0LCBhbHNvIHByZXNlbnQgaW4KZHJtLXRpcCBhbmQgbGludXgtbmV4dCkK
Ck5vcmFsZi4KClsxXSBodHRwczovL2dpdGh1Yi5jb20vbm90cm8vZ3VkL3dpa2kKWzJdIGh0dHBz
Oi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC9tc2dpZC8yMDIxMDMwMzEzMzIyOS4z
Mjg4LTEtdHppbW1lcm1hbm5Ac3VzZS5kZQoKCk5vcmFsZiBUcsO4bm5lcyAoMyk6CiAgZHJtL3Vh
cGk6IEFkZCBVU0IgY29ubmVjdG9yIHR5cGUKICBkcm0vcHJvYmUtaGVscGVyOiBDaGVjayBlcG9j
aCBjb3VudGVyIGluIG91dHB1dF9wb2xsX2V4ZWN1dGUoKQogIGRybTogQWRkIEdVRCBVU0IgRGlz
cGxheSBkcml2ZXIKCiBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgOCAr
CiBkcml2ZXJzL2dwdS9kcm0vS2NvbmZpZyAgICAgICAgICAgICB8ICAgMiArCiBkcml2ZXJzL2dw
dS9kcm0vTWFrZWZpbGUgICAgICAgICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2Nv
bm5lY3Rvci5jICAgICB8ICAgMSArCiBkcml2ZXJzL2dwdS9kcm0vZHJtX3Byb2JlX2hlbHBlci5j
ICB8ICAgNyArLQogZHJpdmVycy9ncHUvZHJtL2d1ZC9LY29uZmlnICAgICAgICAgfCAgMTQgKwog
ZHJpdmVycy9ncHUvZHJtL2d1ZC9NYWtlZmlsZSAgICAgICAgfCAgIDQgKwogZHJpdmVycy9ncHUv
ZHJtL2d1ZC9ndWRfY29ubmVjdG9yLmMgfCA3MjkgKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfZHJ2LmMgICAgICAgfCA2NjEgKysrKysrKysrKysr
KysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfaW50ZXJuYWwuaCAgfCAxNTQg
KysrKysrCiBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9waXBlLmMgICAgICB8IDU1MiArKysrKysr
KysrKysrKysrKysrKysKIGluY2x1ZGUvZHJtL2d1ZC5oICAgICAgICAgICAgICAgICAgIHwgMzMz
ICsrKysrKysrKysrKysKIGluY2x1ZGUvdWFwaS9kcm0vZHJtX21vZGUuaCAgICAgICAgIHwgICAx
ICsKIDEzIGZpbGVzIGNoYW5nZWQsIDI0NjYgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ndWQvS2NvbmZpZwogY3JlYXRlIG1v
ZGUgMTAwNjQ0IGRyaXZlcnMvZ3B1L2RybS9ndWQvTWFrZWZpbGUKIGNyZWF0ZSBtb2RlIDEwMDY0
NCBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9jb25uZWN0b3IuYwogY3JlYXRlIG1vZGUgMTAwNjQ0
IGRyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Rydi5jCiBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVy
cy9ncHUvZHJtL2d1ZC9ndWRfaW50ZXJuYWwuaAogY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMv
Z3B1L2RybS9ndWQvZ3VkX3BpcGUuYwogY3JlYXRlIG1vZGUgMTAwNjQ0IGluY2x1ZGUvZHJtL2d1
ZC5oCgotLSAKMi4yMy4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWwK
