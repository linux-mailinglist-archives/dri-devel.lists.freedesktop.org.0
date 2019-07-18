Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 496DC6C47D
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 03:44:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCDB06E2D6;
	Thu, 18 Jul 2019 01:44:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8746E2D2
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 01:44:34 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 2F085C057E29;
 Thu, 18 Jul 2019 01:44:34 +0000 (UTC)
Received: from whitewolf.redhat.com (ovpn-120-112.rdu2.redhat.com
 [10.10.120.112])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFE5E19C67;
 Thu, 18 Jul 2019 01:44:32 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/26] drm/dp_mst: Constify guid in
 drm_dp_get_mst_branch_by_guid()
Date: Wed, 17 Jul 2019 21:42:33 -0400
Message-Id: <20190718014329.8107-11-lyude@redhat.com>
In-Reply-To: <20190718014329.8107-1-lyude@redhat.com>
References: <20190718014329.8107-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Thu, 18 Jul 2019 01:44:34 +0000 (UTC)
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

QW5kIGl0J3MgaGVscGVyLCB3ZSdsbCBiZSB1c2luZyB0aGlzIGluIGp1c3QgYSBtb21lbnQuCgpD
YzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRl
YWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgpTaWduZWQtb2Zm
LWJ5OiBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9k
cm1fZHBfbXN0X3RvcG9sb2d5LmMgfCA0ICsrLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlv
bnMoKyksIDIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9k
cF9tc3RfdG9wb2xvZ3kuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMK
aW5kZXggYjg2N2EyZThmNzc5Li4wODk0YmMyMzcwODIgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2RybV9kcF9t
c3RfdG9wb2xvZ3kuYwpAQCAtMTk3MSw3ICsxOTcxLDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHBf
bXN0X2JyYW5jaCAqZHJtX2RwX2dldF9tc3RfYnJhbmNoX2RldmljZShzdHJ1Y3QgZHJtX2RwX21z
dF8KIAogc3RhdGljIHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqZ2V0X21zdF9icmFuY2hfZGV2
aWNlX2J5X2d1aWRfaGVscGVyKAogCXN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YiwKLQl1
aW50OF90ICpndWlkKQorCWNvbnN0IHVpbnQ4X3QgKmd1aWQpCiB7CiAJc3RydWN0IGRybV9kcF9t
c3RfYnJhbmNoICpmb3VuZF9tc3RiOwogCXN0cnVjdCBkcm1fZHBfbXN0X3BvcnQgKnBvcnQ7CkBA
IC0xOTk1LDcgKzE5OTUsNyBAQCBzdGF0aWMgc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICpnZXRf
bXN0X2JyYW5jaF9kZXZpY2VfYnlfZ3VpZF9oZWxwZXIoCiAKIHN0YXRpYyBzdHJ1Y3QgZHJtX2Rw
X21zdF9icmFuY2ggKgogZHJtX2RwX2dldF9tc3RfYnJhbmNoX2RldmljZV9ieV9ndWlkKHN0cnVj
dCBkcm1fZHBfbXN0X3RvcG9sb2d5X21nciAqbWdyLAotCQkJCSAgICAgdWludDhfdCAqZ3VpZCkK
KwkJCQkgICAgIGNvbnN0IHVpbnQ4X3QgKmd1aWQpCiB7CiAJc3RydWN0IGRybV9kcF9tc3RfYnJh
bmNoICptc3RiOwogCWludCByZXQ7Ci0tIAoyLjIxLjAKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVs
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
