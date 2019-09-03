Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4974CA7555
	for <lists+dri-devel@lfdr.de>; Tue,  3 Sep 2019 22:48:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA58889B67;
	Tue,  3 Sep 2019 20:48:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5523489AB6;
 Tue,  3 Sep 2019 20:48:23 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D29223082133;
 Tue,  3 Sep 2019 20:48:22 +0000 (UTC)
Received: from malachite.bss.redhat.com (dhcp-10-20-1-34.bss.redhat.com
 [10.20.1.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DCFDB1001956;
 Tue,  3 Sep 2019 20:48:19 +0000 (UTC)
From: Lyude Paul <lyude@redhat.com>
To: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Subject: [PATCH v2 11/27] drm/dp_mst: Constify guid in
 drm_dp_get_mst_branch_by_guid()
Date: Tue,  3 Sep 2019 16:45:49 -0400
Message-Id: <20190903204645.25487-12-lyude@redhat.com>
In-Reply-To: <20190903204645.25487-1-lyude@redhat.com>
References: <20190903204645.25487-1-lyude@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Tue, 03 Sep 2019 20:48:23 +0000 (UTC)
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Juston Li <juston.li@intel.com>,
 Harry Wentland <hwentlan@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW5kIGl0J3MgaGVscGVyLCB3ZSdsbCBiZSB1c2luZyB0aGlzIGluIGp1c3QgYSBtb21lbnQuCgpD
YzogSnVzdG9uIExpIDxqdXN0b24ubGlAaW50ZWwuY29tPgpDYzogSW1yZSBEZWFrIDxpbXJlLmRl
YWtAaW50ZWwuY29tPgpDYzogVmlsbGUgU3lyasOkbMOkIDx2aWxsZS5zeXJqYWxhQGxpbnV4Lmlu
dGVsLmNvbT4KQ2M6IEhhcnJ5IFdlbnRsYW5kIDxod2VudGxhbkBhbWQuY29tPgpDYzogRGFuaWVs
IFZldHRlciA8ZGFuaWVsLnZldHRlckBmZndsbC5jaD4KU2lnbmVkLW9mZi1ieTogTHl1ZGUgUGF1
bCA8bHl1ZGVAcmVkaGF0LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3Bv
bG9neS5jIHwgNCArKy0tCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21zdF90b3BvbG9neS5jCmluZGV4IDQzNDUyODcy
ZWZhZC4uYjQ0ZDM2OTZjMDlhIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2RwX21z
dF90b3BvbG9neS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fZHBfbXN0X3RvcG9sb2d5LmMK
QEAgLTIwNjAsNyArMjA2MCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKmRy
bV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2Uoc3RydWN0IGRybV9kcF9tc3RfCiAKIHN0YXRpYyBz
dHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKmdldF9tc3RfYnJhbmNoX2RldmljZV9ieV9ndWlkX2hl
bHBlcigKIAlzdHJ1Y3QgZHJtX2RwX21zdF9icmFuY2ggKm1zdGIsCi0JdWludDhfdCAqZ3VpZCkK
Kwljb25zdCB1aW50OF90ICpndWlkKQogewogCXN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqZm91
bmRfbXN0YjsKIAlzdHJ1Y3QgZHJtX2RwX21zdF9wb3J0ICpwb3J0OwpAQCAtMjA4NCw3ICsyMDg0
LDcgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqZ2V0X21zdF9icmFuY2hfZGV2
aWNlX2J5X2d1aWRfaGVscGVyKAogCiBzdGF0aWMgc3RydWN0IGRybV9kcF9tc3RfYnJhbmNoICoK
IGRybV9kcF9nZXRfbXN0X2JyYW5jaF9kZXZpY2VfYnlfZ3VpZChzdHJ1Y3QgZHJtX2RwX21zdF90
b3BvbG9neV9tZ3IgKm1nciwKLQkJCQkgICAgIHVpbnQ4X3QgKmd1aWQpCisJCQkJICAgICBjb25z
dCB1aW50OF90ICpndWlkKQogewogCXN0cnVjdCBkcm1fZHBfbXN0X2JyYW5jaCAqbXN0YjsKIAlp
bnQgcmV0OwotLSAKMi4yMS4wCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9k
cmktZGV2ZWw=
