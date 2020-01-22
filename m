Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F107F145902
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 16:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 241F76F5A5;
	Wed, 22 Jan 2020 15:50:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864A26F5A5;
 Wed, 22 Jan 2020 15:50:45 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 07:50:44 -0800
X-IronPort-AV: E=Sophos;i="5.70,350,1574150400"; d="scan'208";a="215943488"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jan 2020 07:50:42 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/2] drm/debugfs: also take per device driver features into
 account
Date: Wed, 22 Jan 2020 17:50:30 +0200
Message-Id: <20200122155030.29304-2-jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200122155030.29304-1-jani.nikula@intel.com>
References: <20200122155030.29304-1-jani.nikula@intel.com>
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
aW50byBhY2NvdW50IHdoZW4gcmVnaXN0ZXJpbmcKZGVidWdmcyBmaWxlcy4KCnYyOgotIHVzZSBk
cm1fY29yZV9jaGVja19hbGxfZmVhdHVyZXMoKQoKQ2M6IFZpbGxlIFN5cmrDpGzDpCA8dmlsbGUu
c3lyamFsYUBsaW51eC5pbnRlbC5jb20+CkNjOiBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1h
bm5Ac3VzZS5kZT4KU2lnbmVkLW9mZi1ieTogSmFuaSBOaWt1bGEgPGphbmkubmlrdWxhQGludGVs
LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyB8IDUgKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgNCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZGVidWdm
cy5jCmluZGV4IGVhYjBmMjY4N2NkNi4uMGM3MGI0YjIyYzhhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2RlYnVnZnMuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RlYnVnZnMu
YwpAQCAtMTgwLDEwICsxODAsNyBAQCBpbnQgZHJtX2RlYnVnZnNfY3JlYXRlX2ZpbGVzKGNvbnN0
IHN0cnVjdCBkcm1faW5mb19saXN0ICpmaWxlcywgaW50IGNvdW50LAogCWludCBpOwogCiAJZm9y
IChpID0gMDsgaSA8IGNvdW50OyBpKyspIHsKLQkJdTMyIGZlYXR1cmVzID0gZmlsZXNbaV0uZHJp
dmVyX2ZlYXR1cmVzOwotCi0JCWlmIChmZWF0dXJlcyAhPSAwICYmCi0JCSAgICAoZGV2LT5kcml2
ZXItPmRyaXZlcl9mZWF0dXJlcyAmIGZlYXR1cmVzKSAhPSBmZWF0dXJlcykKKwkJaWYgKCFkcm1f
Y29yZV9jaGVja19hbGxfZmVhdHVyZXMoZGV2LCBmaWxlc1tpXS5kcml2ZXJfZmVhdHVyZXMpKQog
CQkJY29udGludWU7CiAKIAkJdG1wID0ga21hbGxvYyhzaXplb2Yoc3RydWN0IGRybV9pbmZvX25v
ZGUpLCBHRlBfS0VSTkVMKTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVsCg==
