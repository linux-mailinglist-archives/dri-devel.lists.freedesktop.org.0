Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8913F1E3
	for <lists+dri-devel@lfdr.de>; Tue, 30 Apr 2019 10:17:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B3F589007;
	Tue, 30 Apr 2019 08:17:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from rfout2.hes.trendmicro.com (rfout2.hes.trendmicro.com
 [54.67.111.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BAE389007
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 08:17:13 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.14.197])
 by rfout2.hes.trendmicro.com (Postfix) with ESMTPS id 9A1BD110BC43
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Apr 2019 08:17:12 +0000 (UTC)
Received: from 0.0.0.0_hes.trendmicro.com (unknown [10.64.10.197])
 by rout5.hes.trendmicro.com (Postfix) with SMTP id C27B2EFC05B;
 Tue, 30 Apr 2019 08:17:11 +0000 (UTC)
Received: from IND01-BO1-obe.outbound.protection.outlook.com (unknown
 [104.47.101.58])
 by relay1.hes.trendmicro.com (TrendMicro Hosted Email Security) with ESMTPS id
 C53AC142C0C3; Tue, 30 Apr 2019 08:17:09 +0000 (UTC)
Received: from MAXPR01MB3773.INDPRD01.PROD.OUTLOOK.COM (52.134.158.84) by
 MAXPR01MB2864.INDPRD01.PROD.OUTLOOK.COM (52.134.153.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1835.12; Tue, 30 Apr 2019 08:17:04 +0000
Received: from MAXPR01MB3773.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8c8f:543a:ccd6:fe7a]) by MAXPR01MB3773.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::8c8f:543a:ccd6:fe7a%2]) with mapi id 15.20.1835.018; Tue, 30 Apr 2019
 08:17:04 +0000
From: Matt Redfearn <matt.redfearn@thinci.com>
To: Andrzej Hajda <a.hajda@samsung.com>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Philippe Cornu <philippe.cornu@st.com>
Subject: [PATCH v2] drm/bridge/synopsys: dsi: Allow VPG to be enabled via
 debugfs
Thread-Topic: [PATCH v2] drm/bridge/synopsys: dsi: Allow VPG to be enabled via
 debugfs
Thread-Index: AQHU/y0X85i6EeTE0U60zrEiE1o5cg==
Date: Tue, 30 Apr 2019 08:17:04 +0000
Message-ID: <20190430081646.23845-1-matt.redfearn@thinci.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: DB6P195CA0006.EURP195.PROD.OUTLOOK.COM (2603:10a6:4:cb::16)
 To MAXPR01MB3773.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:64::20)
x-ms-exchange-messagesentrepresentingtype: 1
x-mailer: git-send-email 2.17.1
x-originating-ip: [87.242.198.86]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6559e8f4-9d5f-46bd-4cd7-08d6cd443a34
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MAXPR01MB2864; 
x-ms-traffictypediagnostic: MAXPR01MB2864:
x-microsoft-antispam-prvs: <MAXPR01MB28644A0AEA1A9C90343BDDE0F13A0@MAXPR01MB2864.INDPRD01.PROD.OUTLOOK.COM>
x-ms-oob-tlc-oobclassifiers: OLM:4714;
x-forefront-prvs: 00235A1EEF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10019020)(39840400004)(366004)(136003)(396003)(346002)(376002)(199004)(189003)(66946007)(68736007)(97736004)(25786009)(14454004)(66066001)(8936002)(5660300002)(81166006)(71200400001)(8676002)(1076003)(50226002)(478600001)(81156014)(66446008)(66556008)(66476007)(73956011)(53936002)(4326008)(71190400001)(110136005)(54906003)(64756008)(316002)(99286004)(6512007)(52116002)(486006)(26005)(386003)(6506007)(7416002)(2616005)(36756003)(476003)(256004)(186003)(5024004)(14444005)(6486002)(6436002)(102836004)(305945005)(7736002)(2906002)(6116002)(3846002);
 DIR:OUT; SFP:1102; SCL:1; SRVR:MAXPR01MB2864;
 H:MAXPR01MB3773.INDPRD01.PROD.OUTLOOK.COM; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: thinci.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: ZFn5nMroDhE+ZWXiqjgPtEX5DJWAEYJx6hoNjDns8o8/i29tKR5GW87ewF/4WrVjWrLL1fFzwZRk+/K/2tZljW8X4P0Pnxta3iY7ZKHiFkKqCP96lB/EzPI9Gc3G2AHenpCre+1rsc+QK7xLrUV2l4aNeZlEMb14osW6bVa+6rjJ24Dm5KSlstkGPM0admJF8UIK62J/a2C8P/zp2rLtXyIe/iEVAi9Fwie3BsrAozvBrFTUkGXvxwB22VaahwCvUS9ftSC0tyQO1oVz73bvhJd9CY05HBQ+V7DtcSpZvc/4vY7V5bP4jIeiaOfRSH1Cps6hIbx5ZLy3Dqpc2m1qk+COBoWeDEPMhjrL+IOC5vthlh08Rs+SLKfa/kW3z6v4L8qXyg1Manyh6o2h8CKhhOxjAa8rBYshZTfic8BYPpg=
MIME-Version: 1.0
X-OriginatorOrg: thinci.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6559e8f4-9d5f-46bd-4cd7-08d6cd443a34
X-MS-Exchange-CrossTenant-originalarrivaltime: 30 Apr 2019 08:17:04.2914 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 9d1c3c89-8615-4064-88a7-bb1a8537c779
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAXPR01MB2864
X-TMASE-Version: StarCloud-1.3-8.2.1013-24582.005
X-TMASE-Result: 10--9.128500-4.000000
X-TMASE-MatchedRID: nGppxvS+IHPR4xvaZ9xZ8Vz+axQLnAVBSjyMfjCRfaN4+LtSkGbmRCHa
 aMcDmXB8BBpBXZf7YnUzZe+o7AuU8Fgh7i+m6ZSoQ4srjeRbxTZMkOX0UoduuUYvSDWdWaRhvhz
 rAO0tfOGNa38iHcumyZE+qu86ckW2MDQQSfAWi0UjRwcsjqWGApnaxzJFBx6vFLXUWU5hGiF7+y
 KPdawX8BMn1w92ZWV2V1M/l3DgYRGw8kFTdnBpUcnlbo5l7mGF97DDOyJXCvCur1HD2qZWmBv/r
 jinePEHJkTkP3kjv4h+NZ4lfSsps4f1OcQR3MITEzQnFLEeMUndB/CxWTRRu25FeHtsUoHuUrFm
 wQyEzhCd8GFbBUTB/TVBAMAoIf4wC80R8ph3RCtLDBwYotNgRw==
X-TM-Deliver-Signature: 4264680189D75E601961A73C5D6DB708
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=thinciit.onmicrosoft.com; s=selector1-thinci-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xPYLmowVYQ02EvrAA3jHGiyQaBFwbFriXrHDk92xRuw=;
 b=d2OI9BHal8v0r/0hMwFAtAynvImlvGzHqchZ8HFfQm+D/vwIaQG+beGI9e1weEUXSWfF7ZBd8htHUVz8otjH4ZuhGNyB7oaRQEkiEpk01N/m10WCC3rvF/oRPDASJq/ZUpWbZFPtfVMaMC1or8LiiZC29B04HvKPmMyFuMcw3SY=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=matthew.redfearn@thinci.com; 
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
Cc: Archit Taneja <architt@codeaurora.org>, David Airlie <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Matthew Redfearn <matthew.redfearn@thinci.com>,
 Nickey Yang <nickey.yang@rock-chips.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VGhlIFN5bm9wc3lzIE1JUEkgRFNJIElQIGNvbnRhaW5zIGEgdmlkZW8gdGVzdCBwYXR0ZXJuIGdl
bmVyYXRvciB3aGljaAppcyBoZWxwZnVsIGluIGRlYnVnZ2luZyB2aWRlbyB0aW1pbmcgd2l0aCBj
b25uZWN0ZWQgZGlzcGxheXMuCkFkZCBhIGRlYnVnZnMgZGlyZWN0b3J5IGNvbnRhaW5pbmcgZmls
ZXMgd2hpY2ggYWxsb3cgdGhlIFZQRyB0byBiZQplbmFibGVkIGFuZCBkaXNhYmxlZCwgYW5kIGl0
cyBvcmllbnRhdGlvbiB0byBiZSBjaGFuZ2VkLgoKU2lnbmVkLW9mZi1ieTogTWF0dCBSZWRmZWFy
biA8bWF0dC5yZWRmZWFybkB0aGluY2kuY29tPgoKLS0tCgpDaGFuZ2VzIGluIHYyOgotIEVuc3Vy
ZSBkd19taXBpX2RzaV92aWRlb19tb2RlX2NvbmZpZygpIGRvZXNuJ3QgYnJlYWsgd2l0aG91dCBD
T05GSUdfREVCVUdfRlMKLSBUaWR5IHVwIGluaXRpYWxpc2F0aW9uIC8gdGlkeSB1cCBvZiBkZWJ1
Z2ZzCgogZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5vcHN5cy9kdy1taXBpLWRzaS5jIHwgNDcg
KysrKysrKysrKysrKysrKysrKwogMSBmaWxlIGNoYW5nZWQsIDQ3IGluc2VydGlvbnMoKykKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMg
Yi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL3N5bm9wc3lzL2R3LW1pcGktZHNpLmMKaW5kZXggMGVl
NDQwMjE2YjguLmJmZmVlZjdhNmNjIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vYnJpZGdl
L3N5bm9wc3lzL2R3LW1pcGktZHNpLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9zeW5v
cHN5cy9kdy1taXBpLWRzaS5jCkBAIC0xMCw2ICsxMCw3IEBACiAKICNpbmNsdWRlIDxsaW51eC9j
bGsuaD4KICNpbmNsdWRlIDxsaW51eC9jb21wb25lbnQuaD4KKyNpbmNsdWRlIDxsaW51eC9kZWJ1
Z2ZzLmg+CiAjaW5jbHVkZSA8bGludXgvaW9wb2xsLmg+CiAjaW5jbHVkZSA8bGludXgvbW9kdWxl
Lmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfZGV2aWNlLmg+CkBAIC04Niw2ICs4Nyw4IEBACiAjZGVm
aW5lIFZJRF9NT0RFX1RZUEVfTk9OX0JVUlNUX1NZTkNfRVZFTlRTCTB4MQogI2RlZmluZSBWSURf
TU9ERV9UWVBFX0JVUlNUCQkJMHgyCiAjZGVmaW5lIFZJRF9NT0RFX1RZUEVfTUFTSwkJCTB4Mwor
I2RlZmluZSBWSURfTU9ERV9WUEdfRU5BQkxFCQlCSVQoMTYpCisjZGVmaW5lIFZJRF9NT0RFX1ZQ
R19IT1JJWk9OVEFMCQlCSVQoMjQpCiAKICNkZWZpbmUgRFNJX1ZJRF9QS1RfU0laRQkJMHgzYwog
I2RlZmluZSBWSURfUEtUX1NJWkUocCkJCQkoKHApICYgMHgzZmZmKQpAQCAtMjM0LDYgKzIzNywx
MyBAQCBzdHJ1Y3QgZHdfbWlwaV9kc2kgewogCXUzMiBmb3JtYXQ7CiAJdW5zaWduZWQgbG9uZyBt
b2RlX2ZsYWdzOwogCisjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCisJc3RydWN0IGRlbnRyeSAqZGVi
dWdmczsKKworCWJvb2wgdnBnOworCWJvb2wgdnBnX2hvcml6b250YWw7CisjZW5kaWYgLyogQ09O
RklHX0RFQlVHX0ZTICovCisKIAlzdHJ1Y3QgZHdfbWlwaV9kc2kgKm1hc3RlcjsgLyogZHVhbC1k
c2kgbWFzdGVyIHB0ciAqLwogCXN0cnVjdCBkd19taXBpX2RzaSAqc2xhdmU7IC8qIGR1YWwtZHNp
IHNsYXZlIHB0ciAqLwogCkBAIC01MjUsNiArNTM1LDEzIEBAIHN0YXRpYyB2b2lkIGR3X21pcGlf
ZHNpX3ZpZGVvX21vZGVfY29uZmlnKHN0cnVjdCBkd19taXBpX2RzaSAqZHNpKQogCWVsc2UKIAkJ
dmFsIHw9IFZJRF9NT0RFX1RZUEVfTk9OX0JVUlNUX1NZTkNfRVZFTlRTOwogCisjaWZkZWYgQ09O
RklHX0RFQlVHX0ZTCisJaWYgKGRzaS0+dnBnKSB7CisJCXZhbCB8PSBWSURfTU9ERV9WUEdfRU5B
QkxFOworCQl2YWwgfD0gZHNpLT52cGdfaG9yaXpvbnRhbCA/IFZJRF9NT0RFX1ZQR19IT1JJWk9O
VEFMIDogMDsKKwl9CisjZW5kaWYgLyogQ09ORklHX0RFQlVHX0ZTICovCisKIAlkc2lfd3JpdGUo
ZHNpLCBEU0lfVklEX01PREVfQ0ZHLCB2YWwpOwogfQogCkBAIC05MzUsNiArOTUyLDMzIEBAIHN0
YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2JyaWRnZV9mdW5jcyBkd19taXBpX2RzaV9icmlkZ2VfZnVu
Y3MgPSB7CiAJLmF0dGFjaAkgICAgICA9IGR3X21pcGlfZHNpX2JyaWRnZV9hdHRhY2gsCiB9Owog
CisjaWZkZWYgQ09ORklHX0RFQlVHX0ZTCisKK3N0YXRpYyB2b2lkIGR3X21pcGlfZHNpX2RlYnVn
ZnNfaW5pdChzdHJ1Y3QgZHdfbWlwaV9kc2kgKmRzaSkKK3sKKwlkc2ktPmRlYnVnZnMgPSBkZWJ1
Z2ZzX2NyZWF0ZV9kaXIoZGV2X25hbWUoZHNpLT5kZXYpLCBOVUxMKTsKKwlpZiAoSVNfRVJSKGRz
aS0+ZGVidWdmcykpIHsKKwkJZGV2X2Vycihkc2ktPmRldiwgImZhaWxlZCB0byBjcmVhdGUgZGVi
dWdmcyByb290XG4iKTsKKwkJcmV0dXJuOworCX0KKworCWRlYnVnZnNfY3JlYXRlX2Jvb2woInZw
ZyIsIDA2NjAsIGRzaS0+ZGVidWdmcywgJmRzaS0+dnBnKTsKKwlkZWJ1Z2ZzX2NyZWF0ZV9ib29s
KCJ2cGdfaG9yaXpvbnRhbCIsIDA2NjAsIGRzaS0+ZGVidWdmcywKKwkJCSAgICAmZHNpLT52cGdf
aG9yaXpvbnRhbCk7Cit9CisKK3N0YXRpYyB2b2lkIGR3X21pcGlfZHNpX2RlYnVnZnNfcmVtb3Zl
KHN0cnVjdCBkd19taXBpX2RzaSAqZHNpKQoreworCWRlYnVnZnNfcmVtb3ZlX3JlY3Vyc2l2ZShk
c2ktPmRlYnVnZnMpOworfQorCisjZWxzZQorCitzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9kZWJ1
Z2ZzX2luaXQoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpIHsgfQorc3RhdGljIHZvaWQgZHdfbWlw
aV9kc2lfZGVidWdmc19yZW1vdmUoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpIHsgfQorCisjZW5k
aWYgLyogQ09ORklHX0RFQlVHX0ZTICovCisKIHN0YXRpYyBzdHJ1Y3QgZHdfbWlwaV9kc2kgKgog
X19kd19taXBpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpwZGV2LAogCQkgICAg
Y29uc3Qgc3RydWN0IGR3X21pcGlfZHNpX3BsYXRfZGF0YSAqcGxhdF9kYXRhKQpAQCAtMTAwNSw2
ICsxMDQ5LDcgQEAgX19kd19taXBpX2RzaV9wcm9iZShzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNlICpw
ZGV2LAogCQljbGtfZGlzYWJsZV91bnByZXBhcmUoZHNpLT5wY2xrKTsKIAl9CiAKKwlkd19taXBp
X2RzaV9kZWJ1Z2ZzX2luaXQoZHNpKTsKIAlwbV9ydW50aW1lX2VuYWJsZShkZXYpOwogCiAJZHNp
LT5kc2lfaG9zdC5vcHMgPSAmZHdfbWlwaV9kc2lfaG9zdF9vcHM7CkBAIC0xMDEyLDYgKzEwNTcs
NyBAQCBfX2R3X21pcGlfZHNpX3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYsCiAJ
cmV0ID0gbWlwaV9kc2lfaG9zdF9yZWdpc3RlcigmZHNpLT5kc2lfaG9zdCk7CiAJaWYgKHJldCkg
ewogCQlkZXZfZXJyKGRldiwgIkZhaWxlZCB0byByZWdpc3RlciBNSVBJIGhvc3Q6ICVkXG4iLCBy
ZXQpOworCQlkd19taXBpX2RzaV9kZWJ1Z2ZzX3JlbW92ZShkc2kpOwogCQlyZXR1cm4gRVJSX1BU
UihyZXQpOwogCX0KIApAQCAtMTAyOSw2ICsxMDc1LDcgQEAgc3RhdGljIHZvaWQgX19kd19taXBp
X2RzaV9yZW1vdmUoc3RydWN0IGR3X21pcGlfZHNpICpkc2kpCiAJbWlwaV9kc2lfaG9zdF91bnJl
Z2lzdGVyKCZkc2ktPmRzaV9ob3N0KTsKIAogCXBtX3J1bnRpbWVfZGlzYWJsZShkc2ktPmRldik7
CisJZHdfbWlwaV9kc2lfZGVidWdmc19yZW1vdmUoZHNpKTsKIH0KIAogdm9pZCBkd19taXBpX2Rz
aV9zZXRfc2xhdmUoc3RydWN0IGR3X21pcGlfZHNpICpkc2ksIHN0cnVjdCBkd19taXBpX2RzaSAq
c2xhdmUpCi0tIAoyLjE3LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2Ry
aS1kZXZlbA==
