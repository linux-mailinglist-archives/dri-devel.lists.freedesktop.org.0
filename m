Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C1EF25D7EE
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 13:54:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09A666EB4C;
	Fri,  4 Sep 2020 11:54:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAD4C6EB4A;
 Fri,  4 Sep 2020 11:54:01 +0000 (UTC)
IronPort-SDR: /9e4ycY0LX+uw84CUOG8pCoX9EwRX8LrKNGOzv5KxT2oEA8ocvXO242cOnDttdkBjR/bVUhnCM
 wdWXiAhLXCRw==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="221938790"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="221938790"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:54:00 -0700
IronPort-SDR: BYVMo5AZWAzQldPTvUcDg6WjpJhAvSSDtSGf5H20BwxIBR0RCBvB4HURZMRcTPUQgak9IvY6Z3
 XJhp8lDfAqCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="342166923"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 04 Sep 2020 04:53:58 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Sep 2020 14:53:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 01/18] drm/dp: Dump downstream facing port caps
Date: Fri,  4 Sep 2020 14:53:37 +0300
Message-Id: <20200904115354.25336-2-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkl0
IGhlbHBzIHdoZW4gdGhlIGxvZ3MgaGF2ZSBhIGR1bXAgb2YgdGhlIERGUCBjYXBhYmlsaXRpZXMu
Cgp2MjogTW92ZSB0aGUgZHVtcGluZyB0byB0aGUgbmV3IGhlbHBlcgoKU2lnbmVkLW9mZi1ieTog
VmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vZHJtX2RwX2hlbHBlci5jIHwgNyArKysrKystCiAxIGZpbGUgY2hhbmdlZCwg
NiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9kcF9oZWxwZXIuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfaGVscGVyLmMKaW5k
ZXggMWU3YzYzODg3M2M4Li5jMjFiYmZjM2Q3MTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9kcm1fZHBfaGVscGVyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9oZWxwZXIuYwpA
QCAtNTQ1LDggKzU0NSwxMyBAQCBpbnQgZHJtX2RwX3JlYWRfZG93bnN0cmVhbV9pbmZvKHN0cnVj
dCBkcm1fZHBfYXV4ICphdXgsCiAJcmV0ID0gZHJtX2RwX2RwY2RfcmVhZChhdXgsIERQX0RPV05T
VFJFQU1fUE9SVF8wLCBkb3duc3RyZWFtX3BvcnRzLCBsZW4pOwogCWlmIChyZXQgPCAwKQogCQly
ZXR1cm4gcmV0OworCWlmIChyZXQgIT0gbGVuKQorCQlyZXR1cm4gLUVJTzsKIAotCXJldHVybiBy
ZXQgPT0gbGVuID8gMCA6IC1FSU87CisJRFJNX0RFQlVHX0tNUygiJXM6IERQQ0QgREZQOiAlKnBo
XG4iLAorCQkgICAgICBhdXgtPm5hbWUsIGxlbiwgZG93bnN0cmVhbV9wb3J0cyk7CisKKwlyZXR1
cm4gMDsKIH0KIEVYUE9SVF9TWU1CT0woZHJtX2RwX3JlYWRfZG93bnN0cmVhbV9pbmZvKTsKIAot
LSAKMi4yNi4yCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
