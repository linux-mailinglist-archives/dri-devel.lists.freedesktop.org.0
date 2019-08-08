Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 435FC85AC1
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2019 08:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E7F26E787;
	Thu,  8 Aug 2019 06:29:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700058.outbound.protection.outlook.com [40.107.70.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C8CE6E784;
 Thu,  8 Aug 2019 06:29:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JeH8OPjTL+TCV3aErTYv4bp1A3nNH/RP649ugWO9oQlw0mguzUMhK02rJcV1Y1frDwQdBeCJ6f8/HnCKJZnJN9OwFSfpAW9MoTQy8DhZRVdaJ6HN5+F8fmAnpOQhmgafGx+baY+E4VCDao81MVXnF77yztecPID+GU716UaOsQVtmKhQa5diJ99dB+SG5FyeYGQrTMVblyOC20vv5TayfAATNHE5zQTTkru2U2xsa7dIbeXdKnJQJmzllYNMPtKpz4NIjhECDoZ2ytxEvAd5msTzmnqkId+UrogTmpDJFSFSLprEJdycs42H9RfbRcBEWSzf0mGKbdXPhfuKSU2s6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef+8vpylpmeMr6ZdpuPTZ32ds+z5hB/u0i7L/w33i8c=;
 b=dpqc+Zz0cS+XntdT/wQl9hfe1XP+0RI0luQNS8SUHONYArKXXuJGV1zKbJWRA6hWz4cZlAIezdFJMQumU5EDI/WUmdR7vfN9t6fT/a/Se1fud9a3n0G66IEvZSZ84Iuh/Xs0tHfccz2uSjsUd1M6M30ySB1O0eU8kV9inxsFd+eL9d226i/Cd64WgF4ZK1oaThNQAhW8IBGaQX0nqQbWOknnK/OCcIMQE28EBoLCMbtx5DupkOdZ178NzxzFLggHEie9mXA1tXYUQLqoqeUGPiSxLbOYPnbcY4nc//WBTdkdy/5iwVEJ0ab33Q3eUoXWtVCTZHr48Euc3pu8+Apjsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3309.namprd12.prod.outlook.com (20.179.83.157) by
 MN2PR12MB4173.namprd12.prod.outlook.com (52.135.49.202) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.15; Thu, 8 Aug 2019 06:29:16 +0000
Received: from MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e]) by MN2PR12MB3309.namprd12.prod.outlook.com
 ([fe80::f821:f3f7:3ee3:8c5e%7]) with mapi id 15.20.2136.018; Thu, 8 Aug 2019
 06:29:20 +0000
From: "Huang, Ray" <Ray.Huang@amd.com>
To: Kai-Heng Feng <kai.heng.feng@canonical.com>
Subject: RE: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
Thread-Topic: [Regression] "drm/amdgpu: enable gfxoff again on raven series
 (v2)"
Thread-Index: AQHVTR6vuXV/Jpmg0k2CW5FCQfHn8Kbv2GiqgAAc5ACAANUysA==
Date: Thu, 8 Aug 2019 06:29:19 +0000
Message-ID: <MN2PR12MB3309680845257BC66644133CECD70@MN2PR12MB3309.namprd12.prod.outlook.com>
References: <3EB0E920-31D7-4C91-A360-DBFB4417AC2F@canonical.com>
 <MN2PR12MB330979BAFF5BCC758258D54CECD40@MN2PR12MB3309.namprd12.prod.outlook.com>
 <624BFB8F-B586-492E-BEA6-4B138DAEC831@canonical.com>
In-Reply-To: <624BFB8F-B586-492E-BEA6-4B138DAEC831@canonical.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 61e7e42a-0674-460c-db17-08d71bc9beed
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4173; 
x-ms-traffictypediagnostic: MN2PR12MB4173:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB417385DFA46DF392AB1E5A84ECD70@MN2PR12MB4173.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:8273;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(376002)(39860400002)(346002)(396003)(366004)(189003)(199004)(13464003)(76176011)(71190400001)(7736002)(71200400001)(6506007)(53546011)(6916009)(478600001)(305945005)(966005)(229853002)(14454004)(316002)(6436002)(54906003)(33656002)(99286004)(7696005)(5660300002)(8936002)(81166006)(81156014)(8676002)(6116002)(3846002)(76116006)(66446008)(64756008)(66556008)(66476007)(66946007)(52536014)(86362001)(446003)(4326008)(66066001)(6246003)(256004)(6306002)(55016002)(9686003)(486006)(11346002)(476003)(2906002)(102836004)(66574012)(53936002)(25786009)(186003)(26005)(74316002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4173;
 H:MN2PR12MB3309.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: bp1Pg0IDiIXQv7180nqvLF70Ww2i/qK/fjqqTrZ9q3uNXJEuVKYmyZpYj8J/Pi0QmhQkS5eW29hhb0a4xfNijqlvJCZkyw9d0X1uEvadmwht565bB+oLdI1dffDcIxlVO32j0sLUZgL8SpEo1X+RX8Rr24r7UZmGytx9zlSG/khC2R3is5xUhSEvz9Qqu2fq+1BXLQ+EEW0o+8JJcdOlDr8php3NeRGWreres0ox+ZJPR43wrYl0kxGRcbf2p1tHX4u9WUdkMZQ7OKQ+tuWle9/0Q23KwRelyNF0hhOijFylAteKWiBqFJMNOEu0TPgMhW7GkNtwrzoJ3iqLlAUTDUGjwfC4NClkYw5vwMIRiQd7EaXgbqUFjyIOaa9V+LIaIwaHYgNpLcvsoUMirf1H+lAXbFGqb5tBsNZEaUz8XDo=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61e7e42a-0674-460c-db17-08d71bc9beed
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 06:29:20.0021 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ruihuang@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ef+8vpylpmeMr6ZdpuPTZ32ds+z5hB/u0i7L/w33i8c=;
 b=K3+2mEya1uEmLJD8aOe+bbergHOKKvuvO5hia9R7t9NmhA5sp3d9c/86JCEwW6x8faIR4TTKLslueLWoc4UjW278d4Zwj97J9GPfXDVAjsJKIBZ6RW2ak9Omnfy2XbPGIXV1nuNvQy+pnCFXh6xwuCcjx50IKE/bTgE8Ft/+Omk=
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Anthony Wong <anthony.wong@canonical.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <Alexander.Deucher@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBLYWktSGVuZyBGZW5nIDxrYWku
aGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+DQo+IFNlbnQ6IFRodXJzZGF5LCBBdWd1c3QgMDgsIDIw
MTkgMTo0NSBBTQ0KPiBUbzogSHVhbmcsIFJheSA8UmF5Lkh1YW5nQGFtZC5jb20+DQo+IENjOiBE
ZXVjaGVyLCBBbGV4YW5kZXIgPEFsZXhhbmRlci5EZXVjaGVyQGFtZC5jb20+OyBLb2VuaWcsIENo
cmlzdGlhbg0KPiA8Q2hyaXN0aWFuLktvZW5pZ0BhbWQuY29tPjsgWmhvdSwgRGF2aWQoQ2h1bk1p
bmcpDQo+IDxEYXZpZDEuWmhvdUBhbWQuY29tPjsgYW1kLWdmeCBsaXN0IDxhbWQtZ2Z4QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz47DQo+IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExL
TUwgPGxpbnV4LWtlcm5lbEB2Z2VyLmtlcm5lbC5vcmc+Ow0KPiBBbnRob255IFdvbmcgPGFudGhv
bnkud29uZ0BjYW5vbmljYWwuY29tPg0KPiBTdWJqZWN0OiBSZTogW1JlZ3Jlc3Npb25dICJkcm0v
YW1kZ3B1OiBlbmFibGUgZ2Z4b2ZmIGFnYWluIG9uIHJhdmVuIHNlcmllcw0KPiAodjIpIg0KPiAN
Cj4gSGkgUmF5LA0KPiANCj4gYXQgMDA6MDMsIEh1YW5nLCBSYXkgPFJheS5IdWFuZ0BhbWQuY29t
PiB3cm90ZToNCj4gDQo+ID4gTWF5IEkga25vdyB0aGUgYWxsIGZpcm13YXJlIHZlcnNpb24gaW4g
eW91ciBzeXN0ZW0/DQoNClNlZW1zIHRvIHRoZSBpc3N1ZSB3ZSBlbmNvdW50ZXJlZCB3aXRoIElP
TU1VIGVuYWJsZWQuIENvdWxkIHlvdSBwbGVhc2UgZGlzYWJsZSBpb21tdSBpbiBTQklPUyBvciBH
UlVCPw0KDQpUaGFua3MsDQpSYXkNCg0KPiANCj4gIyBjYXQgYW1kZ3B1X2Zpcm13YXJlX2luZm8N
Cj4gVkNFIGZlYXR1cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMA0K
PiBVVkQgZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDAwDQo+
IE1DIGZlYXR1cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDAwMA0KPiBN
RSBmZWF0dXJlIHZlcnNpb246IDQwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDk5DQo+IFBG
UCBmZWF0dXJlIHZlcnNpb246IDQwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMGFlDQo+IENF
IGZlYXR1cmUgdmVyc2lvbjogNDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwNGQNCj4gUkxD
IGZlYXR1cmUgdmVyc2lvbjogMSwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAwMDIxMw0KPiBSTEMg
U1JMQyBmZWF0dXJlIHZlcnNpb246IDEsIGZpcm13YXJlIHZlcnNpb246IDB4MDAwMDAwMDENCj4g
UkxDIFNSTEcgZmVhdHVyZSB2ZXJzaW9uOiAxLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMDAwMDAx
DQo+IFJMQyBTUkxTIGZlYXR1cmUgdmVyc2lvbjogMSwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAw
MDAwMQ0KPiBNRUMgZmVhdHVyZSB2ZXJzaW9uOiA0MCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAw
MDE4Yg0KPiBNRUMyIGZlYXR1cmUgdmVyc2lvbjogNDAsIGZpcm13YXJlIHZlcnNpb246IDB4MDAw
MDAxOGINCj4gU09TIGZlYXR1cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgwMDAw
MDAwMA0KPiBBU0QgZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAwMWFk
NGQ0DQo+IFRBIFhHTUkgZmVhdHVyZSB2ZXJzaW9uOiAwLCBmaXJtd2FyZSB2ZXJzaW9uOiAweDAw
MDAwMDAwDQo+IFRBIFJBUyBmZWF0dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4
MDAwMDAwMDANCj4gU01DIGZlYXR1cmUgdmVyc2lvbjogMCwgZmlybXdhcmUgdmVyc2lvbjogMHgw
MDAwMWU0NA0KPiBTRE1BMCBmZWF0dXJlIHZlcnNpb246IDQxLCBmaXJtd2FyZSB2ZXJzaW9uOiAw
eDAwMDAwMGE5DQo+IFZDTiBmZWF0dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4
MDExMDkwMWMNCj4gRE1DVSBmZWF0dXJlIHZlcnNpb246IDAsIGZpcm13YXJlIHZlcnNpb246IDB4
MDAwMDAwMDANCj4gVkJJT1MgdmVyc2lvbjogMTEzLVJBVkVOLTEwMw0KPiANCj4gS2FpLUhlbmcN
Cj4gDQo+ID4NCj4gPiBUaGFua3MsDQo+ID4gUmF5DQo+ID4NCj4gPiBGcm9tOiBLYWktSGVuZyBG
ZW5nIDxrYWkuaGVuZy5mZW5nQGNhbm9uaWNhbC5jb20+DQo+ID4gU2VudDogV2VkbmVzZGF5LCBB
dWd1c3QgNywgMjAxOSA4OjUwIFBNDQo+ID4gVG86IEh1YW5nLCBSYXkNCj4gPiBDYzogRGV1Y2hl
ciwgQWxleGFuZGVyOyBLb2VuaWcsIENocmlzdGlhbjsgWmhvdSwgRGF2aWQoQ2h1bk1pbmcpOyBh
bWQtDQo+IGdmeA0KPiA+IGxpc3Q7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IExL
TUw7IEFudGhvbnkgV29uZw0KPiA+IFN1YmplY3Q6IFtSZWdyZXNzaW9uXSAiZHJtL2FtZGdwdTog
ZW5hYmxlIGdmeG9mZiBhZ2FpbiBvbiByYXZlbiBzZXJpZXMNCj4gPiAodjIpIg0KPiA+DQo+ID4g
SGksDQo+ID4NCj4gPiBBZnRlciBjb21taXQgMDA1NDQwMDY2ZjkyICgiZHJtL2FtZGdwdTogZW5h
YmxlIGdmeG9mZiBhZ2FpbiBvbiByYXZlbg0KPiBzZXJpZXMNCj4gPiAodjIp4oCdKSwgYnJvd3Nl
cnMgb24gUmF2ZW4gUmlkZ2Ugc3lzdGVtcyBjYXVzZSBzZXJpb3VzIGNvcnJ1cHRpb24gbGlrZSB0
aGlzOg0KPiA+IGh0dHBzOi8vbGF1bmNocGFkbGlicmFyaWFuLm5ldC80MzYzMTk3NzIvU2NyZWVu
c2hvdCUyMGZyb20lMjAyMDE5LQ0KPiAwOC0wNyUyMDA0LTIwLTM0LnBuZw0KPiA+DQo+ID4gRmly
bXdhcmVzIGZvciBSYXZlbiBSaWRnZSBpcyB1cC10by1kYXRlLg0KPiA+DQo+ID4gS2FpLUhlbmcN
Cj4gDQoNCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmRy
aS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
