Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3322010B365
	for <lists+dri-devel@lfdr.de>; Wed, 27 Nov 2019 17:33:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4109E6E362;
	Wed, 27 Nov 2019 16:33:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5B56E357;
 Wed, 27 Nov 2019 16:33:18 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:17 -0800
X-IronPort-AV: E=Sophos;i="5.69,250,1571727600"; d="scan'208";a="292110496"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Nov 2019 08:33:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 07/13] video: omapfb: use const pointer for fb_ops
Date: Wed, 27 Nov 2019 18:32:03 +0200
Message-Id: <609dbe6eefdfd0138aa5d2d4ceeb58684811dc6e.1574871797.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1574871797.git.jani.nikula@intel.com>
References: <cover.1574871797.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGNvbnN0IGZvciBmYl9vcHMgdG8gbGV0IHVzIG1ha2UgdGhlIGluZm8tPmZib3BzIHBvaW50
ZXIgY29uc3QgaW4gdGhlCmZ1dHVyZS4KCkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcK
Q2M6IGxpbnV4LW9tYXBAdmdlci5rZXJuZWwub3JnClNpZ25lZC1vZmYtYnk6IEphbmkgTmlrdWxh
IDxqYW5pLm5pa3VsYUBpbnRlbC5jb20+Ci0tLQogZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29t
YXBmYl9tYWluLmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAvb21hcGZiX21h
aW4uYyBiL2RyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9vbWFwZmJfbWFpbi5jCmluZGV4IDcwMmNj
YTU5YmRhMS4uZThhMzA0Zjg0ZWE4IDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29t
YXAvb21hcGZiX21haW4uYworKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAvb21hcGZiX21h
aW4uYwpAQCAtMTA1Miw3ICsxMDUyLDcgQEAgc3RhdGljIGludCBvbWFwZmJfaW9jdGwoc3RydWN0
IGZiX2luZm8gKmZiaSwgdW5zaWduZWQgaW50IGNtZCwKIHsKIAlzdHJ1Y3Qgb21hcGZiX3BsYW5l
X3N0cnVjdCAqcGxhbmUgPSBmYmktPnBhcjsKIAlzdHJ1Y3Qgb21hcGZiX2RldmljZQkqZmJkZXYg
PSBwbGFuZS0+ZmJkZXY7Ci0Jc3RydWN0IGZiX29wcwkJKm9wcyA9IGZiaS0+ZmJvcHM7CisJY29u
c3Qgc3RydWN0IGZiX29wcyAqb3BzID0gZmJpLT5mYm9wczsKIAl1bmlvbiB7CiAJCXN0cnVjdCBv
bWFwZmJfdXBkYXRlX3dpbmRvdwl1cGRhdGVfd2luZG93OwogCQlzdHJ1Y3Qgb21hcGZiX3BsYW5l
X2luZm8JcGxhbmVfaW5mbzsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vZHJpLWRldmVs
