Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 19D862B6E7
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2019 15:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D6AC6E217;
	Mon, 27 May 2019 13:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 399336E216
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2019 13:48:12 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4RDm33o053918;
 Mon, 27 May 2019 08:48:03 -0500
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4RDm3LG054707
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 27 May 2019 08:48:03 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 27
 May 2019 08:48:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 27 May 2019 08:48:02 -0500
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4RDlviE065947;
 Mon, 27 May 2019 08:48:00 -0500
From: Jyri Sarha <jsarha@ti.com>
To: <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
 <dri-devel@lists.freedesktop.org>
Subject: [PATCH v8 1/6] drm/bridge: sii902x: add input_bus_flags
Date: Mon, 27 May 2019 16:47:52 +0300
Message-ID: <deb02a1fd508c514472a4e660092f301e6681361.1558964241.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1558964241.git.jsarha@ti.com>
References: <cover.1558964241.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1558964883;
 bh=jnO0wQSVfRbEBt1Q0sFOXV/qwgajJK9ldb5h/H7MyV0=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=JaRegP5b4EDwtUe0dmkvmgqI310ehK9utAiYb7nK/8fxfUcA/4Ghe4WVM5gS/6SAs
 y3MMdFWlm1Gpa3x/YfUI3JcCQiXflYFUg4LHBfp2i/vECKfTqatDUMhI5rTtyflkQ0
 WHJEYpD1/ZfMtbr0jBmLVSsgy5ApsYDgG3ESabBA=
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
Cc: peter.ujfalusi@ti.com, tomi.valkeinen@ti.com,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KClRoZSBkcml2ZXIg
YWx3YXlzIHNldHMgSW5wdXRCdXNGbXQ6RURHRSB0byAwIChmYWxsaW5nIGVkZ2UpLgoKQWRkIGRy
bV9icmlkZ2VfdGltaW5ncydzIGlucHV0X2J1c19mbGFncyB0byByZWZsZWN0IHRoYXQgdGhlIGJy
aWRnZQpzYW1wbGVzIG9uIGZhbGxpbmcgZWRnZXMuCgpTaWduZWQtb2ZmLWJ5OiBUb21pIFZhbGtl
aW5lbiA8dG9taS52YWxrZWluZW5AdGkuY29tPgpTaWduZWQtb2ZmLWJ5OiBKeXJpIFNhcmhhIDxq
c2FyaGFAdGkuY29tPgpSZXZpZXdlZC1ieTogQW5kcnplaiBIYWpkYSA8YS5oYWpkYUBzYW1zdW5n
LmNvbT4KUmV2aWV3ZWQtYnk6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRl
YXNvbmJvYXJkLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3NpaTkwMnguYyB8IDcg
KysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9z
aWk5MDJ4LmMKaW5kZXggY2RiOGRmZGIyZGZmLi4wZDNkNzMwYjk3ZmYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9icmlkZ2Uvc2lpOTAyeC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlk
Z2Uvc2lpOTAyeC5jCkBAIC00NjEsNiArNDYxLDEyIEBAIHN0YXRpYyBpbnQgc2lpOTAyeF9pMmNf
YnlwYXNzX2Rlc2VsZWN0KHN0cnVjdCBpMmNfbXV4X2NvcmUgKm11eCwgdTMyIGNoYW5faWQpCiAJ
cmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV90aW1pbmdzIGRl
ZmF1bHRfc2lpOTAyeF90aW1pbmdzID0geworCS5pbnB1dF9idXNfZmxhZ3MgPSBEUk1fQlVTX0ZM
QUdfUElYREFUQV9TQU1QTEVfTkVHRURHRQorCQkgfCBEUk1fQlVTX0ZMQUdfU1lOQ19TQU1QTEVf
TkVHRURHRQorCQkgfCBEUk1fQlVTX0ZMQUdfREVfSElHSCwKK307CisKIHN0YXRpYyBpbnQgc2lp
OTAyeF9wcm9iZShzdHJ1Y3QgaTJjX2NsaWVudCAqY2xpZW50LAogCQkJIGNvbnN0IHN0cnVjdCBp
MmNfZGV2aWNlX2lkICppZCkKIHsKQEAgLTUzMSw2ICs1MzcsNyBAQCBzdGF0aWMgaW50IHNpaTkw
MnhfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmNsaWVudCwKIAogCXNpaTkwMngtPmJyaWRnZS5m
dW5jcyA9ICZzaWk5MDJ4X2JyaWRnZV9mdW5jczsKIAlzaWk5MDJ4LT5icmlkZ2Uub2Zfbm9kZSA9
IGRldi0+b2Zfbm9kZTsKKwlzaWk5MDJ4LT5icmlkZ2UudGltaW5ncyA9ICZkZWZhdWx0X3NpaTkw
MnhfdGltaW5nczsKIAlkcm1fYnJpZGdlX2FkZCgmc2lpOTAyeC0+YnJpZGdlKTsKIAogCWkyY19z
ZXRfY2xpZW50ZGF0YShjbGllbnQsIHNpaTkwMngpOwotLSAKVGV4YXMgSW5zdHJ1bWVudHMgRmlu
bGFuZCBPeSwgUG9ya2thbGFua2F0dSAyMiwgMDAxODAgSGVsc2lua2kuIFktdHVubnVzL0J1c2lu
ZXNzIElEOiAwNjE1NTIxLTQuIEtvdGlwYWlra2EvRG9taWNpbGU6IEhlbHNpbmtpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
