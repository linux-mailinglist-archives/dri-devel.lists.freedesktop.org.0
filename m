Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21A52A4084A
	for <lists+dri-devel@lfdr.de>; Sat, 22 Feb 2025 13:22:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43F9210E0FA;
	Sat, 22 Feb 2025 12:22:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="oQoBa6oP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010002.outbound.protection.outlook.com [52.103.67.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B702F10E0FA
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Feb 2025 12:22:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v62Fac0CSkG5KeF/5GGAcHn23Z1td1tgGDn3WOHhuwqpPpdRH2UmHoBGPwJoVwiB+Q94Oryr16+xX4JZld1zJ5IuLVmF7MDkcPvgnzfXLzF1vc+a5o+m9qlGucv9KfnmFqUlGi8RhZI/x3iWNzwlFfoHd3LAAiK7WY3EMKPU8Ma0CtQe/MiIfMnZPmm9+5dLB2i1Lo5eEgEXym1LKdKnFLAo4oMR1CvacFkhmXOJsmzu8sG4MbRjGQ1MfVfLiaJKsTAvpOAZtxBMUQ5pehwjLp8QonCJ8XgQYp+EGgPz7Yfyjg445zJOPQdstYhR8ykZufbxrM1AI+LDNFv7WA11/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/7tzQpdeMK4Bd+J7eDy6wCszt24aOqTSV54IIHVkbU=;
 b=bogz85ljFuSffeH5THmtOds1NjlOUTWS2rCA1qI3rMZ3E3Kz4exynT69AZKeN25+quYLDRLGN0SWgCoPks9tYlpjTfkaElftHENCE1BscOW4uV7TMQjLOB8CBSvgKh6gnp/wwsMlOh+vrEJVxX+0W9kZ8VwRen8K/PSmFb4992qmaitiqY6Etq9HESfGW3QaXAZEak3W9MPgFIDrUapYgiQI4QtbDL3FJSEuQbaY5mjoCLTwy94qV7wMDWxM4HNlcU2sM5BVThtOLI+gFzybyw3MzYuHgVVQ8dKiHgTaAlIY4CrKwNvXxXT0gYDGtJ0VMeSkIAEDBluugg9cp9wM0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/7tzQpdeMK4Bd+J7eDy6wCszt24aOqTSV54IIHVkbU=;
 b=oQoBa6oPxMDkL9Z+6XdJcNedLp+fNa3/k7G3t3o/lMBdES2kZYOKEHxt5iCVemLD8/Mq1Nc0jM+MX2TdPTQ+5DW45J1fX1ZCguyxISkaLd/Is1b4UFTrd4FZ0pY/Dd5vVJeqIATfxPkRFjY3WHmvm7WE4ar+FUfEYmilMmAP1acr2eo3eg0uZGVdMnu680MKjeXjATlteKy5NNxvqC7cdx9Vniu/eCMpfS/jC9lERc/eIsrGX6BzgeSDvec2/jZZXWU9Co84W0jIMGZLvdW6UJ0bjliy1M7xmBEXjFUvVqtUpsWg6QHbCqB2AbS/ntZnJB8R/QAlSm/TIVoXTVBbGA==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN3PR01MB7206.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:af::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.18; Sat, 22 Feb
 2025 12:22:36 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Sat, 22 Feb 2025
 12:22:36 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "pmladek@suse.com" <pmladek@suse.com>, Steven Rostedt
 <rostedt@goodmis.org>, "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, Jonathan Corbet
 <corbet@lwn.net>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 Andrew Morton <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, Kerem Karabay
 <kekrby@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>, Orlando Chamberlain
 <orlandoch.dev@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, Asahi Linux Mailing List
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v3 3/3] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbhFUNsu7CitoQSEyg6//EGVnJDbNR53mAgAA5FACAABkMgIAA0A4AgAA2iQA=
Date: Sat, 22 Feb 2025 12:22:36 +0000
Message-ID: <2500F60C-DEB0-49C8-B67B-49351C802646@live.com>
References: <DC5079B2-9D3D-4917-A50D-20D633071808@live.com>
 <8F522D41-5417-467E-B9D3-7D9FC24AE536@live.com>
 <Z7igVXqvRYTVFpXU@smile.fi.intel.com>
 <A373EDB5-528D-4ECF-8CF3-4F96DE6E3797@live.com>
 <Z7jlORk0MiMFTmp6@smile.fi.intel.com>
 <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
In-Reply-To: <E8256A03-5D13-4B8B-932D-70E734E580FE@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN3PR01MB7206:EE_
x-ms-office365-filtering-correlation-id: c5f04c58-af73-443a-620c-08dd533b9748
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|19110799003|461199028|7092599003|15080799006|8062599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?ZWMyZjA0b3VGSFZoUHdEOFJZVkhJR1IrZU9YN1V5ZHVzUVU5Y3pheWFjcitK?=
 =?utf-8?B?TWNJWGRWcURyNDVjbk1VSGdleTVwK2NReVpVeEVXZUFoWTZINktQZ0ltZ0FZ?=
 =?utf-8?B?MmptdmxiWTdTLytVSnNxdTVRck90Q09Bd1czR0hnSXVITGxJeXYyNGg1TUhS?=
 =?utf-8?B?ODZ0TTZEdERzZmQ2cVQrSmY5SVhKZExwK0pyVWpMcGltN2ZBMmgzYkd2ZmJZ?=
 =?utf-8?B?ZTJ6TGVKeXdQdm51VElVRnQrUUVneDVoS0pTNTBsam43RnRabFc3TGxWeEVW?=
 =?utf-8?B?QXNMRnVodU5vZzZjRUJnZ3B0SzlQTnlIc0pBNndHeUNWOFg1MzFKNmNlRE9Z?=
 =?utf-8?B?cCtPUHM1VWNjM0hPUmxkOE4xOEh5dmxkWklNU2w2RTdsYm52TVRxelVUUDdP?=
 =?utf-8?B?MmRKTTJ4U3JYRHc0dFJtMlVaVGErMXg5cVFLZGpmWEUwMFpIRWJaZDNGZC9o?=
 =?utf-8?B?ZHhFZC9qVnI1UmtwWFJTdG9Sdjk3TlNFYVVSd1V4NTVSRWVZR2VPbS8vR3Zz?=
 =?utf-8?B?Q05rLzRxdm8zeTB2WG0yL29LblFCMmwwU3lEQ1JFc25Scy9UYzR2Qnl4VGlC?=
 =?utf-8?B?bzhUaU01TGxYcmtIakRxRnZmc2dwUDhtWnhUUzZqSWNZV2E3WFZzTWo0YW1u?=
 =?utf-8?B?aWMwb3RUQXptRGwzWjhXSXpsSFBuM3lwdkU1dVliQ0QyalAyWi9lYkJQRms1?=
 =?utf-8?B?S2pCSnNBNDUxVGpwcTFReVUxQXA3VHluRitEMXA1MVAxVzVSMGU1U0F2S1pw?=
 =?utf-8?B?YXBIU1VXVmNhUEZ6UWpBQVRBcDJDbHl0bUlqVnBXNks1emNaQ28zcHBFTGZv?=
 =?utf-8?B?UHpRdVN3ckhEYTNXYURRN1NYeFUyanBucGxrcURocS9HQlFYS1d1ekIxbDVR?=
 =?utf-8?B?Rlp3UDUzYkd1RDQ2MDFvdVdQNTZpVE1rK3ZTMUs5R2hXSGFJOXdabWZWMjBm?=
 =?utf-8?B?OG5hUmpKWjFDY0IyS2VWUjVRSG9YYkpTNitaWnh1VVBRZzhCMkdmL25lM1o4?=
 =?utf-8?B?NCsxZGVxTjAxbTZKcGh2WEVkRTN3aTZIY1RYdnVKZWVZMFd6NWt2QVJFU2Zx?=
 =?utf-8?B?NWZ6KzdPUFpsMFJTcFQwQjdRQjZyOVZ4NHdBbDZHNnBUVmRwSjE1TWdBU0dp?=
 =?utf-8?B?M2txNUhxV2o2QmNBSTlPRmloUFJOUHNtNmtNNFdoZFBkNnc5OWN5SUF4dDF6?=
 =?utf-8?B?d254ejJ6OGlSWStNcDhnS0dxU1Z3cHo3Zm5ZRzRLTzIwUXBBZnZranpUYnZz?=
 =?utf-8?B?RXgrZFdMY3RNUFRJV0ZuTnYxTnFrS3hxNzBENUpCMFFyeHhEdWx2YS9mL09N?=
 =?utf-8?B?aG8yRUhUZitzTlNiQ2ZjZ3M1enBSazU2ODhsY3c0UEpKYW92b3ppUnUzbVY2?=
 =?utf-8?B?anBxOW5HS3R6UVcrdUxhZEIzWXQrNFFtdExtTkRrL2h3TVJiMWFEUDZjNnVz?=
 =?utf-8?B?eGlmZkN1NGhUZjhNZ2Nla0ZzZk1BemhCMk0yMm5RPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RHJ3TTNrMkxPSTduVUZjSThScGhRbC83cDlxdHNvK1REQzM2RlhtSlJjU3ZY?=
 =?utf-8?B?NHJTcGd1aVZKMUoxY083NnlzdlhGSW05VTdhWEhsVmE1RFFLSE84S2tmUG1o?=
 =?utf-8?B?MXFKcFdwT0tpTUwzVWtTWGNTck03REhndy9tYXRtQW1rZVo3TTR4aGEvc2w5?=
 =?utf-8?B?MVZmdzZ1NlF1V3VFRDVzeFIvTUFXaTNlb1BHTjhBQVU2WnNpNmxxbmRhc3gr?=
 =?utf-8?B?N3Ztc2hESWVDekplWVlsSmNaNnc5QjFzMWVwaTNwWllteHhOVHM1VGFCK0tT?=
 =?utf-8?B?UVNHRlBCNGhJWVBTNzR2dE50UDdpUWtPVzhieVJlSEhCZVlZaEtVRmFLOS9l?=
 =?utf-8?B?UkZxOXVlb0YwU0NXSitmOW1mQUxiNjZCVEp3Uk5mbFJoK3VJTmxEMTVMZXlT?=
 =?utf-8?B?SUl0bzlFYm1jeWtyTVExMEM4UE4xN3graTV4cGorYWVlTmw3dXIxeEJvTGdY?=
 =?utf-8?B?Mk1kRmRsK0pLZjNwWDdiNkVITWU3c2ozUkNRMkZGUEtmc2dRaVV0RDliaXFQ?=
 =?utf-8?B?aVRzSkYzaGRmemJmTk9QWkhFWnBrWTkvM1hFYjBrcE02NmJQcFU3VzBTd29w?=
 =?utf-8?B?TVRORVA3ejBXaWVuVnFNeGloUDRzY3JvSjAvaFR1RXZRU3dlbEQyN0dSS252?=
 =?utf-8?B?SitnLzcvQzNqT2hvUnpUcVBwVDBVWFN5WS8vdFhjRks0aytaVGxQTDI4ZXF6?=
 =?utf-8?B?blBpYm1YUnlORWxZNmtvSWVIQkFtbHJyaHJ3Rk1EMlVBK0UyMHJDZlIyVHBi?=
 =?utf-8?B?VjZpYXFpZWM0RElwRDJiZzE3Q3ZkVjRrNjE2am9KUk03M3lhRTdQYzlsR1dJ?=
 =?utf-8?B?MHYvL05SR3pxZC9CKzN3K1lkUCtEaXZGZEdYRmx0dkR1NkdWWWxtVHBVTmVZ?=
 =?utf-8?B?alFjNzNud2U4YjBxaTJJMm13YWJXbXhEVngwOHFGNzljN1NocDYxM0JrdWpP?=
 =?utf-8?B?blVMU1lINTVvTjRwTm03T09lQ0p1RENkZXBEK0ZPdTF1dGNzbXdrK3RjTVNo?=
 =?utf-8?B?WnEzQUNZcXJ6YnVyV2RTV1Fmd1YxYjROUHp0SWpqM0pCU0VCM0x0WGVOM3ht?=
 =?utf-8?B?Qis1QVBRRGVYMjkvM3MrbklVU05VOWt2cU5Ud0RhZ1MrZW5uYmRLdjl5aHVR?=
 =?utf-8?B?UFFkbG1KWm5ZRzR5dmE1K2ZUemM5RERrZ2tKbVdGYSswcEkzc1NOQ2F3Wll4?=
 =?utf-8?B?Y0FZSk41RWprN0djei9wbXJnVFZCYUp5bmNTZGFwSThiZzlmZ25ZM0J3N0Js?=
 =?utf-8?B?S1ZFdjBvUGZTc2hJV1MwU0IvR3BIT2w5UDJWQTd5OVRvaC84N1lXUHU0aGlL?=
 =?utf-8?B?bGZhemtlQ1JnMy9hY0xOdzlsS01pU2Zsc0tGckU3Y041amFMR0x2bUR2UVZZ?=
 =?utf-8?B?cDdDL1YxR2szQ0RzaDZuRXRacG9kV0g2R3NnQW41YmJQRlJGOEV0ODVKRTRJ?=
 =?utf-8?B?MWZHWU1vKzhKQUdNVnI0ancvUjQwd1ZoSHNBS2ZCY0FET0t5SStaQW9WalA2?=
 =?utf-8?B?RXlmVWF5VUliNXJ3VDR0UDdYd3Ura1FId0Z2T2RZS0JibUp5MTlnZFFHeFRO?=
 =?utf-8?B?Q1NjaWI0Z1Mza0QrQUpNVmhCalBzUUkrMUk1MFB1UmcwYm8xdnhNV2NtUWR1?=
 =?utf-8?B?aXpJajJveUI2UGF1bi95VUtmMWl0NGFCcks2b1piNGRSK21zTTVqUUc0RFo5?=
 =?utf-8?B?OGN3UlowWFRteGxPeHoxZ01HMzFDZTRESkx6d1JqS05HSDFmM3pyU09LRDQ4?=
 =?utf-8?Q?7V0VRaYuinvXD4iCjPsJ4pILfdqSZNX+zlnRQI/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1BE273DBBFC7F3409CF6EF33B75B0ECE@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: c5f04c58-af73-443a-620c-08dd533b9748
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Feb 2025 12:22:36.2236 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB7206
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

DQoNCj4gT24gMjIgRmViIDIwMjUsIGF0IDI6MzfigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPj4gDQo+PiBXaGF0IHBhZGRpbmcsIHBsZWFzZT8g
V2h5IFRDUCBVQVBJIGhlYWRlcnMgZG8gbm90IGhhdmUgdGhlc2UgYXR0cmlidXRlcz8NCj4+IFRo
aW5rIGFib3V0IGl0LCBhbmQgdGhpbmsgYWJvdXQgd2hhdCBhY3R1YWxseSBfX3BhY2tlZCBkb2Vz
IGFuZCBob3cgaXQgYWZmZWN0cw0KPj4gKGJhZGx5KSB0aGUgY29kZSBnZW5lcmF0aW9uLiBPdGhl
cndpc2UgaXQgbG9va3MgbGlrZSBhIGNhcmdvIGN1bHQuDQo+PiANCj4+PiBJIHRyaWVkIHJlbW92
aW5nIF9fcGFja2VkIGJ0dyBhbmQgZHJpdmVyIG5vIGxvbmdlciB3b3Jrcy4NCj4+IA0KPj4gU28s
IHlvdSBuZWVkIHRvIGZpbmQgYSBqdXN0aWZpY2F0aW9uIHdoeS4gQnV0IGRlZmluaXRlbHkgbm90
IGR1ZSB0byBwYWRkaW5nIGluDQo+PiBtYW55IG9mIHRoZW0uIFRoZXkgY2FuIGdvIHdpdGhvdXQg
X19wYWNrZWQgYXMgdGhleSBhcmUgbmF0dXJhbGx5IGFsaWduZWQuDQo+IA0KPiBBbHJpZ2h0LCBJ
IGRpZCBzb21lIGRlYnVnZ2luZywgYmFzaWNhbGx5IHByaW50ayBzaXplb2Yoc3RydWN0KS4gRGlk
IGl0IGZvciBib3RoIHBhY2tlZCBhbmQgdW5wYWNrZWQgd2l0aCB0aGUgZm9sbG93aW5nIHJlc3Vs
dHM6DQo+IA0KPiBGZWIgMjIgMTM6MDI6MDMgTWFjQm9vayBrZXJuZWw6IHNpemUgb2Ygc3RydWN0
IGFwcGxldGJkcm1fbXNnX3JlcXVlc3RfaGVhZGVyIGlzIDE2DQo+IEZlYiAyMiAxMzowMjowMyBN
YWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9tc2dfcmVxdWVzdF9oZWFk
ZXJfdW5wYWNrZWQgaXMgMTYNCj4gDQo+IEZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDog
c2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9tc2dfcmVzcG9uc2VfaGVhZGVyIGlzIDIwDQo+IEZl
YiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9t
c2dfcmVzcG9uc2VfaGVhZGVyX3VucGFja2VkIGlzIDIwDQo+IA0KPiBGZWIgMjIgMTM6MDI6MDMg
TWFjQm9vayBrZXJuZWw6IHNpemUgb2Ygc3RydWN0IGFwcGxldGJkcm1fbXNnX3NpbXBsZV9yZXF1
ZXN0IGlzIDMyDQo+IEZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1
Y3QgYXBwbGV0YmRybV9tc2dfc2ltcGxlX3JlcXVlc3RfdW5wYWNrZWQgaXMgMzINCj4gDQo+IEZl
YiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9t
c2dfaW5mb3JtYXRpb24gaXMgNjUNCj4gRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVsOiBz
aXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX21zZ19pbmZvcm1hdGlvbl91bnBhY2tlZCBpcyA2OA0K
PiANCj4gRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBhcHBs
ZXRiZHJtX2ZyYW1lIGlzIDEyDQo+IEZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6
ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9mcmFtZV91bnBhY2tlZCBpcyAxMg0KPiANCj4gRmViIDIy
IDEzOjAyOjAzIE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX2ZiX3Jl
cXVlc3RfZm9vdGVyIGlzIDgwDQo+IEZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6
ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9mYl9yZXF1ZXN0X2Zvb3Rlcl91bnBhY2tlZCBpcyA4MA0K
PiANCj4gRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVsOiBzaXplIG9mIHN0cnVjdCBhcHBs
ZXRiZHJtX2ZiX3JlcXVlc3QgaXMgNDgNCj4gRmViIDIyIDEzOjAyOjAzIE1hY0Jvb2sga2VybmVs
OiBzaXplIG9mIHN0cnVjdCBhcHBsZXRiZHJtX2ZiX3JlcXVlc3RfdW5wYWNrZWQgaXMgNDgNCj4g
DQo+IEZlYiAyMiAxMzowMjowMyBNYWNCb29rIGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0
YmRybV9mYl9yZXF1ZXN0X3Jlc3BvbnNlIGlzIDQwDQo+IEZlYiAyMiAxMzowMjowNCBNYWNCb29r
IGtlcm5lbDogc2l6ZSBvZiBzdHJ1Y3QgYXBwbGV0YmRybV9mYl9yZXF1ZXN0X3Jlc3BvbnNlX3Vu
cGFja2VkIGlzIDQwDQo+IA0KPiBTbywgdGhlIGRpZmZlcmVuY2UgaW4gc2l6ZW9mIGluIHVucGFj
a2VkIGFuZCBwYWNrZWQgaXMgb25seSBpbiBhcHBsZXRiZHJtX21zZ19pbmZvcm1hdGlvbi4gU28s
IEkga2VwdCB0aGlzIHBhY2tlZCwgYW5kIHJlbW92ZWQgaXQgZnJvbSBvdGhlcnMuIFRoZSBUb3Vj
aCBCYXIgc3RpbGwgd29ya3MuDQo+IA0KPiBTbyBtYXliZSBrZWVwIGp1c3QgdGhpcyBwYWNrZWQ/
DQoNCkFuZCBmb3IganVzdGlmaWNhdGlvbiB3aHkgZHJpdmVyIHdhcyBub3Qgd29ya2luZywgd2l0
aCBhcHBsZXRiZHJtX21zZ19pbmZvcm1hdGlvbiBub3QgcGFja2VkIGlzIGJlY2F1c2Ugc2l6ZW9m
KHN0cnVjdCBhcHBsZXRiZHJtX21zZ19pbmZvcm1hdGlvbikgaXMgYmVpbmcgdXNlZCBpbiBremFs
bG9jIGluIHRoZSBkcml2ZXIuIFNpbWlsYXIgaXMgdGhlIGNhc2UgZm9yIG1vc3Qgb3RoZXIgX19w
YWNrZWQgc3RydWN0cy4NCg0KTWF5YmUgdGhlIGF1dGhvciB3YW50ZWQgdG8ga2VlcCB0aGlzIHZh
bHVlIGNvbnNpc3RlbnQgYWNyb3NzIHZhcmlvdXMgY29tcGlsZXIgb3B0aW9ucz8gSSBkb27igJl0
IHRoaW5rIENQVSBhcmNoaXRlY3R1cmUgcmVhbGx5IG1hdHRlcnMgaGVyZSB0aG91Z2ggc2luY2Ug
dGhpcyBkcml2ZXIgaXMgZXhjbHVzaXZlbHkgZm9yIHg4Nl82NCBJbnRlbCBNYWNzLg0KDQoNCg==
