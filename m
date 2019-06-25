Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6139F551A3
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2019 16:27:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D53F76E11C;
	Tue, 25 Jun 2019 14:26:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
 (mail-eopbgr730088.outbound.protection.outlook.com [40.107.73.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14E26E11C;
 Tue, 25 Jun 2019 14:26:58 +0000 (UTC)
Received: from DM5PR12MB1546.namprd12.prod.outlook.com (10.172.36.23) by
 DM5PR12MB1915.namprd12.prod.outlook.com (10.175.88.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2008.16; Tue, 25 Jun 2019 14:26:54 +0000
Received: from DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935]) by DM5PR12MB1546.namprd12.prod.outlook.com
 ([fe80::7d27:3c4d:aed6:2935%6]) with mapi id 15.20.2008.017; Tue, 25 Jun 2019
 14:26:54 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: Lucas Stach <l.stach@pengutronix.de>, "Wentland, Harry"
 <Harry.Wentland@amd.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "natechancellor@gmail.com" <natechancellor@gmail.com>
Subject: Re: [PATCH] drm/amd/display: Use msleep instead of udelay for 8ms wait
Thread-Topic: [PATCH] drm/amd/display: Use msleep instead of udelay for 8ms
 wait
Thread-Index: AQHVK16Svj0Y/YF920ebwK/y+5gVmKasaT2AgAAEDAA=
Date: Tue, 25 Jun 2019 14:26:54 +0000
Message-ID: <e4dafd8a-8d14-63cb-f793-4d784051d2a0@amd.com>
References: <CAPM=9txaQ43GwOzXSE3prTRLbMt+ip=s_ssmFzWsfsTYdLssaw@mail.gmail.com>
 <20190625140046.31682-1-harry.wentland@amd.com>
 <1561471935.2587.11.camel@pengutronix.de>
In-Reply-To: <1561471935.2587.11.camel@pengutronix.de>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM5PR0102CA0011.eurprd01.prod.exchangelabs.com
 (2603:10a6:206::24) To DM5PR12MB1546.namprd12.prod.outlook.com
 (2603:10b6:4:8::23)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5a7d670b-80bc-4abe-fc7f-08d6f9792b95
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1915; 
x-ms-traffictypediagnostic: DM5PR12MB1915:
x-microsoft-antispam-prvs: <DM5PR12MB1915233F47813131817EF3E283E30@DM5PR12MB1915.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8882;
x-forefront-prvs: 0079056367
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(366004)(39860400002)(396003)(136003)(376002)(346002)(189003)(199004)(53936002)(186003)(2201001)(65956001)(99286004)(4326008)(6506007)(386003)(86362001)(25786009)(6116002)(31696002)(6486002)(52116002)(6436002)(65806001)(76176011)(31686004)(229853002)(2906002)(71190400001)(478600001)(71200400001)(65826007)(72206003)(102836004)(6512007)(2501003)(6246003)(256004)(68736007)(5660300002)(7736002)(73956011)(66476007)(14454004)(66446008)(66556008)(66946007)(64756008)(36756003)(54906003)(110136005)(64126003)(58126008)(46003)(316002)(8676002)(8936002)(81166006)(81156014)(446003)(305945005)(11346002)(2616005)(476003)(486006)(14444005);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1915;
 H:DM5PR12MB1546.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 4i5XY2eknywjz0F0KOhSBYp5JUNU15ibn5SeNvmQlJBOff6h9XnB4ahz+d7X1ZNMg6KM91ML+PoVhYpUuCb1ORYFJOhYtrjzlPr2K1o3JPKDTFuesl61pwmT669BwWLWCewtwEqjwi4W73PmYsMQQUAddEI06z73lhAFhKrRdDifzF5zkyEtl/V1MZR6pcCGD8Fsa4qMdcDewG3Ti3g/hDKqqM/m07gZFFx7nc11jmEEbx+9BX5MOIxp2axi6I0Vi+9BJ4c34hQJqEwq2Narymb6Bpj3i1exf+Xxe8RwWyMkBOcktffhnZzRXKrWBm5hFkrMwg7j8pHjNmMH6eRBg4ZLGWTBfpu8XgMbPGt0avhCObOzk+vnWGi0WMDjjYiisZ9NkhI1e+MPiUiOAVUmjWIhsOrm04sdbXeGTl0exn0=
Content-ID: <8F90D05C997421459DAEF498451C0EF2@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a7d670b-80bc-4abe-fc7f-08d6f9792b95
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jun 2019 14:26:54.1656 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ckoenig@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1915
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6ZStuvMKBi2BKrtLe/Egtuhh8Ck6pOv83bCeEJHA2aw=;
 b=qvcVGZD7h/44+lZ3Do8HhC7DjgFogP/FIZENFgIS2pSJmIRqxP7hsy0M98JsST1rJp0uJS3BAvj+/lT4rd9A2t3mPOkfXcUjI2aoBsKaaMxJdpzXTResKBtTL52jdG7EOSCMJ3y/C0l5WFkQ/brlv6pAIJZQBZaNgXHPRmiGpM4=
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>, "Lakha,
 Bhawanpreet" <Bhawanpreet.Lakha@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Lei, Jun" <Jun.Lei@amd.com>, "Koo,
 Anthony" <Anthony.Koo@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjUuMDYuMTkgdW0gMTY6MTIgc2NocmllYiBMdWNhcyBTdGFjaDoNCj4gSGkgSGFycnksDQo+
DQo+IEFtIERpZW5zdGFnLCBkZW4gMjUuMDYuMjAxOSwgMTA6MDAgLTA0MDAgc2NocmllYiBIYXJy
eSBXZW50bGFuZDoNCj4+IGFybTMyJ3MgdWRlbGF5IG9ubHkgYWxsb3dzIHZhbHVlcyB1cCB0byAy
MDAwIG1pY3Jvc2Vjb25kcy4gbXNsZWVwDQo+PiBkb2VzIHRoZSB0cmljayBmb3IgdXMgaGVyZSBh
cyB0aGVyZSBpcyBubyBwcm9ibGVtIGlmIHRoaXMgaXNuJ3QNCj4+IG1pY3Jvc2Vjb25kIGFjY3Vy
YXRlIGFuZCB0YWtlcyBhIHRhZCBsb25nZXIuDQo+IEEgInRhZCIgbG9uZ2VyIGluIHRoaXMgY2Fz
ZSBtZWFucyBsaWtlbHkgZG91YmxlIHRoZSBpbnRlbmRlZCB3YWl0Lg0KPiBQbGVhc2Ugc2VlICJT
TEVFUElORyBGT1IgflVTRUNTIE9SIFNNQUxMIE1TRUNTICggMTB1cyAtIDIwbXMpIiBpbg0KPiBE
b2N1bWVudGF0aW9uL3RpbWVycy90aW1lcnMtaG93dG8udHh0Lg0KDQpPaCwgdGhhbmtzIHNvIG11
Y2ggZm9yIHRoZSBsaW5rISBJIHdhcyBzZWFyY2hpbmcgZGVzcGVyYXRlbHkgZm9yIHRoaXMgDQp0
aGUgbGFzdCB0aW1lIHRoaXMgY2FtZSB1cCBhbmQgY291bGRuJ3QgZmluZCBpdC4NCg0KQ2xlYXJs
eSBnb2luZyB0byByZW1lbWJlciBub3cgd2hlcmUgdG8gZmluZCB0aGF0Lg0KDQpUaGFua3MsDQpD
aHJpc3RpYW4uDQoNCj4NCj4gVGhlIHNsZWVwIGhlcmUgc2hvdWxkIHVzZSB1c2xlZXBfcmFuZ2Uu
IEluIGdlbmVyYWwgdGhlIERDIGNvZGUgc2VlbXMgdG8NCj4gdXNlIHF1aXRlIGEgbG90IG9mIHRo
ZSB1ZGVsYXkgYnVzeSB3YWl0cy4gSSBkb3VidCB0aGF0IG1hbnkgb2YgdGhvc2UNCj4gb2NjdXJy
ZW5jZXMgYXJlIGluIGF0b21pYyBjb250ZXh0LCBzbyBjb3VsZCBlYXNpbHkgdXNlIGEgc2xlZXBp
bmcgd2FpdC4NCj4NCj4gRGlnZ2luZyBmdXJ0aGVyIHRoaXMgc2VlbXMgdG8gYXBwbHkgYWNyb3Nz
IGFtZGdwdSwgbm90IG9ubHkgREMuDQo+DQo+IFJlZ2FyZHMsDQo+IEx1Y2FzDQo+DQo+PiBTaWdu
ZWQtb2ZmLWJ5OiBIYXJyeSBXZW50bGFuZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCj4+IC0t
LQ0KPj4gIMKgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jIHwg
MiArLQ0KPj4gIMKgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
DQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9jb3Jl
L2RjX2xpbmsuYw0KPj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19s
aW5rLmMNCj4+IGluZGV4IDRjMzE5MzBmMWNkZi4uZjVkMDJmODliM2Y5IDEwMDY0NA0KPj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGluay5jDQo+PiArKysg
Yi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rLmMNCj4+IEBAIC01
NDgsNyArNTQ4LDcgQEAgc3RhdGljIHZvaWQNCj4+IHJlYWRfZWRwX2N1cnJlbnRfbGlua19zZXR0
aW5nc19vbl9kZXRlY3Qoc3RydWN0IGRjX2xpbmsgKmxpbmspDQo+PiAgwqAJCQlicmVhazsNCj4+
ICDCoAkJfQ0KPj4gICANCj4+IC0JCXVkZWxheSg4MDAwKTsNCj4+ICsJCW1zbGVlcCg4KTsNCj4+
ICDCoAl9DQo+PiAgIA0KPj4gIMKgCUFTU0VSVChzdGF0dXMgPT0gRENfT0spOw0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGlu
ZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
