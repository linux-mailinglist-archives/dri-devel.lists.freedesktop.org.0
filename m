Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EA1DC2258
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2019 15:42:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 655B86E438;
	Mon, 30 Sep 2019 13:42:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B3C6E43A;
 Mon, 30 Sep 2019 13:42:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Sep 2019 06:42:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,567,1559545200"; d="scan'208";a="195326648"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga006.jf.intel.com with SMTP; 30 Sep 2019 06:42:25 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 30 Sep 2019 16:42:24 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/i915: Use drm_rect_init()
Date: Mon, 30 Sep 2019 16:42:14 +0300
Message-Id: <20190930134214.24702-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190930134214.24702-1-ville.syrjala@linux.intel.com>
References: <20190930134214.24702-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KClVz
ZSB0aGUgbmV3IGRybV9yZWN0X2luaXQoKSBoZWxwZXIgd2hlcmUgYXBwcm9wcmlhdGUuCgpTaWdu
ZWQtb2ZmLWJ5OiBWaWxsZSBTeXJqw6Rsw6QgPHZpbGxlLnN5cmphbGFAbGludXguaW50ZWwuY29t
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jIHwgMTAg
KystLS0tLS0tLQogZHJpdmVycy9ncHUvZHJtL2k5MTUvZGlzcGxheS9pbnRlbF9zcHJpdGUuYyAg
fCAgNiArKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rp
c3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfZGlzcGxheS5jCmlu
ZGV4IDdlMDMxYjc2Njk0YS4uM2RkZDhhOTQwYmZhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vaTkxNS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vaTkx
NS9kaXNwbGF5L2ludGVsX2Rpc3BsYXkuYwpAQCAtMjczOCwxMCArMjczOCw3IEBAIGludGVsX2Zp
bGxfZmJfaW5mbyhzdHJ1Y3QgZHJtX2k5MTVfcHJpdmF0ZSAqZGV2X3ByaXYsCiAJCQkJc2l6ZSsr
OwogCiAJCQkvKiByb3RhdGUgdGhlIHgveSBvZmZzZXRzIHRvIG1hdGNoIHRoZSBHVFQgdmlldyAq
LwotCQkJci54MSA9IHg7Ci0JCQlyLnkxID0geTsKLQkJCXIueDIgPSB4ICsgd2lkdGg7Ci0JCQly
LnkyID0geSArIGhlaWdodDsKKwkJCWRybV9yZWN0X2luaXQoJnIsIHgsIHksIHdpZHRoLCBoZWln
aHQpOwogCQkJZHJtX3JlY3Rfcm90YXRlKCZyLAogCQkJCQlyb3RfaW5mby0+cGxhbmVbaV0ud2lk
dGggKiB0aWxlX3dpZHRoLAogCQkJCQlyb3RfaW5mby0+cGxhbmVbaV0uaGVpZ2h0ICogdGlsZV9o
ZWlnaHQsCkBAIC0yODYzLDEwICsyODYwLDcgQEAgaW50ZWxfcGxhbmVfcmVtYXBfZ3R0KHN0cnVj
dCBpbnRlbF9wbGFuZV9zdGF0ZSAqcGxhbmVfc3RhdGUpCiAJCQlzdHJ1Y3QgZHJtX3JlY3QgcjsK
IAogCQkJLyogcm90YXRlIHRoZSB4L3kgb2Zmc2V0cyB0byBtYXRjaCB0aGUgR1RUIHZpZXcgKi8K
LQkJCXIueDEgPSB4OwotCQkJci55MSA9IHk7Ci0JCQlyLngyID0geCArIHdpZHRoOwotCQkJci55
MiA9IHkgKyBoZWlnaHQ7CisJCQlkcm1fcmVjdF9pbml0KCZyLCB4LCB5LCB3aWR0aCwgaGVpZ2h0
KTsKIAkJCWRybV9yZWN0X3JvdGF0ZSgmciwKIAkJCQkJaW5mby0+cGxhbmVbaV0ud2lkdGggKiB0
aWxlX3dpZHRoLAogCQkJCQlpbmZvLT5wbGFuZVtpXS5oZWlnaHQgKiB0aWxlX2hlaWdodCwKZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50ZWxfc3ByaXRlLmMgYi9k
cml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNwbGF5L2ludGVsX3Nwcml0ZS5jCmluZGV4IDNkNTZkYjMy
MjkxYi4uOGQ1ODU0ZDU0MDQ1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vaTkxNS9kaXNw
bGF5L2ludGVsX3Nwcml0ZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9pOTE1L2Rpc3BsYXkvaW50
ZWxfc3ByaXRlLmMKQEAgLTI4NywxMCArMjg3LDggQEAgaW50IGludGVsX3BsYW5lX2NoZWNrX3Ny
Y19jb29yZGluYXRlcyhzdHJ1Y3QgaW50ZWxfcGxhbmVfc3RhdGUgKnBsYW5lX3N0YXRlKQogCXNy
Y195ID0gc3JjLT55MSA+PiAxNjsKIAlzcmNfaCA9IGRybV9yZWN0X2hlaWdodChzcmMpID4+IDE2
OwogCi0Jc3JjLT54MSA9IHNyY194IDw8IDE2OwotCXNyYy0+eDIgPSAoc3JjX3ggKyBzcmNfdykg
PDwgMTY7Ci0Jc3JjLT55MSA9IHNyY195IDw8IDE2OwotCXNyYy0+eTIgPSAoc3JjX3kgKyBzcmNf
aCkgPDwgMTY7CisJZHJtX3JlY3RfaW5pdChzcmMsIHNyY194IDw8IDE2LCBzcmNfeSA8PCAxNiwK
KwkJICAgICAgc3JjX3cgPDwgMTYsIHNyY19oIDw8IDE2KTsKIAogCWlmICghZmItPmZvcm1hdC0+
aXNfeXV2KQogCQlyZXR1cm4gMDsKLS0gCjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vZHJpLWRldmVs
