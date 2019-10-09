Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA63CD0A36
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2019 10:52:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 166026E936;
	Wed,  9 Oct 2019 08:52:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659426E936
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2019 08:52:09 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
 by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x998q4H2035244;
 Wed, 9 Oct 2019 03:52:04 -0500
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
 by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x998q43U023525
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Wed, 9 Oct 2019 03:52:04 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5; Wed, 9 Oct
 2019 03:52:01 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
 Frontend Transport; Wed, 9 Oct 2019 03:52:04 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x998q3SO099447;
 Wed, 9 Oct 2019 03:52:04 -0500
From: Jean-Jacques Hiblot <jjhiblot@ti.com>
To: <jacek.anaszewski@gmail.com>, <pavel@ucw.cz>, <sre@kernel.org>,
 <robh+dt@kernel.org>, <mark.rutland@arm.com>, <lee.jones@linaro.org>,
 <daniel.thompson@linaro.org>
Subject: [PATCH v10 5/6] dt-bindings: backlight: Add led-backlight binding
Date: Wed, 9 Oct 2019 10:51:26 +0200
Message-ID: <20191009085127.22843-6-jjhiblot@ti.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191009085127.22843-1-jjhiblot@ti.com>
References: <20191009085127.22843-1-jjhiblot@ti.com>
MIME-Version: 1.0
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ti.com; s=ti-com-17Q1; t=1570611125;
 bh=s5d/szql8fU2uDVYRw2K7PeI4Cnl3Z9+5CQzwG1wYJU=;
 h=From:To:CC:Subject:Date:In-Reply-To:References;
 b=usk5TxWfAR6ogFjaJI14GXUZfVYQq2jWISyTbJW95JeDsUsk/EqlSVxie8frZ3npV
 AVZzuMjtOZqj2bNAlKKcAbR5Nme/YxHYxuCP1AwEo0OSEihMKsqNTAmZi/iUoyGOeV
 /Yww1zCQ+FyLtOkBesUAmpSnCFBLe/GGiT/8HpUw=
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

QWRkIERUIGJpbmRpbmcgZm9yIGxlZC1iYWNrbGlnaHQuCgpDYzogZGV2aWNldHJlZUB2Z2VyLmtl
cm5lbC5vcmcKU2lnbmVkLW9mZi1ieTogSmVhbi1KYWNxdWVzIEhpYmxvdCA8ampoaWJsb3RAdGku
Y29tPgoKLS0tCgouLi4vbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC55YW1sICAgICAgICAg
fCA1NSArKysrKysrKysrKysrKysrKysrCiAxIGZpbGUgY2hhbmdlZCwgNTUgaW5zZXJ0aW9ucygr
KQogY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9s
ZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnlhbWwKCmRpZmYgLS1naXQgYS9Eb2N1bWVudGF0
aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbGVkcy9iYWNrbGlnaHQvbGVkLWJhY2tsaWdodC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2xlZHMvYmFja2xpZ2h0L2xlZC1i
YWNrbGlnaHQueWFtbApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwMDAwMDAuLjQ3
YWUzZDZiNGYzMQotLS0gL2Rldi9udWxsCisrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9sZWRzL2JhY2tsaWdodC9sZWQtYmFja2xpZ2h0LnlhbWwKQEAgLTAsMCArMSw1NSBA
QAorIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogKEdQTC0yLjAgT1IgQlNELTItQ2xhdXNlKQor
JVlBTUwgMS4yCistLS0KKyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvbGVkcy9i
YWNrbGlnaHQvbGVkLWJhY2tsaWdodC55YW1sIworJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUu
b3JnL21ldGEtc2NoZW1hcy9jb3JlLnlhbWwjCisKK3RpdGxlOiBMRUQtYmFzZWQgQmFja2xpZ2h0
IERldmljZSBUcmVlIEJpbmRpbmdzCisKK21haW50YWluZXJzOgorICAtIEplYW4tSmFjcXVlcyBI
aWJsb3QgPGpqaGlibG90QHRpLmNvbT4KKworZGVzY3JpcHRpb246IHwKKyAgVGhpcyBiaW5kaW5n
IGlzIHVzZWQgdG8gZGVzY3JpYmUgYSBiYXNpYyBiYWNrbGlnaHQgZGV2aWNlIG1hZGUgb2YgTEVE
cy4KKyAgSXQgY2FuIGFsc28gYmUgdXNlZCB0byBkZXNjcmliZSBhIGJhY2tsaWdodCBkZXZpY2Ug
Y29udHJvbGxlZCBieSB0aGUKKyAgb3V0cHV0IG9mIGEgTEVEIGRyaXZlci4KKworcHJvcGVydGll
czoKKyAgY29tcGF0aWJsZToKKyAgICBjb25zdDogbGVkLWJhY2tsaWdodAorCisgIGxlZHM6Cisg
ICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvcGhhbmRsZS1hcnJheQor
ICAgIGRlc2NyaXB0aW9uOiBMaXN0IG9mIExFRHMgY29uc3RpdHV0aXZlIG9mIHRoZSBiYWNrbGln
aHQuCisKKyAgZGVmYXVsdC1icmlnaHRuZXNzOgorICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlh
bWwjL2RlZmluaXRpb25zL3VpbnQzMgorICAgIGRlc2NyaXB0aW9uOiBEZWZhdWx0IGJyaWdodG5l
c3MgbGV2ZWwgb24gYm9vdC4KKyAgICBtaW5pbXVtOiAwCisKKyAgYnJpZ2h0bmVzcy1sZXZlbHM6
CisgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMvZGVmaW5pdGlvbnMvdWludDMyLWFycmF5
CisgICAgZGVzY3JpcHRpb246IEFycmF5IG9mIGRpc3RpbmN0IGJyaWdodG5lc3MgbGV2ZWxzLiBU
aGUgbGV2ZWxzIG11c3QgYmUgaW4KKyAgICAgIHRoZSByYW5nZSBhY2NlcHRlZCBieSB0aGUgdW5k
ZXJseWluZyBMRUQgZGV2aWNlcy4gVGhpcyBpcyB1c2VkIHRvCisgICAgICB0cmFuc2xhdGUgYSBi
YWNrbGlnaHQgYnJpZ2h0bmVzcyBsZXZlbCBpbnRvIGEgTEVEIGJyaWdodG5lc3MgbGV2ZWwuIElm
CisgICAgICBpdCBpcyBub3QgcHJvdmlkZWQsIHRoZSBpZGVudGl0eSBtYXBwaW5nIGlzIHVzZWQu
CisKK3JlcXVpcmVkOgorICAtIGNvbXBhdGlibGUKKyAgLSBiYWNrbGlnaHQtbGVkcworCitleGFt
cGxlczoKKyAgLSB8CisgICAgYmFja2xpZ2h0IHsKKyAgICAgIGNvbXBhdGlibGUgPSAibGVkLWJh
Y2tsaWdodCI7CisgICAgICBiYWNrbGlnaHQtbGVkcyA9IDwmbGVkMT47CisgICAgICBicmlnaHRu
ZXNzLWxldmVscyA9IDwwIDQgOCAxNiAzMiA2NCAxMjggMjU1PjsKKyAgICAgIGRlZmF1bHQtYnJp
Z2h0bmVzcyA9IDw2PjsgLyo2dGggbGV2ZWwgPT4gYnJpZ2h0bmVzcyBvZiB0aGUgTEVEcyBpcyAx
MjgqLworICAgIH07CisgIC0gfAorICAgIGJhY2tsaWdodCB7CisgICAgICBjb21wYXRpYmxlID0g
ImxlZC1iYWNrbGlnaHQiOworICAgICAgYmFja2xpZ2h0LWxlZHMgPSA8JmxlZDE+LCA8JmxlZDI+
OworICAgICAgZGVmYXVsdC1icmlnaHRuZXNzID0gPDI1NT47CisgICAgfTsKKy4uLgotLSAKMi4x
Ny4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
