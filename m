Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 038F47289D
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jul 2019 08:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FCBA89FE8;
	Wed, 24 Jul 2019 06:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAB5E6E3A8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jul 2019 19:34:03 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 23 Jul 2019 12:34:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,300,1559545200"; d="scan'208";a="174642698"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 23 Jul 2019 12:34:01 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 1E22C81; Tue, 23 Jul 2019 22:34:00 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, dri-devel@lists.freedesktop.org
Subject: [PATCH v1] backlight: lm3630a: Switch to use
 fwnode_property_count_uXX()
Date: Tue, 23 Jul 2019 22:34:00 +0300
Message-Id: <20190723193400.68851-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 24 Jul 2019 06:54:25 +0000
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
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VXNlIHVzZSBmd25vZGVfcHJvcGVydHlfY291bnRfdVhYKCkgZGlyZWN0bHksIHRoYXQgbWFrZXMg
Y29kZSBuZWF0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBBbmR5IFNoZXZjaGVua28gPGFuZHJpeS5zaGV2
Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL3ZpZGVvL2JhY2tsaWdodC9sbTM2
MzBhX2JsLmMgfCAzICstLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwu
YyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwppbmRleCBiMDRiMzVkMDA3
YTIuLjJkOGU4MTkyZTRlMiAxMDA2NDQKLS0tIGEvZHJpdmVycy92aWRlby9iYWNrbGlnaHQvbG0z
NjMwYV9ibC5jCisrKyBiL2RyaXZlcnMvdmlkZW8vYmFja2xpZ2h0L2xtMzYzMGFfYmwuYwpAQCAt
Mzc3LDggKzM3Nyw3IEBAIHN0YXRpYyBpbnQgbG0zNjMwYV9wYXJzZV9sZWRfc291cmNlcyhzdHJ1
Y3QgZndub2RlX2hhbmRsZSAqbm9kZSwKIAl1MzIgc291cmNlc1tMTTM2MzBBX05VTV9TSU5LU107
CiAJaW50IHJldCwgbnVtX3NvdXJjZXMsIGk7CiAKLQludW1fc291cmNlcyA9IGZ3bm9kZV9wcm9w
ZXJ0eV9yZWFkX3UzMl9hcnJheShub2RlLCAibGVkLXNvdXJjZXMiLCBOVUxMLAotCQkJCQkJICAg
ICAwKTsKKwludW1fc291cmNlcyA9IGZ3bm9kZV9wcm9wZXJ0eV9jb3VudF91MzIobm9kZSwgImxl
ZC1zb3VyY2VzIik7CiAJaWYgKG51bV9zb3VyY2VzIDwgMCkKIAkJcmV0dXJuIGRlZmF1bHRfbGVk
X3NvdXJjZXM7CiAJZWxzZSBpZiAobnVtX3NvdXJjZXMgPiBBUlJBWV9TSVpFKHNvdXJjZXMpKQot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
