Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2FC717FA6
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 20:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BEDF89932;
	Wed,  8 May 2019 18:12:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF04889916;
 Wed,  8 May 2019 18:12:41 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 11:12:41 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by orsmga006.jf.intel.com with ESMTP; 08 May 2019 11:12:37 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v9 10/13] drm/i915: Set Infoframe for non modeset case for HDR
Date: Thu,  9 May 2019 00:08:50 +0530
Message-Id: <1557340733-9629-11-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1557340733-9629-1-git-send-email-uma.shankar@intel.com>
References: <1557340733-9629-1-git-send-email-uma.shankar@intel.com>
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
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org,
 ville.syrjala@intel.com, maarten.lankhorst@intel.com
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SERSIG1ldGFkYXRhIHJlcXVpcmVzIGEgaW5mb2ZyYW1lIHRvIGJlIHNldC4gRHVlIHRvIGZhc3Rz
ZXQsCmZ1bGwgbW9kZXNldCBpcyBub3QgcGVyZm9ybWVkIGhlbmNlIGFkZGluZyBpdCB0byB1cGRh
dGVfcGlwZQp0byBoYW5kbGUgdGhhdC4KClNpZ25lZC1vZmYtYnk6IFVtYSBTaGFua2FyIDx1bWEu
c2hhbmthckBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBTaGFzaGFuayBTaGFybWEgPHNoYXNoYW5r
LnNoYXJtYUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMg
IHwgMTMgKysrKysrKysrKysrKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfaGRtaS5jIHwg
IDcgKysrKystLQogMiBmaWxlcyBjaGFuZ2VkLCAxOCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9u
cygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2RkaS5jIGIvZHJp
dmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKaW5kZXggY2Q1Mjc3ZC4uZDM3NTI2YiAxMDA2
NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKQEAgLTM1NTksNiArMzU1OSwxMCBAQCBzdGF0aWMgdm9p
ZCBpbnRlbF9kZGlfdXBkYXRlX3BpcGUoc3RydWN0IGludGVsX2VuY29kZXIgKmVuY29kZXIsCiAJ
CQkJICBjb25zdCBzdHJ1Y3QgaW50ZWxfY3J0Y19zdGF0ZSAqY3J0Y19zdGF0ZSwKIAkJCQkgIGNv
bnN0IHN0cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpjb25uX3N0YXRlKQogeworCXN0cnVjdCBk
cm1faTkxNV9wcml2YXRlICpkZXZfcHJpdiA9IHRvX2k5MTUoZW5jb2Rlci0+YmFzZS5kZXYpOwor
CXN0cnVjdCBpbnRlbF9kaWdpdGFsX3BvcnQgKmludGVsX2RpZ19wb3J0ID0KKwkJCWVuY190b19k
aWdfcG9ydCgmZW5jb2Rlci0+YmFzZSk7CisKIAlpZiAoIWludGVsX2NydGNfaGFzX3R5cGUoY3J0
Y19zdGF0ZSwgSU5URUxfT1VUUFVUX0hETUkpKQogCQlpbnRlbF9kZGlfdXBkYXRlX3BpcGVfZHAo
ZW5jb2RlciwgY3J0Y19zdGF0ZSwgY29ubl9zdGF0ZSk7CiAKQEAgLTM1NjgsNiArMzU3MiwxNSBA
QCBzdGF0aWMgdm9pZCBpbnRlbF9kZGlfdXBkYXRlX3BpcGUoc3RydWN0IGludGVsX2VuY29kZXIg
KmVuY29kZXIsCiAJZWxzZSBpZiAoY29ubl9zdGF0ZS0+Y29udGVudF9wcm90ZWN0aW9uID09CiAJ
CSBEUk1fTU9ERV9DT05URU5UX1BST1RFQ1RJT05fVU5ERVNJUkVEKQogCQlpbnRlbF9oZGNwX2Rp
c2FibGUodG9faW50ZWxfY29ubmVjdG9yKGNvbm5fc3RhdGUtPmNvbm5lY3RvcikpOworCisJLyog
U2V0IHRoZSBpbmZvZnJhbWUgZm9yIE5PTiBtb2Rlc2V0IGNhc2VzIGFzIHdlbGwgKi8KKwlpZiAo
aW50ZWxfY3J0Y19oYXNfdHlwZShjcnRjX3N0YXRlLCBJTlRFTF9PVVRQVVRfSERNSSkpIHsKKwkJ
aWYgKChJTlRFTF9HRU4oZGV2X3ByaXYpID49IDEwIHx8IElTX0dFTUlOSUxBS0UoZGV2X3ByaXYp
KSAmJgorCQkgICAgY29ubl9zdGF0ZS0+aGRyX21ldGFkYXRhX2NoYW5nZWQpCisJCQlpbnRlbF9k
aWdfcG9ydC0+c2V0X2luZm9mcmFtZXMoZW5jb2RlciwKKwkJCQkJCSAgICAgICBjcnRjX3N0YXRl
LT5oYXNfaW5mb2ZyYW1lLAorCQkJCQkJICAgICAgIGNydGNfc3RhdGUsIGNvbm5fc3RhdGUpOwor
CX0KIH0KIAogc3RhdGljIHZvaWQgaW50ZWxfZGRpX3NldF9maWFfbGFuZV9jb3VudChzdHJ1Y3Qg
aW50ZWxfZW5jb2RlciAqZW5jb2RlciwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1
L2ludGVsX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYwppbmRleCBk
YjljODJiLi5lNTU5YTk0MCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxf
aGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2hkbWkuYwpAQCAtMTIwNCw4
ICsxMjA0LDExIEBAIHN0YXRpYyB2b2lkIGhzd19zZXRfaW5mb2ZyYW1lcyhzdHJ1Y3QgaW50ZWxf
ZW5jb2RlciAqZW5jb2RlciwKIAlpOTE1X3JlZ190IHJlZyA9IEhTV19UVklERU9fRElQX0NUTChj
cnRjX3N0YXRlLT5jcHVfdHJhbnNjb2Rlcik7CiAJdTMyIHZhbCA9IEk5MTVfUkVBRChyZWcpOwog
Ci0JYXNzZXJ0X2hkbWlfdHJhbnNjb2Rlcl9mdW5jX2Rpc2FibGVkKGRldl9wcml2LAotCQkJCQkg
ICAgIGNydGNfc3RhdGUtPmNwdV90cmFuc2NvZGVyKTsKKwkvKiBEUk0gSW5mb2ZyYW1lIGNhbiBi
ZSBzZW5kIHdpdGggdHJhbnNjb2RlciBlbmFibGVkICovCisJaWYgKCEoKElOVEVMX0dFTihkZXZf
cHJpdikgPj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZfcHJpdikpICYmCisJICAgICAgY29ubl9z
dGF0ZS0+aGRyX21ldGFkYXRhX2NoYW5nZWQpKQorCQlhc3NlcnRfaGRtaV90cmFuc2NvZGVyX2Z1
bmNfZGlzYWJsZWQoZGV2X3ByaXYsCisJCQkJCQkgICAgIGNydGNfc3RhdGUtPmNwdV90cmFuc2Nv
ZGVyKTsKIAogCXZhbCAmPSB+KFZJREVPX0RJUF9FTkFCTEVfVlNDX0hTVyB8IFZJREVPX0RJUF9F
TkFCTEVfQVZJX0hTVyB8CiAJCSBWSURFT19ESVBfRU5BQkxFX0dDUF9IU1cgfCBWSURFT19ESVBf
RU5BQkxFX1ZTX0hTVyB8Ci0tIAoxLjkuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vZHJpLWRldmVs
