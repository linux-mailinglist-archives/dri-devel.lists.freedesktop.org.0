Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C46BC868
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 15:00:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD6D36EA28;
	Tue, 24 Sep 2019 13:00:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D95FD89286;
 Tue, 24 Sep 2019 13:00:06 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 06:00:06 -0700
X-IronPort-AV: E=Sophos;i="5.64,544,1559545200"; d="scan'208";a="340073708"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 24 Sep 2019 06:00:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 6/9] drm/msm: use drm_debug_enabled() to check for debug
 categories
Date: Tue, 24 Sep 2019 15:59:02 +0300
Message-Id: <c7142cdebb5f6fed527272b333cd6c43c0aa68ec.1569329774.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1569329774.git.jani.nikula@intel.com>
References: <cover.1569329774.git.jani.nikula@intel.com>
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
Cc: Sean Paul <sean@poorly.run>, jani.nikula@intel.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWxsb3cgYmV0dGVyIGFic3RyYWN0aW9uIG9mIHRoZSBkcm1fZGVidWcgZ2xvYmFsIHZhcmlhYmxl
IGluIHRoZQpmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCnYyOiBNb3ZlIHVubGlrZWx5
KCkgdG8gZHJtX2RlYnVnX2VuYWJsZWQoKQoKQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWls
LmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2VhbkBwb29ybHkucnVuPgpDYzogbGludXgtYXJtLW1zbUB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKUmV2aWV3
ZWQtYnk6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KU2lnbmVkLW9mZi1ieTogSmFu
aSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNt
L2Rpc3AvZHB1MS9kcHVfa21zLmggfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9k
aXNwL2RwdTEvZHB1X2ttcy5oIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2tt
cy5oCmluZGV4IDRjODg5YWFiZGFmOS4uOTU5ZDAzZTAwN2ZhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbXNtL2Rpc3AvZHB1MS9kcHVfa21zLmgKKysrIGIvZHJpdmVycy9ncHUvZHJtL21z
bS9kaXNwL2RwdTEvZHB1X2ttcy5oCkBAIC0zMSw3ICszMSw3IEBACiAgKi8KICNkZWZpbmUgRFBV
X0RFQlVHKGZtdCwgLi4uKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgIFwKIAlkbyB7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXAotCQlpZiAodW5saWtlbHkoZHJtX2RlYnVnICYgRFJNX1VU
X0tNUykpICAgICAgICAgICAgICAgICAgICAgIFwKKwkJaWYgKGRybV9kZWJ1Z19lbmFibGVkKERS
TV9VVF9LTVMpKSAgICAgICAgICAgICAgICAgICAgICAgICBcCiAJCQlEUk1fREVCVUcoZm10LCAj
I19fVkFfQVJHU19fKTsgXAogCQllbHNlICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIFwKIAkJCXByX2RlYnVnKGZtdCwgIyNfX1ZBX0FSR1NfXyk7
ICAgICAgICAgICAgICAgICAgICAgIFwKQEAgLTQzLDcgKzQzLDcgQEAKICAqLwogI2RlZmluZSBE
UFVfREVCVUdfRFJJVkVSKGZtdCwgLi4uKSAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgXAogCWRvIHsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcCi0JCWlmICh1bmxpa2VseShkcm1fZGVidWcgJiBEUk1f
VVRfRFJJVkVSKSkgICAgICAgICAgICAgICAgICAgXAorCQlpZiAoZHJtX2RlYnVnX2VuYWJsZWQo
RFJNX1VUX0RSSVZFUikpICAgICAgICAgICAgICAgICAgICAgIFwKIAkJCURSTV9FUlJPUihmbXQs
ICMjX19WQV9BUkdTX18pOyBcCiAJCWVsc2UgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgXAogCQkJcHJfZGVidWcoZm10LCAjI19fVkFfQVJHU19f
KTsgICAgICAgICAgICAgICAgICAgICAgXAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
