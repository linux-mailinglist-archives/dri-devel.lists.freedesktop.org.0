Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7399B885FD
	for <lists+dri-devel@lfdr.de>; Sat, 10 Aug 2019 00:28:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6E466EF18;
	Fri,  9 Aug 2019 22:27:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 381A76EF0F;
 Fri,  9 Aug 2019 22:27:17 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 15:27:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,366,1559545200"; d="scan'208";a="176927061"
Received: from jmath3-mobl1.ger.corp.intel.com (HELO
 mwahaha-bdw.ger.corp.intel.com) ([10.252.5.86])
 by fmsmga007.fm.intel.com with ESMTP; 09 Aug 2019 15:27:16 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 22/37] drm/i915: define HAS_MAPPABLE_APERTURE
Date: Fri,  9 Aug 2019 23:26:28 +0100
Message-Id: <20190809222643.23142-23-matthew.auld@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190809222643.23142-1-matthew.auld@intel.com>
References: <20190809222643.23142-1-matthew.auld@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogRGFuaWVsZSBDZXJhb2xvIFNwdXJpbyA8ZGFuaWVsZS5jZXJhb2xvc3B1cmlvQGludGVs
LmNvbT4KClRoZSBmb2xsb3dpbmcgcGF0Y2hlcyBpbiB0aGUgc2VyaWVzIHdpbGwgdXNlIGl0IHRv
IGF2b2lkIGNlcnRhaW4Kb3BlcmF0aW9ucyB3aGVuIGFwZXJ0dXJlIGlzIG5vdCBhdmFpbGFibGUg
aW4gSFcuCgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWxlIENlcmFvbG8gU3B1cmlvIDxkYW5pZWxlLmNl
cmFvbG9zcHVyaW9AaW50ZWwuY29tPgpDYzogTWF0dGhldyBBdWxkIDxtYXR0aGV3LmF1bGRAaW50
ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmggfCAyICsrCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L2k5MTUvaTkxNV9kcnYuaCBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2k5MTVfZHJ2LmgKaW5kZXgg
MGY5NGYxZjNjY2FhLi4xODJlZDZiNDZhYTUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9p
OTE1L2k5MTVfZHJ2LmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaTkxNV9kcnYuaApAQCAt
MjE2OCw2ICsyMTY4LDggQEAgSVNfU1VCUExBVEZPUk0oY29uc3Qgc3RydWN0IGRybV9pOTE1X3By
aXZhdGUgKmk5MTUsCiAjZGVmaW5lIE9WRVJMQVlfTkVFRFNfUEhZU0lDQUwoZGV2X3ByaXYpIFwK
IAkJKElOVEVMX0lORk8oZGV2X3ByaXYpLT5kaXNwbGF5Lm92ZXJsYXlfbmVlZHNfcGh5c2ljYWwp
CiAKKyNkZWZpbmUgSEFTX01BUFBBQkxFX0FQRVJUVVJFKGRldl9wcml2KSAoZGV2X3ByaXYtPmdn
dHQubWFwcGFibGVfZW5kID4gMCkKKwogLyogRWFybHkgZ2VuMiBoYXZlIGEgdG90YWxseSBidXN0
ZWQgQ1MgdGxiIGFuZCByZXF1aXJlIHBpbm5lZCBiYXRjaGVzLiAqLwogI2RlZmluZSBIQVNfQlJP
S0VOX0NTX1RMQihkZXZfcHJpdikJKElTX0k4MzAoZGV2X3ByaXYpIHx8IElTX0k4NDVHKGRldl9w
cml2KSkKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
