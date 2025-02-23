Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E03A40F62
	for <lists+dri-devel@lfdr.de>; Sun, 23 Feb 2025 16:16:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7956C10E00A;
	Sun, 23 Feb 2025 15:16:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="XQtbR2t8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011024.outbound.protection.outlook.com
 [52.103.67.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B51AF10E00A
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Feb 2025 15:16:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUGwouI+KGo4skCw2hA8REg4txjMR8IxHFwsCTFMB/LW6nk0AxMdMGR7rqpT7K74Hl0bELVVKBW/WwpKjVpAF2Hpp5EAktm02cmCvE9DKLUyAmkN2W3miXv7/zdAN0zktcT+F/Kkqav3aPedAqLdg7RrPzldCu3UxE6E3C/sRT/mpusx9kDn+0iZ/Uzp17KAAK2jf7obomgrUEsBQLUDDdI9JQwbjC0canXrht4b0SLOHtC4BVvCSXkqSafpAEhXP1cyV8zxnibYnw9lpev77oypdGe6O5g9N9R+y00zJTWflSPefvJ9KbQgBgRfAYLEl0UDyK/z57ZNHa7UPJcflQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xu9arIW8bbhlGMLvWwim4MRspISnIia4o0fkZVbx+5o=;
 b=x3JkT5voXooAJHLTxObY+rqXMdTygGHb5ii3FYy3h6u6acUKbBZVMqtn3RyHc0TdpTOflpIpJXBNoL7C6ZOsJnwrkonCfMmkzzqFwTSK9pPCOFSoFBCF/QzK+CHmS/OM8VmyeFeADEWLC0/6K5D1xrdAtrv/1r5Q3GoDWqiHX0n59Xpky5EfS5W/QItbJLJBANBYxgClJc/ONkIT5TH2p3IYsJpeTBZebIYC8NNzugShbETgTXiuRpXJmPWsw8+fV1ig6MRLu+3ZHZquCZ+ijBYv7fHntskIm1X2DzTCBIYJihcKgckz3LA5EoYdh8yCm1burxwqFpvFb9we4Iq1lg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xu9arIW8bbhlGMLvWwim4MRspISnIia4o0fkZVbx+5o=;
 b=XQtbR2t8QRXD5YV1if5WCTmZZjAk9t7jQYx36GXR7j+Y41jQkNxYB6akPScWNt4jE3U3s3/p3Y3SnU83hkuJ2rFFPK6ht9i4FwJRHDtqTBcB8qt4wwei5B7hmD3MVU9mEXjsoI3dLPPHHlvLg+7aAa13REzFkkAOjLaI/cg++3rdq5cg9kMIBDjX7E41IjcJJS4TFD8tRUOc6pOG5RTYT8G8yzXwe1uKMpnCN0KqWZj7NSbyYtp0zlcWAg8qR6FhAgTx6gAzoK7vU7HsXA33PBukuaibCRLawTx65yucibXZzffXsRTUWO+ty3xbx2MORXgYcpWEkWeAi3s9SgpzNg==
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:1d::9)
 by PN2PPF93A77929D.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c04:1::1bd) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Sun, 23 Feb
 2025 15:16:28 +0000
Received: from PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1]) by PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::27a3:3d7e:30be:e1d1%3]) with mapi id 15.20.8466.016; Sun, 23 Feb 2025
 15:16:28 +0000
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
Thread-Index: AQHbhgXp4bns/Ea3tU6BJjopRxJCcQ==
Date: Sun, 23 Feb 2025 15:16:28 +0000
Message-ID: <4DA18DF6-4C41-4D45-9DD4-B82E043B3320@live.com>
References: <16F819E8-E866-4552-BB08-31486D2BA8C5@live.com>
In-Reply-To: <16F819E8-E866-4552-BB08-31486D2BA8C5@live.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PNZPR01MB4478:EE_|PN2PPF93A77929D:EE_
x-ms-office365-filtering-correlation-id: 4256aa2d-d67a-42f7-1532-08dd541d0b84
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|461199028|8062599003|19110799003|15080799006|7092599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?RGdTbVpLK0VUdkRISmZWazNOQ2lGV0pIaWZqMitkMEhQSXF2dGQwL1pzZVJL?=
 =?utf-8?B?TURMZnVQSU41Sk9teUcyeUpvTkY0QjhCV1NPb0RlamthNVd5cGZsb0o3bkRG?=
 =?utf-8?B?K3k4ajRDdkhQWldaZEYvT3VIL2hrTExpS3NSN1UyeDlCNmt2Y1Z1SDlZK2ts?=
 =?utf-8?B?dlVqMEFsZVJRd3phbE45TWRHblJnOHJZNkpCaWpCamRCVkgwZG1nazhrN0VG?=
 =?utf-8?B?ZStKRFUrM2RTTiszbzd5cm55Zk5Ba2l4WUxHaUVOMGRHYWdNYlAvMGU2RUNx?=
 =?utf-8?B?dkR0LytkREVhRWJpRndQU21IWjcxSm1zYW9LQ3M2bVZMSk5TVXVOa25ZaHQy?=
 =?utf-8?B?WE04bldNNlgyQkFlYnZPc05pRmllVUttaGhoMUo4by94WXNOV1N0a0ZxTEFN?=
 =?utf-8?B?WWYzV2NITUJLejdFcDA3MHYwRlhPbFBIYVFKd2tYaFlhaWZGeFQyZWNjeHpH?=
 =?utf-8?B?cVpWOWxSRUZqclNVeFVoOGZYTjhYV2NYbk1ZVEVIdGRjRXFSdERSclRmNHh6?=
 =?utf-8?B?eXBSZFVmaGVGb1lvWG1lY2VGY3Zqc1Y1K1p2NTdJTEJaQnJCQit4RGxuQkxU?=
 =?utf-8?B?aXZnNFNMdVNUK2N5QzI0Z3M0VzBDVEk5d0JTY3pXd2NWbkN5ajExbEl5bUxm?=
 =?utf-8?B?UWIyMjBGdTR5OWpMc1N4S29QZDZjcDFNTVhwSlBYZXdWdmhxZUZsMjA2VG14?=
 =?utf-8?B?NVpVbXpPbnp6OXQvTUhYTkY0T1d1U2NRbE40V3ZPVEVHSUYzS3dKb1dZYU9r?=
 =?utf-8?B?TVdDc1VLb0RvK2ZLME9rR0l5bkZMbnA4M1hiQlV6TG5SdkJIcVpOZlFaZ1ZM?=
 =?utf-8?B?RE5nZ0l3SjFJZkt6VjRKTG5GSHREbE01T2JRbmhOMXhCWG1uNHpTYmVDaUtk?=
 =?utf-8?B?YWVEa3JyU1RONENVNHgxK0g0WWRYU1pnY28yMFlhdXNwdE9zTFI1djB4aUhR?=
 =?utf-8?B?akJqSlJYZThvYWJ5c0lpT0FFRUtpcS9pMHROVGNzTEdsMlBJWi9VVGxuMXFE?=
 =?utf-8?B?RFR2UXZIaksrbEppVUxBQkRTeW9pUklCa3E3ZGNheThFM1JENWVXWk5Hb2py?=
 =?utf-8?B?dWFYVDNSWGNYbE5Rb3pVN1pNRWRxN2xHNWZTMG9QYmM2dlpHVGI0TVhZNkdQ?=
 =?utf-8?B?QU41Slp5b3hGR2tUN0Y5SnAxbVBWRU51MklaR2FqR1R1MkJUQmRVUStoY1Jy?=
 =?utf-8?B?TTVPNjEzakt0NGhrRFhOOXM0NDhJMDc4TmVNZmh3aWVzVC9HNGFkMTlFdnBI?=
 =?utf-8?B?Q0l6K1JRd3U2YmI0Rm5oTVBVR3dSYlQxUGNkeWhQcFZsem5ReVQ0aEdXVGJZ?=
 =?utf-8?B?OG1sYmxJWHlFR1hVU1BzT0p1L3VyNUh3SnIvQ0hpNy9QVTVOR3E5cGc5T0N5?=
 =?utf-8?B?WmdYUUE4ZStKOFIxR2Q3SllzUHcrSmVBcVhPOXpFZGU0UE11OFlvQVkzR095?=
 =?utf-8?Q?HNTOEf75?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cjNLNDN0LytPb3BHZ2NaL0RhSi9ZUHJOQWhnZkNVMmZhZklxdHZQVU8zTkhk?=
 =?utf-8?B?RlZGNmNXOGE4SUwvTXJuSitLdzVjajI4TGl0bERRZ0lKOUxobVU1b01LQ05D?=
 =?utf-8?B?REdsRVFwUzBiYzVDN3dZOFlhR016WGZmNkhlV1JZdUFwdVczTTFaZkJmczU0?=
 =?utf-8?B?U3lWSDgrbUF5eFNCTTF2QjI0RmhTOWVYWStvRzhPaWtOejIyODhFWWRra2Vh?=
 =?utf-8?B?SUF1cmdtMEFYdlFFQTIrd3pWRUdMckZPMlAxNDVScFdScGFDdWJOSU9ySEhx?=
 =?utf-8?B?RkhCWWFkVzhIcEQvaXh1aXRucnUyeGdnVVcvYk5vTzllbFl6cWJkb1VjR2U1?=
 =?utf-8?B?bjQwNFdqNWczR1NIbE9rQVV0OG5oWnYyYlZnSks4b2xQc3dwQzFIRThPUHFk?=
 =?utf-8?B?eTFDcjM1NzdseEs0S1N5UCtKUWZTeFpWVWZTTWRhK2tTTHFKUjRUaXpIUFd5?=
 =?utf-8?B?MXhTRzdzNG1Kdys3Tk5XNVlLc0UxeVVLbzY5SXdIb05wWkRuWVFqdVN2S2Nx?=
 =?utf-8?B?YlR5Tllad0FmQTBPSE9Zb0cyeW9yeGpFWlV4SDRlajNBMmQ2QXplTlRGR3VM?=
 =?utf-8?B?K1luZjJiUzFrY2o2TWZVK2k1c2JuRlE0OTk0Vmo4djZHQWIyRjRVR3A5NGVa?=
 =?utf-8?B?MUxRMnJZNDM2ZWtNSGkzTGdoejF1N29JRFREVGxiWUFoZ29rY1laeTlOVHpZ?=
 =?utf-8?B?eWR0aVFvN01ONjYvOWdlRkdxZjBCR090NW1LUXN6TXUzdEpWaVBRaFh3c0Yr?=
 =?utf-8?B?Wkd2aTArZGZZa2QxL2tTUDVjbHhVMG1teTRaQ2Q0bFl1YzFGdHRNQ0Jac2M0?=
 =?utf-8?B?YVB4dDhhNUhEUDdEaXFIOFVORUUvUWtjM1FRWW9YSHNlTXBKTktnOWhtU2hH?=
 =?utf-8?B?Ynd2VVVPUnJ0L01aMzA0cWpXZ21PNk1oQUNQRkNUQXJ1SDhuMnBNTEhjV0lG?=
 =?utf-8?B?SUVoUXBwbGZydVFDZitWbjJEUnU4VGVoeDJUU1U1NUE4S3FGcWRBNU5XSmIv?=
 =?utf-8?B?Y1ZzTUFOMU80LytiQ0I4VW82Nmk4OE5FcEdFd3NXcHR6M0Joc25TMUNFTUNP?=
 =?utf-8?B?OWhGRnk2NXZjOCtieDRMRmhzYWMvQ1NZREdWUnhUZlRSZFJqYnB0b3N1U2p0?=
 =?utf-8?B?TUZHTFNIR2lsR1Z2MG1uM0NCY2kySHIxaGgyak9RKzJUblZ4RlloNERUb3Bs?=
 =?utf-8?B?cmRMOXVOaGYyUTlSR1dUUXZaVkZKbk5yem40SHpuZjFhTDdIVkJ0ZWh6VW1C?=
 =?utf-8?B?ZExxOFptb2MveGx5eVRud25xbTgrQmRSb1hCcmlpeWdqaVlwbTY1N0ZVQlY3?=
 =?utf-8?B?VGJ2bFkxS0NsNWhSWkNlaDlJZmVqUFZWYXlyaTU1MjVZRTUwSXZ2ZVUwTDJR?=
 =?utf-8?B?d1VvTytKbzBCWTUzbmsvdHZDaHcwd0VPMTU1dTUxZXo4K2kxbWNLUWxrM3dV?=
 =?utf-8?B?Y3E4NTlWcXQ0ZTl2Sit3MGlEYUJIS3F0b3dueUJnSmVPSmpZSDVNS1didGFP?=
 =?utf-8?B?cldWWTMwaGNFWW1FQWRWVHNiV3FVK1FxZUg1UHNOaS9aVEdHNWZiUU83bTIx?=
 =?utf-8?B?ZnFCTTA3bDVzUWd1czdSUlQ5Mnh1WGVpZGlqR1F1Z0lGR3ZIRHp1S2lNdVQ4?=
 =?utf-8?B?ZHlBMzExOXdtZjJVNE1aUVo4c3RnR21KVFl2cHdveFZxaVV1K25kMWNZOVpX?=
 =?utf-8?B?b1V5VmtOWDVwWTNoV1dIaWZnMXY2RE9HaU0rUVk3ZVVjc3dXTDRpVlptaUM0?=
 =?utf-8?Q?N8vRog2G2RWi4goP7kErPsxWyU0GBxdK3PtTaQA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <7C11C2226A5CBA40A2253355D4CE013E@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PNZPR01MB4478.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 4256aa2d-d67a-42f7-1532-08dd541d0b84
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2025 15:16:28.0391 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PPF93A77929D
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

DQo+IA0KPiBMb29raW5nIGF0IHRoZSBoZWFkZXIgZmlsZXMsIGl0IGxvb2tzIGxpa2UgZG9pbmcg
Y3B1X3RvX2xlMzIgb24gdGhhdCB2YXJpYWJsZSBhbmQgZG9pbmcgbGUzMl90b19jcHUgd2lsbCBh
Y3R1YWxseSByZXZlcnNlIHRoZSBvcmRlciB0d2ljZSwgb24gYmlnIGVuZGlhbiBzeXN0ZW1zLCB0
aHVzIHRlY2huaWNhbGx5IGFsbCB3YXkgd291bGQgbm90IHN3YXAgdGhlIG9yZGVyIGF0IGFsbC4N
Cj4gDQo+IEknbSBub3QgcmVhbGx5IHN1cmUgaG93IHRvIG1hbmFnZSB0aGUgc3BhcnNlIHdhcm5p
bmdzIGhlcmUuDQoNCg0KDQpOb3Qgc3VyZSB3aGV0aGVyIHRoZSBtYWludGFpbmVycyB3b3VsZCBs
aWtlIGl0LCBidXQgd2UgY2FuIGRvIHNvbWV0aGluZyBsaWtlIHRoaXM6DQoNCgljYXNlICds4oCZ
Og0KI2lmZGVmIF9fTElUVExFX0VORElBTg0KCQl2YWwgPSBvcmlnOw0KI2Vsc2UNCgkJb3JpZyA9
IHN3YWIzMihvcmlnKTsNCgkJdmFsID0gb3JpZzsNCiNlbmRpZg0KCQlicmVhazsNCg0KCWNhc2Ug
J2LigJk6DQojaWZkZWYgX19MSVRUTEVfRU5ESUFODQoJCW9yaWcgPSBzd2FiMzIob3JpZyk7DQoJ
CXZhbCA9IG9yaWc7DQojZWxzZQ0KCQl2YWwgPSBvcmlnOw0KI2VuZGlmDQoJCWJyZWFrOw==
