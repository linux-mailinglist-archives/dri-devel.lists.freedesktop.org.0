Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1CFD69B08
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jul 2019 20:53:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0FDA89AC2;
	Mon, 15 Jul 2019 18:53:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986F289307
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jul 2019 18:53:39 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 15 Jul 2019 11:53:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,493,1557212400"; d="scan'208";a="178303816"
Received: from ldmartin-desk1.jf.intel.com (HELO ldmartin-desk1.intel.com)
 ([10.24.9.35])
 by orsmga002.jf.intel.com with ESMTP; 15 Jul 2019 11:53:38 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH libdrm 2/3] intel: add the TGL 12 PCI IDs and macros
Date: Mon, 15 Jul 2019 11:53:31 -0700
Message-Id: <20190715185332.10615-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190715185332.10615-1-lucas.demarchi@intel.com>
References: <20190715185332.10615-1-lucas.demarchi@intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29tPgoKQ2M6IFJvZHJpZ28g
Vml2aSA8cm9kcmlnby52aXZpQGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogTHVjYXMgRGUgTWFy
Y2hpIDxsdWNhcy5kZW1hcmNoaUBpbnRlbC5jb20+Ci0tLQogaW50ZWwvaW50ZWxfY2hpcHNldC5j
IHwgMSArCiBpbnRlbC9pbnRlbF9jaGlwc2V0LmggfCAxICsKIDIgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW50ZWwvaW50ZWxfY2hpcHNldC5jIGIvaW50ZWwv
aW50ZWxfY2hpcHNldC5jCmluZGV4IDVhYTRhMmYyLi4xNTdjMmM3ZCAxMDA2NDQKLS0tIGEvaW50
ZWwvaW50ZWxfY2hpcHNldC5jCisrKyBiL2ludGVsL2ludGVsX2NoaXBzZXQuYwpAQCAtMzUsNiAr
MzUsNyBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2UgewogCXVpbnQxNl90IGdlbjsK
IH0gcGNpaWRzW10gPSB7CiAJLyogS2VlcCBpZHMgc29ydGVkIGJ5IGdlbjsgbGF0ZXN0IGdlbiBm
aXJzdCAqLworCUlOVEVMX1RHTF8xMl9JRFMoMTIpLAogCUlOVEVMX0lDTF8xMV9JRFMoMTEpLAog
CUlOVEVMX0NOTF9JRFMoMTApLAogCUlOVEVMX0NGTF9JRFMoOSksCmRpZmYgLS1naXQgYS9pbnRl
bC9pbnRlbF9jaGlwc2V0LmggYi9pbnRlbC9pbnRlbF9jaGlwc2V0LmgKaW5kZXggNWRiMjA3Y2Mu
LjBhNDhlMGRhIDEwMDY0NAotLS0gYS9pbnRlbC9pbnRlbF9jaGlwc2V0LmgKKysrIGIvaW50ZWwv
aW50ZWxfY2hpcHNldC5oCkBAIC0zMzcsNiArMzM3LDcgQEAgZHJtX3ByaXZhdGUgYm9vbCBpbnRl
bF9nZXRfZ2VueCh1bnNpZ25lZCBpbnQgZGV2aWQsIGludCAqZ2VuKTsKICNkZWZpbmUgSVNfR0VO
OShkZXZpZCkgaW50ZWxfaXNfZ2VueChkZXZpZCwgOSkKICNkZWZpbmUgSVNfR0VOMTAoZGV2aWQp
IGludGVsX2lzX2dlbngoZGV2aWQsIDEwKQogI2RlZmluZSBJU19HRU4xMShkZXZpZCkgaW50ZWxf
aXNfZ2VueChkZXZpZCwgMTEpCisjZGVmaW5lIElTX0dFTjEyKGRldmlkKSBpbnRlbF9pc19nZW54
KGRldmlkLCAxMikKIAogI2RlZmluZSBJU185WFgoZGV2KQkJKElTX0dFTjMoZGV2KSB8fCBcCiAJ
CQkJIElTX0dFTjQoZGV2KSB8fCBcCi0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
