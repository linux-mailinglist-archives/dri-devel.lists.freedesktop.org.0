Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BF914019F
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2020 02:58:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EAC56EF44;
	Fri, 17 Jan 2020 01:58:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C8766EF44;
 Fri, 17 Jan 2020 01:58:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 17:58:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,327,1574150400"; d="scan'208";a="226191906"
Received: from josouza-mobl.jf.intel.com (HELO josouza-MOBL.intel.com)
 ([10.24.12.138])
 by orsmga003.jf.intel.com with ESMTP; 16 Jan 2020 17:58:42 -0800
From: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915/display: Set TRANS_DDI_MODE_SELECT to default
 value when disabling TRANS_DDI
Date: Thu, 16 Jan 2020 17:58:37 -0800
Message-Id: <20200117015837.402239-4-jose.souza@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200117015837.402239-1-jose.souza@intel.com>
References: <20200117015837.402239-1-jose.souza@intel.com>
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VEdMIHRpbWVvdXRzIHdoZW4gZGlzYWJsaW5nIE1TVCB0cmFuc2NvZGVyIGFuZCBmaWZvIHVuZGVy
cnVucyBvdmVyIE1TVAp0cmFuc2NvZGVycyBhcmUgZml4ZWQgd2hlbiBzZXR0aW5nIFRSQU5TX0RE
SV9NT0RFX1NFTEVDVCB0byAwKEhETUkKbW9kZSkgZHVyaW5nIHRoZSBkaXNhYmxlIHNlcXVlbmNl
LgoKQWx0aG91Z2ggQlNwZWMgZGlzYWJsZSBzZXF1ZW5jZSBkb24ndCByZXF1aXJlIHRoaXMgc3Rl
cCBpdCBpcyBhCmhhcm1sZXNzIGNoYW5nZSBhbmQgaXQgaXMgYWxzbyBkb25lIGJ5IFdpbmRvd3Mg
ZHJpdmVyLgpBbnlob3cgSFcgdGVhbSB3YXMgbm90aWZpZWQgYWJvdXQgdGhhdCBidXQgaXQgY2Fu
IHRha2Ugc29tZSB0aW1lIHRvCmRvY3VtZW50YXRpb24gdG8gYmUgdXBkYXRlZC4KCkEgY2FzZSB0
aGF0IGFsd2F5cyBsZWFkIHRvIHRob3NlIGlzc3VlcyBpczoKLSBkbyBhIG1vZGVzZXQgZW5hYmxp
bmcgcGlwZSBBIGFuZCBwaXBlIEIgaW4gdGhlIHNhbWUgTVNUIHN0cmVhbQpsZWF2aW5nIEEgYXMg
bWFzdGVyCi0gZGlzYWJsZSBwaXBlIEEsIHByb21vdGUgQiBhcyBtYXN0ZXIgZG9pbmcgYSBmdWxs
IG1vZGVzZXQgaW4gQQotIGVuYWJsZSBwaXBlIEEsIGNoYW5naW5nIHRoZSBtYXN0ZXIgdHJhbnNj
b2RlciBiYWNrIHRvIEEoZG9pbmcgYQpmdWxsIG1vZGVzZXQgaW4gQikKLSBQb3c6IHVuZGVycnVu
cyBhbmQgdGltZW91dHMKClRoZSB0cmFuc2NvZGVycyBpbnZvbHZlZCB3aWxsIG9ubHkgd29yayBh
Z2FpbiB3aGVuIGNvbXBsZXRlIGRpc2FibGVkCmFuZCB0aGVpciBwb3dlciB3ZWxscyB0dXJuZWQg
b2ZmIGNhdXNpbmcgYSByZXNldCBpbiB0aGVpciByZWdpc3RlcnMuCgpDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IE1hdHQgUm9wZXIgPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+ClNpZ25lZC1vZmYtYnk6IEpvc8OpIFJvYmVydG8gZGUgU291
emEgPGpvc2Uuc291emFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZGRpLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RkaS5jCmluZGV4IDMyZWEzYzdlOGI2Mi4u
ODJlOTBmMjcxOTc0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2lu
dGVsX2RkaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGRpLmMK
QEAgLTE5OTcsNiArMTk5Nyw3IEBAIHZvaWQgaW50ZWxfZGRpX2Rpc2FibGVfdHJhbnNjb2Rlcl9m
dW5jKGNvbnN0IHN0cnVjdCBpbnRlbF9jcnRjX3N0YXRlICpjcnRjX3N0YXRlCiAKIAl2YWwgPSBJ
OTE1X1JFQUQoVFJBTlNfRERJX0ZVTkNfQ1RMKGNwdV90cmFuc2NvZGVyKSk7CiAJdmFsICY9IH5U
UkFOU19ERElfRlVOQ19FTkFCTEU7CisJdmFsICY9IH5UUkFOU19ERElfTU9ERV9TRUxFQ1RfTUFT
SzsKIAogCWlmIChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEyKSB7CiAJCWlmICghaW50ZWxfZHBf
bXN0X2lzX21hc3Rlcl90cmFucyhjcnRjX3N0YXRlKSkKLS0gCjIuMjUuMAoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlz
dApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
