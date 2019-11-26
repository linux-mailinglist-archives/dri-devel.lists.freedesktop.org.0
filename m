Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C20B10A0CF
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2019 15:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1876A6E12E;
	Tue, 26 Nov 2019 14:55:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820050.outbound.protection.outlook.com [40.107.82.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70C76E118;
 Tue, 26 Nov 2019 14:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nHVHm5Q4CL3xl4KNuSRX/9Pqx8OnFx1g1CA+q7Zgyklxji7iRGj2ppLTcCAzkeW/euLb3KSdB5iORWVGlUlTdEuz+xSJywAauEfZ/Y4y4H2/B6Oknn4em7rpydrmK7QiiVM3Nm56ZfF0K9JZKuN1jSCIRT11134mGGZDjtEifcgvEdH2Mx73sPSn4Q2c6Sn2M6w0KmDlPEEzwFu+WMUsC3elPoljIC/kbW5dhd7BLyKCZZgee1S9FM1qcor5kOsPsqTGfeUUZcwY8qVRGUE4AEuRYXKxfyY5+6tcP5jrotL2H9zzqlg/DAqG5D/G8txc0/ABEmyAFJm9SXgYU2a/Zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eZ0EePgjwIJ/k4hMZKif4V9fOo7DrPz1FeOYgn2OaQ=;
 b=oPmrbiO6Z3HmzpAzN6m4ymuGZ2l4ei0qoOHgn3C8TPpmI5Utty0A70glVM6hRqNKELIkD81jUPEebAP0m1GgmTuqYeWsNdhKqxDAWuSrD18WGcxGt6RERv3Vgkw0e8K9W+Vi2laqaEyPu6+zcHu8pUy8ASQQW3cbIGezN2KW0jmWXRzZFxWveoNACjkvue/MBJNm06rhvOM2jlc9lfD7dBmjjJgNoc8aMbh5EsoLrMPFbat1BgClTBhiUluzLBXwtoCYTyfT4Q7jpJR2py+qFRVr5x2SA7PvZDmpfsdbL6soaGDkpcqdn7T0rws2bxn4dHfHqg1NujD/Ry5tXEFmOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB3466.namprd12.prod.outlook.com (20.178.198.225) by
 DM6PR12MB3145.namprd12.prod.outlook.com (20.178.198.138) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.18; Tue, 26 Nov 2019 14:55:48 +0000
Received: from DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::8954:6ba3:6dca:4616]) by DM6PR12MB3466.namprd12.prod.outlook.com
 ([fe80::8954:6ba3:6dca:4616%7]) with mapi id 15.20.2474.023; Tue, 26 Nov 2019
 14:55:48 +0000
From: "Liu, Zhan" <Zhan.Liu@amd.com>
To: "Koenig, Christian" <Christian.Koenig@amd.com>, Jules Irenge
 <jbi.octave@gmail.com>, "Deucher, Alexander" <Alexander.Deucher@amd.com>
Subject: RE: [PATCH] drm: radeon: replace 0 with NULL
Thread-Topic: [PATCH] drm: radeon: replace 0 with NULL
Thread-Index: AQHVpDGuiIGYb9FDoEeIk+mDGEp8l6edOuKAgABPylA=
Date: Tue, 26 Nov 2019 14:55:48 +0000
Message-ID: <DM6PR12MB34663EE4B2AAEA248FC4DC909E450@DM6PR12MB3466.namprd12.prod.outlook.com>
References: <20191126003514.133692-1-jbi.octave@gmail.com>
 <9a585a20-b885-680f-d561-8713afe53fa1@amd.com>
In-Reply-To: <9a585a20-b885-680f-d561-8713afe53fa1@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 2443c3a6-0cb7-4911-3d45-08d77280b943
x-ms-traffictypediagnostic: DM6PR12MB3145:|DM6PR12MB3145:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB31457E56C71F8BDE8E6E5DAA9E450@DM6PR12MB3145.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:196;
x-forefront-prvs: 0233768B38
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(346002)(39860400002)(136003)(376002)(366004)(396003)(189003)(199004)(13464003)(6636002)(99286004)(110136005)(25786009)(256004)(14444005)(54906003)(66574012)(229853002)(11346002)(305945005)(6436002)(33656002)(7736002)(7696005)(71200400001)(71190400001)(76176011)(446003)(74316002)(9686003)(53546011)(5660300002)(8676002)(186003)(81156014)(81166006)(4326008)(316002)(6506007)(26005)(66946007)(66476007)(66556008)(64756008)(66446008)(14454004)(76116006)(55016002)(66066001)(52536014)(3846002)(6116002)(102836004)(6246003)(478600001)(8936002)(86362001)(2906002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3145;
 H:DM6PR12MB3466.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WhEdlR0nP6NWcXJRI0Jb9Vo/amLsMbxETgy6fPuBmEX0t+zwJCOOMc2Zwrg8jwM1ZEiW/wCPpR0YA/Sc8BzOabzi3PvUayOU0Gztjwx5bNleByoUlu86KLCaB41WVw6JB5I43heOhLFiR9d2OgSBgk5Xh4lMTDGqqPVOiqcg4xbGmi9jrUwPsSXLWG9KFGRmhoHTLt1n9vLiZmsVV51poxWKPQRhPkISt2YGX1+6jonreo+++mC2U9pbDNoFU56AlkHGcxMgSF5p2c6g+1YXMYT77CsDpXUEt7TLOlXtU/wQwCpB0ALlGfD3XALYBeId+JjwNhIFTtD3en5WgGEWirB/W3DV5nkHD8TaUAY+s4QHvkxsRiweI14LwVfyj1I3pnVRTqR6iSnWVt4SNkoalqeGsJPaVsqTmCRW4gBKZr2rajPZu6vANv8EIJkF33hf
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2443c3a6-0cb7-4911-3d45-08d77280b943
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2019 14:55:48.3827 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 1IuLh38H5tgFUHdhQM2SaqVrCGkpdMfKxPYEsNYaCbqf+oYUiK2/UTsezs5KQdo2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3145
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7eZ0EePgjwIJ/k4hMZKif4V9fOo7DrPz1FeOYgn2OaQ=;
 b=Nt6J0oGZKrD5aU//Vx18YBWbKf04mrPH3IKZwFKCIa08gzjpFBl96/EsuRSv6y4rfXIdumDfecwRID/Muox29sRr7B4TSQ/hEDW0BTSiV55BKHuez0H6i9G3RxYxKwemyTzsbDNTOzndnNpTmHgBRsc10yxgABiCSp/sdtI/syM=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Zhan.Liu@amd.com; 
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdm
eC1ib3VuY2VzQGxpc3RzLmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mDQo+IENocmlzdGlh
biBLw7ZuaWcNCj4gU2VudDogMjAxOS9Ob3ZlbWJlci8yNiwgVHVlc2RheSA1OjEwIEFNDQo+IFRv
OiBKdWxlcyBJcmVuZ2UgPGpiaS5vY3RhdmVAZ21haWwuY29tPjsgRGV1Y2hlciwgQWxleGFuZGVy
DQo+IDxBbGV4YW5kZXIuRGV1Y2hlckBhbWQuY29tPg0KPiBDYzogWmhvdSwgRGF2aWQoQ2h1bk1p
bmcpIDxEYXZpZDEuWmhvdUBhbWQuY29tPjsgYWlybGllZEBsaW51eC5pZTsNCj4gbGludXgta2Vy
bmVsQHZnZXIua2VybmVsLm9yZzsgYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IGRyaS0N
Cj4gZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkYW5pZWxAZmZ3bGwuY2gNCj4gU3ViamVj
dDogUmU6IFtQQVRDSF0gZHJtOiByYWRlb246IHJlcGxhY2UgMCB3aXRoIE5VTEwNCj4gDQo+IEFt
IDI2LjExLjE5IHVtIDAxOjM1IHNjaHJpZWIgSnVsZXMgSXJlbmdlOg0KPiA+IFJlcGxhY2UgMCB3
aXRoIE5VTEwgdG8gZml4IHNwYXJzZSB0b29sICB3YXJuaW5nDQo+ID4gICB3YXJuaW5nOiBVc2lu
ZyBwbGFpbiBpbnRlZ2VyIGFzIE5VTEwgcG9pbnRlcg0KPiA+DQo+ID4gU2lnbmVkLW9mZi1ieTog
SnVsZXMgSXJlbmdlIDxqYmkub2N0YXZlQGdtYWlsLmNvbT4NCj4gDQo+IEFja2VkLWJ5OiBDaHJp
c3RpYW4gS8O2bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+DQoNCg0KUmV2aWV3ZWQtYnk6
IFpoYW4gTGl1IDx6aGFuLmxpdUBhbWQuY29tPg0KDQoNCj4gDQo+ID4gLS0tDQo+ID4gICBkcml2
ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9hdWRpby5jIHwgMiArLQ0KPiA+ICAgMSBmaWxlIGNo
YW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pDQo+ID4NCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYw0KPiBiL2RyaXZlcnMvZ3B1
L2RybS9yYWRlb24vcmFkZW9uX2F1ZGlvLmMNCj4gPiBpbmRleCBiOWFlYTU3NzZkM2QuLjIyNjlj
ZmNlZDc4OCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vcmFkZW9uL3JhZGVvbl9h
dWRpby5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3JhZGVvbi9yYWRlb25fYXVkaW8uYw0K
PiA+IEBAIC0yODgsNyArMjg4LDcgQEAgc3RhdGljIHZvaWQgcmFkZW9uX2F1ZGlvX2ludGVyZmFj
ZV9pbml0KHN0cnVjdA0KPiByYWRlb25fZGV2aWNlICpyZGV2KQ0KPiA+ICAgCX0gZWxzZSB7DQo+
ID4gICAJCXJkZXYtPmF1ZGlvLmZ1bmNzID0gJnI2MDBfZnVuY3M7DQo+ID4gICAJCXJkZXYtPmF1
ZGlvLmhkbWlfZnVuY3MgPSAmcjYwMF9oZG1pX2Z1bmNzOw0KPiA+IC0JCXJkZXYtPmF1ZGlvLmRw
X2Z1bmNzID0gMDsNCj4gPiArCQlyZGV2LT5hdWRpby5kcF9mdW5jcyA9IE5VTEw7DQo+ID4gICAJ
fQ0KPiA+ICAgfQ0KPiA+DQo+IA0KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXw0KPiBhbWQtZ2Z4IG1haWxpbmcgbGlzdA0KPiBhbWQtZ2Z4QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZw0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmkt
ZGV2ZWw=
