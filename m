Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF60FB07C8
	for <lists+dri-devel@lfdr.de>; Thu, 12 Sep 2019 06:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D6B6EC35;
	Thu, 12 Sep 2019 04:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1765F6E029;
 Thu, 12 Sep 2019 03:25:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 11 Sep 2019 20:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,489,1559545200"; d="scan'208";a="336444928"
Received: from helsinki.fi.intel.com ([10.237.66.159])
 by orsmga004.jf.intel.com with ESMTP; 11 Sep 2019 20:25:10 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 4/7] drm/i915/dp: Attach colorspace property
Date: Thu, 12 Sep 2019 06:24:52 +0300
Message-Id: <20190912032455.26095-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190912032455.26095-1-gwan-gyeong.mun@intel.com>
References: <20190912032455.26095-1-gwan-gyeong.mun@intel.com>
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
Cc: uma.shankar@intel.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SXQgYXR0YWNoZXMgdGhlIGNvbG9yc3BhY2UgY29ubmVjdG9yIHByb3BlcnR5IHRvIGEgRGlzcGxh
eVBvcnQgY29ubmVjdG9yLgpCYXNlZCBvbiBjb2xvcnNwYWNlIGNoYW5nZSwgbW9kZXNldCB3aWxs
IGJlIHRyaWdnZXJlZCB0byBzd2l0Y2ggdG8gYSBuZXcKY29sb3JzcGFjZS4KCkJhc2VkIG9uIGNv
bG9yc3BhY2UgcHJvcGVydHkgdmFsdWUgY3JlYXRlIGEgVlNDIFNEUCBwYWNrZXQgd2l0aCBhcHBy
b3ByaWF0ZQpjb2xvcnNwYWNlLiBUaGlzIHdvdWxkIGhlbHAgdG8gZW5hYmxlIHdpZGVyIGNvbG9y
IGdhbXV0IGxpa2UgQlQyMDIwIG9uIGEKc2luayBkZXZpY2UuCgpTaWduZWQtb2ZmLWJ5OiBHd2Fu
LWd5ZW9uZyBNdW4gPGd3YW4tZ3llb25nLm11bkBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBVbWEg
U2hhbmthciA8dW1hLnNoYW5rYXJAaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1
L2Rpc3BsYXkvaW50ZWxfZHAuYyB8IDIgKysKIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKaW5kZXggM2E4YWVmMWM2
MDM2Li43ZmUyMmIzNzQ3NGQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmMKQEAgLTY0NDgsNiArNjQ0OCw4IEBAIGludGVsX2RwX2FkZF9wcm9wZXJ0aWVzKHN0cnVjdCBp
bnRlbF9kcCAqaW50ZWxfZHAsIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0CiAJZWxzZSBp
ZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSA1KQogCQlkcm1fY29ubmVjdG9yX2F0dGFjaF9tYXhf
YnBjX3Byb3BlcnR5KGNvbm5lY3RvciwgNiwgMTIpOwogCisJaW50ZWxfYXR0YWNoX2NvbG9yc3Bh
Y2VfcHJvcGVydHkoY29ubmVjdG9yKTsKKwogCWlmIChpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHAp
KSB7CiAJCXUzMiBhbGxvd2VkX3NjYWxlcnM7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
