Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EBF9A4F2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Aug 2019 03:35:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC7C26E53C;
	Fri, 23 Aug 2019 01:35:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45E7D6E53C;
 Fri, 23 Aug 2019 01:35:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Aug 2019 18:35:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,419,1559545200"; d="scan'208";a="203614230"
Received: from helsinki.fi.intel.com ([10.237.66.174])
 by fmsmga004.fm.intel.com with ESMTP; 22 Aug 2019 18:35:02 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 3/6] drm: Add DisplayPort colorspace property
Date: Fri, 23 Aug 2019 04:34:58 +0300
Message-Id: <20190823013501.14256-4-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190823013501.14256-1-gwan-gyeong.mun@intel.com>
References: <20190823013501.14256-1-gwan-gyeong.mun@intel.com>
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
Cc: uma.shankar@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SW4gb3JkZXIgdG8gdXNlIGNvbG9yc3BhY2UgcHJvcGVydHkgdG8gRGlzcGxheSBQb3J0IGNvbm5l
Y3RvcnMsIGl0IGV4dGVuZHMKRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IGNvbm5lY3Rv
cl90eXBlIG9uCmRybV9tb2RlX2NyZWF0ZV9jb2xvcnNwYWNlX3Byb3BlcnR5IGZ1bmN0aW9uLgoK
U2lnbmVkLW9mZi1ieTogR3dhbi1neWVvbmcgTXVuIDxnd2FuLWd5ZW9uZy5tdW5AaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fY29ubmVjdG9yLmMgfCA0ICsrKy0KIDEgZmlsZSBj
aGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vZHJtX2Nvbm5lY3Rvci5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9jb25uZWN0
b3IuYwppbmRleCA0Yzc2NjYyNGIyMGQuLjY1NWFkYTlkNGMxNiAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2RybV9jb25uZWN0b3IuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Nvbm5l
Y3Rvci5jCkBAIC0xNzAzLDcgKzE3MDMsOSBAQCBpbnQgZHJtX21vZGVfY3JlYXRlX2NvbG9yc3Bh
Y2VfcHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKIAlzdHJ1Y3QgZHJt
X3Byb3BlcnR5ICpwcm9wOwogCiAJaWYgKGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJN
X01PREVfQ09OTkVDVE9SX0hETUlBIHx8Ci0JICAgIGNvbm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUg
PT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlCKSB7CisJICAgIGNvbm5lY3Rvci0+Y29ubmVjdG9y
X3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0hETUlCIHx8CisJICAgIGNvbm5lY3Rvci0+Y29u
bmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX0Rpc3BsYXlQb3J0IHx8CisJICAgIGNv
bm5lY3Rvci0+Y29ubmVjdG9yX3R5cGUgPT0gRFJNX01PREVfQ09OTkVDVE9SX2VEUCkgewogCQlw
cm9wID0gZHJtX3Byb3BlcnR5X2NyZWF0ZV9lbnVtKGRldiwgRFJNX01PREVfUFJPUF9FTlVNLAog
CQkJCQkJIkNvbG9yc3BhY2UiLAogCQkJCQkJaGRtaV9jb2xvcnNwYWNlcywKLS0gCjIuMjIuMAoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
