Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A258615095B
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2020 16:14:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 083DD6EC27;
	Mon,  3 Feb 2020 15:14:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AAD86EC2F;
 Mon,  3 Feb 2020 15:14:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 03 Feb 2020 07:14:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,398,1574150400"; d="scan'208";a="248909610"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga002.jf.intel.com with SMTP; 03 Feb 2020 07:14:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 03 Feb 2020 17:14:04 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/26] drm/dp: Define protocol converter DPCD registers
Date: Mon,  3 Feb 2020 17:13:24 +0200
Message-Id: <20200203151343.14378-8-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
References: <20200203151343.14378-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkRQ
IDEuMyBhbmQgMS40IGludHJvZHVjZWQgc29tZSBuZXcgcmVnaXN0ZXJzIGZvciBEUC0+SERNSSBw
cm90b2NvbApjb252ZXJ0ZXJzLiBEZWZpbmUgdGhvc2UuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBT
eXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29tPgotLS0KIGluY2x1ZGUvZHJt
L2RybV9kcF9oZWxwZXIuaCB8IDEwICsrKysrKysrKysKIDEgZmlsZSBjaGFuZ2VkLCAxMCBpbnNl
cnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oIGIvaW5j
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4IDI2MmZhZjllNWU5NC4uZmFmMDVjZGE1MDQz
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oCkBAIC05NzQsNiArOTc0LDE2IEBACiAjZGVmaW5lIERQX0NFQ19U
WF9NRVNTQUdFX0JVRkZFUiAgICAgICAgICAgICAgIDB4MzAyMAogI2RlZmluZSBEUF9DRUNfTUVT
U0FHRV9CVUZGRVJfTEVOR1RIICAgICAgICAgICAgIDB4MTAKIAorI2RlZmluZSBEUF9QUk9UT0NP
TF9DT05WRVJURVJfQ09OVFJPTF8wCQkweDMwNTAgLyogRFAgMS4zICovCisjIGRlZmluZSBEUF9I
RE1JX0RWSV9PVVRQVVRfQ09ORklHCQkoMSA8PCAwKSAvKiBEUCAxLjMgKi8KKyNkZWZpbmUgRFBf
UFJPVE9DT0xfQ09OVkVSVEVSX0NPTlRST0xfMQkJMHgzMDUxIC8qIERQIDEuMyAqLworIyBkZWZp
bmUgRFBfQ09OVkVSU0lPTl9UT19ZQ0JDUjQyMF9FTkFCTEUJKDEgPDwgMCkgLyogRFAgMS4zICov
CisjIGRlZmluZSBEUF9IRE1JX0VESURfUFJPQ0VTU0lOR19ESVNBQkxFCSgxIDw8IDEpIC8qIERQ
IDEuNCAqLworIyBkZWZpbmUgRFBfSERNSV9BVVRPTk9NT1VTX1NDUkFNQkxJTkdfRElTQUJMRQko
MSA8PCAyKSAvKiBEUCAxLjQgKi8KKyMgZGVmaW5lIERQX0hETUlfRk9SQ0VfU0NSQU1CTElORwkJ
KDEgPDwgMykgLyogRFAgMS40ICovCisjZGVmaW5lIERQX1BST1RPQ09MX0NPTlZFUlRFUl9DT05U
Uk9MXzIJCTB4MzA1MiAvKiBEUCAxLjMgKi8KKyMgZGVmaW5lIERQX0NPTlZFUlNJT05fVE9fWUNC
Q1I0MjJfRU5BQkxFCSgxIDw8IDApIC8qIERQIDEuMyAqLworCiAjZGVmaW5lIERQX0FVWF9IRENQ
X0JLU1YJCTB4NjgwMDAKICNkZWZpbmUgRFBfQVVYX0hEQ1BfUklfUFJJTUUJCTB4NjgwMDUKICNk
ZWZpbmUgRFBfQVVYX0hEQ1BfQUtTVgkJMHg2ODAwNwotLSAKMi4yNC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
