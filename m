Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D12585C96
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 10:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8EB46E7DF;
	Thu,  8 Aug 2019 08:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr720066.outbound.protection.outlook.com [40.107.72.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15056E6E0;
 Thu,  8 Aug 2019 08:14:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DMpwCw+HBIyfwGrqCDaPWaQ9lsoe0LvkfQnEmHdo97o37EtOSXRz6U+YATMeXiy+nN9YydYmRJzu3RLh7ogPwelqpE6R2VDGasNGWWeI63zBm8vC7Z9ttV21xP7cqu2tdRqqiZQmegwfi6pPTnwY8xHJ/CDs8DywszmSNfWhvDje7EEJ5g5+9B742T0ECzsN1t7OMQAF68nUg/f1i/hUJ8BICN6ui67AkP1D3WweU42hp3AZSWH4in4Zbq3F+2UBEhI1wHgpbI7sJ/lIRDxpIdnBJp6UVXcXQ+k25584b7XVElCY54PAc5Yhkh8GCEeadjhSu0k+S86hdR3AYjdOOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5exiozIi2WvloqGfy6Rk/sN1LKnnCJvOrHGrcezcuZY=;
 b=f41ehTWE1Rmsc5x/ILX7x4Zq0940bLSNzP3ZEa4SLjmitwtklrH7liMtdccfJBoVyWI5ItdZTA/Z0KcphBb7qS1D7xO0LH55Uf92zbYbEx1Yp+razFSEuWHe1F98SVSvo7lwF+vaXplWQf60pDD++O1/tEq3rqHvN609OLn54VjANxuhZRZFPlOE7aSjnvCvCWs+NsL4CgaS115e8jDILXBS5l+6UMsnA96TA7zMcArJbphF0QWelQoS9vnv0RxVcD1AIYhAdVs568ZzuI5pdcsBzWBaUQgQqdjIJTHkPg/iMyEYXoqPpnyVsPyzovs9047a4MEe1Rq6QXRG7R94lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4093.namprd12.prod.outlook.com (52.135.51.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.16; Thu, 8 Aug 2019 08:14:54 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 08:14:54 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: =?utf-8?B?TWljaGVsIETDpG56ZXI=?= <michel@daenzer.net>, Kai-Heng Feng
 <kai.heng.feng@canonical.com>, "Olsak, Marek" <Marek.Olsak@amd.com>
Subject: RE: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
Thread-Topic: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
Thread-Index: AQHVTR6vuXV/Jpmg0k2CW5FCQfHn8Kbv2GiqgAAc5ACAANUysIAAHLGAgAAANxA=
Date: Thu, 8 Aug 2019 08:14:53 +0000
Message-ID: <MN2PR12MB3309A9960E429AA5B0A8AD19ECD70@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
 <MN2PR12MB330979BAFF5BCC758258D54CECD40@MN2PR12MB3309.namprd12.prod.outlook.com>
 <624BFB8F-B586-492E-BEA6-4B138DAEC831@canonical.com>
 <MN2PR12MB3309680845257BC66644133CECD70@MN2PR12MB3309.namprd12.prod.outlook.com>
 <615a4948-d0f9-46fc-f43e-2025455e9af6@daenzer.net>
In-Reply-To: <615a4948-d0f9-46fc-f43e-2025455e9af6@daenzer.net>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5ab17bd3-4d55-4830-6fd9-08d71bd87e50
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4093; 
x-ms-traffictypediagnostic: MN2PR12MB4093:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB4093DAA286C41C91A1BCC9D2ECD70@MN2PR12MB4093.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(39860400002)(346002)(396003)(136003)(376002)(366004)(13464003)(199004)(189003)(476003)(446003)(486006)(6306002)(4326008)(11346002)(66066001)(6246003)(316002)(53936002)(54906003)(186003)(81166006)(2906002)(81156014)(3846002)(26005)(14454004)(6506007)(33656002)(9686003)(8676002)(110136005)(7696005)(74316002)(6436002)(53546011)(55016002)(102836004)(71200400001)(5660300002)(64756008)(66946007)(76116006)(99286004)(76176011)(25786009)(71190400001)(229853002)(52536014)(66556008)(66476007)(66446008)(6636002)(8936002)(305945005)(86362001)(256004)(478600001)(6116002)(966005)(7736002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4093;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: UbDcNA6sai+hUsUerHwrUqd/k5ksqVStDeKb9D2+pciB6i1Sx4CByQJnRgpMsk9TBF3/Y8kO2nueDwTZ9FY4vC0pTyEkA8IhHB+tNmh/OXk7bBDDgzZwl03Rb+NzGAMpNa7+hvblmMuoOIejTItA/0XhRiiDTn7F4CY8CgCKJrvCZOxM7upM3cjxsNbDgX19c+pUVWFvFfov8xS+RXdGdbPLZwJR7KVHgAiBo+zBWAlU9XcuETB/s3gZS/ogiHWRir08mM0XO6rm8sqaXFDLVxaLY/RZ0k/zAvWhGNe3xH9YOY9lNo5GdK+Rrp3fIUNbFwIFx/MSrTT80qvkRuWA/07j7K3+AFWJK8RmvB01/l0DbBFA7KcQ3kDBox+SCe9b9jQphUCUPWiI0jc01OB9ZaE89HMnqaJBn5HVp4MwhoM=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ab17bd3-4d55-4830-6fd9-08d71bd87e50
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 08:14:53.9992 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4093
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5exiozIi2WvloqGfy6Rk/sN1LKnnCJvOrHGrcezcuZY=;
 b=Ce2XvcSyBTi1RiMh+DIANxtjPnlmYcZuX1Mbb35Pa79IqHHJUXexxjhlZlhewZ1iJSQhBOWBylod3ovqk5E1fX5m2qiOzYCbbMprh3R6AOyNzXz7J8SSSylSbnkU2CGHhEgSA9CnxF+yZOnT2zIT15l2cmojwu8qCnXekPBru8A=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Ray.Huang@amd.com; 
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
Cc: LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Anthony Wong <anthony.wong@canonical.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBNaWNoZWwgRMOkbnplciA8bWlj
aGVsQGRhZW56ZXIubmV0Pg0KPiBTZW50OiBUaHVyc2RheSwgQXVndXN0IDA4LCAyMDE5IDQ6MTAg
UE0NCj4gVG86IEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29tPjsgS2FpLUhlbmcgRmVuZw0K
PiA8a2FpLmhlbmcuZmVuZ0BjYW5vbmljYWwuY29tPg0KPiBDYzogWmhvdSwgRGF2aWQoQ2h1bk1p
bmcpIDxEYXZpZDEuWmhvdUBhbWQuY29tPjsgTEtNTCA8bGludXgtDQo+IGtlcm5lbEB2Z2VyLmtl
cm5lbC5vcmc+OyBkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBBbnRob255IFdvbmcN
Cj4gPGFudGhvbnkud29uZ0BjYW5vbmljYWwuY29tPjsgYW1kLWdmeCBsaXN0IDxhbWQtDQo+IGdm
eEBsaXN0cy5mcmVlZGVza3RvcC5vcmc+OyBEZXVjaGVyLCBBbGV4YW5kZXINCj4gPEFsZXhhbmRl
ci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENocmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5p
Z0BhbWQuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JlZ3Jlc3Npb25dICJkcm0vYW1kZ3B1OiBlbmFi
bGUgZ2Z4b2ZmIGFnYWluIG9uIHJhdmVuIHNlcmllcw0KPiAodjIpIg0KPiANCj4gT24gMjAxOS0w
OC0wOCA4OjI5IGEubS4sIEh1YW5nLCBSYXkgd3JvdGU6DQo+ID4+IEZyb206IEthaS1IZW5nIEZl
bmcgPGthaS5oZW5nLmZlbmdAY2Fub25pY2FsLmNvbT4gYXQgMDA6MDMsIEh1YW5nLA0KPiA+PiBS
YXkgPFJheS5IdWFuZ0BhbWQuY29tPiB3cm90ZToNCj4gPj4NCj4gPj4+IE1heSBJIGtub3cgdGhl
IGFsbCBmaXJtd2FyZSB2ZXJzaW9uIGluIHlvdXIgc3lzdGVtPw0KPiA+DQo+ID4gU2VlbXMgdG8g
dGhlIGlzc3VlIHdlIGVuY291bnRlcmVkIHdpdGggSU9NTVUgZW5hYmxlZC4gQ291bGQgeW91DQo+
IHBsZWFzZSBkaXNhYmxlIGlvbW11IGluIFNCSU9TIG9yIEdSVUI/DQo+IA0KPiBUaGUgZHJpdmVy
IG5lZWRzIHRvIHdvcmsgd2l0aCB0aGUgSU9NTVUgZW5hYmxlZC4gSWYgbm90aGluZyBlbHNlLCBS
T0NtDQo+IG9ubHkgd29ya3Mgd2l0aCBJT01NVSBJIHRoaW5rLg0KPiANCg0KWWVzLiBST0NtIGlu
IEFQVSByZXF1aXJlZCBJT01NVSB2Mi4gU28gZmFyLCBJIGFtIGFza2luZyBLYWktSGVuZyB0byBk
byBzb21lIHRlc3RzIHRvIG1ha2Ugc3VyZSB0aGUgaXNzdWUgdGhhdCB3YXMgZW5jb3VudGVyZWQg
YnkgdXMgYmVmb3JlLiAoKyBNYXJlaykNCg0KVGhhbmtzLA0KUmF5DQoNCj4gDQo+IC0tDQo+IEVh
cnRobGluZyBNaWNoZWwgRMOkbnplciAgICAgICAgICAgICAgIHwgICAgICAgICAgICAgIGh0dHBz
Oi8vd3d3LmFtZC5jb20NCj4gTGlicmUgc29mdHdhcmUgZW50aHVzaWFzdCAgICAgICAgICAgICB8
ICAgICAgICAgICAgIE1lc2EgYW5kIFggZGV2ZWxvcGVyDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
