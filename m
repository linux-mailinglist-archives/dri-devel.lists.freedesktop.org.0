Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D595F36CBD
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jun 2019 09:03:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E63B89395;
	Thu,  6 Jun 2019 07:03:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa4.microchip.iphmx.com (esa4.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7E5A895E7
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jun 2019 08:40:00 +0000 (UTC)
Received-SPF: Pass (esa4.microchip.iphmx.com: domain of
 Claudiu.Beznea@microchip.com designates 198.175.253.82 as
 permitted sender) identity=mailfrom;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="Claudiu.Beznea@microchip.com";
 x-conformance=spf_only; x-record-type="v=spf1";
 x-record-text="v=spf1 mx a:ushub1.microchip.com
 a:smtpout.microchip.com a:mx1.microchip.iphmx.com
 a:mx2.microchip.iphmx.com include:servers.mcsv.net
 include:mktomail.com include:spf.protection.outlook.com ~all"
Received-SPF: None (esa4.microchip.iphmx.com: no sender
 authenticity information available from domain of
 postmaster@email.microchip.com) identity=helo;
 client-ip=198.175.253.82; receiver=esa4.microchip.iphmx.com;
 envelope-from="Claudiu.Beznea@microchip.com";
 x-sender="postmaster@email.microchip.com"; x-conformance=spf_only
X-IronPort-AV: E=Sophos;i="5.60,550,1549954800"; d="scan'208";a="35658394"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 05 Jun 2019 01:40:00 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex03.mchp-main.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1713.5; Wed, 5 Jun 2019 01:39:59 -0700
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.1.1713.5 via Frontend
 Transport; Wed, 5 Jun 2019 01:39:59 -0700
Received: from MWHPR11MB1549.namprd11.prod.outlook.com (10.172.54.17) by
 MWHPR11MB1326.namprd11.prod.outlook.com (10.169.232.135) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1965.12; Wed, 5 Jun 2019 08:39:54 +0000
Received: from MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::316b:7774:8db6:30ec]) by MWHPR11MB1549.namprd11.prod.outlook.com
 ([fe80::316b:7774:8db6:30ec%7]) with mapi id 15.20.1943.018; Wed, 5 Jun 2019
 08:39:54 +0000
From: <Claudiu.Beznea@microchip.com>
To: <sam@ravnborg.org>
Subject: Re: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Thread-Topic: [RESEND][PATCH v3 0/6] add LCD support for SAM9X60
Thread-Index: AQHU+2NzxFOsw6p3b0iYuTBfPVB4RaZgDjOAgCvdRQCAAF3mAIAAtEsA
Date: Wed, 5 Jun 2019 08:39:54 +0000
Message-ID: <b0c867a3-4bb1-4e3d-cfa1-803c5a8bd607@microchip.com>
References: <1556195748-11106-1-git-send-email-claudiu.beznea@microchip.com>
 <20190507182713.GA16862@ravnborg.org>
 <c361b013-2d98-76e3-d30f-cec83000933c@microchip.com>
 <20190604215424.GA1959@ravnborg.org>
In-Reply-To: <20190604215424.GA1959@ravnborg.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: VI1PR0701CA0035.eurprd07.prod.outlook.com
 (2603:10a6:800:90::21) To MWHPR11MB1549.namprd11.prod.outlook.com
 (2603:10b6:301:c::17)
x-ms-exchange-messagesentrepresentingtype: 1
x-tagtoolbar-keys: D20190605113942134
x-originating-ip: [94.177.32.154]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c743e925-6302-4e2f-aa4a-08d6e991616f
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(5600148)(711020)(4605104)(1401327)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7193020);
 SRVR:MWHPR11MB1326; 
x-ms-traffictypediagnostic: MWHPR11MB1326:
x-microsoft-antispam-prvs: <MWHPR11MB1326D74F8A03D2FC0CDC7CFE87160@MWHPR11MB1326.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 00594E8DBA
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(346002)(396003)(136003)(39860400002)(376002)(366004)(199004)(189003)(51914003)(54534003)(99286004)(72206003)(25786009)(76176011)(102836004)(52116002)(53936002)(6246003)(54906003)(6436002)(386003)(3846002)(6506007)(53546011)(14454004)(86362001)(6116002)(4326008)(478600001)(31686004)(68736007)(6512007)(8676002)(81156014)(316002)(4744005)(5660300002)(2906002)(8936002)(229853002)(6916009)(81166006)(305945005)(7416002)(6486002)(7736002)(31696002)(66946007)(66556008)(476003)(66446008)(64756008)(486006)(11346002)(446003)(2616005)(26005)(186003)(71190400001)(71200400001)(66066001)(256004)(36756003)(14444005)(73956011)(66476007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MWHPR11MB1326;
 H:MWHPR11MB1549.namprd11.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: microchip.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: M1yxJD/fVKbJnYeHu3n+jVJgevYSam8IO4vG78CJ0uyYzDrupTg6oAmq73fJLejTzF5egI/R9hVx1fSB5WT5VMLaHBlFkereLI+/UmDzzyojkRn1SchKRyRb/ILXKWHnH74TiZoAy5fJDdnu9puYunoYDpjSE/v9ixLO9gtOCMJEK/xBKi+eUXJAFSa1bqqOp2RpRSGdrBiEdcgubzyK9IeB/WtaZ9SbjhKBpCFIdjEMrCxJgzZth5vZGDiTfGgn0ao1mx3mI3Bpj4IQzNyaCzO3Ni1OQt8XTUQvayzpzuJTak0A3UlBUtn204guwj7GEI8y9ZmoMPw0lPzsZz0xCn1rKgwnAt1w+n26lxHyTxmm7fnTp3SikuQJbOn2WWvQDhJQCxCUD5fQXTetKSUVXtWd18T/G0dWDmMzafJDQik=
Content-ID: <FEB6224F58D15849822188E05B50093F@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: c743e925-6302-4e2f-aa4a-08d6e991616f
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Jun 2019 08:39:54.1417 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: claudiu.beznea@microchip.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR11MB1326
X-Mailman-Approved-At: Thu, 06 Jun 2019 07:03:45 +0000
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector1-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sZ4kuQTYUGt9Re2dSCz1OsSrPeQ3KrZk3vR8EDZGnjs=;
 b=mk3PlU3jHSkNsBs5aaz5xzCuVum11zhv3rE6OW/yeE+lGR5LzkjSaY2cUhU4ZOC0gngXYIpYmi1Je2xJjtwjfSc0PmugPcauYGF7Y0If92Te6ipv2WHnY4Pvk/D/XivfBGA+7OrPSRoTW9DURikH+vfopjVMdCNYyJbpW1UvXtM=
X-Mailman-Original-Authentication-Results: esa4.microchip.iphmx.com; spf=Pass
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
 bbrezillon@kernel.org, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Ludovic.Desroches@microchip.com,
 thierry.reding@gmail.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCk9uIDA1LjA2LjIwMTkgMDA6NTQsIFNhbSBSYXZuYm9yZyB3cm90ZToNCj4gSGkgQ2xhdWRp
dS4NCj4gDQo+IE9uIFR1ZSwgSnVuIDA0LCAyMDE5IGF0IDA0OjE4OjMzUE0gKzAwMDAsIENsYXVk
aXUuQmV6bmVhQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBIaSBTYW0sDQo+Pg0KPj4gT24gMDcu
MDUuMjAxOSAyMToyNywgU2FtIFJhdm5ib3JnIHdyb3RlOg0KPj4+IEV4dGVybmFsIEUtTWFpbA0K
Pj4+DQo+Pj4NCj4+PiBIaSBUaGllcnJ5Lg0KPj4+DQo+Pj4+ICAgcHdtOiBhdG1lbC1obGNkYzog
YWRkIGNvbXBhdGlibGUgZm9yIFNBTTlYNjAgSExDREMncyBQV00NCj4+PiBPSyB0byBhZGQgdGhl
ICJwd206IGF0bWVsLWhsY2RjOiBhZGQgY29tcGF0aWJsZSBmb3IgU0FNOVg2MCBITENEQydzIFBX
TSINCj4+PiBwYXRjaCB2aWEgZHJtLW1pc2M/DQo+Pj4gVGhlbiB3ZSBjYW4gYWRkIGFsbCA2IHBh
dGNoZXMgaW4gb25lIGdvLg0KPj4NCj4+IFNpbmNlIHdlIGRvbid0IGhhdmUgYW4gYW5zd2VyIGZy
b20gVGhpZXJyeSB0aWxsIG5vdywgZG8geW91IHRoaW5rIGl0IGNvdWxkDQo+PiBiZSBmZWFzaWJs
ZSB0byB0YWtlIHRoZSByZXN0IG9mIHRoZSBwYXRjaGVzIGluIHRoaXMgc2VyaWVzPyBBZnRlciB0
aGF0IEkNCj4+IHdpbGwgcmUtc2VuZCB0aGUgUFdNIHBhdGNoIHRvIFBXTSBsaXN0Lg0KPiANCj4g
VGhhbmtzIGZvciB0aGUgcmVtaW5kZXIuDQo+IA0KPiBQYXRjaGVzIDEsMiBhbmQgNCw1LDYgYXBw
bGllZCB0byBkcm0tbWlzYy1uZXh0Lg0KPiANCj4gUmV3b3JkZWQgY2hhbmdlbG9nIGEgYml0IGlu
IHBhdGNoIDYuDQoNClRoYW5rIHlvdSwNCkNsYXVkaXUNCg0KPiANCj4gCVNhbQ0KPiANCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWls
aW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
