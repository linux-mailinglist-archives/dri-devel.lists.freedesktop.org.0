Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A13CB62600
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:20:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46EF189F89;
	Mon,  8 Jul 2019 16:20:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86A089F89;
 Mon,  8 Jul 2019 16:20:51 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:20:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="185707596"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga001.fm.intel.com with SMTP; 08 Jul 2019 09:20:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:20:48 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 00/14] drm: Try to fix encoder possible_clones/crtc
Date: Mon,  8 Jul 2019 19:20:34 +0300
Message-Id: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
c3VycmVjdGluZyBteSBwb3NzaWJsZV9jbG9uZXMvY3J0Y3MgY2xlYW51cCBmcm9tIH4xIHllYXIg
YWdvLgpTb21lIHByZXAgd29yayBmcm9tIHRoZSBwcmV2aW91cyBwb3N0aW5nIGRpZCBnZXQgbWVy
Z2VkIGluIHRoZQptZWFudGltZS4KCkkgaGF2ZSBhIGZlZWxpbmcgdGhlIFdBUk5zIGZyb20gdGhl
IG5ldyB2YWxpZGF0aW9uIGNvZGUgbWF5IGVuZCB1cAp0cmlnZ2VyaW5nIG9uIHNvbWUgZHJpdmVy
cywgYnV0IEkgZG9uJ3QgaW1hZ2luZSB0aGlzIHN0dWZmIHdvdWxkCmdldCBmaXhlZCB3aXRob3V0
IGluZmxpY3RpbmcgYSBiaXQgb2YgcGFpbi4KClZpbGxlIFN5cmrDpGzDpCAoMTQpOgogIGRybTog
SW5jbHVkZSB0aGUgZW5jb2RlciBpdHNlbGYgaW4gcG9zc2libGVfY2xvbmVzCiAgZHJtL2dtYTUw
MDogU2FuaXRpemUgcG9zc2libGVfY2xvbmVzCiAgZHJtL3N0aTogUmVtb3ZlIHBvaW50bGVzcyBj
YXN0cwogIGRybS9zdGk6IFRyeSB0byBmaXggdXAgdGhlIHR2b3V0IHBvc3NpYmxlIGNsb25lcwog
IGRybS9leHlub3M6IFVzZSBkcm1fZW5jb2Rlcl9tYXNrKCkKICBkcm0vaW14OiBSZW1vdmUgdGhl
IGJvZ3VzIHBvc3NpYmxlX2Nsb25lcyBzZXR1cAogIGRybS9pOTE1OiBQb2xpc2ggcG9zc2libGVf
Y2xvbmVzIHNldHVwCiAgZHJtL2k5MTU6IFBvcHVsYXRlIHBvc3NpYmxlX2NydGNzIGNvcnJlY3Rs
eQogIGRybS9pOTE1OiBGaXggRFAtTVNUIGNydGNfbWFzawogIGRybS9pOTE1OiBDbGVhbiB1cCBl
bmNvZGVyLT5jcnRjX21hc2sgc2V0dXAKICBkcm0vaTkxNTogU2ltcGxmeSBMVkRTIGNydGNfbWFz
ayBzZXR1cAogIGRybS9pOTE1OiBzL2NydGNfbWFzay9waXBlX21hc2svCiAgZHJtOiBWYWxpZGF0
ZSBlbmNvZGVyLT5wb3NzaWJsZV9jbG9uZXMKICBkcm06IFZhbGlkYXRlIGVuY29kZXItPnBvc3Np
YmxlX2NydGNzCgogZHJpdmVycy9ncHUvZHJtL2RybV9lbmNvZGVyLmMgICAgICAgICAgICAgICAg
fCA2MyArKysrKysrKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3Nf
ZHJtX2Rydi5jICAgICAgfCAgNSArLQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9mcmFtZWJ1ZmZl
ci5jICAgICAgICAgfCAxNiArKy0tLQogZHJpdmVycy9ncHUvZHJtL2dtYTUwMC9tZGZsZF9kc2lf
ZHBpLmMgICAgICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pY2xfZHNp
LmMgICAgICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9jcnQu
YyAgICAgfCAgNCArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kZGkuYyAg
ICAgfCAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMg
fCAyOCArKysrKystLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHAuYyAg
ICAgIHwgIDYgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHBfbXN0LmMg
IHwgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZHZvLmMgICAgIHwg
IDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfaGRtaS5jICAgIHwgIDYg
Ky0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfbHZkcy5jICAgIHwgIDggKy0t
CiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uYyAgICB8ICAyICstCiBk
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3R2LmMgICAgICB8ICAzICstCiBkcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L3Zsdl9kc2kuYyAgICAgICB8ICA2ICstCiBkcml2ZXJz
L2dwdS9kcm0vaTkxNS9pbnRlbF9kcnYuaCAgICAgICAgICAgICB8ICA1ICstCiBkcml2ZXJzL2dw
dS9kcm0vaW14L2lteC1kcm0tY29yZS5jICAgICAgICAgICB8ICAyICstCiBkcml2ZXJzL2dwdS9k
cm0vc3RpL3N0aV90dm91dC5jICAgICAgICAgICAgICB8IDE2ICsrKy0tCiAxOSBmaWxlcyBjaGFu
Z2VkLCAxMjkgaW5zZXJ0aW9ucygrKSwgNTMgZGVsZXRpb25zKC0pCgotLSAKMi4yMS4wCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFp
bGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
