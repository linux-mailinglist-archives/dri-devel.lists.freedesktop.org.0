Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFE65A42508
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 431DD10E320;
	Mon, 24 Feb 2025 15:03:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="DnymQ2eI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011038.outbound.protection.outlook.com
 [52.103.68.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C2E10E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:03:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ic9pwZeWVtj5K2FoS6/YWeomLP3JzVRoYMHJZB1QO5a7tdPWtiB7Aivwdau4A1UmkBzN+u+Kf8h1as0P/n+dmjQaDgrJhJ2PPO1fb/VCzEvFy0OR17Z+s76JhM0SncDZWof/SxrkeKCfKf+O//FSqiCgnQC1mXb/roWLlZ7Krg8QgS5BPe0o24l6FibuujUQBbcWVCAJKhOLGWPP4yKi0JfCO418AyE8GtIyJ2UmMgvMGm7KRSSRvc6IuIYYGOvkBDZ6FTjXL9wXlrUmXGbYUWKnkebtANqwEDcwxqbemkCi2U4fHIIV0mkMzH094DYbzPTCuYZO87DO7Vj4bol0Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8IABul3u0Fu5zLnwq5sQfPGlWq20aQqVP3NCT4bKZV4=;
 b=CYZSbSGObfHiQeHDIf9vZZyUxfe+vbXPR8n02nz+mBCZnWbfMcLM3erbN2DvV2YC5x4bY0wSjTm4P4oh694fonwV98QwJEK/O8Hzd4GraQnzA3kUwZmxBOmceIN+TUFX0Oqna5NQX5p/Rsdk0pfpeitvuqubNueFdL7yUyH8d4ipNJzP8oqWdMy7BMEdY2mRx+BMC8tNWZJOgcUm3HmLNDvKV/C8l0bJe/+h2lyD1nWHXr4CzPVwGtufHkqvCmdvZ+xcnt8/8eP4Uwe8+zKVZv0wChc5Hsi0GQW6lHlyZ0+OYcicz5A9Ia0icsrDWJrlXjFSZUi8pMUm2l/G3pWLjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8IABul3u0Fu5zLnwq5sQfPGlWq20aQqVP3NCT4bKZV4=;
 b=DnymQ2eI5I4jehtqAktkMs25R+vPsVKSRHhuDmRNteXG05ZcwHs5qSSeHWmPYwQrTP4Gt8uPiaRZgH47TPkS07rhrPIA+U6T+T8qTmCIR1cFlfXsagouEgJmadaTYoaMNb30LQNoaKIIxjqu2wx3Qj/v4+H/0lJ/Y45/9XcKDM/JZws6CpNeYJYIkHgASMuYYuLGNE0GmEciQSG1rKWlbs5NRL5HV0R0skFnUDbJ8mGwFW0PqfpCH+J3MI0YMgIcCzkvx9XQiHVOA+Mntro8U785zWlAzggKIkM0HD0TD80WxmLn3mCA8Xs6OCREiBxSrbCfDZ2JglxxyYtInVIoqw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8022.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Mon, 24 Feb
 2025 15:03:40 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:03:40 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v4 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWe38AgAAI1YCAAAcMAIAAAaKA
Date: Mon, 24 Feb 2025 15:03:40 +0000
Message-ID: <3D520B56-AE84-4D73-9604-495642AF5B30@live.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <844C1D39-4891-4DC2-8458-F46FA1B59FA0@live.com>
 <Z7x7kMjaDbCp_LB2@smile.fi.intel.com>
 <5BC3A795-99C2-4F00-ADD0-7ECD0285CDD0@live.com>
 <Z7yI4roBKA-PI4EC@smile.fi.intel.com>
In-Reply-To: <Z7yI4roBKA-PI4EC@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8022:EE_
x-ms-office365-filtering-correlation-id: 6901805c-8c2c-4d80-e7d9-08dd54e46cab
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|15080799006|7092599003|461199028|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?UDJVV3Bjc0RSb1hXK0lKMG93VXBsNEZuNDBvT2ZtVG9NZzM3UTdqclpyZWNJ?=
 =?utf-8?B?aDRZODRrbEFKVjdVZUxmR3c0Mkt6VHJSV0g4SEVSNGl2UHRHUm50djYxVGE0?=
 =?utf-8?B?RmxLZmNUNDh2N1Y0WjQ4QnFja1E0Z2h0ZUJCNWY4WFpNTzltejMyQkJDVjFw?=
 =?utf-8?B?cUdzaXJ4MHhvb2NSblBXVUpSYWJ4SUdBZUxRbzh6VXUybENUNDEzUE5OT1B5?=
 =?utf-8?B?ZkJZZmdxUDdSTEVLMXhid2M2MC94cHpjaTlLZ0RncTNXQVc5U1V1VWZVS2o3?=
 =?utf-8?B?Yk5jUWFmNUFtemRpcTRyb0NYOVA0NVhHYVYvdW9NOGh5eFM5aFkwa0FtWWht?=
 =?utf-8?B?TXZSUkg4VmRpNjNmdjRpdjl6c3RvRFhXS2NYOWFwWndwT2xkcWZOeENnWVlN?=
 =?utf-8?B?Q2RRaTJGWCtuMFduUUlueTRoQTdaa0NKd0RVQjdwd1RlQnlJK0hZYkhyYThv?=
 =?utf-8?B?TU9aRVJycDNzYUNXTnlDT3JIMHR4MWdMY0pWVFFrS1RZOFFrL3VjU0t0elRu?=
 =?utf-8?B?RGhSS3YySjAvUmh3ZFYyTlh4MEhQMTlNN0JkcC9wNFl5YTJnOHNsUjYxS0FV?=
 =?utf-8?B?MTlZdXJ3ckNOM2tuTkxVeDFObWwrQ2czN0V6UUF1YnpoYTBFVzUzWFVvVUFJ?=
 =?utf-8?B?TGZ0SGcwMlBsU3dQZXYxSUtzbDViQWU4cXJsUzJQK004WXdkRkEwcGRvQ1V1?=
 =?utf-8?B?ZkhyUDlibUhJWkQzdEpldWUvRjZUSG9QL1AwMzUwZlptaHFoaUNpU05BNHVo?=
 =?utf-8?B?eE9TN0tRUk5keHFHaDBCQThZT1ZINksrRER4cVhXc1padzBvTGs3ZDNramdE?=
 =?utf-8?B?NlJaRjUxRk9selhCWmZUbkpoZGJlM2JOUFV3clNvTGRSbU92cDY3dTN4Misx?=
 =?utf-8?B?SHpoL3RkY3ZJSGtraVNndHpIbWFkYUcvRjNoTXoxaXVNR3dwNzRFR1IxN1dH?=
 =?utf-8?B?V0RvMm5ML3BsR3E0UDVIZjVpY1BWRmVQRTlCUmJLeTJOVXRIOU0zQWlxNkFM?=
 =?utf-8?B?VWZ4cDhhSXZnbDhGM0gzcFkzdTZOeUsrUDJLRW9VeFN3ajJxZ2NqZDBVY0Zh?=
 =?utf-8?B?aDhrLzhTaUx2YXQxQzJtdEpLZnNjTFJLTWZGcXFFbUFKYXIrMlNGcGtpbi9O?=
 =?utf-8?B?aUZneWxVWXp0aHdMWlg0T25GaFNOYmRvcmNocjRpclVzYVFkbWIvVnZqUWlH?=
 =?utf-8?B?YXpqQ05PTlBxUnVNbmZMYnN3QWluZnlPMTVLVTNxRjEwQkdWWkY4YmFreEhY?=
 =?utf-8?B?S2x4TVlPcTFJMGdxdHBaSFFrRjhDbmcwZERTTnBXS0hDdEZRMUs1RjdSUERG?=
 =?utf-8?B?Vnd2YXgxYTdTTnIyU2hDVWdBajZyUnZLWkJVeGg5OENVL1hna1BrYXNxcllP?=
 =?utf-8?B?MU5NUzVuZzdoYUtFYUx0VlFnMXVsL1RaYkROa216WG4rN3Iyb2dWTDR2dFpz?=
 =?utf-8?B?UXhub2NHQy80WjRrNFByT0VDaHd3OXRlV3RYRURRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NXc3Vkx1ejhVenZQZERPNkdSdUVUMndKSkZHZ0krQkFKY0dFSlJKY1F3aTQy?=
 =?utf-8?B?YnlveVB4eG1IUy9LNFJXdjVvbFdVL1EwTHR1c2QyT25SSVBCd3ZZWTU0NFQ2?=
 =?utf-8?B?dStleklTMTBxNVFpVVVTMTl1dGZZd1lnd1VzdFNwekloVnlpSGNvTzZmN0Rl?=
 =?utf-8?B?b01pT05yS2MvV2d3NlNKc2NrR1NsNThqdTZ5dnJRcnk1Y09uQjlsWGlwR25s?=
 =?utf-8?B?SVJ4ZG5STi8vbEN4YVd1aGZ2SWhxY3JubTNpM0VWU0o1MnZYa2NYWEtSOGZ3?=
 =?utf-8?B?SE1NbTZCQXJ1Nm13SGJaWFRkYUxVOEhQeXBJaW5wdmNFSnlGOUxmOWcrMDRa?=
 =?utf-8?B?SHc2cHRvTEJ6NmJaQ1lCb1RBTnFJZEc4Yk5uOGJNZVNtTldSUkxFMGltMUI4?=
 =?utf-8?B?L0FMUVYvdWVUQTltQk1vYjIxZmg5dTBrNU1WcjJHOFd5alhicTBZdXhkV2ZW?=
 =?utf-8?B?RC9aM2wwbGxOYmZvVzR6SFBOaWFYUERpekNwclNkTFFJeFVSUFp0WWwvZzNk?=
 =?utf-8?B?STFsZXhZaFJRZ0pkRGc0ZVJXeHdqTmhmR1RPdncrWDVtUktPTk1Bd3lJTUdw?=
 =?utf-8?B?aFZJRE11cDFDSjZwRWJiNVFCeTRXZDduMGg3SUNjeW8wS1lqUTRDVk1HakJX?=
 =?utf-8?B?SnRpZG9HY25YSVkzL21ObUV6NktmMVA4TUdCZjg2cm54dDRIQVQxR0ZNKzNO?=
 =?utf-8?B?ZEp5eHNGaEJKNzFJdWlWTEt0c3NubUFYZzJmd3Q2Qkx1NGd0Z0lka204ckt1?=
 =?utf-8?B?SUlHUS9qTEtMNXZYb01RR1YzaDRFZnlhakpXY0MzdXZjTCsxWFZkWkNrYmJp?=
 =?utf-8?B?TS9IQ282ZEZpYVNUZFZSZ0g2aSthRGtVMDJHRExkRGQyZ1dlY0xDZjBSZW1J?=
 =?utf-8?B?c2Z5dC91Mk5ucFhUZ1ZZOFZXc2NreUJOc1puSDVRMi9yTWFQelFraUJTZHgy?=
 =?utf-8?B?bS9Qc2pQb0J2Z1BtSVlSUHh6TzlwTGtlUWc0MEd6dFFLU2VYdGd4YkNMcTZT?=
 =?utf-8?B?TnlMZ0ZzWGxSRjQ4TkMxRGROcmZVQXJnVFlXWUErTi9UV2szUzRaQitWQVlM?=
 =?utf-8?B?bmFJSkpud2Z5b0g0RTVQWlRCNzc3ODlPWVBZQ1hTKzdFS3lBR3R4UXkreCtr?=
 =?utf-8?B?M2MwY2k1NVZZZnhNQW00L2tDQmFNc2pxQWs3R2djb0IxdkFDdlViRHVObEFT?=
 =?utf-8?B?dE5jLzZqd2hkTnpjU2JqVmlJc0lYblhLd0U1V2lGN2hyR3dGczNQMmJKd0Q5?=
 =?utf-8?B?RXJ1RDRxLzBTa2hpZldEZ0tFaThsc043V0x6Rk0wNWJaRlZ2ajlnNmNnVEJw?=
 =?utf-8?B?OGZPU3ZUb3d2VW0vdU84QmZlMlVBV2JOQnl6SEprZ2t5UE91Q0hpdWkwak5p?=
 =?utf-8?B?TE16a3RqU1pkN0Z1WVQwdFB3S0lKMUlsV0pGaC93SGc2cVhLMHh3cG9rc2Rv?=
 =?utf-8?B?Y1o1RGVWcm4rcUlONXJVOHRzY0xXUmtsSXc3NVlnVjlpRlBIYzNXY0s4bEdK?=
 =?utf-8?B?em5kT1NxU2VwTGhFRkZRVTFwMmFmb0UzcTBEYmJmSjBxWFFwYVUyVERzY0tt?=
 =?utf-8?B?bjJJWGJKY29CQWU0NjhGYlZTRlhzZVFQMjNJM2J3L2NBQnhRaUNXQytrTHdF?=
 =?utf-8?B?STRJT2RKZlV3K005OTg2RE5BMVBuSlc4dE9yK1cvVnRlN2pKaVdPRitiU3hM?=
 =?utf-8?B?amV1bGFvdU54eDNuM1pJYnBGZzJRZ0RmaEVHU08vLzVBb0tvV0tpQ1hoelBR?=
 =?utf-8?Q?LHsdWtzYJSPzzUEmKb2x5cfcon9iaBBUBwyDLGV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61CA0DFFC6E8A64D90496EFEBB22BB02@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6901805c-8c2c-4d80-e7d9-08dd54e46cab
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 15:03:40.8732 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB8022
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDg6MjfigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4gT24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDI6MzI6
MzdQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4gT24gMjQgRmViIDIwMjUsIGF0IDc6
MzDigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tIHdyb3RlOg0KPj4+IE9u
IE1vbiwgRmViIDI0LCAyMDI1IGF0IDAxOjQwOjIwUE0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3Rl
Og0KPiANCj4gLi4uDQo+IA0KPj4+PiArI2RlZmluZSBfX0FQUExFVEJEUk1fTVNHX1NUUjQoc3Ry
NCkgKChfX2xlMzIgX19mb3JjZSkoKHN0cjRbMF0gPDwgMjQpIHwgKHN0cjRbMV0gPDwgMTYpIHwg
KHN0cjRbMl0gPDwgOCkgfCBzdHI0WzNdKSkNCj4+PiANCj4+PiBBcyBjb21tZW50ZWQgcHJldmlv
dXNseSB0aGlzIGlzIHF1aXRlIHN0cmFuZ2Ugd2hhdCdzIGdvaW5nIG9uIHdpdGggZW5kaWFuZXNz
IGluDQo+Pj4gdGhpcyBkcml2ZXIuIEVzcGVjaWFsbHkgdGhlIGFib3ZlIHdlaXJkbmVzcyB3aGVu
IGdldF91bmFsaWduZWRfYmUzMigpIGlzIGJlaW5nDQo+Pj4gb3BlbiBjb2RlZCBhbmQgZm9yY2Ut
Y2FzdCB0byBfX2xlMzIuDQo+PiANCj4+IEkgd291bGQgYXNzdW1lIGl0IHdhcyBhbHNvIG1pbWlj
a2VkIGZyb20gdGhlIFdpbmRvd3MgZHJpdmVyLCB0aG91Z2ggSSBoYXZlbid0DQo+PiByZWFsbHkg
dHJpZWQgZXhwbG9yaW5nIHRoaXMgdGhlcmUuDQo+PiANCj4+IEnigJlkIHJhdGhlciBiZSBoYXBw
eSBpZiB5b3UgZ2l2ZSBtZSBjb2RlIGNoYW5nZSBzdWdnZXN0aW9ucyBhbmQgbGV0IG1lIHJldmll
dw0KPj4gYW5kIHRlc3QgdGhlbQ0KPiANCj4gRm9yIHRoZSBzdGFydGVyIEkgd291bGQgZG8gdGhl
IGZvbGxvd2luZyBmb3IgYWxsIHJlbGF0ZWQgY29uc3RhbnRzIGFuZA0KPiBkcm9wIHRoYXQgd2Vp
cmQgYW5kIHVnbHkgbWFjcm9zIGF0IHRoZSB0b3AgKGl0IGFsc28gaGFzIGFuIGlzc3VlIHdpdGgN
Cj4gdGhlIHN0cjQgbGVuZ3RoIGFzIGl0IGlzIDUgYnl0ZXMgbG9uZywgbm90IDQsIGJ0dyk6DQo+
IA0KPiAgI2RlZmluZSBBUFBMRVRCRFJNX01TR19DTEVBUl9ESVNQTEFZIGNwdV90b19sZTMyKDB4
NDM0YzUyNDQpIC8qIENMUkQgKi8NCg0KTGVtbWUgdGVzdCB0aGlzLg0KPiAgLi4uDQo+IA0KPiAo
YXNzdW1pbmcgd2Ugc3RpY2sgd2l0aCBfX2xlWFggZm9yIG5vdykuIFRoaXMgd2lsbCBiZSBtdWNo
IGxlc3MgY29uZnVzaW5nLg0KPiANCj4gLi4uDQo+IA0KPj4+PiArc3RydWN0IGFwcGxldGJkcm1f
bXNnX2luZm9ybWF0aW9uIHsNCj4+Pj4gKyBzdHJ1Y3QgYXBwbGV0YmRybV9tc2dfcmVzcG9uc2Vf
aGVhZGVyIGhlYWRlcjsNCj4+Pj4gKyB1OCB1bmtfMTRbMTJdOw0KPj4+PiArIF9fbGUzMiB3aWR0
aDsNCj4+Pj4gKyBfX2xlMzIgaGVpZ2h0Ow0KPj4+PiArIHU4IGJpdHNfcGVyX3BpeGVsOw0KPj4+
PiArIF9fbGUzMiBieXRlc19wZXJfcm93Ow0KPj4+PiArIF9fbGUzMiBvcmllbnRhdGlvbjsNCj4+
Pj4gKyBfX2xlMzIgYml0bWFwX2luZm87DQo+Pj4+ICsgX19sZTMyIHBpeGVsX2Zvcm1hdDsNCj4+
Pj4gKyBfX2xlMzIgd2lkdGhfaW5jaGVzOyAvKiBmbG9hdGluZyBwb2ludCAqLw0KPj4+PiArIF9f
bGUzMiBoZWlnaHRfaW5jaGVzOyAvKiBmbG9hdGluZyBwb2ludCAqLw0KPj4+PiArfSBfX3BhY2tl
ZDsNCj4+PiANCj4+PiBIYXZlbid0IGxvb2tlZCBkZWVwbHkgaW50byB0aGUgcHJvdG9jb2wsIGJ1
dCBzdGlsbCBtYWtlcyBtZSB0aGluayB0aGF0DQo+Pj4gdGhlIGFib3ZlIChzaW5jZSBpdCdzIHRo
ZSBvbmx5IF9fcGFja2VkIGRhdGEgdHlwZSByZXF1aXJlZCkgbWlnaHQgYmUgc2ltcGx5DQo+Pj4g
ZGVwaWN0ZWQgd3JvbmdseSB3LnIudC4gZW5kaWFuZXNzIC8gZGF0YSB0eXBlcyBpbiB1c2UuIEl0
IG1pZ2h0IGJlIHRoYXQNCj4+PiB0aGUgZGF0YSB0eXBlcyBoYXZlIHNvbWV0aGluZyBjb21iaW5l
ZCBhbmQgLyBvciBkaWZmZXJlbnQgdHlwZXMuDQo+Pj4gDQo+Pj4gRG8gSSB1bmRlcnN0YW5kIGNv
cnJlY3RseSB0aGF0IHRoZSBwcm90b2NvbCB3YXMgYmFzaWNhbGx5IHJldmVyc2UtZW5naW5lZXJl
ZD8NCj4+IA0KPj4gWWVzLiBBbHRob3VnaCBpdCB3YXMgcmV2ZXJzZSBlbmdpbmVlcmVkIGJ5IHRo
ZSBwZXJzb24gd2hvIHdyb3RlIHRoZSBXaW5kb3dzDQo+PiBkcml2ZXIuIFRoZSBhdXRob3IgaGFz
IGp1c3QgbWFkZSBhIExpbnV4IHBvcnQuDQo+PiBTbywgYXMgZmFyIGFzIGhvdyBpcyB3YXMgcmV2
ZXJzZSBlbmdpbmVlcmVkLCBpdCBub3QgcmVhbGx5IHBvc3NpYmxlIGZvciBtZSB0bw0KPj4gZXhw
bGFpbi4gSSBkb24ndCBldmVuIGhhdmUgYW55IGNvbnRhY3Qgd2l0aCB0aGUgcGVyc29uIHdobyB3
cm90ZSB0aGUgV2luZG93cw0KPj4gZHJpdmVyLiBUaGUgb25seSBwb2ludCBoZXJlIHdvdWxkIGJl
IHRvIG15c2VsZiBSRSB0aGUgaGFyZHdhcmUgYWdhaW4sIHdoaWNoDQo+PiB0YmggaXNuJ3QgdmVy
eSBtb3RpdmF0aW5nLCBjb25zaWRlcmluZyB0aGF0IHdlIGhhdmUgYSB3b3JraW5nIGRyaXZlci4N
Cj4gDQo+IFJpZ2h0LiBJIGFncmVlIHRoYXQgaXMgYmV0dGVyIHRvIGhhdmUgc29tZXRoaW5nIHdv
cmtpbmcgdGhhbiBzb21ldGhpbmcNCj4gZ29vZCBsb29raW5nLCBidXQgd3JvbmcuDQo+IA0KPiBD
YW4geW91IGFkZCBhIHN1bW1hcnkgdG8gdGhlIGNvbW1pdCBtZXNzYWdlIHRoYXQgc2luY2UgdGhl
IGRyaXZlciB3YXMNCj4gcmV2ZXJzZS1lbmdpbmVlcmVkIHRoZSBhY3R1YWwgZGF0YSB0eXBlcyBv
ZiB0aGUgcHJvdG9jb2wgbWlnaHQgYmUgZGlmZmVyZW50DQo+IChpbmNsdWRpbmcsIGJ1dCBub3Qg
bGltaXRlZCB0bywgZW5kaWFuZXNzKT8NCg0KT2sNCg0KPiANCj4gLi4uDQo+IA0KPj4+PiArIC8q
DQo+Pj4+ICsgICogVGhlIGNvb3JkaW5hdGUgc3lzdGVtIHVzZWQgYnkgdGhlIGRldmljZSBpcyBk
aWZmZXJlbnQgZnJvbSB0aGUNCj4+Pj4gKyAgKiBjb29yZGluYXRlIHN5c3RlbSBvZiB0aGUgZnJh
bWVidWZmZXIgaW4gdGhhdCB0aGUgeCBhbmQgeSBheGVzIGFyZQ0KPj4+PiArICAqIHN3YXBwZWQs
IGFuZCB0aGF0IHRoZSB5IGF4aXMgaXMgaW52ZXJ0ZWQ7IHNvIHdoYXQgdGhlIGRldmljZSByZXBv
cnRzDQo+Pj4+ICsgICogYXMgdGhlIGhlaWdodCBpcyBhY3R1YWxseSB0aGUgd2lkdGggb2YgdGhl
IGZyYW1lYnVmZmVyIGFuZCB2aWNlDQo+Pj4+ICsgICogdmVyc2ENCj4+PiANCj4+PiBNaXNzaW5n
IHBlcmlvZC4NCj4+IA0KPj4gQWxyaWdodC4gRm9yIHNvbWUgcmVhc29uIChhIG1pc3Rha2Ugb24g
bXkgcGFydCksIHNvbWUgZGV2X2Vycl9wcm9iZSB3ZXJlIGFsc28NCj4+IHN0aWxsIGxlZnQgaW4g
dGhpcyB2ZXJzaW9uLg0KPiANCj4gQnV0IHRob3NlIGFyZSBzZWVtcyB0byBtZSBpbiB0aGUgY29y
cmVjdCBsb2NhdGlvbnMsIG5vPyBIb3cgZG8gd2UgZXZlbiBrbm93DQo+IHRoZSBEUk0gZGV2aWNl
IGJlZm9yZSBpdHMgY3JlYXRpb24/IFNvLCBkZXZfZXJyX3Byb2JlKCkgY2FsbHMgaW4gLT5wcm9i
ZSgpDQo+IHNlZW0gbG9naWNhbCB0byBtZS4gU29tZWJvZHkgZnJvbSBEUk0gc2hvdWxkIGNsYXJp
ZnkgdGhpcy4NCg0KVGhvbWFzIGFza2VkIG1lIHRvIGRvIHRoaXMgY2hhbmdlLiBNYXliZSB5b3Ug
ZGlkbuKAmXQgc2VlIGhpcyByZXBseS4NCj4gDQo+Pj4+ICsgICovDQo+IA0KPiAuLi4NCj4gDQo+
PiBJ4oCZbGwgc2VuZCBhIHY1Lg0KPiANCj4gUGxlYXNlLCB3YWl0IGEgYml0LiBpdCdzIHRvbyBm
YXN0IHRvIHNlbmQgb25lIHZlcnNpb24gcXVpY2tlciB0aGFuIDI0aC4uLg0KPiANCj4gLS0gDQo+
IFdpdGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCj4gDQo+IA0KDQo=
