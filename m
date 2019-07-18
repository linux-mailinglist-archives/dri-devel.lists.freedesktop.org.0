Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6F326C46C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:44:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69CAC6E2C8;
	Thu, 18 Jul 2019 01:44:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A5E56E2C8
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 01:44:17 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D047130821AE;
 Thu, 18 Jul 2019 01:44:16 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5342F19C67;
 Thu, 18 Jul 2019 01:44:13 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 04/26] drm/print: Add drm_err_printer()
Date: Wed, 17 Jul 2019 21:42:27 -0400
Message-Id: <20190718014329.8107-5-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.47]); Thu, 18 Jul 2019 01:44:16 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Juston Li <juston.li@intel.com>, Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QSBzaW1wbGUgY29udmllbmVuY2UgZnVuY3Rpb24gdGhhdCByZXR1cm5zIGEgZHJtX3ByaW50ZXIg
d2hpY2ggcHJpbnRzCnVzaW5nIHByX2VycigpCgpDYzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50
ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRlYWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3ly
asOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4LmludGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5k
IDxod2VudGxhbkBhbWQuY29tPgpTaWduZWQtb2ZmLWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRo
YXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYyB8ICA2ICsrKysrKwogaW5j
bHVkZS9kcm0vZHJtX3ByaW50LmggICAgIHwgMTcgKysrKysrKysrKysrKysrKysKIDIgZmlsZXMg
Y2hhbmdlZCwgMjMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fcHJpbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwppbmRleCBhMTdjOGExNGRi
YTQuLjYxMTJiZTM1ODc2OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2RybV9wcmludC5j
CisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwpAQCAtMTQ3LDYgKzE0NywxMiBAQCB2
b2lkIF9fZHJtX3ByaW50Zm5fZGVidWcoc3RydWN0IGRybV9wcmludGVyICpwLCBzdHJ1Y3QgdmFf
Zm9ybWF0ICp2YWYpCiB9CiBFWFBPUlRfU1lNQk9MKF9fZHJtX3ByaW50Zm5fZGVidWcpOwogCit2
b2lkIF9fZHJtX3ByaW50Zm5fZXJyKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgc3RydWN0IHZhX2Zv
cm1hdCAqdmFmKQoreworCXByX2VycigiJXMgJXBWIiwgcC0+cHJlZml4LCB2YWYpOworfQorRVhQ
T1JUX1NZTUJPTChfX2RybV9wcmludGZuX2Vycik7CisKIC8qKgogICogZHJtX3B1dHMgLSBwcmlu
dCBhIGNvbnN0IHN0cmluZyB0byBhICZkcm1fcHJpbnRlciBzdHJlYW0KICAqIEBwOiB0aGUgJmRy
bSBwcmludGVyCmRpZmYgLS1naXQgYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaCBiL2luY2x1ZGUv
ZHJtL2RybV9wcmludC5oCmluZGV4IGE1ZDZmMmYzZTQzMC4uMTEyMTY1ZDMxOTVkIDEwMDY0NAot
LS0gYS9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAorKysgYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQu
aApAQCAtODMsNiArODMsNyBAQCB2b2lkIF9fZHJtX3ByaW50Zm5fc2VxX2ZpbGUoc3RydWN0IGRy
bV9wcmludGVyICpwLCBzdHJ1Y3QgdmFfZm9ybWF0ICp2YWYpOwogdm9pZCBfX2RybV9wdXRzX3Nl
cV9maWxlKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgY29uc3QgY2hhciAqc3RyKTsKIHZvaWQgX19k
cm1fcHJpbnRmbl9pbmZvKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgc3RydWN0IHZhX2Zvcm1hdCAq
dmFmKTsKIHZvaWQgX19kcm1fcHJpbnRmbl9kZWJ1ZyhzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIHN0
cnVjdCB2YV9mb3JtYXQgKnZhZik7Cit2b2lkIF9fZHJtX3ByaW50Zm5fZXJyKHN0cnVjdCBkcm1f
cHJpbnRlciAqcCwgc3RydWN0IHZhX2Zvcm1hdCAqdmFmKTsKIAogX19wcmludGYoMiwgMykKIHZv
aWQgZHJtX3ByaW50ZihzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIGNvbnN0IGNoYXIgKmYsIC4uLik7
CkBAIC0yMjcsNiArMjI4LDIyIEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IGRybV9wcmludGVyIGRy
bV9kZWJ1Z19wcmludGVyKGNvbnN0IGNoYXIgKnByZWZpeCkKIAlyZXR1cm4gcDsKIH0KIAorLyoq
CisgKiBkcm1fZXJyX3ByaW50ZXIgLSBjb25zdHJ1Y3QgYSAmZHJtX3ByaW50ZXIgdGhhdCBvdXRw
dXRzIHRvIHByX2VycigpCisgKiBAcHJlZml4OiBkZWJ1ZyBvdXRwdXQgcHJlZml4CisgKgorICog
UkVUVVJOUzoKKyAqIFRoZSAmZHJtX3ByaW50ZXIgb2JqZWN0CisgKi8KK3N0YXRpYyBpbmxpbmUg
c3RydWN0IGRybV9wcmludGVyIGRybV9lcnJfcHJpbnRlcihjb25zdCBjaGFyICpwcmVmaXgpCit7
CisJc3RydWN0IGRybV9wcmludGVyIHAgPSB7CisJCS5wcmludGZuID0gX19kcm1fcHJpbnRmbl9l
cnIsCisJCS5wcmVmaXggPSBwcmVmaXgKKwl9OworCXJldHVybiBwOworfQorCiAvKgogICogVGhl
IGZvbGxvd2luZyBjYXRlZ29yaWVzIGFyZSBkZWZpbmVkOgogICoKLS0gCjIuMjEuMAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxp
bmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs
