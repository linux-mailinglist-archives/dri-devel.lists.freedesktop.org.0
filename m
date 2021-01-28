Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56083307334
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jan 2021 10:53:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19CFA6E0EE;
	Thu, 28 Jan 2021 09:53:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from netline-mail3.netline.ch (mail.netline.ch [148.251.143.178])
 by gabe.freedesktop.org (Postfix) with ESMTP id 676EA6E0EE
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 09:53:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by netline-mail3.netline.ch (Postfix) with ESMTP id 2BE462A6042;
 Thu, 28 Jan 2021 10:53:47 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at netline-mail3.netline.ch
Received: from netline-mail3.netline.ch ([127.0.0.1])
 by localhost (netline-mail3.netline.ch [127.0.0.1]) (amavisd-new, port 10024)
 with LMTP id KohtHMM_GZh1; Thu, 28 Jan 2021 10:53:46 +0100 (CET)
Received: from kaveri (24.99.2.85.dynamic.wline.res.cust.swisscom.ch
 [85.2.99.24])
 by netline-mail3.netline.ch (Postfix) with ESMTPSA id D85C02A6016;
 Thu, 28 Jan 2021 10:53:46 +0100 (CET)
Received: from daenzer by kaveri with local (Exim 4.94)
 (envelope-from <michel@daenzer.net>)
 id 1l53zm-0000dq-A5; Thu, 28 Jan 2021 10:53:46 +0100
From: =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>
To: Christian Koenig <christian.koenig@amd.com>, Huang Rui <ray.huang@amd.com>
Subject: [PATCH] drm/ttm: Use __GFP_NOWARN for huge pages in
 ttm_pool_alloc_page
Date: Thu, 28 Jan 2021 10:53:46 +0100
Message-Id: <20210128095346.2421-1-michel@daenzer.net>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogTWljaGVsIETDpG56ZXIgPG1kYWVuemVyQHJlZGhhdC5jb20+CgpXaXRob3V0IF9fR0ZQ
X05PV0FSTiwgYXR0ZW1wdHMgYXQgYWxsb2NhdGluZyBodWdlIHBhZ2VzIGNhbiB0cmlnZ2VyCmRt
ZXNnIHNwbGF0cyBsaWtlIGJlbG93ICh3aGljaCBhcmUgZXNzZW50aWFsbHkgbm9pc2UsIHNpbmNl
IFRUTSBmYWxscwpiYWNrIHRvIG5vcm1hbCBwYWdlcyBpZiBpdCBjYW4ndCBnZXQgYSBodWdlIG9u
ZSkuCgpbIDk1NTYuNzEwMjQxXSBjbGluZm86IHBhZ2UgYWxsb2NhdGlvbiBmYWlsdXJlOiBvcmRl
cjo5LCBtb2RlOjB4MTk0ZGMyKEdGUF9ISUdIVVNFUnxfX0dGUF9SRVRSWV9NQVlGQUlMfF9fR0ZQ
X05PUkVUUll8X19HRlBfWkVST3xfX0dGUF9OT01FTUFMTE9DKSwgbm9kZW1hc2s9KG51bGwpLGNw
dXNldD11c2VyLnNsaWNlLG1lbXNfYWxsb3dlZD0wClsgOTU1Ni43MTAyNTldIENQVTogMSBQSUQ6
IDQ3MDgyMSBDb21tOiBjbGluZm8gVGFpbnRlZDogRyAgICAgICAgICAgIEUgICAgIDUuMTAuMTAr
ICM0ClsgOTU1Ni43MTAyNjRdIEhhcmR3YXJlIG5hbWU6IE1pY3JvLVN0YXIgSW50ZXJuYXRpb25h
bCBDby4sIEx0ZC4gTVMtN0EzNC9CMzUwIFRPTUFIQVdLIChNUy03QTM0KSwgQklPUyAxLk9SIDEx
LzI5LzIwMTkKWyA5NTU2LjcxMDI2OF0gQ2FsbCBUcmFjZToKWyA5NTU2LjcxMDI4MV0gIGR1bXBf
c3RhY2srMHg2Yi8weDgzClsgOTU1Ni43MTAyODhdICB3YXJuX2FsbG9jLmNvbGQrMHg3Yi8weGRm
ClsgOTU1Ni43MTAyOTddICA/IF9fYWxsb2NfcGFnZXNfZGlyZWN0X2NvbXBhY3QrMHgxMzcvMHgx
NTAKWyA5NTU2LjcxMDMwM10gIF9fYWxsb2NfcGFnZXNfc2xvd3BhdGguY29uc3Rwcm9wLjArMHhj
MWIvMHhjNTAKWyA5NTU2LjcxMDMxMl0gIF9fYWxsb2NfcGFnZXNfbm9kZW1hc2srMHgyZWMvMHgz
MjAKWyA5NTU2LjcxMDMyNV0gIHR0bV9wb29sX2FsbG9jKzB4MmU0LzB4NWUwIFt0dG1dClsgOTU1
Ni43MTAzMzJdICA/IGt2bWFsbG9jX25vZGUrMHg0Ni8weDgwClsgOTU1Ni43MTAzNDFdICB0dG1f
dHRfcG9wdWxhdGUrMHgzNy8weGUwIFt0dG1dClsgOTU1Ni43MTAzNTBdICB0dG1fYm9faGFuZGxl
X21vdmVfbWVtKzB4MTQyLzB4MTgwIFt0dG1dClsgOTU1Ni43MTAzNTldICB0dG1fYm9fdmFsaWRh
dGUrMHgxMWQvMHgxOTAgW3R0bV0KWyA5NTU2LjcxMDM5MV0gID8gZHJtX3ZtYV9vZmZzZXRfYWRk
KzB4MmYvMHg2MCBbZHJtXQpbIDk1NTYuNzEwMzk5XSAgdHRtX2JvX2luaXRfcmVzZXJ2ZWQrMHgy
YTcvMHgzMjAgW3R0bV0KWyA5NTU2LjcxMDUyOV0gIGFtZGdwdV9ib19kb19jcmVhdGUrMHgxYjgv
MHg1MDAgW2FtZGdwdV0KWyA5NTU2LjcxMDY1N10gID8gYW1kZ3B1X2JvX3N1YnRyYWN0X3Bpbl9z
aXplKzB4NjAvMHg2MCBbYW1kZ3B1XQpbIDk1NTYuNzEwNjYzXSAgPyBnZXRfcGFnZV9mcm9tX2Zy
ZWVsaXN0KzB4MTFmOS8weDE0NTAKWyA5NTU2LjcxMDc4OV0gIGFtZGdwdV9ib19jcmVhdGUrMHg0
MC8weDI3MCBbYW1kZ3B1XQpbIDk1NTYuNzEwNzk3XSAgPyBfcmF3X3NwaW5fdW5sb2NrKzB4MTYv
MHgzMApbIDk1NTYuNzEwOTI3XSAgYW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwrMHgxMjMvMHgzMTAg
W2FtZGdwdV0KWyA5NTU2LjcxMTA2Ml0gID8gYW1kZ3B1X2dlbV9mb3JjZV9yZWxlYXNlKzB4MTUw
LzB4MTUwIFthbWRncHVdClsgOTU1Ni43MTEwOThdICBkcm1faW9jdGxfa2VybmVsKzB4YWEvMHhm
MCBbZHJtXQpbIDk1NTYuNzExMTMzXSAgZHJtX2lvY3RsKzB4MjBmLzB4M2EwIFtkcm1dClsgOTU1
Ni43MTEyNjddICA/IGFtZGdwdV9nZW1fZm9yY2VfcmVsZWFzZSsweDE1MC8weDE1MCBbYW1kZ3B1
XQpbIDk1NTYuNzExMjc2XSAgPyBwcmVlbXB0X2NvdW50X3N1YisweDliLzB4ZDAKWyA5NTU2Ljcx
MTQwNF0gIGFtZGdwdV9kcm1faW9jdGwrMHg0OS8weDgwIFthbWRncHVdClsgOTU1Ni43MTE0MTFd
ICBfX3g2NF9zeXNfaW9jdGwrMHg4My8weGIwClsgOTU1Ni43MTE0MTddICBkb19zeXNjYWxsXzY0
KzB4MzMvMHg4MApbIDk1NTYuNzExNDIxXSAgZW50cnlfU1lTQ0FMTF82NF9hZnRlcl9od2ZyYW1l
KzB4NDQvMHhhOQoKRml4ZXM6IGJmOWVlZTI0OWFjMiAoImRybS90dG06IHN0b3AgdXNpbmcgR0ZQ
X1RSQU5TSFVHRV9MSUdIVCIpClNpZ25lZC1vZmYtYnk6IE1pY2hlbCBEw6RuemVyIDxtZGFlbnpl
ckByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyB8IDIgKy0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS90dG0vdHRtX3Bvb2wuYyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3Bvb2wuYwppbmRleCA4Yzc2MmEwM2FkOGEuLmEyNjQ3NjBjYjJjZCAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL3R0bS90dG1fcG9vbC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS90dG0v
dHRtX3Bvb2wuYwpAQCAtODQsNyArODQsNyBAQCBzdGF0aWMgc3RydWN0IHBhZ2UgKnR0bV9wb29s
X2FsbG9jX3BhZ2Uoc3RydWN0IHR0bV9wb29sICpwb29sLCBnZnBfdCBnZnBfZmxhZ3MsCiAJICog
cHV0X3BhZ2UoKSBvbiBhIFRUTSBhbGxvY2F0ZWQgcGFnZSBpcyBpbGxlZ2FsLgogCSAqLwogCWlm
IChvcmRlcikKLQkJZ2ZwX2ZsYWdzIHw9IF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZ
IHwKKwkJZ2ZwX2ZsYWdzIHw9IF9fR0ZQX05PTUVNQUxMT0MgfCBfX0dGUF9OT1JFVFJZIHwgX19H
RlBfTk9XQVJOIHwKIAkJCV9fR0ZQX0tTV0FQRF9SRUNMQUlNOwogCiAJaWYgKCFwb29sLT51c2Vf
ZG1hX2FsbG9jKSB7Ci0tIAoyLjMwLjAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbAo=
