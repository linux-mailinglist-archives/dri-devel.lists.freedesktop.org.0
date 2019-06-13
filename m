Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6091B44AF5
	for <lists+dri-devel@lfdr.de>; Thu, 13 Jun 2019 20:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B09B7897EB;
	Thu, 13 Jun 2019 18:43:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A711897E3;
 Thu, 13 Jun 2019 18:43:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Jun 2019 11:43:43 -0700
X-ExtLoop1: 1
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 13 Jun 2019 11:43:39 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 13 Jun 2019 21:43:39 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC][PATCH 1/2] drm: Improve PATH prop docs
Date: Thu, 13 Jun 2019 21:43:34 +0300
Message-Id: <20190613184335.7970-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
References: <20190613184335.7970-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBQQVRIIGJsb2IgaXMgYWxyZWFkeSBiZWluZyBwYXJzZWQgYnkgdXNlcnNwYWNlIGZvciBNU1Qg
Y29ubmVjdG9ycwpzbyB0aGUgbGF5b3V0IG9mIHRoZSBibG9iIGlzIG5vdyB1YWJpLiBMZXQncyBk
b2N1bWVudCB3aGF0IGl0IHNob3VsZApsb29rIGxpa2UuCgpBbHNvIGFkZCBhIGNsZWFyIG5vdGUg
c2F5aW5nIG5vbi1NU1QgY29ubmVjdG9ycyBjYW4gaGF2ZSBhIFBBVEggcHJvcAp0b28uCgpDYzog
RGFuaWVsIFZldHRlciA8ZGFuaWVsQGZmd2xsLmNoPgpDYzogUGVra2EgUGFhbGFuZW4gPHBwYWFs
YW5lbkBnbWFpbC5jb20+CkNjOiBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+ClNp
Z25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5j
b20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYyB8IDEzICsrKysrKysrKysr
LS0KIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgYi9kcml2ZXJzL2dwdS9k
cm0vZHJtX2Nvbm5lY3Rvci5jCmluZGV4IGUxNzU4NmFhYTgwZi4uY2UzOTI2ZTlhZDExIDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jCisrKyBiL2RyaXZlcnMvZ3B1
L2RybS9kcm1fY29ubmVjdG9yLmMKQEAgLTg5OSw3ICs4OTksMTYgQEAgc3RhdGljIGNvbnN0IHN0
cnVjdCBkcm1fcHJvcF9lbnVtX2xpc3QgaGRtaV9jb2xvcnNwYWNlc1tdID0gewogICogCWNvbm5l
Y3RlZC4gVXNlZCBieSBEUCBNU1QuIFRoaXMgc2hvdWxkIGJlIHNldCBieSBjYWxsaW5nCiAgKiAJ
ZHJtX2Nvbm5lY3Rvcl9zZXRfcGF0aF9wcm9wZXJ0eSgpLCBpbiB0aGUgY2FzZSBvZiBEUCBNU1Qg
d2l0aCB0aGUKICAqIAlwYXRoIHByb3BlcnR5IHRoZSBNU1QgbWFuYWdlciBjcmVhdGVkLiBVc2Vy
c3BhY2UgY2Fubm90IGNoYW5nZSB0aGlzCi0gKiAJcHJvcGVydHkuCisgKiAJcHJvcGVydHkuIFRo
ZSB2YWx1ZSBtdXN0IGJlIGFuIEFTQ0lJIHN0cmluZy4KKyAqCisgKiAJRm9yIERQIE1TVCBjb25u
ZWN0b3JzIHRoZSBwYXRoIHN0cmluZyBmb2xsb3dzIHRoZSBwYXR0ZXJuCisgKiAJIm1zdDo8YmFz
ZSBjb25uZWN0b3IgSUQ+Wy08bXN0IHBvcnQ+XS4uLiIsIHdoZXJlIHRoZSBiYXNlIGNvbm5lY3Rv
ciBJRAorICogCWlkZW50aWZpZXMgdGhlIERQIGNvbm5lY3RvciBvbiB0aGUgc291cmNlIGRldmlj
ZSwgYW5kIHRoZSBtc3QgcG9ydHMKKyAqIAlhcmUgdGhlIHBvcnQgbnVtYmVycyBpbiB0aGUgRFAg
TVNUIHRvcG9sb2d5LgorICoKKyAqIAlGb3Igbm9uLURQIE1TVCBjb25uZWN0b3JzIHRoZSBmb3Jt
YXQgaXMgZnJlZWZvcm0sIGFzIGxvbmcgYXMgaXQKKyAqIAl1bmlxdWVseSBpZGVudGlmaWVzIHRo
ZSBwaHlzaWNhbCBwYXRoLCByZW1haW5zIHN0YWJsZSBhY3Jvc3MKKyAqIAlrZXJuZWwgcmVsZWFz
ZXMsIGFuZCBkb2VzIG5vdCBzdGFydCB3aXRoICJtc3Q6Ii4KICAqIFRJTEU6CiAgKiAJQ29ubmVj
dG9yIHRpbGUgZ3JvdXAgcHJvcGVydHkgdG8gaW5kaWNhdGUgaG93IGEgc2V0IG9mIERSTSBjb25u
ZWN0b3IKICAqIAljb21wb3NlIHRvZ2V0aGVyIGludG8gb25lIGxvZ2ljYWwgc2NyZWVuLiBUaGlz
IGlzIHVzZWQgYnkgYm90aCBoaWdoLXJlcwpAQCAtMTY3OCw3ICsxNjg3LDcgQEAgaW50IGRybV9t
b2RlX2NyZWF0ZV9zdWdnZXN0ZWRfb2Zmc2V0X3Byb3BlcnRpZXMoc3RydWN0IGRybV9kZXZpY2Ug
KmRldikKIEVYUE9SVF9TWU1CT0woZHJtX21vZGVfY3JlYXRlX3N1Z2dlc3RlZF9vZmZzZXRfcHJv
cGVydGllcyk7CiAKIC8qKgotICogZHJtX2Nvbm5lY3Rvcl9zZXRfcGF0aF9wcm9wZXJ0eSAtIHNl
dCB0aWxlIHByb3BlcnR5IG9uIGNvbm5lY3RvcgorICogZHJtX2Nvbm5lY3Rvcl9zZXRfcGF0aF9w
cm9wZXJ0eSAtIHNldCBwYXRoIHByb3BlcnR5IG9uIGNvbm5lY3RvcgogICogQGNvbm5lY3Rvcjog
Y29ubmVjdG9yIHRvIHNldCBwcm9wZXJ0eSBvbi4KICAqIEBwYXRoOiBwYXRoIHRvIHVzZSBmb3Ig
cHJvcGVydHk7IG11c3Qgbm90IGJlIE5VTEwuCiAgKgotLSAKMi4yMS4wCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
