Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833C721806
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2019 14:13:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DE389165;
	Fri, 17 May 2019 12:13:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-CY1-obe.outbound.protection.outlook.com
 (mail-eopbgr760084.outbound.protection.outlook.com [40.107.76.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2182789165
 for <dri-devel@lists.freedesktop.org>; Fri, 17 May 2019 12:13:08 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1417.namprd12.prod.outlook.com (10.168.236.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1900.17; Fri, 17 May 2019 12:13:06 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::e1b1:5b6f:b2df:afa5%7]) with mapi id 15.20.1900.010; Fri, 17 May 2019
 12:13:06 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, "Zhou,
 David(ChunMing)" <David1.Zhou@amd.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>
Subject: Re: [PATCH libdrm] enable syncobj test depending on capability
Thread-Topic: [PATCH libdrm] enable syncobj test depending on capability
Thread-Index: AQHVDJWTLZn3VbwLLUy820kx/faniKZvFDcAgAAmWYA=
Date: Fri, 17 May 2019 12:13:06 +0000
Message-ID: <dd6450e5-a622-94bb-9bef-bed7dd901af8@amd.com>
References: <20190516104642.21450-1-david1.zhou@amd.com>
 <278437b6-c5f0-209b-443b-573b4143f944@amd.com>
 <-yw2q6u7xkjpo-i83eg9msudz1wgjn7w-b101h0-sfv5ag1noxjz2wg54r-iuw7ml-f519uls55cqypexnfa-et96uc-nx96jg5fu1d3-wn1hxg-td9bpo5n1nbv-wmnwfr84y609mm8lnpxqaf92-n4k5l3.1558004611599@email.android.com>
 <144963b9-d1e5-2afb-c02e-58dd6ba19a3e@amd.com>
 <f80c8b88-1dad-26ae-4de2-ec5e3fac289d@daenzer.net>
In-Reply-To: <f80c8b88-1dad-26ae-4de2-ec5e3fac289d@daenzer.net>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM6PR0102CA0015.eurprd01.prod.exchangelabs.com
 (2603:10a6:209:14::28) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee031be6-d731-4c51-f867-08d6dac104b9
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600141)(711020)(4605104)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1417; 
x-ms-traffictypediagnostic: DM5PR12MB1417:
x-ms-exchange-purlcount: 1
x-microsoft-antispam-prvs: <DM5PR12MB1417B41CF3D632C602D49003830B0@DM5PR12MB1417.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0040126723
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(396003)(346002)(136003)(376002)(39850400004)(366004)(189003)(199004)(6436002)(316002)(46003)(5660300002)(64126003)(186003)(66946007)(68736007)(6306002)(6512007)(36756003)(486006)(66446008)(64756008)(66556008)(66476007)(446003)(478600001)(8676002)(11346002)(2616005)(25786009)(102836004)(476003)(8936002)(81166006)(81156014)(73956011)(65826007)(53936002)(2906002)(4326008)(6246003)(31696002)(53546011)(305945005)(52116002)(6506007)(386003)(7736002)(99286004)(76176011)(110136005)(71190400001)(229853002)(58126008)(71200400001)(31686004)(86362001)(6116002)(256004)(66574012)(14444005)(6636002)(65806001)(14454004)(6486002)(65956001)(966005)(4744005)(72206003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1417;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: lHCnuqR6lPs+tgxydEEA+JBtNbVNERmxwV/zWp/lDwZlYHtkGnu1KwSrZlafQg/ovwYugAA7JTknQJ+Qcsa5MK/xLxZBU8qoXPgZC+cMq1zxhcW4zXmqKf4HsGAx6I7fx2fGkKK3v1qoKaS+zrjanSxtRxBYr6QniZEZq7ugah+V0e163qGYhYzio9Y6FYc1uVUQVeRtHg45lftIdp5lLHtmX3CfCv7rlfNqxxIfPvVEIm/K+VwX2g48XBfUjFqUMpCYK/idtpav9CLuwG+Ohd+8arJAHGptSuDs4hi3zNr6BwI2xf1yUUHRgL0sH8vXrbNR9tg8pxA/sw/ojAmW0RKjtAAzs0szObfouywyJCZfp7spPtJ7Vi4nAzgNV8T7lxBRaLEtShTpkAhWCA8sqpVO/2VSMoLOSB5WmztTyUA=
Content-ID: <AF6B3FFE247EA04299524E7B239E0AC5@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee031be6-d731-4c51-f867-08d6dac104b9
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 May 2019 12:13:06.5386 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1417
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6/o/dw7xMWdTHpfBUVEZM8BYL90NUM0EosjvK/2J2EQ=;
 b=h4LoBUMQIpYzU6S/2YldtUKb92tor75XDY/J2RprnsS7ll8Wt8DVjKJ1qHz/Lnr6wJ6uhRNadEzs0BqYuvna7NoJSuzqp0bZQIxxzpy8nqvjF+0Vxn46I3CYZtEPTYrl3g46EPT7PXi1dBP/dU+ZAGu6JjqCUiqO+wQ9vHjoo80=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Christian.Koenig@amd.com; 
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMTcuMDUuMTkgdW0gMTE6NTUgc2NocmllYiBNaWNoZWwgRMOkbnplcjoNCj4gW0NBVVRJT046
IEV4dGVybmFsIEVtYWlsXQ0KPg0KPiBPbiAyMDE5LTA1LTE3IDExOjQ3IGEubS4sIHpob3VjbTEg
d3JvdGU6DQo+PiBwaW5nLCBDb3VsZCB5b3UgaGVscCBjaGVjayBpbiBwYXRjaCB0byBnaXRsYWI/
IE15IGNvbm5lY3Rpb24gdG8gZ2l0bGFiDQo+PiBzdGlsbCBoYXMgcHJvYmxlbS4NCj4gUGxlYXNl
IGZvbGxvdyB0aGUgcHJvY2VzcyBkb2N1bWVudGVkIGluIGluY2x1ZGUvZHJtL1JFQURNRSBmb3IN
Cj4gaW5jbHVkZS9kcm0vZHJtLmggLg0KDQpZZWFoLCB0aGUgaGVhZGVyIHNob3VsZCBiZSB1cGRh
dGVkIHNlcGFyYXRlbHkgdG8gd2hhdCBpcyBjdXJyZW50bHkgaW4gDQpkcm0tbmV4dCAob3IgZHJt
LW1pc2MtbmV4dCkuDQoNCkFuZCB0aGVuIHdlIGNhbiB1cGRhdGUgdGhlIGZpeCBvbiB0b3Agb2Yg
dGhhdCwNCkNocmlzdGlhbi4NCg0KPg0KPg0KPiAtLQ0KPiBFYXJ0aGxpbmcgTWljaGVsIETDpG56
ZXIgICAgICAgICAgICAgICB8ICAgICAgICAgICAgICBodHRwczovL3d3dy5hbWQuY29tDQo+IExp
YnJlIHNvZnR3YXJlIGVudGh1c2lhc3QgICAgICAgICAgICAgfCAgICAgICAgICAgICBNZXNhIGFu
ZCBYIGRldmVsb3Blcg0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
