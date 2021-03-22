Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1EA344DA8
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 18:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C27A789B55;
	Mon, 22 Mar 2021 17:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE1B6E030
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Mar 2021 17:45:12 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id C1F4F80141;
 Mon, 22 Mar 2021 18:45:09 +0100 (CET)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/gud: fix sizeof use
Date: Mon, 22 Mar 2021 18:44:33 +0100
Message-Id: <20210322174434.58849-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=PJ4hB8iC c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=QyXUC8HyAAAA:8 a=SJz97ENfAAAA:8
 a=O4aihwBPe715VnruS00A:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbToga2VybmVsIHRlc3Qgcm9ib3QgPGxrcEBpbnRlbC5jb20+Cgpkcml2ZXJzL2dwdS9kcm0v
Z3VkL2d1ZF9jb25uZWN0b3IuYzo3MTA6MzctNDM6IEVSUk9SOiBhcHBsaWNhdGlvbiBvZiBzaXpl
b2YgdG8gcG9pbnRlcgoKIHNpemVvZiB3aGVuIGFwcGxpZWQgdG8gYSBwb2ludGVyIHR5cGVkIGV4
cHJlc3Npb24gZ2l2ZXMgdGhlIHNpemUgb2YKIHRoZSBwb2ludGVyCgpHZW5lcmF0ZWQgYnk6IHNj
cmlwdHMvY29jY2luZWxsZS9taXNjL25vZGVyZWYuY29jY2kKCkZpeGVzOiA0MGUxYTcwYjRhZWQg
KCJkcm06IEFkZCBHVUQgVVNCIERpc3BsYXkgZHJpdmVyIikKUmVwb3J0ZWQtYnk6IGtlcm5lbCB0
ZXN0IHJvYm90IDxsa3BAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBrZXJuZWwgdGVzdCByb2Jv
dCA8bGtwQGludGVsLmNvbT4KW2ZpeCBzdWJqZWN0XQpTaWduZWQtb2ZmLWJ5OiBOb3JhbGYgVHLD
uG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZ3VkL2d1ZF9j
b25uZWN0b3IuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxl
dGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Nvbm5lY3Rvci5j
IGIvZHJpdmVycy9ncHUvZHJtL2d1ZC9ndWRfY29ubmVjdG9yLmMKaW5kZXggZWM0OTVkY2Q2MTIy
Li45YWU1YTAwMjA0NDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Nvbm5l
Y3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ndWQvZ3VkX2Nvbm5lY3Rvci5jCkBAIC03MDcs
NyArNzA3LDcgQEAgaW50IGd1ZF9nZXRfY29ubmVjdG9ycyhzdHJ1Y3QgZ3VkX2RldmljZSAqZ2Ry
bSkKIAkJcmV0dXJuIC1FTk9NRU07CiAKIAlyZXQgPSBndWRfdXNiX2dldChnZHJtLCBHVURfUkVR
X0dFVF9DT05ORUNUT1JTLCAwLAotCQkJICBkZXNjcywgR1VEX0NPTk5FQ1RPUlNfTUFYX05VTSAq
IHNpemVvZihkZXNjcykpOworCQkJICBkZXNjcywgR1VEX0NPTk5FQ1RPUlNfTUFYX05VTSAqIHNp
emVvZigqZGVzY3MpKTsKIAlpZiAocmV0IDwgMCkKIAkJZ290byBmcmVlOwogCWlmICghcmV0IHx8
IHJldCAlIHNpemVvZigqZGVzY3MpKSB7Ci0tIAoyLjIzLjAKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
