Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 576901CD8E
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2019 19:10:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076A789338;
	Tue, 14 May 2019 17:10:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0746289332;
 Tue, 14 May 2019 17:10:04 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 14 May 2019 10:10:03 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga005.fm.intel.com with ESMTP; 14 May 2019 10:10:00 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v10 10/12] drm/i915: Added DRM Infoframe handling for BYT/CHT
Date: Tue, 14 May 2019 23:06:32 +0530
Message-Id: <1557855394-12214-11-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
References: <1557855394-12214-1-git-send-email-uma.shankar@intel.com>
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
LmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMKaW5kZXggZTk3YmY2ZS4uYjY0
NWNiYiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfaGRtaS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYwpAQCAtMTI5LDYgKzEyOSw4IEBAIHN0
YXRpYyB1MzIgZzR4X2luZm9mcmFtZV9lbmFibGUodW5zaWduZWQgaW50IHR5cGUpCiAJCXJldHVy
biBWSURFT19ESVBfRU5BQkxFX1NQRDsKIAljYXNlIEhETUlfSU5GT0ZSQU1FX1RZUEVfVkVORE9S
OgogCQlyZXR1cm4gVklERU9fRElQX0VOQUJMRV9WRU5ET1I7CisJY2FzZSBIRE1JX0lORk9GUkFN
RV9UWVBFX0RSTToKKwkJcmV0dXJuIDA7CiAJZGVmYXVsdDoKIAkJTUlTU0lOR19DQVNFKHR5cGUp
OwogCQlyZXR1cm4gMDsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9kcmktZGV2ZWw=
