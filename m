Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CCA6185E0
	for <lists+dri-devel@lfdr.de>; Thu,  9 May 2019 09:18:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7174589862;
	Thu,  9 May 2019 07:18:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa2.microchip.iphmx.com (esa2.microchip.iphmx.com
 [68.232.149.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F28089815
 for <dri-devel@lists.freedesktop.org>; Wed,  8 May 2019 08:48:15 +0000 (UTC)
Received-SPF: Pass (esa2.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa2.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa2.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="5.60,445,1549954800"; d="scan'208";a="32284046"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
 08 May 2019 01:48:14 -0700
Received: from NAM04-BN3-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.76.49) with Microsoft SMTP Server (TLS) id
 14.3.352.0; Wed, 8 May 2019 01:48:14 -0700
Received: from MWHPR11MB1549.namprd11.prod.outlook.com (10.172.54.17) by
 MWHPR11MB1456.namprd11.prod.outlook.com (10.172.53.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1856.10; Wed, 8 May 2019 08:48:12 +0000
Received: from MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::f01a:9325:7a65:cdb4]) by MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::f01a:9325:7a65:cdb4%4]) with mapi id 15.20.1856.012; Wed, 8 May 2019
 08:48:12 +0000
From: <Claudiu.Beznea@microchip.com>
To: <lee.jones@linaro.org>
Subject: Re: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Thread-Topic: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Thread-Index: AQHU+2NzxFOsw6p3b0iYuTBfPVB4RaZg1lIAgAAoZAA=
Date: Wed, 8 May 2019 08:48:12 +0000
Message-ID: <d3d3006b-2c5b-6853-24bb-330d539574cf@microchip.com>
References: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
 <20190508062328.GD7627@dell>
In-Reply-To: <20190508062328.GD7627@dell>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: LO2P265CA0039.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:61::27) To MWHPR11MB1549.namprd11.prod.outlook.com
 (2603:10b6:301:c::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190508114802932
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 60b25708-bc95-46ed-d276-08d6d391e703
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(2017052603328)(7193020);
 SRVR:MWHPR11MB1456; 
x-ms-traffictypediagnostic: MWHPR11MB1456:
x-ms-exchange-purlcount: 2
x-microsoft-antispam-prvs: <MWHPR11MB145666650FDF370789B1DDFF87320@MWHPR11MB1456.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 0031A0FFAF
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(346002)(396003)(39860400002)(136003)(376002)(189003)(199004)(72206003)(66066001)(5660300002)(73956011)(478600001)(2616005)(66446008)(52116002)(66946007)(66476007)(71190400001)(966005)(256004)(86362001)(14444005)(6486002)(31696002)(229853002)(53936002)(64756008)(486006)(81156014)(68736007)(3846002)(6916009)(6116002)(476003)(6512007)(11346002)(6306002)(446003)(8676002)(81166006)(386003)(14454004)(7416002)(4744005)(102836004)(76176011)(7736002)(6246003)(54906003)(316002)(8936002)(71200400001)(25786009)(2906002)(186003)(305945005)(99286004)(36756003)(6436002)(31686004)(26005)(6506007)(53546011)(66556008)(4326008);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB1456;
 H:MWHPR11MB1549.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 1UHy7Mt6CsHZhYFE+9dAzudK6ztymjhTGAm3O/SIW4uHysZG3K1Qh6x/fzCBTiwvoWG1OVX8vEV+TB1/rwEAJGb3JFORZRf+dqINS59gRBeshBvgVXz8vJvdzY2GyM+JLTeEmBme4mwh1vyqQ3CYiAVMSADORt+t7BYc6HRGWrlAfiaZfpM+oPjIfSKEqqDzTEk9fCjv1xzWHFXM19Kx41kcwmraj3x48Jq4L3imGBjEnMsPj5G39rjASUPVqcyjZpS68CBNPslAXg9bRNEDB2yDr9lr2bAIjarETp7dGEGQak9kImH4ycYs/WiTVwAdcXI/E35MO4dQdbp9FDyA5XqPf87S1cUnX7HVZkW6+wmRvgXSQCfQFya+obvuwLjXBlCIW2zJw7vzIcRwNPZsx+WNLnFxLdfG83uTgljptF4=
Content-ID: <2E229381D7A6A54F876CA1F7D16DEDA1@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 60b25708-bc95-46ed-d276-08d6d391e703
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 May 2019 08:48:12.3543 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1456
X-OriginatorOrg: microchip.com
X-Mailman-Approved-At: Thu, 09 May 2019 07:18:00 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cV4pulITiLsJ9iV4m9L9W1h57U4Twyk4UpZMQ5s5cx8=;
 b=kn7w9fyJbkQ2qT66yB4wIIZWH2ot4x4VyVgI7o18IiPlge5MmF2jcujOFnHw4DmlTiJ4WKL2pSRlccaY6sxLJsWLGKalh43rh7xnGjcjVzyDPO3/T9U13IPXIZ23iFW+iSyh5ZrEgaXVWoDEH6/bHvAVk+r0dnJok7+Dp/bfdiI=
X-Mailman-Original-Authentication-Results: esa2.microchip.iphmx.com; spf=Pass
 smtp.mailfrom=Claudiu.Beznea@microchip.com;
 spf=None smtp.helo=postmaster@email.microchip.com;
 dkim=pass (signature verified) header.i=@microchiptechnology.onmicrosoft.com;
 dmarc=pass (p=none dis=none) d=microchip.com
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
Cc: linux-pwm@vger.kernel.org, alexandre.belloni@bootlin.com,
 bbrezillon@kernel.org, airlied@linux.ie, Nicolas.Ferre@microchip.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ludovic.Desroches@microchip.com, thierry.reding@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDA4LjA1LjIwMTkgMDk6MjMsIExlZSBKb25lcyB3cm90ZToNCj4gRXh0ZXJuYWwgRS1N
YWlsDQo+IA0KPiANCj4+ICBkcml2ZXJzL2dwdS9kcm0vYXRtZWwtaGxjZGMvYXRtZWxfaGxjZGNf
Y3J0Yy5jICB8ICAxOCArKy0tDQo+PiAgZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVs
X2hsY2RjX2RjLmMgICAgfCAxMjAgKysrKysrKysrKysrKysrKysrKysrKystDQo+PiAgZHJpdmVy
cy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2RjLmggICAgfCAgIDIgKw0KPj4gIGRy
aXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19wbGFuZS5jIHwgICAyICstDQo+
PiAgZHJpdmVycy9wd20vcHdtLWF0bWVsLWhsY2RjLmMgICAgICAgICAgICAgICAgICAgfCAgIDEg
Kw0KPj4gIDUgZmlsZXMgY2hhbmdlZCwgMTMyIGluc2VydGlvbnMoKyksIDExIGRlbGV0aW9ucygt
KQ0KPiANCj4gTm90IHN1cmUgd2h5IEkgYW0gcmVjZWl2aW5nIHRoaXMgc2V0Lg0KDQpUaGllcnJ5
IHN1Z2dlc3RlZCBpbiB2MSBvZiB0aGlzIHNlcmllcyB0byB0YWtlIHB3bS1hdG1lbC1obGNkYy5j
IGNoYW5nZXMNCnRob3VnaCBNRkQgdHJlZSBbMV0uIFRoZW4sIGluIHYyIHlvdSBhc2sgbWUgdG8g
ZG8gdXBkYXRlIGEgYml0IHRoZSBjaGFuZ2VzDQppbiBwd20tYXRtZWwtaGxjZGMuYyBbMl0uIEkg
c2VuZCBhbGwgdGhlIHBhdGNoZXMgaW4gb25lIHNob3Qgc28gdGhhdCB0aGUNCmNvbnRleHQgdG8g
YmUgbW9yZSBvYnZpb3VzLiBTb3JyeSBmb3IgdGhlIG5vaXNlLCBpZiBhbnkuDQoNClsxXSBodHRw
czovL2xvcmUua2VybmVsLm9yZy9sa21sLzIwMTkwMzA0MTEwNTE3LkdCNTEyMUB1bG1vLw0KWzJd
IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAxOTA0MjUwODMxMzIuR0QxNDc1OEBkZWxs
Lw0KDQo+IENvdWxkIHlvdSBwbGVhc2UgZHJvcCBtZSBmcm9tIGZ1dHVyZSBzdWJtaXNzaW9ucy4N
Cj4gDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
