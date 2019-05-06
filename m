Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78AC0147CE
	for <lists+dri-devel@lfdr.de>; Mon,  6 May 2019 11:50:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E17989219;
	Mon,  6 May 2019 09:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83FB089219
 for <dri-devel@lists.freedesktop.org>; Mon,  6 May 2019 09:50:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 06 May 2019 02:50:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,437,1549958400"; d="scan'208";a="171180538"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.150])
 by fmsmga001.fm.intel.com with ESMTP; 06 May 2019 02:50:46 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/edid: drmP.h include removal
Date: Mon,  6 May 2019 12:52:48 +0300
Message-Id: <20190506095248.20874-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190506095248.20874-1-jani.nikula@intel.com>
References: <20190506095248.20874-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Q29udGludWUgdG8gZ2V0IHJpZCBvZiBkcm1QLmguIEFkZCBtaW5pbWFsIGluY2x1ZGVzIHRvIGJ1
aWxkLiBTb3J0CmluY2x1ZGVzIHdoaWxlIGF0IGl0LgoKU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1
bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YyAgICAgIHwgMTEgKysrKysrKy0tLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZWRpZF9sb2FkLmMg
fCAgNyArKysrKy0tCiAyIGZpbGVzIGNoYW5nZWQsIDEyIGluc2VydGlvbnMoKyksIDYgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkLmMgYi9kcml2ZXJz
L2dwdS9kcm0vZHJtX2VkaWQuYwppbmRleCAyYzIyZWE0Li5mMTYzMmNiIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWQu
YwpAQCAtMjcsMTYgKzI3LDE5IEBACiAgKiBGUk9NLCBPVVQgT0YgT1IgSU4gQ09OTkVDVElPTiBX
SVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSCiAgKiBERUFMSU5HUyBJTiBUSEUg
U09GVFdBUkUuCiAgKi8KLSNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KLSNpbmNsdWRlIDxsaW51
eC9zbGFiLmg+CisKICNpbmNsdWRlIDxsaW51eC9oZG1pLmg+CiAjaW5jbHVkZSA8bGludXgvaTJj
Lmg+CisjaW5jbHVkZSA8bGludXgva2VybmVsLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxlLmg+
CisjaW5jbHVkZSA8bGludXgvc2xhYi5oPgogI2luY2x1ZGUgPGxpbnV4L3ZnYV9zd2l0Y2hlcm9v
Lmg+Ci0jaW5jbHVkZSA8ZHJtL2RybVAuaD4KKworI2luY2x1ZGUgPGRybS9kcm1fZGlzcGxheWlk
Lmg+CisjaW5jbHVkZSA8ZHJtL2RybV9kcnYuaD4KICNpbmNsdWRlIDxkcm0vZHJtX2VkaWQuaD4K
ICNpbmNsdWRlIDxkcm0vZHJtX2VuY29kZXIuaD4KLSNpbmNsdWRlIDxkcm0vZHJtX2Rpc3BsYXlp
ZC5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KICNpbmNsdWRlIDxkcm0vZHJtX3NjZGNf
aGVscGVyLmg+CiAKICNpbmNsdWRlICJkcm1fY3J0Y19pbnRlcm5hbC5oIgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL2RybV9lZGlkX2xvYWQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZWRp
ZF9sb2FkLmMKaW5kZXggYTQ5MTUwOS4uMThkNTJkYyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2RybV9lZGlkX2xvYWQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2VkaWRfbG9hZC5j
CkBAIC0xOSwxMiArMTksMTUgQEAKICAgIEZvdW5kYXRpb24sIEluYy4sIDUxIEZyYW5rbGluIFN0
LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNBLgogKi8KIAotI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgogI2luY2x1ZGUgPGxpbnV4L2Zpcm13YXJlLmg+Ci0jaW5jbHVk
ZSA8ZHJtL2RybVAuaD4KKyNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4KKyNpbmNsdWRlIDxsaW51
eC9wbGF0Zm9ybV9kZXZpY2UuaD4KKwogI2luY2x1ZGUgPGRybS9kcm1fY3J0Yy5oPgogI2luY2x1
ZGUgPGRybS9kcm1fY3J0Y19oZWxwZXIuaD4KKyNpbmNsdWRlIDxkcm0vZHJtX2Rydi5oPgogI2lu
Y2x1ZGUgPGRybS9kcm1fZWRpZC5oPgorI2luY2x1ZGUgPGRybS9kcm1fcHJpbnQuaD4KIAogc3Rh
dGljIGNoYXIgZWRpZF9maXJtd2FyZVtQQVRIX01BWF07CiBtb2R1bGVfcGFyYW1fc3RyaW5nKGVk
aWRfZmlybXdhcmUsIGVkaWRfZmlybXdhcmUsIHNpemVvZihlZGlkX2Zpcm13YXJlKSwgMDY0NCk7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
