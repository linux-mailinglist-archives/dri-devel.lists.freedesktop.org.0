Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF26CE76
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jul 2019 15:02:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DF886E3B2;
	Thu, 18 Jul 2019 13:02:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710048.outbound.protection.outlook.com [40.107.71.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE0AB6E3AE
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jul 2019 13:02:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QoZKGA45T7BNQQE9RLsJlv8667U9+JA3LY2n2CujuMkKayfhrVvRbdNoVvQcrJRMhh49Ua7BA7CDvintnp7LqhNicgzSWd5qe5Nn7LBToYPAUIDRstfryn5tdh9IMWMXKm7a1zBW1UNnlPOmcYxwl+zVfJeIqDOXfa/uAbQJAokBM1nkfx1KJufO0sdAd2eX7yiHFPv5WPqBRwOQi90CGk507JekmSB0p48AZLOn7Mx4+o+uvPUlVWtM98geAJ37WrZY4jjO78bsHNNHMu4melM/0s/dUrzjGgpXs+icU3Rx9P/z4+JoXdpKTKitsqJbyVv+ieoGryL4hzLbsqGL/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+F3aIegA3u/833F6gMRwP2NISH8rsFyKxTlNN/IV1Y=;
 b=iefCMEdXOj8aYUnx3SHKaC0ELJOgUCJOh5hYZigw5ekOEk3aeptuschahfaDQf2TsuBd0b9jdWRNFvJn7ymEF30GdD0AAo/wwopY3P8iXudq3i9MmYahqGR1G7V6XWPNFCWi4ULqFB+L1umadl6Jhk7//T1dzwwTPk3jLQIYOzPX/UYWPEJIv6rYyETrvoX7laxP5mMXyqytbUg9bok9+CK0Dt6q7cRHwT2j4toe7vnaP8QvRVLmMZSnD7VJookaQF1T4PCcjL8a++QQlTEymnmR+Ip0Rf6v2HNpsMPzcd9m/7xB3nfCIxb/ReggsAoNV4dZ4l7qPlAjLtXiDnOLRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1;spf=pass
 smtp.mailfrom=amd.com;dmarc=pass action=none header.from=amd.com;dkim=pass
 header.d=amd.com;arc=none
Received: from MN2PR12MB2910.namprd12.prod.outlook.com (20.179.81.219) by
 MN2PR12MB4175.namprd12.prod.outlook.com (52.135.48.141) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2094.12; Thu, 18 Jul 2019 13:02:24 +0000
Received: from MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4]) by MN2PR12MB2910.namprd12.prod.outlook.com
 ([fe80::9158:a228:2506:85e4%6]) with mapi id 15.20.2073.012; Thu, 18 Jul 2019
 13:02:24 +0000
From: Chunming Zhou <zhoucm1@amd.com>
To: Lionel Landwerlin <lionel.g.landwerlin@intel.com>, "Zhou, David(ChunMing)"
 <David1.Zhou@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Topic: [PATCH] drm/syncobj: return meaningful value to user space
Thread-Index: AQHVPVnoqE0gPkoYWUCt/IPkTJivbabQPf2AgAAZI4A=
Date: Thu, 18 Jul 2019 13:02:24 +0000
Message-ID: <d7085a57-b9fc-c5d8-bea2-10cabb80f0f8@amd.com>
References: <20190718111339.25126-1-david1.zhou@amd.com>
 <3bef64d0-97be-6aed-aa10-7a4592e7fb54@intel.com>
In-Reply-To: <3bef64d0-97be-6aed-aa10-7a4592e7fb54@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: HK2PR02CA0175.apcprd02.prod.outlook.com
 (2603:1096:201:21::11) To MN2PR12MB2910.namprd12.prod.outlook.com
 (2603:10b6:208:af::27)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [180.167.199.185]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ea4cd52-4038-4a65-4aa4-08d70b802d49
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:MN2PR12MB4175; 
x-ms-traffictypediagnostic: MN2PR12MB4175:
x-microsoft-antispam-prvs: <MN2PR12MB417542E5BAC322CFD49F2C21B4C80@MN2PR12MB4175.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:6430;
x-forefront-prvs: 01026E1310
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(136003)(366004)(39860400002)(346002)(376002)(396003)(189003)(199004)(3846002)(66556008)(66446008)(66946007)(64756008)(81156014)(81166006)(26005)(66476007)(2906002)(6116002)(71200400001)(71190400001)(102836004)(53546011)(386003)(52116002)(31686004)(6506007)(229853002)(36756003)(5660300002)(2501003)(76176011)(186003)(316002)(11346002)(446003)(6486002)(31696002)(6246003)(7736002)(478600001)(476003)(486006)(2616005)(305945005)(53936002)(68736007)(6436002)(66066001)(256004)(110136005)(8936002)(14454004)(99286004)(8676002)(25786009)(6512007);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB4175;
 H:MN2PR12MB2910.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: SZyC42HLBXJdUvYPpMmtVUeqCJTj94xslIhDlpbTGzbzj2klSdze2HqpcFsKod5BtqsHB2sUKhMgWXHOe1boiQ5qRm6g3kiExhTBlBFiYNzim64QKAzkx531bSA0QRByPFFzXV9ZlLQ8i3zoD72RS4nmzBzDUBgemIw3j1QIFEcgdojNSI9UZeRikLmIBgMXF9hVFepjkDnMxE/teSpNF+RfFh49AVa/ncfsffzrzxcSB0+CeWxZ8Mn+svAdeYkJvym1S/IcERHhDrYzw7HrOAbge/zEbeu/CLB4Q4DXKVE6a1eARL3fxlf+OSeJT2JsSQ1Yq+PPJ+R1uEBUsp7nOOea3aS54Q5KCV6abgAQNU7hqGYw7cAhLIRoyurka3WVIMk+rn7WTe0vc6v4pg5sQ1TbA9ckm2Qb0tQck8Brkw8=
Content-ID: <31C8E6DD48F44B479F23490BC1986111@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea4cd52-4038-4a65-4aa4-08d70b802d49
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2019 13:02:24.2130 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: zhoucm1@amd.com
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4175
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector1-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v+F3aIegA3u/833F6gMRwP2NISH8rsFyKxTlNN/IV1Y=;
 b=eXtfBDFDRmHdwgHVp+t4Yatg/OHgAtB4BhyjrN7GY2QGsCRCLpjVzFWY1SvgTx/V9cO7VkG1UYURDfIrnp6AD5lFMS+146ZBMwyc9rrMNTkgDbt1UuSZVEDpL65Quc30BZahDqQRq25RihmWxvDTQ6kKHz7sIx+4h2hSfy818nQ=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=David1.Zhou@amd.com; 
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

DQrlnKggMjAxOS83LzE4IDE5OjMxLCBMaW9uZWwgTGFuZHdlcmxpbiDlhpnpgZM6DQo+IE9uIDE4
LzA3LzIwMTkgMTQ6MTMsIENodW5taW5nIFpob3Ugd3JvdGU6DQo+PiBpZiBXQUlUX0ZPUl9TVUJN
SVQgaXNuJ3Qgc2V0IGFuZCBpbiB0aGUgbWVhbndoaWxlIG5vIHVuZGVybHlpbmcgZmVuY2UgDQo+
PiBvbiBzeW5jb2JqLA0KPj4gdGhlbiByZXR1cm4gbm9uLWJsb2NrIGVycm9yIGNvZGUgdG8gdXNl
ciBzYXBjZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBDaHVubWluZyBaaG91IDxkYXZpZDEuemhv
dUBhbWQuY29tPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYyB8
IDQgKystLQ0KPj4gwqAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9zeW5jb2JqLmMg
DQo+PiBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3luY29iai5jDQo+PiBpbmRleCAzNjFhMDFhMDhj
MTguLjkyOWY3YzY0ZjlhMiAxMDA2NDQNCj4+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9kcm1fc3lu
Y29iai5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX3N5bmNvYmouYw0KPj4gQEAgLTI1
Miw3ICsyNTIsNyBAQCBpbnQgZHJtX3N5bmNvYmpfZmluZF9mZW5jZShzdHJ1Y3QgZHJtX2ZpbGUg
DQo+PiAqZmlsZV9wcml2YXRlLA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJu
IDA7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqAgZG1hX2ZlbmNlX3B1dCgqZmVuY2UpOw0KPj4gwqDC
oMKgwqDCoCB9IGVsc2Ugew0KPj4gLcKgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU5WQUw7DQo+PiAr
wqDCoMKgwqDCoMKgwqAgcmV0ID0gLUVOT1RCTEs7DQo+PiDCoMKgwqDCoMKgIH0NCj4+IMKgIMKg
wqDCoMKgwqAgaWYgKCEoZmxhZ3MgJiBEUk1fU1lOQ09CSl9XQUlUX0ZMQUdTX1dBSVRfRk9SX1NV
Qk1JVCkpDQo+PiBAQCAtODMyLDcgKzgzMiw3IEBAIHN0YXRpYyBzaWduZWQgbG9uZyANCj4+IGRy
bV9zeW5jb2JqX2FycmF5X3dhaXRfdGltZW91dChzdHJ1Y3QgZHJtX3N5bmNvYmogKipzeW5jb2Jq
cywNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlmIChmbGFncyAmIERSTV9TWU5DT0JK
X1dBSVRfRkxBR1NfV0FJVF9GT1JfU1VCTUlUKSB7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGNvbnRpbnVlOw0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgfSBl
bHNlIHsNCj4+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdGltZW91dCA9IC1FSU5W
QUw7DQo+PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHRpbWVvdXQgPSAtRU5PVEJM
SzsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgZ290byBjbGVhbnVwX2Vu
dHJpZXM7DQo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB9DQo+PiDCoMKgwqDCoMKgwqDC
oMKgwqAgfQ0KPg0KPg0KPiBUaGlzIHdvdWxkIGJyZWFrIGV4aXN0aW5nIHRlc3RzIGZvciBiaW5h
cnkgc3luY29ianMuDQoNCkhvdyBkb2VzIHRoaXMgYnJlYWtzIGJpbmFyeSBzeW5jb2JqPw0KDQoN
Cj4NCj4gSXMgdGhpcyByZWFsbHkgd2hhdCB3ZSB3YW50Pw0KDQpJIHdhbnQgdG8gdXNlIHRoaXMg
bWVhbmluZ2Z1bCByZXR1cm4gdmFsdWUgdG8ganVkZ2UgaWYgV2FpdEJlZm9yZVNpZ25hbCANCmhh
cHBlbnMuDQoNCkkgdGhpbmsgdGhpcyBpcyB0aGUgY2hlYXBlc3QgY2hhbmdlIGZvciB0aGF0Lg0K
DQotRGF2aWQNCg0KDQo+DQo+DQo+IC1MaW9uZWwNCj4NCj4NCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmRyaS1kZXZlbCBtYWlsaW5nIGxpc3QKZHJpLWRl
dmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2RyaS1kZXZlbA==
