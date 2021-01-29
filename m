Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 620AB309027
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 23:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCADE6EC42;
	Fri, 29 Jan 2021 22:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45B8B6EC42;
 Fri, 29 Jan 2021 22:35:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G5cKN7XZHnveMIdmQNLSyHWKa+Koom3Zzi8S6tTgbqxJEch2f9rOiSXZu4JFRpJ6Q+OFLHRUtryFD2XVFt8Aw5Iw0J2zCzTmB2yPE70v7n5nq7BpgVfYkQtyU4CwsYqrfm5ZnRO8hkvE2CL4G69nkq/MEaGOYHAJNq6KLimcCaI5TQ/BFo0HoIJTzZFSRfXmja2tj93AtGrVppyR2YMqitlUUV6sjjXKTdPxMEbaCsLbEZe8YkCDARbsobHr7PVdq7ap6bncOMONVyP+FoRV7i2Nd67AbhmsexRq/lZntgZf3eq8FBd9pw94NmR7Ai7qPYLH5fr7lRy1/72Ub4b+Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvPFAwocxJpSNfo8tRqtrpGeJyMIsWNbdLKnuCJPzVA=;
 b=TE5H4P6Qe+YJzWcy9VfGRvtF7nDu3HcpUYSs6gXWhsXB1bSmchG69CMZvUVm3D8iF1BFCQlmdY3YoladvXAqTXQuLKsp1P/DwPSgFApAfe+eOFVCbtQkRqzCWLnRgjGzjQpRVMAva/iRf0s31qRNt0khIlFQDKqGqYne2mplqPYti34dsHBnts7XlP2H0OdK2noBqzgliDXPZSrA4Xjm3CPLBxXlPtc+ZRCnddvm6ZqqhD1GbKPnp/zJc+ZyY7xixU7fCmmJj46SVmPCArFXiFsNp+l3MLB0fy0nle86/5z6cm3aMtvU/Exhmg83ihs/lULnj0cBH4Ps6TrI7pahKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MvPFAwocxJpSNfo8tRqtrpGeJyMIsWNbdLKnuCJPzVA=;
 b=0pvdZ/DMpFcwzHrIKz949on/7Pf8s7GAVvR7BI5TtKyvkUvZwCl2mTkVJB5L1X0L8zFS0OXsml1VfJbSwTZ5k6FxYX8SYA48Hog6ncPHr9JiIH+JbwQu1WBx1Imy8SSmvHHhQ1sJUYXSzXxkLAkyP+8ibA50357nf2vJD/rwQhg=
Received: from MN2PR12MB4488.namprd12.prod.outlook.com (2603:10b6:208:24e::19)
 by MN2PR12MB4158.namprd12.prod.outlook.com (2603:10b6:208:15f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3805.19; Fri, 29 Jan
 2021 22:35:51 +0000
Received: from MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af]) by MN2PR12MB4488.namprd12.prod.outlook.com
 ([fe80::b0c4:9a8b:4c4c:76af%8]) with mapi id 15.20.3805.019; Fri, 29 Jan 2021
 22:35:51 +0000
From: "Deucher, Alexander" <Alexander.Deucher@amd.com>
To: "Kuehling, Felix" <Felix.Kuehling@amd.com>, Alex Deucher
 <alexdeucher@gmail.com>, "amd-gfx@lists.freedesktop.org"
 <amd-gfx@lists.freedesktop.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
Subject: RE: [pull] amdgpu, amdkfd drm-next-5.12
Thread-Topic: [pull] amdgpu, amdkfd drm-next-5.12
Thread-Index: AQHW9o4h3fSzkKubmEOk95Kfevmsg6o/MFGAgAAAaZA=
Date: Fri, 29 Jan 2021 22:35:51 +0000
Message-ID: <MN2PR12MB448834BFD9508FED55B27267F7B99@MN2PR12MB4488.namprd12.prod.outlook.com>
References: <20210129222840.3861-1-alexander.deucher@amd.com>
 <40a51812-7e2a-9408-f7a2-3dd02d63a301@amd.com>
In-Reply-To: <40a51812-7e2a-9408-f7a2-3dd02d63a301@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Enabled=true;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SetDate=2021-01-29T22:35:48Z; 
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Method=Privileged;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_Name=Public_0;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ActionId=07261929-529b-48d7-ab42-620bd7a23e3a;
 MSIP_Label_0d814d60-469d-470c-8cb0-58434e2bf457_ContentBits=1
authentication-results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
x-originating-ip: [165.204.11.250]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: a2ce9955-f15f-4bef-88c3-08d8c4a63bc4
x-ms-traffictypediagnostic: MN2PR12MB4158:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <MN2PR12MB415834D6C0558406BCA2CA16F7B99@MN2PR12MB4158.namprd12.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:7219;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XW8tvcAq6BtqaTuUMgaFvokd7qAcA6GtKZgbA3cGgxdHY4+hFDih1LR9ZgColV4SD5aIp/NNMSYWY1ow3Gk04+kVGv0OS1lxpUHCb+p1TXdm4HIs/TggcBMXSsZqc5vPZ0oilWPaJlkBz5/85O8CxwmV+Fb4rFqSUC/aQzbcV29SFUjuAkB94OuM7BOb4tk60JVgAoESB4uIm/ycmKNdN2cAQqnu8L2N+RLHPHbhTgTAoLsB22iS+AkCEESQdy3Nl87QmmN0YYGeXV+aaGdCo1Uq6FypwKuK6kMinBQtFd7f+DT5x6kPnFLXOWzmEivtKN94E4wmoTYlmkxhdvGAgRMg05AqaQd0sfFpH7wORuVmR4jl2AHGlCOOVUP53IRiOIrVDwrbhp7rntqu5z67gWUrepFplqIogIzlwTYPtDSiTGYkrvQkihODs9ijG8R6BL0+QJz8ywEEhJDW1Kn/LVrz/73kS6fUwVBUFjnL1AtjARL9wuWi+rblGNIyEVolo19bbgD3pYKSGPKA4VWrjw==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4488.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(39860400002)(396003)(376002)(346002)(71200400001)(9686003)(5660300002)(4326008)(52536014)(55016002)(33656002)(66476007)(66556008)(54906003)(110136005)(64756008)(8676002)(66946007)(316002)(66446008)(2906002)(76116006)(4744005)(83380400001)(7696005)(8936002)(86362001)(53546011)(6506007)(26005)(186003)(478600001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?utf-8?B?bCtHc2NWWXgzWkFNMDdxaXFRcmFiTnFDRWRZSE40ZzhhUkxRaGh0OGF5MFZM?=
 =?utf-8?B?aEkvMkZ2UVlFbUpzRW5XMTlFSnVMRlV1aWJoOFhwdlJqTmN3QWtRZlcxeW9E?=
 =?utf-8?B?bDV1VUJzWitaWkVZSXI5V29EVTN5S0l3aVExYk5uUS8xcWJTenNIYkxRREty?=
 =?utf-8?B?Y0ZFMWhOWGw2SkthcUtsZ29PMmhhb1hUV0RIUEdWSmtBN0M4SFU1dklkUVZK?=
 =?utf-8?B?U2xrMTZ4cGxwamhPWFBjbjFtb0ZaT2Y0QVRXYWRCVXBOZGRuL00xbi9zZ2Yr?=
 =?utf-8?B?RmRTNVg2cjhNeWdlb2JiV3VpSkt0czRmcHF5OWJwSFpmRmlmV1NzdUJnY0lz?=
 =?utf-8?B?a0s1dWw2QUxEWU1wTXRjZTdqMFdhS21mdS9lYWY1U0FZNXVVckV2VkY1dGRQ?=
 =?utf-8?B?ZmNNK09kRkFqZWhWeWZOZXVGcTMzbkRPR1dpVGNkU3U5cXNZeEkyakZxZmpa?=
 =?utf-8?B?aTNyU0JUWktwaTlVTG05SHA2RGxsaEd1SVZZbEF3eXRQa2hZM2NyaHdxNGdy?=
 =?utf-8?B?YkdNNXVER3k1STRrYnk3TVRVNTdMVHZtSjJJYkNyaUZhcE1KUDBHUFFXZE12?=
 =?utf-8?B?MlhaRDVTWmRocnA4VnJUU003SkJFSVNhb21YV0VBWE9UNEJUVGxUYy92UUZ6?=
 =?utf-8?B?aFdqTmQzVUtwZzFPNU1EWHg5N2pxSW5UV0dlUFVFZkp5M2hJTEVTcmkyMlJk?=
 =?utf-8?B?ZXlrSVJkYit6d3hseTY4NzRaUGJMd3dpN2hibTQ1dkhSNTdldnRRcTdRNUVq?=
 =?utf-8?B?c2ZwTUoyR2JsZkEzN2FIZ0JYR0FWa1ZoNWZSeU50ZDZaUFIzT1lWd05RcHRj?=
 =?utf-8?B?eU1reFBEMVRGbkl5U0Y0d051QzhxZHA5MCtsMlhOV2ZVNHpaVW1ISVQ2ZVd1?=
 =?utf-8?B?VE1oQW1CeUwvQS9lNnJ6NnZ6K1RDSVJrV3Zqdzh1Z2ZqMEI5ZFpINGJNM2lu?=
 =?utf-8?B?Y1cyNkhkQmdLYUgrbmtiQ0FYWFFjV052RFdFNWlkMC9MYWxiWXlDS0pDc2Iw?=
 =?utf-8?B?RkZzS08zSDh3dmw5YU9wUTBBM2MzdUl3bE1EbGN5RmxVKzhkN2p5aW13YmZy?=
 =?utf-8?B?R3pvMHFtdzJlWkdJZ1hJdkNJK0N3SXJvN1J5OHJXVHRVckR0RVErcHdBWGFo?=
 =?utf-8?B?c2w4cGJaVGQ2U2pWRWZBVC9rME1qQmoyQThVMUpDcW9vb29pTEl0N3NpcEhV?=
 =?utf-8?B?eGVHR3hteVdPSURtRGk4MlZSRWVGUFQ1M3hzb2E5SnljYUw5OW83Z2xmS3Fs?=
 =?utf-8?B?RDNBSXNjVjE5RkhtclAxckQ0VkpoZ0s4eERpT0l1bE01aDZvTFRqS3FNbnZT?=
 =?utf-8?B?eEJLa3AxaE5GUEFTWWNqY003bEhiRi9IeFFlbndQbk8vQk5QNEc5SVcrM01R?=
 =?utf-8?B?dFBLYXl2M3Mza0l5NTdNTmhvUnVoQTVMcHh0dkdoVXFGdzU4Zi96Unh2dWJL?=
 =?utf-8?Q?WWgniAkS?=
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4488.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2ce9955-f15f-4bef-88c3-08d8c4a63bc4
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2021 22:35:51.8419 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 7N69XXS01M2OkHk7pT83hS1aMtoR1d5DwZeakoQbHkKVWRyXzmVhImJVoGh14xS/TMMuIIlvhGTdY0v/h8hikQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4158
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
Cc: "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Koenig,
 Christian" <Christian.Koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

W0FNRCBQdWJsaWMgVXNlXQ0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206
IEt1ZWhsaW5nLCBGZWxpeCA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4NCj4gU2VudDogRnJpZGF5
LCBKYW51YXJ5IDI5LCAyMDIxIDU6MzMgUE0NCj4gVG86IEFsZXggRGV1Y2hlciA8YWxleGRldWNo
ZXJAZ21haWwuY29tPjsgYW1kLQ0KPiBnZnhAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBkcmktZGV2
ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOw0KPiBhaXJsaWVkQGdtYWlsLmNvbTsgZGFuaWVsLnZl
dHRlckBmZndsbC5jaA0KPiBDYzogRGV1Y2hlciwgQWxleGFuZGVyIDxBbGV4YW5kZXIuRGV1Y2hl
ckBhbWQuY29tPjsgUGFuLCBYaW5odWkNCj4gPFhpbmh1aS5QYW5AYW1kLmNvbT47IEtvZW5pZywg
Q2hyaXN0aWFuIDxDaHJpc3RpYW4uS29lbmlnQGFtZC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbcHVs
bF0gYW1kZ3B1LCBhbWRrZmQgZHJtLW5leHQtNS4xMg0KPiANCj4gQW0gMjAyMS0wMS0yOSB1bSA1
OjI4IHAubS4gc2NocmllYiBBbGV4IERldWNoZXI6DQo+ID4gZHJtL2FtZGdwdTogTWFrZSBjb250
aWd1b3VzIHBpbm5pbmcgb3B0aW9uYWwNCj4gDQo+IFRoaXMgb25lIG5lZWRzIGEgZm9sbG93LXVw
IGZpeCwgYXMgaXQgYnJlYWtzIHBpbm5pbmcgaW4gR1RULiBYaW5odWkgc2hvdWxkIGhhdmUNCj4g
dGhlIGZpeCByZWFkeSB2ZXJ5IHNvb24uIFlvdSBtYXkgd2FudCB0byBob2xkIHRoaXMgYmFjayB1
bnRpbCB0aGUgZml4IGxhbmRzLg0KDQpPay4gIElnbm9yZSB0aGlzIFBSIGZvciBub3cuICBJJ2xs
IHNlbmQgYW4gdXBkYXRlZCBvbmUgbmV4dCB3ZWVrIHdoZW4gdGhlIGZpeCBsYW5kcy4NCg0KVGhh
bmtzLA0KDQpBbGV4DQoNCj4gDQo+IFJlZ2FyZHMsDQo+IMKgIEZlbGl4DQo+IA0KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVsIG1haWxpbmcg
bGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVsCg==
