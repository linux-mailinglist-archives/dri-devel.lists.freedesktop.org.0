Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A70D64A5
	for <lists+dri-devel@lfdr.de>; Mon, 14 Oct 2019 16:04:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8130D895C4;
	Mon, 14 Oct 2019 14:04:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC266E2E8
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Oct 2019 14:04:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 76F9AAFE8;
 Mon, 14 Oct 2019 14:04:20 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: airlied@linux.ie, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, sean@poorly.run, b.zolnierkie@samsung.com,
 ajax@redhat.com, ville.syrjala@linux.intel.com, malat@debian.org,
 michel@daenzer.net
Subject: [PATCH v2 02/15] fbdev: Export FBPIXMAPSIZE
Date: Mon, 14 Oct 2019 16:04:03 +0200
Message-Id: <20191014140416.28517-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20191014140416.28517-1-tzimmermann@suse.de>
References: <20191014140416.28517-1-tzimmermann@suse.de>
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
Cc: gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 corbet@lwn.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhpcyBjb25zdGFudCBpcyByZXF1aXJlZCBieSBEUk0ncyBmYmRldiBjb252ZXJzaW9uIGhlbHBl
cnMuIERlZmluZSBpdCBpbgpmYmRldidzIHB1YmxpYyBoZWFkZXIgZmlsZS4KClNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPgotLS0KIGRyaXZlcnMv
dmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jIHwgMiAtLQogaW5jbHVkZS9saW51eC9mYi5oICAgICAg
ICAgICAgICAgfCAyICsrCiAyIGZpbGVzIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYyBi
L2RyaXZlcnMvdmlkZW8vZmJkZXYvY29yZS9mYm1lbS5jCmluZGV4IGU4MjhmY2NjY2U0MC4uZjAy
Mzc3ZTk1OWRjIDEwMDY0NAotLS0gYS9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwor
KysgYi9kcml2ZXJzL3ZpZGVvL2ZiZGV2L2NvcmUvZmJtZW0uYwpAQCAtNDMsOCArNDMsNiBAQAog
ICAgICAqICBGcmFtZSBidWZmZXIgZGV2aWNlIGluaXRpYWxpemF0aW9uIGFuZCBzZXR1cCByb3V0
aW5lcwogICAgICAqLwogCi0jZGVmaW5lIEZCUElYTUFQU0laRQkoMTAyNCAqIDgpCi0KIHN0YXRp
YyBERUZJTkVfTVVURVgocmVnaXN0cmF0aW9uX2xvY2spOwogCiBzdHJ1Y3QgZmJfaW5mbyAqcmVn
aXN0ZXJlZF9mYltGQl9NQVhdIF9fcmVhZF9tb3N0bHk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L2ZiLmggYi9pbmNsdWRlL2xpbnV4L2ZiLmgKaW5kZXggMzcyZjFmNmFlNDJlLi5lMTdkM2Ux
ZDg2YWQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvZmIuaAorKysgYi9pbmNsdWRlL2xpbnV4
L2ZiLmgKQEAgLTE5OSw2ICsxOTksOCBAQCBzdHJ1Y3QgZmJfcGl4bWFwIHsKIAl2b2lkICgqcmVh
ZGlvKSAoc3RydWN0IGZiX2luZm8gKmluZm8sIHZvaWQgKmRzdCwgdm9pZCBfX2lvbWVtICpzcmMs
IHVuc2lnbmVkIGludCBzaXplKTsKIH07CiAKKyNkZWZpbmUgRkJQSVhNQVBTSVpFCSgxMDI0ICog
OCkKKwogI2lmZGVmIENPTkZJR19GQl9ERUZFUlJFRF9JTwogc3RydWN0IGZiX2RlZmVycmVkX2lv
IHsKIAkvKiBkZWxheSBiZXR3ZWVuIG1rd3JpdGUgYW5kIGRlZmVycmVkIGhhbmRsZXIgKi8KLS0g
CjIuMjMuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
ZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
