Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BAFD534A72
	for <lists+dri-devel@lfdr.de>; Thu, 26 May 2022 08:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F0FF10F47C;
	Thu, 26 May 2022 06:47:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-AM5-obe.outbound.protection.outlook.com
 (mail-eopbgr00116.outbound.protection.outlook.com [40.107.0.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C86DA10E680
 for <dri-devel@lists.freedesktop.org>; Wed, 25 May 2022 23:50:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HE31mk0mRDatIsSixw80tfm418O9ipfsSkQXnwLldH5+jIwpdSfxgyXIb+XKLeDsT1UcGFsriaoQqIEkxQaRV/kf3MyU4e9Nap61X3TY+FDitNl9tLq2NMNB0sQaMXdGKxgQKQQkYsQNhozAm0wDnJ3w6KsG4xm4rWYyb6vEru0fpIhb/i4X4WWEx7klaWwpMQ4GgXkzzueWe7eAsb70WjpLUX3Yk93q7zYkPujmGmhYCEvRZvN8ffQpSxhFaEGvMgHyCaLsVUVCJKUeXnjsR//YUQOYTVM81pkHfBliyBV/UrY7K+08App0MIEm1XngGhx+c7wTpt0Nj+tZUFJT5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RQh2nXdd5ucoGpGCGOtyiRhuNaShCO8yhn/78rn4pQ8=;
 b=YLhpZtqV5O5SqkGISH1TSjquA5xmWz9mIzjrlk1rT32r+tg2mA2WKYi+Ve7kyQKhxVEV6Xk89v/aqU6KPiCepwuGS+B5xtr3HhoV6YGpUt3/3v5uYhqt35lDWMrsXNpWSSyo8U0ipiuBA441VnHs8zNmf4zu+qbuSlDl/HIYnUdmnPW6sTQyoGk5AJvHj/6LJGt/RO7eOfuCxTAGJflAi1RNvBrWzmIIuEFYBcmnUHs80wiifSdj7iB/iSrCLz7hZ133Yn4QI8t/w/6jh6fVUKPiqA6AdVzIb3+PH3wi5PpmkQsKugXIdF275D0EsPY/DnCnUFXI8g4A92JVUy1T6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bang-olufsen.dk; dmarc=pass action=none
 header.from=bang-olufsen.dk; dkim=pass header.d=bang-olufsen.dk; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bang-olufsen.dk;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RQh2nXdd5ucoGpGCGOtyiRhuNaShCO8yhn/78rn4pQ8=;
 b=B/Cnv8asfqjGKNqDgEDitWQ0vnq0wH6fIS3lFnwVEFxXcuksCT4HP4/1V5DRLfblESZcAFxPtT8x6uh3QSL77Qrd3Ptk14TrKuHqzLUxWvXi7CwpCTUJpdotoBh6ZWE1Q7wDLVBgf7jWogEWfQZCWgR+/0bpmSmqqSqqdQU3oVQ=
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com (2603:10a6:20b:26::24)
 by VI1PR03MB4784.eurprd03.prod.outlook.com (2603:10a6:803:5e::25)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13; Wed, 25 May
 2022 23:50:27 +0000
Received: from AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::e5d4:b044:7949:db96]) by AM6PR03MB3943.eurprd03.prod.outlook.com
 ([fe80::e5d4:b044:7949:db96%3]) with mapi id 15.20.5293.013; Wed, 25 May 2022
 23:50:26 +0000
From: =?utf-8?B?QWx2aW4gxaBpcHJhZ2E=?= <ALSI@bang-olufsen.dk>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] drm: bridge: adv7511: Move CEC definitions to
 adv7511_cec.c
Thread-Topic: [PATCH] drm: bridge: adv7511: Move CEC definitions to
 adv7511_cec.c
Thread-Index: AQHYcIHc9cn27I9t00WzSZ9BMLIhiK0wQ2SA
Date: Wed, 25 May 2022 23:50:26 +0000
Message-ID: <20220525235025.3bpvrkd5gaft3stl@bang-olufsen.dk>
References: <20220525215316.1133057-1-festevam@gmail.com>
In-Reply-To: <20220525215316.1133057-1-festevam@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bang-olufsen.dk;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ee46a4ba-8848-44c6-cf48-08da3ea9578f
x-ms-traffictypediagnostic: VI1PR03MB4784:EE_
x-microsoft-antispam-prvs: <VI1PR03MB4784E8C4BF08C84E292932E883D69@VI1PR03MB4784.eurprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UCnjyqaXQYW/x9DbhosS3xWFwYCd0Kh3Ytz/YCVIfwNsrdSCFx3eLPGO7BmwpXfRf85NtLIZTpb11fuT+kynS4F9UK7RYUT96TScth/m0dFc4O98xvuKdqTGbh0wA2unYSNRX2X4SjeuhPi76sb/0cnmo3Ojmw+kTCj/S/pVvm+D6+8tJifhUv220leCANU9j6EGOlr9ih/roLqwxY1Tt0L8LwcZ77vdp33UMFwbQsBmQiRw4UfRSii6zM3bRqDvTtSzWxYBLkxrHlxUd8HqK1wU2y0HPo1UjJ1Dz5XExCRQ+ZxF2I5fjTKLw/BMFs4BtlHeejlaPo3lB3Gv6xS4Nq9OosiqBL6UuwpkFYkuPYnB1p4OwwDQQWW5aBL+YCJMRdXRhPdbMp+T6QEsjlvtbsd4vfsCXpb8ZGOE/MvYTsgGBopyb01M+NdrUVaT/TIwoqUmVUztWh+8MZIkmk8uhpQtWQ3YTkKgwAyUyiU4GgVbtaiXx/6tImFVx3xlcFDP1D2DkmHmAwKXaWOJN7QdbCRhaParNGHq3nCB9FL6ytXNnE50By1pKid9UTMwjiu7e7nC/0Kr1aAtn/EtX4vhrpOTLYD1pu4ZgGx5eCzWOkJrp6E7PT3MFItpZRTZFAds3rAISNS7kQ9cXM0ByCFbYFLqCIVFv19rhX14KCfz3WiaG2QXFDV6uCT/62x0ylr/ACKSy+m6YZ0PxHhlBB1D2A==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM6PR03MB3943.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(66476007)(66556008)(66946007)(4326008)(64756008)(8676002)(91956017)(76116006)(66446008)(6486002)(6916009)(54906003)(316002)(86362001)(36756003)(85182001)(85202003)(122000001)(38100700002)(38070700005)(83380400001)(6512007)(26005)(66574015)(6506007)(71200400001)(8936002)(8976002)(5660300002)(2616005)(186003)(1076003)(2906002)(508600001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ejl5dDNueG5EVVdqWG5vcnNhcjgvTkVMb3RrYU5GMUZUQTRxazNmYkQra1RV?=
 =?utf-8?B?UWUyN1lDdWJwV1Y0bVN6TUY1Wkl1bkIxN2xlRzEwVEdpUEowOXNhY3VsWUFw?=
 =?utf-8?B?Ni9Ic1Q1Z3VpTlNmb2VNZ0lUYktaNGZHSXBpSHRGNmhsK2pieXlvcFZjditz?=
 =?utf-8?B?Vm5QUnViU21rYTlmYVVKa2hYcWFYc2VCSG1tUmpCUzZOQWJqbEJtUDFocmxZ?=
 =?utf-8?B?OWJUN2hmbWhEZzMyQmVjTnlTeFEwNERES0UvRENBK01JNmZTTWRqQjQzL29N?=
 =?utf-8?B?MWdpQjVXdkhrYzh6Z050VWt1OXpIa1huSVA0RENIQ25oY0NmS3QrQk9NU1Ja?=
 =?utf-8?B?U0E1dk50QjEzaHYySzJCZEljVzhWU2FuR2VzUmNhVUplOGZqZDRtRG9BaU5k?=
 =?utf-8?B?Tjd0ZEU4Y3JWYXd1Vm5rVGVLYVhHRTYydkJDZDQ5Wi9rL01KUFpXQ3Bpcmdx?=
 =?utf-8?B?Z2pZamF3NDJKWW5RM28vRnROOUtsZXk3UE9jeGZTRXQyRWJDREo3SndnVXdQ?=
 =?utf-8?B?djNSZHFMTFdxM08vbE9uQmdjWHZUTUlaY1hyWUFWYkZRQU9qU1BQTzFEaWxm?=
 =?utf-8?B?WHBRb29lVmFwM3R3TWNRRjNOb0VVRmNTckhQbnNGMWFTakZGNmRDVFpXNFBY?=
 =?utf-8?B?RzdpWDNwbk93cXV2a1JTNHR3ems1RHEyVFUrTWJONmRXdmJxYk0xLzIwdEZ5?=
 =?utf-8?B?OVcrTnVNaUtVS0R6cHI0S3Y2d2YwdGplUTlFMGFRaWpQd0lZSlB2ckd2VllD?=
 =?utf-8?B?cHl5T0NhMVUvVDRpRFoySkhXeXlGR01Cd2h2M0w0RHJwUkdJblFTRXB6Qktz?=
 =?utf-8?B?bmFta0xsNUN2OWJKTE1LelpnajRxaUg0c3IwOEQrQnk5c0JGVmpIREsrSjBy?=
 =?utf-8?B?Z0o3N3NvZlR4ajRuMFhOOXJ0d0ZxdGZwS05ZVXdlREtMVjFnN09ZeFRPOVpV?=
 =?utf-8?B?ZjZYYTk2bUF6R0dVT0xpQ1dyekJOcFdabFpWd1VmR2FVMVdkMUl3YjExWW1p?=
 =?utf-8?B?MU5qdHhqWTdYZ0NFdW93a3hYQWZHbWJZaUtwLy9SVU5wTkFPQ1V3TVRPUk1t?=
 =?utf-8?B?aWxWdXVyY1dPblNSSlQ2bUtnL1lsWG52UHlRbmtGa0FoNlBxNFArdmFWRkkv?=
 =?utf-8?B?eWFPUk1SZHI3d1daRGk5Uk9aRXozMENKR1p0dDlrU2U4QUMzZW53azFoN2d2?=
 =?utf-8?B?bnh3aXpiY25rLzNIWk5wd2tySmk1SlhVY1NBd3NzdEpRVjlFemRlR01Eajdo?=
 =?utf-8?B?WmRBdW5CSlV5WVlVSENrRzR4a0xFUkxJZVZ5RU1uazk4TnB6OUNuejJ6QVBX?=
 =?utf-8?B?Z2tqSVF1RTVLNjlZTlYzRU5EeWhhaVJ6alNrR0tvV2JBY2JKV3pjWTRKN1hM?=
 =?utf-8?B?djZhckw3QlhGL1M0b25nc2s1Tml5eFVua2QvM2ZRdG1qSVR3YmFsTTFNb0Uz?=
 =?utf-8?B?a3JwaWIweVVnWU1Gc1F4OFE1NTQ0OEZqMndyaGRLdElTdk40ZDdEcTRuUmtr?=
 =?utf-8?B?dUUrZU1wSHpuR3lTdGRTeTZUUzRiUG5TazdNM1haeHdaTUNkVWJlbXQwVkJB?=
 =?utf-8?B?ZGE5bW9Qanc0VjVwd1lkTlZLL3lUSDhNSzBWL25IVDlUWXh6WTBhRStLdFZ3?=
 =?utf-8?B?ZDR4am04eVMwM3JrQ2oyeXlBMGsySUJRSlNzVzA1M253MU1XdDFTdDZzNHJD?=
 =?utf-8?B?NDVxN2dqd3VZZ0oyWEpudjJ4SjVUOGhmeHRIUy8rRldlTzNtSkdlTHpUcTdh?=
 =?utf-8?B?RUo5T2pjWVFuNWpjRlRoelJmL2RNSU1VeFNCQnVGY1ZFQ0t4d0xScVNJeFNW?=
 =?utf-8?B?UTdORldSbGxzTXIvMGtaZHBOOVVEQ2FObDU3b3RSOXlOVXhBSThWbW9oSFF5?=
 =?utf-8?B?TU5YZFlnbnQ3R0pVYy9MU2lWVU9ZeGhJbWhkUDBtSXE1TW9xS2tDamw0cnY0?=
 =?utf-8?B?a0I1dytiYlFiWGcrd2VIY2p6Qk40TUlEZ0FTaGg3N1drWGhWb1JHdG9OZFE1?=
 =?utf-8?B?bHBIYmE0ck9meWlBM1B0UjAxRVIzcGlQSjRKS1Q0eE1MdDdBUFY3MHhBRVRE?=
 =?utf-8?B?dUVldFdQdXk3UXhEc2tmaUQ0eU9ZRHppRmNZRXp3SFlBZ3VSdWdYckVObXBK?=
 =?utf-8?B?bmV5SGlHLytmTHBmOEtBMnZibjhyVUJqZGxuQVZNQ0pxNHdVRVhQL1k4TEo3?=
 =?utf-8?B?UWdXZ1YxYXI2Q2xTZEYwelN6NWhsV2R6VVZSdTBBS0ZObEFQdWFQVXlSUWgy?=
 =?utf-8?B?cGdVam1FMm92eWtXblVsSzBicVVXUENURDUyaVZjd2tmLzRwRU83N0NlbDEz?=
 =?utf-8?B?UWpPVE1FNGhIOFRIc204Y1JGVmJ3cW9DRWNNdFl5dlJZWC82Sjd3ZEx3dHdD?=
 =?utf-8?Q?tFQ6/0lUY0uayg/E=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BD2D5497E42EFA44AFEAEF456CCEC15E@eurprd03.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bang-olufsen.dk
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AM6PR03MB3943.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee46a4ba-8848-44c6-cf48-08da3ea9578f
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 May 2022 23:50:26.5471 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 210d08b8-83f7-470a-bc96-381193ca14a1
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EGFqVI7RXHgt895oEqo8zY3uLikca7GBd+LDyzN0aQEh8QA7GDLrgAhj5ySu3gP5J11elSyzgSEnZZ+sbYl5NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR03MB4784
X-Mailman-Approved-At: Thu, 26 May 2022 06:47:10 +0000
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robert.foss@linaro.org" <robert.foss@linaro.org>,
 kernel test robot <lkp@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjUsIDIwMjIgYXQgMDY6NTM6MTZQTSAtMDMwMCwgRmFiaW8gRXN0ZXZhbSB3
cm90ZToNCj4gQURWNzUxMV9SRUdfQ0VDX1JYX0ZSQU1FX0hEUltdIGFuZCBBRFY3NTExX1JFR19D
RUNfUlhfRlJBTUVfTEVOW10NCj4gYXJlIG9ubHkgdXNlZCBpbnNpZGUgYWR2NzUxMV9jZWMuYy4N
Cj4gDQo+IE1vdmUgdGhlaXIgZGVmaW5pdGlvbnMgdG8gdGhpcyBmaWxlIHRvIGF2b2lkIHRoZSBm
b2xsb3dpbmcgYnVpbGQNCj4gd2FybmluZ3Mgd2hlbiBDT05GSUdfRFJNX0kyQ19BRFY3NTExX0NF
QyBpcyBub3Qgc2VsZWN0ZWQ6DQo+IA0KPiBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEv
YWR2NzUxMS5oOjIyOToxNzogd2FybmluZzogJ0FEVjc1MTFfUkVHX0NFQ19SWF9GUkFNRV9IRFIn
IGRlZmluZWQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1jb25zdC12YXJpYWJsZT1dDQo+IGRyaXZl
cnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExLmg6MjM1OjE3OiB3YXJuaW5nOiAnQURW
NzUxMV9SRUdfQ0VDX1JYX0ZSQU1FX0xFTicgZGVmaW5lZCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWNvbnN0LXZhcmlhYmxlPV0NCj4gDQo+IFJlcG9ydGVkLWJ5OiBrZXJuZWwgdGVzdCByb2JvdCA8
bGtwQGludGVsLmNvbT4NCj4gRml4ZXM6IGFiMGFmMDkzYmY5MCAoImRybTogYnJpZGdlOiBhZHY3
NTExOiB1c2Ugbm9uLWxlZ2FjeSBtb2RlIGZvciBDRUMgUlgiKQ0KPiBTaWduZWQtb2ZmLWJ5OiBG
YWJpbyBFc3RldmFtIDxmZXN0ZXZhbUBnbWFpbC5jb20+DQo+IC0tLQ0KDQpUaGFuayB5b3UgZm9y
IGZpeGluZyB0aGlzLg0KDQpSZXZpZXdlZC1ieTogQWx2aW4gxaBpcHJhZ2EgPGFsc2lAYmFuZy1v
bHVmc2VuLmRrPg0KDQoNCj4gIGRyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTEx
LmggICAgIHwgMTIgLS0tLS0tLS0tLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1
MTEvYWR2NzUxMV9jZWMuYyB8IDEyICsrKysrKysrKysrKw0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAx
MiBpbnNlcnRpb25zKCspLCAxMiBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oIGIvZHJpdmVycy9ncHUvZHJtL2Jy
aWRnZS9hZHY3NTExL2Fkdjc1MTEuaA0KPiBpbmRleCA5ZTNiYjhhOGVlNDAuLmEwMzFhMGNkMWYx
OCAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3NTExL2Fkdjc1MTEu
aA0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYnJpZGdlL2Fkdjc1MTEvYWR2NzUxMS5oDQo+IEBA
IC0yMjYsMTggKzIyNiw2IEBADQo+ICAjZGVmaW5lIEFEVjc1MTFfUkVHX0NFQ19DTEtfRElWCQkw
eDRlDQo+ICAjZGVmaW5lIEFEVjc1MTFfUkVHX0NFQ19TT0ZUX1JFU0VUCTB4NTANCj4gIA0KPiAt
c3RhdGljIGNvbnN0IHU4IEFEVjc1MTFfUkVHX0NFQ19SWF9GUkFNRV9IRFJbXSA9IHsNCj4gLQlB
RFY3NTExX1JFR19DRUNfUlgxX0ZSQU1FX0hEUiwNCj4gLQlBRFY3NTExX1JFR19DRUNfUlgyX0ZS
QU1FX0hEUiwNCj4gLQlBRFY3NTExX1JFR19DRUNfUlgzX0ZSQU1FX0hEUiwNCj4gLX07DQo+IC0N
Cj4gLXN0YXRpYyBjb25zdCB1OCBBRFY3NTExX1JFR19DRUNfUlhfRlJBTUVfTEVOW10gPSB7DQo+
IC0JQURWNzUxMV9SRUdfQ0VDX1JYMV9GUkFNRV9MRU4sDQo+IC0JQURWNzUxMV9SRUdfQ0VDX1JY
Ml9GUkFNRV9MRU4sDQo+IC0JQURWNzUxMV9SRUdfQ0VDX1JYM19GUkFNRV9MRU4sDQo+IC19Ow0K
PiAtDQo+ICAjZGVmaW5lIEFEVjc1MzNfUkVHX0NFQ19PRkZTRVQJCTB4NzANCj4gIA0KPiAgZW51
bSBhZHY3NTExX2lucHV0X2Nsb2NrIHsNCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9i
cmlkZ2UvYWR2NzUxMS9hZHY3NTExX2NlYy5jIGIvZHJpdmVycy9ncHUvZHJtL2JyaWRnZS9hZHY3
NTExL2Fkdjc1MTFfY2VjLmMNCj4gaW5kZXggMzk5ZjYyNWE1MGM4Li4wYjI2NmYyOGYxNTAgMTAw
NjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2NlYy5j
DQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9icmlkZ2UvYWR2NzUxMS9hZHY3NTExX2NlYy5jDQo+
IEBAIC0xNSw2ICsxNSwxOCBAQA0KPiAgDQo+ICAjaW5jbHVkZSAiYWR2NzUxMS5oIg0KPiAgDQo+
ICtzdGF0aWMgY29uc3QgdTggQURWNzUxMV9SRUdfQ0VDX1JYX0ZSQU1FX0hEUltdID0gew0KPiAr
CUFEVjc1MTFfUkVHX0NFQ19SWDFfRlJBTUVfSERSLA0KPiArCUFEVjc1MTFfUkVHX0NFQ19SWDJf
RlJBTUVfSERSLA0KPiArCUFEVjc1MTFfUkVHX0NFQ19SWDNfRlJBTUVfSERSLA0KPiArfTsNCj4g
Kw0KPiArc3RhdGljIGNvbnN0IHU4IEFEVjc1MTFfUkVHX0NFQ19SWF9GUkFNRV9MRU5bXSA9IHsN
Cj4gKwlBRFY3NTExX1JFR19DRUNfUlgxX0ZSQU1FX0xFTiwNCj4gKwlBRFY3NTExX1JFR19DRUNf
UlgyX0ZSQU1FX0xFTiwNCj4gKwlBRFY3NTExX1JFR19DRUNfUlgzX0ZSQU1FX0xFTiwNCj4gK307
DQo+ICsNCj4gICNkZWZpbmUgQURWNzUxMV9JTlQxX0NFQ19NQVNLIFwNCj4gIAkoQURWNzUxMV9J
TlQxX0NFQ19UWF9SRUFEWSB8IEFEVjc1MTFfSU5UMV9DRUNfVFhfQVJCSVRfTE9TVCB8IFwNCj4g
IAkgQURWNzUxMV9JTlQxX0NFQ19UWF9SRVRSWV9USU1FT1VUIHwgQURWNzUxMV9JTlQxX0NFQ19S
WF9SRUFEWTEgfCBcDQo+IC0tIA0KPiAyLjI1LjENCj4=
