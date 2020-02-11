Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FBED1594BE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 17:22:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3A86EEAD;
	Tue, 11 Feb 2020 16:22:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 088746EEAD;
 Tue, 11 Feb 2020 16:22:23 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Feb 2020 08:22:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="227546085"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 11 Feb 2020 08:22:19 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 11 Feb 2020 18:22:19 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/7] drm/exynos: Use drm_encoder_mask()
Date: Tue, 11 Feb 2020 18:22:04 +0200
Message-Id: <20200211162208.16224-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
References: <20200211162208.16224-1-ville.syrjala@linux.intel.com>
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
Cc: Joonyoung Shim <jy0922.shim@samsung.com>, intel-gfx@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
cGxhY2UgdGhlIGhhbmQgcm9sbGVkIGVuY29kZXIgYml0bWFzayB0aGluZyB3aXRoIGRybV9lbmNv
ZGVyX21hc2soKQoKQ2M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KQ2M6IEpvb255
b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4KQ2M6IFNldW5nLVdvbyBLaW0gPHN3
MDMxMi5raW1Ac2Ftc3VuZy5jb20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNh
bXN1bmcuY29tPgpBY2tlZC1ieTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+ClNpZ25lZC1vZmYtYnk6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUuc3lyamFsYUBsaW51eC5p
bnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jIHwg
NSArKy0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMgYi9k
cml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMKaW5kZXggYmEwZjg2OGIyNDc3
Li41N2RlZmViNDQ1MjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9z
X2RybV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZXh5bm9zL2V4eW5vc19kcm1fZHJ2LmMK
QEAgLTI3MCw3ICsyNzAsNyBAQCBzdGF0aWMgaW50IGV4eW5vc19kcm1fYmluZChzdHJ1Y3QgZGV2
aWNlICpkZXYpCiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwogCXN0cnVjdCBkcm1fZGV2
aWNlICpkcm07CiAJdW5zaWduZWQgaW50IGNsb25lX21hc2s7Ci0JaW50IGNudCwgcmV0OworCWlu
dCByZXQ7CiAKIAlkcm0gPSBkcm1fZGV2X2FsbG9jKCZleHlub3NfZHJtX2RyaXZlciwgZGV2KTsK
IAlpZiAoSVNfRVJSKGRybSkpCkBAIC0yOTMsMTAgKzI5Myw5IEBAIHN0YXRpYyBpbnQgZXh5bm9z
X2RybV9iaW5kKHN0cnVjdCBkZXZpY2UgKmRldikKIAlleHlub3NfZHJtX21vZGVfY29uZmlnX2lu
aXQoZHJtKTsKIAogCS8qIHNldHVwIHBvc3NpYmxlX2Nsb25lcy4gKi8KLQljbnQgPSAwOwogCWNs
b25lX21hc2sgPSAwOwogCWxpc3RfZm9yX2VhY2hfZW50cnkoZW5jb2RlciwgJmRybS0+bW9kZV9j
b25maWcuZW5jb2Rlcl9saXN0LCBoZWFkKQotCQljbG9uZV9tYXNrIHw9ICgxIDw8IChjbnQrKykp
OworCQljbG9uZV9tYXNrIHw9IGRybV9lbmNvZGVyX21hc2soZW5jb2Rlcik7CiAKIAlsaXN0X2Zv
cl9lYWNoX2VudHJ5KGVuY29kZXIsICZkcm0tPm1vZGVfY29uZmlnLmVuY29kZXJfbGlzdCwgaGVh
ZCkKIAkJZW5jb2Rlci0+cG9zc2libGVfY2xvbmVzID0gY2xvbmVfbWFzazsKLS0gCjIuMjQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
