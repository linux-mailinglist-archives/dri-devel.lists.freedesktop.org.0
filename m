Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B341235BA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 20:31:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B896D89D86;
	Tue, 17 Dec 2019 19:31:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04F89D86
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 19:31:49 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Dec 2019 11:31:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,326,1571727600"; d="scan'208";a="415575616"
Received: from scpatton-mobl2.amr.corp.intel.com (HELO
 josouza-MOBL.amr.corp.intel.com) ([10.252.135.96])
 by fmsmga005.fm.intel.com with ESMTP; 17 Dec 2019 11:31:47 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 libdrm] intel: sync i915_pciids.h with kernel
Date: Tue, 17 Dec 2019 11:31:40 -0800
Message-Id: <20191217193140.188012-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.24.1
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 James Ausmus <james.ausmus@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q2hhbmdlczoKNjUxY2M4MzVkNWY2ICgiZHJtL2k5MTU6IEFkZCBuZXcgRUhML0pTTCBQQ0kgaWRz
IikKYjZhODc4MWE0NDdjICgiZHJtL2k5MTUvY21sOiBSZW1vdmUgdW5zdXBwb3J0IFBDSSBJRCIp
Cjg3MTdjNmI3NDE0ZiAoImRybS9pOTE1L2NtbDogU2VwYXJhdGUgVSBzZXJpZXMgcGNpIGlkIGZy
b20gb3JpZ2lhbmwgbGlzdC4iKQoKdjI6IGFkZGVkIHRoZSBsYXRlc3QgQ01MIGNoYW5nZXMKCkNj
OiBKYW1lcyBBdXNtdXMgPGphbWVzLmF1c211c0BpbnRlbC5jb20+CkNjOiBNYXR0IFJvcGVyIDxt
YXR0aGV3LmQucm9wZXJAaW50ZWwuY29tPgpDYzogTHVjYXMgRGUgTWFyY2hpIDxsdWNhcy5kZW1h
cmNoaUBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBNYXR0IFJvcGVyIDxtYXR0aGV3LmQucm9wZXJA
aW50ZWwuY29tPiAodjEgRUhML0pTTCBjaGFuZ2VzKQpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2Jl
cnRvIGRlIFNvdXphIDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBpbnRlbC9pOTE1X3BjaWlk
cy5oIHwgMzEgKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDE4IGluc2VydGlvbnMoKyksIDEzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2ludGVsL2k5
MTVfcGNpaWRzLmggYi9pbnRlbC9pOTE1X3BjaWlkcy5oCmluZGV4IGIxZjY2YjExLi4xZDJjMTIy
MSAxMDA2NDQKLS0tIGEvaW50ZWwvaTkxNV9wY2lpZHMuaAorKysgYi9pbnRlbC9pOTE1X3BjaWlk
cy5oCkBAIC00NDYsMjMgKzQ0NiwxOCBAQAogCiAvKiBDTUwgR1QxICovCiAjZGVmaW5lIElOVEVM
X0NNTF9HVDFfSURTKGluZm8pCVwKLQlJTlRFTF9WR0FfREVWSUNFKDB4OUIyMSwgaW5mbyksIFwK
LQlJTlRFTF9WR0FfREVWSUNFKDB4OUJBQSwgaW5mbyksIFwKLQlJTlRFTF9WR0FfREVWSUNFKDB4
OUJBQiwgaW5mbyksIFwKLQlJTlRFTF9WR0FfREVWSUNFKDB4OUJBQywgaW5mbyksIFwKLQlJTlRF
TF9WR0FfREVWSUNFKDB4OUJBMCwgaW5mbyksIFwKIAlJTlRFTF9WR0FfREVWSUNFKDB4OUJBNSwg
aW5mbyksIFwKIAlJTlRFTF9WR0FfREVWSUNFKDB4OUJBOCwgaW5mbyksIFwKIAlJTlRFTF9WR0Ff
REVWSUNFKDB4OUJBNCwgaW5mbyksIFwKIAlJTlRFTF9WR0FfREVWSUNFKDB4OUJBMiwgaW5mbykK
IAorI2RlZmluZSBJTlRFTF9DTUxfVV9HVDFfSURTKGluZm8pIFwKKwlJTlRFTF9WR0FfREVWSUNF
KDB4OUIyMSwgaW5mbyksIFwKKwlJTlRFTF9WR0FfREVWSUNFKDB4OUJBQSwgaW5mbyksIFwKKwlJ
TlRFTF9WR0FfREVWSUNFKDB4OUJBQywgaW5mbykKKwogLyogQ01MIEdUMiAqLwogI2RlZmluZSBJ
TlRFTF9DTUxfR1QyX0lEUyhpbmZvKQlcCi0JSU5URUxfVkdBX0RFVklDRSgweDlCNDEsIGluZm8p
LCBcCi0JSU5URUxfVkdBX0RFVklDRSgweDlCQ0EsIGluZm8pLCBcCi0JSU5URUxfVkdBX0RFVklD
RSgweDlCQ0IsIGluZm8pLCBcCi0JSU5URUxfVkdBX0RFVklDRSgweDlCQ0MsIGluZm8pLCBcCi0J
SU5URUxfVkdBX0RFVklDRSgweDlCQzAsIGluZm8pLCBcCiAJSU5URUxfVkdBX0RFVklDRSgweDlC
QzUsIGluZm8pLCBcCiAJSU5URUxfVkdBX0RFVklDRSgweDlCQzgsIGluZm8pLCBcCiAJSU5URUxf
VkdBX0RFVklDRSgweDlCQzQsIGluZm8pLCBcCkBAIC00NzEsNiArNDY2LDExIEBACiAJSU5URUxf
VkdBX0RFVklDRSgweDlCRTYsIGluZm8pLCBcCiAJSU5URUxfVkdBX0RFVklDRSgweDlCRjYsIGlu
Zm8pCiAKKyNkZWZpbmUgSU5URUxfQ01MX1VfR1QyX0lEUyhpbmZvKSBcCisJSU5URUxfVkdBX0RF
VklDRSgweDlCNDEsIGluZm8pLCBcCisJSU5URUxfVkdBX0RFVklDRSgweDlCQ0EsIGluZm8pLCBc
CisJSU5URUxfVkdBX0RFVklDRSgweDlCQ0MsIGluZm8pCisKICNkZWZpbmUgSU5URUxfS0JMX0lE
UyhpbmZvKSBcCiAJSU5URUxfS0JMX0dUMV9JRFMoaW5mbyksIFwKIAlJTlRFTF9LQkxfR1QyX0lE
UyhpbmZvKSwgXApAQCAtNTM2LDcgKzUzNiw5IEBACiAJSU5URUxfV0hMX1VfR1QzX0lEUyhpbmZv
KSwgXAogCUlOVEVMX0FNTF9DRkxfR1QyX0lEUyhpbmZvKSwgXAogCUlOVEVMX0NNTF9HVDFfSURT
KGluZm8pLCBcCi0JSU5URUxfQ01MX0dUMl9JRFMoaW5mbykKKwlJTlRFTF9DTUxfR1QyX0lEUyhp
bmZvKSwgXAorCUlOVEVMX0NNTF9VX0dUMV9JRFMoaW5mbyksIFwKKwlJTlRFTF9DTUxfVV9HVDJf
SURTKGluZm8pCiAKIC8qIENOTCAqLwogI2RlZmluZSBJTlRFTF9DTkxfUE9SVF9GX0lEUyhpbmZv
KSBcCkBAIC01NzksMTIgKzU4MSwxNSBAQAogCUlOVEVMX1ZHQV9ERVZJQ0UoMHg4QTUxLCBpbmZv
KSwgXAogCUlOVEVMX1ZHQV9ERVZJQ0UoMHg4QTVELCBpbmZvKQogCi0vKiBFSEwgKi8KKy8qIEVI
TC9KU0wgKi8KICNkZWZpbmUgSU5URUxfRUhMX0lEUyhpbmZvKSBcCiAJSU5URUxfVkdBX0RFVklD
RSgweDQ1MDAsIGluZm8pLAlcCiAJSU5URUxfVkdBX0RFVklDRSgweDQ1NzEsIGluZm8pLCBcCiAJ
SU5URUxfVkdBX0RFVklDRSgweDQ1NTEsIGluZm8pLCBcCi0JSU5URUxfVkdBX0RFVklDRSgweDQ1
NDEsIGluZm8pCisJSU5URUxfVkdBX0RFVklDRSgweDQ1NDEsIGluZm8pLCBcCisJSU5URUxfVkdB
X0RFVklDRSgweDRFNzEsIGluZm8pLCBcCisJSU5URUxfVkdBX0RFVklDRSgweDRFNjEsIGluZm8p
LCBcCisJSU5URUxfVkdBX0RFVklDRSgweDRFNTEsIGluZm8pCiAKIC8qIFRHTCAqLwogI2RlZmlu
ZSBJTlRFTF9UR0xfMTJfSURTKGluZm8pIFwKLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmkt
ZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
