Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC46B35BF9E
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A59D86E3D2;
	Mon, 12 Apr 2021 09:09:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A466E3B7;
 Mon, 12 Apr 2021 09:09:50 +0000 (UTC)
IronPort-SDR: r66JqcCBvvyNjtQUNBgQCJsIT7LSKZpQ545djwmdp77rYHjokK5xXQhYZTJ+HUuubrzY0ByVMQ
 TwjmUtMMMcmQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193709761"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193709761"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:48 -0700
IronPort-SDR: BIP4749M+J0Lg7YCjZKf0z120or4wScet2JZGq0AKagnVn5WULx7Uc1X3Cqwl3V3vYr0hhGIYO
 1CUE5s5hOjIg==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423712803"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:46 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 17/19] drm/i915/dg1: Double memory bandwidth available
Date: Mon, 12 Apr 2021 10:05:24 +0100
Message-Id: <20210412090526.30547-18-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412090526.30547-1-matthew.auld@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Swati Sharma <swati2.sharma@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogQ2xpbnQgVGF5bG9yIDxjbGludG9uLmEudGF5bG9yQGludGVsLmNvbT4KClVzZSBNQ0hC
QVIgR2Vhcl90eXBlIGluZm9ybWF0aW9uIHRvIGNvbXB1dGUgbWVtb3J5IGJhbmR3aWR0aCBhdmFp
bGFibGUKZHVyaW5nIE1DSEJBUiBjYWxjdWxhdGlvbnMuCgp2MiBieSBKYW5pOgotIHN3aXRjaCB0
byBpbnRlbF91bmNvcmVfcmVhZC9pbnRlbF91bmNvcmVfd3JpdGUKClRlc3RlZC1ieTogU3dhdGkg
U2hhcm1hIDxzd2F0aTIuc2hhcm1hQGludGVsLmNvbT4KQ2M6IFN3YXRpIFNoYXJtYSA8c3dhdGky
LnNoYXJtYUBpbnRlbC5jb20+CkNjOiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGlu
dXguaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBDbGludCBUYXlsb3IgPGNsaW50b24uYS50YXls
b3JAaW50ZWwuY29tPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncuYyB8IDgg
KysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2J3LmMgYi9kcml2ZXJzL2dwdS9kcm0v
aTkxNS9kaXNwbGF5L2ludGVsX2J3LmMKaW5kZXggOTljYWUwZGMwY2EyLi42YzAyYmQ1MmNlNDUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfYncuYworKysg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2J3LmMKQEAgLTQxLDYgKzQxLDkg
QEAgc3RydWN0IGludGVsX3Fndl9pbmZvIHsKICNkZWZpbmUgIERHMV9EUkFNX1RfUlBfTUFTSyAo
MHg3RiA8PCAwKQogI2RlZmluZSAgREcxX0RSQU1fVF9SUF9TSElGVCAwCiAKKyNkZWZpbmUgIElD
TF9HRUFSX1RZUEVfTUFTSyAoMHgwMSA8PCAxNikKKyNkZWZpbmUgIElDTF9HRUFSX1RZUEVfU0hJ
RlQgMTYKKwogc3RhdGljIGludCBkZzFfbWNoYmFyX3JlYWRfcWd2X3BvaW50X2luZm8oc3RydWN0
IGRybV9pOTE1X3ByaXZhdGUgKmRldl9wcml2LAogCQkJCQkgIHN0cnVjdCBpbnRlbF9xZ3ZfcG9p
bnQgKnNwLAogCQkJCQkgIGludCBwb2ludCkKQEAgLTU1LDYgKzU4LDExIEBAIHN0YXRpYyBpbnQg
ZGcxX21jaGJhcl9yZWFkX3Fndl9wb2ludF9pbmZvKHN0cnVjdCBkcm1faTkxNV9wcml2YXRlICpk
ZXZfcHJpdiwKIAllbHNlCiAJCWRjbGtfcmVmZXJlbmNlID0gODsgLyogOCAqIDE2LjY2NiBNSHog
PSAxMzMgTUh6ICovCiAJc3AtPmRjbGsgPSBkY2xrX3JhdGlvICogZGNsa19yZWZlcmVuY2U7CisK
Kwl2YWwgPSBpbnRlbF91bmNvcmVfcmVhZCgmZGV2X3ByaXYtPnVuY29yZSwgU0tMX01DX0JJT1Nf
REFUQV8wXzBfMF9NQ0hCQVJfUENVKTsKKwlpZiAoKHZhbCAmIElDTF9HRUFSX1RZUEVfTUFTSykg
Pj4gSUNMX0dFQVJfVFlQRV9TSElGVCkKKwkJc3AtPmRjbGsgKj0gMjsKKwogCWlmIChzcC0+ZGNs
ayA9PSAwKQogCQlyZXR1cm4gLUVJTlZBTDsKIAotLSAKMi4yNi4zCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRy
aS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
