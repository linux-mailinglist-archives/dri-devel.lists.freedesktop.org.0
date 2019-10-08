Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F9D0CFF3B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 18:48:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CC6589CDE;
	Tue,  8 Oct 2019 16:48:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2660189CDD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 16:48:31 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 09:48:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="187343294"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 08 Oct 2019 09:48:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Oct 2019 19:48:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/vc4: Use drm_hdmi_avi_infoframe_bars()
Date: Tue,  8 Oct 2019 19:48:14 +0300
Message-Id: <20191008164814.5894-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191008164814.5894-1-ville.syrjala@linux.intel.com>
References: <20191008164814.5894-1-ville.syrjala@linux.intel.com>
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClVz
ZSB0aGUgbmV3IGRybV9oZG1pX2F2aV9pbmZvZnJhbWVfYmFycygpIGhlbHBlciBpbnN0ZWFkCm9m
IGhhbmQgcm9sbGluZyBpdC4KCkNjOiBFcmljIEFuaG9sdCA8ZXJpY0BhbmhvbHQubmV0PgpDYzog
Qm9yaXMgQnJlemlsbG9uIDxib3Jpcy5icmV6aWxsb25AYm9vdGxpbi5jb20+ClNpZ25lZC1vZmYt
Ynk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5pbnRlbC5jb20+Ci0tLQog
ZHJpdmVycy9ncHUvZHJtL3ZjNC92YzRfaGRtaS5jIHwgNSArLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS92YzQvdmM0X2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwppbmRl
eCAwODUzYjk4MGJjYjMuLjFjNjJjNmM5MjQ0YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L3ZjNC92YzRfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS92YzQvdmM0X2hkbWkuYwpAQCAt
Mzk4LDEwICszOTgsNyBAQCBzdGF0aWMgdm9pZCB2YzRfaGRtaV9zZXRfYXZpX2luZm9mcmFtZShz
dHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXIpCiAJCQkJCSAgIEhETUlfUVVBTlRJWkFUSU9OX1JB
TkdFX0xJTUlURUQgOgogCQkJCQkgICBIRE1JX1FVQU5USVpBVElPTl9SQU5HRV9GVUxMKTsKIAot
CWZyYW1lLmF2aS5yaWdodF9iYXIgPSBjc3RhdGUtPnR2Lm1hcmdpbnMucmlnaHQ7Ci0JZnJhbWUu
YXZpLmxlZnRfYmFyID0gY3N0YXRlLT50di5tYXJnaW5zLmxlZnQ7Ci0JZnJhbWUuYXZpLnRvcF9i
YXIgPSBjc3RhdGUtPnR2Lm1hcmdpbnMudG9wOwotCWZyYW1lLmF2aS5ib3R0b21fYmFyID0gY3N0
YXRlLT50di5tYXJnaW5zLmJvdHRvbTsKKwlkcm1faGRtaV9hdmlfaW5mb2ZyYW1lX2JhcnMoJmZy
YW1lLmF2aSwgY3N0YXRlKTsKIAogCXZjNF9oZG1pX3dyaXRlX2luZm9mcmFtZShlbmNvZGVyLCAm
ZnJhbWUpOwogfQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
