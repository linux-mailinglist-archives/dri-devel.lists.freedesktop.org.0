Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A37CA43A81
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:01:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F0A10E5E2;
	Tue, 25 Feb 2025 10:01:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="o3HEFj6v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011025.outbound.protection.outlook.com
 [52.103.67.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA45C10E5E2
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:01:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NVe+0zr4+Hh4xsqPqR6M0m5P3kFYzAa+WmK0utUbZ3ivd5PYfdo0prVnVL2yYQUT4XtGp2vfNwNJc75mzCkES+hNszEeWFBvAlyqAoanLjinQV5bmFQP1NV3oC2j6TkDSLWHICe4PjNW1eZhmLH1vNVZofkGlTvWxeVjNHUTqKxvtOaacGv2oOMKF4hhHpUAd5EcyPqG1evrP/FYPfU0+8vWj1gh4nAZG4k4EZW31T+YCBkg/XYS1KqBFUy7LCpEEZ6rNh3iNSM22XCWZ2f20ku3bDMnBRiQChoTqgqmc1fjYuU8YAxfzvhfCYTGU121jbZ7UcrnQls39t3reH3ipg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9N8SaXmDfgTcRRs9dx5lSqCy5G+xh5+h9z8R7N5uA/s=;
 b=KNNlRjnNj1TlT9xw0fkU5gsd+0YsRaaS/+616nOjLT52XdE+JyN0EHABw4PKIPgRZYRmeRPEGCVdIPM/+07dL9GnSc/27H7sOqkiDWM9g6ZVfxqFf8bEf4+WKYxhGi7TNA8LnACiiwf08BJu07UzuB8HkND37hREIuDH6UTXSMoezmOD0aXNdFCyLFubSNWRQ52bH+IMN+WH00fZoOyll54ryZ6HNfIaXoUl0L2YUcXWlZpdhaH3YNC4Ueg43FoQmNr4pPUqCsq5ppoP1uNRCfT/oSvFvvKORiQUHCwAa7udtfD6no2FCIMYaLv/AQfuuBAjYaBzHpPBwoKyGFwxeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9N8SaXmDfgTcRRs9dx5lSqCy5G+xh5+h9z8R7N5uA/s=;
 b=o3HEFj6viPX4udI4QO1wcwfw1/rNO0o79O2E9V5bXrDwj4AKDIQxYKw7/KTboSxUAs/89+LXrY31Loys0gDRGAYQmj+IaDsfhNW+oA1saXX1CBZ4ZXyiQ/chPpqPCMuudnn3SlRLzcjRtblY1yerBlvRcjXS3BJl+/2vNFo3rCD4DXEuQf6zTNm7X7r2hi7gK+wOPcjj5I4zXxNL7xaWWebLaW6+FC8R6oMA9GS9i3juYwEB9GoSpcmWYWp+aKQHHIFGYKGSBSKDU/Lvk0oqNTMBRqo47hnH8jO8qtAAalHFQpjWLVW1XGzHPS7/qOdNfBn8ZoA2G9czPGtr2R9GXw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8869.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:d5::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.22; Tue, 25 Feb
 2025 10:01:16 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:01:16 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>,
 "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 Kerem Karabay <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 Aun-Ali Zaidi <admin@kodeit.net>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWrTuIgAD67QCAABL7QIAAANpQgAAHqwCAAAB7rIAABsNR
Date: Tue, 25 Feb 2025 10:01:16 +0000
Message-ID: <PN3PR01MB9597026ED0B9D82EC13F4DD7B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <PN3PR01MB95974D5EB5A25386A8BF6FDAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ca34309a-f2b2-4082-92df-86a775952348@suse.de>
 <PN3PR01MB95979D1B21250604F834357FB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959719792308EBB9370993DFB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <a4bc0440-5451-49e7-b7a3-9299c5200a2e@suse.de>
 <PN3PR01MB95976ED2D5FDC48C5F9E6EF7B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
In-Reply-To: <PN3PR01MB95976ED2D5FDC48C5F9E6EF7B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8869:EE_
x-ms-office365-filtering-correlation-id: 64e7d455-bc52-47d0-7a77-08dd55835800
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|19110799003|8060799006|6072599003|7092599003|15080799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?Q0YyT2V0MjVMLzNtRFkySUVBZjZOMTZUOGliT1BZRTk1MGVNTWhRT3lQa3Fv?=
 =?utf-8?B?TzduVjExSjl4MWl4Unp5VmtOT2hDaC9BTnlSeENlbVdPMFRZUjBxNXlGY3Vz?=
 =?utf-8?B?M1NoR2t2QW5SNFU3WDUvVWF1cjI5b2hOdi96SXdwZ0VMWkYzODBCT0hDTkRl?=
 =?utf-8?B?Q3NLU1FjMmlSRFhpNDA1RTlkSzMyaDJ5djBESlQ4dHRPMTJuRU9yRHRjL3BQ?=
 =?utf-8?B?RHlpNm5FSlF3dWlzNmhDSCtmSklEcEJXVllFbzBzMGJKU1d5ZTdhOUV0WXZs?=
 =?utf-8?B?WHU4Sm9TamZVOEtUR3IrZlVFVFFmTFZwaXcxaUZXSUxWa2dmN3RIcFprZ3pE?=
 =?utf-8?B?UUVsemhTbFNHMm1jSkp0TVRtSWRCdzYrVHhaNEdxS3dUdW5UUUUxUUtlNmJu?=
 =?utf-8?B?d1ZNUFFUYTQzMkw4VXptdXp4K1R6RUlzSEtVbnI3TEYzcVBOcDNpTjkwdVQ1?=
 =?utf-8?B?dm9TK1A4WElqTXNJN1Z3MFFDMm9HeUxUM2xSU3JvMWZ0cTJLYzdPUXVJT1NM?=
 =?utf-8?B?Z2g0U3F1d04vQXc0MGVsUjFKOE4zSmt4d01HYVlsL0VucVpJZ3VQMERnQmRx?=
 =?utf-8?B?amtRZHRJZ29OS3NkVnY1ZHhwOUk3b0RVQ2NWTHpqazhoMWJBNjg0aVlKUHFB?=
 =?utf-8?B?UDdORVRSd1NwSFY4dFZxL202TUJ0T0dHS0ZFME9qbG4zUXRic0RrWGUxbGQ2?=
 =?utf-8?B?SE95d0xibVpOb3NqZ2VQSnBTaEdVcmc3cjBUZHZEUW04NzJqL2Myem96Vld4?=
 =?utf-8?B?NC80akRBd0tEaUhYOUV6R0JJdkR3VFBiZVFPb3d5QUZ3OGU3ajFGdUhJcktO?=
 =?utf-8?B?RldtSC9vR0NQdGpwVVloZmg3RHpQQm5yb0VDUmdwcjJ1eUU5a0ZWMHppaCts?=
 =?utf-8?B?aDJCZFBBRWdWemhLMGJ5cHBWQm14Ky9vNzFCMEMxWEtDL3ZhMFM3ai8vOGNK?=
 =?utf-8?B?b0lIMjZ4dyttbVpGOXpaSzJvelVIeFdSalZhbXBKcHdIOXIwYzZCVzVWVWlU?=
 =?utf-8?B?TDF2RnppVUhhRGVhTFd3TDVXSWtyT092bU5XeUFOTWNNT1QrQnhlTDhHdU9V?=
 =?utf-8?B?QXVRaE9naGMzN3RmMWxNcTkrWURPVi9vQnNOaWNwVkhTTXhoZ2h0VEhVREtu?=
 =?utf-8?B?Q2t5UkR3ZUpJRUsyWnUrV01ldGRvRUZNLzBHdUYyK1lPSW04djBvaFA0ZHo5?=
 =?utf-8?B?ZWFtVVJRbTVOc3FObTZEdEEvd0toVFg4M3ZwSDZuZTg4S2VqQU92MS92d3FM?=
 =?utf-8?B?YXBvWkVCLzA3OHRIVGxEVy9RQ1czamNoQUViUWNYbVpYNFAwdytMMnNDK0ZL?=
 =?utf-8?B?S0tUUUF3Nzg5MVAwcUJpV1hQNC95czJHSnpEK0hoUE11MGl4bUlYM3VvRm1i?=
 =?utf-8?B?dXROT3JEYTUzclR0OVpQai9xV1VlOG9VdWluNVVHS0NXS0w4SFllcGU1R0R4?=
 =?utf-8?B?SER0a3JEOE5najQxQlMweHhGMGRmZXBQTUhMckRGVk8vYlFUN1RLOTgydW41?=
 =?utf-8?Q?RXQBVM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?emxZZVdCNFZ1bG5ZK1NIOHFxMk1FcFRrVUhrSEZwSm1JdXVibWw1Uy9DL1o0?=
 =?utf-8?B?c1ZhbmtoZ1lVSmd2UXAvaU5wbW44TmhOY3dualYzVTdJaFo4cjhKaVBUSmxv?=
 =?utf-8?B?QjFITDRNMUNmMEJPa0tsZTZTQ0I0UXlpWC9lZGVZMmYwVzYxeVphTC9UMXo0?=
 =?utf-8?B?Sk9PLy8vZC9DMy9yZ1kwdEt5bExuTy81YmVtMWVKSjE5L3NseUVUMC9XSzZu?=
 =?utf-8?B?aW5kUThUK3llRGk0VGROclBvVmlNOVFQSzFjSFBDeXRKWHQ0WWpUNHZlVDA4?=
 =?utf-8?B?THpHYnpkTFNkaTlIWThDaWVySXhvSXYzdkJQR3RnU3ZDMXA3QkxmUnFwY0k5?=
 =?utf-8?B?cEQ5RXpzMXBMcHd0SUZLZG5ZdnBaT3pTMmUxcjJlQkxXZlBETk90NVpJQzZM?=
 =?utf-8?B?QnZiS1NHWUlIeDU4eC95MU82dDZOSDh2UFZwWWhYNnRaamRSUHRYai9Ecjli?=
 =?utf-8?B?ZGF2RStORmhmOVN1ais1VXJzOXdJWXQyc3NtQWRZSEg0NDA1OHdEMEJzdFRS?=
 =?utf-8?B?Zk1UOTdqRHVZTm5LbHMwaW9EU3pSTUpqK1BpMVBlUHpFRHRKcGhjU2VuNzhz?=
 =?utf-8?B?dTVKVmFGRlM1ZG5uTFU4RFF0L2o0UnJ6SW8zMlJ5U1hITUJrbytXa3lyQWNo?=
 =?utf-8?B?djdOdGZIYVlRMERIeVpNc1Zqa0xOa1NjSUUxYnNjOWxZWUlEOXdIdGNmd2tN?=
 =?utf-8?B?ZmcrbEZHRjI0emt0Qm1sTUxyUXRrWWxvVE43R1lpcnFCc1JoMEIxTjFhcW5Y?=
 =?utf-8?B?SXo1RXZHT2lLOVpSREVsa3RKUzd1TUJCekhqL25HZTNsTFBxb2tmVER0eWwv?=
 =?utf-8?B?dXhBSndObU01cVhJK1YzRTAyUStKKzh6M1VuR2RJOURhNmU4ZURPVUdTeFRr?=
 =?utf-8?B?elBoYmZvRS9rUkMvQkp5TkJ3aVFvS0tnVWtka3BNRlRhS0lMcXhUazVxZ2lQ?=
 =?utf-8?B?OTNMNlVaOC9LMUNzNEd5UlNkL2RSbWFyTHdKV0NVN0psTTRUakg0ZGJvZHhj?=
 =?utf-8?B?KzRGclVSYWtUazVFeFp1OE5JRHk5bDI1MXM2QXNONTVsRXB5NFM2UkRWS200?=
 =?utf-8?B?enFHWVYycnM3Zm5HcUNGOHJFZ2FWbEp1RTFiTnBNMlpyNHVSc25MVVd5RVI3?=
 =?utf-8?B?VDBxclFNRTh2T1R6Tkhoc2ptdm9RTUhRdy9tWVZOaUl2TXpVZ0hqMDRDZ1p2?=
 =?utf-8?B?VS9KS1JxNFdkRzBDTDJCN2JWWGFteXhybG00N3ZrdDczT1hJY2NYejZ4ZUNT?=
 =?utf-8?B?ZGdkRnhDa1F6L3AvYmtxaVBKbTdOZDcvN0VhVXVGU3JsMmIxenJ6ZU1lNUxp?=
 =?utf-8?B?enlzTFJZa09talZxYjdCSDBZanUvbkFXYjgzWXo4dUNvQ1MxSk5KeVUrTVNm?=
 =?utf-8?B?WU9ES2N4TlJNSEIxNml4andoY1U2Q3JCSUZTVkRpR0NMOTU2eHdoMDFOQkVo?=
 =?utf-8?B?ZFh6WVd4QkMzRWpZQUdwckpMMno1T1lTNFM3elNCRFp5RG5VSUh4ZHhCU29w?=
 =?utf-8?B?aitsU2N4Y1h0alNFTU9tK1lzOXlLcHY2NkJLOGh4NU9wU3BGOHVpOGxHNk5Y?=
 =?utf-8?B?MXkzVWtsRFVrcG5TV1FlaGxTZXgwaElKVHJtc0NuTEZtK3ZrVTlCV0VxM0dv?=
 =?utf-8?B?TGdINDJLdnFpUHdZZFlqSkx2d3NpQm5zYzl3TC9zRFJ3NFNrMmUzKzROTS96?=
 =?utf-8?B?NEp1Z2luYWFxeVl4L2c5K3RYMmNqaHJUUHBhYW4yWmJhb2ZMSTYvZHVPazVZ?=
 =?utf-8?Q?vrsYx1AsHTPsuKdkWo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e7d455-bc52-47d0-7a77-08dd55835800
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 10:01:16.1899 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8869
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDM6MDfigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu78NCj4gDQo+PiBPbiAyNSBGZWIgMjAyNSwg
YXQgMzowNeKAr1BNLCBUaG9tYXMgWmltbWVybWFubiA8dHppbW1lcm1hbm5Ac3VzZS5kZT4gd3Jv
dGU6DQo+PiANCj4+IO+7v0hpDQo+PiANCj4+Pj4gQW0gMjUuMDIuMjUgdW0gMTA6MDcgc2Nocmll
YiBBZGl0eWEgR2FyZzoNCj4+PiANCj4+Pj4+IE9uIDI1IEZlYiAyMDI1LCBhdCAyOjM04oCvUE0s
IEFkaXR5YSBHYXJnIDxnYXJnYWRpdHlhMDhAbGl2ZS5jb20+IHdyb3RlOg0KPj4+PiANCj4+Pj4g
77u/DQo+Pj4+IA0KPj4+Pj4gT24gMjUgRmViIDIwMjUsIGF0IDE6MjfigK9QTSwgVGhvbWFzIFpp
bW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPj4+Pj4gDQo+Pj4+PiDvu79I
aQ0KPj4+Pj4gDQo+Pj4+PiBBbSAyNC4wMi4yNSB1bSAxNzo1OCBzY2hyaWViIEFkaXR5YSBHYXJn
Og0KPj4+Pj4gWy4uLl0NCj4+Pj4+Pj4gK2NvbmZpZyBEUk1fQVBQTEVUQkRSTQ0KPj4+Pj4+PiAr
ICAgIHRyaXN0YXRlICJEUk0gc3VwcG9ydCBmb3IgQXBwbGUgVG91Y2ggQmFycyINCj4+Pj4+Pj4g
KyAgICBkZXBlbmRzIG9uIERSTSAmJiBVU0IgJiYgTU1VDQo+Pj4+Pj4+ICsgICAgc2VsZWN0IERS
TV9HRU1fU0hNRU1fSEVMUEVSDQo+Pj4+Pj4+ICsgICAgc2VsZWN0IERSTV9LTVNfSEVMUEVSDQo+
Pj4+Pj4+ICsgICAgc2VsZWN0IEhJRF9BUFBMRVRCX0JMDQo+Pj4+Pj4gQnR3IEkgaGF2ZSBhIGRv
dWJ0IHJlZ2FyZGluZyB0aGlzIGRlcGVuZGVuY3kuIFdoaWxlIGhpZC1hcHBsZXRiLWJsIGhhcyBt
YWRlIGludG8gdGhlIGxpbnV4LW5leHQgdHJlZSwgaXQgaGFzIHN0aWxsIG5vdCBiZWVuIG1lcmdl
ZCBpbnRvIExpbnVzJyB0cmVlLCBhbmQgbmVpdGhlciB0aGUgZHJtIHRyZWUgSSBhc3N1bWUuIEl0
IHBvdGVudGlhbGx5IGNvdWxkIGNhdXNlIGlzc3Vlcz8NCj4+Pj4+IFllcy4gV2UgY2Fubm90IG1l
cmdlIHRoaXMgZHJpdmVyIHVudGlsIHdlIGhhdmUgdGhpcyBzeW1ib2wgaW4gb3VyIHRyZWUuIEJ1
dCB0aGF0IHdpbGwgaGFwcGVuIHNvb25lciBvciBsYXRlci4NCj4+Pj4+IA0KPj4+Pj4gTW9yZSBw
cm9ibGVtYXRpYyBpcyB0aGF0IHlvdXIgZHJpdmVyIHNlbGVjdHMgSElEX0FQUExFVEJfQkwuIEZy
b20gd2hhdCBJJ3ZlIHNlZW4sIHRoaXMgc3ltYm9sIGlzIHVzZXIgY29uZmlndXJhYmxlLCBzbyB0
aGUgZHJpdmVyIHNob3VsZG4ndCBzZWxlY3QgaXQuIFlvdSBuZWVkIHRvIHVzZSAnZGVwZW5kcyBv
bicgaW5zdGVhZCBvZiAnc2VsZWN0JyBoZXJlLg0KPj4+PiBMb29raW5nIGF0IHRoaXMgYWdhaW4s
IG1heWJlIGl0IHNob3VsZCBiZSBzZWxlY3RlZC4gSWYgeW91IHNlZSB0aGUga2VybmVsIGNvbmZp
ZyBvZiBUSU5ZRFJNX0hYODM1N0QsIHdoaWNoIGlzIGFsc28gaW4gZHJtL3RpbnksIGl0IGlzIHNl
bGVjdGluZyBCQUNLTElHSFRfQ0xBU1NfREVWSUNFLg0KPj4gDQo+PiBUaGlzIGRyaXZlciBkb2Vz
IGl0IHdyb25nLg0KPj4gDQo+Pj4gVG8gbWFrZSB0aGluZ3MgbW9yZSBjbGVhciwNCj4+PiANCj4+
PiAxLiBoaWQtYXBwbGV0Yi1ibCBpcyBmb3IgdGhlIGJhY2tsaWdodCBvZiB0aGUgdG91Y2hiYXIu
IFRoZSBEUk0gY29kZSByZW1haW5zIHNlcGFyYXRlLg0KPj4+IDIuIGhpZC1tdWx0aXRvdWNoIGlz
IHRvIG1ha2UgdGhlIHRvdWNoYmFyIGEgdG91Y2ggc2NyZWVuLiBZb3UgY2FuIHN0aWxsIHVzZSB0
aGUgZHJpdmVyIHdpdGhvdXQgdGhlIHRvdWNoIGZ1bmN0aW9uYWxpdHkuDQo+PiANCj4+IElmIHlv
dXIgZHJpdmVyIGRvZXMgbm90IHJlcXVpcmUgdGhpcywgaXQgc2hvdWxkbid0IHNlbGVjdCBvciBk
ZXBlbmQgb24gaXQuDQo+IA0KPiBDb3VsZCB5b3UgZXhwbGFpbiBtZSBpbiB3aGF0IHNpdHVhdGlv
bnMgd291bGQgc2VsZWN0IGJlIHVzZWQ/DQoNCkhtbSwgSSBnb3Qgc29tZSBkb2NzIGFib3V0IHRo
aXMsIHRob3VnaCBub3QgdmVyeSBjbGVhciwgYnV0IGdvb2QgZW5vdWdoIHRvIG1ha2UgbWUgZGVj
aWRlIHRvIG5vdCBpbmNsdWRlIHRoZXNlIHR3byBpbiB0aGUga2NvbmZpZy4NCg0KVGhpcyBhbHNv
IG1lYW5zIHRoYXQgdGhlIGRyaXZlciBjYW4gbm93IGJlIG1lcmdlZCB3aXRob3V0IHB1bGxpbmcg
bGludXgtbmV4dCBpbiBEUk0u
