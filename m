Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EB2925FA0E
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 14:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCF366E440;
	Mon,  7 Sep 2020 12:00:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CA1D6E440;
 Mon,  7 Sep 2020 12:00:36 +0000 (UTC)
IronPort-SDR: 7t9mmFTWRFnueT1cQa1GQL2fGCp9WlGkWHcXviZHtPBqPFJx0iSUdij3txljjxkGpx50m9+vsa
 C1Nh3ZcCFZtg==
X-IronPort-AV: E=McAfee;i="6000,8403,9736"; a="219549879"
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="219549879"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2020 05:00:36 -0700
IronPort-SDR: Y8z61XIH/ImjDv4MhrXxud8ITVjjVlG9/OOsnRPUsqRdI+mq5/Uyym8AN4glfrfEcxrhB2bboj
 Njx6UcYqtXrw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,401,1592895600"; d="scan'208";a="284156715"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 07 Sep 2020 05:00:33 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Sep 2020 15:00:33 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/i915: Drop the
 drm_atomic_helper_calc_timestamping_constants() call
Date: Mon,  7 Sep 2020 15:00:26 +0300
Message-Id: <20200907120026.6360-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200907120026.6360-1-ville.syrjala@linux.intel.com>
References: <20200907120026.6360-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCldl
IHVwZGF0ZSB0aGUgdGltZXN0YW1waW5nIGNvbnN0YW50cyBwZXItY3J0YyBleHBsaWNpdGx5IGlu
CmludGVsX2NydGNfdXBkYXRlX2FjdGl2ZV90aW1pbmdzKCkuIEZ1cnRlcm1vcmUgdGhlIGhlbHBl
ciB3aWxsCnVzZSB1YXBpLmFkanVzdGVkX21vZGUgd2hlcmVhcyB3ZSB3YW50IGh3LmFkanVzdGVk
X21vZGUuIFRodXMKbGV0J3MgZHJvcCB0aGUgaGVscGVyIGNhbGwgYW4gcmVseSBvbiB3aGF0IHdl
IGFscmVhZHkgaGF2ZSBpbgppbnRlbF9jcnRjX3VwZGF0ZV9hY3RpdmVfdGltaW5ncygpLiBXZSBj
YW4gbm93IGFsc28gZHJvcCB0aGUKaHcuYWRqdXN0ZWRfbW9kZSAtPiB1YXBpLmFkanVzdGVkX21v
ZGUgY29weSBoYWNrIHRoYXQgd2FzIGFkZGVkCnRvIGtlZXAgdGhlIGhlbHBlciBmcm9tIGRlcml2
aW5nIHRoZSB0aW1lc3RhbXBpbmcgY29uc3RhbnRzIGZyb20KdGhlIHdyb25nIHRoaW5nLgoKU2ln
bmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNv
bT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYyB8IDcg
LS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5LmMgYi9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwppbmRleCAwMzU4NDBjZTM4MjUuLmE4NDZm
NDE0Yzc1OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9k
aXNwbGF5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9kaXNwbGF5
LmMKQEAgLTEzNDcyLDEyICsxMzQ3Miw2IEBAIGludGVsX21vZGVzZXRfcGlwZV9jb25maWcoc3Ry
dWN0IGludGVsX2NydGNfc3RhdGUgKnBpcGVfY29uZmlnKQogCQkgICAgImh3IG1heCBicHA6ICVp
LCBwaXBlIGJwcDogJWksIGRpdGhlcmluZzogJWlcbiIsCiAJCSAgICBiYXNlX2JwcCwgcGlwZV9j
b25maWctPnBpcGVfYnBwLCBwaXBlX2NvbmZpZy0+ZGl0aGVyKTsKIAotCS8qCi0JICogTWFrZSBk
cm1fY2FsY190aW1lc3RhbXBpbmdfY29uc3RhbnRzIGluCi0JICogZHJtX2F0b21pY19oZWxwZXJf
dXBkYXRlX2xlZ2FjeV9tb2Rlc2V0X3N0YXRlKCkgaGFwcHkKLQkgKi8KLQlwaXBlX2NvbmZpZy0+
dWFwaS5hZGp1c3RlZF9tb2RlID0gcGlwZV9jb25maWctPmh3LmFkanVzdGVkX21vZGU7Ci0KIAly
ZXR1cm4gMDsKIH0KIApAQCAtMTU1NzgsNyArMTU1NzIsNiBAQCBzdGF0aWMgdm9pZCBpbnRlbF9h
dG9taWNfY29tbWl0X3RhaWwoc3RydWN0IGludGVsX2F0b21pY19zdGF0ZSAqc3RhdGUpCiAKIAlp
ZiAoc3RhdGUtPm1vZGVzZXQpIHsKIAkJZHJtX2F0b21pY19oZWxwZXJfdXBkYXRlX2xlZ2FjeV9t
b2Rlc2V0X3N0YXRlKGRldiwgJnN0YXRlLT5iYXNlKTsKLQkJZHJtX2F0b21pY19oZWxwZXJfY2Fs
Y190aW1lc3RhbXBpbmdfY29uc3RhbnRzKCZzdGF0ZS0+YmFzZSk7CiAKIAkJaW50ZWxfc2V0X2Nk
Y2xrX3ByZV9wbGFuZV91cGRhdGUoc3RhdGUpOwogCi0tIAoyLjI2LjIKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QK
ZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
