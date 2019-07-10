Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C640164682
	for <lists+dri-devel@lfdr.de>; Wed, 10 Jul 2019 14:51:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF436E0BD;
	Wed, 10 Jul 2019 12:51:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6683B6E0BD
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Jul 2019 12:51:47 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Jul 2019 05:51:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.63,474,1557212400"; d="scan'208";a="159755752"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga008.jf.intel.com with SMTP; 10 Jul 2019 05:51:44 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 10 Jul 2019 15:51:43 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/5] drm/fb-helper: Include prototype for
 drm_fb_helper_modinit()
Date: Wed, 10 Jul 2019 15:51:39 +0300
Message-Id: <20190710125143.9965-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClNw
YXJzZSBjb21wbGFpbnM6CmRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmM6MjQwOToxMjog
d2FybmluZzogc3ltYm9sICdkcm1fZmJfaGVscGVyX21vZGluaXQnIHdhcyBub3QgZGVjbGFyZWQu
IFNob3VsZCBpdCBiZSBzdGF0aWM/CgpJbmNsdWRlIHRoZSBoZWFkZXIgd2l0aCB0aGUgY29ycmVj
dCBwcm90b3R5cGUuCgpTaWduZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmph
bGFAbGludXguaW50ZWwuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMg
fCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBhL2RyaXZl
cnMvZ3B1L2RybS9kcm1fZmJfaGVscGVyLmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2ZiX2hlbHBl
ci5jCmluZGV4IGE3YmE1YjQ5MDJkNi4uYjc1YWU4NTU1YmFmIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2ZiX2hlbHBlci5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZmJfaGVs
cGVyLmMKQEAgLTQ2LDYgKzQ2LDcgQEAKICNpbmNsdWRlIDxkcm0vZHJtX3ByaW50Lmg+CiAjaW5j
bHVkZSA8ZHJtL2RybV92YmxhbmsuaD4KIAorI2luY2x1ZGUgImRybV9jcnRjX2hlbHBlcl9pbnRl
cm5hbC5oIgogI2luY2x1ZGUgImRybV9pbnRlcm5hbC5oIgogCiBzdGF0aWMgYm9vbCBkcm1fZmJk
ZXZfZW11bGF0aW9uID0gdHJ1ZTsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
