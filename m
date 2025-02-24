Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBBEAA42890
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 17:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AFC710E480;
	Mon, 24 Feb 2025 16:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="q3xz06gP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011026.outbound.protection.outlook.com
 [52.103.67.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFDA910E480
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 16:58:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bIqNqKY/FvLqDdhuShh4ZPBM1Q4FPJACh8IORkVOS1yZ8o5OE2DxU9bP1XnTC+huEUEgGA5Ul3qZqCG9rCeCisuc5qd2fRnEpJPM9mMZxafdoYWI96dFB93f6hpzti1eGjM37A6xE1TNiWmB4Fq5qDzHlvxfANUPawESQ4Lmu5ei1egHeGzKAkRQNdx6DpcYXD9fSATCtZBv2oqA7pPokrxGiHEQAFEzpDn8izESBjUszdS7YHmRyOcvJtdqknLM8t5gfrznSTgvW3qyDa4cPBOx1ie4hxMt+oByUF/dFXI0XR1MHgF78ovuSeVhaHSvXOTV2uPiw68diVXXgaDDRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QGzov8wB7sI3TjU530QX53JyeN2hA1N96BCRSWXaFHc=;
 b=y25j348VdMo3Vp0rRGF2zIeUDi+x7x2ExAgQg1tyCQKvdsVZqt+BI+8rpFNbn8vN893/z1QZB1NdetvlJ7/4LygreN6ULobKjzvc8E1LdDG5+MExj1aFKg6bU3yJDB8z/TCWFU/e0R4y5LTlh6E7ZZ00WC1XjbLh7K7qV5J/w5S1I1V3rVJHjsm5dnthXoQI09bRJvV0tZ0eb5PHgofuXmkZwDE8nYkGMdU8u89MTSTpvn9mJxTdgdZ6KAqMe5biz8xUujuRqhfa/LpvYdish3o1wDayY/rgd+6qfz0hNmFwTEi+4gzbGjGt96l+S/CnobBgvjHdz5Njz9GsDkpbIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QGzov8wB7sI3TjU530QX53JyeN2hA1N96BCRSWXaFHc=;
 b=q3xz06gPTnpdUhG2aotxmtmlMpcjbd80T/f9Iap1gs5yd2QBtBEghsjTea9lFpAyLQqRfvw8pmAHAQgx5YdTud1onpuJP8x08uhosMC55UAwh+V9KvloPHswclgo7Tn/dFvLR8I+mSm0ZaJWSFynEmg7BJuP+DqNcx+ylWTl8m2XBKUSM3HVZJpK7dGTJtLUXhqx7Ek7kS+ij0e82VYeupdTgvZSHcmvnKjrNSjehlg9h1kBRlMs6hM1af0uNIE7np3TEPOeTjGDosz2MH12cK1YBVJwpCPnMiVJEPkYDEsTZP8b2GQ0EqtMKKCL3NTolHlNRZlG21zC3PI24ounVg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB4298.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:18::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 16:58:49 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 16:58:49 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>
CC: Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWrTuI
Date: Mon, 24 Feb 2025 16:58:48 +0000
Message-ID: <PN3PR01MB95974D5EB5A25386A8BF6FDAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
In-Reply-To: <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB4298:EE_
x-ms-office365-filtering-correlation-id: fbb6747f-2d09-4516-5f6c-08dd54f48236
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|19110799003|6072599003|7092599003|461199028|12121999004|8062599003|8060799006|102099032|1602099012|440099028|3412199025|4302099013|10035399004|41001999003;
x-microsoft-antispam-message-info: =?utf-8?B?YjNma0dGeGp3NmNNekRGMXNQUEtwQzdPK1BGWjYyU0o1UjhWVTROTkNGQ3hp?=
 =?utf-8?B?bjR2SGZsc2tXc3NEWjUwSlZXQk1odXBQeWhjNGszOGtFRkRCUzIzZDEzNDNV?=
 =?utf-8?B?bzJVZXZJVGJnUkd2LzhYUEhWeXZOdmxIUXI0eWRvSUpMemkxMFlBUHRmUGVT?=
 =?utf-8?B?czdpWjNlK0F3TWhrbmFwUklYazNmZ2I1M2RMU0lPeWRrOHNYUnFBMDJ1SFA5?=
 =?utf-8?B?TUVYNVBxVGFIVml1bjV1VUtKWEN4aE1hT1IyYjJuTTlqQjF6TTZEWEwrWHZz?=
 =?utf-8?B?UnFEOG5tUGJPQzZZaDJrczZUQW1NN0xCeEhtU3A5QlF5RVplTWs0OXVxTnFm?=
 =?utf-8?B?WHlOdHZmd09SajZkaDMvbFU3L1owNTZZSENvaSsyL0lVZGFKejROV1IwVFQx?=
 =?utf-8?B?Mk5zZC9TY0xoSWNSVzFQT1VHSXNaQ2VocHBZZDBUNXRTUFBQcnMzY2hKcmZL?=
 =?utf-8?B?ODV1S0pGeDU5R0hDZmpTRGZ5VlF5NE1BRXppdkZqVUFGM0Zud0NtSkZLTmlJ?=
 =?utf-8?B?WFZUR2JvVzRiWTVlcUkyN1RyMUlZNW4vRWs1VzNyRTA1bmZhbURaWHdna2Vj?=
 =?utf-8?B?UUNPN3ljMU10VkJvcHowcnU2VXhEcGk4dzlRSERicUZhYVBOdEV1ZnVETWRt?=
 =?utf-8?B?YUZvbU9SaENJbHhFT3pMekhpa0EwbG9QUWJUZlpRK0d4TzdWRlUwc09VcjRB?=
 =?utf-8?B?OHVhd0RCLzFPbXY2NlFSUzNCYW5aN0gxb2c5cXdiQkRHSnQ1YVFtV0hBdkNj?=
 =?utf-8?B?YzBxaDhLakRQejVXSHFtNWZtTGdDMTM2MmtqNmE1L2UzODA0YWZmeFdpbEtv?=
 =?utf-8?B?M29pR0ZRakdQSnR0SlpFa09FUUJyTjN2TUM3RSs3RWRYWCtGazBjOURLUkNS?=
 =?utf-8?B?SW5ZV1ViSG90c01oZi9nbDdpWEFrbnVQNzFxR2grZitjU1hLSXZSNG53RXFt?=
 =?utf-8?B?TGoycWF4K3kyRWxqSm1EUHN6dVZwTDg5Ry9rMHB4NmZWSlRoeWE0Rmk0OVYz?=
 =?utf-8?B?clVXZE9aV1llL3BkM0ZKK21TNGxSb3p3VHAyemxpTVV2UUVxQktqOXRYK1NY?=
 =?utf-8?B?UExIS3BJclNmclhtY3J6QUl0akhPYjhrZHlUNXZnWlI0QnFoMWVCSTEvTTcr?=
 =?utf-8?B?TnlBSHh2L3VQR3dDdkhaSGhOWlRkNFNsUXc1SkcwMit6UzRLbDFhVFpucFRh?=
 =?utf-8?B?alFEeFhaWEFxdVBPdlByemVXb1IzNWpmNjFvbk10VTdZUzNJWDBldjAyREVu?=
 =?utf-8?B?d1pveXAydkJ2a1NrU2NOWkppZFN6QktIYlY2Qjlyd3IzZlhoSTNjTlU1VlM3?=
 =?utf-8?B?WWlOV25Na29MaE11bDBxV3o4d0c4TmhLZ0xleDFuMXljZlRRbW14MitWMHQy?=
 =?utf-8?B?QVQvaHZYTUd6Qm50NHErS29FZ3hrdVYvOUxTbWh6aXlFSjY2emhxd1Nnb0Nq?=
 =?utf-8?B?bWQvNWtOQ1FtVlU0RUxsUkxTS1NSdUJIbzZwbUhQTVNFc2c4cDdoVGpwV3NN?=
 =?utf-8?B?a0YrZEUvSzJkT2xpWU4vaThVMmxGWW1zenJrdVJBU3QyNmt2bXlWeENxMWp0?=
 =?utf-8?B?aWhvVW1WSy9ZbHNoL0xCWnhTQ0d3N2REQTZZV1VtWVU3OHVZZVFicnpYZ3Z5?=
 =?utf-8?B?YlVSc0pldFJ4MVhEOC9Ta2JGSGprWDZjMGdOMERnR0JDdGtWazNzcGo3dzg4?=
 =?utf-8?B?aFo1L3QrL21rR2dIaXRkUTNESlNwSllpWWdmT2R0WUpkZW04TkpGYTBnUmcz?=
 =?utf-8?Q?maTNwwGV045BrA0VNs=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SW5YcWlVcVJDdTluVW13bkdwTC9qM2l5akhFTlk1d29la0ZCUHNyNXAwMnRM?=
 =?utf-8?B?MTNtZE9xTTBrRTZGUlJjNFZMTUhCTzhURzIwMFM4eUo1VkFxMTF1VFFERGxD?=
 =?utf-8?B?aDJXU2FGUndXemVVR1pmYlR6dGV4Qlp3T3gveXNUUWlJNlhxbHJPMHlnWThU?=
 =?utf-8?B?WVBKbnd6Rm51WmZDZlFTZ3ZxVE9ZYnRQMmlNZGpjZ0dZN2RQbHFxMm0xOVRi?=
 =?utf-8?B?RXhMUXJrMEorYkRWMDNaVWZoVnY0dHZoZWk2RnJYMG5BYWx1ZjVYazN4U2hw?=
 =?utf-8?B?WW02eGRnMVNQcFJveWsxcnh0V2pjekFSZHdWZkdTOE93QlcxY0hLcUN1Rkw1?=
 =?utf-8?B?MXhuVlgyT1czS2ROaXIvTFZUNXpGckc5dmxGRWp5UFRvdmdpc3N2cTIxUGFV?=
 =?utf-8?B?UjZWTHZ4Y2ZGeU9zRTV4bXZIbDZRZjdobmtHblNGWkQzRkw1L2c2Zkt4L0hx?=
 =?utf-8?B?dWZ6ZXlwdVA0VGNNQm9UcUtqZVY5dGhqWC9kOTNLSFNRNGZReTR2YzVEZGZO?=
 =?utf-8?B?Y1grL0JYSmZ5N1kwMmdFOEgvK3plL2M5TU9vdEc0NEpOTmJOR0twdVFjSHdt?=
 =?utf-8?B?TkQrV3lwbnpjSGJZd3ZLb2h3M0hGVFZHVzY3OVdaSlc4KzA3cW1kR0pmMHdF?=
 =?utf-8?B?ZDNteit0bTRrakFNSlBpSlZNOXhhK0VKd3NXanJqTmtwK3ZYQU5Fdmg1V0lv?=
 =?utf-8?B?YzN0NnhXRWJ4eUlvZXJwdjlZZGorOFlHZ3I1M1NpSm54M0tveGtZSW5qY3FG?=
 =?utf-8?B?bnc1czlhaUJ4YWFac2dTRkVFUGtnay9OUGMzN3NLblpjRktUU0Iza3NyUyt1?=
 =?utf-8?B?WUE1OGQ1Qy8rTXIyQnVKVk84S1RXTUcrRTRhMU5HT1VmZ29yZ0Rpejd1Ums3?=
 =?utf-8?B?Ynp3MmF6SEV2ZU1wSm8rNjBmRTBxNStiallmYzROb0VKSUlFYWNmWWN4WHVn?=
 =?utf-8?B?VlozdXI3S1dBUVJaL3NDUWRSM3QzbjVuNHpHV2QrQ0NWa2R4UmhMdUw5QVlM?=
 =?utf-8?B?REVaMHhOa0V3dmdBdXUzVmxmVmF5RGIyMUIxVDM4ekNFZkd0cXRLd2V4eGU1?=
 =?utf-8?B?cTNWU0FYa0JaU0hndDlGUFR2Tm9FdmkvVTF5NGdmeEsrd2VPVUlEZ241Ylk5?=
 =?utf-8?B?R2ZBZG44RWFaK0xWTzJWcWMyQXZsR0lWSDVpMGdkUnBoL2pGQklsMkphWXcv?=
 =?utf-8?B?aVY0VndpUEJTMVJUTm0vZUtnQ1RRY095c2ljbzJpUSs4UnN3RWplQ0M5MFhM?=
 =?utf-8?B?azlwZThBUjdYZm1sQWRFc05yajc1NklBODF0Qm00azlyYk5ZZ01mUTRjSXEw?=
 =?utf-8?B?bUpKUEJGc281SjNxb1FXeUY3MkxnMmpqS05KK0E2QzRORlBkUHF3NFYyRmpt?=
 =?utf-8?B?c3pVRkpQSnlCWXFTM3dmVy94VzJzckdpMkczenU5T1dNbEpTVXprV2J3aGww?=
 =?utf-8?B?RytBblBwM09RYm9MY2Rsa29QdzVDTk52ZW05d1VrNndDL0k5MmRKdSs2dGFG?=
 =?utf-8?B?cE9UZmUxZjBvWGJiMzBPK3BYSWVMZFlWeWZ3dzBaMFQ2TzFlU2ovUnM4Z095?=
 =?utf-8?B?VTVsN0tOZ1NiSG1oWlVTV1BkODJRdVNJM1pmMFNLZ2l5VFlac1Iva0VWU051?=
 =?utf-8?Q?nU+1ZJRV4J0XdytCh3Dwan9aJ95da7wzauENYLyWjOkA=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: fbb6747f-2d09-4516-5f6c-08dd54f48236
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 16:58:48.9754 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4298
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDc6MTDigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79Gcm9tOiBLZXJlbSBLYXJhYmF5IDxrZWty
YnlAZ21haWwuY29tPg0KPiANCj4gVGhlIFRvdWNoIEJhcnMgZm91bmQgb24geDg2IE1hY3Mgc3Vw
cG9ydCB0d28gVVNCIGNvbmZpZ3VyYXRpb25zOiBvbmUNCj4gd2hlcmUgdGhlIGRldmljZSBwcmVz
ZW50cyBpdHNlbGYgYXMgYSBISUQga2V5Ym9hcmQgYW5kIGNhbiBkaXNwbGF5DQo+IHByZWRlZmlu
ZWQgc2V0cyBvZiBrZXlzLCBhbmQgb25lIHdoZXJlIHRoZSBvcGVyYXRpbmcgc3lzdGVtIGhhcyBm
dWxsDQo+IGNvbnRyb2wgb3ZlciB3aGF0IGlzIGRpc3BsYXllZC4NCj4gDQo+IFRoaXMgY29tbWl0
IGFkZHMgc3VwcG9ydCBmb3IgdGhlIGRpc3BsYXkgZnVuY3Rpb25hbGl0eSBvZiB0aGUgc2Vjb25k
DQo+IGNvbmZpZ3VyYXRpb24uIEZ1bmN0aW9uYWxpdHkgZm9yIHRoZSBmaXJzdCBjb25maWd1cmF0
aW9uIGhhcyBiZWVuDQo+IG1lcmdlZCBpbiB0aGUgSElEIHRyZWUuDQo+IA0KPiBOb3RlIHRoYXQg
dGhpcyBkcml2ZXIgaGFzIG9ubHkgYmVlbiB0ZXN0ZWQgb24gVDIgTWFjcywgYW5kIG9ubHkgaW5j
bHVkZXMNCj4gdGhlIFVTQiBkZXZpY2UgSUQgZm9yIHRoZXNlIGRldmljZXMuIFRlc3Rpbmcgb24g
VDEgTWFjcyB3b3VsZCBiZQ0KPiBhcHByZWNpYXRlZC4NCj4gDQo+IENyZWRpdCBnb2VzIHRvIEJl
biAoQmluZ3hpbmcpIFdhbmcgb24gR2l0SHViIGZvciByZXZlcnNlIGVuZ2luZWVyaW5nDQo+IG1v
c3Qgb2YgdGhlIHByb3RvY29sLg0KPiANCj4gQWxzbywgYXMgcmVxdWVzdGVkIGJ5IEFuZHksIEkg
d291bGQgbGlrZSB0byBjbGFyaWZ5IHRoZSB1c2Ugb2YgX19wYWNrZWQNCj4gc3RydWN0cyBpbiB0
aGlzIGRyaXZlcjoNCj4gDQo+IC0gQWxsIHRoZSBwYWNrZWQgc3RydWN0cyBhcmUgYWxpZ25lZCBl
eGNlcHQgZm9yIGFwcGxldGJkcm1fbXNnX2luZm9ybWF0aW9uLg0KPiAtIFdlIGhhdmUgdG8gcGFj
ayBhcHBsZXRiZHJtX21zZ19pbmZvcm1hdGlvbiBzaW5jZSBpdCBpcyByZXF1aXJlbWVudCBvZg0K
PiAgdGhlIHByb3RvY29sLg0KPiAtIFdlIGNvbXBhcmVkIGJpbmFyaWVzIGNvbXBpbGVkIGJ5IGtl
ZXBpbmcgdGhlIHJlc3Qgc3RydWN0cyBfX3BhY2tlZCBhbmQNCj4gIG5vdCBfX3BhY2tlZCB1c2lu
ZyBibG9hdC1vLW1ldGVyLCBhbmQgX19wYWNrZWQgd2FzIG5vdCBhZmZlY3RpbmcgY29kZQ0KPiAg
Z2VuZXJhdGlvbi4NCj4gLSBUbyBtYWludGFpbiBjb25zaXN0ZW5jeSwgcmVzdCBzdHJ1Y3RzIGhh
dmUgYmVlbiBrZXB0IF9fcGFja2VkLg0KPiANCj4gTGluazogaHR0cHM6Ly9naXRodWIuY29tL2lt
YnVzaHVvL0RGUkRpc3BsYXlLbQ0KPiBTaWduZWQtb2ZmLWJ5OiBLZXJlbSBLYXJhYmF5IDxrZWty
YnlAZ21haWwuY29tPg0KPiBDby1kZXZlbG9wZWQtYnk6IEF0aGFydmEgVGl3YXJpIDxldmVwb2xv
bml1bUBnbWFpbC5jb20+DQo+IFNpZ25lZC1vZmYtYnk6IEF0aGFydmEgVGl3YXJpIDxldmVwb2xv
bml1bUBnbWFpbC5jb20+DQo+IENvLWRldmVsb3BlZC1ieTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEw
OEBsaXZlLmNvbT4NCj4gU2lnbmVkLW9mZi1ieTogQXVuLUFsaSBaYWlkaSA8YWRtaW5Aa29kZWl0
Lm5ldD4NCj4gLS0tDQo+IHYyIC0+DQo+IC0gQWRkIHRoZSBkcml2ZXIgdG8gTUFJTlRBSU5FUlMu
DQo+IC0gQWxsb2NhdGUgbWVtb3J5IGZvciByZXF1ZXN0IGFuZCByZXNwb25zZSBpbiBwbGFuZSdz
IGF0b21pYy1jaGVjayBoZWxwZXINCj4gLSBWb2lkIHRoZSB1c2Ugb2YgZHJtX2ZiX2JsaXQoKQ0K
PiAtIEltcGxlbWVudCBhdG9taWNfZGlzYWJsZQ0KPiAtIE1ha2UgUFJJTUUgd29yaw0KPiAtIFJl
bW92ZSB0aGUgZGF0ZSBmaWVsZCBmcm9tIHN0cnVjdCBkcm1fZHJpdmVyDQo+IC0gaW50ZXJzZWN0
IGRhbWFnZSB3aXRoIGRzdF9jbGlwDQo+IC0gUmVnaXN0ZXIgRFJNIGRldmljZSBpbiBhcHBsZXRi
ZHJtX3Byb2JlDQo+IC0gQ2xlYXIgdGhlIGRpc3BsYXkgYXMgdGhlIGZpbmFsIGNhbGwgaW4gcHJv
YmUNCj4gLSBTZWxlY3QgaGlkX211bHRpdG91Y2ggYXMgd2VsbCBpbiBrY29uZmlnDQo+IA0KPiB2
MyAtPg0KPiAtIENoYW5nZSBjb21taXQgbWVzc2FnZSB0byBjcmVkaXQgQmVuIChCaW5neGluZykg
V2FuZw0KPiANCj4gdjQgLT4NCj4gLSBVc2UgIkxpbms6IiBpbiBjb21taXQgbWVzc2FnZQ0KPiAt
IFNwZWNpZnkgd2h5IF9fcGFja2VkIGhhcyBiZWVuIHVzZWQgaW4gY29tbWl0IG1lc3NhZ2UNCj4g
LSBVc2UgJXA0Y2MgaW5zdGVhZCBvZiAlcDRjaCBmb3IgZXJyb3JzDQo+IC0gQWRkIG15c2VsZiB0
byBNYWludGFpbmVycw0KPiAtIFJlbW92ZSAjZGVmaW5lIHByX2ZtdChmbXQpIEtCVUlMRF9NT0RO
QU1FICI6ICIgZm10DQo+IC0gQWRkIG1pc3NpbmcgaGVhZGVyIGZpbGVzDQo+IC0gVXNlIHJldHVy
biAwOyBpbnN0ZWFkIG9mIHJldHVybiByZXQ7IGluIHN0YXRpYyBpbnQgYXBwbGV0YmRybV9zZW5k
X3JlcXVlc3QNCj4gLSBCZXR0ZXIgZXJybm8gdHlwZXMgdXNlZCBpbiBhcHBsZXRiZHJtX3JlYWRf
cmVzcG9uc2UNCj4gLSBVc2UgQklUU19UT19CWVRFUygpIHRvIGNvbnZlcnQgQVBQTEVUQkRSTV9C
SVRTX1BFUl9QSVhFTCB0byBieXRlcw0KPiAtIFJlbW92ZSByZWR1bmRhbnQgZWxzZSBpbiBwbGFu
ZV9oZWxwZXJfYXRvbWljX2NoZWNrDQo+IC0gUmVtb3ZlIHVubmVjZXNzYXJ5IHVzZSBvZiAweGZm
IGluIHJlcXVlc3QtPm1zZ19pZCA9IHRpbWVzdGFtcCAmIDB4ZmY7DQo+IC0gUmVtb3ZlIGR1cGxp
Y2F0ZWQgc3RydWN0IGRldmljZSBpbiBzdHJ1Y3QgYXBwbGV0YmRybV9kZXZpY2UNCj4gLSBjbGVh
ciBmcmFtZXNfc2l6ZSBhbmQgcmVxdWVzdF9zaXplIGFzIHdlbGwgaW4gcHJpbWFyeV9wbGFuZV9o
ZWxwZXJfYXRvbWljX3VwZGF0ZQ0KPiAtIEFsbG9jYXRlIHVzaW5nIGt6YWxsb2MgaW5zdGVhZCBv
ZiBrbWVtZHVwDQo+IC0gVXNlIGRybV9lcnIoKSBpbnN0ZWFkIG9mIGRldl9lcnJfcHJvYmUoKQ0K
PiAtIEF2b2lkIGNsZWFyaW5nIGRybS0+bW9kZV9jb25maWcubWluX3dpZHRoIGFuZCBoZWlnaHQg
dG8gMA0KPiAtIFVzZSBwdXRfZGV2aWNlKCkgdG8gcmVsZWFzZSB0aGUgRE1BIGRldmljZSBpbiBh
cHBsZXRiZHJtX2Rpc2Nvbm5lY3QNCj4gDQo+IE1BSU5UQUlORVJTICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgOCArDQo+IGRyaXZlcnMvZ3B1L2RybS90aW55L0tjb25maWcgICAgICB8ICAxNCAr
DQo+IGRyaXZlcnMvZ3B1L2RybS90aW55L01ha2VmaWxlICAgICB8ICAgMSArDQo+IGRyaXZlcnMv
Z3B1L2RybS90aW55L2FwcGxldGJkcm0uYyB8IDgzNSArKysrKysrKysrKysrKysrKysrKysrKysr
KysrKysNCj4gNCBmaWxlcyBjaGFuZ2VkLCA4NTggaW5zZXJ0aW9ucygrKQ0KPiBjcmVhdGUgbW9k
ZSAxMDA2NDQgZHJpdmVycy9ncHUvZHJtL3RpbnkvYXBwbGV0YmRybS5jDQo+IA0KPiBkaWZmIC0t
Z2l0IGEvTUFJTlRBSU5FUlMgYi9NQUlOVEFJTkVSUw0KPiBpbmRleCBlZmVlNDBlYTUuLmY3Yzk3
ZWIyNCAxMDA2NDQNCj4gLS0tIGEvTUFJTlRBSU5FUlMNCj4gKysrIGIvTUFJTlRBSU5FUlMNCj4g
QEAgLTcxNDgsNiArNzE0OCwxNCBAQCBTOiAgICBTdXBwb3J0ZWQNCj4gVDogICAgZ2l0IGh0dHBz
Oi8vZ2l0bGFiLmZyZWVkZXNrdG9wLm9yZy9kcm0vbWlzYy9rZXJuZWwuZ2l0DQo+IEY6ICAgIGRy
aXZlcnMvZ3B1L2RybS9zdW40aS9zdW44aSoNCj4gDQo+ICtEUk0gRFJJVkVSIEZPUiBBUFBMRSBU
T1VDSCBCQVJTDQo+ICtNOiAgICBBdW4tQWxpIFphaWRpIDxhZG1pbkBrb2RlaXQubmV0Pg0KPiAr
TTogICAgQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4gK0w6ICAgIGRyaS1k
ZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gK1M6ICAgIE1haW50YWluZWQNCj4gK1Q6ICAg
IGdpdCBodHRwczovL2dpdGxhYi5mcmVlZGVza3RvcC5vcmcvZHJtL21pc2Mva2VybmVsLmdpdA0K
PiArRjogICAgZHJpdmVycy9ncHUvZHJtL3RpbnkvYXBwbGV0YmRybS5jDQo+ICsNCj4gRFJNIERS
SVZFUiBGT1IgQVJNIFBMMTExIENMQ0QNCj4gTTogICAgTGludXMgV2FsbGVpaiA8bGludXMud2Fs
bGVpakBsaW5hcm8ub3JnPg0KPiBTOiAgICBNYWludGFpbmVkDQo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vdGlueS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL3RpbnkvS2NvbmZpZw0K
PiBpbmRleCA5NGNiZGIxMzMuLjI1NDcxNzkxYyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3RpbnkvS2NvbmZpZw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vdGlueS9LY29uZmlnDQo+
IEBAIC0xLDUgKzEsMTkgQEANCj4gIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1v
bmx5DQo+IA0KPiArY29uZmlnIERSTV9BUFBMRVRCRFJNDQo+ICsgICAgdHJpc3RhdGUgIkRSTSBz
dXBwb3J0IGZvciBBcHBsZSBUb3VjaCBCYXJzIg0KPiArICAgIGRlcGVuZHMgb24gRFJNICYmIFVT
QiAmJiBNTVUNCj4gKyAgICBzZWxlY3QgRFJNX0dFTV9TSE1FTV9IRUxQRVINCj4gKyAgICBzZWxl
Y3QgRFJNX0tNU19IRUxQRVINCj4gKyAgICBzZWxlY3QgSElEX0FQUExFVEJfQkwNCg0KQnR3IEkg
aGF2ZSBhIGRvdWJ0IHJlZ2FyZGluZyB0aGlzIGRlcGVuZGVuY3kuIFdoaWxlIGhpZC1hcHBsZXRi
LWJsIGhhcyBtYWRlIGludG8gdGhlIGxpbnV4LW5leHQgdHJlZSwgaXQgaGFzIHN0aWxsIG5vdCBi
ZWVuIG1lcmdlZCBpbnRvIExpbnVzJyB0cmVlLCBhbmQgbmVpdGhlciB0aGUgZHJtIHRyZWUgSSBh
c3N1bWUuIEl0IHBvdGVudGlhbGx5IGNvdWxkIGNhdXNlIGlzc3Vlcz8NCg0KPiArICAgIHNlbGVj
dCBISURfTVVMVElUT1VDSA0KPiArICAgIGhlbHANCj4gKyAgICAgIFNheSBZIGhlcmUgaWYgeW91
IHdhbnQgc3VwcG9ydCBmb3IgdGhlIGRpc3BsYXkgb2YgVG91Y2ggQmFycyBvbiB4ODYNCj4gKyAg
ICAgIE1hY0Jvb2sgUHJvcy4NCj4gKw0KPiArICAgICAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBh
cyBhIG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhlDQo+ICsgICAgICBtb2R1bGUgd2lsbCBiZSBj
YWxsZWQgYXBwbGV0YmRybS4NCj4gKw0K
