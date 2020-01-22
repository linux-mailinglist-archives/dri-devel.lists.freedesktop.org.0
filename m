Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B74C145766
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 15:03:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 944106F533;
	Wed, 22 Jan 2020 14:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3669F6F531;
 Wed, 22 Jan 2020 14:03:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 06:03:11 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="215915900"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 06:03:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/2] drm/debugfs: also take per device driver features into
 account
Date: Wed, 22 Jan 2020 16:02:59 +0200
Message-Id: <20200122140259.12086-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122140259.12086-1-jani.nikula@intel.com>
References: <20200122140259.12086-1-jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGRybV9jb3JlX2NoZWNrX2ZlYXR1cmUoKSB0byBlbnN1cmUgYm90aCB0aGUgZHJpdmVyIGZl
YXR1cmVzIGFuZCB0aGUKcGVyLWRldmljZSBkcml2ZXIgZmVhdHVyZXMgYXJlIHRha2VuIGludG8g
YWNjb3VudCB3aGVuIHJlZ2lzdGVyaW5nCmRlYnVnZnMgZmlsZXMuCgpSZXZpZXdlZC1ieTogVmls
bGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KU2lnbmVkLW9mZi1i
eTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9k
cm0vZHJtX2RlYnVnZnMuYyB8IDUgKy0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigr
KSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVn
ZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdmcy5jCmluZGV4IGVhYjBmMjY4N2NkNi4u
YWYzNTMxYmY1N2QzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYwpAQCAtMTgwLDEwICsxODAsNyBAQCBp
bnQgZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGNvbnN0IHN0cnVjdCBkcm1faW5mb19saXN0ICpm
aWxlcywgaW50IGNvdW50LAogCWludCBpOwogCiAJZm9yIChpID0gMDsgaSA8IGNvdW50OyBpKysp
IHsKLQkJdTMyIGZlYXR1cmVzID0gZmlsZXNbaV0uZHJpdmVyX2ZlYXR1cmVzOwotCi0JCWlmIChm
ZWF0dXJlcyAhPSAwICYmCi0JCSAgICAoZGV2LT5kcml2ZXItPmRyaXZlcl9mZWF0dXJlcyAmIGZl
YXR1cmVzKSAhPSBmZWF0dXJlcykKKwkJaWYgKCFkcm1fY29yZV9jaGVja19mZWF0dXJlKGRldiwg
ZmlsZXNbaV0uZHJpdmVyX2ZlYXR1cmVzKSkKIAkJCWNvbnRpbnVlOwogCiAJCXRtcCA9IGttYWxs
b2Moc2l6ZW9mKHN0cnVjdCBkcm1faW5mb19ub2RlKSwgR0ZQX0tFUk5FTCk7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZl
bCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbAo=
