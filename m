Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2EA41558EA
	for <lists+dri-devel@lfdr.de>; Fri,  7 Feb 2020 15:00:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 719606FCB1;
	Fri,  7 Feb 2020 14:00:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 796E36FCB1;
 Fri,  7 Feb 2020 14:00:08 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 07 Feb 2020 06:00:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,413,1574150400"; d="scan'208";a="220802702"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga007.jf.intel.com with SMTP; 07 Feb 2020 06:00:05 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 07 Feb 2020 16:00:04 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 4/6] drm/imx: Remove the bogus possible_clones setup
Date: Fri,  7 Feb 2020 15:59:48 +0200
Message-Id: <20200207135950.6655-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
References: <20200207135950.6655-1-ville.syrjala@linux.intel.com>
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

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KCkl0
J3Mgbm90IGF0IGFsbCBjbGVhciB3aGF0IGNsb25pbmcgb3B0aW9ucyB0aGlzIGRyaXZlciBzdXBw
b3J0cy4KU28gbGV0J3MganVzdCBjbGVhciBwb3NzaWJsZV9jbG9uZXMgaW5zdGVhZCBvZiBzZXR0
aW5nIGl0IHRvIHNvbWUKYm9ndXMgdmFsdWUuCgpDYzogUGhpbGlwcCBaYWJlbCA8cC56YWJlbEBw
ZW5ndXRyb25peC5kZT4KU2lnbmVkLW9mZi1ieTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJq
YWxhQGxpbnV4LmludGVsLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vaW14L2lteC1kcm0tY29y
ZS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtZHJtLWNvcmUuYyBiL2RyaXZl
cnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMKaW5kZXggZGE4N2M3MGU0MTNiLi5hMGE3MDlk
ZmJhMzQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtZHJtLWNvcmUuYwpAQCAtMTQwLDcgKzE0MCw3IEBA
IGludCBpbXhfZHJtX2VuY29kZXJfcGFyc2Vfb2Yoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKIAll
bmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IGNydGNfbWFzazsKIAogCS8qIEZJWE1FOiB0aGlzIGlz
IHRoZSBtYXNrIG9mIG91dHB1dHMgd2hpY2ggY2FuIGNsb25lIHRoaXMgb3V0cHV0LiAqLwotCWVu
Y29kZXItPnBvc3NpYmxlX2Nsb25lcyA9IH4wOworCWVuY29kZXItPnBvc3NpYmxlX2Nsb25lcyA9
IDA7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjQuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVsCg==
