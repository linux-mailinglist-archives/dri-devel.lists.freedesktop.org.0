Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 09A69A664E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 12:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C33989812;
	Tue,  3 Sep 2019 10:12:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 528FC897FF
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Sep 2019 10:12:53 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E07B67EB89;
 Tue,  3 Sep 2019 10:12:52 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1DE26196AE;
 Tue,  3 Sep 2019 10:12:49 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 164CD31F38; Tue,  3 Sep 2019 12:12:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/6] drm: add drm_print_bits
Date: Tue,  3 Sep 2019 12:12:43 +0200
Message-Id: <20190903101248.12879-2-kraxel@redhat.com>
In-Reply-To: <20190903101248.12879-1-kraxel@redhat.com>
References: <20190903101248.12879-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.71]); Tue, 03 Sep 2019 10:12:53 +0000 (UTC)
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
Cc: Maxime Ripard <maxime.ripard@bootlin.com>,
 open list <linux-kernel@vger.kernel.org>, David Airlie <airlied@linux.ie>,
 Gerd Hoffmann <kraxel@redhat.com>, Sean Paul <sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

TmV3IGhlbHBlciB0byBwcmludCBuYW1lZCBiaXRzIG9mIHNvbWUgdmFsdWUgKHRoaW5rIGZsYWdz
IGZpZWxkcykuCgpTaWduZWQtb2ZmLWJ5OiBHZXJkIEhvZmZtYW5uIDxrcmF4ZWxAcmVkaGF0LmNv
bT4KLS0tCiBpbmNsdWRlL2RybS9kcm1fcHJpbnQuaCAgICAgfCAgMyArKysKIGRyaXZlcnMvZ3B1
L2RybS9kcm1fcHJpbnQuYyB8IDM2ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KwogMiBmaWxlcyBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9kcm0vZHJtX3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAppbmRleCBhNWQ2ZjJm
M2U0MzAuLjg2NThjMWRhMWM3ZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgK
KysrIGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKQEAgLTg4LDYgKzg4LDkgQEAgX19wcmludGYo
MiwgMykKIHZvaWQgZHJtX3ByaW50ZihzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIGNvbnN0IGNoYXIg
KmYsIC4uLik7CiB2b2lkIGRybV9wdXRzKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgY29uc3QgY2hh
ciAqc3RyKTsKIHZvaWQgZHJtX3ByaW50X3JlZ3NldDMyKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwg
c3RydWN0IGRlYnVnZnNfcmVnc2V0MzIgKnJlZ3NldCk7Cit2b2lkIGRybV9wcmludF9iaXRzKHN0
cnVjdCBkcm1fcHJpbnRlciAqcCwgdW5zaWduZWQgaW50IGluZGVudCwKKwkJICAgIGNvbnN0IGNo
YXIgKmxhYmVsLCB1bnNpZ25lZCBpbnQgdmFsdWUsCisJCSAgICBjb25zdCBjaGFyICpiaXRzW10s
IHVuc2lnbmVkIGludCBuYml0cyk7CiAKIF9fcHJpbnRmKDIsIDApCiAvKioKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQu
YwppbmRleCBhMTdjOGExNGRiYTQuLjdmN2FiYTkyMGY1MSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL2RybV9wcmludC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYwpAQCAt
MTc5LDYgKzE3OSw0MiBAQCB2b2lkIGRybV9wcmludGYoc3RydWN0IGRybV9wcmludGVyICpwLCBj
b25zdCBjaGFyICpmLCAuLi4pCiB9CiBFWFBPUlRfU1lNQk9MKGRybV9wcmludGYpOwogCisvKioK
KyAqIGRybV9wcmludF9iaXRzIC0gcHJpbnQgYml0cyB0byBhICZkcm1fcHJpbnRlciBzdHJlYW0K
KyAqCisgKiBQcmludCBiaXRzIChpbiBmbGFnIGZpZWxkcyBmb3IgZXhhbXBsZSkgaW4gaHVtYW4g
cmVhZGFibGUgZm9ybS4KKyAqCisgKiBAcDogdGhlICZkcm1fcHJpbnRlcgorICogQGluZGVudDog
VGFiIGluZGVudGF0aW9uIGxldmVsIChtYXggNSkKKyAqIEBsYWJlbDogZmllbGQgbGFiZWwuCisg
KiBAdmFsdWU6IGZpZWxkIHZhbHVlLgorICogQGJpdHM6IEFycmF5IHdpdGggYml0IG5hbWVzLgor
ICogQG5iaXRzOiBiaXQgbmFtZSBhcnJheSBzaXplLgorICovCit2b2lkIGRybV9wcmludF9iaXRz
KHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgdW5zaWduZWQgaW50IGluZGVudCwKKwkJICAgIGNvbnN0
IGNoYXIgKmxhYmVsLCB1bnNpZ25lZCBpbnQgdmFsdWUsCisJCSAgICBjb25zdCBjaGFyICpiaXRz
W10sIHVuc2lnbmVkIGludCBuYml0cykKK3sKKwlib29sIGZpcnN0ID0gdHJ1ZTsKKwl1bnNpZ25l
ZCBpbnQgaTsKKworCWZvciAoaSA9IDA7IGkgPCBuYml0czsgaSsrKSB7CisJCWlmICghKHZhbHVl
ICYgKDEgPDwgaSkpKQorCQkJY29udGludWU7CisJCWlmICghYml0c1tpXSkKKwkJCWNvbnRpbnVl
OworCQlpZiAoZmlyc3QpIHsKKwkJCWZpcnN0ID0gZmFsc2U7CisJCQlkcm1fcHJpbnRmX2luZGVu
dChwLCBpbmRlbnQsICIlcz0lcyIsCisJCQkJCSAgbGFiZWwsIGJpdHNbaV0pOworCQl9IGVsc2UK
KwkJCWRybV9wcmludGYocCwgIiwlcyIsIGJpdHNbaV0pOworCX0KKwlpZiAoIWZpcnN0KQorCQlk
cm1fcHJpbnRmKHAsICJcbiIpOworfQorRVhQT1JUX1NZTUJPTChkcm1fcHJpbnRfYml0cyk7CisK
IHZvaWQgZHJtX2Rldl9wcmludGsoY29uc3Qgc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFy
ICpsZXZlbCwKIAkJICAgIGNvbnN0IGNoYXIgKmZvcm1hdCwgLi4uKQogewotLSAKMi4xOC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
