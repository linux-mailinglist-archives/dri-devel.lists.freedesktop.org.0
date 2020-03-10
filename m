Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE4B2180C26
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 00:15:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A0426E3CE;
	Tue, 10 Mar 2020 23:15:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 926616E8F6;
 Tue, 10 Mar 2020 23:15:36 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Mar 2020 16:15:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,538,1574150400"; d="scan'208";a="353743869"
Received: from labuser-z97x-ud5h.jf.intel.com ([10.165.21.211])
 by fmsmga001.fm.intel.com with ESMTP; 10 Mar 2020 16:15:35 -0700
From: Manasi Navare <manasi.d.navare@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/2] drm/edid: Name the detailed monitor range flags
Date: Tue, 10 Mar 2020 16:16:50 -0700
Message-Id: <20200310231651.13841-1-manasi.d.navare@intel.com>
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
