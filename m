Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93F3D12799D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2019 11:50:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5756D89D56;
	Fri, 20 Dec 2019 10:50:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D14D489D56;
 Fri, 20 Dec 2019 10:50:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Dec 2019 02:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,335,1571727600"; d="scan'208";a="218778074"
Received: from ideak-desk.fi.intel.com ([10.237.72.183])
 by orsmga003.jf.intel.com with ESMTP; 20 Dec 2019 02:50:04 -0800
From: Imre Deak <imre.deak@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/15] drm/fb: Extend format_info member arrays to handle four
 planes
Date: Fri, 20 Dec 2019 12:49:29 +0200
Message-Id: <20191220104931.12135-5-imre.deak@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20191218161105.30638-13-imre.deak@intel.com>
References: <20191218161105.30638-13-imre.deak@intel.com>
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
Cc: dri-devel@lists.freedesktop.org,
 Dhinakaran Pandiyan <dhinakaran.pandiyan@intel.com>,
 Mika Kahola <mika.kahola@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGhpbmFrYXJhbiBQYW5kaXlhbiA8ZGhpbmFrYXJhbi5wYW5kaXlhbkBpbnRlbC5jb20+
CgphZGRmYigpIHVBUEkgaGFzIHN1cHBvcnRlZCBmb3VyIHBsYW5lcyBmb3IgYSB3aGlsZSBub3cs
IG1ha2UgZm9ybWF0X2luZm8KY29tcGF0aWJsZSB3aXRoIHRoYXQuCgpDYzogVmlsbGUgU3lyasOk
bMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IE1hdHQgUm9wZXIgPG1hdHRo
ZXcuZC5yb3BlckBpbnRlbC5jb20+CkNjOiBNaWthIEthaG9sYSA8bWlrYS5rYWhvbGFAaW50ZWwu
Y29tPgpDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpTaWduZWQtb2ZmLWJ5OiBE
aGluYWthcmFuIFBhbmRpeWFuIDxkaGluYWthcmFuLnBhbmRpeWFuQGludGVsLmNvbT4KU2lnbmVk
LW9mZi1ieTogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpSZXZpZXdlZC1ieTogTWlr
YSBLYWhvbGEgPG1pa2Eua2Fob2xhQGludGVsLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZm91
cmNjLmggfCA4ICsrKystLS0tCiAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCA0IGRl
bGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9mb3VyY2MuaCBiL2luY2x1
ZGUvZHJtL2RybV9mb3VyY2MuaAppbmRleCAzMDZkMWVmZWI1ZTAuLjE1NmIxMjJjMGFkNSAxMDA2
NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX2ZvdXJjYy5oCisrKyBiL2luY2x1ZGUvZHJtL2RybV9m
b3VyY2MuaApAQCAtNzgsNyArNzgsNyBAQCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvIHsKIAkJICog
dHJpcGxldCBAY2hhcl9wZXJfYmxvY2ssIEBibG9ja193LCBAYmxvY2tfaCBmb3IgYmV0dGVyCiAJ
CSAqIGRlc2NyaWJpbmcgdGhlIHBpeGVsIGZvcm1hdC4KIAkJICovCi0JCXU4IGNwcFszXTsKKwkJ
dTggY3BwWzRdOwogCiAJCS8qKgogCQkgKiBAY2hhcl9wZXJfYmxvY2s6CkBAIC0xMDQsNyArMTA0
LDcgQEAgc3RydWN0IGRybV9mb3JtYXRfaW5mbyB7CiAJCSAqIGluZm9ybWF0aW9uIGZyb20gdGhl
aXIgZHJtX21vZGVfY29uZmlnLmdldF9mb3JtYXRfaW5mbyBob29rCiAJCSAqIGlmIHRoZXkgd2Fu
dCB0aGUgY29yZSB0byBiZSB2YWxpZGF0aW5nIHRoZSBwaXRjaC4KIAkJICovCi0JCXU4IGNoYXJf
cGVyX2Jsb2NrWzNdOworCQl1OCBjaGFyX3Blcl9ibG9ja1s0XTsKIAl9OwogCiAJLyoqCkBAIC0x
MTMsNyArMTEzLDcgQEAgc3RydWN0IGRybV9mb3JtYXRfaW5mbyB7CiAJICogQmxvY2sgd2lkdGgg
aW4gcGl4ZWxzLCB0aGlzIGlzIGludGVuZGVkIHRvIGJlIGFjY2Vzc2VkIHRocm91Z2gKIAkgKiBk
cm1fZm9ybWF0X2luZm9fYmxvY2tfd2lkdGgoKQogCSAqLwotCXU4IGJsb2NrX3dbM107CisJdTgg
YmxvY2tfd1s0XTsKIAogCS8qKgogCSAqIEBibG9ja19oOgpAQCAtMTIxLDcgKzEyMSw3IEBAIHN0
cnVjdCBkcm1fZm9ybWF0X2luZm8gewogCSAqIEJsb2NrIGhlaWdodCBpbiBwaXhlbHMsIHRoaXMg
aXMgaW50ZW5kZWQgdG8gYmUgYWNjZXNzZWQgdGhyb3VnaAogCSAqIGRybV9mb3JtYXRfaW5mb19i
bG9ja19oZWlnaHQoKQogCSAqLwotCXU4IGJsb2NrX2hbM107CisJdTggYmxvY2tfaFs0XTsKIAog
CS8qKiBAaHN1YjogSG9yaXpvbnRhbCBjaHJvbWEgc3Vic2FtcGxpbmcgZmFjdG9yICovCiAJdTgg
aHN1YjsKLS0gCjIuMjIuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJp
LWRldmVsCg==
