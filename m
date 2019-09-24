Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A88B9BC74E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Sep 2019 13:55:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62E4E6EA13;
	Tue, 24 Sep 2019 11:55:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-eopbgr710052.outbound.protection.outlook.com [40.107.71.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0C866EA10;
 Tue, 24 Sep 2019 11:55:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NYmwNBovc9dX5j+fjAfNbbmou6QJFhBO1eEN8gsH8/zeoi+rBHrb92bKuj0ey5uefYll3UwtgfMuZSQrgelPPSYBRYYB4RQuj8/bM/NSlhAc/8ydVmS0F40ZGGyGM2Bn8z/oN8BxsOwLneAI1LoPh3QDYy+0z9srNsDcZ8o/9HP4lgspZscMjuSfXf/maZSWjCUux4vg2pAihkbHh7+AIEMZ9QTLoU9h+opIoZdlAexN3y4O+PosCzXHAZ8OtbIav8/I/LPcf5NxM7ZaazqK85ghk2KUY+CPPcTk6NT+7yjsa3MBitwcl6P9po8SyaeIUb4fVi0nMlUV9ZdzTAmZag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPMV0rl4ufjlOZLXV/IbXQTrZ0S/z55DCvrCnZ1FAbQ=;
 b=DEP2LTer+jRVU2MoZAqWcmaVxmVuWYgBU9dVJnSQOL3TLjEsfkqUCquE22bUfn95UjpSWhScSBpFF6lbUTIbxSePPMknZOUDmAaiKuB9TM8XYbRjTYi/0otfH8KBYtwBctFNvOjPzA7NEMTyb7HwWQxfveq44bD+nm6jbEIcNAnt8ioJ7M/B2Q+2DxIBaJAOJb37S5pIxwMLkLtP51mUp4JNhTQ0DptxqqxTjHOtVFnpf/eDU0pJF847yPWSTw9LiYcZytaa1iaphWsAW4cL5usDPJAozbHiGb5Il1hei0C4BhW7c/IrqJ/cLTfqwLXODFly16x/5bX9U5Zvtgw2Pg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM5PR12MB1705.namprd12.prod.outlook.com (10.175.88.22) by
 DM5PR12MB1627.namprd12.prod.outlook.com (10.172.40.21) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2284.26; Tue, 24 Sep 2019 11:55:38 +0000
Received: from DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc]) by DM5PR12MB1705.namprd12.prod.outlook.com
 ([fe80::9d43:b3d4:9ef:29fc%8]) with mapi id 15.20.2284.023; Tue, 24 Sep 2019
 11:55:38 +0000
From: "Koenig, Christian" <Christian.Koenig@amd.com>
To: "Huang, Ray" <Ray.Huang@amd.com>
Subject: Re: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Topic: [PATCH 14/14] drm/amdgpu: set TMZ bits in PTEs for secure bo (v2)
Thread-Index: AQHVaJcoxE5tDnLT8kO2X76kLSCUPqcmY2CAgAF0vQCAABaogIAS3BSAgAAB5wA=
Date: Tue, 24 Sep 2019 11:55:37 +0000
Message-ID: <67e37f42-694f-df02-2bac-3772459aead2@amd.com>
References: <1568202584-14471-1-git-send-email-ray.huang@amd.com>
 <1568202584-14471-15-git-send-email-ray.huang@amd.com>
 <5704cdc8-754e-538e-9547-738ef81efa7c@amd.com>
 <MN2PR12MB3309544896408F62494EC8B3ECB00@MN2PR12MB3309.namprd12.prod.outlook.com>
 <26355f8a-d16b-e406-8cfc-b30742419121@amd.com>
 <MN2PR12MB33099517C5365BD6274A1491EC840@MN2PR12MB3309.namprd12.prod.outlook.com>
In-Reply-To: <MN2PR12MB33099517C5365BD6274A1491EC840@MN2PR12MB3309.namprd12.prod.outlook.com>
Accept-Language: de-DE, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
x-originating-ip: [2a02:908:1252:fb60:be8a:bd56:1f94:86e7]
x-clientproxiedby: AM4PR0202CA0008.eurprd02.prod.outlook.com
 (2603:10a6:200:89::18) To DM5PR12MB1705.namprd12.prod.outlook.com
 (2603:10b6:3:10c::22)
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 247972e7-cfc8-4784-7e7c-08d740e61d5f
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600167)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);
 SRVR:DM5PR12MB1627; 
x-ms-traffictypediagnostic: DM5PR12MB1627:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM5PR12MB1627024539B7E59B66DCA96183840@DM5PR12MB1627.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-forefront-prvs: 0170DAF08C
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(376002)(136003)(39860400002)(346002)(366004)(396003)(199004)(189003)(13464003)(6636002)(31696002)(486006)(446003)(11346002)(2616005)(316002)(476003)(6486002)(54906003)(46003)(37006003)(86362001)(6512007)(81156014)(81166006)(31686004)(4326008)(6862004)(305945005)(8936002)(66446008)(64756008)(66556008)(66946007)(6436002)(65956001)(8676002)(66476007)(25786009)(229853002)(58126008)(76176011)(7736002)(6116002)(5660300002)(53546011)(102836004)(386003)(6506007)(186003)(14454004)(2906002)(6246003)(65806001)(36756003)(478600001)(71200400001)(99286004)(450100002)(52116002)(71190400001)(14444005)(256004)(21314003);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM5PR12MB1627;
 H:DM5PR12MB1705.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; A:1; MX:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2XFjFdRTq/zW4zEqrtIoY2HbbwX+/39NmpLNn/eqUuc4Lh5rWFlsj9Bv6yAFSg3m3dB1EAHP2qgQ0zQik6pGs2rRQ3KKPeySD6smgkHnmXNojUOHKOxWUx/z2y4XA9iNyhiauzKNUcYCMjmohIDLA8JDaAJOPUSvO8GH0Q9DTrUgO4iHikB7a5F2wV/ulpq7pIgdVpvMatCAugxiWR+fZ9EUYz54MVs0DWZwzcAFShco+NWIsVQdmOHmLlyL/oVzbnxArp3op+lmoc7hi/tRNZLpABXLVZPvshczxggDlaHRsUIk/5p+U08w3UlhewMOku0uxPl3CSkvXXu9cwbadVSv5FBxvhPJhzt6TdT8oGRF9ziQwMV7Ul4onN0waeb7wvzO+vcznaOne/RnmUMt5Z6k30riUNeh3C1piCTwU9U=
Content-ID: <D36C821B5A99B74581DED4A41278251B@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 247972e7-cfc8-4784-7e7c-08d740e61d5f
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Sep 2019 11:55:37.9886 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Ad8Xg1pSV+gPhqA4oFDwQvEZ8gtruSKAxbl7J7ArqJolbZPKWOMuA9qxuny5715a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1627
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KPMV0rl4ufjlOZLXV/IbXQTrZ0S/z55DCvrCnZ1FAbQ=;
 b=FM8B8s30u83SSfaOud2qTFSBDrfIv4Eore2m/j9yull8tq3v2D88lac0Fru4Cz8SxorTOeRrYAEDaB6DSST97vfO0wNlMEqxpvYgCmTJyVX9HDaH0fgIndrJqYjf9GC7HUG5+qO51reR3BbeWMjFTlTdlJ7yzvLS2p1v7+wcq0U=
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>, "Tuikov,
 Luben" <Luben.Tuikov@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>, "Liu,
 Aaron" <Aaron.Liu@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

QW0gMjQuMDkuMTkgdW0gMTM6NDggc2NocmllYiBIdWFuZywgUmF5Og0KPj4gLS0tLS1PcmlnaW5h
bCBNZXNzYWdlLS0tLS0NCj4+IEZyb206IEtvZW5pZywgQ2hyaXN0aWFuIDxDaHJpc3RpYW4uS29l
bmlnQGFtZC5jb20+DQo+PiBTZW50OiBUaHVyc2RheSwgU2VwdGVtYmVyIDEyLCAyMDE5IDc6NDkg
UE0NCj4+IFRvOiBIdWFuZywgUmF5IDxSYXkuSHVhbmdAYW1kLmNvbT4NCj4+IENjOiBhbWQtZ2Z4
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsN
Cj4+IERldWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT47IFR1aWtv
diwgTHViZW4NCj4+IDxMdWJlbi5UdWlrb3ZAYW1kLmNvbT47IExpdSwgQWFyb24gPEFhcm9uLkxp
dUBhbWQuY29tPg0KPj4gU3ViamVjdDogUmU6IFtQQVRDSCAxNC8xNF0gZHJtL2FtZGdwdTogc2V0
IFRNWiBiaXRzIGluIFBURXMgZm9yIHNlY3VyZSBibw0KPj4gKHYyKQ0KPj4NCj4+IEFtIDEyLjA5
LjE5IHVtIDEyOjI3IHNjaHJpZWIgSHVhbmcsIFJheToNCj4+PiBPbiBXZWQsIFNlcCAxMSwgMjAx
OSBhdCAwODoxMzoxOVBNICswODAwLCBLb2VuaWcsIENocmlzdGlhbiB3cm90ZToNCj4+Pj4gQW0g
MTEuMDkuMTkgdW0gMTM6NTAgc2NocmllYiBIdWFuZywgUmF5Og0KPj4+Pj4gRnJvbTogQWxleCBE
ZXVjaGVyIDxhbGV4YW5kZXIuZGV1Y2hlckBhbWQuY29tPg0KPj4+Pj4NCj4+Pj4+IElmIG9uZSBi
byBpcyBzZWN1cmUgKGNyZWF0ZWQgd2l0aCBBTURHUFVfR0VNX0NSRUFURV9FTkNSWVBURUQpLA0K
Pj4gdGhlDQo+Pj4+PiBUTVogYml0cyBvZiBQVEVzIHRoYXQgYmVsb25ncyB0aGF0IGJvIHNob3Vs
ZCBiZSBzZXQuIFRoZW4gcHNwIGlzDQo+Pj4+PiBhYmxlIHRvIHByb3RlY3QgdGhlIHBhZ2VzIG9m
IHRoaXMgYm8gdG8gYXZvaWQgdGhlIGFjY2VzcyBmcm9tIGFuICJ1bnRydXN0Ig0KPj4gZG9tYWlu
IHN1Y2ggYXMgQ1BVLg0KPj4+Pj4gdjE6IGRlc2lnbiBhbmQgZHJhZnQgdGhlIHNrZWxldGlvbiBv
ZiB0bXogYml0cyBzZXR0aW5nIG9uIFBURXMNCj4+Pj4+IChBbGV4KQ0KPj4+Pj4gdjI6IHJldHVy
biBmYWlsdXJlIG9uY2UgY3JlYXRlIHNlY3VyZSBibyBvbiBuby10bXogcGxhdGZvcm0gIChSYXkp
DQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogQWxleCBEZXVjaGVyIDxhbGV4YW5kZXIuZGV1
Y2hlckBhbWQuY29tPg0KPj4+Pj4gUmV2aWV3ZWQtYnk6IEh1YW5nIFJ1aSA8cmF5Lmh1YW5nQGFt
ZC5jb20+DQo+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBIdWFuZyBSdWkgPHJheS5odWFuZ0BhbWQuY29t
Pg0KPj4+Pj4gLS0tDQo+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1
X2dlbS5jICAgIHwgMTIgKysrKysrKysrKystDQo+Pj4+PiAgICAgZHJpdmVycy9ncHUvZHJtL2Ft
ZC9hbWRncHUvYW1kZ3B1X29iamVjdC5oIHwgMTAgKysrKysrKysrKw0KPj4+Pj4gICAgIGRyaXZl
cnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYyAgICB8ICA1ICsrKysrDQo+Pj4+PiAg
ICAgMyBmaWxlcyBjaGFuZ2VkLCAyNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+Pj4+
Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9n
ZW0uYw0KPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4+
Pj4+IGluZGV4IDIyZWFiNzQuLjUzMzIxMDQgMTAwNjQ0DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dw
dS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfZ2VtLmMNCj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9hbWQvYW1kZ3B1L2FtZGdwdV9nZW0uYw0KPj4+Pj4gQEAgLTIyMiw3ICsyMjIsOCBAQCBpbnQg
YW1kZ3B1X2dlbV9jcmVhdGVfaW9jdGwoc3RydWN0IGRybV9kZXZpY2UNCj4+ICpkZXYsIHZvaWQg
KmRhdGEsDQo+Pj4+PiAgICAgCQkgICAgICBBTURHUFVfR0VNX0NSRUFURV9DUFVfR1RUX1VTV0Mg
fA0KPj4+Pj4gICAgIAkJICAgICAgQU1ER1BVX0dFTV9DUkVBVEVfVlJBTV9DTEVBUkVEIHwNCj4+
Pj4+ICAgICAJCSAgICAgIEFNREdQVV9HRU1fQ1JFQVRFX1ZNX0FMV0FZU19WQUxJRCB8DQo+Pj4+
PiAtCQkgICAgICBBTURHUFVfR0VNX0NSRUFURV9FWFBMSUNJVF9TWU5DKSkNCj4+Pj4+ICsJCSAg
ICAgIEFNREdQVV9HRU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkMgfA0KPj4+Pj4gKwkJICAgICAgQU1E
R1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEKSkNCj4+Pj4+DQo+Pj4+PiAgICAgCQlyZXR1cm4gLUVJ
TlZBTDsNCj4+Pj4+DQo+Pj4+PiBAQCAtMjMwLDYgKzIzMSwxMSBAQCBpbnQgYW1kZ3B1X2dlbV9j
cmVhdGVfaW9jdGwoc3RydWN0DQo+PiBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsDQo+Pj4+
PiAgICAgCWlmIChhcmdzLT5pbi5kb21haW5zICYgfkFNREdQVV9HRU1fRE9NQUlOX01BU0spDQo+
Pj4+PiAgICAgCQlyZXR1cm4gLUVJTlZBTDsNCj4+Pj4+DQo+Pj4+PiArCWlmICghYWRldi0+dG16
LmVuYWJsZWQgJiYgKGZsYWdzICYNCj4+IEFNREdQVV9HRU1fQ1JFQVRFX0VOQ1JZUFRFRCkpIHsN
Cj4+Pj4+ICsJCURSTV9FUlJPUigiQ2Fubm90IGFsbG9jYXRlIHNlY3VyZSBidWZmZXIgd2hpbGUg
dG16IGlzDQo+PiBkaXNhYmxlZFxuIik7DQo+Pj4+PiArCQlyZXR1cm4gLUVJTlZBTDsNCj4+Pj4+
ICsJfQ0KPj4+Pj4gKw0KPj4+Pj4gICAgIAkvKiBjcmVhdGUgYSBnZW0gb2JqZWN0IHRvIGNvbnRh
aW4gdGhpcyBvYmplY3QgaW4gKi8NCj4+Pj4+ICAgICAJaWYgKGFyZ3MtPmluLmRvbWFpbnMgJiAo
QU1ER1BVX0dFTV9ET01BSU5fR0RTIHwNCj4+Pj4+ICAgICAJICAgIEFNREdQVV9HRU1fRE9NQUlO
X0dXUyB8IEFNREdQVV9HRU1fRE9NQUlOX09BKSkNCj4+IHsgQEAgLTI1MSw2DQo+Pj4+PiArMjU3
LDEwIEBAIGludCBhbWRncHVfZ2VtX2NyZWF0ZV9pb2N0bChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LA0KPj4gdm9pZCAqZGF0YSwNCj4+Pj4+ICAgICAJCXJlc3YgPSB2bS0+cm9vdC5iYXNlLmJvLT50
Ym8ucmVzdjsNCj4+Pj4+ICAgICAJfQ0KPj4+Pj4NCj4+Pj4+ICsJaWYgKGZsYWdzICYgQU1ER1BV
X0dFTV9DUkVBVEVfRU5DUllQVEVEKSB7DQo+Pj4+PiArCQkvKiBYWFg6IHBhZCBvdXQgYWxpZ25t
ZW50IHRvIG1lZXQgVE1aIHJlcXVpcmVtZW50cyAqLw0KPj4+Pj4gKwl9DQo+Pj4+PiArDQo+Pj4+
PiAgICAgCXIgPSBhbWRncHVfZ2VtX29iamVjdF9jcmVhdGUoYWRldiwgc2l6ZSwgYXJncy0+aW4u
YWxpZ25tZW50LA0KPj4+Pj4gICAgIAkJCQkgICAgICh1MzIpKDB4ZmZmZmZmZmYgJiBhcmdzLT5p
bi5kb21haW5zKSwNCj4+Pj4+ICAgICAJCQkJICAgICBmbGFncywgdHRtX2JvX3R5cGVfZGV2aWNl
LCByZXN2LCAmZ29iaik7DQo+PiBkaWZmIC0tZ2l0DQo+Pj4+PiBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaA0KPj4+Pj4gYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2Ft
ZGdwdS9hbWRncHVfb2JqZWN0LmgNCj4+Pj4+IGluZGV4IDVhM2MxNzcuLjI4NmUyZTIgMTAwNjQ0
DQo+Pj4+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfb2JqZWN0LmgN
Cj4+Pj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9vYmplY3QuaA0K
Pj4+Pj4gQEAgLTIyNCw2ICsyMjQsMTYgQEAgc3RhdGljIGlubGluZSBib29sDQo+PiBhbWRncHVf
Ym9fZXhwbGljaXRfc3luYyhzdHJ1Y3QgYW1kZ3B1X2JvICpibykNCj4+Pj4+ICAgICAJcmV0dXJu
IGJvLT5mbGFncyAmIEFNREdQVV9HRU1fQ1JFQVRFX0VYUExJQ0lUX1NZTkM7DQo+Pj4+PiAgICAg
fQ0KPj4+Pj4NCj4+Pj4+ICsvKioNCj4+Pj4+ICsgKiBhbWRncHVfYm9fZW5jcnlwdGVkIC0gcmV0
dXJuIHdoZXRoZXIgdGhlIGJvIGlzIGVuY3J5cHRlZCAgKi8NCj4+Pj4+ICtzdGF0aWMgaW5saW5l
IGJvb2wgYW1kZ3B1X2JvX2VuY3J5cHRlZChzdHJ1Y3QgYW1kZ3B1X2JvICpibykgew0KPj4+Pj4g
KwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAqYWRldiA9IGFtZGdwdV90dG1fYWRldihiby0+dGJvLmJk
ZXYpOw0KPj4+Pj4gKw0KPj4+Pj4gKwlyZXR1cm4gYWRldi0+dG16LmVuYWJsZWQgJiYgKGJvLT5m
bGFncyAmDQo+Pj4+PiArQU1ER1BVX0dFTV9DUkVBVEVfRU5DUllQVEVEKTsNCj4+Pj4gQ2hlY2tp
bmcgdGhlIGFkZXYtPnRtei5lbmFibGVkIGZsYWdzIHNob3VsZCBiZSBkcm9wcGVkIGhlcmUuDQo+
Pj4+DQo+Pj4gVGhhdCdzIGZpbmUuIEJPIHNob3VsZCBiZSB2YWxpZGF0ZWQgd2hpbGUgaXQgaXMg
Y3JlYXRlZC4NCj4+Pg0KPj4+IEJ1dCBpZiB0aGUgQk8gaXMgY3JlYXRlZCBieSB2bWlkIDAsIGlz
IHRoaXMgY2hlY2tpbmcgbmVlZGVkPw0KPj4+DQo+Pj4+PiArfQ0KPj4+Pj4gKw0KPj4+Pj4gICAg
IGJvb2wgYW1kZ3B1X2JvX2lzX2FtZGdwdV9ibyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKmJv
KTsNCj4+Pj4+ICAgICB2b2lkIGFtZGdwdV9ib19wbGFjZW1lbnRfZnJvbV9kb21haW4oc3RydWN0
IGFtZGdwdV9ibyAqYWJvLA0KPj4gdTMyDQo+Pj4+PiBkb21haW4pOw0KPj4+Pj4NCj4+Pj4+IGRp
ZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMNCj4+Pj4+
IGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jDQo+Pj4+PiBpbmRleCAz
NjYzNjU1Li44ZjAwYmIyIDEwMDY0NA0KPj4+Pj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jDQo+Pj4+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfdHRtLmMNCj4+Pj4+IEBAIC0xNDM0LDYgKzE0MzQsOCBAQCBib29sIGFtZGdwdV90
dG1fdHRfaXNfcmVhZG9ubHkoc3RydWN0DQo+PiB0dG1fdHQgKnR0bSkNCj4+Pj4+ICAgICB1aW50
NjRfdCBhbWRncHVfdHRtX3R0X3BkZV9mbGFncyhzdHJ1Y3QgdHRtX3R0ICp0dG0sIHN0cnVjdA0K
Pj4gdHRtX21lbV9yZWcgKm1lbSkNCj4+Pj4+ICAgICB7DQo+Pj4+PiAgICAgCXVpbnQ2NF90IGZs
YWdzID0gMDsNCj4+Pj4+ICsJc3RydWN0IHR0bV9idWZmZXJfb2JqZWN0ICp0Ym8gPSB0dG1fbWVt
X3JlZ190b19ibyhtZW0pOw0KPj4+Pj4gKwlzdHJ1Y3QgYW1kZ3B1X2JvICphYm8gPSB0dG1fdG9f
YW1kZ3B1X2JvKHRibyk7DQo+Pj4+IFRoYXQncyBhIGNsZWFyIE5BSy4gVGhlIGZ1bmN0aW9uIGlz
IG5vdCBuZWNlc3NhcmlseSBjYWxsZWQgd2l0aA0KPj4+PiAmYm8tPm1lbSwgd2hpY2ggaXMgYWxz
byB0aGUgcmVhc29uIHdoeSB0aGlzIGZ1bmN0aW9uIGRvZXNuJ3QgZ2V0cyB0aGUNCj4+Pj4gQk8g
YXMgcGFyYW1ldGVyLg0KPj4+Pg0KPj4+IERvIHlvdSBtZWFuIHdlIGNhbiByZXZpc2UgdGhlIGJl
bG93IGZ1bmN0aW9ucyB0byB1c2UgYm8gYXMgdGhlDQo+Pj4gcGFyYW1ldGVyIGluc3RlYWQ/DQo+
Pj4NCj4+PiB1aW50NjRfdCBhbWRncHVfdHRtX3R0X3BkZV9mbGFncyhzdHJ1Y3QgdHRtX3R0ICp0
dG0sIHN0cnVjdCBhbWRncHVfYm8NCj4+PiAqYm8pIHVpbnQ2NF90IGFtZGdwdV90dG1fdHRfcHRl
X2ZsYWdzKHN0cnVjdCB0dG1fdHQgKnR0bSwgc3RydWN0DQo+Pj4gYW1kZ3B1X2JvICpibykNCj4+
IElmIHRoYXQgaXMgcG9zc2libGUgdGhlbiB0aGlzIHdvdWxkIGluZGVlZCBiZSBhIHNvbHV0aW9u
IGZvciB0aGUgcHJvYmxlbS4NCj4+DQo+IFNvcnJ5IHRvIGxhdGUgcmVzcG9uc2UsIEkgd2FzIHJl
dmlzaW5nIHRoZSB1bml0IHRlc3QgZm9yIHNlY3VyZSBtZW1vcnkgZmV3IGRheXMgYWdvLg0KPg0K
PiBNb3N0IG9mIGNhc2VzIGNhbiBiZSB1cGRhdGVkIHRvIGFtZGdwdV90dG1fdHRfcHRlX2ZsYWdz
IHdpdGggYW1kZ3B1X2JvIGFzIHRoZSBwYXJhbWV0ZXIgZXhjZXB0IG9uZSBjYXNlIGluDQo+IGFt
ZGdwdV90dG1fYmFja2VuZF9iaW5kKCkuIEl0IHdpbGwgYmUgY2FsbGVkIGJ5IHR0bV90dF9iaW5k
KCkgdW5kZXIgYW1kZ3B1X21vdmVfdnJhbV9yYW0oKS4gQnV0IHR0bV9tZW1fcmVnIGlzIG5ldyBh
c3NpZ25lZC4NCj4NCj4gSG93IGFib3V0IHVzaW5nIG1vZGlmeSB0aGUgYmluZCBjYWxsYmFjayBp
biB0dG1fYmFja2VuZF9mdW5jOg0KPg0KPiBpbnQgKCpiaW5kKSAoc3RydWN0IHR0bV9idWZmZXJf
b2JqZWN0ICpibywgc3RydWN0IHR0bV9tZW1fcmVnICpib19tZW0pOw0KDQpUaGF0IHdvbid0IHdv
cmsgY29ycmVjdGx5Lg0KDQpCaW5kaW5nIGFuZCB1bmJpbmRpbmcgdGhlIHR0bV9tZW1fcmVnIGZy
b20gdGhlIEdBUlQgaXMgc2VwYXJhdGUgdG8gdGhlIA0KQk8uIEUuZy4gdGhlIEJPIGNhbiBsb25n
IGJlIGRlc3Ryb3llZCBvciBpdCBjb3VsZCBiZSBhIGdob3N0IEJPLg0KDQo+DQo+IFRoZW4gd2Ug
Y2FuIHVwZGF0ZSB0aGUgZm9sbG93aW5nIGZ1bmN0aW9ucyBhczoNCj4NCj4gdWludDY0X3QgYW1k
Z3B1X3R0bV90dF9wdGVfZmxhZ3Moc3RydWN0IGFtZGdwdV9kZXZpY2UgKmFkZXYsIHN0cnVjdCB0
dG1fYnVmZmVyX29iamVjdCAqdGJvLCAgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pOw0KPiB1aW50
NjRfdCBhbWRncHVfdHRtX3R0X3BkZV9mbGFncyhzdHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRi
bywgc3RydWN0IHR0bV9tZW1fcmVnICptZW0pOw0KPg0KPiBJdCBsb29rcyBiZXR0ZXIgdGhhbiBi
ZWZvcmUuDQoNClRoZSB3aG9sZSBhcHByb2FjaCBvZiBhZGRpbmcgdGhlIFRNWiBmbGFnIHRvIGFt
ZGdwdV90dG1fdHRfcHRlX2ZsYWdzKCkgDQppcyBjb21wbGV0ZWx5IGJyb2tlbiBieSBkZXNpZ24u
IFJhdGhlciBhZGQgYWRkaW5nIHRoZSBmbGFnIHRvIA0KYW1kZ3B1X3ZtX2JvX3VwZGF0ZSgpIGlu
c3RlYWQuDQoNClJlZ2FyZHMsDQpDaHJpc3RpYW4uDQoNCj4NCj4gVGhhbmtzLA0KPiBSYXkNCj4N
Cj4+IENocmlzdGlhbi4NCj4+DQo+Pj4gVGhhbmtzLA0KPj4+IFJheQ0KPj4+DQo+Pj4+IENocmlz
dGlhbi4NCj4+Pj4NCj4+Pj4+ICAgICAJaWYgKG1lbSAmJiBtZW0tPm1lbV90eXBlICE9IFRUTV9Q
TF9TWVNURU0pDQo+Pj4+PiAgICAgCQlmbGFncyB8PSBBTURHUFVfUFRFX1ZBTElEOw0KPj4+Pj4g
QEAgLTE0NDQsNiArMTQ0Niw5IEBAIHVpbnQ2NF90IGFtZGdwdV90dG1fdHRfcGRlX2ZsYWdzKHN0
cnVjdA0KPj4gdHRtX3R0ICp0dG0sIHN0cnVjdCB0dG1fbWVtX3JlZyAqbWVtKQ0KPj4+Pj4gICAg
IAkJaWYgKHR0bS0+Y2FjaGluZ19zdGF0ZSA9PSB0dF9jYWNoZWQpDQo+Pj4+PiAgICAgCQkJZmxh
Z3MgfD0gQU1ER1BVX1BURV9TTk9PUEVEOw0KPj4+Pj4gICAgIAl9DQo+Pj4+PiArCWlmIChhbWRn
cHVfYm9fZW5jcnlwdGVkKGFibykpIHsNCj4+Pj4+ICsJCWZsYWdzIHw9IEFNREdQVV9QVEVfVE1a
Ow0KPj4+Pj4gKwl9DQo+Pj4+Pg0KPj4+Pj4gICAgIAlyZXR1cm4gZmxhZ3M7DQo+Pj4+PiAgICAg
fQ0KDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpkcmkt
ZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9kcmktZGV2ZWw=
