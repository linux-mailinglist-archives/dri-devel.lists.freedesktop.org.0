Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 528662087E
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 15:43:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3142896B0;
	Thu, 16 May 2019 13:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E832889722;
 Thu, 16 May 2019 13:43:43 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 06:43:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,476,1549958400"; d="scan'208";a="172354168"
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga002.fm.intel.com with ESMTP; 16 May 2019 06:43:40 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v11 10/12] drm/i915: Added DRM Infoframe handling for BYT/CHT
Date: Thu, 16 May 2019 19:40:15 +0530
Message-Id: <1558015817-12025-11-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
References: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, emil.l.velikov@gmail.com,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QllUL0NIVCBkb2Vzbid0IHN1cHBvcnQgRFJNIEluZm9mcmFtZS4gVGhpcyBjYXVzZWQKYSBXQVJO
X09OIGR1ZSB0byBhIG1pc3NpbmcgQ0FTRSB3aGlsZSBleGVjdXRpbmcKaW50ZWxfaGRtaV9pbmZv
ZnJhbWVzX2VuYWJsZWQgZnVuY3Rpb24uIFRoaXMgcGF0Y2gKZml4ZXMgdGhlIHNhbWUuCgpTaWdu
ZWQtb2ZmLWJ5OiBVbWEgU2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPgotLS0KIGRyaXZl
cnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGlu
c2VydGlvbnMoKykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1p
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMKaW5kZXggOGJkN2MwNy4uOTBl
MDU4NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfaGRtaS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYwpAQCAtMTI5LDYgKzEyOSw4IEBAIHN0
YXRpYyB1MzIgZzR4X2luZm9mcmFtZV9lbmFibGUodW5zaWduZWQgaW50IHR5cGUpCiAJCXJldHVy
biBWSURFT19ESVBfRU5BQkxFX1NQRDsKIAljYXNlIEhETUlfSU5GT0ZSQU1FX1RZUEVfVkVORE9S
OgogCQlyZXR1cm4gVklERU9fRElQX0VOQUJMRV9WRU5ET1I7CisJY2FzZSBIRE1JX0lORk9GUkFN
RV9UWVBFX0RSTToKKwkJcmV0dXJuIDA7CiAJZGVmYXVsdDoKIAkJTUlTU0lOR19DQVNFKHR5cGUp
OwogCQlyZXR1cm4gMDsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
