Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 000482CCCFA
	for <lists+dri-devel@lfdr.de>; Thu,  3 Dec 2020 04:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 457626EB36;
	Thu,  3 Dec 2020 03:06:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-SN1-obe.outbound.protection.outlook.com
 (mail-eopbgr700066.outbound.protection.outlook.com [40.107.70.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5A216EB33;
 Thu,  3 Dec 2020 03:06:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YgAktVOpT5bXfIsjsDMC8xHrJRN6+jgnVu8c7JXOTEC4CzRdAPG3wqa2V1jKBFlJCNB5oaO3XCk/qHMq86QIRmKvOWWBUcKmSuYjeKlA7hl381fHcLHZtE+nYV860nphOx/a594SM3GIzv121rB+TxHINBZUVFC9mvD4+JkgP42v1++TZ1FKlrCwidOQkdkDKm9I4woySQccFqCmk6v+eirwVDTw7gpgzIr/H6VvMhzGPTrxqY39Atv5ZXcwK7uDXnGAnIgvcJiqWW+IHIqyg/n/qSpof2PUHQ2nyRtHnYG8hoEkiMSuHHIhjlAV4I+SlvAF2M9kkY2W8bqWh071VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlk3aNS402pqOGoxmAYXOQXYoQZTmpRf4WzD6P2sWhM=;
 b=cGF0z1Aoh/25Vonz+u+Rn4wj3/X/oGSHzk6p4C7T9W9QIbBV7BTfeIOohSrFUniE9rQd9TcC6PfmlJWHuPb4L7a7h2zOX1Hp719OYfLNTsQzCmnOSnJvkasf3wZZTBOfJCPCR/hZRyTjUcBe7veTvu+iz3V/lAvPr/xRWDGJkcUQbDGNh8sU3ODKJW3yhIbiKEk9UOpQ2ijsf/Xus02TIzeLok1t6Fx8SicI06iQifcji14uiXrubEGLXr5P7QYQRM6XQ2QIukBUEAEljEQfHQl3qCwD2qBD1R8tY3m2iN/1WX58ika3QiFYvFcQAOD2pzzWZfOZ3miB1Snihq3Wvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tlk3aNS402pqOGoxmAYXOQXYoQZTmpRf4WzD6P2sWhM=;
 b=bx5IfV1UDVc/13j7lE0YroaM3g7jw4McvUNADoC3D6awEKBoJTfrP4haWjE0FPXmAJp9Z5BdefZtuTsJ32rZwSARrP/kCi21ADUiQEbr3mRGtpBKXg+ie0XAeohmetMmli8JbroSfNH8rlhWIK8s3CD9I9LCpuVL/O6SZDC1O74=
Received: from BL0PR05MB5186.namprd05.prod.outlook.com (2603:10b6:208:8f::18)
 by BL0PR05MB5345.namprd05.prod.outlook.com (2603:10b6:208:6e::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3632.6; Thu, 3 Dec
 2020 03:06:21 +0000
Received: from BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6]) by BL0PR05MB5186.namprd05.prod.outlook.com
 ([fe80::59ed:18ca:252d:72f6%7]) with mapi id 15.20.3654.005; Thu, 3 Dec 2020
 03:06:21 +0000
From: Zack Rusin <zackr@vmware.com>
To: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Thread-Topic: [PATCH 14/15] drm/vmwgfx: Remove references to struct
 drm_device.pdev
Thread-Index: AQHWwlaG5WlZT6CPxU6T7GsrbIaTjanhMtCAgAJLGYCAAGvzgIAAE2oAgAAHUICAALlJAA==
Date: Thu, 3 Dec 2020 03:06:20 +0000
Message-ID: <96A4A47D-4B6B-4038-B094-DD490B99C698@vmware.com>
References: <20201124113824.19994-1-tzimmermann@suse.de>
 <20201124113824.19994-15-tzimmermann@suse.de>
 <31E75B1A-AAC0-49E3-985E-2DF5B59CD883@vmware.com>
 <e8102216-edd0-bec3-79af-3925e9668e95@suse.de>
 <d43d06e6-d13c-ef9b-b372-8d30d9494417@suse.de>
 <FBC4840D-C1A8-4492-9E2E-D31E00B8D61A@vmware.com>
 <CAKMK7uFaCVLu9GWR0Jkvf8iXP4RdcG3TmMsLmFVDoERBOk1ZOQ@mail.gmail.com>
In-Reply-To: <CAKMK7uFaCVLu9GWR0Jkvf8iXP4RdcG3TmMsLmFVDoERBOk1ZOQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3608.120.23.2.4)
authentication-results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=vmware.com;
x-originating-ip: [71.175.59.246]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: b5eb206a-3316-480b-5ab7-08d897386925
x-ms-traffictypediagnostic: BL0PR05MB5345:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BL0PR05MB5345B875674D15ED83B48934CEF20@BL0PR05MB5345.namprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:10000;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: d6mIlkZLkosupY3Y1mEGYiEn3woLGE+HJp/CCwaD8XGDACACPOaOiMTrtvhMvC/PdvmNlkjp1QxtnA+MMOi0u5kxY0meQqnlMZA8GdBRjMAOg/OaMnUa//dSnGRoHTriC/KKwA/h/9othg05lsLUXnYmPWoaP0W4mBqzd6ufSGATpw7CSa1WFCv+kEr0YxhENILa4tb/i5Q0CHKxNhI6Vyh0ejHj1KMVus9yHcizsWzovUJWw+wEEBLY5NSUGX3I598GWZQMd2zigBtVc8rtN1noZDLXXrT6I8HyndTIeQD+O8iQZyzGTT06p8HC2iIobUmJ/YKKzKxxKBh4iyl9YhQ+xaK+70h/Mvl3C75YaxZGvKhVSpDCDJAasNaIiiiG
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR05MB5186.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(376002)(396003)(39860400002)(366004)(346002)(6486002)(186003)(2616005)(7416002)(33656002)(26005)(6506007)(53546011)(71200400001)(54906003)(316002)(6512007)(8676002)(6916009)(8936002)(5660300002)(66556008)(66476007)(64756008)(478600001)(4326008)(66946007)(66446008)(76116006)(86362001)(2906002)(36756003)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?Smx1Y3p5K2toU1hDenpKeHdEVXk4R3R1bklNOUt0Qm1leFNEbjRLQW9DZ2pz?=
 =?utf-8?B?cy9WS0dHYnNOZTBDd2wvWGkvdTN1VmxCdHEzcjdBbTB0VXpKcU51Qm1ONjVG?=
 =?utf-8?B?cGkrWmVyYWhnczR0TytLenhjV3dyWVhOZ0pqeForZTFrYUxKcmVRMlJ1a3Ev?=
 =?utf-8?B?REo2QzRvazNMdDJBU29MQmN3V1ptTXNwbEEwK25qcGplY0FEb2pybFgwTldJ?=
 =?utf-8?B?T3Z0VS81TGpWWm9aTUorQ3NwNklid01ZYjlBMS9kanRTanVCYW5tZ09WQ3Nu?=
 =?utf-8?B?S3JtNkVza0FLaUNabnFqc2drMlZUYklySm5QOWx4SXM4VWZvNE5heDVxM2Vr?=
 =?utf-8?B?M0ErNFFIQ1ZadXJ2dlMzZTlQTzBKSW9NaDJSTFZlU3gxNnU4VFRBZ3dodTNR?=
 =?utf-8?B?L0p6K0k3dkVGK0g4MU44TVp1TlFReHRXM0pxeExabk9QMDhYVGpVWGFEdDdS?=
 =?utf-8?B?YjhLU1N6UWVOUDdSVGtMU0tOdUJTYVFwV3k2aVNkTTA3N0UrU0xKVE96b1lr?=
 =?utf-8?B?eTAxT3VlVzFFVFNtbmdnaWc2eTNkak1vbjB1SktXRUJhWUlKcjFIMHpoNVRi?=
 =?utf-8?B?ajVGSHpocVVPWDNWa2QvdGRTZlh6OG1YYTltaDFBbHp4WlZEWmt6dlF3ZlF6?=
 =?utf-8?B?STVUMDhhaWtHZUFtZS81U3BnekYrUWx4SThxeGk0ZGpKcXQ5Tnd5NTdRRU1S?=
 =?utf-8?B?MWduc2s4aTlFSVl5NDE1M3hKZTg3bFZDVitRSGhPQ3paRHdGNkhQc2Y3Zm9S?=
 =?utf-8?B?WXUzWUttbitYNi9SMmdHcitJNVk3WGtOc042ZVA0UXdzZWhXOVBjcnVCYSsx?=
 =?utf-8?B?clRFUXVqb2tGV1UvVy90MlpmY0N6Yy9BZ2dlV3Q2ZkNqaHJLb3lFYzFWZmk3?=
 =?utf-8?B?akdhbmJmZVpXT1huQ3NtVkZqSHRyajJtZzVzUzRCd25NMFpOZjhWZWVZN0hF?=
 =?utf-8?B?aHpuUjRtS2thT25WRDVXR25CVFR4bkZHSEhLQWUwd1g2anZiTDhSTk5xZ2dJ?=
 =?utf-8?B?WE1KTGYzZVYwTEw4R2VBWndZTlZNTHV5L1htYkVISmJUd1crcWtiaU9XMXdy?=
 =?utf-8?B?UEEwOTdKZjZudUh1NVBhZ3ZtaG9iK25NZThWbE81S3B5VWRzenphbDhlYW41?=
 =?utf-8?B?UXFTcWdYaGlnSzhXUWpIVVRkRVhxUEpFTnRua2V2cjBQSE9PZ1R5ZFdlUWZH?=
 =?utf-8?B?czQ0MVVyK1d6b2ZUeHkwRjBqeklMMm1odG5aNk4vTHo3aUZxUS9lK3k2M2Zl?=
 =?utf-8?B?NDdLeTFFMGdna0pZSW9sUmpzR3dTdStnVy80cGFEWmpOdWVGUXQ4bWlJNzU4?=
 =?utf-8?Q?Nx1yjI3ZDuj3ZkCYVlAA5nhwxhC5UM1Ffi?=
Content-ID: <BF2D78E3B1C3A44291981436524356FC@namprd05.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR05MB5186.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5eb206a-3316-480b-5ab7-08d897386925
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2020 03:06:21.0144 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: tH3jKIo5gecr+QxTjfx4HBmgMbmyh2fSO38UHTvfAqfQn8tnYyFX9Wvz7fSPFWYR9cYWZRBr0V1js8/SYQDRRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR05MB5345
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
Cc: "airlied@linux.ie" <airlied@linux.ie>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 Roland Scheidegger <sroland@vmware.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "spice-devel@lists.freedesktop.org" <spice-devel@lists.freedesktop.org>,
 "intel-gvt-dev@lists.freedesktop.org" <intel-gvt-dev@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gRGVjIDIsIDIwMjAsIGF0IDExOjAzLCBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3
bGwuY2g+IHdyb3RlOg0KPiANCj4gT24gV2VkLCBEZWMgMiwgMjAyMCBhdCA0OjM3IFBNIFphY2sg
UnVzaW4gPHphY2tyQHZtd2FyZS5jb20+IHdyb3RlOg0KPj4gDQo+PiANCj4+IA0KPj4+IE9uIERl
YyAyLCAyMDIwLCBhdCAwOToyNywgVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2Uu
ZGU+IHdyb3RlOg0KPj4+IA0KPj4+IEhpDQo+Pj4gDQo+Pj4gQW0gMDIuMTIuMjAgdW0gMDk6MDEg
c2NocmllYiBUaG9tYXMgWmltbWVybWFubjoNCj4+Pj4gSGkNCj4+Pj4gQW0gMzAuMTEuMjAgdW0g
MjE6NTkgc2NocmllYiBaYWNrIFJ1c2luOg0KPj4+Pj4gDQo+Pj4+PiANCj4+Pj4+PiBPbiBOb3Yg
MjQsIDIwMjAsIGF0IDA2OjM4LCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5k
ZT4gd3JvdGU6DQo+Pj4+Pj4gDQo+Pj4+Pj4gVXNpbmcgc3RydWN0IGRybV9kZXZpY2UucGRldiBp
cyBkZXByZWNhdGVkLiBDb252ZXJ0IHZtd2dmeCB0byBzdHJ1Y3QNCj4+Pj4+PiBkcm1fZGV2aWNl
LmRldi4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzLg0KPj4+Pj4+IA0KPj4+Pj4+IFNpZ25lZC1vZmYt
Ynk6IFRob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPg0KPj4+Pj4+IENjOiBS
b2xhbmQgU2NoZWlkZWdnZXIgPHNyb2xhbmRAdm13YXJlLmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+
PiBkcml2ZXJzL2dwdS9kcm0vdm13Z2Z4L3Ztd2dmeF9jbWRidWYuYyB8ICA4ICsrKystLS0tDQo+
Pj4+Pj4gZHJpdmVycy9ncHUvZHJtL3Ztd2dmeC92bXdnZnhfZHJ2LmMgICAgfCAyNyArKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLQ0KPj4+Pj4+IGRyaXZlcnMvZ3B1L2RybS92bXdnZngvdm13Z2Z4
X2ZiLmMgICAgIHwgIDIgKy0NCj4+Pj4+IA0KPj4+Pj4gUmV2aWV3ZWQtYnk6IFphY2sgUnVzaW4g
PHphY2tyQHZtd2FyZS5jb20+DQo+Pj4+IENvdWxkIHlvdSBhZGQgdGhpcyBwYXRjaCB0byB0aGUg
dm13Z2Z4IHRyZWU/DQo+Pj4gDQo+Pj4gQU1EIGRldnMgaW5kaWNhdGVkIHRoYXQgdGhleSdkIHBy
ZWZlciB0byBtZXJnZSB0aGUgcGF0Y2hzZXQgdHJvdWdoIGRybS1taXNjLW5leHQuIElmIHlvdSdy
ZSBPSyB3aXRoIHRoYXQsIEknZCBtZXJnZSB0aGUgdm13Z2Z4IHBhdGNoIHRocm91Z2ggZHJtLW1p
c2MtbmV4dCBhcyB3ZWxsLg0KPj4gDQo+PiBTb3VuZHMgZ29vZC4gSeKAmWxsIG1ha2Ugc3VyZSB0
byByZWJhc2Ugb3VyIGxhdGVzdCBwYXRjaCBzZXQgb24gdG9wIG9mIGl0IHdoZW4gaXTigJlzIGlu
LiBUaGFua3MhDQo+IA0KPiBidHcgaWYgeW91IHdhbnQgdG8gYXZvaWQgbXVsdGktdHJlZSBjb29y
ZGluYXRpb24gaGVhZGFjaGVzLCB3ZSBjYW4NCj4gYWxzbyBtYW5hZ2Ugdm13Z2Z4IGluIGRybS1t
aXNjIGFuZCBnaXZlIHlvdSAmIFJvbGFuZCBjb21taXQgcmlnaHRzDQo+IHRoZXJlLiBVcCB0byB5
b3UuIFRoZXJlIGlzIHNvbWUgc2NyaXB0aW5nIGludm9sdmVkIGZvciBub3cgKGJ1dCBJIGhvcGUN
Cj4gd2hlbmV2ZXIgd2UgbW92ZSB0byBnaXRsYWIgd2UgY291bGQgZG8gdGhlIGNoZWNrcyBzZXJ2
ZXItc2lkZSk6DQoNCknigJlkIGJlIGhhcHB5IHRvIHRha2UgeW91IHVwIG9uIHRoYXQuIEkgd291
bGQgbGlrZSB0byBtb3ZlIGEgbG90IG1vcmUgb2Ygb3VyIGRldmVsb3BtZW50IGludG8gcHVibGlj
IHJlcG9zIGFuZCByZWR1Y2luZyB0aGUgYnVyZGVuIG9mIG1haW50YWluaW5nIG11bHRpcGxlIHRy
ZWVzIHdvdWxkIGhlbHAuIElzIHRoZXJlIGEgbG90IG9mIGNoYW5nZXMgdG8gZHJtIGNvcmUgdGhh
dCBkb2VzbuKAmXQgZ28gdGhyb3VnaCBkcm0tbWlzYz8gT3IgYWx0ZXJuYXRpdmVseSBpcyBkcm0t
bWlzYyBvZnRlbiBwdWxsaW5nIGZyb20gTGludXPigJkgbWFzdGVyPyBJ4oCZbSB0cnlpbmcgdG8g
ZmlndXJlIG91dCBob3cgbXVjaCB3b3VsZCBvdXIgbmVlZCB0byByZWJhc2UvbWVyZ2UgYmUgcmVk
dWNlZCBpZiB3ZSBqdXN0IHVzZWQgZHJtLW1pc2MtbmV4dC9kcm0tbWlzYy1maXhlcyBiZWNhdXNl
IHRoYXQgd291bGQgYWxzbyBhbGxvdyBtZSB0byBwb2ludCBzb21lIGludGVybmFsIHRlc3Rpbmcg
aW5mcmFzdHJ1Y3R1cmUgYXQgaXQgYXMgd2VsbC4NCg0KegpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpkcmktZGV2ZWwgbWFpbGluZyBsaXN0CmRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9kcmktZGV2ZWwK
