Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 983FB25D7F2
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 13:54:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5929C6EB51;
	Fri,  4 Sep 2020 11:54:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 990DA6EB4F;
 Fri,  4 Sep 2020 11:54:07 +0000 (UTC)
IronPort-SDR: EV9qBG8ZKJX7ploPD0wtOHQypTrmUZX5OY4q4eVFaW0sG211ERGS/gaF2GJ8voY6EkKvzyLdKJ
 8CryK8/wN+OA==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137780839"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137780839"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:54:07 -0700
IronPort-SDR: WYHlKX4zu4wZA+bAz0Zm39OMkIDkYzSVseN2qACUC4LbbHxTQMo53uYswbbDHp6RqZCD+giMkM
 TFwagGmHjbCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="283038371"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga007.fm.intel.com with SMTP; 04 Sep 2020 04:54:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Sep 2020 14:54:04 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/18] drm/dp: Define protocol converter DPCD registers
Date: Fri,  4 Sep 2020 14:53:39 +0300
Message-Id: <20200904115354.25336-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
References: <20200904115354.25336-1-ville.syrjala@linux.intel.com>
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
bHVkZS9kcm0vZHJtX2RwX2hlbHBlci5oCmluZGV4IDVjNDUxOTVjZWQzMi4uMTdkMzJkNzYzMmI2
IDEwMDY0NAotLS0gYS9pbmNsdWRlL2RybS9kcm1fZHBfaGVscGVyLmgKKysrIGIvaW5jbHVkZS9k
cm0vZHJtX2RwX2hlbHBlci5oCkBAIC05ODQsNiArOTg0LDE2IEBACiAjZGVmaW5lIERQX0NFQ19U
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
ZWZpbmUgRFBfQVVYX0hEQ1BfQUtTVgkJMHg2ODAwNwotLSAKMi4yNi4yCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0
CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
