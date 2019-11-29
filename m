Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D14410D410
	for <lists+dri-devel@lfdr.de>; Fri, 29 Nov 2019 11:30:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B9F36E8BB;
	Fri, 29 Nov 2019 10:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB9806E8BB;
 Fri, 29 Nov 2019 10:30:44 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:44 -0800
X-IronPort-AV: E=Sophos;i="5.69,257,1571727600"; d="scan'208";a="292611315"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Nov 2019 02:30:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2 07/14] video: omapfb: use const pointer for fb_ops
Date: Fri, 29 Nov 2019 12:29:37 +0200
Message-Id: <dfa4376e219ffeef9175993eaff91b5fe7ecccab.1575022735.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575022735.git.jani.nikula@intel.com>
References: <cover.1575022735.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Daniel Vetter <daniel.vetter@ffwll.ch>,
 intel-gfx@lists.freedesktop.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGNvbnN0IGZvciBmYl9vcHMgdG8gbGV0IHVzIG1ha2UgdGhlIGluZm8tPmZib3BzIHBvaW50
ZXIgY29uc3QgaW4gdGhlCmZ1dHVyZS4KCkNjOiBsaW51eC1mYmRldkB2Z2VyLmtlcm5lbC5vcmcK
Q2M6IGxpbnV4LW9tYXBAdmdlci5rZXJuZWwub3JnClJldmlld2VkLWJ5OiBEYW5pZWwgVmV0dGVy
IDxkYW5pZWwudmV0dGVyQGZmd2xsLmNoPgpTaWduZWQtb2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFu
aS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvdmlkZW8vZmJkZXYvb21hcC9vbWFwZmJf
bWFpbi5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmMg
Yi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L29tYXAvb21hcGZiX21haW4uYwppbmRleCA3MDJjY2E1OWJk
YTEuLmU4YTMwNGY4NGVhOCAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29t
YXBmYl9tYWluLmMKKysrIGIvZHJpdmVycy92aWRlby9mYmRldi9vbWFwL29tYXBmYl9tYWluLmMK
QEAgLTEwNTIsNyArMTA1Miw3IEBAIHN0YXRpYyBpbnQgb21hcGZiX2lvY3RsKHN0cnVjdCBmYl9p
bmZvICpmYmksIHVuc2lnbmVkIGludCBjbWQsCiB7CiAJc3RydWN0IG9tYXBmYl9wbGFuZV9zdHJ1
Y3QgKnBsYW5lID0gZmJpLT5wYXI7CiAJc3RydWN0IG9tYXBmYl9kZXZpY2UJKmZiZGV2ID0gcGxh
bmUtPmZiZGV2OwotCXN0cnVjdCBmYl9vcHMJCSpvcHMgPSBmYmktPmZib3BzOworCWNvbnN0IHN0
cnVjdCBmYl9vcHMgKm9wcyA9IGZiaS0+ZmJvcHM7CiAJdW5pb24gewogCQlzdHJ1Y3Qgb21hcGZi
X3VwZGF0ZV93aW5kb3cJdXBkYXRlX3dpbmRvdzsKIAkJc3RydWN0IG9tYXBmYl9wbGFuZV9pbmZv
CXBsYW5lX2luZm87Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2RyaS1kZXZlbA==
