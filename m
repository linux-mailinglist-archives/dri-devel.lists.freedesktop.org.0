Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A62744D05B
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jun 2019 16:27:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A73406E5BB;
	Thu, 20 Jun 2019 14:27:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AAF26E5B4;
 Thu, 20 Jun 2019 14:26:59 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jun 2019 07:26:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,397,1557212400"; d="scan'208";a="168528229"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by FMSMGA003.fm.intel.com with SMTP; 20 Jun 2019 07:26:56 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 20 Jun 2019 17:26:55 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915: Drop redundant aspec ratio prop value
 initialization
Date: Thu, 20 Jun 2019 17:26:39 +0300
Message-Id: <20190620142639.17518-6-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
References: <20190620142639.17518-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkhE
TUlfUElDVFVSRV9BU1BFQ1RfTk9ORSBpcyB6ZXJvIGFuZCB0aGUgY29ubmVjdG9yIHN0YXRlIGlz
IGt6YWxsb2MoKSdkCnNvIG5vIG5lZWQgdG8gaW5pdGlhbGl6ZSBjb25uX3N0YXRlLT5waWN0dXJl
X2FzcGVjdF9yYXRpbyB3aXRoIGl0LgoKQ2M6IElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0
LmVkdT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4
LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWku
YyB8IDEgLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zZHZvLmMgfCAxIC0K
IDIgZmlsZXMgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rp
c3BsYXkvaW50ZWxfaGRtaS5jCmluZGV4IDZhNDY1MGI0NGFjNi4uZjk1ZjNkYjVlY2I4IDEwMDY0
NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2hkbWkuYwpAQCAtMjgwOSw3ICsyODA5
LDYgQEAgaW50ZWxfaGRtaV9hZGRfcHJvcGVydGllcyhzdHJ1Y3QgaW50ZWxfaGRtaSAqaW50ZWxf
aGRtaSwgc3RydWN0IGRybV9jb25uZWN0b3IgKmMKIAkJaW50ZWxfYXR0YWNoX2NvbG9yc3BhY2Vf
cHJvcGVydHkoY29ubmVjdG9yKTsKIAogCWRybV9jb25uZWN0b3JfYXR0YWNoX2NvbnRlbnRfdHlw
ZV9wcm9wZXJ0eShjb25uZWN0b3IpOwotCWNvbm5lY3Rvci0+c3RhdGUtPnBpY3R1cmVfYXNwZWN0
X3JhdGlvID0gSERNSV9QSUNUVVJFX0FTUEVDVF9OT05FOwogCiAJaWYgKElOVEVMX0dFTihkZXZf
cHJpdikgPj0gMTAgfHwgSVNfR0VNSU5JTEFLRShkZXZfcHJpdikpCiAJCWRybV9vYmplY3RfYXR0
YWNoX3Byb3BlcnR5KCZjb25uZWN0b3ItPmJhc2UsCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfc2R2by5jCmluZGV4IDVjYjYxOTYxMzE1Ny4uYzQ3MWZjY2U1OWY4IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uYworKysgYi9kcml2
ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nkdm8uYwpAQCAtMjYyNCw3ICsyNjI0LDYg
QEAgaW50ZWxfc2R2b19hZGRfaGRtaV9wcm9wZXJ0aWVzKHN0cnVjdCBpbnRlbF9zZHZvICppbnRl
bF9zZHZvLAogCQlpbnRlbF9hdHRhY2hfYnJvYWRjYXN0X3JnYl9wcm9wZXJ0eSgmY29ubmVjdG9y
LT5iYXNlLmJhc2UpOwogCX0KIAlpbnRlbF9hdHRhY2hfYXNwZWN0X3JhdGlvX3Byb3BlcnR5KCZj
b25uZWN0b3ItPmJhc2UuYmFzZSk7Ci0JY29ubmVjdG9yLT5iYXNlLmJhc2Uuc3RhdGUtPnBpY3R1
cmVfYXNwZWN0X3JhdGlvID0gSERNSV9QSUNUVVJFX0FTUEVDVF9OT05FOwogfQogCiBzdGF0aWMg
c3RydWN0IGludGVsX3Nkdm9fY29ubmVjdG9yICppbnRlbF9zZHZvX2Nvbm5lY3Rvcl9hbGxvYyh2
b2lkKQotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
