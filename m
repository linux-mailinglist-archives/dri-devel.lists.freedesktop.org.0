Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E16031E85FE
	for <lists+dri-devel@lfdr.de>; Fri, 29 May 2020 19:57:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA556E95A;
	Fri, 29 May 2020 17:57:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav22.altibox.net (asav22.altibox.net [109.247.116.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E476E957
 for <dri-devel@lists.freedesktop.org>; Fri, 29 May 2020 17:57:05 +0000 (UTC)
Received: from localhost.localdomain (unknown [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav22.altibox.net (Postfix) with ESMTPSA id 6198A200C5;
 Fri, 29 May 2020 19:57:03 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: dri-devel@lists.freedesktop.org,
	balbi@kernel.org
Subject: [PATCH v3 2/6] drm/client: Add drm_client_modeset_disable()
Date: Fri, 29 May 2020 19:56:39 +0200
Message-Id: <20200529175643.46094-3-noralf@tronnes.org>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20200529175643.46094-1-noralf@tronnes.org>
References: <20200529175643.46094-1-noralf@tronnes.org>
MIME-Version: 1.0
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=LvK8NEVc c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=SJz97ENfAAAA:8
 a=0d597LMeBdbU6fJEcaIA:9 a=QEXdDO2ut3YA:10 a=vFet0B0WnEQeilDPIY6i:22
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
Cc: linux-usb@vger.kernel.org, sam@ravnborg.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIGEgd2F5IGZvciBjbGllbnRzIHRvIGRpc2FibGUgYWxsIG91dHB1dHMuCgpTaWduZWQtb2Zm
LWJ5OiBOb3JhbGYgVHLDuG5uZXMgPG5vcmFsZkB0cm9ubmVzLm9yZz4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vZHJtX2NsaWVudF9tb2Rlc2V0LmMgfCAyMCArKysrKysrKysrKysrKysrKysrKwogaW5j
bHVkZS9kcm0vZHJtX2NsaWVudC5oICAgICAgICAgICAgIHwgIDEgKwogMiBmaWxlcyBjaGFuZ2Vk
LCAyMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9jbGll
bnRfbW9kZXNldC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9kZXNldC5jCmluZGV4
IDI3ZTJmYjQxZjE0ZC4uOTc3YmNkMDYzNTIwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2NsaWVudF9tb2Rlc2V0LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jbGllbnRfbW9k
ZXNldC5jCkBAIC0xMjI1LDMgKzEyMjUsMjMgQEAgaW50IGRybV9jbGllbnRfbW9kZXNldF9kcG1z
KHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50LCBpbnQgbW9kZSkKIAlyZXR1cm4gcmV0Owog
fQogRVhQT1JUX1NZTUJPTChkcm1fY2xpZW50X21vZGVzZXRfZHBtcyk7CisKKy8qKgorICogZHJt
X2NsaWVudF9tb2Rlc2V0X2Rpc2FibGUoKSAtIERpc2FibGUgYWxsIG91dHB1dHMKKyAqIEBjbGll
bnQ6IERSTSBjbGllbnQKKyAqCisgKiBUaGlzIGZ1bmN0aW9uIGRpc2FibGVzIGFsbCBvdXRwdXRz
IGJ5IGZpcnN0IGNsZWFyaW5nIHRoZSBtb2Rlc2V0IGFycmF5IGFuZAorICogdGhlbiBjb21taXR0
aW5nIHRoZSBlbXB0eSBtb2Rlc2V0cy4KKyAqCisgKiBSZXR1cm5zOgorICogWmVybyBvbiBzdWNj
ZXNzIG9yIG5lZ2F0aXZlIGVycm9yIGNvZGUgb24gZmFpbHVyZS4KKyAqLworaW50IGRybV9jbGll
bnRfbW9kZXNldF9kaXNhYmxlKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50KQoreworCW11
dGV4X2xvY2soJmNsaWVudC0+bW9kZXNldF9tdXRleCk7CisJZHJtX2NsaWVudF9tb2Rlc2V0X3Jl
bGVhc2UoY2xpZW50KTsKKwltdXRleF91bmxvY2soJmNsaWVudC0+bW9kZXNldF9tdXRleCk7CisK
KwlyZXR1cm4gZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdChjbGllbnQpOworfQorRVhQT1JUX1NZ
TUJPTChkcm1fY2xpZW50X21vZGVzZXRfZGlzYWJsZSk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2Ry
bS9kcm1fY2xpZW50LmggYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgKaW5kZXggNzY3MDRmNDhm
YzQ2Li40OTgwODliNjQ3ZGEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9jbGllbnQuaAor
KysgYi9pbmNsdWRlL2RybS9kcm1fY2xpZW50LmgKQEAgLTE2OCw2ICsxNjgsNyBAQCBpbnQgZHJt
X2NsaWVudF9tb2Rlc2V0X2NoZWNrKHN0cnVjdCBkcm1fY2xpZW50X2RldiAqY2xpZW50KTsKIGlu
dCBkcm1fY2xpZW50X21vZGVzZXRfY29tbWl0X2xvY2tlZChzdHJ1Y3QgZHJtX2NsaWVudF9kZXYg
KmNsaWVudCk7CiBpbnQgZHJtX2NsaWVudF9tb2Rlc2V0X2NvbW1pdChzdHJ1Y3QgZHJtX2NsaWVu
dF9kZXYgKmNsaWVudCk7CiBpbnQgZHJtX2NsaWVudF9tb2Rlc2V0X2RwbXMoc3RydWN0IGRybV9j
bGllbnRfZGV2ICpjbGllbnQsIGludCBtb2RlKTsKK2ludCBkcm1fY2xpZW50X21vZGVzZXRfZGlz
YWJsZShzdHJ1Y3QgZHJtX2NsaWVudF9kZXYgKmNsaWVudCk7CiAKIC8qKgogICogZHJtX2NsaWVu
dF9mb3JfZWFjaF9tb2Rlc2V0KCkgLSBJdGVyYXRlIG92ZXIgY2xpZW50IG1vZGVzZXRzCi0tIAoy
LjIzLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
