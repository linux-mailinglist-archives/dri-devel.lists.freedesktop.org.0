Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA0915C4B8
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2019 22:59:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1074789D00;
	Mon,  1 Jul 2019 20:58:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B1E489565
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2019 15:14:40 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x61FEWVw124747;
 Mon, 1 Jul 2019 10:14:32 -0500
Received: from DFLE101.ent.ti.com (dfle101.ent.ti.com [10.64.6.22])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x61FEW75055584
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Mon, 1 Jul 2019 10:14:32 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Mon, 1 Jul
 2019 10:14:31 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Mon, 1 Jul 2019 10:14:31 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x61FEV8U063793;
 Mon, 1 Jul 2019 10:14:31 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <robh+dt@kernel.org>,
 <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>, <jingoohan1@gmail.com>
Subject: [PATCH 4/4] devicetree: Add led-backlight binding
Date: Mon, 1 Jul 2019 17:14:23 +0200
Message-ID: <20190701151423.30768-5-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190701151423.30768-1-jjhiblot@ti.com>
References: <20190701151423.30768-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Approved-At: Mon, 01 Jul 2019 20:58:29 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1561994072;
 bh=JcG9gVVC9mwkIN0YqGoNDTpuvdgqaymnMY5JFYhSq/s=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=O4tR6/E3/HWD8H/zU7izLsJxcg7wBVDnGv5aKXwvZEgEKxcY0earzKKrNLQ0j8qaG
 EnaNXgC1P88RzAwuCuo90x+1ROuI1p0Wsm5Egb9tdUgnhJXDh8WCvPGpl2BH4RPxxj
 Rhh1Qr/uCaVK5sTWUnej4DWzQLhmNLpGFATPHpO8=
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, tomi.valkeinen@ti.com, dmurphy@ti.com,
 Jean-Jacques Hiblot <jjhiblot@ti.com>, linux-leds@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RnJvbTogVG9taSBWYWxrZWluZW4gPHRvbWkudmFsa2VpbmVuQHRpLmNvbT4KCkFkZCBEVCBiaW5k
aW5nIGZvciBsZWQtYmFja2xpZ2h0LgoKU2lnbmVkLW9mZi1ieTogVG9taSBWYWxrZWluZW4gPHRv
bWkudmFsa2VpbmVuQHRpLmNvbT4KU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8
ampoaWJsb3RAdGkuY29tPgpDYzogZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmcKLS0tCiAuLi4v
dmlkZW8vYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0ICAgICAgICAgfCAzOSArKysrKysrKysr
KysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgMzkgaW5zZXJ0aW9ucygrKQogY3JlYXRlIG1vZGUg
MTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92aWRlby9iYWNrbGlnaHQv
bGVkLWJhY2tsaWdodC50eHQKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUv
YmluZGluZ3MvdmlkZW8vYmFja2xpZ2h0L2xlZC1iYWNrbGlnaHQudHh0IGIvRG9jdW1lbnRhdGlv
bi9kZXZpY2V0cmVlL2JpbmRpbmdzL3ZpZGVvL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnR4dApu
ZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjIxNmNkNTJkNjI0YQotLS0g
L2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy92aWRlby9i
YWNrbGlnaHQvbGVkLWJhY2tsaWdodC50eHQKQEAgLTAsMCArMSwzOSBAQAorbGVkLWJhY2tsaWdo
dCBiaW5kaW5ncworCitUaGUgbm9kZSBvZiB0aGUgYmFja2xpZ2h0IGRyaXZlciBJUyB0aGUgbm9k
ZSBvZiB0aGUgTEVELgorCitSZXF1aXJlZCBwcm9wZXJ0aWVzOgorICAtIGNvbXBhdGlibGU6ICJs
ZWQtYmFja2xpZ2h0IgorICAtIGJyaWdodG5lc3MtbGV2ZWxzOiBBcnJheSBvZiBkaXN0aW5jdCBM
RUQgYnJpZ2h0bmVzcyBsZXZlbHMuIFRoZXNlCisgICAgICBhcmUgaW4gdGhlIHJhbmdlIGZyb20g
MCB0byAyNTUsIHBhc3NlZCB0byB0aGUgTEVEIGNsYXNzIGRyaXZlci4KKyAgLSBkZWZhdWx0LWJy
aWdodG5lc3MtbGV2ZWw6IHRoZSBkZWZhdWx0IGJyaWdodG5lc3MgbGV2ZWwgKGluZGV4IGludG8g
dGhlCisgICAgICBhcnJheSBkZWZpbmVkIGJ5IHRoZSAiYnJpZ2h0bmVzcy1sZXZlbHMiIHByb3Bl
cnR5KQorCitPcHRpb25hbCBwcm9wZXJ0aWVzOgorICAtIHBvd2VyLXN1cHBseTogcmVndWxhdG9y
IGZvciBzdXBwbHkgdm9sdGFnZQorICAtIGVuYWJsZS1ncGlvczogY29udGFpbnMgYSBzaW5nbGUg
R1BJTyBzcGVjaWZpZXIgZm9yIHRoZSBHUElPIHdoaWNoIGVuYWJsZXMKKyAgICAgICAgICAgICAg
ICAgIGFuZCBkaXNhYmxlcyB0aGUgYmFja2xpZ2h0IChzZWUgR1BJTyBiaW5kaW5nWzBdKQorCitb
MF06IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8udHh0CisKK0V4
YW1wbGU6CisKK2xlZF9jdHJsIHsKKwlyZWRfbGVkQDEgeworCSAgICAgICAgbGFiZWwgPSAicmVk
IjsKKwkJcmVnID0gPDE+OworCX0KKworCWJhY2tsaWdodF9sZWRAMiB7CisJCWZ1bmN0aW9uID0g
TEVEX0ZVTkNUSU9OX0JBQ0tMSUdIVDsKKwkJcmVnID0gPDI+OworCisJCWNvbXBhdGlibGUgPSAi
bGVkLWJhY2tsaWdodCI7CisKKwkJYnJpZ2h0bmVzcy1sZXZlbHMgPSA8MCA0IDggMTYgMzIgNjQg
MTI4IDI1NT47CisJCWRlZmF1bHQtYnJpZ2h0bmVzcy1sZXZlbCA9IDw2PjsKKworCQlwb3dlci1z
dXBwbHkgPSA8JnZkZF9ibF9yZWc+OworCQllbmFibGUtZ3Bpb3MgPSA8JmdwaW8gNTggMD47CisJ
fTsKK307Ci0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
