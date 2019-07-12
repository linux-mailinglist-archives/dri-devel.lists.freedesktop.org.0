Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 627F9670CF
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jul 2019 15:59:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 522F66E10F;
	Fri, 12 Jul 2019 13:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A22126E0F7;
 Fri, 12 Jul 2019 13:59:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Jul 2019 06:59:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,482,1557212400"; d="scan'208";a="168323442"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by fmsmga007.fm.intel.com with ESMTP; 12 Jul 2019 06:59:21 -0700
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Pekka Paalanen <ppaalanen@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v10 5/6] drm/i915: update the hdcp state with uevent
Date: Fri, 12 Jul 2019 12:30:25 +0530
Message-Id: <20190712070026.13088-6-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20190712070026.13088-1-ramalingam.c@intel.com>
References: <20190712070026.13088-1-ramalingam.c@intel.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

ZHJtIGZ1bmN0aW9uIHRvIHVwZGF0ZSB0aGUgY29udGVudCBwcm90ZWN0aW9uIHByb3BlcnR5IHN0
YXRlIGFuZCB0bwpnZW5lcmF0ZSBhIHVldmVudCBpcyBpbnZva2VkIGZyb20gdGhlIGludGVsIGhk
Y3AgcHJvcGVydHkgd29yay4KCkhlbmNlIHdoZW5ldmVyIGtlcm5lbCBjaGFuZ2VzIHRoZSBwcm9w
ZXJ0eSBzdGF0ZSwgdXNlcnNwYWNlIHdpbGwgYmUKdXBkYXRlZCB3aXRoIGEgdWV2ZW50LgoKTmVl
ZCBhIEFDSyBmb3IgdWV2ZW50IGdlbmVyYXRpbmcgdUFQSSBmcm9tIHVzZXJzcGFjZS4KCnYyOgog
IHN0YXRlIHVwZGF0ZSBpcyBtb3ZlZCBpbnRvIGRybSBmdW5jdGlvbiBbZGFuaWVsXQoKU2lnbmVk
LW9mZi1ieTogUmFtYWxpbmdhbSBDIDxyYW1hbGluZ2FtLmNAaW50ZWwuY29tPgpSZXZpZXdlZC1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KLS0tCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkY3AuYyB8IDggKysrLS0tLS0KIDEgZmlsZSBjaGFu
Z2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2hkY3AuYwppbmRleCAxNDM0ZmMwOWNhMjkuLjg0NWViOGYyOWI1OCAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9oZGNwLmMKQEAgLTg2OSw3ICs4
NjksNiBAQCBzdGF0aWMgdm9pZCBpbnRlbF9oZGNwX3Byb3Bfd29yayhzdHJ1Y3Qgd29ya19zdHJ1
Y3QgKndvcmspCiAJCQkJCSAgICAgICBwcm9wX3dvcmspOwogCXN0cnVjdCBpbnRlbF9jb25uZWN0
b3IgKmNvbm5lY3RvciA9IGludGVsX2hkY3BfdG9fY29ubmVjdG9yKGhkY3ApOwogCXN0cnVjdCBk
cm1fZGV2aWNlICpkZXYgPSBjb25uZWN0b3ItPmJhc2UuZGV2OwotCXN0cnVjdCBkcm1fY29ubmVj
dG9yX3N0YXRlICpzdGF0ZTsKIAogCWRybV9tb2Rlc2V0X2xvY2soJmRldi0+bW9kZV9jb25maWcu
Y29ubmVjdGlvbl9tdXRleCwgTlVMTCk7CiAJbXV0ZXhfbG9jaygmaGRjcC0+bXV0ZXgpOwpAQCAt
ODc5LDEwICs4NzgsOSBAQCBzdGF0aWMgdm9pZCBpbnRlbF9oZGNwX3Byb3Bfd29yayhzdHJ1Y3Qg
d29ya19zdHJ1Y3QgKndvcmspCiAJICogdGhvc2UgdG8gVU5ERVNJUkVEIGlzIGhhbmRsZWQgYnkg
Y29yZS4gSWYgdmFsdWUgPT0gVU5ERVNJUkVELAogCSAqIHdlJ3JlIHJ1bm5pbmcganVzdCBhZnRl
ciBoZGNwIGhhcyBiZWVuIGRpc2FibGVkLCBzbyBqdXN0IGV4aXQKIAkgKi8KLQlpZiAoaGRjcC0+
dmFsdWUgIT0gRFJNX01PREVfQ09OVEVOVF9QUk9URUNUSU9OX1VOREVTSVJFRCkgewotCQlzdGF0
ZSA9IGNvbm5lY3Rvci0+YmFzZS5zdGF0ZTsKLQkJc3RhdGUtPmNvbnRlbnRfcHJvdGVjdGlvbiA9
IGhkY3AtPnZhbHVlOwotCX0KKwlpZiAoaGRjcC0+dmFsdWUgIT0gRFJNX01PREVfQ09OVEVOVF9Q
Uk9URUNUSU9OX1VOREVTSVJFRCkKKwkJZHJtX2hkY3BfdXBkYXRlX2NvbnRlbnRfcHJvdGVjdGlv
bigmY29ubmVjdG9yLT5iYXNlLAorCQkJCQkJICAgaGRjcC0+dmFsdWUpOwogCiAJbXV0ZXhfdW5s
b2NrKCZoZGNwLT5tdXRleCk7CiAJZHJtX21vZGVzZXRfdW5sb2NrKCZkZXYtPm1vZGVfY29uZmln
LmNvbm5lY3Rpb25fbXV0ZXgpOwotLSAKMi4xOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
