Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17FE7451
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 16:01:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D276E900;
	Mon, 28 Oct 2019 15:01:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 760626E8F7;
 Mon, 28 Oct 2019 15:01:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 08:01:12 -0700
X-IronPort-AV: E=Sophos;i="5.68,240,1569308400"; d="scan'208";a="374248739"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 08:01:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/5] drm/dsi: rename MIPI_DCS_SET_PARTIAL_AREA to
 MIPI_DCS_SET_PARTIAL_ROWS
Date: Mon, 28 Oct 2019 17:00:46 +0200
Message-Id: <20191028150047.22048-4-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028150047.22048-1-jani.nikula@intel.com>
References: <20191028150047.22048-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, Vandita Kulkarni <vandita.kulkarni@intel.com>,
 intel-gfx@lists.freedesktop.org, David Lechner <david@lechnology.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIERDUyBjb21tYW5kIGhhcyBiZWVuIG5hbWVkIFNFVF9QQVJUSUFMX1JPV1MgaW4gdGhlIERD
UyBzcGVjIHNpbmNlCnYxLjAyLCBmb3IgbW9yZSB0aGFuIGEgZGVjYWRlLiBSZW5hbWUgdGhlIGVu
dW1lcmF0aW9uIHRvIG1hdGNoIHRoZSBzcGVjLgoKdjI6IGFkZCBjb21tZW50IGFib3V0IHRoZSBy
ZW5hbWUgKERhdmlkIExlY2huZXIpCgpDYzogRGF2aWQgTGVjaG5lciA8ZGF2aWRAbGVjaG5vbG9n
eS5jb20+CkNjOiBWYW5kaXRhIEt1bGthcm5pIDx2YW5kaXRhLmt1bGthcm5pQGludGVsLmNvbT4K
U2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vdGlueS9zdDc1ODYuYyB8IDIgKy0KIGluY2x1ZGUvdmlkZW8vbWlwaV9k
aXNwbGF5LmggIHwgMiArLQogMiBmaWxlcyBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vdGlueS9zdDc1ODYuYwppbmRleCAzY2MyMWExYjMwYzguLjA2MGNjNzU2
MTk0ZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMKQEAgLTI0MCw3ICsyNDAsNyBAQCBzdGF0aWMgdm9p
ZCBzdDc1ODZfcGlwZV9lbmFibGUoc3RydWN0IGRybV9zaW1wbGVfZGlzcGxheV9waXBlICpwaXBl
LAogCiAJbWlwaV9kYmlfY29tbWFuZChkYmksIFNUNzU4Nl9TRVRfRElTUF9EVVRZLCAweDdmKTsK
IAltaXBpX2RiaV9jb21tYW5kKGRiaSwgU1Q3NTg2X1NFVF9QQVJUX0RJU1AsIDB4YTApOwotCW1p
cGlfZGJpX2NvbW1hbmQoZGJpLCBNSVBJX0RDU19TRVRfUEFSVElBTF9BUkVBLCAweDAwLCAweDAw
LCAweDAwLCAweDc3KTsKKwltaXBpX2RiaV9jb21tYW5kKGRiaSwgTUlQSV9EQ1NfU0VUX1BBUlRJ
QUxfUk9XUywgMHgwMCwgMHgwMCwgMHgwMCwgMHg3Nyk7CiAJbWlwaV9kYmlfY29tbWFuZChkYmks
IE1JUElfRENTX0VYSVRfSU5WRVJUX01PREUpOwogCiAJbXNsZWVwKDEwMCk7CmRpZmYgLS1naXQg
YS9pbmNsdWRlL3ZpZGVvL21pcGlfZGlzcGxheS5oIGIvaW5jbHVkZS92aWRlby9taXBpX2Rpc3Bs
YXkuaAppbmRleCA5MjhmOGM0YjY2NTguLmI2ZDhiODc0MjMzZiAxMDA2NDQKLS0tIGEvaW5jbHVk
ZS92aWRlby9taXBpX2Rpc3BsYXkuaAorKysgYi9pbmNsdWRlL3ZpZGVvL21pcGlfZGlzcGxheS5o
CkBAIC0xMDgsNyArMTA4LDcgQEAgZW51bSB7CiAJTUlQSV9EQ1NfV1JJVEVfTUVNT1JZX1NUQVJU
CT0gMHgyQywKIAlNSVBJX0RDU19XUklURV9MVVQJCT0gMHgyRCwKIAlNSVBJX0RDU19SRUFEX01F
TU9SWV9TVEFSVAk9IDB4MkUsCi0JTUlQSV9EQ1NfU0VUX1BBUlRJQUxfQVJFQQk9IDB4MzAsCisJ
TUlQSV9EQ1NfU0VUX1BBUlRJQUxfUk9XUwk9IDB4MzAsCQkvKiBNSVBJIERDUyAxLjAyIC0gTUlQ
SV9EQ1NfU0VUX1BBUlRJQUxfQVJFQSBiZWZvcmUgdGhhdCAqLwogCU1JUElfRENTX1NFVF9QQVJU
SUFMX0NPTFVNTlMJPSAweDMxLAogCU1JUElfRENTX1NFVF9TQ1JPTExfQVJFQQk9IDB4MzMsCiAJ
TUlQSV9EQ1NfU0VUX1RFQVJfT0ZGCQk9IDB4MzQsCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
