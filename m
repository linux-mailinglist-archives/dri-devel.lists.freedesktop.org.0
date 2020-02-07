Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ADD41558E8
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 15:00:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D47F66FCB0;
	Fri,  7 Feb 2020 14:00:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F4F6FCAF;
 Fri,  7 Feb 2020 14:00:05 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 06:00:04 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="225384657"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 07 Feb 2020 06:00:01 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 16:00:00 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 3/6] drm/exynos: Use drm_encoder_mask()
Date: Fri,  7 Feb 2020 15:59:47 +0200
Message-Id: <20200207135950.6655-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
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
Cc: Kyungmin Park <kyungmin.park@samsung.com>, intel-gfx@lists.freedesktop.org,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClJl
cGxhY2UgdGhlIGhhbmQgcm9sbGVkIGVuY29kZXIgYml0bWFzayB0aGluZyB3aXRoIGRybV9lbmNv
ZGVyX21hc2soKQoKQ2M6IElua2kgRGFlIDxpbmtpLmRhZUBzYW1zdW5nLmNvbT4KQ2M6IEpvb255
b3VuZyBTaGltIDxqeTA5MjIuc2hpbUBzYW1zdW5nLmNvbT4KQ2M6IFNldW5nLVdvbyBLaW0gPHN3
MDMxMi5raW1Ac2Ftc3VuZy5jb20+CkNjOiBLeXVuZ21pbiBQYXJrIDxreXVuZ21pbi5wYXJrQHNh
bXN1bmcuY29tPgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFA
bGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9leHlub3MvZXh5bm9zX2RybV9k
cnYuYyB8IDUgKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Ry
di5jIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJtX2Rydi5jCmluZGV4IGJhMGY4
NjhiMjQ3Ny4uNTdkZWZlYjQ0NTIyIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZXh5bm9z
L2V4eW5vc19kcm1fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2V4eW5vcy9leHlub3NfZHJt
X2Rydi5jCkBAIC0yNzAsNyArMjcwLDcgQEAgc3RhdGljIGludCBleHlub3NfZHJtX2JpbmQoc3Ry
dWN0IGRldmljZSAqZGV2KQogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKIAlzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtOwogCXVuc2lnbmVkIGludCBjbG9uZV9tYXNrOwotCWludCBjbnQsIHJl
dDsKKwlpbnQgcmV0OwogCiAJZHJtID0gZHJtX2Rldl9hbGxvYygmZXh5bm9zX2RybV9kcml2ZXIs
IGRldik7CiAJaWYgKElTX0VSUihkcm0pKQpAQCAtMjkzLDEwICsyOTMsOSBAQCBzdGF0aWMgaW50
IGV4eW5vc19kcm1fYmluZChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJZXh5bm9zX2RybV9tb2RlX2Nv
bmZpZ19pbml0KGRybSk7CiAKIAkvKiBzZXR1cCBwb3NzaWJsZV9jbG9uZXMuICovCi0JY250ID0g
MDsKIAljbG9uZV9tYXNrID0gMDsKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGVuY29kZXIsICZkcm0t
Pm1vZGVfY29uZmlnLmVuY29kZXJfbGlzdCwgaGVhZCkKLQkJY2xvbmVfbWFzayB8PSAoMSA8PCAo
Y250KyspKTsKKwkJY2xvbmVfbWFzayB8PSBkcm1fZW5jb2Rlcl9tYXNrKGVuY29kZXIpOwogCiAJ
bGlzdF9mb3JfZWFjaF9lbnRyeShlbmNvZGVyLCAmZHJtLT5tb2RlX2NvbmZpZy5lbmNvZGVyX2xp
c3QsIGhlYWQpCiAJCWVuY29kZXItPnBvc3NpYmxlX2Nsb25lcyA9IGNsb25lX21hc2s7Ci0tIAoy
LjI0LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
