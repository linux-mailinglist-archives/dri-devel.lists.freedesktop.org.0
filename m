Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A62108852
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2019 06:30:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 231EF89EAE;
	Mon, 25 Nov 2019 05:30:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN3-obe.outbound.protection.outlook.com
 (mail-eopbgr680048.outbound.protection.outlook.com [40.107.68.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DB9A89DC5;
 Mon, 25 Nov 2019 05:30:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IrmLrS3MV/AXMyhJx5lSrsC8td99Rkzkt1lPzeT+T8ifHkhLR9fFKpZkUDGsAJ1wEydxhd4e2yuzPLZhlhfZT0Oq+4vHMUfQPuzXuoFskX0DZet0PxB2c3tq3zfFgP496w49mFtFhmuPldrAopa+qcf7xtkn1j/74hX1IB1+/uCT7MeOkq3LKHsxADrUHwBaiQgsW3IC4VJNogkkgqRSLzOfC76X2q/KHNh6nZ87AusgUrvlteVRUhVG9IjzG+BuFIEr5UFks/BMnIghqP9dkQGdhYXDBFsONX4teRaC7GWj1tqvoJ6LfSV5JvqbjugXGC1apJeKjOYQ9jCjNNUN/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pjzcnk6K2am4nUMtX2neFfCxt1XrrwEX+qAH7b6awKA=;
 b=TOjppW0g+PkoxKiD4kpswEXi6RQD7UxCoB/70tpzcIh6E103hFveLTeU8uoA342gfYcRnAdI5QZhPm+SGC7CBu2IMsomyrcDVwyQfZvI+eEuxeIVeAT2THIx3aIhHtzLgXZ+jp98MovUsKdjBgL9vCjWk1w514ThMfB5injG/SUZ8X0aW1v//r3qM92TNnAE2Bp10RR2+wa+ltaMGbCGJLigZ+4t4Fui6L3PffuoIHuE0Qe7kupl6ceGSfN/PI2W3ipDOiEG90TdvJlcAbNY5ueTGr5/DDN+4uHh3kyWnu7uqpI7qpcJ4uB2qP1OYQFveprr2i+3Of8rdGCth5w4lA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Received: from MN2PR12MB3344.namprd12.prod.outlook.com (20.178.241.74) by
 MN2PR12MB3134.namprd12.prod.outlook.com (20.178.241.79) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2474.22; Mon, 25 Nov 2019 05:30:09 +0000
Received: from MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587]) by MN2PR12MB3344.namprd12.prod.outlook.com
 ([fe80::5895:bbd8:c1d6:1587%7]) with mapi id 15.20.2474.023; Mon, 25 Nov 2019
 05:30:09 +0000
From: "Quan, Evan" <Evan.Quan@amd.com>
To: Alex Deucher <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH] MAINTAINERS: Drop Rex Zhu for amdgpu powerplay
Thread-Topic: [PATCH] MAINTAINERS: Drop Rex Zhu for amdgpu powerplay
Thread-Index: AQHVoWmzI5QYc4V9KUmO7PjS0zu2PqebX93g
Date: Mon, 25 Nov 2019 05:30:08 +0000
Message-ID: <MN2PR12MB3344BBC1DD8197F263BAFC63E44A0@MN2PR12MB3344.namprd12.prod.outlook.com>
References: <20191122191841.441550-1-alexander.deucher@amd.com>
In-Reply-To: <20191122191841.441550-1-alexander.deucher@amd.com>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [180.167.199.189]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: e14631c0-6e73-4204-fe90-08d771688951
x-ms-traffictypediagnostic: MN2PR12MB3134:|MN2PR12MB3134:
x-ms-exchange-purlcount: 1
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB3134E577C65A4CD65637DA05E44A0@MN2PR12MB3134.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:854;
x-forefront-prvs: 0232B30BBC
x-forefront-antispam-report: SFV:NSPM;
 SFS:(10009020)(4636009)(396003)(136003)(39860400002)(366004)(346002)(376002)(13464003)(189003)(199004)(66946007)(7736002)(26005)(102836004)(33656002)(14454004)(7696005)(4326008)(110136005)(9686003)(446003)(71200400001)(66476007)(5660300002)(6506007)(53546011)(52536014)(66556008)(64756008)(66446008)(966005)(81156014)(81166006)(6246003)(71190400001)(76116006)(99286004)(478600001)(2501003)(3846002)(6116002)(8936002)(2201001)(74316002)(86362001)(305945005)(14444005)(256004)(76176011)(2906002)(8676002)(45080400002)(229853002)(186003)(25786009)(66066001)(6436002)(6306002)(316002)(55016002)(11346002);
 DIR:OUT; SFP:1101; SCL:1; SRVR:MN2PR12MB3134;
 H:MN2PR12MB3344.namprd12.prod.outlook.com; FPR:; SPF:None; LANG:en;
 PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: amd.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: =?utf-8?B?amZ6Y0VxWkNyK0JwQUJKUVhCaDNEdW43NGZSdUZpSDNHUDQyQWNuTUJldEx5?=
 =?utf-8?B?SE5RcU9UUVJZSXd4NEJnNkVNN2QrNWVFVndUNHFpMnZQRkJFaWZ4cjZZL0xY?=
 =?utf-8?B?U3VJN091NzFpOTFOdzk3RzJSQ2NsTmM2Z2x0M1R0OHYrMGYrL0FBWmRPQVdw?=
 =?utf-8?B?YUwvR1ZqVmdibUhJWTF0cTBvTVpsdjVtTkFETFU4eE1oZTV6ZU1DQnA1eUc2?=
 =?utf-8?B?dy9yVUNMT1h2U3pnMHdSUEU3WDFERDdnSjVqVFpzRnlxNzdSZEtMT3ZocVBT?=
 =?utf-8?B?S3MwSWVtMitEMmI3RmNqRHhMeHZNWTd1OXZKQVB6WWJtZEZMcDdITGlaTzQ0?=
 =?utf-8?B?VTMrRHE1aXBLLzdFQk1OOWZOaGNBbXBRSFdRUG1JRlJBeUs5WVBYcVRZV00w?=
 =?utf-8?B?UFlubVlsNUk5a0g2NjVhbExtOXNhL3QvTWd0SFJ1WDBnSUY5WG5kVGZNZHpo?=
 =?utf-8?B?dGJTbXRQSWp0SVJzUkpwWlJHMFRWdzVTN0NHem1mc1Vua21WcXkxV2hzS3hP?=
 =?utf-8?B?aFk1c0ZpdW9wRi8xTHBPaU43ZjRXVlZkWnU1a1RhcisyTWlMQ1hnS0lBT2FK?=
 =?utf-8?B?YzY0b0VFMDEwMUltR3BCUHZSUWtmRmNOVTJrRHJSOUNrRDg1b3RiRE04VVA4?=
 =?utf-8?B?M2g4bHdoM0EwSldnOWZ2T1pUdTBOUmVLNkNWbnl3aEFZVFBzWGgzdlA0dmdD?=
 =?utf-8?B?WTY1a0VjY2QrZnA0RTRUVjJEZGVHYnJaejlDdU5ZZ0d1SnB5WkttLzhDb0M4?=
 =?utf-8?B?VVd6QTBDMUluUnh3VjhxUlBwTDZuaHZZZGZkMjQ5VERLc09iR2lBWVRoeXFP?=
 =?utf-8?B?d1BiODIydXNDYkpoUFhObGJyRjFvOUhDTFdYMUNuTHdhdGNLNHNzZjNRY1hR?=
 =?utf-8?B?aHRnSVBmQzlkV2I1bHYrVTJneTR2Ulh6NGcvWlU3RDYzOHYxQnFGZEpzRnZ5?=
 =?utf-8?B?bTdRZnJOSExlY01BSTZxeEFTZEVtdCtxWDF3S1RUVXRCZ1AvY2JqZmNPaUFK?=
 =?utf-8?B?ckw1aG5mUC9JTTlINDZZK3NnOHpubjU0SnZoZkU2RGJQdTBGWGlza0l6dUtk?=
 =?utf-8?B?aXFtY2hQZWptVk1tU0gzSVo1a2ovMkluS2JTMjZYQjd0Z2dsYzZKczdub2th?=
 =?utf-8?B?RG53azJXT3VrMXhQejVEeWFYSmRjTm9wQVU5MktlSHd6azlmOGxobHFjVStE?=
 =?utf-8?B?cjk0WHBxR0hJN00zUHNldDRPS2c4VmpNaVlhSWZBb2JaT0FKRGU4VDhjRGQ0?=
 =?utf-8?B?bk9IamFaYUNJSEpZN281OStaZlVKVUFJeGZOY0RRUnVmdTdYSVNUcHVCZHBP?=
 =?utf-8?B?OUdHRFBQb3k2dG9odElBS0htMmc2L0QzMG1peEZSZXJ3WnVFWmFiR0EvcWpu?=
 =?utf-8?B?M2ZkVVJDNFNXVmw2RGNpakRYWlVyZW9RMjArWWlOMkNOT0U5YjFmejNjK0dX?=
 =?utf-8?B?akRNNXpIOG9FTm5lVnlISVNOdHRhZkhpc3FMeVpvdDFCQzFldUZLWXU4LzhM?=
 =?utf-8?B?M0RMMVNzTSt4OEtMbXNCdzlua2xrck1zUHNiMnM5VzhMRkhodlh5Z1kxeStS?=
 =?utf-8?B?dzVNL0hDaEpQMDB0RXVyNXJiRE91SXN2L080RHNoUWNJSE9DT00rMXVtdk9j?=
 =?utf-8?B?V2tVeTBIaVVDeUxKa1FMcEl0V2RQQUtnZmpJcnNYc1FPMmJqNDJKUHM2RFJk?=
 =?utf-8?B?TGpHaWRhWUUrc0U2VkMydjZMQk1MMjlURzNVUktFR2U5aXFzMm9kT3BtRkxx?=
 =?utf-8?B?WnFiMnA1a3BzUG4vc3Rxa2VSaU04MnZnUFQwb09sZVdiTE9KZkQ5OTdyYUdp?=
 =?utf-8?B?N1JFZEZVNHo1ZW1UM3dQcmVlM3hnTWNTaXlNUWo5WHFLcXczc08yUUJweUE0?=
 =?utf-8?B?ZmJVd0JaTElSR3llNlhUT1R3QnpLRnh1WDJ0dXl0enJFdWNvMlI5L3Q4bmhR?=
 =?utf-8?B?a0dLaW40UmtLSXFPZndMQ0lKQ2NxUERiU1BCZHZ6ZjM0ZUhhazh3am5SQ3ZY?=
 =?utf-8?B?c1h5VStZdmNybWlVMFZVZHA2L2o5TU9nQkg3aE9MaHNPemI5OHc4ZWdkTDBR?=
 =?utf-8?B?NlJld25KTnZmOCsyMVVKbWRUU0JVWThWOHI4RHZwbTEzR3BxdnlDaWVpdXRk?=
 =?utf-8?B?T25YRUwvZXhlaElrU3FvMWNQU21lc09NN0M3RFlCT3lJR1l4QS9nVWNianps?=
 =?utf-8?B?akV4STh1OHI2NW9SVHdsNlVIWWhDTUh4Zk9ma1Q0ZmpJRFlxbDR6S3dVSG40?=
 =?utf-8?B?L0QzQkZBb3NWWTlpbXN4eWg4ZEFaRXZPU2laSnpGR3E0Y1pqVVZBMytHUFkx?=
 =?utf-8?B?Lzk1Y1kvdUh5MGpFRE42RnYzQ1pObzZkVkh0a3gwZGh3SG83OUlYMmJWT052?=
 =?utf-8?B?RW5MYWRicmxlOTdUTktva0p5NjlnNU9vMDFBenpBSCtZRzVJT2hYRDlRbUZS?=
 =?utf-8?B?eldWT1NlMXZJSXlzRFZJWXp6UkxuMGQvcUlMTTVONG1OQWVZK0xhRkZDTTZD?=
 =?utf-8?B?dzM3cW9qZXU4YjRqakppK3RJNHdwVWhQRndObFJGOVRPeExPcVR2TDNaSFFK?=
 =?utf-8?Q?JsUwQUUtbccX3oQnVM0xirz1Q9FuwO?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e14631c0-6e73-4204-fe90-08d771688951
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2019 05:30:08.8965 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: WuhQqJiKg//0iCOAs56eCNkyOKE74W+lCDzaVFic+J+cxtGrHoVpyd7T8+vtJvwj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB3134
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amdcloud.onmicrosoft.com; s=selector2-amdcloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pjzcnk6K2am4nUMtX2neFfCxt1XrrwEX+qAH7b6awKA=;
 b=LN1hfZ+TQIIFdSuo66u39nsmoLQ6Kezut2MZvC3pBr8YRUpt0SAP70RNegNf8TdCyQF/5xmKAZG608s3b44w/KgMD8uFCH2I/RUYfVe2lYelIQIYQpRY7DTv3v2ZjwY/hpLZl4jGVDHRJBpw0SNxQEdNI3hRdB7JzIMaQmhnZFw=
X-Mailman-Original-Authentication-Results: spf=none (sender IP is )
 smtp.mailfrom=Evan.Quan@amd.com; 
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
Cc: "Deucher, Alexander" <Alexander.Deucher@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEV2YW4gUXVhbiA8ZXZhbi5xdWFuQGFtZC5jb20+DQoNCj4gLS0tLS1Pcmln
aW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogYW1kLWdmeCA8YW1kLWdmeC1ib3VuY2VzQGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZz4gT24gQmVoYWxmIE9mIEFsZXgNCj4gRGV1Y2hlcg0KPiBTZW50OiBT
YXR1cmRheSwgTm92ZW1iZXIgMjMsIDIwMTkgMzoxOSBBTQ0KPiBUbzogYW1kLWdmeEBsaXN0cy5m
cmVlZGVza3RvcC5vcmc7IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERl
dWNoZXIsIEFsZXhhbmRlciA8QWxleGFuZGVyLkRldWNoZXJAYW1kLmNvbT4NCj4gU3ViamVjdDog
W1BBVENIXSBNQUlOVEFJTkVSUzogRHJvcCBSZXggWmh1IGZvciBhbWRncHUgcG93ZXJwbGF5DQo+
IA0KPiBObyBsb25nZXIgd29ya3Mgb24gdGhlIGRyaXZlci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6
IEFsZXggRGV1Y2hlciA8YWxleGFuZGVyLmRldWNoZXJAYW1kLmNvbT4NCj4gLS0tDQo+ICBNQUlO
VEFJTkVSUyB8IDEgLQ0KPiAgMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCj4gDQo+IGRp
ZmYgLS1naXQgYS9NQUlOVEFJTkVSUyBiL01BSU5UQUlORVJTDQo+IGluZGV4IGI2M2MyOTFhZDAy
OS4uZDUxODU4OGI5ODc5IDEwMDY0NA0KPiAtLS0gYS9NQUlOVEFJTkVSUw0KPiArKysgYi9NQUlO
VEFJTkVSUw0KPiBAQCAtODU2LDcgKzg1Niw2IEBAIFM6CU1haW50YWluZWQNCj4gIEY6CWRyaXZl
cnMvaTJjL2J1c3Nlcy9pMmMtYW1kLW1wMioNCj4gDQo+ICBBTUQgUE9XRVJQTEFZDQo+IC1NOglS
ZXggWmh1IDxyZXguemh1QGFtZC5jb20+DQo+ICBNOglFdmFuIFF1YW4gPGV2YW4ucXVhbkBhbWQu
Y29tPg0KPiAgTDoJYW1kLWdmeEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gIFM6CVN1cHBvcnRl
ZA0KPiAtLQ0KPiAyLjIzLjANCj4gDQo+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fDQo+IGFtZC1nZnggbWFpbGluZyBsaXN0DQo+IGFtZC1nZnhAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0
bG9vay5jb20vP3VybD1odHRwcyUzQSUyRiUyRmxpc3RzLmZyZWUNCj4gZGVza3RvcC5vcmclMkZt
YWlsbWFuJTJGbGlzdGluZm8lMkZhbWQtDQo+IGdmeCZhbXA7ZGF0YT0wMiU3QzAxJTdDZXZhbi5x
dWFuJTQwYW1kLmNvbSU3Q2E2NGNhODVhN2M0YTQxYzJkNQ0KPiAyNDA4ZDc2ZjgwZDE5MSU3QzNk
ZDg5NjFmZTQ4ODRlNjA4ZTExYTgyZDk5NGUxODNkJTdDMCU3QzAlN0M2MzcNCj4gMTAwNDcxNDI0
NjY3MTUyJmFtcDtzZGF0YT1JbG5HaEZIMWpITFRGazZOZkxzWk5HSSUyRkM3UU5jWXJFUjdUR0cN
Cj4gdU1iVkU0JTNEJmFtcDtyZXNlcnZlZD0wDQpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZlbEBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9kcmktZGV2ZWw=
