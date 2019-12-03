Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6C6E110294
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2019 17:39:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75FBB6E9FD;
	Tue,  3 Dec 2019 16:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A6236E9FD;
 Tue,  3 Dec 2019 16:39:52 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:42 -0800
X-IronPort-AV: E=Sophos;i="5.69,273,1571727600"; d="scan'208";a="213485466"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Dec 2019 08:39:40 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v3 07/12] video: fbdev: intelfb: use const pointer for fb_ops
Date: Tue,  3 Dec 2019 18:38:49 +0200
Message-Id: <171c573bc2977a6ec374753ac7bb03a3523ca2b7.1575390740.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1575390740.git.jani.nikula@intel.com>
References: <cover.1575390740.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIGNvbnN0IGZvciBmYl9vcHMgdG8gbGV0IHVzIG1ha2UgdGhlIGZib3BzIHN0cnVjdCBjb25z
dCBpbiB0aGUKZnV0dXJlLgoKQ2M6IGxpbnV4LWZiZGV2QHZnZXIua2VybmVsLm9yZwpTaWduZWQt
b2ZmLWJ5OiBKYW5pIE5pa3VsYSA8amFuaS5uaWt1bGFAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMv
dmlkZW8vZmJkZXYvaW50ZWxmYi9pbnRlbGZiLmggfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2Zi
ZGV2L2ludGVsZmIvaW50ZWxmYi5oIGIvZHJpdmVycy92aWRlby9mYmRldi9pbnRlbGZiL2ludGVs
ZmIuaAppbmRleCBiNTRkYjA1ZjAyOGQuLjVkZTcwMzkwMmEyMSAxMDA2NDQKLS0tIGEvZHJpdmVy
cy92aWRlby9mYmRldi9pbnRlbGZiL2ludGVsZmIuaAorKysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2
L2ludGVsZmIvaW50ZWxmYi5oCkBAIC0yNzMsNyArMjczLDcgQEAgc3RydWN0IGludGVsZmJfdnN5
bmMgewogCiBzdHJ1Y3QgaW50ZWxmYl9pbmZvIHsKIAlzdHJ1Y3QgZmJfaW5mbyAqaW5mbzsKLQlz
dHJ1Y3QgZmJfb3BzICAqZmJvcHM7CisJY29uc3Qgc3RydWN0IGZiX29wcyAqZmJvcHM7CiAJc3Ry
dWN0IHBjaV9kZXYgKnBkZXY7CiAKIAlzdHJ1Y3QgaW50ZWxmYl9od3N0YXRlIHNhdmVfc3RhdGU7
Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZl
bA==
