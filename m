Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 746882087B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2019 15:43:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F2AE8970E;
	Thu, 16 May 2019 13:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96885896D8;
 Thu, 16 May 2019 13:43:40 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 May 2019 06:43:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,476,1549958400"; d="scan'208";a="172354159"
Received: from linuxpresi1-desktop.iind.intel.com ([10.223.74.121])
 by fmsmga002.fm.intel.com with ESMTP; 16 May 2019 06:43:37 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [v11 09/12] drm/i915:Enabled Modeset when HDR Infoframe changes
Date: Thu, 16 May 2019 19:40:14 +0530
Message-Id: <1558015817-12025-10-git-send-email-uma.shankar@intel.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
References: <1558015817-12025-1-git-send-email-uma.shankar@intel.com>
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
Cc: dcastagna@chromium.org, jonas@kwiboo.se, emil.l.velikov@gmail.com,
 Uma Shankar <uma.shankar@intel.com>, seanpaul@chromium.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBwYXRjaCBlbmFibGVzIG1vZGVzZXQgd2hlbmV2ZXIgSERSIG1ldGFkYXRhCm5lZWRzIHRv
IGJlIHVwZGF0ZWQgdG8gc2luay4KCnYyOiBBZGRyZXNzZWQgU2hhc2hhbmsncyByZXZpZXcgY29t
bWVudHMuCgp2MzogQWRkZWQgU2hhc2hhbmsncyBSQi4KCnY0OiBBZGRyZXNzZWQgVmlsbGUncyBy
ZXZpZXcgY29tbWVudHMuCgp2NTogQWRkcmVzc2VkIFZpbGxlJ3MgcmV2aWV3IGNvbW1lbnRzLgoK
U2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVs
LmNvbT4KU2lnbmVkLW9mZi1ieTogVW1hIFNoYW5rYXIgPHVtYS5zaGFua2FyQGludGVsLmNvbT4K
UmV2aWV3ZWQtYnk6IFNoYXNoYW5rIFNoYXJtYSA8c2hhc2hhbmsuc2hhcm1hQGludGVsLmNvbT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9pbnRlbF9hdG9taWMuYyB8IDE0ICsrKysrKysrKysr
KystCiAxIGZpbGUgY2hhbmdlZCwgMTMgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQoKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2ludGVsX2F0b21pYy5jIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfYXRvbWljLmMKaW5kZXggNThiODA0OS4uNmI5ODVlOCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvaW50ZWxfYXRvbWljLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2k5MTUvaW50ZWxfYXRvbWljLmMKQEAgLTEwNSw2ICsxMDUsMTYgQEAgaW50IGludGVs
X2RpZ2l0YWxfY29ubmVjdG9yX2F0b21pY19zZXRfcHJvcGVydHkoc3RydWN0IGRybV9jb25uZWN0
b3IgKmNvbm5lY3RvciwKIAlyZXR1cm4gLUVJTlZBTDsKIH0KIAorc3RhdGljIGJvb2wgYmxvYl9l
cXVhbChjb25zdCBzdHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmEsCisJCSAgICAgICBjb25zdCBz
dHJ1Y3QgZHJtX3Byb3BlcnR5X2Jsb2IgKmIpCit7CisJaWYgKGEgJiYgYikKKwkJcmV0dXJuIGEt
Pmxlbmd0aCA9PSBiLT5sZW5ndGggJiYKKwkJCSFtZW1jbXAoYS0+ZGF0YSwgYi0+ZGF0YSwgYS0+
bGVuZ3RoKTsKKworCXJldHVybiAhYSA9PSAhYjsKK30KKwogaW50IGludGVsX2RpZ2l0YWxfY29u
bmVjdG9yX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2Nvbm5lY3RvciAqY29ubiwKIAkJCQkJIHN0
cnVjdCBkcm1fY29ubmVjdG9yX3N0YXRlICpuZXdfc3RhdGUpCiB7CkBAIC0xMzIsNyArMTQyLDkg
QEAgaW50IGludGVsX2RpZ2l0YWxfY29ubmVjdG9yX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX2Nv
bm5lY3RvciAqY29ubiwKIAkgICAgbmV3X2Nvbm5fc3RhdGUtPmJhc2UuY29sb3JzcGFjZSAhPSBv
bGRfY29ubl9zdGF0ZS0+YmFzZS5jb2xvcnNwYWNlIHx8CiAJICAgIG5ld19jb25uX3N0YXRlLT5i
YXNlLnBpY3R1cmVfYXNwZWN0X3JhdGlvICE9IG9sZF9jb25uX3N0YXRlLT5iYXNlLnBpY3R1cmVf
YXNwZWN0X3JhdGlvIHx8CiAJICAgIG5ld19jb25uX3N0YXRlLT5iYXNlLmNvbnRlbnRfdHlwZSAh
PSBvbGRfY29ubl9zdGF0ZS0+YmFzZS5jb250ZW50X3R5cGUgfHwKLQkgICAgbmV3X2Nvbm5fc3Rh
dGUtPmJhc2Uuc2NhbGluZ19tb2RlICE9IG9sZF9jb25uX3N0YXRlLT5iYXNlLnNjYWxpbmdfbW9k
ZSkKKwkgICAgbmV3X2Nvbm5fc3RhdGUtPmJhc2Uuc2NhbGluZ19tb2RlICE9IG9sZF9jb25uX3N0
YXRlLT5iYXNlLnNjYWxpbmdfbW9kZSB8fAorCSAgICAhYmxvYl9lcXVhbChuZXdfY29ubl9zdGF0
ZS0+YmFzZS5oZHJfb3V0cHV0X21ldGFkYXRhLAorCQkJb2xkX2Nvbm5fc3RhdGUtPmJhc2UuaGRy
X291dHB1dF9tZXRhZGF0YSkpCiAJCWNydGNfc3RhdGUtPm1vZGVfY2hhbmdlZCA9IHRydWU7CiAK
IAlyZXR1cm4gMDsKLS0gCjEuOS4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9kcmktZGV2ZWw=
