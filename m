Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6449C19DF97
	for <lists+dri-devel@lfdr.de>; Fri,  3 Apr 2020 22:40:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2AFE6EC8C;
	Fri,  3 Apr 2020 20:40:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D1FE6EC8C;
 Fri,  3 Apr 2020 20:40:45 +0000 (UTC)
IronPort-SDR: Q/UBHytw+wY/wA5ceQh8JGQAEWIIvT2hYxAnabUPZdabOog1/7t5BEqCArm+dkHIGnRCLdrzVq
 r3maycheTPQA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Apr 2020 13:40:44 -0700
IronPort-SDR: vE5GG5ldpsEo4c04JwOdr53HNoZMnK5SWDtYhRPccGXYAwwVvWhf3y0o9LfcTP+YHHOE/sk9Ii
 CVm3Dq8Td+BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,341,1580803200"; d="scan'208";a="242901242"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga008.fm.intel.com with SMTP; 03 Apr 2020 13:40:42 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 03 Apr 2020 23:40:37 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 07/17] drm: Make mode->flags u32
Date: Fri,  3 Apr 2020 23:39:58 +0300
Message-Id: <20200403204008.14864-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
References: <20200403204008.14864-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org, Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClRo
ZSBtb2RlIGZsYWdzIGFyZSBkaXJlY2x0eSBleHBvc2VkIGluIHRoZSB1YXBpIGFzIHUzMi4gVXNl
IHRoZQpzYW1lIHNpemUgdHlwZSB0byBzdG9yZSB0aGVtIGludGVybmFsbHkuCgpSZXZpZXdlZC1i
eTogRW1pbCBWZWxpa292IDxlbWlsLnZlbGlrb3ZAY29sbGFib3JhLmNvbT4KU2lnbmVkLW9mZi1i
eTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBp
bmNsdWRlL2RybS9kcm1fbW9kZXMuaCB8IDIgKy0KIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5o
IGIvaW5jbHVkZS9kcm0vZHJtX21vZGVzLmgKaW5kZXggZjQ1MDdiOTg3MDM4Li5kYTdkYjc0YTIx
NWUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2RybV9tb2Rlcy5oCisrKyBiL2luY2x1ZGUvZHJt
L2RybV9tb2Rlcy5oCkBAIC0zMjIsNyArMzIyLDcgQEAgc3RydWN0IGRybV9kaXNwbGF5X21vZGUg
ewogCSAqICAtIERSTV9NT0RFX0ZMQUdfM0RfU0lERV9CWV9TSURFX0hBTEY6IGZyYW1lIHNwbGl0
IGludG8gbGVmdCBhbmQKIAkgKiAgICByaWdodCBwYXJ0cy4KIAkgKi8KLQl1bnNpZ25lZCBpbnQg
ZmxhZ3M7CisJdTMyIGZsYWdzOwogCiAJLyoqCiAJICogQHdpZHRoX21tOgotLSAKMi4yNC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
