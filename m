Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 772D711917D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2019 21:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19FB66E094;
	Tue, 10 Dec 2019 20:06:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A833C6E094
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2019 20:06:22 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Dec 2019 12:06:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,300,1571727600"; d="scan'208";a="244974043"
Received: from josouza-mobl.jf.intel.com (HELO josouza-MOBL.intel.com)
 ([10.98.40.69])
 by fmsmga002.fm.intel.com with ESMTP; 10 Dec 2019 12:06:21 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm] intel: sync i915_pciids.h with kernel
Date: Tue, 10 Dec 2019 12:06:11 -0800
Message-Id: <20191210200611.11013-1-jose.souza@intel.com>
X-Mailer: git-send-email 2.24.0
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 James Ausmus <james.ausmus@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgaXMgbWlzc2luZyB0aGUgbmV3IEVITC9KU0wgUENJIGlkcyBhZGRlZCBpbiBjb21taXQKNjUx
Y2M4MzVkNWY2ICgiZHJtL2k5MTU6IEFkZCBuZXcgRUhML0pTTCBQQ0kgaWRzIikKCkNjOiBKYW1l
cyBBdXNtdXMgPGphbWVzLmF1c211c0BpbnRlbC5jb20+CkNjOiBNYXR0IFJvcGVyIDxtYXR0aGV3
LmQucm9wZXJAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IDxqb3NlLnNvdXphQGludGVsLmNvbT4KLS0tCiBpbnRlbC9pOTE1X3BjaWlkcy5oIHwgNyArKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2ludGVsL2k5MTVfcGNpaWRzLmggYi9pbnRlbC9pOTE1X3BjaWlkcy5oCmluZGV4
IGIxZjY2YjExLi4zZTI2YTkxNyAxMDA2NDQKLS0tIGEvaW50ZWwvaTkxNV9wY2lpZHMuaAorKysg
Yi9pbnRlbC9pOTE1X3BjaWlkcy5oCkBAIC01NzksMTIgKzU3OSwxNSBAQAogCUlOVEVMX1ZHQV9E
RVZJQ0UoMHg4QTUxLCBpbmZvKSwgXAogCUlOVEVMX1ZHQV9ERVZJQ0UoMHg4QTVELCBpbmZvKQog
Ci0vKiBFSEwgKi8KKy8qIEVITC9KU0wgKi8KICNkZWZpbmUgSU5URUxfRUhMX0lEUyhpbmZvKSBc
CiAJSU5URUxfVkdBX0RFVklDRSgweDQ1MDAsIGluZm8pLAlcCiAJSU5URUxfVkdBX0RFVklDRSgw
eDQ1NzEsIGluZm8pLCBcCiAJSU5URUxfVkdBX0RFVklDRSgweDQ1NTEsIGluZm8pLCBcCi0JSU5U
RUxfVkdBX0RFVklDRSgweDQ1NDEsIGluZm8pCisJSU5URUxfVkdBX0RFVklDRSgweDQ1NDEsIGlu
Zm8pLCBcCisJSU5URUxfVkdBX0RFVklDRSgweDRFNzEsIGluZm8pLCBcCisJSU5URUxfVkdBX0RF
VklDRSgweDRFNjEsIGluZm8pLCBcCisJSU5URUxfVkdBX0RFVklDRSgweDRFNTEsIGluZm8pCiAK
IC8qIFRHTCAqLwogI2RlZmluZSBJTlRFTF9UR0xfMTJfSURTKGluZm8pIFwKLS0gCjIuMjQuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
