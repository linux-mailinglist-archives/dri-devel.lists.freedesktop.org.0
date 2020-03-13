Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F00D4184C49
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 17:21:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B58876EC0F;
	Fri, 13 Mar 2020 16:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43ADE6EC0D;
 Fri, 13 Mar 2020 16:21:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 13 Mar 2020 09:21:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,549,1574150400"; d="scan'208";a="278279980"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by fmsmga002.fm.intel.com with SMTP; 13 Mar 2020 09:21:03 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 13 Mar 2020 18:21:02 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/9] drm/edid: Swap some operands in for_each_displayid_db()
Date: Fri, 13 Mar 2020 18:20:47 +0200
Message-Id: <20200313162054.16009-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
References: <20200313162054.16009-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkEr
QiBvbiB0aGUgcHJldmlvdXMgbGluZSwgQitBIG9uIHRoZSBuZXh0IGxpbmUuIEJyYWluIGh1cnRz
LgoKU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fZGlzcGxheWlkLmggfCAyICstCiAxIGZpbGUg
Y2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2RybS9kcm1fZGlzcGxheWlkLmggYi9pbmNsdWRlL2RybS9kcm1fZGlzcGxheWlkLmgKaW5k
ZXggOWQzYjc0NWMzMTA3Li4yN2JkZDI3M2ZjNGUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvZHJtL2Ry
bV9kaXNwbGF5aWQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fZGlzcGxheWlkLmgKQEAgLTk3LDcg
Kzk3LDcgQEAgc3RydWN0IGRpc3BsYXlpZF9kZXRhaWxlZF90aW1pbmdfYmxvY2sgewogCSAgICAg
KGlkeCkgKyBzaXplb2Yoc3RydWN0IGRpc3BsYXlpZF9ibG9jaykgPD0gKGxlbmd0aCkgJiYgXAog
CSAgICAgKGlkeCkgKyBzaXplb2Yoc3RydWN0IGRpc3BsYXlpZF9ibG9jaykgKyAoYmxvY2spLT5u
dW1fYnl0ZXMgPD0gKGxlbmd0aCkgJiYgXAogCSAgICAgKGJsb2NrKS0+bnVtX2J5dGVzID4gMDsg
XAotCSAgICAgKGlkeCkgKz0gKGJsb2NrKS0+bnVtX2J5dGVzICsgc2l6ZW9mKHN0cnVjdCBkaXNw
bGF5aWRfYmxvY2spLCBcCisJICAgICAoaWR4KSArPSBzaXplb2Yoc3RydWN0IGRpc3BsYXlpZF9i
bG9jaykgKyAoYmxvY2spLT5udW1fYnl0ZXMsIFwKIAkgICAgIChibG9jaykgPSAoc3RydWN0IGRp
c3BsYXlpZF9ibG9jayAqKSYoZGlzcGxheWlkKVtpZHhdKQogCiAjZW5kaWYKLS0gCjIuMjQuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
