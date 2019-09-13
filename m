Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CF7B1C9E
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2019 13:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E81B6EF34;
	Fri, 13 Sep 2019 11:52:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F25C36EF34;
 Fri, 13 Sep 2019 11:52:37 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:37 -0700
X-IronPort-AV: E=Sophos;i="5.64,492,1559545200"; d="scan'208";a="187796064"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Sep 2019 04:52:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 6/9] drm/msm: use drm_debug_enabled() to check for debug
 categories
Date: Fri, 13 Sep 2019 14:51:43 +0300
Message-Id: <85a41fccdfca75ef47c9704761c959b5d53c0504.1568375189.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1568375189.git.jani.nikula@intel.com>
References: <cover.1568375189.git.jani.nikula@intel.com>
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
IGluIHRoZQpmdXR1cmUuIE5vIGZ1bmN0aW9uYWwgY2hhbmdlcy4KCkNjOiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IGxp
bnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCkNjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0
b3Aub3JnClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxhIDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+
Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5oIHwgNCArKy0tCiAx
IGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuaCBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuaAppbmRleCA5ZTQwZjU1OWM1MWYuLjAwZTMzNTNm
OWFhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL2RwdTEvZHB1X2ttcy5o
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZGlzcC9kcHUxL2RwdV9rbXMuaApAQCAtMjksNyAr
MjksNyBAQAogICovCiAjZGVmaW5lIERQVV9ERUJVRyhmbXQsIC4uLikgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAJZG8geyAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKLQkJaWYgKHVu
bGlrZWx5KGRybV9kZWJ1ZyAmIERSTV9VVF9LTVMpKSAgICAgICAgICAgICAgICAgICAgICBcCisJ
CWlmICh1bmxpa2VseShkcm1fZGVidWdfZW5hYmxlZChEUk1fVVRfS01TKSkpICAgICAgICAgICAg
ICAgXAogCQkJRFJNX0RFQlVHKGZtdCwgIyNfX1ZBX0FSR1NfXyk7IFwKIAkJZWxzZSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBcCiAJCQlwcl9k
ZWJ1ZyhmbXQsICMjX19WQV9BUkdTX18pOyAgICAgICAgICAgICAgICAgICAgICBcCkBAIC00MSw3
ICs0MSw3IEBACiAgKi8KICNkZWZpbmUgRFBVX0RFQlVHX0RSSVZFUihmbXQsIC4uLikgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAlkbyB7ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXAotCQlpZiAo
dW5saWtlbHkoZHJtX2RlYnVnICYgRFJNX1VUX0RSSVZFUikpICAgICAgICAgICAgICAgICAgIFwK
KwkJaWYgKHVubGlrZWx5KGRybV9kZWJ1Z19lbmFibGVkKERSTV9VVF9EUklWRVIpKSkgICAgICAg
ICAgICBcCiAJCQlEUk1fRVJST1IoZm10LCAjI19fVkFfQVJHU19fKTsgXAogCQllbHNlICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIFwKIAkJCXBy
X2RlYnVnKGZtdCwgIyNfX1ZBX0FSR1NfXyk7ICAgICAgICAgICAgICAgICAgICAgIFwKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJp
LWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
