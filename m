Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 361B9A7ADD
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2019 07:47:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0322389A14;
	Wed,  4 Sep 2019 05:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E91B89A1F
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Sep 2019 05:47:45 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id F23FE10C6973;
 Wed,  4 Sep 2019 05:47:44 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-72.ams2.redhat.com
 [10.36.117.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1319B6092D;
 Wed,  4 Sep 2019 05:47:42 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CA12831E8D; Wed,  4 Sep 2019 07:47:40 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/7] drm: add drm_print_bits
Date: Wed,  4 Sep 2019 07:47:34 +0200
Message-Id: <20190904054740.20817-2-kraxel@redhat.com>
In-Reply-To: <20190904054740.20817-1-kraxel@redhat.com>
References: <20190904054740.20817-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.65]); Wed, 04 Sep 2019 05:47:45 +0000 (UTC)
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
L2RybS9kcm1fcHJpbnQuYyB8IDMzICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwog
MiBmaWxlcyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9k
cm0vZHJtX3ByaW50LmggYi9pbmNsdWRlL2RybS9kcm1fcHJpbnQuaAppbmRleCAxMTIxNjVkMzE5
NWQuLjEyZDQ5MTYyNTRiNCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKKysr
IGIvaW5jbHVkZS9kcm0vZHJtX3ByaW50LmgKQEAgLTg5LDYgKzg5LDkgQEAgX19wcmludGYoMiwg
MykKIHZvaWQgZHJtX3ByaW50ZihzdHJ1Y3QgZHJtX3ByaW50ZXIgKnAsIGNvbnN0IGNoYXIgKmYs
IC4uLik7CiB2b2lkIGRybV9wdXRzKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgY29uc3QgY2hhciAq
c3RyKTsKIHZvaWQgZHJtX3ByaW50X3JlZ3NldDMyKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgc3Ry
dWN0IGRlYnVnZnNfcmVnc2V0MzIgKnJlZ3NldCk7Cit2b2lkIGRybV9wcmludF9iaXRzKHN0cnVj
dCBkcm1fcHJpbnRlciAqcCwKKwkJICAgIHVuc2lnbmVkIGxvbmcgdmFsdWUsIGNvbnN0IGNoYXIg
KmJpdHNbXSwKKwkJICAgIHVuc2lnbmVkIGludCBmcm9tLCB1bnNpZ25lZCBpbnQgdG8pOwogCiBf
X3ByaW50ZigyLCAwKQogLyoqCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKaW5kZXggYWQzMDJkNzFlZWVlLi5kZmEy
NzM2N2ViYjggMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fcHJpbnQuYworKysgYi9k
cml2ZXJzL2dwdS9kcm0vZHJtX3ByaW50LmMKQEAgLTE4NSw2ICsxODUsMzkgQEAgdm9pZCBkcm1f
cHJpbnRmKHN0cnVjdCBkcm1fcHJpbnRlciAqcCwgY29uc3QgY2hhciAqZiwgLi4uKQogfQogRVhQ
T1JUX1NZTUJPTChkcm1fcHJpbnRmKTsKIAorLyoqCisgKiBkcm1fcHJpbnRfYml0cyAtIHByaW50
IGJpdHMgdG8gYSAmZHJtX3ByaW50ZXIgc3RyZWFtCisgKgorICogUHJpbnQgYml0cyAoaW4gZmxh
ZyBmaWVsZHMgZm9yIGV4YW1wbGUpIGluIGh1bWFuIHJlYWRhYmxlIGZvcm0uCisgKiBUaGUgZmly
c3QgbmFtZSBpbiB0aGUgQGJpdHMgYXJyYXkgaXMgZm9yIHRoZSBiaXQgaW5kZXhlZCBieSBAZnJv
bS4KKyAqCisgKiBAcDogdGhlICZkcm1fcHJpbnRlcgorICogQHZhbHVlOiBmaWVsZCB2YWx1ZS4K
KyAqIEBiaXRzOiBBcnJheSB3aXRoIGJpdCBuYW1lcy4KKyAqIEBmcm9tOiBzdGFydCBvZiBiaXQg
cmFuZ2UgdG8gcHJpbnQgKGluY2x1c2l2ZSkuCisgKiBAdG86IGVuZCBvZiBiaXQgcmFuZ2UgdG8g
cHJpbnQgKGV4Y2x1c2l2ZSkuCisgKi8KK3ZvaWQgZHJtX3ByaW50X2JpdHMoc3RydWN0IGRybV9w
cmludGVyICpwLAorCQkgICAgdW5zaWduZWQgbG9uZyB2YWx1ZSwgY29uc3QgY2hhciAqYml0c1td
LAorCQkgICAgdW5zaWduZWQgaW50IGZyb20sIHVuc2lnbmVkIGludCB0bykKK3sKKwlib29sIGZp
cnN0ID0gdHJ1ZTsKKwl1bnNpZ25lZCBpbnQgaTsKKworCWZvciAoaSA9IGZyb207IGkgPCB0bzsg
aSsrKSB7CisJCWlmICghKHZhbHVlICYgKDEgPDwgaSkpKQorCQkJY29udGludWU7CisJCWlmIChX
QVJOX09OX09OQ0UoIWJpdHNbaS1mcm9tXSkpCisJCQljb250aW51ZTsKKwkJZHJtX3ByaW50Zihw
LCAiJXMlcyIsIGZpcnN0ID8gIiIgOiAiLCIsCisJCQkgICBiaXRzW2ktZnJvbV0pOworCQlmaXJz
dCA9IGZhbHNlOworCX0KKwlpZiAoZmlyc3QpCisJCWRybV9wcmludGYocCwgIihub25lKSIpOwor
fQorRVhQT1JUX1NZTUJPTChkcm1fcHJpbnRfYml0cyk7CisKIHZvaWQgZHJtX2Rldl9wcmludGso
Y29uc3Qgc3RydWN0IGRldmljZSAqZGV2LCBjb25zdCBjaGFyICpsZXZlbCwKIAkJICAgIGNvbnN0
IGNoYXIgKmZvcm1hdCwgLi4uKQogewotLSAKMi4xOC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
