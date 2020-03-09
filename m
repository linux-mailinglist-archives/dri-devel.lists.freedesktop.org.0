Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 369D617EB4E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 22:38:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 536506E598;
	Mon,  9 Mar 2020 21:38:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 894BC6E598;
 Mon,  9 Mar 2020 21:38:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Mar 2020 14:38:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,534,1574150400"; d="scan'208";a="388702059"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by orsmga004.jf.intel.com with ESMTP; 09 Mar 2020 14:38:27 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/2] drm/edid: Name the detailed monitor range flags
Date: Mon,  9 Mar 2020 14:39:39 -0700
Message-Id: <20200309213940.27965-1-manasi.d.navare@intel.com>
X-Mailer: git-send-email 2.19.1
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
Cc: Manasi Navare <manasi.d.navare@intel.com>,
 Kazlauskas Nicholas <Nicholas.Kazlauskas@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBhZGRzIGRlZmluZXMgZm9yIHRoZSBkZXRhaWxlZCBtb25pdG9yCnJhbmdlIGZs
YWdzIGFzIHBlciB0aGUgRURJRCBzcGVjaWZpY2F0aW9uLgoKdjI6CiogUmVuYW1lIHRoZSBmbGFn
cyB3aXRoIERSTV9FRElEXyAoSmFuaSBOKQoKU3VnZ2VzdGVkLWJ5OiBWaWxsZSBTeXJqw6Rsw6Qg
PHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxs
ZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxoYXJyeS53ZW50
bGFuZEBhbWQuY29tPgpDYzogQ2xpbnRvbiBBIFRheWxvciA8Y2xpbnRvbi5hLnRheWxvckBpbnRl
bC5jb20+CkNjOiBLYXpsYXVza2FzIE5pY2hvbGFzIDxOaWNob2xhcy5LYXpsYXVza2FzQGFtZC5j
b20+CkNjOiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAbGludXguaW50ZWwuY29tPgpTaWduZWQt
b2ZmLWJ5OiBNYW5hc2kgTmF2YXJlIDxtYW5hc2kuZC5uYXZhcmVAaW50ZWwuY29tPgpSZXZpZXdl
ZC1ieTogTmljaG9sYXMgS2F6bGF1c2thcyA8bmljaG9sYXMua2F6bGF1c2thc0BhbWQuY29tPgot
LS0KIGluY2x1ZGUvZHJtL2RybV9lZGlkLmggfCA1ICsrKysrCiAxIGZpbGUgY2hhbmdlZCwgNSBp
bnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2VkaWQuaCBiL2luY2x1
ZGUvZHJtL2RybV9lZGlkLmgKaW5kZXggZjBiMDNkNDAxYzI3Li4zNGIxNWUzZDA3MGMgMTAwNjQ0
Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9lZGlkLmgKKysrIGIvaW5jbHVkZS9kcm0vZHJtX2VkaWQu
aApAQCAtOTEsNiArOTEsMTEgQEAgc3RydWN0IGRldGFpbGVkX2RhdGFfc3RyaW5nIHsKIAl1OCBz
dHJbMTNdOwogfSBfX2F0dHJpYnV0ZV9fKChwYWNrZWQpKTsKIAorI2RlZmluZSBEUk1fRURJRF9E
RUZBVUxUX0dURl9TVVBQT1JUX0ZMQUcgICAweDAwCisjZGVmaW5lIERSTV9FRElEX1JBTkdFX0xJ
TUlUU19PTkxZX0ZMQUcgICAgIDB4MDEKKyNkZWZpbmUgRFJNX0VESURfU0VDT05EQVJZX0dURl9T
VVBQT1JUX0ZMQUcgMHgwMgorI2RlZmluZSBEUk1fRURJRF9DVlRfU1VQUE9SVF9GTEFHICAgICAg
ICAgICAweDA0CisKIHN0cnVjdCBkZXRhaWxlZF9kYXRhX21vbml0b3JfcmFuZ2UgewogCXU4IG1p
bl92ZnJlcTsKIAl1OCBtYXhfdmZyZXE7Ci0tIAoyLjE5LjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
