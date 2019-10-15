Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5908BD79DE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Oct 2019 17:34:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3D296E82F;
	Tue, 15 Oct 2019 15:34:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM01-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr820042.outbound.protection.outlook.com [40.107.82.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2155A6E372;
 Tue, 15 Oct 2019 15:34:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CRHO+p5n1BCQQSnZ034lz9CB/kOtNo2XY40iIH8HAxEfSykixjTigqQ3ciUTvJW7uo1GCtmw+9t+v6GXglUX6gIGg0d0iX+dlYrrv7LLysPKf4GpN+DvmYObni+PGTUWaedL6KiDBOml1HKW/wOHOu3fD02l2yIH7Ro5Yy5e4CU7TAxcwN6Jq39lOEdIVSDpJKCN6My3B2FH964mbxzfD5WFaZTfZq48K7Cr6Z3G4dkO/Z7ZPM/loVoGn4leYmDY3hFlBANU3mL8ysuu1yauh+XIg2jgXQWROlMv5l4EwInWf4nVZrGA94qtgds3D+rHHxwZMVkPihctsNV76zDvkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6HDp38ZWsC30UwgmfuLOfpJVySErgvB6VZLcoJGNNU=;
 b=JE+1Yq1cukUa9D2KSTKQBeFjdFHXZeYlRbJxIiaB3d8ftwpg4s6pV83qdC9TidtP5f7LrQH575tbAW++JvszG9FsfxJ19HHMdAqMEou0X4xsp0F774DIib/oYz/zxJhVx1xWety2ttepKz0SbCcnPr+sOolZ9Sm+eDuw3rhu5fNKR/fKkWE/C9w8OPExOMD9UUdTOwchzV6Y9YD4fF+a56Qv52ECEpcAzyNy93yqlNxH8H3+g+Z+6IJV7cpVf+EpcUTuAUmLu77ytv+0x+4PEQizo+47/MyW70peVPRpdvobLuDRdrWoY83nGmT/Hkhm7n+uiQLZdTQWbVlMt1IX3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from DM6PR12MB4236.namprd12.prod.outlook.com (10.141.184.142) by
 DM6PR12MB3385.namprd12.prod.outlook.com (20.178.198.80) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2347.16; Tue, 15 Oct 2019 15:34:11 +0000
Received: from DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::f85b:e64c:1a31:8e95]) by DM6PR12MB4236.namprd12.prod.outlook.com
 ([fe80::f85b:e64c:1a31:8e95%2]) with mapi id 15.20.2347.023; Tue, 15 Oct 2019
 15:34:11 +0000
From: "Lakha, Bhawanpreet" <Bhawanpreet.Lakha@amd.com>
To: "Wu, Hersen" <hersenxs.wu@amd.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>
Subject: Re: [PATCH] drm/amdgpu/display: hook renoir dc to pplib funcs
Thread-Topic: [PATCH] drm/amdgpu/display: hook renoir dc to pplib funcs
Thread-Index: AQHVg2nltYPa3IXcekCE1VIzI4slzKdb1SYA
Date: Tue, 15 Oct 2019 15:34:11 +0000
Message-ID: <eb002983-846f-8b76-2b68-fe83a5316ffc@amd.com>
References: <20191015150443.11456-1-hersenxs.wu@amd.com>
In-Reply-To: <20191015150443.11456-1-hersenxs.wu@amd.com>
Accept-Language: en-CA, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: YTOPR0101CA0004.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:15::17) To DM6PR12MB4236.namprd12.prod.outlook.com
 (2603:10b6:5:212::14)
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [165.204.55.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 36890c8e-712f-40e8-948a-08d7518520a1
x-ms-office365-filtering-ht: Tenant
x-ms-traffictypediagnostic: DM6PR12MB3385:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <DM6PR12MB338554CBD8ED60041F80DD07F9930@DM6PR12MB3385.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:1051;
x-forefront-prvs: 01917B1794
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(376002)(39860400002)(136003)(366004)(346002)(189003)(199004)(66066001)(2616005)(446003)(86362001)(110136005)(6246003)(54906003)(5660300002)(52116002)(186003)(102836004)(4001150100001)(36756003)(31696002)(305945005)(7736002)(6116002)(3846002)(2201001)(26005)(99286004)(486006)(476003)(4326008)(6436002)(6486002)(11346002)(316002)(386003)(53546011)(6506007)(76176011)(229853002)(6512007)(8936002)(81156014)(81166006)(8676002)(14454004)(64756008)(256004)(14444005)(450100002)(71190400001)(66446008)(71200400001)(25786009)(31686004)(66946007)(66556008)(66476007)(2501003)(2906002)(478600001);
 DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR12MB3385;
 H:DM6PR12MB4236.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: MECSNsDn0MAywz5qPzNj6sKmOcN0OTf9d9ydb8JWuSlrOUjFPLzW70tYmiK8Qhc0rUIleHKUf2U+Xq9Dp1VV88zMx9mG3aWXbBEtwFvWMIbRyYTEVm4ptBTdJyYbsk2SJYiQlQlsET/1HG3R8wzD1OyA2Sryvy/lAllJ2mfzwNdUgkHK4VQ47wVsQrOrL7bTyp6OLSol9jfPirAiYtce+81p8q5vBbBKulSyhyTr66rfz8arZLaCkEWctAQQ6Ua7zRgv4LYtIHoBm8SjDHHW4NdGcnsdPhYLuAPN/i0ysPaZ4oJSU8tGdW4hI+SrbiHfkhpTcoOWPriC08ayNapv2UO1mjA4RQN6VZkIjoihennzE4KJXQo/Ij5HZEu0kOWzXE6mcAj4HumKlD1kxhyXVXEbDOsi4yDgY0d1M+dRuwY=
Content-ID: <C4C2C52F11553F4FA79CD6180D12102D@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36890c8e-712f-40e8-948a-08d7518520a1
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Oct 2019 15:34:11.8136 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: c5m/wXbSJk2OnKr9OMNxLTaGOdPQAAE1N+WPbQ1uqUB50v9iPLz3x35wwNaBb2Ey
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3385
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6HDp38ZWsC30UwgmfuLOfpJVySErgvB6VZLcoJGNNU=;
 b=jkW7GunfJioXqw4D4uolk3y3BcHj/FWL8MW2uWKja8esCNG5YRjgUXkFlZlCTueY/aisFk9oJgkRnIeDFuZZtGLDFFrAYHJvr0RJWU7joADBzKzNAUa8cY4kCpLYHZFSTJ57AaDUTfGAuBuAM2hm9Eot0vA3TKBLJgtB5VG3jPs=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Bhawanpreet.Lakha@amd.com; 
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
Cc: "Li, Sun peng \(Leo\)" <Sunpeng.Li@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEJoYXdhbnByZWV0IExha2hhIDxCaGF3YW5wcmVldC5MYWtoYUBhbWQuY29t
Pg0KDQpPbiAyMDE5LTEwLTE1IDExOjA0IGEubS4sIEhlcnNlbiBXdSB3cm90ZToNCj4gZW5hYmxl
IGRjIGdldCBkbXAgY2xvY2sgdGFibGUgYW5kIHNldCBkY24gd2F0ZXJtYXJrcw0KPiB2aWEgcHBs
aWIuDQo+DQo+IFNpZ25lZC1vZmYtYnk6IEhlcnNlbiBXdSA8aGVyc2VueHMud3VAYW1kLmNvbT4N
Cj4gLS0tDQo+ICAgLi4uL2FtZC9kaXNwbGF5L2FtZGdwdV9kbS9hbWRncHVfZG1fcHBfc211LmMg
IHwgOTMgKysrKysrKysrKysrKysrKysrKw0KPiAgIGRyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxh
eS9kYy9kbV9wcF9zbXUuaCAgICB8ICAyICstDQo+ICAgMiBmaWxlcyBjaGFuZ2VkLCA5NCBpbnNl
cnRpb25zKCspLCAxIGRlbGV0aW9uKC0pDQo+DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYyBiL2RyaXZlcnMvZ3B1
L2RybS9hbWQvZGlzcGxheS9hbWRncHVfZG0vYW1kZ3B1X2RtX3BwX3NtdS5jDQo+IGluZGV4IDk1
NTY0YjhkZTNjZS4uN2FkZDQwZGVhOWI3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYw0KPiArKysgYi9kcml2ZXJz
L2dwdS9kcm0vYW1kL2Rpc3BsYXkvYW1kZ3B1X2RtL2FtZGdwdV9kbV9wcF9zbXUuYw0KPiBAQCAt
ODkxLDYgKzg5MSw5MCBAQCBlbnVtIHBwX3NtdV9zdGF0dXMgcHBfbnZfZ2V0X3VjbGtfZHBtX3N0
YXRlcyhzdHJ1Y3QgcHBfc211ICpwcCwNCj4gICAJcmV0dXJuIFBQX1NNVV9SRVNVTFRfRkFJTDsN
Cj4gICB9DQo+ICAgDQo+ICsjaWZkZWYgQ09ORklHX0RSTV9BTURfRENfRENOMl8xDQo+ICtlbnVt
IHBwX3NtdV9zdGF0dXMgcHBfcm5fZ2V0X2RwbV9jbG9ja190YWJsZSgNCj4gKwkJc3RydWN0IHBw
X3NtdSAqcHAsIHN0cnVjdCBkcG1fY2xvY2tzICpjbG9ja190YWJsZSkNCj4gK3sNCj4gKwljb25z
dCBzdHJ1Y3QgZGNfY29udGV4dCAqY3R4ID0gcHAtPmRtOw0KPiArCXN0cnVjdCBhbWRncHVfZGV2
aWNlICphZGV2ID0gY3R4LT5kcml2ZXJfY29udGV4dDsNCj4gKwlzdHJ1Y3Qgc211X2NvbnRleHQg
KnNtdSA9ICZhZGV2LT5zbXU7DQo+ICsNCj4gKwlpZiAoIXNtdS0+cHB0X2Z1bmNzKQ0KPiArCQly
ZXR1cm4gUFBfU01VX1JFU1VMVF9VTlNVUFBPUlRFRDsNCj4gKw0KPiArCWlmICghc211LT5wcHRf
ZnVuY3MtPmdldF9kcG1fY2xvY2tfdGFibGUpDQo+ICsJCXJldHVybiBQUF9TTVVfUkVTVUxUX1VO
U1VQUE9SVEVEOw0KPiArDQo+ICsJaWYgKCFzbXUtPnBwdF9mdW5jcy0+Z2V0X2RwbV9jbG9ja190
YWJsZShzbXUsIGNsb2NrX3RhYmxlKSkNCj4gKwkJcmV0dXJuIFBQX1NNVV9SRVNVTFRfT0s7DQo+
ICsNCj4gKwlyZXR1cm4gUFBfU01VX1JFU1VMVF9GQUlMOw0KPiArfQ0KPiArDQo+ICtlbnVtIHBw
X3NtdV9zdGF0dXMgcHBfcm5fc2V0X3dtX3JhbmdlcyhzdHJ1Y3QgcHBfc211ICpwcCwNCj4gKwkJ
c3RydWN0IHBwX3NtdV93bV9yYW5nZV9zZXRzICpyYW5nZXMpDQo+ICt7DQo+ICsJY29uc3Qgc3Ry
dWN0IGRjX2NvbnRleHQgKmN0eCA9IHBwLT5kbTsNCj4gKwlzdHJ1Y3QgYW1kZ3B1X2RldmljZSAq
YWRldiA9IGN0eC0+ZHJpdmVyX2NvbnRleHQ7DQo+ICsJc3RydWN0IHNtdV9jb250ZXh0ICpzbXUg
PSAmYWRldi0+c211Ow0KPiArCXN0cnVjdCBkbV9wcF93bV9zZXRzX3dpdGhfY2xvY2tfcmFuZ2Vz
X3NvYzE1IHdtX3dpdGhfY2xvY2tfcmFuZ2VzOw0KPiArCXN0cnVjdCBkbV9wcF9jbG9ja19yYW5n
ZV9mb3JfZG1pZl93bV9zZXRfc29jMTUgKndtX2RjZV9jbG9ja3MgPQ0KPiArCQkJd21fd2l0aF9j
bG9ja19yYW5nZXMud21fZG1pZl9jbG9ja3NfcmFuZ2VzOw0KPiArCXN0cnVjdCBkbV9wcF9jbG9j
a19yYW5nZV9mb3JfbWNpZl93bV9zZXRfc29jMTUgKndtX3NvY19jbG9ja3MgPQ0KPiArCQkJd21f
d2l0aF9jbG9ja19yYW5nZXMud21fbWNpZl9jbG9ja3NfcmFuZ2VzOw0KPiArCWludDMyX3QgaTsN
Cj4gKw0KPiArCWlmICghc211LT5mdW5jcykNCj4gKwkJcmV0dXJuIFBQX1NNVV9SRVNVTFRfVU5T
VVBQT1JURUQ7DQo+ICsNCj4gKwl3bV93aXRoX2Nsb2NrX3Jhbmdlcy5udW1fd21fZG1pZl9zZXRz
ID0gcmFuZ2VzLT5udW1fcmVhZGVyX3dtX3NldHM7DQo+ICsJd21fd2l0aF9jbG9ja19yYW5nZXMu
bnVtX3dtX21jaWZfc2V0cyA9IHJhbmdlcy0+bnVtX3dyaXRlcl93bV9zZXRzOw0KPiArDQo+ICsJ
Zm9yIChpID0gMDsgaSA8IHdtX3dpdGhfY2xvY2tfcmFuZ2VzLm51bV93bV9kbWlmX3NldHM7IGkr
Kykgew0KPiArCQlpZiAocmFuZ2VzLT5yZWFkZXJfd21fc2V0c1tpXS53bV9pbnN0ID4gMykNCj4g
KwkJCXdtX2RjZV9jbG9ja3NbaV0ud21fc2V0X2lkID0gV01fU0VUX0E7DQo+ICsJCWVsc2UNCj4g
KwkJCXdtX2RjZV9jbG9ja3NbaV0ud21fc2V0X2lkID0NCj4gKwkJCQkJcmFuZ2VzLT5yZWFkZXJf
d21fc2V0c1tpXS53bV9pbnN0Ow0KPiArDQo+ICsJCXdtX2RjZV9jbG9ja3NbaV0ud21fbWluX2Rj
ZmNsa19jbGtfaW5fa2h6ID0NCj4gKwkJCXJhbmdlcy0+cmVhZGVyX3dtX3NldHNbaV0ubWluX2Ry
YWluX2Nsa19taHo7DQo+ICsNCj4gKwkJd21fZGNlX2Nsb2Nrc1tpXS53bV9tYXhfZGNmY2xrX2Ns
a19pbl9raHogPQ0KPiArCQkJcmFuZ2VzLT5yZWFkZXJfd21fc2V0c1tpXS5tYXhfZHJhaW5fY2xr
X21oejsNCj4gKw0KPiArCQl3bV9kY2VfY2xvY2tzW2ldLndtX21pbl9tZW1fY2xrX2luX2toeiA9
DQo+ICsJCQlyYW5nZXMtPnJlYWRlcl93bV9zZXRzW2ldLm1pbl9maWxsX2Nsa19taHo7DQo+ICsN
Cj4gKwkJd21fZGNlX2Nsb2Nrc1tpXS53bV9tYXhfbWVtX2Nsa19pbl9raHogPQ0KPiArCQkJcmFu
Z2VzLT5yZWFkZXJfd21fc2V0c1tpXS5tYXhfZmlsbF9jbGtfbWh6Ow0KPiArCX0NCj4gKw0KPiAr
CWZvciAoaSA9IDA7IGkgPCB3bV93aXRoX2Nsb2NrX3Jhbmdlcy5udW1fd21fbWNpZl9zZXRzOyBp
KyspIHsNCj4gKwkJaWYgKHJhbmdlcy0+d3JpdGVyX3dtX3NldHNbaV0ud21faW5zdCA+IDMpDQo+
ICsJCQl3bV9zb2NfY2xvY2tzW2ldLndtX3NldF9pZCA9IFdNX1NFVF9BOw0KPiArCQllbHNlDQo+
ICsJCQl3bV9zb2NfY2xvY2tzW2ldLndtX3NldF9pZCA9DQo+ICsJCQkJCXJhbmdlcy0+d3JpdGVy
X3dtX3NldHNbaV0ud21faW5zdDsNCj4gKwkJd21fc29jX2Nsb2Nrc1tpXS53bV9taW5fc29jY2xr
X2Nsa19pbl9raHogPQ0KPiArCQkJCXJhbmdlcy0+d3JpdGVyX3dtX3NldHNbaV0ubWluX2ZpbGxf
Y2xrX21oejsNCj4gKw0KPiArCQl3bV9zb2NfY2xvY2tzW2ldLndtX21heF9zb2NjbGtfY2xrX2lu
X2toeiA9DQo+ICsJCQlyYW5nZXMtPndyaXRlcl93bV9zZXRzW2ldLm1heF9maWxsX2Nsa19taHo7
DQo+ICsNCj4gKwkJd21fc29jX2Nsb2Nrc1tpXS53bV9taW5fbWVtX2Nsa19pbl9raHogPQ0KPiAr
CQkJcmFuZ2VzLT53cml0ZXJfd21fc2V0c1tpXS5taW5fZHJhaW5fY2xrX21oejsNCj4gKw0KPiAr
CQl3bV9zb2NfY2xvY2tzW2ldLndtX21heF9tZW1fY2xrX2luX2toeiA9DQo+ICsJCQlyYW5nZXMt
PndyaXRlcl93bV9zZXRzW2ldLm1heF9kcmFpbl9jbGtfbWh6Ow0KPiArCX0NCj4gKw0KPiArCXNt
dV9zZXRfd2F0ZXJtYXJrc19mb3JfY2xvY2tfcmFuZ2VzKCZhZGV2LT5zbXUsICZ3bV93aXRoX2Ns
b2NrX3Jhbmdlcyk7DQo+ICsNCj4gKwlyZXR1cm4gUFBfU01VX1JFU1VMVF9PSzsNCj4gK30NCj4g
KyNlbmRpZg0KPiArDQo+ICAgdm9pZCBkbV9wcF9nZXRfZnVuY3MoDQo+ICAgCQlzdHJ1Y3QgZGNf
Y29udGV4dCAqY3R4LA0KPiAgIAkJc3RydWN0IHBwX3NtdV9mdW5jcyAqZnVuY3MpDQo+IEBAIC05
MzUsNiArMTAxOSwxNSBAQCB2b2lkIGRtX3BwX2dldF9mdW5jcygNCj4gICAJCWZ1bmNzLT5udl9m
dW5jcy5zZXRfcHN0YXRlX2hhbmRzaGFrZV9zdXBwb3J0ID0gcHBfbnZfc2V0X3BzdGF0ZV9oYW5k
c2hha2Vfc3VwcG9ydDsNCj4gICAJCWJyZWFrOw0KPiAgICNlbmRpZg0KPiArDQo+ICsjaWZkZWYg
Q09ORklHX0RSTV9BTURfRENfRENOMl8xDQo+ICsJY2FzZSBEQ05fVkVSU0lPTl8yXzE6DQo+ICsJ
CWZ1bmNzLT5jdHgudmVyID0gUFBfU01VX1ZFUl9STjsNCj4gKwkJZnVuY3MtPnJuX2Z1bmNzLnBw
X3NtdS5kbSA9IGN0eDsNCj4gKwkJZnVuY3MtPnJuX2Z1bmNzLnNldF93bV9yYW5nZXMgPSBwcF9y
bl9zZXRfd21fcmFuZ2VzOw0KPiArCQlmdW5jcy0+cm5fZnVuY3MuZ2V0X2RwbV9jbG9ja190YWJs
ZSA9IHBwX3JuX2dldF9kcG1fY2xvY2tfdGFibGU7DQo+ICsJCWJyZWFrOw0KPiArI2VuZGlmDQo+
ICAgCWRlZmF1bHQ6DQo+ICAgCQlEUk1fRVJST1IoInNtdSB2ZXJzaW9uIGlzIG5vdCBzdXBwb3J0
ZWQgIVxuIik7DQo+ICAgCQlicmVhazsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9h
bWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaCBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9k
Yy9kbV9wcF9zbXUuaA0KPiBpbmRleCBjMDNhNDQxZWU2MzguLjI0ZDY1ZGJiZDc0OSAxMDA2NDQN
Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9kaXNwbGF5L2RjL2RtX3BwX3NtdS5oDQo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvZGlzcGxheS9kYy9kbV9wcF9zbXUuaA0KPiBAQCAtMjUy
LDcgKzI1Miw3IEBAIHN0cnVjdCBwcF9zbXVfZnVuY3NfbnYgew0KPiAgICNpZiBkZWZpbmVkKENP
TkZJR19EUk1fQU1EX0RDX0RDTjJfMSkNCj4gICANCj4gICAjZGVmaW5lIFBQX1NNVV9OVU1fU09D
Q0xLX0RQTV9MRVZFTFMgIDgNCj4gLSNkZWZpbmUgUFBfU01VX05VTV9EQ0ZDTEtfRFBNX0xFVkVM
UyAgNA0KPiArI2RlZmluZSBQUF9TTVVfTlVNX0RDRkNMS19EUE1fTEVWRUxTICA4DQo+ICAgI2Rl
ZmluZSBQUF9TTVVfTlVNX0ZDTEtfRFBNX0xFVkVMUyAgICA0DQo+ICAgI2RlZmluZSBQUF9TTVVf
TlVNX01FTUNMS19EUE1fTEVWRUxTICA0DQo+ICAgDQpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9kcmktZGV2ZWw=
