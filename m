Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A0CA64D3
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 11:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0838D8953E;
	Tue,  3 Sep 2019 09:12:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9512789598;
 Tue,  3 Sep 2019 09:12:56 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Sep 2019 02:12:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,462,1559545200"; d="scan'208";a="207021897"
Received: from helsinki.fi.intel.com ([10.237.66.149])
 by fmsmga004.fm.intel.com with ESMTP; 03 Sep 2019 02:12:52 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 4/7] drm/i915/dp: Attach colorspace property
Date: Tue,  3 Sep 2019 12:12:32 +0300
Message-Id: <20190903091235.32304-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
References: <20190903091235.32304-1-gwan-gyeong.mun@intel.com>
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
Yi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2RwLmMKaW5kZXggNmI3NTg3Yzcx
ZTQ5Li45ZmExMDdkNzIwZWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3Bs
YXkvaW50ZWxfZHAuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rw
LmMKQEAgLTY0NDUsNiArNjQ0NSw4IEBAIGludGVsX2RwX2FkZF9wcm9wZXJ0aWVzKHN0cnVjdCBp
bnRlbF9kcCAqaW50ZWxfZHAsIHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0CiAJZWxzZSBp
ZiAoSU5URUxfR0VOKGRldl9wcml2KSA+PSA1KQogCQlkcm1fY29ubmVjdG9yX2F0dGFjaF9tYXhf
YnBjX3Byb3BlcnR5KGNvbm5lY3RvciwgNiwgMTIpOwogCisJaW50ZWxfYXR0YWNoX2NvbG9yc3Bh
Y2VfcHJvcGVydHkoY29ubmVjdG9yKTsKKwogCWlmIChpbnRlbF9kcF9pc19lZHAoaW50ZWxfZHAp
KSB7CiAJCXUzMiBhbGxvd2VkX3NjYWxlcnM7CiAKLS0gCjIuMjMuMAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApk
cmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
