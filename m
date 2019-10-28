Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93A08E6FB3
	for <lists+dri-devel@lfdr.de>; Mon, 28 Oct 2019 11:38:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 817246E52D;
	Mon, 28 Oct 2019 10:38:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE17D6E52D;
 Mon, 28 Oct 2019 10:38:35 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 03:38:35 -0700
X-IronPort-AV: E=Sophos;i="5.68,239,1569308400"; d="scan'208";a="193218666"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 28 Oct 2019 03:38:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH RESEND 0/8] drm/print: cleanup and new drm_device based logging
Date: Mon, 28 Oct 2019 12:38:14 +0200
Message-Id: <cover.1572258935.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmVzZW5kIG9mIFsxXTsgSSBtYXkgaGF2ZSByZWJhc2VkIGJ1dCBJJ20gbm90IHN1cmUgYW55bW9y
ZS4uLgoKRm9yIHN0YXJ0ZXJzIHNvbWUgZmFpcmx5IGJlbmlnbiBjbGVhbnVwLCBhbmQgYSBwcm9w
b3NhbCBmb3IgbmV3IHN0cnVjdApkcm1fZGV2aWNlIGJhc2VkIGRybSBsb2dnaW5nIG1hY3JvcyBh
bmFsb2d1b3VzIHRvIGNvcmUga2VybmVsIHN0cnVjdApkZXZpY2UgYmFzZWQgbWFjcm9zLgoKUGxl
YXNlIGxldCdzIGF0IGxlYXN0IGdldCB0aGUgZmlyc3QgNyByZXZpZXdlZC9hY2tlZC9tZXJnZWQs
IHNoYWxsIHdlPwoKCkJSLApKYW5pLgoKClsxXSBodHRwczovL3BhdGNod29yay5mcmVlZGVza3Rv
cC5vcmcvc2VyaWVzLzY3Nzk1LwoKCkphbmkgTmlrdWxhICg4KToKICBkcm0vaTkxNTogdXNlIGRy
bV9kZWJ1Z19lbmFibGVkKCkgdG8gY2hlY2sgZm9yIGRlYnVnIGNhdGVnb3JpZXMKICBkcm0vbm91
dmVhdTogdXNlIGRybV9kZWJ1Z19lbmFibGVkKCkgdG8gY2hlY2sgZm9yIGRlYnVnIGNhdGVnb3Jp
ZXMKICBkcm0vYW1kZ3B1OiB1c2UgZHJtX2RlYnVnX2VuYWJsZWQoKSB0byBjaGVjayBmb3IgZGVi
dWcgY2F0ZWdvcmllcwogIGRybS9wcmludDogcmVuYW1lIGRybV9kZWJ1ZyB0byBfX2RybV9kZWJ1
ZyB0byBkaXNjb3VyYWdlIHVzZQogIGRybS9wcmludDogdW5kZXJzY29yZSBwcmVmaXggZnVuY3Rp
b25zIHRoYXQgc2hvdWxkIGJlIHByaXZhdGUgdG8gcHJpbnQKICBkcm0vcHJpbnQ6IGNvbnZlcnQg
ZGVidWcgY2F0ZWdvcnkgbWFjcm9zIGludG8gYW4gZW51bQogIGRybS9wcmludDogZ3JvdXAgbG9n
Z2luZyBmdW5jdGlvbnMgYnkgcHJpbmsgb3IgZGV2aWNlIGJhc2VkCiAgZHJtL3ByaW50OiBpbnRy
b2R1Y2UgbmV3IHN0cnVjdCBkcm1fZGV2aWNlIGJhc2VkIGxvZ2dpbmcgbWFjcm9zCgogZHJpdmVy
cy9ncHUvZHJtL2FtZC9hbWRncHUvc211X3YxMV8wX2kyYy5jICAgfCAgIDQgKy0KIGRyaXZlcnMv
Z3B1L2RybS9kcm1fcHJpbnQuYyAgICAgICAgICAgICAgICAgIHwgIDE4ICstCiBkcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8ICAgNCArLQogZHJpdmVycy9ncHUv
ZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kcC5jICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2k5MTVfZHJ2LmMgICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0v
aTkxNS9pOTE1X2dlbS5oICAgICAgICAgICAgICB8ICAgMiArLQogZHJpdmVycy9ncHUvZHJtL2k5
MTUvaTkxNV91dGlscy5jICAgICAgICAgICAgfCAgIDIgKy0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX3BtLmMgICAgICAgICAgICAgIHwgICAyICstCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9kaXNwLmggICAgICB8ICAgNCArLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kcnYuaCAgICAgICAgfCAgIDQgKy0KIGluY2x1ZGUvZHJtL2RybV9wcmludC5oICAg
ICAgICAgICAgICAgICAgICAgIHwgMzA0ICsrKysrKysrKysrKy0tLS0tLS0KIDExIGZpbGVzIGNo
YW5nZWQsIDIyNCBpbnNlcnRpb25zKCspLCAxMjQgZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
