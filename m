Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08502A42442
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 15:54:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0D3110E14A;
	Mon, 24 Feb 2025 14:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="Be3c6CuT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011035.outbound.protection.outlook.com
 [52.103.68.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C821D10E08D
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 14:54:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kuPmvyMJnUN1dGlAYc4CfcZAOOo6dW1QV9MABQ7pyGqGH4ziEQSBloSeArPuqgIhqxSRoCEyJlGSFbyO2GyyttQarYAH5UVyEuP8wUX6YnHFhnFPyR9pNQ6K712cF6kLn/vH1Ze1UsaSq6sa6tcoiK/HOgfY8l6NTe1wntMzO6OEiIKTYFM/CztmtEZ79myAHY4TGlZqNPC65jKp2P+keAkn2pydGXABGdp4WFs62h2aVpmHiyDlbLkIBj1nlL/BRMElp3lVlombWepZ1GFQWDwlJCHgdPK3Pss36b/nw/sFw6mDcaOZVa4qx0AbRX2Ugi1tmAL9apKIKdh8Qq0Oaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ysaBNER52LpFoLN5VE3zsGDd+AIol/dgAb+AJg30pDQ=;
 b=Uh7L3GQUvAjSXaLUmrrRO+YYGZxcH/exOlRIV5aZD5Qvi6x776KC+uYNbo+N1M7iS9s+9uyynnEgrdMLAsUiE2ZRRqmcyiYeGbdbIzYx8D3M/tYpela27tcbgF+bn5ewo+JIYFlHqoM8SAYu/eHCE4QV5LQ63PvQ6Ii6wKpbsCGAA1V2f1wVKkcdAlsbvr2IPPhjdMSA+5Tz5Rgi3DWhoMLMPFDosrNAoMvFnp1UverFEbQux0VilTOlDy97XmrPfYtogwvLJ40RIlVtxmZFaNn8GnDx3V6C0NVwc5boyr88BYuOWygsban6AI5B332bMFhYr4H0/XLJKIZy7YoJ0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ysaBNER52LpFoLN5VE3zsGDd+AIol/dgAb+AJg30pDQ=;
 b=Be3c6CuTO3f5cZi27cbPcBqrp5iur5Pm/z51FkLSBqbu+iLtSrHMmceorGhQHzyRp3xdtZ4Do+Gbxt83H2zNmJwoDgd30X5vhZq/Xm7MkZvxhUaqEPEwL0hfsEid4Cnz7NhPdSxBH8ILtt5WK2xxt+wFbUjZxyMaaI5Pxnz48ie+nQM4CmqQljQNwTN0wZnPK3mCxo1Qvvknl6KNE8hsa5aaiX0J4POy3NzJTZdURcliwEgmihGDr5Ia7KBhdUukKO5/WtfUWItZTrxJH+g31r9opyaszSQhILP8tr66Es5NUKCosiGLtbMQHqerYD64B9/IZbAip4SjdCXMopyWvA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN1PPF082D135E6.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::406)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 14:54:09 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 14:54:09 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 1/2] drm/format-helper: Add conversion from XRGB8888 to
 BGR888
Thread-Topic: [PATCH v4 1/2] drm/format-helper: Add conversion from XRGB8888
 to BGR888
Thread-Index: AQHbhsFl29NGb4UbJkm7lCmt/AKS7bNWg2SAgAAG9AA=
Date: Mon, 24 Feb 2025 14:54:07 +0000
Message-ID: <7D98DED5-5B18-4AAE-A347-C880232530B7@live.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <03FA573F-6D01-40E8-A666-CEA17A917036@live.com>
 <Z7yCLxBN4Cl4btQm@smile.fi.intel.com>
In-Reply-To: <Z7yCLxBN4Cl4btQm@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN1PPF082D135E6:EE_
x-ms-office365-filtering-correlation-id: 4055a9a4-c5c0-4dbf-22aa-08dd54e31726
x-microsoft-antispam: BCL:0;
 ARA:14566002|15080799006|461199028|7092599003|8060799006|8062599003|19110799003|102099032|1602099012|3412199025|4302099013|10035399004|440099028;
x-microsoft-antispam-message-info: =?utf-8?B?U1dQZ2RTcEhHcUF2RHFsN29VVXh5WlRSd0JPU0RqT3F1OFRXZFdJa1BFb1ZD?=
 =?utf-8?B?aXdZTUJnNXR5T2ZyVFpiZ0pnKzFyTCsxdnVkWUp4YXhSbFozRHhXNXM4VkZE?=
 =?utf-8?B?Mkd0c0RmNlJnRy9vVE5JanlhbG5zWHFFRDNSaEJxb2RjZlFxeXhvWERrdWYr?=
 =?utf-8?B?MWgydVNKdTRCOUZpM2hjVmc2TWpyUjdVNHVZaTlJcWdZWVU2d3ROWnhBOU5X?=
 =?utf-8?B?UnFUY29tUWRjc1lVeU5SQ1duRFBoNG1Jc1NPVnVDQks2c2xhSFNqVGxQK1ov?=
 =?utf-8?B?ajEzRjlGYStBa202MXRVL1J6WDdPQ3dVRUgrZnFYRzlKR3I3ajlUaURpNk1h?=
 =?utf-8?B?bTFwTm9JeFZBNFNlekZBSE43NXlwdjk3L2RKMXQ3V0Q5ZnFPRDErVmlEa2Na?=
 =?utf-8?B?dnRvdnZ2T0hQcFVCSDYrMXhybVFWRjdTRjlDWGt3bGFER05ZVllFTlpiUFJZ?=
 =?utf-8?B?cmcrYVBvSTRQRVNWcDg5RWQzSjVaYXp3MGdrV292eTVJYU1FZmV6NU1qRWhv?=
 =?utf-8?B?TmdSK2xER21SU2R4KzdVWER0Y1JqVnBmYjVTekthOUhkQ040b21OQmI2MUZo?=
 =?utf-8?B?WndUdTBGV01qTDRkZlJWWDhrZld2djFNaGZlWFVaSTlCY0dDRHlZTmN1TjJT?=
 =?utf-8?B?elovNmlTVWFQWWF1dmxTeVRyRzB3Y2dnT1FXaTNHaE9iOEJLR09kcGt1alBo?=
 =?utf-8?B?YVNGQlVnVWJaeHh5T0NQTTU4S3I2ZjQ3TG1yZmVmOEpqTmhNTkhLKzh1SjlJ?=
 =?utf-8?B?UjcrczI0S2NlMWtYaG5RbG9JSWx5S01QYlhnMjhWdkdMUnNvc2JwWFNSWWpC?=
 =?utf-8?B?b2ZDdnBlbzhHVU9hM2V4WHNMNWVEUk9VOE5md0NoUUp0cnJwT2xpV0lNSUhy?=
 =?utf-8?B?QlQ4MmZTUmJSSEFMa2NkRzU2ak84UVJJcjdFZjhLZW41VnBvR05POHFmd0J5?=
 =?utf-8?B?aGZ3VDlFT1M4S2RUTWNVdkJHMXFHQlFuSWMyNnJveGZ0TUVmMnhCUDFOUjJH?=
 =?utf-8?B?dkdwM1d3RWovWlE2bHJWYXRabDhWREx0R040TVQ4MXU2SU9yUEdDaHFIc2g3?=
 =?utf-8?B?bmdmSEF3NFYwM09uNEd4UDdoUHErbXVQOU5HOFZWdC9kUnhXa1lxdUhkZHV5?=
 =?utf-8?B?WGJ1M3ZhSmF1MHRYTFMxb2xiRCtCeFRLQTE3eTVHZWdkWDcydjhGVWIrd2Ri?=
 =?utf-8?B?V0NHYXArMmgwV3FNRDdvQXVMcFlMU0dUTko1enBvVEx6b1YzTk9lZEIrMCtP?=
 =?utf-8?B?R0dXaC9WMm05UDR0MjdBaWRMNkRHdmZhMksxYTBCTFI3Tk1oQWJBakp4azU4?=
 =?utf-8?B?NnNMd05PZzJhOHlIQXk0QVo4UDZPaUg1NlJtQmZOMENPWXE4bWxieFFMNUtY?=
 =?utf-8?B?ano5aGVwMDFaQU9OSGJ0U21uV0hYblk4U2psTFpCRGNPNlhzRFVIMGZ6VDZD?=
 =?utf-8?B?K3FQMWlqM1ZOVnJmZGJLbWVNeThnK2hscmc1VEpha0EyWmpaNDdlRXRrNW9O?=
 =?utf-8?B?OE9nQkxKUVNjV00rV2pocThNVVpxMlMxcmpBa2Y1Q21iUkRPVXBXVzd6UFlt?=
 =?utf-8?B?QnBUakV0a2xRVUNrdmFRZHVDUGhBWWhTN2EvSVZxa3hhb2t6NlE1K3RBT2FZ?=
 =?utf-8?Q?yPLbC6eWO0NdhCUMzAOleK1X27t7gEKEkDkhc4smYB0s=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?bGpKMHFtZXEzck5NZ01mM0dpb24xUENQOXRxNUFIVmlXZVduUVFzcG5sZTZq?=
 =?utf-8?B?WEpOS1hPOTRuOTM0dlBTZ0UvQjVGaXFLbFJsaDBMVG9lUW5KbnNhQVlyVEIr?=
 =?utf-8?B?V0NFbVRQR1lqbGNFbldOaTk3RTl5T3czWk9NTjZWNnZkOEFlSjNXajVmemNu?=
 =?utf-8?B?MTUzbUpId2Z3N3dlc1hIdDdBaXFnYTdKVXYwTWRlV2RMTnRCd1ZtVzJiL2lH?=
 =?utf-8?B?ZEtUZ2ZSTldXMEc0cjRsTkhqQXhYRzJuZVpTbWdrVG5icEZwbGpDRlE4RVdG?=
 =?utf-8?B?UWM5WmpkUDBvRFJ5dnFlcFhKRTNvSU9kWUpNYmpTODdvS3ZYZjNqbHA5b1dK?=
 =?utf-8?B?SnYzS0JtN0dqNWlhYzNML3ZKcVFKRTlKeG9YVkQ3bHhtamcxTzE2M2ZXbUsw?=
 =?utf-8?B?NjROQjhpc0FDVW9Qa01YNS90WHpWSElTMmpGT0ExaGh5ZlFOdXJGRHFLRmZ3?=
 =?utf-8?B?endiVDYxTlBpMVFJY00wQTM2UUgyWHgvL1NHTEd3L1VtZU1lR2Nma2xXOW1X?=
 =?utf-8?B?N1N5TEZ0dGZGaFQ4eUMwZkdyRldPRjNyTCthU0hma1BNclJtVWZUdmJIZkVu?=
 =?utf-8?B?STJ2dVZIRXlkKzBPZGZJdElsNlBvWUg3VnlTTGh5MmV4NEg5OG1WenNVMFBW?=
 =?utf-8?B?M2hjZE40QjU0SEFaUTVMelhkV2VYUkx5dGdQOUVBbTkxL003bXdsdG1wR3Z1?=
 =?utf-8?B?T0VGMjdqSDlUWHBraGM4cmRVQVh3RlRaams5TnR1c2FxVU1NODVhQ2FRUi9I?=
 =?utf-8?B?N0M1QnF4V2VQZnMzWVlucFF3SzdhY2Rvdm5Xbk1ydjVRRFIwTzBTTTFnbUxs?=
 =?utf-8?B?eWY1R0tLMnUvUzlJbEpuUHRYS3dKR0VwSXZCV2tmcllCY1BRajlIYkE1UnMx?=
 =?utf-8?B?cGxZd0VXRlhTMWhOQm5zZC9xNW5rdXFCTEQ2VjFkSFNyOFdPRmRPMm5hMVZD?=
 =?utf-8?B?WDB1ZmxYTXZPWk1pZkpybFNGZEZ5RjI1aGN1TmVZOVBOdXhkTWVGWFZtWWpL?=
 =?utf-8?B?dk1DYUcyS2NqWHFxWGhjQzE5K2d5cVVWQ2x6QVVQTXkwVnhqWGFrREFBNVNF?=
 =?utf-8?B?VEMvNlQrOUx0bUhQREpSSEZiR1F4VVBYdHFsWUtlTHg4V3dTeGVycEZrZGpw?=
 =?utf-8?B?c2Q3NWJGeENFRnk0NU5UWmNSR2FXWGR4dlBzNjZqUkttWUE4Rm5ab0U2Y3Y4?=
 =?utf-8?B?OEtMU2N3dG9KQlU0a3RjV0ZDTEtqMERyeVMxV3ppaEx6OEY5TTNjVmRYYWNw?=
 =?utf-8?B?Qi9FVWxBbENnMDVzNTdYV3pTZkVuS042R1VyNURSUDZ5UVcxS0crQWdGNFhO?=
 =?utf-8?B?SGUvVEo3azY2Zkl2S3ozcVZ1OHV3Q1ZsU3hmUDZ2NHU5QXpZaGVXTG55UVdt?=
 =?utf-8?B?eUNEQURuSXVRQlMvNmJsQmhob1JqSUw3NUZ0ejFlKzBEaGNsaEhrOXpkTXdP?=
 =?utf-8?B?eEJDbnZKVXo4ZCthMjV6a3IzcWVBVy9sY1NuSXc3LzlTN1pkSlR5OTlPbkFi?=
 =?utf-8?B?SkFKYUpUTjZTWExlbSt2U0U3U3QzVVNrSG1tV01iVi9DOG5oUWJYZWwxRnNl?=
 =?utf-8?B?YmFqS0dkYll5UFJWR0gzempMTlM2RlEvRlJrTW83aFJRcUZpcXl2R1lwdmFo?=
 =?utf-8?B?a1h0b2NyWldhOFhFbWVPS3Jqa3k5SkFZdmMreHZRZGpVNUxNUUhIbUdvQ1VN?=
 =?utf-8?B?TTJ4Mmg1NERjSUdkN09mOWlpTWRZMWlRMHpSQkQxUU1MREJzWE5jNzhEZ3JE?=
 =?utf-8?Q?Iq82yHCQV7LgoWuNmZ1HRm2hRo3yVGIt0Nj7B+X?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <71FCC5C4172DBA429B4C46B71814FA9A@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4055a9a4-c5c0-4dbf-22aa-08dd54e31726
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 14:54:07.8755 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN1PPF082D135E6
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

VGhpcyBjb252ZXJzaW9uIGhlbHBlciBtaW1pY3MgdGhlIGV4aXN0aW5nIGRybV9mYl94cmdiODg4
OF90b19yZ2I4ODggaGVscGVyDQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDc6NTnigK9QTSwgYW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4gT24gTW9uLCBGZWIg
MjQsIDIwMjUgYXQgMDE6Mzg6MzJQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiBGcm9t
OiBLZXJlbSBLYXJhYmF5IDxrZWtyYnlAZ21haWwuY29tPg0KPj4gDQo+PiBBZGQgWFJHQjg4ODgg
ZW11bGF0aW9uIGhlbHBlciBmb3IgZGV2aWNlcyB0aGF0IG9ubHkgc3VwcG9ydCBCR1I4ODguDQo+
IA0KPiAuLi4NCj4gDQo+PiArc3RhdGljIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX2Jncjg4OF9s
aW5lKHZvaWQgKmRidWYsIGNvbnN0IHZvaWQgKnNidWYsIHVuc2lnbmVkIGludCBwaXhlbHMpDQo+
IA0KPiBPa2F5IHRoZSB4cmdiODg4OCBpcyB0aGUgYWN0dWFsIHBpeGVsIGZvcm1hdCBpbmRlcGVu
ZGVudGx5IG9uDQo+IHRoZSBDUFUgZW5kaWFuZXNzLg0KPiANCj4+ICt7DQo+PiArIHU4ICpkYnVm
OCA9IGRidWY7DQo+PiArIGNvbnN0IF9fbGUzMiAqc2J1ZjMyID0gc2J1ZjsNCj4gDQo+IEJ1dCBo
ZXJlIHdlIGFzc3VtZSB0aGF0IHNidWYgaXMgX19sZTMyLg0KPiBBbmQgSSB0aGluayB3ZSBtYXkg
YmVuZWZpdCBmcm9tIHRoZSBfX2JlMzIgdGhlcmUuDQoNClNvLCBsaWtlIGRybV9mYl94cmdiODg4
OF90b19yZ2I4ODgsIHdlIGFyZSB1c2luZyBfX2xlMzINCg0KaHR0cHM6Ly9naXQua2VybmVsLm9y
Zy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVy
cy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmM/aD12Ni4xNC1yYzQjbjY1Nw0KDQoNCj4gDQo+
PiArIHVuc2lnbmVkIGludCB4Ow0KPj4gKyB1MzIgcGl4Ow0KPj4gKw0KPj4gKyBmb3IgKHggPSAw
OyB4IDwgcGl4ZWxzOyB4KyspIHsNCj4+ICsgcGl4ID0gbGUzMl90b19jcHUoc2J1ZjMyW3hdKTsN
Cj4+ICsgLyogd3JpdGUgcmVkLWdyZWVuLWJsdWUgdG8gb3V0cHV0IGluIGxpdHRsZSBlbmRpYW5u
ZXNzICovDQo+PiArICpkYnVmOCsrID0gKHBpeCAmIDB4MDBmZjAwMDApID4+IDE2Ow0KPj4gKyAq
ZGJ1ZjgrKyA9IChwaXggJiAweDAwMDBmZjAwKSA+PiA4Ow0KPj4gKyAqZGJ1ZjgrKyA9IChwaXgg
JiAweDAwMDAwMGZmKSA+PiAwOw0KPiANCj4gcGl4ID0gYmUzMl90b19jcHUoc2J1Zls0ICogeF0p
ID4+IDg7DQo+IHB1dF91bmFsaWduZWRfbGUyNChwaXgsICZkYnVmWzMgKiB4XSk7DQoNCkFnYWlu
LCANCg0KaHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9y
dmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9ncHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmM/
aD12Ni4xNC1yYzQjbjY2NA0KPiANCj4+ICsgfQ0KPiANCj4gT3IsIGFmdGVyIGFsbCwgdGhpcyBf
X2xlMzIgbWFnaWMgbWlnaHQgYmUgbm90IG5lZWRlZCBhdCBhbGwuIFdvdWxkbid0IHRoZSBiZWxv
dw0KPiBiZSB0aGUgZXF1aXZhbGVudA0KPiANCj4gc3RhdGljIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4
X3RvX2Jncjg4OF9saW5lKHZvaWQgKmRidWYsIGNvbnN0IHZvaWQgKnNidWYsIHVuc2lnbmVkIGlu
dCBwaXhlbHMpDQo+IHsNCj4gdW5zaWduZWQgaW50IHg7DQo+IHUzMiBwaXg7DQo+IA0KPiBmb3Ig
KHggPSAwOyB4IDwgcGl4ZWxzOyB4KyspIHsNCj4gLyogUmVhZCByZWQtZ3JlZW4tYmx1ZSBmcm9t
IGlucHV0IGluIGJpZyBlbmRpYW5lc3MgYW5kLi4uICovDQo+IHBpeCA9IGdldF91bmFsaWduZWRf
YmUyNChzYnVmICsgeCAqIDQgKyAxKTsNCj4gLyogLi4ud3JpdGUgaXQgdG8gb3V0cHV0IGluIGxp
dHRsZSBlbmRpYW5uZXNzLiAqLw0KPiBwdXRfdW5hbGlnbmVkX2xlMjQocGl4LCBkYnVmICsgeCAq
IDMpOw0KPiB9DQo+IH0NCj4gDQo+IFRoZSBjb21tZW50cyBjYW4gZXZlbiBiZSBkcm9wcGVkIGFz
IHRoZSBjb2RlIHF1aXRlIGNsZWFyIGFib3V0IHdoYXQncyBnb2luZyBvbi4NCg0KVGhlc2UgY29t
bWVudHMgYXJlIGxpdGVyYWxseSByZXdyaXR0ZW4gOg0KDQpodHRwczovL2dpdC5rZXJuZWwub3Jn
L3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJz
L2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYz9oPXY2LjE0LXJjNCNuNjYzDQoNCj4gDQo+PiAr
fQ0KPiANCj4gQnV0IGl0J3MgdXAgdG8geW91LiBJIGRvbid0IGtub3cgd2hpY2ggc29sdXRpb24g
Z2l2ZXMgYmV0dGVyIGNvZGUgZ2VuZXJhdGlvbg0KPiBlaXRoZXIuDQoNCkkgZG9uJ3QgcmVhbGx5
IG1pbmQgYW55IGNvZGUgY2hhbmdlIHRiaCwgYnV0IEnigJlkIHByZWZlciB0aGF0IGFzIGFuIGlt
cHJvdmVtZW50IHRvIGV4aXN0aW5nIGNvZGUsIGFuZCBub3QgYSBwYXJ0IG9mIHRoaXMgcGF0Y2hz
ZXQuDQoNCg==
