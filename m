Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D038594E6D
	for <lists+dri-devel@lfdr.de>; Mon, 19 Aug 2019 21:37:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC8AA6E27C;
	Mon, 19 Aug 2019 19:37:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM03-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr790049.outbound.protection.outlook.com [40.107.79.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D196E27C;
 Mon, 19 Aug 2019 19:37:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lQHLxu0lkhsH3aGARojuyuXQb50izimlfkSqxR12Yxv68IEDTcTkMLcgWIBkMU02x2EQB2aR5wXYWAZiqsLevXJMKCwi25Fwzh9SHhpRKBOh1tCpRNi8ezUwNJ1fMM0WAbT2xFLbfIyrUPUQX8LOAWWI6PLUpDUfn28a9EGc2cOXsRaiWw5jyqFNyeKLgtLI2J+DMPRg/W8sd6Y5rH6IpZLl1wBmbCFB8faHZxc0GJTo5e/Uakld40XJUrbXgaGAA7PNHT+eCfhm52jppMhhrQzsBkzneQGF50BL5T8ca9wlK5ztKWg3KMyzkctdRjTEKYoBhqaoMTexVh6u5IT1JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwTf+7Ql6t2mHzwABwsZQ7PWy/DbJfaTBpNRhq8+uM4=;
 b=BeQFaxG+y8I2+AP6nC6675AD3vibpJNHmHmluOpcZSPzrnW6NEIGy5xulYKuXWLaqPLa+NikcILUINqvWbVSZUQeCGaiaAWUxX+53gkgQ99Lxtt7wCIxTg/9rEqi8nwl7m4GAjzbJrLR5HY9sTGcTxS27ersv6612OTMtF6+94nJ0HusNweM957EASwj+3VL5BcICDzuf8/ZT8Oa1zNtX86JiPmQIjaF9Zf1TE71ZF8WQPG4erSkfE9lRzwD4oTMeysjqf1v2JKbBcbmsnHR+p9knFnrjJubJwLLMLmfSnts5rqItpqSs2hA1JxZVOEGbcnvpte26ozyPWm0fcd+Sg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from BYAPR12MB3560.namprd12.prod.outlook.com (20.178.197.10) by
 BYAPR12MB3496.namprd12.prod.outlook.com (20.178.196.222) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2178.16; Mon, 19 Aug 2019 19:36:56 +0000
Received: from BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82]) by BYAPR12MB3560.namprd12.prod.outlook.com
 ([fe80::d594:85f1:65da:dd82%5]) with mapi id 15.20.2178.018; Mon, 19 Aug 2019
 19:36:56 +0000
From: "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>
To: "Francis, David" <David.Francis@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH 07/14] drm/amd/display: Initialize DSC PPS variables to 0
Thread-Topic: [PATCH 07/14] drm/amd/display: Initialize DSC PPS variables to 0
Thread-Index: AQHVVqXsDXPW7/YWoU2NlAE6apFDqqcC3Z0A
Date: Mon, 19 Aug 2019 19:36:56 +0000
Message-ID: <835c358e-3eee-5d2c-1986-c862d59f4211@amd.com>
References: <20190819155038.1771-1-David.Francis@amd.com>
 <20190819155038.1771-8-David.Francis@amd.com>
In-Reply-To: <20190819155038.1771-8-David.Francis@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTBPR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::34) To BYAPR12MB3560.namprd12.prod.outlook.com
 (2603:10b6:a03:ae::10)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 569ee0f3-e043-4c82-d9d0-08d724dc982e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:BYAPR12MB3496; 
x-ms-traffictypediagnostic: BYAPR12MB3496:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BYAPR12MB3496B0C497D2C86F102FAEADECA80@BYAPR12MB3496.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:133;
x-forefront-prvs: 0134AD334F
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(366004)(39860400002)(346002)(396003)(136003)(376002)(199004)(189003)(71190400001)(2501003)(25786009)(99286004)(102836004)(31686004)(53546011)(6506007)(386003)(476003)(66066001)(446003)(71200400001)(2616005)(26005)(186003)(256004)(11346002)(478600001)(14454004)(6246003)(486006)(52116002)(76176011)(305945005)(53936002)(2201001)(7736002)(66446008)(66946007)(450100002)(2906002)(31696002)(66476007)(64756008)(36756003)(86362001)(6116002)(81156014)(8676002)(81166006)(229853002)(8936002)(3846002)(6512007)(66556008)(110136005)(316002)(6436002)(6486002)(5660300002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:BYAPR12MB3496;
 H:BYAPR12MB3560.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SrBUXAPc6CCvwkpVJ7hid4dmOxufjyZfaBJL1GKIppaacf4Pi5/ePwpoQXcA23vistzTPC7cd6HKMG4Y9Pq6kgaWZnjYXA7yf1OwI9wQ7P6MyQ1R34ZlwM6l7DgceYJu5E9ppmtgGmQcd22q+Q3uQm2ZoawV/DpTa3FwwoVknLsG158KdBEI0NkifPvjasb1YxKETU4IWb2w+aiX3QT+5AvJBkK3Z5fZjWZi0e2HgHQD4r90rChKSnFNawfBdNLEMJRRDUMtFJ2tktjQI+w6GQrxiLosIeHd9/OdBMJGjpXdWlzVWoZp9mqmIcIclEHaaQUENH+Z21vR/Dd5Lyv/HcFqA3SWy4/6qcSTs1NQMHTjlzLgVyNYetsim326Q6jd7fbhR2Irq93xpJYAXxIA5KHBTueYzaZseUY7d+YaBrU=
Content-ID: <3B482DB8FAB41344BA29AD15C654247B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 569ee0f3-e043-4c82-d9d0-08d724dc982e
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Aug 2019 19:36:56.6033 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rjz5CrxVBaogHxBcyVXbHKKH6UAelsanYfSQGMHnCX8b4bbjJ/c3WIANekOoxliow3iP7lK3wmDUj4+DI7+6sg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR12MB3496
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DwTf+7Ql6t2mHzwABwsZQ7PWy/DbJfaTBpNRhq8+uM4=;
 b=uCT+mVHlWdfvTaCvqWRy3RnyNirNmMPt/FonOCnnYGMfxdstLW9zDwy53zF7JqQyBvYezFeagKxfsKkKCXRO3QX8fx+f2kjAoGByATYNCSLHOfI0Xh+WcoI1lUb1VsA7z5OYfyX0gnKFLdR7fcdt5Q1n4sk2R0OlWdU6sGobVK4=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Nicholas.Kazlauskas@amd.com; 
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gOC8xOS8xOSAxMTo1MCBBTSwgRGF2aWQgRnJhbmNpcyB3cm90ZToNCj4gRm9yIERTQyBNU1Qs
IHNvbWV0aW1lcyBtb25pdG9ycyB3b3VsZCBicmVhayBvdXQNCj4gaW4gZnVsbC1zY3JlZW4gc3Rh
dGljLiBUaGUgaXNzdWUgdHJhY2VkIGJhY2sgdG8gdGhlDQo+IFBQUyBnZW5lcmF0aW9uIGNvZGUs
IHdoZXJlIHRoZXNlIHZhcmlhYmxlcyB3ZXJlIGJlaW5nIHVzZWQNCj4gdW5pbml0aWFsaXplZCBh
bmQgd2VyZSBwaWNraW5nIHVwIGdhcmJhZ2UuDQo+IA0KPiBtZW1zZXQgdG8gMCB0byBhdm9pZCB0
aGlzDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYXZpZCBGcmFuY2lzIDxEYXZpZC5GcmFuY2lzQGFt
ZC5jb20+DQoNClBhdGNoZXMgMS01IGFuZCA3IGFyZToNCg0KUmV2aWV3ZWQtYnk6IE5pY2hvbGFz
IEthemxhdXNrYXMgPG5pY2hvbGFzLmthemxhdXNrYXNAYW1kLmNvbT4NCg0KPiAtLS0NCj4gICBk
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYyB8IDMgKysr
DQo+ICAgZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jICAg
fCAzICsrKw0KPiAgIDIgZmlsZXMgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspDQo+IA0KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3Nz
LmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvY29yZS9kY19saW5rX2h3c3MuYw0K
PiBpbmRleCAzNWM1NDY3ZTYwZTguLjYxOWFjNDhlZGQwNSAxMDA2NDQNCj4gLS0tIGEvZHJpdmVy
cy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2NvcmUvZGNfbGlua19od3NzLmMNCj4gQEAgLTQ5
MSw2ICs0OTEsOSBAQCBib29sIGRwX3NldF9kc2NfcHBzX3NkcChzdHJ1Y3QgcGlwZV9jdHggKnBp
cGVfY3R4LCBib29sIGVuYWJsZSkNCj4gICAJCXN0cnVjdCBkc2NfY29uZmlnIGRzY19jZmc7DQo+
ICAgCQl1aW50OF90IGRzY19wYWNrZWRfcHBzWzEyOF07DQo+ICAgDQo+ICsJCW1lbXNldCgmZHNj
X2NmZywgMCwgc2l6ZW9mKGRzY19jZmcpKTsNCj4gKwkJbWVtc2V0KGRzY19wYWNrZWRfcHBzLCAw
LCAxMjgpOw0KPiArDQo+ICAgCQkvKiBFbmFibGUgRFNDIGh3IGJsb2NrICovDQo+ICAgCQlkc2Nf
Y2ZnLnBpY193aWR0aCA9IHN0cmVhbS0+dGltaW5nLmhfYWRkcmVzc2FibGUgKyBzdHJlYW0tPnRp
bWluZy5oX2JvcmRlcl9sZWZ0ICsgc3RyZWFtLT50aW1pbmcuaF9ib3JkZXJfcmlnaHQ7DQo+ICAg
CQlkc2NfY2ZnLnBpY19oZWlnaHQgPSBzdHJlYW0tPnRpbWluZy52X2FkZHJlc3NhYmxlICsgc3Ry
ZWFtLT50aW1pbmcudl9ib3JkZXJfdG9wICsgc3RyZWFtLT50aW1pbmcudl9ib3JkZXJfYm90dG9t
Ow0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2Rj
bjIwX2RzYy5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2Rz
Yy5jDQo+IGluZGV4IDM3OWM5ZTRhYzYzYi4uMTZkZWJlNmQ4OWYyIDEwMDY0NA0KPiAtLS0gYS9k
cml2ZXJzL2dwdS9kcm0vYW1kL2Rpc3BsYXkvZGMvZGNuMjAvZGNuMjBfZHNjLmMNCj4gKysrIGIv
ZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RjbjIwL2RjbjIwX2RzYy5jDQo+IEBAIC0y
MDcsNiArMjA3LDkgQEAgc3RhdGljIGJvb2wgZHNjMl9nZXRfcGFja2VkX3BwcyhzdHJ1Y3QgZGlz
cGxheV9zdHJlYW1fY29tcHJlc3NvciAqZHNjLCBjb25zdCBzdHINCj4gICAJc3RydWN0IGRzY19y
ZWdfdmFsdWVzIGRzY19yZWdfdmFsczsNCj4gICAJc3RydWN0IGRzY19vcHRjX2NvbmZpZyBkc2Nf
b3B0Y19jZmc7DQo+ICAgDQo+ICsJbWVtc2V0KCZkc2NfcmVnX3ZhbHMsIDAsIHNpemVvZihkc2Nf
cmVnX3ZhbHMpKTsNCj4gKwltZW1zZXQoJmRzY19vcHRjX2NmZywgMCwgc2l6ZW9mKGRzY19vcHRj
X2NmZykpOw0KPiArDQo+ICAgCURDX0xPR19EU0MoIkdldHRpbmcgcGFja2VkIERTQyBQUFMgZm9y
IERTQyBDb25maWc6Iik7DQo+ICAgCWRzY19jb25maWdfbG9nKGRzYywgZHNjX2NmZyk7DQo+ICAg
CURDX0xPR19EU0MoIkRTQyBQaWN0dXJlIFBhcmFtZXRlciBTZXQgKFBQUyk6Iik7DQo+IA0KDQpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwg
bWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
