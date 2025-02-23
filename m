Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEC5A40CFD
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 07:39:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE1410E14E;
	Sun, 23 Feb 2025 06:39:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="ayHgedx3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011026.outbound.protection.outlook.com
 [52.103.68.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF28510E14E
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 06:39:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wFvXuZYNXuH91n8siMekVg12Zqt0eqE9tNjxzdmSdawrlrXmFKpq7pWOl9h60IN7fWumWFtG+Y6YzLB2rDMDLJWtg8o2r6gfZOElHhUGPa2Kd4iYq5OAnwPQq1juIA1Py9Lf4ywc2X/AUofr7rHfxUSepAoQffbzLP7FzmnHNsD228/B/q6lWvUUS238VkmRBpyvHnU6WfquDVSQcj3uLyiPV2v0THJEOhHLhVq5bCjHCsV3HyIu25tCkNUSAHZE3oZfZoTmJXXb5cKtpjH/Dw1O6ExKCZidoe0SvddOeXIRM+ai+RvLKBIQk6gwXGzHvT5PZrG/fv2iO8O63jTgDA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/P7mAuawznQafGh28ePspwCWQASlWI4AokL2ze/wK4=;
 b=xwsUe2mSGudZgyHKCgFUXl5DEVTL0zY2HozhGJgLZusvIRECBY/9ooKObJTlC89BHi0mbFttOdr9UUArtvnp4zb4VkZGnQcPbWtQnABuP0ZMvOOshVYIl5DAJf6+cY86A0hipw9WWPf6LnbEE1NFt3XXwfqwZCLV8VjOJJUto5iYCJMM1N/19Tvf5GU0W2zLmfjYVU3L9Kk9ZKKsQqaWq6On3+waqzCFGwRYB2xlxGtekuRrOH4Xj2COvFzuLDz/f8Kr6rDAznFGNP5YOtJSRVx1el3NmqxHvsDGbgP5F7REI9eWqcqQ00Kye96Kw04KwpX2VQ60XAkBQsO0m0fqaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/P7mAuawznQafGh28ePspwCWQASlWI4AokL2ze/wK4=;
 b=ayHgedx3UnwqmMfpMSyCixMrJ7lr63R1qkKp/9etsIYfYOAWuiTw/+O29Ww17Kyg99o5JIVdDXQdTLzUcHTYXxHQEC5hMIcRa9UW5rgWKyd7hGKGh9GDLRVxSl4ZKUfHcJVoEpYXGa0kTeX3OSUJcHXQmoHPtWe1H5CLyotiF5Bh5wPpgyOaQ+cHJ9uxyNkCAWZyIqM/Aiy9XWO0k24bq+QKpsd919xAb2wbFFQ05o6tPnDKjYI0S5lCFDOJRy7GETILiJCwyJWpou/oeU4Txe/G/IgpA6lwPi2ZO6Ae8+dlDC132uC7sIe95Jc4h0UnXNbqOgCD6pjvQtLo9MyY7A==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN2PR01MB9460.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:fc::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Sun, 23 Feb
 2025 06:39:15 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 06:39:15 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "pmladek@suse.com" <pmladek@suse.com>, "rostedt@goodmis.org"
 <rostedt@goodmis.org>, "linux@rasmusvillemoes.dk" <linux@rasmusvillemoes.dk>, 
 "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "corbet@lwn.net"
 <corbet@lwn.net>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>,
 "sumit.semwal@linaro.org" <sumit.semwal@linaro.org>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>, "kekrby@gmail.com"
 <kekrby@gmail.com>, "admin@kodeit.net" <admin@kodeit.net>, Orlando
 Chamberlain <orlandoch.dev@gmail.com>, "evepolonium@gmail.com"
 <evepolonium@gmail.com>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-media@vger.kernel.org"
 <linux-media@vger.kernel.org>, "linaro-mm-sig@lists.linaro.org"
 <linaro-mm-sig@lists.linaro.org>, Hector Martin <marcan@marcan.st>,
 "linux@armlinux.org.uk" <linux@armlinux.org.uk>, "asahi@lists.linux.dev"
 <asahi@lists.linux.dev>, Sven Peter <sven@svenpeter.dev>, Janne Grunau
 <j@jannau.net>
Subject: Re: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Topic: [PATCH v2 2/3] lib/vsprintf: Add support for generic FOURCCs by
 extending %p4cc
Thread-Index: AQHbhb2oZXL60dTmFEuvA12ugvDGuw==
Date: Sun, 23 Feb 2025 06:39:15 +0000
Message-ID: <PNZPR01MB4478E080F6EDAFC6C34A08A6B8C12@PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN2PR01MB9460:EE_
x-ms-office365-filtering-correlation-id: eec98cb1-5546-48b5-7f54-08dd53d4cae2
x-microsoft-antispam: BCL:0;
 ARA:14566002|19110799003|8062599003|5062599005|8060799006|15080799006|7092599003|6072599003|461199028|3412199025|440099028|41001999003|102099032|4295299021;
x-microsoft-antispam-message-info: =?utf-8?B?Q01yOXBkaTcyMDdrM1VIcEI4TWY5VmFOQWhIbm50VEZFb25HMUZaOHNBYlR3?=
 =?utf-8?B?bjZSNDlpd1BBOFFjays3ZzRRanBnNUhMWmN3VXN5aHI1VkJ3a2FzaFJrUWVq?=
 =?utf-8?B?YjNEN2xDTkF1MDNmNW4xRVRHKzRnM0Q5UE1VaHgvNXZCRnJ3MnlpcWhTL3RG?=
 =?utf-8?B?N2VyNGFVTHZNeWZUdjJyWVYyU2l4WjFFM1B0bG4rSU15S2hOSFozb05Db2dR?=
 =?utf-8?B?a1QwV1BJY0NFL1Z1Qm5lZ2tDaDk2WFg1bmFTeXJybU1ibkxJQnBVVTdaMTFt?=
 =?utf-8?B?U0d1UjM5VnA2SGg5UkdQS0R4cFk1MHBSaVRvSnpUbzhMZDZtY2hwOUlCNWkv?=
 =?utf-8?B?TFRlNHVsZjluMWR5ZVBUTUlUT1ZPNVRwRjJnUjRlTlZFQ3duN2JRdVEyeGdQ?=
 =?utf-8?B?Y2N4aDBuN2xFUXB3UUdqVE9kWTZVeXZLdHhXYm1nSGVQR2FBMFA4dGNuME9z?=
 =?utf-8?B?Vjl6U0plZXZnSTZOYWxiajBwUTZIaG4xZ1ZYYk96SERhdzNrNmE3ME9xQzYr?=
 =?utf-8?B?cEhkVWtEVU1jaktyUHZUUlBtVmJ6ekJJbFhDdFViS0FTWnZJb0d1SXFwTk9r?=
 =?utf-8?B?NFQrMTk2RU9qWElPdXU2TlVaTUFUWEVVSGlCaThPNTJhOWdPVG1pMjFvNk80?=
 =?utf-8?B?dXdaRkg2aUVlU21aWkJmUEZiaHYwdFUxRG0zaDQ3dlRjVkhwdFJuYk5UdmRs?=
 =?utf-8?B?WVlpWkhyYjNYVGUyQ2ZtZGh3Qi9yNEhhaFhQL0Y2QW5tSG94ZmpzUllqSUJm?=
 =?utf-8?B?WGFWZUZCaTdGSS9nMDNmYk4xR3RJSEMyNDVFVFhKdzhlU0Nsd3lKNGpHUW9y?=
 =?utf-8?B?eENmT3RWYmFvVndGMjcwczFQOUdyazhwSWZ4UnNzejB1WmtHVmQzQ3ZPVjFS?=
 =?utf-8?B?QnVTVVBmV203Rm0yNWhJdEVLMjVmNEFueUYvZ0tKN2dKRE0vckNiRUljWXg4?=
 =?utf-8?B?R0F2YmJ2cVpVdHZsS3VIM3hMZVoxL1dzeFVXcWxRVUR6eklObHEzcWg1T2Nt?=
 =?utf-8?B?cDNiQXd0QkZTdkx6Y0gwVGRoc1dCeSs4TElqNUdHV0VPMWdVcUswYU9JZjM3?=
 =?utf-8?B?VU5iZ3FKa3hWNUZhYU5BdTdUaWE1WEhxZWRaSEZTdUdrTkZBNUNCbGR0ci8r?=
 =?utf-8?B?aHY2NUM5ajQwdlFkbWlnMCs1aUFuYWNkVkEyTVVPYzdjUnc2NU9sc0xCcVhD?=
 =?utf-8?B?V0xZMjlxRmx1S3MzUy90eVhwbFpKbzFRTU1SbkJRNGFMWmZRdCsrVDczekRQ?=
 =?utf-8?B?S1Fta0hRWjFPaTFPZjF1Rm9lOHlSaTlSZExKSmZwa0VTaEdtdDM4ZDNxaU94?=
 =?utf-8?B?TG5BakJZVjM2aXVWMnZDb2YzU0N3Y244Uy9uT2JxTDFGRXAxMHFxM28vWXFj?=
 =?utf-8?B?T2JzVG9aMFZ6NlNhak04cm9TdkwvUVAwbmRIa3dXV3Y5a0puZVdlUzdXM1Bh?=
 =?utf-8?B?Y01MZTZPZTdrZVk5azk5MVNzaUdOTGVkc0xMNnlpZmZ0NkptaHhKbEkyNWhP?=
 =?utf-8?B?RVhvQmVhS3Foa2VOenY5MFNaaG5BMTRGU2ljcTJHN0lGb0JNK1FDZmFVV2Rs?=
 =?utf-8?Q?c/vv/G5dyC7s6G2vSfpIWCE78=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YnNLb1UySEsvVWxXakl6VTBiZUZ4elQrUldvVi9xdWJaa2xxbUpPOERHeVZa?=
 =?utf-8?B?UzZPa1JTWHhNN1dyLzdxN1JybXR6ek9PVUhleURUdmtrUTYvWGlQN3c5dmNI?=
 =?utf-8?B?dXhZcElJWGE5d1V5UEl1SDZqcGd1UFYvOWhpeE80UEdRU0h1a0o4R0VaWk0x?=
 =?utf-8?B?UmxkdTVFVHdMWmFNRlFpOTd3TncxRjZtQ2NQTXJVaGlPZXh5ZklUaW5GcXJJ?=
 =?utf-8?B?NWFuR0ViZ3J3bGI0V1QzVGQyYU5SeG5zYkYwQmJySmNmdUlLaG5rMlU0ZjBN?=
 =?utf-8?B?YXNNSENMWDhhRHcvL0J6MzhrUmJIdnNuMlJMYkYwZ28zalpTUkpWSFB2V2RU?=
 =?utf-8?B?ZERET2FVbXFnRlhwbjBtOHR3aEJNZjIvcHVZY1o4RlRVaUFLOEMwNkhuNGQ4?=
 =?utf-8?B?bXhxNXFRR0ZlTlVIRExsam9zUldMdFB0Q3pSQnhhMFRHMEN3S2M0OExNOTh1?=
 =?utf-8?B?eDVjZElEWmErVU5iSkpLL0lMWkRKay9CSjEzRGRPeWNHdDlaOFVYT3hodVNC?=
 =?utf-8?B?UlF3UzlNUmg2MXYzVjRRdW9WVnY1MGYyMXVsUWZhZUJSM2MyNkptQ0ZjM3FY?=
 =?utf-8?B?aS9jZFBNK1N0NUE0Q1Y2RnFLUnZ3NmdrSnNvNm9iWHpSS2NGTWFpRGVXdE04?=
 =?utf-8?B?UGdWazJIWC9pR2lFK1RGM0RGbmtCK0NORUJVVUxZQkdkNEMrZzMzQUhsOTBB?=
 =?utf-8?B?cjF1U3U3blVWRzhHZ2VSRWdMSW1sUks0OVduZDZXdWZDTEQ2QVFEMVpMeFBa?=
 =?utf-8?B?Zjg2MmQ3bldkN2FuWTZjMVJzV1craUpZUFJLb0M5U0ZZUWY3K3JGVzNhbzFt?=
 =?utf-8?B?SWFtTW5rN25WbkFkWENuQUh3UjlVQVN6UEVKWkUzeDhIckczeUgyWklDMlFj?=
 =?utf-8?B?SGVRam5HOWRIUDFVQko4Rm9JdTg4Q1hLZzBtcU5OT3BFZFYxZ2JNNDI2QVNS?=
 =?utf-8?B?VWk5SklManFMaDdFNGpmMkp3VlpKcUxtbm9KaUVocVA0UU1qUlNweFI0ZEQ4?=
 =?utf-8?B?cGh1N082YW1zaGZzejNmYW16T3ZhSHRmcnhjZGNOUS9NNS9xM01XZnc3MDc1?=
 =?utf-8?B?RC9xSDB1eW1leEJ2NTlWR0xwWHBscFJTMVZkZkFOU1RFUHIxbVp0Vnpsa2lp?=
 =?utf-8?B?SXZ4TEtOUTcydWpoMk5KekRxUjQyMzMzV3UwcUg3cGhHVC9LL1podCt6NHdR?=
 =?utf-8?B?aUNHZHRyU292SGJLZURGU3JKWk9zSDBpbVRoN1RDZFVpUXRyTDhxY25BZjRy?=
 =?utf-8?B?aXVoRFpNeDBHR2dOTENQMVhGakdUOExodk10bmU4SXVZb3B3TnBFUXRoQlh3?=
 =?utf-8?B?dkV6QVJQMlhUMEhmVXdwOGZOWU5QUHFvREozWlM4d1gzQ0pWKzdNSU1QeGN1?=
 =?utf-8?B?cXVHcTJvaFV5c3lRUi9URkU0UHZVUGRtS2VuOG1FOEhIUEsxQ0R5SnJDcXZN?=
 =?utf-8?B?amlIUEN4NWlUeFRsMDFxUy9Pd2ZYeEVGWWpXZEUybUtDc0hCZGdHSmJHdHVE?=
 =?utf-8?B?dTBGdlVwUmlPN0xwRUZOZ3c0ZE5rRFBoUjBtY2h1cjhZMWUwVWx4aFNxWVkw?=
 =?utf-8?B?V1BDUUh2RDFEV0F1RjRsY1NRWDB6ZlFldjljZ1Z6SlZOakpkaHRrWGY4cWRn?=
 =?utf-8?Q?6nkaMC95Y0GYNjlmrQY8w99WXsM/DpaTvCFtUOHg2XKg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <F45F4480E258F94DA9C71DBBDA31EF9B@sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: eec98cb1-5546-48b5-7f54-08dd53d4cae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2025 06:39:15.8197 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB9460
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

DQoNCj4gT24gMjIgRmViIDIwMjUsIGF0IDU6NDHigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0
eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+IA0KPiDvu78NCj4gDQo+PiBPbiAyMSBGZWIgMjAyNSwg
YXQgODo1N+KAr1BNLCBhbmRyaXkuc2hldmNoZW5rb0BsaW51eC5pbnRlbC5jb20gd3JvdGU6DQo+
Pj4gT24gVGh1LCBGZWIgMjAsIDIwMjUgYXQgMDQ6Mzk6MjNQTSArMDAwMCwgQWRpdHlhIEdhcmcg
d3JvdGU6DQo+Pj4gRnJvbTogSGVjdG9yIE1hcnRpbiA8bWFyY2FuQG1hcmNhbi5zdD4NCj4+PiAl
cDRjYyBpcyBkZXNpZ25lZCBmb3IgRFJNL1Y0TDIgRk9VUkNDcyB3aXRoIHRoZWlyIHNwZWNpZmlj
IHF1aXJrcywgYnV0DQo+Pj4gaXQncyB1c2VmdWwgdG8gYmUgYWJsZSB0byBwcmludCBnZW5lcmlj
IDQtY2hhcmFjdGVyIGNvZGVzIGZvcm1hdHRlZCBhcw0KPj4+IGFuIGludGVnZXIuIEV4dGVuZCBp
dCB0byBhZGQgZm9ybWF0IHNwZWNpZmllcnMgZm9yIHByaW50aW5nIGdlbmVyaWMNCj4+PiAzMi1i
aXQgRk9VUkNDcyB3aXRoIHZhcmlvdXMgZW5kaWFuIHNlbWFudGljczoNCj4+PiAlcDRjaCAgIEhv
c3QtZW5kaWFuDQo+Pj4gJXA0Y2wgTGl0dGxlLWVuZGlhbg0KPj4+ICVwNGNiIEJpZy1lbmRpYW4N
Cj4+PiAlcDRjciBSZXZlcnNlLWVuZGlhbg0KPj4+IFRoZSBlbmRpYW5uZXNzIGRldGVybWluZXMg
aG93IGJ5dGVzIGFyZSBpbnRlcnByZXRlZCBhcyBhIHUzMiwgYW5kIHRoZQ0KPj4+IEZPVVJDQyBp
cyB0aGVuIGFsd2F5cyBwcmludGVkIE1TQnl0ZS1maXJzdCAodGhpcyBpcyB0aGUgb3Bwb3NpdGUg
b2YNCj4+PiBWNEwvRFJNIEZPVVJDQ3MpLiBUaGlzIGNvdmVycyBtb3N0IHByYWN0aWNhbCBjYXNl
cywgZS5nLiAlcDRjciB3b3VsZA0KPj4+IGFsbG93IHByaW50aW5nIExTQnl0ZS1maXJzdCBGT1VS
Q0NzIHN0b3JlZCBpbiBob3N0IGVuZGlhbiBvcmRlcg0KPj4+IChvdGhlciB0aGFuIHRoZSBoZXgg
Zm9ybSBiZWluZyBpbiBjaGFyYWN0ZXIgb3JkZXIsIG5vdCB0aGUgaW50ZWdlcg0KPj4+IHZhbHVl
KS4NCj4+IC4uLg0KPj4+IG9yaWcgPSBnZXRfdW5hbGlnbmVkKGZvdXJjYyk7DQo+Pj4gLSB2YWwg
PSBvcmlnICYgfkJJVCgzMSk7DQo+Pj4gKyBzd2l0Y2ggKGZtdFsyXSkgew0KPj4+ICsgY2FzZSAn
aCc6DQo+Pj4gKyB2YWwgPSBvcmlnOw0KPj4+ICsgYnJlYWs7DQo+Pj4gKyBjYXNlICdyJzoNCj4+
PiArIG9yaWcgPSBzd2FiMzIob3JpZyk7DQo+Pj4gKyB2YWwgPSBvcmlnOw0KPj4+ICsgYnJlYWs7
DQo+Pj4gKyBjYXNlICdsJzoNCj4+PiArIG9yaWcgPSBsZTMyX3RvX2NwdShvcmlnKTsNCj4+PiAr
IHZhbCA9IG9yaWc7DQo+Pj4gKyBicmVhazsNCj4+PiArIGNhc2UgJ2InOg0KPj4+ICsgb3JpZyA9
IGJlMzJfdG9fY3B1KG9yaWcpOw0KPj4gSSBkbyBub3Qgc2VlIHRoYXQgb3JpZyBpcyBhIHVuaW9u
IG9mIGRpZmZlcmVudCB0eXBlcy4gSGF2ZSB5b3UgcnVuIHNwYXJzZT8NCj4+IEl0IHdpbGwgZGVm
aW5pdGVseSBjb21wbGFpbiBvbiB0aGlzIGNvZGUuDQo+IA0KPiBBZnRlciBtZXNzaW5nIGFyb3Vu
ZCB3aXRoIHRoaXMsIHdoYXQgSeKAmXZlIG5vdGljZWQgaXMgdGhhdCBvcmlnIGFuZCB2YWwgdXNl
ZCBpbiB0aGlzIHN0cnVjdCBzaG91bGQgYmUgdTMyLiBOb3cgaW4gY2FzZSBvZiBsaXR0bGUgZW5k
aWFuIGFuZCBiaWcgZW5kaWFuLCB0aGF0IHRoaW5ncyBhcmUgbWVzc3kuIFRoZSBvcmlnaW5hbCBj
b2RlIGJ5IEhlY3RvciB3YXMgdXNpbmcgbGUzMl90b19jcHUgb24gb3JpZywgd2hpY2ggaXRzZWxm
IGlzIGRlY2xhcmVkIGFzIGEgdTMyIGhlcmUgKG1heWJlIHdhcyBkb25lIHdpdGggdGhlIGludGVu
dGlvbiB0byBjb252ZXJ0IGxlMzIgb3JpZyB0byB1MzIgb3JpZz8pLg0KPiANCj4gQW55d2F5cywg
d2hhdCBJIGhhdmUgZG9uZSBpcyB0aGF0Og0KPiANCj4gMS4gRGVjbGFyZSBuZXcgdmFyaWFibGUs
IG9yaWdfbGUgd2hpY2ggaXMgX19sZTMyLg0KPiAyLiBJbnN0ZWFkIG9mIGRvaW5nIG9yaWcgPSBs
ZTMyX3RvX2NwdShvcmlnKTsgLCB3ZSBjYW4gZG8gb3JpZ19sZSA9IGNwdV90b19sZTMyKG9yaWcp
LiBUaGlzIGZpeGVzIHRoZSBzcGFyc2Ugd2FybmluZzogY2FzdCB0byByZXN0cmljdGVkIF9fbGUz
Mg0KPiAzLiBOb3cgdGhlIG9yaWdpbmFsIGNvZGUgd2FzIGludGVuZGluZyB0byB1c2UgdmFsPW9y
aWc9bGUzMl90b19jcHUob3JpZykgYXQgdGhlIGJvdHRvbSBwYXJ0IG9mIHRoaXMgc3RydWN0LiBU
aG9zZSBwYXJ0cyBhbHNvIHJlcXVpcmUgdmFsIGFuZCBvcmlnIHRvIGJlIHUzMi4gRm9yIHRoYXQs
IHdlIGFyZSBub3cgdXNpbmcgbGUzMl90b19jcHUob3JpZ19sZSkuIFNpbmNlIHZhbCBpcyBzYW1l
IGFzIG9yaWcsIGluIGNhc2UgdGhlc2UgY2FzZXMsIGluc3RlYWQgb2YgbWFraW5nIGEgdmFsX2xl
LCBJ4oCZdmUgc2ltcGx5IHVzZWQgb3JpZ19sZSB0aGVyZSBhcyB3ZWxsLg0KPiANCj4gU2ltaWxh
ciBjaGFuZ2VzIGRvbmUgZm9yIGJpZyBlbmRpYW4uDQo+IA0KPiBTbywgdGhlIHN0cnVjdCBsb29r
cyBsaWtlIHRoaXMgbm93Og0KPiANCj4gc3RhdGljIG5vaW5saW5lX2Zvcl9zdGFjaw0KPiBjaGFy
ICpmb3VyY2Nfc3RyaW5nKGNoYXIgKmJ1ZiwgY2hhciAqZW5kLCBjb25zdCB1MzIgKmZvdXJjYywN
Cj4gICAgICAgICAgIHN0cnVjdCBwcmludGZfc3BlYyBzcGVjLCBjb25zdCBjaGFyICpmbXQpDQo+
IHsNCj4gICBjaGFyIG91dHB1dFtzaXplb2YoIjAxMjMgbGl0dGxlLWVuZGlhbiAoMHgwMTIzNDU2
NykiKV07DQo+ICAgY2hhciAqcCA9IG91dHB1dDsNCj4gICB1bnNpZ25lZCBpbnQgaTsNCj4gICB1
bnNpZ25lZCBjaGFyIGM7DQo+ICAgYm9vbCBwaXhlbF9mbXQgPSBmYWxzZTsNCj4gICB1MzIgb3Jp
ZywgdmFsOw0KPiAgIF9fbGUzMiBvcmlnX2xlOw0KPiAgIF9fYmUzMiBvcmlnX2JlOw0KPiANCj4g
ICBpZiAoZm10WzFdICE9ICdjJykNCj4gICAgICAgcmV0dXJuIGVycm9yX3N0cmluZyhidWYsIGVu
ZCwgIiglcDQ/KSIsIHNwZWMpOw0KPiANCj4gICBpZiAoY2hlY2tfcG9pbnRlcigmYnVmLCBlbmQs
IGZvdXJjYywgc3BlYykpDQo+ICAgICAgIHJldHVybiBidWY7DQo+IA0KPiAgIG9yaWcgPSBnZXRf
dW5hbGlnbmVkKGZvdXJjYyk7DQo+ICAgc3dpdGNoIChmbXRbMl0pIHsNCj4gICBjYXNlICdoJzoN
Cj4gICAgICAgdmFsID0gb3JpZzsNCj4gICAgICAgYnJlYWs7DQo+ICAgY2FzZSAncic6DQo+ICAg
ICAgIG9yaWcgPSBzd2FiMzIob3JpZyk7DQo+ICAgICAgIHZhbCA9IG9yaWc7DQo+ICAgICAgIGJy
ZWFrOw0KPiAgIGNhc2UgJ2wnOg0KPiAgICAgICBvcmlnX2xlID0gY3B1X3RvX2xlMzIob3JpZyk7
DQo+ICAgICAgIGJyZWFrOw0KPiAgIGNhc2UgJ2InOg0KPiAgICAgICBvcmlnX2JlID0gY3B1X3Rv
X2JlMzIob3JpZyk7DQo+ICAgICAgIGJyZWFrOw0KPiAgIGNhc2UgJ2MnOg0KPiAgICAgICAvKiBQ
aXhlbCBmb3JtYXRzIGFyZSBwcmludGVkIExTQi1maXJzdCAqLw0KPiAgICAgICB2YWwgPSBzd2Fi
MzIob3JpZyAmIH5CSVQoMzEpKTsNCj4gICAgICAgcGl4ZWxfZm10ID0gdHJ1ZTsNCj4gICAgICAg
YnJlYWs7DQo+ICAgZGVmYXVsdDoNCj4gICAgICAgcmV0dXJuIGVycm9yX3N0cmluZyhidWYsIGVu
ZCwgIiglcDQ/KSIsIHNwZWMpOw0KPiAgIH0NCj4gDQo+ICAgZm9yIChpID0gMDsgaSA8IHNpemVv
Zih1MzIpOyBpKyspIHsNCj4gICAgICAgc3dpdGNoIChmbXRbMl0pIHsNCj4gICAgICAgY2FzZSAn
aCc6DQo+ICAgICAgIGNhc2UgJ3InOg0KPiAgICAgICBjYXNlICdjJzoNCj4gICAgICAgICAgIGMg
PSB2YWwgPj4gKCgzIC0gaSkgKiA4KTsNCj4gICAgICAgICAgIGJyZWFrOw0KPiAgICAgICBjYXNl
ICdsJzoNCj4gICAgICAgICAgIGMgPSBsZTMyX3RvX2NwdShvcmlnX2xlKSA+PiAoKDMgLSBpKSAq
IDgpOw0KPiAgICAgICAgICAgYnJlYWs7DQo+ICAgICAgIGNhc2UgJ2InOg0KPiAgICAgICAgICAg
YyA9IGJlMzJfdG9fY3B1KG9yaWdfYmUpID4+ICgoMyAtIGkpICogOCk7DQo+ICAgICAgICAgICBi
cmVhazsNCj4gICAgICAgfQ0KPiANCj4gICAgICAgLyogUHJpbnQgbm9uLWNvbnRyb2wgQVNDSUkg
Y2hhcmFjdGVycyBhcy1pcywgZG90IG90aGVyd2lzZSAqLw0KPiAgICAgICAqcCsrID0gaXNhc2Np
aShjKSAmJiBpc3ByaW50KGMpID8gYyA6ICcuJzsNCj4gICB9DQo+IA0KPiAgIGlmIChwaXhlbF9m
bXQpIHsNCj4gICAgICAgKnArKyA9ICcgJzsNCj4gICAgICAgc3RyY3B5KHAsIG9yaWcgJiBCSVQo
MzEpID8gImJpZy1lbmRpYW4iIDogImxpdHRsZS1lbmRpYW4iKTsNCj4gICAgICAgcCArPSBzdHJs
ZW4ocCk7DQo+ICAgfQ0KPiANCj4gICAqcCsrID0gJyAnOw0KPiAgICpwKysgPSAnKCc7DQo+IA0K
PiAgIHN3aXRjaCAoZm10WzJdKSB7DQo+ICAgY2FzZSAnaCc6DQo+ICAgY2FzZSAncic6DQo+ICAg
Y2FzZSAnYyc6DQo+ICAgICAgIHAgPSBzcGVjaWFsX2hleF9udW1iZXIocCwgb3V0cHV0ICsgc2l6
ZW9mKG91dHB1dCkgLSAyLCBvcmlnLCBzaXplb2YodTMyKSk7DQo+ICAgICAgIGJyZWFrOw0KPiAg
IGNhc2UgJ2wnOg0KPiAgICAgICBwID0gc3BlY2lhbF9oZXhfbnVtYmVyKHAsIG91dHB1dCArIHNp
emVvZihvdXRwdXQpIC0gMiwgbGUzMl90b19jcHUob3JpZ19sZSksIHNpemVvZih1MzIpKTsNCj4g
ICAgICAgYnJlYWs7DQo+ICAgY2FzZSAnYic6DQo+ICAgICAgIHAgPSBzcGVjaWFsX2hleF9udW1i
ZXIocCwgb3V0cHV0ICsgc2l6ZW9mKG91dHB1dCkgLSAyLCBiZTMyX3RvX2NwdShvcmlnX2JlKSwg
c2l6ZW9mKHUzMikpOw0KPiAgICAgICBicmVhazsNCj4gICB9DQo+IA0KPiAgICpwKysgPSAnKSc7
DQo+ICAgKnAgPSAnXDAnOw0KPiANCj4gICByZXR1cm4gc3RyaW5nKGJ1ZiwgZW5kLCBvdXRwdXQs
IHNwZWMpOw0KPiB9DQo+IA0KPiBBbmR5LCBjb3VsZCB5b3UgdmVyaWZ5IHRoaXM/DQoNCkxvb2tp
bmcgYXQgdGhlIGhlYWRlciBmaWxlcywgaXQgbG9va3MgbGlrZSBkb2luZyBjcHVfdG9fbGUzMiBv
biB0aGF0IHZhcmlhYmxlIGFuZCBkb2luZyBsZTMyX3RvX2NwdSB3aWxsIGFjdHVhbGx5IHJldmVy
c2UgdGhlIG9yZGVyIHR3aWNlLCBvbiBiaWcgZW5kaWFuIHN5c3RlbXMsIHRodXMgdGVjaG5pY2Fs
bHkgYWxsIHdheSB3b3VsZCBub3Qgc3dhcCB0aGUgb3JkZXIgYXQgYWxsLg0KDQpJJ20gbm90IHJl
YWxseSBzdXJlIGhvdyB0byBtYW5hZ2UgdGhlIHNwYXJzZSB3YXJuaW5ncyBoZXJlLg==
