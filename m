Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA7117FAD
	for <lists+dri-devel@lfdr.de>; Wed,  8 May 2019 20:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F3489970;
	Wed,  8 May 2019 18:13:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69A2489958;
 Wed,  8 May 2019 18:13:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 May 2019 11:12:54 -0700
X-ExtLoop1: 1
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by orsmga006.jf.intel.com with ESMTP; 08 May 2019 11:12:50 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v9 13/13] drm/i915: Add state readout for DRM infoframe
Date: Thu,  9 May 2019 00:08:53 +0530
Message-Id: <1557340733-9629-14-git-send-email-uma.shankar@intel.com>
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

QWRkZWQgc3RhdGUgcmVhZG91dCBmb3IgRFJNIGluZm9mcmFtZSBhbmQgZW5hYmxlZApzdGF0ZSB2
YWxpZGF0aW9uIGZvciBEUk0gaW5mb2ZyYW1lLgoKU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIg
PHVtYS5zaGFua2FyQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9k
ZGkuYyAgICAgfCA0ICsrKysKIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rpc3BsYXkuYyB8
IDEgKwogZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfaGRtaS5jICAgIHwgNCArKysrCiAzIGZp
bGVzIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9pOTE1L2ludGVsX2RkaS5jIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKaW5k
ZXggZDM3NTI2Yi4uM2EzOGYzMiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50
ZWxfZGRpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGRpLmMKQEAgLTM4NDks
NiArMzg0OSwxMCBAQCB2b2lkIGludGVsX2RkaV9nZXRfY29uZmlnKHN0cnVjdCBpbnRlbF9lbmNv
ZGVyICplbmNvZGVyLAogCWludGVsX3JlYWRfaW5mb2ZyYW1lKGVuY29kZXIsIHBpcGVfY29uZmln
LAogCQkJICAgICBIRE1JX0lORk9GUkFNRV9UWVBFX1ZFTkRPUiwKIAkJCSAgICAgJnBpcGVfY29u
ZmlnLT5pbmZvZnJhbWVzLmhkbWkpOworCWlmICgoSU5URUxfR0VOKGRldl9wcml2KSA+PSAxMCB8
fCBJU19HRU1JTklMQUtFKGRldl9wcml2KSkpCisJCWludGVsX3JlYWRfaW5mb2ZyYW1lKGVuY29k
ZXIsIHBpcGVfY29uZmlnLAorCQkJCSAgICAgSERNSV9JTkZPRlJBTUVfVFlQRV9EUk0sCisJCQkJ
ICAgICAmcGlwZV9jb25maWctPmluZm9mcmFtZXMuZHJtKTsKIH0KIAogc3RhdGljIGVudW0gaW50
ZWxfb3V0cHV0X3R5cGUKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rp
c3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2Rpc3BsYXkuYwppbmRleCBhMzUx
YzhlLi43NGI1MTg5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9kaXNw
bGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfZGlzcGxheS5jCkBAIC0xMjIz
MSw2ICsxMjIzMSw3IEBAIHN0YXRpYyBib29sIGZhc3Rib290X2VuYWJsZWQoc3RydWN0IGRybV9p
OTE1X3ByaXZhdGUgKmRldl9wcml2KQogCVBJUEVfQ09ORl9DSEVDS19JTkZPRlJBTUUoYXZpKTsK
IAlQSVBFX0NPTkZfQ0hFQ0tfSU5GT0ZSQU1FKHNwZCk7CiAJUElQRV9DT05GX0NIRUNLX0lORk9G
UkFNRShoZG1pKTsKKwlQSVBFX0NPTkZfQ0hFQ0tfSU5GT0ZSQU1FKGRybSk7CiAKICN1bmRlZiBQ
SVBFX0NPTkZfQ0hFQ0tfWAogI3VuZGVmIFBJUEVfQ09ORl9DSEVDS19JCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9oZG1pLmMgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9p
bnRlbF9oZG1pLmMKaW5kZXggMjI0ZDMzZS4uMzg4NjA2NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfaGRtaS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVs
X2hkbWkuYwpAQCAtMTg2Nyw2ICsxODY3LDEwIEBAIHN0YXRpYyB2b2lkIGludGVsX2hkbWlfZ2V0
X2NvbmZpZyhzdHJ1Y3QgaW50ZWxfZW5jb2RlciAqZW5jb2RlciwKIAlpbnRlbF9yZWFkX2luZm9m
cmFtZShlbmNvZGVyLCBwaXBlX2NvbmZpZywKIAkJCSAgICAgSERNSV9JTkZPRlJBTUVfVFlQRV9W
RU5ET1IsCiAJCQkgICAgICZwaXBlX2NvbmZpZy0+aW5mb2ZyYW1lcy5oZG1pKTsKKwlpZiAoKElO
VEVMX0dFTihkZXZfcHJpdikgPj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZfcHJpdikpKQorCQlp
bnRlbF9yZWFkX2luZm9mcmFtZShlbmNvZGVyLCBwaXBlX2NvbmZpZywKKwkJCQkgICAgIEhETUlf
SU5GT0ZSQU1FX1RZUEVfRFJNLAorCQkJCSAgICAgJnBpcGVfY29uZmlnLT5pbmZvZnJhbWVzLmRy
bSk7CiB9CiAKIHN0YXRpYyB2b2lkIGludGVsX2VuYWJsZV9oZG1pX2F1ZGlvKHN0cnVjdCBpbnRl
bF9lbmNvZGVyICplbmNvZGVyLAotLSAKMS45LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2RyaS1kZXZlbA==
