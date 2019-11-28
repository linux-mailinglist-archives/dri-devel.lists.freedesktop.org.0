Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B03210CD01
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2019 17:45:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AF326E863;
	Thu, 28 Nov 2019 16:45:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33C1A6E863
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Nov 2019 16:45:50 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id xASGjnqq072292;
 Thu, 28 Nov 2019 10:45:49 -0600
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
 by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xASGjnGQ013112
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 28 Nov 2019 10:45:49 -0600
Received: from DLEE115.ent.ti.com (157.170.170.26) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3; Thu, 28
 Nov 2019 10:45:48 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
 Frontend Transport; Thu, 28 Nov 2019 10:45:48 -0600
Received: from jadmar.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xASGjle4077546;
 Thu, 28 Nov 2019 10:45:47 -0600
From: Jyri Sarha <jsarha@ti.com>
To: <dri-devel@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/panel: simple: Add Rocktech RK101II01D-CT panel
Date: Thu, 28 Nov 2019 18:45:47 +0200
Message-ID: <b2b1d0c9cfab12012a9e63630a0659389529d5d5.1574959312.git.jsarha@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1574959312.git.jsarha@ti.com>
References: <cover.1574959312.git.jsarha@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1574959549;
 bh=DY/65BBuhrEYREBg9H1kW7OV+fDGWg6ueAPaxUuTpQY=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=APoNTisaSUhY4f5swQPtyzm7+DDjwsJZuZRGA+E0VG4adqJzEDIaeHCxyQ7Jb75vq
 PtdkZ5igORdANjidXMob6lvKmzZKWloXHgdfAra++vhmDQVxJBP7WMuCoxEVPQJmQy
 tI64YVxu7nHaaZQ3nisqreLqAP+oBcD3Ljreq4Lo=
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
Cc: tomi.valkeinen@ti.com, thierry.reding@gmail.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QWRkIHN1cHBvcnQgZm9yIFJvY2t0ZWNoIFJLMTAxSUkwMUQtQ1QsIDEwLjEiIDEyODB4ODAwIFRG
VCB3aXRoIExWRFMKaW50ZXJmYWNlLCBMRUQgYmFja2xpZ2h0IGFuZCBpbnRlZ3JhdGVkIEdvb2Rp
eCBHVDkyOCBjYXBhY2l0aXZlIHRvdWNoCnBhbmVsLgoKU2lnbmVkLW9mZi1ieTogSnlyaSBTYXJo
YSA8anNhcmhhQHRpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2ltcGxl
LmMgfCAzMiArKysrKysrKysrKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzIg
aW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1z
aW1wbGUuYyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUuYwppbmRleCA1ZDQ4
NzY4NmQyNWMuLjQ4OWUyMTcxMDJlYSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL3BhbmVs
L3BhbmVsLXNpbXBsZS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9wYW5lbC9wYW5lbC1zaW1wbGUu
YwpAQCAtMjQ3OSw2ICsyNDc5LDM1IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgcGFuZWxfZGVzYyBy
b2NrdGVjaF9yazA3MGVyOTQyNyA9IHsKIAkuYnVzX2Zvcm1hdCA9IE1FRElBX0JVU19GTVRfUkdC
NjY2XzFYMTgsCiB9OwogCitzdGF0aWMgY29uc3Qgc3RydWN0IGRybV9kaXNwbGF5X21vZGUgcm9j
a3RlY2hfcmsxMDFpaTAxZF9jdF9tb2RlID0geworCS5jbG9jayA9IDcxMTAwLAorCS5oZGlzcGxh
eSA9IDEyODAsCisJLmhzeW5jX3N0YXJ0ID0gMTI4MCArIDQ4LAorCS5oc3luY19lbmQgPSAxMjgw
ICsgNDggKyAzMiwKKwkuaHRvdGFsID0gMTI4MCArIDQ4ICsgMzIgKyA4MCwKKwkudmRpc3BsYXkg
PSA4MDAsCisJLnZzeW5jX3N0YXJ0ID0gODAwICsgMiwKKwkudnN5bmNfZW5kID0gODAwICsgMiAr
IDUsCisJLnZ0b3RhbCA9IDgwMCArIDIgKyA1ICsgMTYsCisJLnZyZWZyZXNoID0gNjAsCit9Owor
CitzdGF0aWMgY29uc3Qgc3RydWN0IHBhbmVsX2Rlc2Mgcm9ja3RlY2hfcmsxMDFpaTAxZF9jdCA9
IHsKKwkubW9kZXMgPSAmcm9ja3RlY2hfcmsxMDFpaTAxZF9jdF9tb2RlLAorCS5udW1fbW9kZXMg
PSAxLAorCS5zaXplID0geworCQkud2lkdGggPSAyMTcsCisJCS5oZWlnaHQgPSAxMzYsCisJfSwK
KwkuZGVsYXkgPSB7CisJCS5wcmVwYXJlID0gNTAsCisJCS5kaXNhYmxlID0gNTAsCisJfSwKKwku
YnVzX2ZsYWdzID0gRFJNX0JVU19GTEFHX0RFX0hJR0gsCisJLmJ1c19mb3JtYXQgPSBNRURJQV9C
VVNfRk1UX1JHQjg4OF8xWDdYNF9TUFdHLAorCS5jb25uZWN0b3JfdHlwZSA9IERSTV9NT0RFX0NP
Tk5FQ1RPUl9MVkRTLAorfTsKKwogc3RhdGljIGNvbnN0IHN0cnVjdCBkcm1fZGlzcGxheV9tb2Rl
IHNhbXN1bmdfbHNuMTIyZGwwMV9jMDFfbW9kZSA9IHsKIAkuY2xvY2sgPSAyNzE1NjAsCiAJLmhk
aXNwbGF5ID0gMjU2MCwKQEAgLTMzMzgsNiArMzM2Nyw5IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkIHBsYXRmb3JtX29mX21hdGNoW10gPSB7CiAJfSwgewogCQkuY29tcGF0aWJs
ZSA9ICJyb2NrdGVjaCxyazA3MGVyOTQyNyIsCiAJCS5kYXRhID0gJnJvY2t0ZWNoX3JrMDcwZXI5
NDI3LAorCX0sIHsKKwkJLmNvbXBhdGlibGUgPSAicm9ja3RlY2gscmsxMDFpaTAxZC1jdCIsCisJ
CS5kYXRhID0gJnJvY2t0ZWNoX3JrMTAxaWkwMWRfY3QsCiAJfSwgewogCQkuY29tcGF0aWJsZSA9
ICJzYW1zdW5nLGxzbjEyMmRsMDEtYzAxIiwKIAkJLmRhdGEgPSAmc2Ftc3VuZ19sc24xMjJkbDAx
X2MwMSwKLS0gClRleGFzIEluc3RydW1lbnRzIEZpbmxhbmQgT3ksIFBvcmtrYWxhbmthdHUgMjIs
IDAwMTgwIEhlbHNpbmtpLiBZLXR1bm51cy9CdXNpbmVzcyBJRDogMDYxNTUyMS00LiBLb3RpcGFp
a2thL0RvbWljaWxlOiBIZWxzaW5raQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZHJpLWRldmVs
