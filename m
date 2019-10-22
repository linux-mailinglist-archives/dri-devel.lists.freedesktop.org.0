Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAA1BE01A9
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2019 12:10:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEEA6E563;
	Tue, 22 Oct 2019 10:10:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED116E563;
 Tue, 22 Oct 2019 10:10:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 03:10:18 -0700
X-IronPort-AV: E=Sophos;i="5.67,326,1566889200"; d="scan'208";a="187838540"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Oct 2019 03:10:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/5] drm/dsi: rename MIPI_DCS_SET_PARTIAL_AREA to
 MIPI_DCS_SET_PARTIAL_ROWS
Date: Tue, 22 Oct 2019 13:09:46 +0300
Message-Id: <c14255c3cecea4d2c593ff4edd5e8134ab7568d3.1571738674.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1571738674.git.jani.nikula@intel.com>
References: <cover.1571738674.git.jani.nikula@intel.com>
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
dW1lcmF0aW9uIHRvIG1hdGNoIHRoZSBzcGVjLgoKQ2M6IERhdmlkIExlY2huZXIgPGRhdmlkQGxl
Y2hub2xvZ3kuY29tPgpDYzogVmFuZGl0YSBLdWxrYXJuaSA8dmFuZGl0YS5rdWxrYXJuaUBpbnRl
bC5jb20+ClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMgfCAyICstCiBpbmNsdWRlL3ZpZGVv
L21pcGlfZGlzcGxheS5oICB8IDIgKy0KIDIgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCsp
LCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4
Ni5jIGIvZHJpdmVycy9ncHUvZHJtL3Rpbnkvc3Q3NTg2LmMKaW5kZXggM2NjMjFhMWIzMGM4Li4w
NjBjYzc1NjE5NGYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4Ni5jCisr
KyBiL2RyaXZlcnMvZ3B1L2RybS90aW55L3N0NzU4Ni5jCkBAIC0yNDAsNyArMjQwLDcgQEAgc3Rh
dGljIHZvaWQgc3Q3NTg2X3BpcGVfZW5hYmxlKHN0cnVjdCBkcm1fc2ltcGxlX2Rpc3BsYXlfcGlw
ZSAqcGlwZSwKIAogCW1pcGlfZGJpX2NvbW1hbmQoZGJpLCBTVDc1ODZfU0VUX0RJU1BfRFVUWSwg
MHg3Zik7CiAJbWlwaV9kYmlfY29tbWFuZChkYmksIFNUNzU4Nl9TRVRfUEFSVF9ESVNQLCAweGEw
KTsKLQltaXBpX2RiaV9jb21tYW5kKGRiaSwgTUlQSV9EQ1NfU0VUX1BBUlRJQUxfQVJFQSwgMHgw
MCwgMHgwMCwgMHgwMCwgMHg3Nyk7CisJbWlwaV9kYmlfY29tbWFuZChkYmksIE1JUElfRENTX1NF
VF9QQVJUSUFMX1JPV1MsIDB4MDAsIDB4MDAsIDB4MDAsIDB4NzcpOwogCW1pcGlfZGJpX2NvbW1h
bmQoZGJpLCBNSVBJX0RDU19FWElUX0lOVkVSVF9NT0RFKTsKIAogCW1zbGVlcCgxMDApOwpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS92aWRlby9taXBpX2Rpc3BsYXkuaCBiL2luY2x1ZGUvdmlkZW8vbWlw
aV9kaXNwbGF5LmgKaW5kZXggOTI4ZjhjNGI2NjU4Li5lM2RjOTRmZTEwOTggMTAwNjQ0Ci0tLSBh
L2luY2x1ZGUvdmlkZW8vbWlwaV9kaXNwbGF5LmgKKysrIGIvaW5jbHVkZS92aWRlby9taXBpX2Rp
c3BsYXkuaApAQCAtMTA4LDcgKzEwOCw3IEBAIGVudW0gewogCU1JUElfRENTX1dSSVRFX01FTU9S
WV9TVEFSVAk9IDB4MkMsCiAJTUlQSV9EQ1NfV1JJVEVfTFVUCQk9IDB4MkQsCiAJTUlQSV9EQ1Nf
UkVBRF9NRU1PUllfU1RBUlQJPSAweDJFLAotCU1JUElfRENTX1NFVF9QQVJUSUFMX0FSRUEJPSAw
eDMwLAorCU1JUElfRENTX1NFVF9QQVJUSUFMX1JPV1MJPSAweDMwLAogCU1JUElfRENTX1NFVF9Q
QVJUSUFMX0NPTFVNTlMJPSAweDMxLAogCU1JUElfRENTX1NFVF9TQ1JPTExfQVJFQQk9IDB4MzMs
CiAJTUlQSV9EQ1NfU0VUX1RFQVJfT0ZGCQk9IDB4MzQsCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxp
c3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
