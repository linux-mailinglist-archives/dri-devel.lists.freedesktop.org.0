Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 247646260B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Jul 2019 18:21:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72CB489FD9;
	Mon,  8 Jul 2019 16:21:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F54589FD1;
 Mon,  8 Jul 2019 16:21:19 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 08 Jul 2019 09:21:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,466,1557212400"; d="scan'208";a="159168959"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 08 Jul 2019 09:21:15 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Jul 2019 19:21:14 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 06/14] drm/imx: Remove the bogus possible_clones setup
Date: Mon,  8 Jul 2019 19:20:40 +0300
Message-Id: <20190708162048.4286-7-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
References: <20190708162048.4286-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
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
cnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMKaW5kZXggYmRlZmFhMTYzNWViLi5iZDY1MGIw
YzI3YjIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9pbXgvaW14LWRybS1jb3JlLmMKKysr
IGIvZHJpdmVycy9ncHUvZHJtL2lteC9pbXgtZHJtLWNvcmUuYwpAQCAtMTM2LDcgKzEzNiw3IEBA
IGludCBpbXhfZHJtX2VuY29kZXJfcGFyc2Vfb2Yoc3RydWN0IGRybV9kZXZpY2UgKmRybSwKIAll
bmNvZGVyLT5wb3NzaWJsZV9jcnRjcyA9IGNydGNfbWFzazsKIAogCS8qIEZJWE1FOiB0aGlzIGlz
IHRoZSBtYXNrIG9mIG91dHB1dHMgd2hpY2ggY2FuIGNsb25lIHRoaXMgb3V0cHV0LiAqLwotCWVu
Y29kZXItPnBvc3NpYmxlX2Nsb25lcyA9IH4wOworCWVuY29kZXItPnBvc3NpYmxlX2Nsb25lcyA9
IDA7CiAKIAlyZXR1cm4gMDsKIH0KLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
