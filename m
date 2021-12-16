Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 614234773E3
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:02:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DCB210EC3C;
	Thu, 16 Dec 2021 14:02:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-OS0-obe.outbound.protection.outlook.com
 (mail-os0jpn01on2104.outbound.protection.outlook.com [40.107.113.104])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 727CF10EC3C
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 14:02:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hS2ZBZQ38GorJDWTCvyI5itHsH7ahLWRMTYkTwwWqQ3Wnt5oMVzT4tkm3q7XdAt2kqHXgr/wq75g/BQ54kpDJ8BJa7TfOJavWbiTaoJjPj6A9kgssIC2YZaxzMZM9aZL/oZQDXgwNwNzAhVZ/CABIMwYn9I267jXuAE6IswZnqy9ICKQKa23omPad6u8EOVNM+nJJQ7AM0HFtMx7QJNURPXMl/zNyHbB6r+AVRb4Kxxy/i0UBHb2T8SfVm3Zs3hWLmY9cAyJn5EwwRHlhMxS9MiEvTToCgMODMmQfMg00FEoYWplJ6SXD0cvRhYSPDAefZPb7Zjt7j0U6xjL541soA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UHx8YpvpIjtcFnU+JMPy9lS13eKWScfCLoCxNa8oQwo=;
 b=IdaVOLVZJVE0jKEJ14sYfZd1qNRKhvs/NfT0e8kD5NjXf1Kh4SFmoRoDc/twLeVCflbFAUU4iRiiJn765n0aKH1ydcQdq2/H2qAX9fAjoGFXJWtzkFl1X2j21BzuTmoqRfDAUrQ/9IxP/zHg9Ar0286PGA8uBBPNb2M2U16EuP0T9HDS9MBAacl7TI916X8BHqDnXDbBu32dz2wLkYa1euTZoMBH5elkU0iLR79Iq9umDWGUe3O2BxNsAT9D1u1c2WbgS1S/lq2hH2ATmjnH9IdYypA9707gBoNil68dkonlsyr5Iv07EzSeHAmHeZKaeCOgq+q3BP47A4iN2+Lt1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=bp.renesas.com; dmarc=pass action=none
 header.from=bp.renesas.com; dkim=pass header.d=bp.renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bp.renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UHx8YpvpIjtcFnU+JMPy9lS13eKWScfCLoCxNa8oQwo=;
 b=hXrAeiGZFUXdlg6HrRFViqdzyw3L62kdrOIRW559EpxA+8ujED3XLCt5Vtvrp79MIFbcAmC5NzkaVWjo9m3ntF1P1n7jHuGzHDm43t1jJAei0eWCQOl72IiWRK3OrPjDiLn5PkGJ1yaMgAIYOgmUCBy6IB6Vk5VTzu3ZYZU+HV0=
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com (2603:1096:604:bb::5)
 by OSBPR01MB1942.jpnprd01.prod.outlook.com (2603:1096:603:21::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.18; Thu, 16 Dec
 2021 14:02:14 +0000
Received: from OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::4:9f00:3f5b:3893]) by OS0PR01MB5922.jpnprd01.prod.outlook.com
 ([fe80::4:9f00:3f5b:3893%4]) with mapi id 15.20.4801.015; Thu, 16 Dec 2021
 14:02:14 +0000
From: Biju Das <biju.das.jz@bp.renesas.com>
To: Daniel Stone <daniel@fooishbar.org>
Subject: RE: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
Thread-Topic: [PATCH v3 0/3] Add Mali-G31 GPU support for RZ/G2L SoC
Thread-Index: AQHX7CAH/1JfygFoU0qIZXIpyjdPl6w1MjiAgAAAQFA=
Date: Thu, 16 Dec 2021 14:02:14 +0000
Message-ID: <OS0PR01MB59227318B2821A249647BFB386779@OS0PR01MB5922.jpnprd01.prod.outlook.com>
References: <20211208104026.421-1-biju.das.jz@bp.renesas.com>
 <CAPj87rMUrB34jVMSdcMqVaf+aRJLq0okHtDjc-bHQ8BcQoqOkQ@mail.gmail.com>
In-Reply-To: <CAPj87rMUrB34jVMSdcMqVaf+aRJLq0okHtDjc-bHQ8BcQoqOkQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=bp.renesas.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2203fd5e-ed24-4e6b-9183-08d9c09ca9f5
x-ms-traffictypediagnostic: OSBPR01MB1942:EE_
x-microsoft-antispam-prvs: <OSBPR01MB1942E6E28C835FC2171E8F3A86779@OSBPR01MB1942.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: WIW6RwKAWLUQZduXL0v37RBw2SVC4mTp/e3hnPIZXH62BABaZhNkL5JZzE3BmzJ8cfo39PK/zo036W0U23R82Nsq4MDVwMEV6WR4gOzjEWMMCNeQqsM5oNToBIS5oe1b7NEMFM2aBMTj6mTNtr7gp8QB78jCbMJvzauDb//JDLwY1d32aNhBwKX1hP9wyFoCWiLOuzoOnwPUyqb2vTMStxXNKM/0XziOJ01556d7uRhXDNHTUQpaGgBPb+3u0o6F6CFFkHy/ionaOba9ittYyymIbZBpQGH87/uWu6DDD/YaxO3puZXWKti5E4w/IggqEhkevdldXKh1Gy1U4B1PkSKzysjmVD39en/6XqtGAI3fIZmhdMoR7MdWruFE8K0ghFQdeMlZcdVzfYA/Xbks0wowOrIz+Dh2BTZGsZE88FRf1x3qjmVv/Hzl7eQhbhacXR03+4KXUVvZDggT6S7Y6vldUOYijon3ISWhNiWoYgNUdx/BGhIOL3ZATcsyCOa41Ta52E4lxiSjNeuwYyK24SBNbHAxA1JJdc8me8uFGetu7aYeMSgM5qswRBZlwwN1+5ub1IgOEPTKXUP5COGk81eHAsiojdtAaWWOVOd1CwK/28goeblQyaPu/ee9S+xEYr/ks24sA1YwK/pyFL8CrvdqH8UegOEkZ1zzNr5RP6BsQ9L/jV9J4fPi1SXVAVOUad+rY+WPWCPf9DcIoILp7Q==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:OS0PR01MB5922.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(122000001)(2906002)(55016003)(498600001)(26005)(9686003)(33656002)(6916009)(8936002)(64756008)(86362001)(54906003)(66476007)(66446008)(66946007)(66556008)(76116006)(186003)(8676002)(71200400001)(4326008)(4744005)(7416002)(38070700005)(83380400001)(6506007)(52536014)(5660300002)(7696005)(38100700002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Yll2eGxYTFZSVUhiYVcwUFFpa2ozaStSRVdEZWR1b09vU0MzZUN6WHZNSzdJ?=
 =?utf-8?B?Y0NiNDBVdENrMzN2QVg4NDVGQmZuc3FtNHl4YStlUmhkdk1OQVNIaXRhOGZp?=
 =?utf-8?B?YlkrNlVYYkxCSzRYZTZJVERFYkR2a3RLWk1EWWRHNVR3a1hmd1pWK2VCY2dM?=
 =?utf-8?B?WkMrakJNVlV5RGFwYTF0M1JLbUVESmF3TzRRRE8vMHkxbklhUlI4cWRvVm1X?=
 =?utf-8?B?VG5PeG5Bd2w4Q0c4OEtnU2ZickFqcXVjbTdXclZ2R2FFaDhnazlXYmRhV3k2?=
 =?utf-8?B?Q1BBR29XeHRscG5YK0plWVJlaFd4aEdaeVJLQ2xuVnNPNGJxMEM0SFRxYmhp?=
 =?utf-8?B?MHN1SGpvMFR4QlRheUF2T2hWZEtaQUg4YnFtZWtYTGJtNXlTMVVoUDRIUmNi?=
 =?utf-8?B?TS9sVmMzVzJXTmZ2N1ZjMTJTY2J3WDExc3NGTXZqeS9jakNLeGFKV0pJZGJa?=
 =?utf-8?B?U3JLcURsWE5raWtvM0h1SUZLMi9rL25vZGpuZFNsVTg0YXFiWWwzWXZCS2F5?=
 =?utf-8?B?Y2hpK1pkQlVQQmhrVHFYc2ZtaE9GbFpFY2V1eVVxNUdmbW1zc2E0eVdzTnU4?=
 =?utf-8?B?L092ZTd1MGxCT1pWSklhbGFBR2xzcjh6OUlJOWJpaVU3ejlyU3Y2STZCZEE2?=
 =?utf-8?B?QjFwWVFkNkVFeDV5QWh1bzB2cG0vOCthYmhtYnozM1hSc0p6NmpFclhjL0p2?=
 =?utf-8?B?dzhBWmdlOGJJQWlHNStwdGFjK0VBVkhqSmNpOVJBQkNBdnVUN3RkVTRkcDNX?=
 =?utf-8?B?RE4zQk01SlRuSlVGR1pjWis3aTYxcGhsNGhESGg0SnoxdzVCUVFnY1F1UStK?=
 =?utf-8?B?bDdJR0k2UndHaUk5TklyT3RkU3FVaHprN3JBRzVRTGsxN3RKQmRCbnVwZDds?=
 =?utf-8?B?dHB0TGdJNGY2TENvSUJuUmJoTUZXc2NodHJNcGU3L3VLN3Y5UTZwTVNkRERl?=
 =?utf-8?B?NlhvTkphVi83cC8rQ1hHanpnTnpLV2tFTVpCb3NDbG05N0ZrNXAycmcyM2tI?=
 =?utf-8?B?ajY5QU83T0F6MTIvR0RUaWo0YmFxOHZkMGl5Y29Cd0Y5Z0ZrUXhiRWYyT3NM?=
 =?utf-8?B?UW1jQmlSakVzRUdZcnQrWm9ETXc1eVdScVRUbEtwRFBCTEU2TTI2dmwxSlcr?=
 =?utf-8?B?cDdwZzN6eU1ncXFub2RUWWM3UEFkRlFkU0VkL293VmZmVWxCTlY3Y0NyYUtp?=
 =?utf-8?B?aURIVTJ3T0xOT2gzNERUQzJOcnhZazd1L0swVUkxV1NWWCt1ZWs3ekVDMEhi?=
 =?utf-8?B?WlprNmFLZzRKcytNeWp1UEtxWTdlM1JNMVZjUjNlOWJjbGIwTFMxSGZBTS9C?=
 =?utf-8?B?WUpDL2VRMGRFM0dFalNzRGY0dkxLS2pOM09FTHUrUC83SjRnWk1XczAzTEMr?=
 =?utf-8?B?cytXWFZVUWhZUXQxUUNrN041b1RxWHpSRVFDdmRhSnBIVEZ4Q1FjMU9URXU4?=
 =?utf-8?B?NHUxbGdEa2ZUQmRqb1BLMjcyeVowR0M5cEhWbFZodWtscHRNLzJrOUJjc01Q?=
 =?utf-8?B?NzJnNlBiRytORmxqZ1diaFNFVUFuMzBhcFJxakF5Nkwvakc2NjFEQVNoUis0?=
 =?utf-8?B?cUZhbFVqdk0zY01uVzBoQlVpNEJNQUhJek1jWXZoZG5oTHZHQjBHREt6Q05x?=
 =?utf-8?B?a2QxREVtMUt1U3M1b3R1aVg1a1ZWS0F0NGxlZWRBU21MVGE5TUprTzk5RExE?=
 =?utf-8?B?bWZHbzFrWFF2QUlRM1UrRGRIeUVYNU5ibUxZMllPOTExWXV6NzVGSWd0dTB3?=
 =?utf-8?B?MjdBU2gwWG1DRXBCNnVLaHJsa2pSZTBXWmhURUVUOXhEOHRVVGsvKzhNRkF0?=
 =?utf-8?B?TmpGdmdRODJkL1Y4TUllYThycTR0R2c5TG5PS2hMS0Q0bnc5VUZ1eE0wb0lR?=
 =?utf-8?B?UmZHelpiSDd2RHNMVk5BZXFOSWdtYU00T2RjV1dNbnlaNVNsaU5VRzZhcUVw?=
 =?utf-8?B?bkp3MWRVdVZUS1hUNlZtTUJuQ0JvQ3Jsb2hxa2NRT3NoN1dkQkptaTEya0pP?=
 =?utf-8?B?a2w4UEFZd3UzL3grcGgwRTZxU0pPZ281eGVrSFBlMGFnVHFYZ1lKSytMNHpj?=
 =?utf-8?B?eTJxbnd3U3UzNksxYkpaQTRDblNqNVB3Tm5YNHpOdm1vZXIzUHZDMktDcGZz?=
 =?utf-8?B?b3BrZE1SN0RIM05CYnpKRlRhMTJaT1ZTWDRpOWROUlhScmc4L2I4WXJQalpJ?=
 =?utf-8?B?L091TUc0aXdrbXR1dDlDaFlTbC8xWjdNcy8vY2VEbCtCWSs3TFdvcjZmSFlF?=
 =?utf-8?B?WGhjTG1ad0NHOU92bWdra25nTVBRPT0=?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: bp.renesas.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS0PR01MB5922.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2203fd5e-ed24-4e6b-9183-08d9c09ca9f5
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Dec 2021 14:02:14.7728 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5zui23bsXnJg8ftgw4mo2GwYzputHujB9rdsW2a1uztsuY+g5oMyVUy8V7+R0q7dXTWALA1W55ii6CtYAB+dEPRLw3217beK6qcYByQtjXE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB1942
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Chris Paterson <Chris.Paterson2@renesas.com>,
 "tomeu.vizoso@collabora.com" <tomeu.vizoso@collabora.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Steven Price <steven.price@arm.com>,
 "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>,
 Biju Das <biju.das@bp.renesas.com>, Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgRGFuaWVsIFN0b25lLA0KDQpUaGFua3MgZm9yIHRoZSBmZWVkYmFjay4NCg0KPiBTdWJqZWN0
OiBSZTogW1BBVENIIHYzIDAvM10gQWRkIE1hbGktRzMxIEdQVSBzdXBwb3J0IGZvciBSWi9HMkwg
U29DDQo+IA0KPiBIaSBCaWp1LA0KPiANCj4gT24gV2VkLCA4IERlYyAyMDIxIGF0IDEwOjQwLCBC
aWp1IERhcyA8YmlqdS5kYXMuanpAYnAucmVuZXNhcy5jb20+IHdyb3RlOg0KPiA+IFJaL0cyTCBT
b0MgZW1iZWRzIE1hbGktRzMxIGJpZnJvc3QgR1BVLg0KPiA+IFRoaXMgcGF0Y2ggc2VyaWVzIGFp
bXMgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBzYW1lDQo+ID4NCj4gPiBJdCBpcyB0ZXN0ZWQgd2l0
aCBsYXRlc3QgZHJtLW1pc2MtbmV4dCArIG1lc2EgMjEuMy4wICsgb3V0IG9mIHRyZWUNCj4gPiBw
YXRjaCBmb3IgKGR1ICsgRFNJKSArIHBsYXRmb3JtIHNwZWNpZmljIG1lc2EgY29uZmlndXJhdGlv
biBmb3INCj4gPiBSWi9HMkwuDQo+IA0KPiBDb3VsZCB5b3UgcGxlYXNlIHBvc3QgdGhlICdwbGF0
Zm9ybS1zcGVjaWZpYyBNZXNhIGNvbmZpZ3VyYXRpb24nDQo+IHBhdGNoZXMgYXMgYSBtZXJnZSBy
ZXF1ZXN0IHRvIE1lc2E/DQoNClN1cmUgd2lsbCBzZW5kIGEgbWVyZ2UgcmVxdWVzdCB0byBNZXNh
Lg0KDQpSZWdhcmRzLA0KQmlqdQ0K
