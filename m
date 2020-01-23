Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 444C514685D
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jan 2020 13:48:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85A406FC73;
	Thu, 23 Jan 2020 12:48:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5486FC73;
 Thu, 23 Jan 2020 12:48:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 04:48:17 -0800
X-IronPort-AV: E=Sophos;i="5.70,353,1574150400"; d="scan'208";a="375207676"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jan 2020 04:48:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/debugfs: also take per device driver features into
 account
Date: Thu, 23 Jan 2020 14:48:01 +0200
Message-Id: <20200123124801.14958-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200123124801.14958-1-jani.nikula@intel.com>
References: <20200123124801.14958-1-jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRybV9jb3JlX2NoZWNrX2FsbF9mZWF0dXJlcygpIHRvIGVuc3VyZSBib3RoIHRoZSBkcml2
ZXIgZmVhdHVyZXMgYW5kCnRoZSBwZXItZGV2aWNlIGRyaXZlciBmZWF0dXJlcyBhcmUgdGFrZW4g
aW50byBhY2NvdW50IHdoZW4gcmVnaXN0ZXJpbmcKZGVidWdmcyBmaWxlcy4KCnYzOgotIGZpbGVz
W2ldLmRyaXZlcl9mZWF0dXJlcyA9PSAwIGFjdHVhbGx5IG1lYW5zICJkb24ndCBjYXJlIgoKdjI6
Ci0gdXNlIGRybV9jb3JlX2NoZWNrX2FsbF9mZWF0dXJlcygpCgpDYzogVmlsbGUgU3lyasOkbMOk
IDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IFRob21hcyBaaW1tZXJtYW5uIDx0
emltbWVybWFubkBzdXNlLmRlPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1
bGFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jIHwgMyArLS0K
IDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1f
ZGVidWdmcy5jCmluZGV4IGVhYjBmMjY4N2NkNi4uNGU2NzNkMzE4NTAzIDEwMDY0NAotLS0gYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2Rl
YnVnZnMuYwpAQCAtMTgyLDggKzE4Miw3IEBAIGludCBkcm1fZGVidWdmc19jcmVhdGVfZmlsZXMo
Y29uc3Qgc3RydWN0IGRybV9pbmZvX2xpc3QgKmZpbGVzLCBpbnQgY291bnQsCiAJZm9yIChpID0g
MDsgaSA8IGNvdW50OyBpKyspIHsKIAkJdTMyIGZlYXR1cmVzID0gZmlsZXNbaV0uZHJpdmVyX2Zl
YXR1cmVzOwogCi0JCWlmIChmZWF0dXJlcyAhPSAwICYmCi0JCSAgICAoZGV2LT5kcml2ZXItPmRy
aXZlcl9mZWF0dXJlcyAmIGZlYXR1cmVzKSAhPSBmZWF0dXJlcykKKwkJaWYgKGZlYXR1cmVzICYm
ICFkcm1fY29yZV9jaGVja19hbGxfZmVhdHVyZXMoZGV2LCBmZWF0dXJlcykpCiAJCQljb250aW51
ZTsKIAogCQl0bXAgPSBrbWFsbG9jKHNpemVvZihzdHJ1Y3QgZHJtX2luZm9fbm9kZSksIEdGUF9L
RVJORUwpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWwK
