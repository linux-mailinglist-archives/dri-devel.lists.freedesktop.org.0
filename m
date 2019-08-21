Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBFCF97659
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2019 11:43:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2002F89BFC;
	Wed, 21 Aug 2019 09:43:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF3EA89BFC
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Aug 2019 09:43:16 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Aug 2019 02:43:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,412,1559545200"; d="scan'208";a="195964019"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 21 Aug 2019 02:43:14 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: fix module name in edid_firmware log message
Date: Wed, 21 Aug 2019 12:43:12 +0300
Message-Id: <20190821094312.5514-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com,
 =?UTF-8?q?G=C3=B6ran=20Uddeborg?= <goeran@uddeborg.se>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIG1vZHVsZSBpcyBkcm1fa21zX2hlbHBlciwgbm90IGRybV9rbXNfZmlybXdhcmUuCgpCdWd6
aWxsYTogaHR0cHM6Ly9idWd6aWxsYS5rZXJuZWwub3JnL3Nob3dfYnVnLmNnaT9pZD0yMDQ1NDkK
UmVwb3J0ZWQtYnk6IEfDtnJhbiBVZGRlYm9yZyA8Z29lcmFuQHVkZGVib3JnLnNlPgpGaXhlczog
YWM2YzM1YTRkOGM3ICgiZHJtOiBhZGQgYmFja3dhcmRzIGNvbXBhdGliaWxpdHkgc3VwcG9ydCBm
b3IgZHJtX2ttc19oZWxwZXIuZWRpZF9maXJtd2FyZSIpClNpZ25lZC1vZmYtYnk6IEphbmkgTmlr
dWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2RybV9rbXNf
aGVscGVyX2NvbW1vbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9rbXNfaGVscGVy
X2NvbW1vbi5jIGIvZHJpdmVycy9ncHUvZHJtL2RybV9rbXNfaGVscGVyX2NvbW1vbi5jCmluZGV4
IGQ5YTVhYzgxOTQ5ZS4uMjIxYTg1MjhjOTkzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
ZHJtX2ttc19oZWxwZXJfY29tbW9uLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9rbXNfaGVs
cGVyX2NvbW1vbi5jCkBAIC00MCw3ICs0MCw3IEBAIE1PRFVMRV9MSUNFTlNFKCJHUEwgYW5kIGFk
ZGl0aW9uYWwgcmlnaHRzIik7CiAvKiBCYWNrd2FyZCBjb21wYXRpYmlsaXR5IGZvciBkcm1fa21z
X2hlbHBlci5lZGlkX2Zpcm13YXJlICovCiBzdGF0aWMgaW50IGVkaWRfZmlybXdhcmVfc2V0KGNv
bnN0IGNoYXIgKnZhbCwgY29uc3Qgc3RydWN0IGtlcm5lbF9wYXJhbSAqa3ApCiB7Ci0JRFJNX05P
VEUoImRybV9rbXNfZmlybXdhcmUuZWRpZF9maXJtd2FyZSBpcyBkZXByZWNhdGVkLCBwbGVhc2Ug
dXNlIGRybS5lZGlkX2Zpcm13YXJlIGluc3RlYWQuXG4iKTsKKwlEUk1fTk9URSgiZHJtX2ttc19o
ZWxwZXIuZWRpZF9maXJtd2FyZSBpcyBkZXByZWNhdGVkLCBwbGVhc2UgdXNlIGRybS5lZGlkX2Zp
cm13YXJlIGluc3RlYWQuXG4iKTsKIAogCXJldHVybiBfX2RybV9zZXRfZWRpZF9maXJtd2FyZV9w
YXRoKHZhbCk7CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
