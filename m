Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A692C6551
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9236ED0B;
	Fri, 27 Nov 2020 12:11:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 254026ED01;
 Fri, 27 Nov 2020 12:11:29 +0000 (UTC)
IronPort-SDR: fNyZNUh3rNbae19mn7xG/OZu4M1pdvBzONKUL48+n+xHaeT8a4yzN+AC2W+n74IPj6kWDEE6W5
 +WwklY6xXnqA==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092901"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092901"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:28 -0800
IronPort-SDR: GeiYGNCBEbdTQQJ1k2Effud/r0DL6WAgeHyRNtwC9N7/iTvSz3iuo2L6DzARgaBQrb9hIYmwln
 6DEW7+xAqtMQ==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029794"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:27 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 123/162] drm/i915/dg1: Double memory bandwidth available
Date: Fri, 27 Nov 2020 12:06:39 +0000
Message-Id: <20201127120718.454037-124-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
Cc: Swati Sharma <swati2.sharma@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2xpbnQgVGF5bG9yIDxjbGludG9uLmEudGF5bG9yQGludGVsLmNvbT4KClVzZSBNQ0hC
QVIgR2Vhcl90eXBlIGluZm9ybWF0aW9uIHRvIGNvbXB1dGUgbWVtb3J5IGJhbmR3aWR0aCBhdmFp
bGFibGUKZHVyaW5nIE1DSEJBUiBjYWxjdWxhdGlvbnMuCgpDYzogU3dhdGkgU2hhcm1hIDxzd2F0
aTIuc2hhcm1hQGludGVsLmNvbT4KQ2M6IFN3YXRpIFNoYXJtYSA8c3dhdGkyLnNoYXJtYUBpbnRl
bC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PgpTaWduZWQtb2ZmLWJ5OiBDbGludCBUYXlsb3IgPGNsaW50b24uYS50YXlsb3JAaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncuYyB8IDggKysrKysr
KysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2J3LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9k
aXNwbGF5L2ludGVsX2J3LmMKaW5kZXggNTI0NGFlNzcyMjZkLi4zN2ZlZjNiNWNiNTggMTAwNjQ0
Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncuYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2J3LmMKQEAgLTEwOCw2ICsxMDgsOSBAQCBz
dGF0aWMgaW50IGljbF9wY29kZV9yZWFkX21lbV9nbG9iYWxfaW5mbyhzdHJ1Y3QgZHJtX2k5MTVf
cHJpdmF0ZSAqZGV2X3ByaXYsCiAjZGVmaW5lICBERzFfRFJBTV9UX1JQX01BU0sgKDB4N0YgPDwg
MCkKICNkZWZpbmUgIERHMV9EUkFNX1RfUlBfU0hJRlQgMAogCisjZGVmaW5lICBJQ0xfR0VBUl9U
WVBFX01BU0sgKDB4MDEgPDwgMTYpCisjZGVmaW5lICBJQ0xfR0VBUl9UWVBFX1NISUZUIDE2CisK
IHN0YXRpYyBpbnQgZGcxX21jaGJhcl9yZWFkX3Fndl9wb2ludF9pbmZvKHN0cnVjdCBkcm1faTkx
NV9wcml2YXRlICpkZXZfcHJpdiwKIAkJCQkJICBzdHJ1Y3QgaW50ZWxfcWd2X3BvaW50ICpzcCwK
IAkJCQkJICBpbnQgcG9pbnQpCkBAIC0xMjIsNiArMTI1LDExIEBAIHN0YXRpYyBpbnQgZGcxX21j
aGJhcl9yZWFkX3Fndl9wb2ludF9pbmZvKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpkZXZfcHJp
diwKIAllbHNlCiAJCWRjbGtfcmVmZXJlbmNlID0gODsgLyogOCAqIDE2LjY2NiBNSHogPSAxMzMg
TUh6ICovCiAJc3AtPmRjbGsgPSBkY2xrX3JhdGlvICogZGNsa19yZWZlcmVuY2U7CisKKwl2YWwg
PSBJOTE1X1JFQUQoU0tMX01DX0JJT1NfREFUQV8wXzBfMF9NQ0hCQVJfUENVKTsKKwlpZiAoKHZh
bCAmIElDTF9HRUFSX1RZUEVfTUFTSykgPj4gSUNMX0dFQVJfVFlQRV9TSElGVCkKKwkJc3AtPmRj
bGsgKj0gMjsKKwogCWlmIChzcC0+ZGNsayA9PSAwKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAK
Mi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpk
cmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0
cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
