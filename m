Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8AC82EBE5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 10:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2C5510E454;
	Tue, 16 Jan 2024 09:44:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CHN02-BJS-obe.outbound.protection.partner.outlook.cn
 (mail-bjschn02on2053.outbound.protection.partner.outlook.cn [139.219.17.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A530010E454
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 09:44:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g0+nH0QJj1GWro835APjaE/EJ2znJvd+rx0U5ax8dmeoa5OcMftrOQqUcrEVkkWX3zJX46/PeVL4WMlyX1ABI6p9+oEp73EjadWv4HfbuKrfnaw1ax0d4n2tRL9pMO7VioTfKCPHPVrUuKU4ubOnmnNY3y5Bi0dRxWZNlOkGlNoQVf8KkkIU1rqnF6BoUmFrul7fMR3fo6O7qEIs94Jm7hqehv5T6Vi/mVTzjytHoHaNpZyJ/gGwA4APe4w3UDR7rdL2Fgy1uuG67RM1yQskQOKX5QtI+yy2tkkNlkVmj5k5Ox0yRuY2P9psVLiL5VSJ7TucYqBesgP/rph+HYnOGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dBFc/YXyHuuSYUXDQ4BJhh/4grS8fU//b3wEK1qYjdw=;
 b=hCXdO1DApDA4ZV5S8mzJWmZjHxyavdx1CsHHZUVc4YM7TF/zXQweC/ouMm/ZmGXJocSw02prwPXQXH00vib9Lo6uCQpKbkwRK3xusXPOa7NuVwbGmMp/gWSFAGM+EI954TAKnsO6evMMA5j8cLbCt/AtBcu+6lrk6R1slfiB/dE967WaCkPp84Oj1q3GTaWGBRwxDqB2vcaBqf0FUHcTFoCtq35N+01DvwrfyndrnOrVQEkBKw72rt5SjzPwc7PH4z/i/kJ9esG0VZCX4x9dQxb+Cp6qi0dwbJ3TQcAXTniYl/bTokLsy0M67WpsxF1LWJrfRREtQTpuPm9tEmt45A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=starfivetech.com; dmarc=pass action=none
 header.from=starfivetech.com; dkim=pass header.d=starfivetech.com; arc=none
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:d::7) by ZQ0PR01MB1174.CHNPR01.prod.partner.outlook.cn
 (2406:e500:c550:1b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.26; Tue, 16 Jan
 2024 09:44:19 +0000
Received: from ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
 ([fe80::ac0a:d124:81b3:33fb]) by
 ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn ([fe80::ac0a:d124:81b3:33fb%6])
 with mapi id 15.20.7181.026; Tue, 16 Jan 2024 09:44:19 +0000
From: Shengyang Chen <shengyang.chen@starfivetech.com>
To: Stefan Wahren <wahrenst@gmx.net>, "neil.armstrong@linaro.org"
 <neil.armstrong@linaro.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: RE: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Thread-Topic: [PATCH v2 0/2] Add waveshare 7inch touchscreen panel support
Thread-Index: AQHaQsrahW9RVOc2vE6qAfS6BeiBCbDRVbeAgABlTYCACn7JQA==
Date: Tue, 16 Jan 2024 09:44:19 +0000
Message-ID: <ZQ0PR01MB106221070C17FBDE9F9507C8EF73A@ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn>
References: <20240109070949.23957-1-shengyang.chen@starfivetech.com>
 <99d7bb85-17b0-4b5e-a6cf-f5957ad92298@linaro.org>
 <bb87cc98-ee9b-46b6-bf24-6aa69af1e0e5@gmx.net>
In-Reply-To: <bb87cc98-ee9b-46b6-bf24-6aa69af1e0e5@gmx.net>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=starfivetech.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ZQ0PR01MB1062:EE_|ZQ0PR01MB1174:EE_
x-ms-office365-filtering-correlation-id: cb66a8d7-852c-424b-2fc4-08dc1677b685
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3qPP6Ty/bkfK7pkZNYLOSs4luFC9w5nzcapeBn7yE3nqE7VMxxstT2WUyTTomTU19s96h9cg6luoHCVy4y6hX5srHSUfPa7J9wnzjZs/ljUFgTGu00uHc6ETrlye4hgKEmdx8ns1ErvsLeDaEnuCxvTvJoIa0Ah+oVsC/uHdnx3XSTMVpI9zzP+rTYl+7vo6Ax0piW3gHLVUPhyX6mDdSuKFs2FkWn0BDvrzUGcN3iiPj17cSnFsUMonRy2bJSfFD/SrsJTo0n12+qIxIBqGQLu+FCpx337zwE8qbUdPCU2iVkYGilzO64cKNXxBaCilQGTWZEpC+jw94HQAEP86WMimYRCcaBhTumUD83AlF91uET1+VCLNVjuRHgqzc5yhQ+Rk2HOSadWYQSTTNnty7VCESm7aww+1cTxVPw3GC6H/uwi1p+jOxPn9+uf7/7z45cHo5k6+gLKAsZRJEiZNSGEOAAmX7ZqLKQhluiaHk77HFFHWFMm0rQEKkJLnVdlvCiE+WEAKrjukE0dBitLo5u3CNbopFpC2tcFUwvPOQ1hvoRslD/5+kuUWwiME2IbO
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn; PTR:;
 CAT:NONE;
 SFS:(13230031)(366004)(136003)(39830400003)(346002)(396003)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(40180700001)(4326008)(8676002)(8936002)(2906002)(5660300002)(44832011)(33656002)(41320700001)(7416002)(41300700001)(38100700002)(38070700009)(53546011)(55016003)(7696005)(40160700002)(966005)(71200400001)(26005)(508600001)(83380400001)(86362001)(9686003)(54906003)(64756008)(110136005)(122000001)(66446008)(66556008)(66476007)(66946007)(76116006);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGdOVXpLbmJvRHl4VVhwZUJqV2hxSXlqR3VoQ3dCVSttUFRNemNPUWhEYWZs?=
 =?utf-8?B?T2RIQ0FvZXlVZFhQa3ZKaWNtSWsvNTZETHptS1FNbm9ERzEwYm1vQlhwQVl4?=
 =?utf-8?B?M2NTME5kT2FybVh1LzlSS2RGQkx3cVpOTU5ON29lVHJKbkltVnZ6cG1EMy9h?=
 =?utf-8?B?V3NiaUlMRFJGRWRQWE8yVUV3Wi9JMWNJTDludUsycElMOWkvUnhFYnVCeVRM?=
 =?utf-8?B?VS92K1Y5K3NrbStMNHpnOE9OenpqcG8wdDZ1S0JVSUM5SERqT05mZUpRMkY5?=
 =?utf-8?B?Z1dKQVRydmt6OHJ1b0lucDZOODFBR2xGT3hIall1Z3p6cmMvM0w1OEluTFdj?=
 =?utf-8?B?TTl2ZzIyWjVaM1ZJTXJMY0s1RkkxMS9oU0dJNzZ5ci8yQktybzFJQ1Y1SFBt?=
 =?utf-8?B?eUlaTWxIZXJubmdCZm44b0xWOG43UzVtSzRNMmY3WEpuTUlYdWF6dVhvUkRt?=
 =?utf-8?B?SGF0MmpZVmZ6aEkrcXltZzd6dEx1TTlTc3BJYVpXSHNZTGZpRDEzYWdzR2dU?=
 =?utf-8?B?c0dFMHZBdUtUcXFnaDg0a2xlT0MxR0FMS0F5eHJXKzVuNmxYZCtnSlVEOFUw?=
 =?utf-8?B?R051VkIrK2RnRzN5aWlaQnJZaWoybTlHV2tEdzhORmdjdjgxMm5rN2FOMDI3?=
 =?utf-8?B?K2FuZWVlRTZPZ0V0NUt4aFV6U2loUFBJMStOTDVyTFBmZVRnYWtKR0p6ek9N?=
 =?utf-8?B?N2tPOHBBaGJkN1VYOUNSdTA1ekVJcTF5NDl5WGpxaWpsN3VlTU01RUcveEUv?=
 =?utf-8?B?OG5YVm80ZWMwQ0g1b2w2T09JL25wY0JRSytiQmh6TGJuc1JTcmpJQUVYZmJD?=
 =?utf-8?B?N1lVb1pORnpUdDBmek95TEExdG1wTHBXa0dmWjgrM2F2b1hBNVIwSlhvdHgv?=
 =?utf-8?B?L3BvdUdtbGM2aHRxazlibWZVdTRnZnpVNlorZEhXTDlrM2VQL2I2ZUJKcWl5?=
 =?utf-8?B?V1J5OXpVYktIOGlocUNnSkl5RE5yUmFKZ0J0KzJuaUUzcFR4TnZzNlpldjVU?=
 =?utf-8?B?SEc5THg1ejkyVHZTTC92Y1V0d2Q4RkdvYzNJdlhJeWgycWtzYmdhdy9SMTF5?=
 =?utf-8?B?K2JMVEYwaFBra0tJZmtVMUlWQnAxMkFWTXZvd0FTMjRPVlNwM1ZpSGd1K2sx?=
 =?utf-8?B?dEp2YlJvYnc3M2VyWDJWcDJtT2xwZnNrZlp0QndrRjI1RmNFZjhoRExqcmd1?=
 =?utf-8?B?VktPZk5TbllEVXhDZHBCQXlRVG1lUHJWRlF3UlEzSGE3eTBNa1NqeWtNQkxG?=
 =?utf-8?B?dzdRY3E0VXBkOTBUcWVURjlCOEgvVkdaNkNIcHFmVi91cXlCdVZyZ3FZL0lT?=
 =?utf-8?B?dXZraHYzNmlwR2djY0YrUklJdTVBVTRGKzUrNDVKWVZSQlJTUCtPR0w2YkRm?=
 =?utf-8?B?VWhnbzhJL0RsS3ZhTUJ2dk51ZzBuWktyUnhEM0M0anFoc2M5dGxid3pyY1Yr?=
 =?utf-8?B?Q2hGeEkxalIxK2huZDRKTlZLSTdNa1h3L0hGMm9xUHhHNm1IdVhGZks2ZGNC?=
 =?utf-8?B?UG11b05sNkFwQnVuSVRyQnpLeEdoVXQrR1M4Rkd4bHBwajdHanVPQ2txSzBx?=
 =?utf-8?B?T1ZqaWU3TkN3Yzh1d1pscDZuTEdSMmhSQ1BPaVI2QVBhOEpycGZPdk1KeVVT?=
 =?utf-8?B?UjY1ajdkSm1PMjdTdE1UR0tsOXVPaTFvSVJTY2oweW11T2lCWWFxc1J5UHJi?=
 =?utf-8?B?QVNEVnZvbjVvWGVxbDY5d3pNOG4zaFd0YlNxRHE5WnYxR0RIRHhjTVUybjNt?=
 =?utf-8?B?bnRmZTNyQmdhSUZ2ZXlaN3FKQm8xWjgzQXc2YnNRRTdXRzdhd2JHZUsvWHBY?=
 =?utf-8?B?Z25PdVRveWY3SEpHUkF1L28vbTlyQ2c0eWM0eFE0a0NBZXhiZW1mVlpCbmlF?=
 =?utf-8?B?ZklKdU8rQ29ncFB5a012eFpHYW5rVFZOSjgwczgzdGtib1FXVUNSaytqeWpH?=
 =?utf-8?B?SElHeDV1SDNuQzZ4WncyajB6N3JPQktSRkpEMklmTDV6WTNkNUYzRnRGWEFZ?=
 =?utf-8?B?STgwOW9Nd3pwMENTQlF1eXpiS01wZUErSGoxbmhBV09VeS9VTXNVVlhFMGh3?=
 =?utf-8?B?MTRQbnV6emFEaFEwbnJkcWd2b1k0QlNDSkNqckk1aFgvSHg5Y3NuSnBycnd1?=
 =?utf-8?B?Z29LOW11R0NrNXoyYjF3QlI3eDdsak5pREU5ak9JcUtwZWIyZmpVYVd1YTFm?=
 =?utf-8?B?NWc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: starfivetech.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ZQ0PR01MB1062.CHNPR01.prod.partner.outlook.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: cb66a8d7-852c-424b-2fc4-08dc1677b685
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jan 2024 09:44:19.8725 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 06fe3fa3-1221-43d3-861b-5a4ee687a85c
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4CinDiUjH8fsjrPWH+1AzBH1+1xnZ0u0kct3t+b7LRlrTsYkTs+CR/k5gUYPj4EVtqvfwONdOtqMNzdD5w3K2h2RSWojNw/ldAtSFzoIPwE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: ZQ0PR01MB1174
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
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 Keith Zhao <keith.zhao@starfivetech.com>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "dave.stevenson@raspberrypi.com" <dave.stevenson@raspberrypi.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "mripard@kernel.org" <mripard@kernel.org>,
 Jack Zhu <jack.zhu@starfivetech.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "airlied@gmail.com" <airlied@gmail.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGksIFN0ZWZhbg0KDQpUaGFua3MgZm9yIHlvdXIgY29tbWVudCBhbmQgc3VnZ2VzdGlvbi4NCg0K
PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVmYW4gV2FocmVuIDx3YWhy
ZW5zdEBnbXgubmV0Pg0KPiBTZW50OiAyMDI05bm0MeaciDEw5pelIDE6MjINCj4gVG86IG5laWwu
YXJtc3Ryb25nQGxpbmFyby5vcmc7IFNoZW5neWFuZyBDaGVuDQo+IDxzaGVuZ3lhbmcuY2hlbkBz
dGFyZml2ZXRlY2guY29tPjsgZGV2aWNldHJlZUB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IHF1aWNfamVzc3poYW5AcXVpY2luYy5jb207
IHNhbUByYXZuYm9yZy5vcmc7IGFpcmxpZWRAZ21haWwuY29tOw0KPiBkYW5pZWxAZmZ3bGwuY2g7
IG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4LmludGVsLmNvbTsgbXJpcGFyZEBrZXJuZWwub3JnOw0K
PiB0emltbWVybWFubkBzdXNlLmRlOyByb2JoK2R0QGtlcm5lbC5vcmc7DQo+IGtyenlzenRvZi5r
b3psb3dza2krZHRAbGluYXJvLm9yZzsgY29ub3IrZHRAa2VybmVsLm9yZzsNCj4gZGF2ZS5zdGV2
ZW5zb25AcmFzcGJlcnJ5cGkuY29tOyB0aGllcnJ5LnJlZGluZ0BnbWFpbC5jb207IENoYW5naHVh
bmcNCj4gTGlhbmcgPGNoYW5naHVhbmcubGlhbmdAc3RhcmZpdmV0ZWNoLmNvbT47IEtlaXRoIFpo
YW8NCj4gPGtlaXRoLnpoYW9Ac3RhcmZpdmV0ZWNoLmNvbT47IEphY2sgWmh1IDxqYWNrLnpodUBz
dGFyZml2ZXRlY2guY29tPjsNCj4gbGludXgta2VybmVsQHZnZXIua2VybmVsLm9yZw0KPiBTdWJq
ZWN0OiBSZTogW1BBVENIIHYyIDAvMl0gQWRkIHdhdmVzaGFyZSA3aW5jaCB0b3VjaHNjcmVlbiBw
YW5lbCBzdXBwb3J0DQo+IA0KPiBIaSBOZWlsLA0KPiANCj4gQW0gMDkuMDEuMjQgdW0gMTI6MTkg
c2NocmllYiBuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnOg0KPiA+IEhpLA0KPiA+DQo+ID4gT24g
MDkvMDEvMjAyNCAwODowOSwgU2hlbmd5YW5nIENoZW4gd3JvdGU6DQo+ID4+IFRoaXMgcGF0Y2hz
ZXQgYWRkcyB3YXZlc2hhcmUgN2luY2ggdG91Y2hzY3JlZW4gcGFuZWwgc3VwcG9ydCBmb3IgdGhl
DQo+ID4+IFN0YXJGaXZlIEpINzExMCBTb0MuDQo+ID4NCj4gPiBDb3VsZCB5b3UgcHJlY2lzZSB3
aGljaCBTS1UgeW91J3JlIHJlZmVycmluZyB0byA/IGlzIGl0IDE5ODg1ID0+DQo+ID4gaHR0cHM6
Ly93d3cud2F2ZXNoYXJlLmNvbS83aW5jaC1kc2ktbGNkLmh0bSA/DQo+ID4NCj4gPiBBcmUgeW91
IHN1cmUgaXQgcmVxdWlyZXMgZGlmZmVyZW50IHRpbWluZ3MgZnJvbSB0aGUgUlBpIG9uZSA/IElu
IHRoZQ0KPiA+IFdhdmVzaGFyZSB3aWtpIGl0IGV4cGxpY2l0bHkgdXNlcyB0aGUgcnBpIHNldHVw
ICh2YzQta21zLWRzaS03aW5jaCkgdG8NCj4gPiBkcml2ZSBpdDoNCj4gPiBodHRwczovL3d3dy53
YXZlc2hhcmUuY29tL3dpa2kvN2luY2hfRFNJX0xDRA0KPiBpIGRvbid0IGhhdmUgYW4gYW5zZXIg
Zm9yIHlvdXIgcXVlc3Rpb24sIGJ1dCB0aGUgUmFzcGJlcnJ5IFBpIHZlbmRvciB0cmVlIHVzZQ0K
PiBkaWZmZXJlbnQgdGltaW5ncyB0aGFuIHRoZSBNYWlubGluZSBrZXJuZWw6DQo+IA0KPiBodHRw
czovL2dpdGh1Yi5jb20vcmFzcGJlcnJ5cGkvbGludXgvY29tbWl0LzIyMmI5YmFhOTdjYzRjODgw
ZDA0MGE4YzZhNQ0KPiBkYTgwZDZhNDJjOGU4DQo+IA0KPiBBZGRpdGlvbmFsbHkgdGhlDQo+IGFy
bTY0L2Jvb3QvZHRzL2ZyZWVzY2FsZS9pbXg4bW0tdmVuaWNlLWd3NzJ4eC0weC1ycGlkc2kuZHRz
byBzdWdnZXN0cyB0aGF0DQo+IGl0IHVzZXMgdGhlIFJhc3BiZXJyeSBQaSA3aW5jaCwgYnV0IHVz
ZXMgdGhlIHRpbWluZ3Mgb2YNCj4gcG93ZXJ0aXAscGg4MDA0ODB0MDEzLWlkZjAyIGZyb20gcGFu
ZWwtc2ltcGxlLg0KPiANCj4gTWF5YmUgU2hlbmd5YW5nIGNvdWxkIHRlc3QgdGhlc2UgdGltaW5n
cyB3aXRoIHRoZSBXYXZlc2hhcmUgdG91Y2guIEF0IHRoZQ0KPiBlbmQgdGhpcyByZWx5IG9uIGEg
cHJvcGVyIGltcGxlbWVudGF0aW9uIG9uIHRoZSB1bmRlcmx5aW5nIGRyaXZlcnMuDQo+IA0KPiBT
b3JyeSwgZm9yIGFkZGluZyBtb3JlIGNvbmZ1c2lvbi4NCj4gDQpUaGFua3MgZm9yIHN1Z2dlc3Rp
b24uDQpXZSB3aWxsIHRyeSBvdGhlciB0aW1pbmcgZnJvbSBwYW5lbC1zaW1wbGUuDQpNYXliZSB3
ZSBhcmUgbm90IGdvaW5nIHRvIGNvbW1pdCBuZXcgcGFuZWwgdGltaW5nIHBhdGNoDQppZiB3ZSBm
aW5kIHVzZWZ1bCB0aW1pbmcgZnJvbSBwYW5lbC1zaW1wbGUgdG8gZHJpdmUgdGhlIHBhbmVsLg0K
DQo+IFJlZ2FyZHMNCj4gPg0KPiA+IE5laWwNCj4gPg0KPiA+Pg0KPiA+Pg0KPiA+PiBjaGFuZ2Vz
IHNpbmNlIHYxOg0KPiA+PiAtIFJlYmFzZWQgb24gdGFnIHY2LjcuDQo+ID4+DQo+ID4+IHBhdGNo
IDE6DQo+ID4+IC0gR2F2ZSB1cCBvcmlnaW5hbCBjaGFuZ2luZy4NCj4gPj4gLSBDaGFuZ2VkIHRo
ZSBjb21taXQgbWVzc2FnZS4NCj4gPj4gLSBBZGQgY29tcGF0aWJsZSBpbiBwYW5lbC1zaW1wbGUu
eWFtbA0KPiA+Pg0KPiA+PiBwYXRjaCAyOg0KPiA+PiAtIEdhdmUgdXAgb3JpZ2luYWwgY2hhbmdp
bmcuDQo+ID4+IC0gQ2hhbmdlZCB0aGUgY29tbWl0IG1lc3NhZ2UuDQo+ID4+IC0gQWRkIG5ldyBt
b2RlIGZvciB0aGUgcGFuZWwgaW4gcGFuZWwtc2ltcGxlLmMNCj4gPj4NCj4gPj4gdjE6DQo+ID4+
IGh0dHBzOi8vcGF0Y2h3b3JrLmtlcm5lbC5vcmcvcHJvamVjdC9kcmktZGV2ZWwvY292ZXIvMjAy
MzExMjQxMDQ0NTEuNA0KPiA+PiA0MjcxLTEtc2hlbmd5YW5nLmNoZW5Ac3RhcmZpdmV0ZWNoLmNv
bS8NCj4gPj4NCj4gPj4gU2hlbmd5YW5nIENoZW4gKDIpOg0KPiA+PiDCoMKgIGR0LWJpbmRpbmdz
OiBkaXNwbGF5OiBwYW5lbDogcGFuZWwtc2ltcGxlOiBBZGQgY29tcGF0aWJsZSBwcm9wZXJ0eQ0K
PiA+PiBmb3INCj4gPj4gwqDCoMKgwqAgd2F2ZXNoYXJlIDdpbmNoIHRvdWNoc2NyZWVuIHBhbmVs
DQo+ID4+IMKgwqAgZ3B1OiBkcm06IHBhbmVsOiBwYW5lbC1zaW1wbGU6IGFkZCBuZXcgZGlzcGxh
eSBtb2RlIGZvciB3YXZlc2hhcmUNCj4gPj4gwqDCoMKgwqAgN2luY2ggdG91Y2hzY3JlZW4gcGFu
ZWwNCj4gPj4NCj4gPj4gwqAgLi4uL2JpbmRpbmdzL2Rpc3BsYXkvcGFuZWwvcGFuZWwtc2ltcGxl
LnlhbWzCoCB8wqAgMiArKw0KPiA+PiDCoCBkcml2ZXJzL2dwdS9kcm0vcGFuZWwvcGFuZWwtc2lt
cGxlLmPCoMKgwqDCoMKgwqDCoMKgwqAgfCAyOA0KPiA+PiArKysrKysrKysrKysrKysrKysrDQo+
ID4+IMKgIDIgZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0aW9ucygrKQ0KPiA+Pg0KPiA+DQoNCnRo
YW5rcw0KDQpCZXN0IFJlZ2FyZHMsDQpTaGVuZ3lhbmcNCg==
