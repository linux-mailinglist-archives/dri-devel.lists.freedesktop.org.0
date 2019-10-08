Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BDC7CFF3A
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2019 18:48:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB2289CDD;
	Tue,  8 Oct 2019 16:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7338289CDD
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2019 16:48:30 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Oct 2019 09:48:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.67,270,1566889200"; d="scan'208";a="223291031"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 08 Oct 2019 09:48:14 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 08 Oct 2019 19:48:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/edid: Add drm_hdmi_avi_infoframe_bars()
Date: Tue,  8 Oct 2019 19:48:13 +0300
Message-Id: <20191008164814.5894-1-ville.syrjala@linux.intel.com>
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
Cc: Boris Brezillon <boris.brezillon@bootlin.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkFk
ZCBhIGZ1bmN0aW9uIHRvIGZpbGwgdGhlIEFWSSBpbmZvZnJhbWUgYmFyIGluZm9ybWF0aW9uIGZy
b20KdGhlIHN0YW5kYXJkIHR2IG1hcmdpbiBwcm9wZXJ0aWVzLgoKQ2M6IEVyaWMgQW5ob2x0IDxl
cmljQGFuaG9sdC5uZXQ+CkNjOiBCb3JpcyBCcmV6aWxsb24gPGJvcmlzLmJyZXppbGxvbkBib290
bGluLmNvbT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxp
bnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYyB8IDE3ICsrKysr
KysrKysrKysrKysrCiBpbmNsdWRlL2RybS9kcm1fZWRpZC5oICAgICB8ICA0ICsrKysKIDIgZmls
ZXMgY2hhbmdlZCwgMjEgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZWRpZC5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMKaW5kZXggMDU1MjE3NTMx
M2NiLi40YWYxODRiMDdjYzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZC5jCkBAIC01MzgyLDYgKzUzODIsMjMgQEAg
ZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9xdWFudF9yYW5nZShzdHJ1Y3QgaGRtaV9hdmlfaW5mb2Zy
YW1lICpmcmFtZSwKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9xdWFu
dF9yYW5nZSk7CiAKKy8qKgorICogZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9iYXJzKCkgLSBmaWxs
IHRoZSBIRE1JIEFWSSBpbmZvZnJhbWUKKyAqICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgYmFyIGluZm9ybWF0aW9uCisgKiBAZnJhbWU6IEhETUkgQVZJIGluZm9mcmFtZQorICogQGNv
bm5fc3RhdGU6IGNvbm5lY3RvciBzdGF0ZQorICovCit2b2lkCitkcm1faGRtaV9hdmlfaW5mb2Zy
YW1lX2JhcnMoc3RydWN0IGhkbWlfYXZpX2luZm9mcmFtZSAqZnJhbWUsCisJCQkgICAgY29uc3Qg
c3RydWN0IGRybV9jb25uZWN0b3Jfc3RhdGUgKmNvbm5fc3RhdGUpCit7CisJZnJhbWUtPnJpZ2h0
X2JhciA9IGNvbm5fc3RhdGUtPnR2Lm1hcmdpbnMucmlnaHQ7CisJZnJhbWUtPmxlZnRfYmFyID0g
Y29ubl9zdGF0ZS0+dHYubWFyZ2lucy5sZWZ0OworCWZyYW1lLT50b3BfYmFyID0gY29ubl9zdGF0
ZS0+dHYubWFyZ2lucy50b3A7CisJZnJhbWUtPmJvdHRvbV9iYXIgPSBjb25uX3N0YXRlLT50di5t
YXJnaW5zLmJvdHRvbTsKK30KK0VYUE9SVF9TWU1CT0woZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9i
YXJzKTsKKwogc3RhdGljIGVudW0gaGRtaV8zZF9zdHJ1Y3R1cmUKIHMzZF9zdHJ1Y3R1cmVfZnJv
bV9kaXNwbGF5X21vZGUoY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgKm1vZGUpCiB7CmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fZWRpZC5oIGIvaW5jbHVkZS9kcm0vZHJtX2VkaWQu
aAppbmRleCBiOTcxOTQxOGMzZDIuLmUwNzAxYjNkMzE5NCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9k
cm0vZHJtX2VkaWQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZWRpZC5oCkBAIC0zNjcsNiArMzY3
LDEwIEBAIHZvaWQKIGRybV9oZG1pX2F2aV9pbmZvZnJhbWVfY29sb3JzcGFjZShzdHJ1Y3QgaGRt
aV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwKIAkJCQkgIGNvbnN0IHN0cnVjdCBkcm1fY29ubmVjdG9y
X3N0YXRlICpjb25uX3N0YXRlKTsKIAordm9pZAorZHJtX2hkbWlfYXZpX2luZm9mcmFtZV9iYXJz
KHN0cnVjdCBoZG1pX2F2aV9pbmZvZnJhbWUgKmZyYW1lLAorCQkJICAgIGNvbnN0IHN0cnVjdCBk
cm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKTsKKwogdm9pZAogZHJtX2hkbWlfYXZpX2lu
Zm9mcmFtZV9xdWFudF9yYW5nZShzdHJ1Y3QgaGRtaV9hdmlfaW5mb2ZyYW1lICpmcmFtZSwKIAkJ
CQkgICBzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubmVjdG9yLAotLSAKMi4yMS4wCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
