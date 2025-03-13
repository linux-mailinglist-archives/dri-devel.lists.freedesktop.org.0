Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B39FA5ECFB
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 08:26:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4744D10E1FF;
	Thu, 13 Mar 2025 07:26:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="OfmGm+EC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010015.outbound.protection.outlook.com
 [52.103.67.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96EE910E201
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 07:26:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FgLsRBXS5MI+FfSzp1IDZgMvqLD1+2Bpxynfc7E7lByfFxkBa74fIZLfEu8LoNpcTzqPg4jsg1ofzzIOmkII9ZldsQ4HBD1ggRMlNFyCDo4FFGZGUGqfzSSZGUzAZ/ln2BBhzQ5xCCKYdB4DwScKAcFatEfBXFj1u25zbsgzrYOZTCM2LV+LvNZL//O5Wzxdo9zSYcSXGtndKLWgUpAX3hwBsZB6AKCAh3hVzdhngxEU3ZOvaz5bEGFT5t25Jk+s6gr9fz/sx3gOynmgeIxq/gOP/MYUHng8vkDrFSuepnDrHXedq8L4/YBmQijVAH2c83GVN4p3oxa/ox6j86FbRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZQ9pT7fqWZVFnbUw45tIIhw4Ktfr0ZrBBV4T2BBcrM0=;
 b=ZYbb6xG6QpmpPdHo1mj1f4Nfer3YsH9ZA0cLTRYURMSSNIeVytaee3BE612w93FGW0j9lsl1y4q+TuWp+UxlWp4Nj2y++cCk0mivOMSXpeUJDj1g18y0LsmTrCp98GUnfaSQh3HSKqgiS9qLGGcgsVV3awdXLIs0aNXaoM9HNqnGbyc6JThkopVzecb2FEtLdXOCIaDSkp5JUw+F0Mikj1ZIc/uANNCbo+ucqelGFS1CaiSZzZGNY8cIQerWjhOK7cCU54lqbzjSazmACcxcq7a+yzIpcPXqOUjfghfliI7kHUI8i4dKdZdtlNcDhkCMo/EM22rlbjk9b6I18/wgWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZQ9pT7fqWZVFnbUw45tIIhw4Ktfr0ZrBBV4T2BBcrM0=;
 b=OfmGm+ECc3bfd/yVP5CDwmX1gdCZEGBY1TuDLsg82Ajh9z0foxnZZjoV6C+EYyFKZQdadF5A5GV3boCO4Zrt7ZOh6I82ElteqYx/Z13I4F79xMiI6osExjx3HaJDfN4tuSpHmarseuQC6hFTs9QgNbcHmPCVotgGPbu3+rxvjrjl/G0X8P4Zr/87mJpkgzWduRjk7qHekUmHWWfPDs/xHxW8lcVCX5wEeuOjbAMh/raqPLzZKRFFrt11Bkth8hFgEpw8vGcg/g/qhDypRjqXfQy1PDwdHbSgV7yujijnUIcY1zEmQijAkBhNoBLECk4+5VRufwYKk+fGZcoOBT3/fA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN2PR01MB4137.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:14::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.27; Thu, 13 Mar
 2025 07:26:05 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8534.025; Thu, 13 Mar 2025
 07:26:05 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard <mripard@kernel.org>,
 "airlied@redhat.com" <airlied@redhat.com>, Simona Vetter <simona@ffwll.ch>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "apw@canonical.com"
 <apw@canonical.com>, "joe@perches.com" <joe@perches.com>,
 "dwaipayanray1@gmail.com" <dwaipayanray1@gmail.com>,
 "lukas.bulwahn@gmail.com" <lukas.bulwahn@gmail.com>, Linux Kernel Mailing
 List <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-doc@vger.kernel.org"
 <linux-doc@vger.kernel.org>, Hector Martin <marcan@marcan.st>,
 "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Topic: [PATCH 1/2] lib/vsprintf: Add support for generic FourCCs by
 extending %p4cc
Thread-Index: AQHbky3sGKkFjHx1MkmFN9rVUAvYHLNvYl0AgAAA5jqAAAKdAIAAAT1vgAA66ACAAD2b+IAAA9kAgADIeYA=
Date: Thu, 13 Mar 2025 07:26:05 +0000
Message-ID: <47AE7FCD-0F30-4379-ADE9-090A15ACD58F@live.com>
References: <ABAEA9D0-97CB-4ADD-9606-A12D5815335A@live.com>
 <376C9BD3-2F41-4511-BE52-1B8468FE2CB3@live.com>
 <b74df4b5-ecda-45ba-a98a-c84b0a29e380@suse.de>
 <PN3PR01MB9597AC6A02B0BF873920D94CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <9092a9ed-aecf-40bd-9d15-b53d60d035b5@suse.de>
 <PN3PR01MB959715C19BCEA54426D24934B8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <ff3a9c58-5c7a-4c48-8a9e-cc828a43baed@app.fastmail.com>
 <PN3PR01MB9597E5C609290DB1A967263CB8D02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z9HgVn-XELC065w0@smile.fi.intel.com>
In-Reply-To: <Z9HgVn-XELC065w0@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN2PR01MB4137:EE_
x-ms-office365-filtering-correlation-id: ed82fe2a-3f42-4b7d-47fb-08dd620050cd
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|461199028|8060799006|19110799003|15080799006|7092599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?MURWZTdkbW9sMjdLZGQ0dCs2WUlZOHl1bSt0N2kvWkNsUU96c2dkeXAveGx1?=
 =?utf-8?B?Yi9lY3VPZDFsNnV5bEh1d1dvcEZtVzJTVDRKVnNpWmRZVW9MNHluT2pSSVVs?=
 =?utf-8?B?VUNDakJ6MWRsR1ZVck9oY3piaTMyOEhib3ljdGMwQ1dFbXdGVnlrVG1iT2cw?=
 =?utf-8?B?VUFZbklWRjhqSWNzdEEzUi93OFR5anAyaWs5a1htTGJMcnJTcUlhM0RvbDNk?=
 =?utf-8?B?SjVXRnlKcDlOdWtuUnpkb0Z4MDZJMmc5OUFkN0xIYU9KUkFVZjFKbTliM0JY?=
 =?utf-8?B?Zk1mWUJ5MUtQN0JYUC9OWVdsSEEwRkZ2bEVSb2dQTmtSRWdxRUJWb3VHaVFY?=
 =?utf-8?B?L0dESTVnMHVnR1FwM0MycVlYQ2N5T0lNUDdOUHVmZ2tTdmNUTE16NGpOT20v?=
 =?utf-8?B?OEFHZTdrTmpPTWZWTXMxVTVxWG15NlY3OXV1MFpxQzgvb3RHZnF0T2wzQ0lU?=
 =?utf-8?B?aWlvaTRMcVQ2aDl6Yk5YVDhmUXZCcjdaL1kxWHN0MGtNNVFvT04rOHRiakFq?=
 =?utf-8?B?NkNkSyt3QSt4bEpVOHQwNktHL0svWEt1NWRjZVVPSFh1dmg4UzgyVFZuaDZx?=
 =?utf-8?B?YjZYY3RWdjBuWFJ3cGhkVHp3NkJSRnRwRHhVRVBtZitVMDhORDd4YlV1Q0F1?=
 =?utf-8?B?TWpOWjdOTVlwUWd4eFpFWlNpYlhURmpERWZTYk9TNmxqd2dPUC9ZMFlMYkM2?=
 =?utf-8?B?Rnc5YzdibVM0dElOaWV5dHRNZEh0MitHZnAyRnRSbzYzZG5mdFBYQzZjZll2?=
 =?utf-8?B?RVBNZmVTdThwUENNTW1kWWt0VUJhSVVYQWMzc00wQVBEL040QjVHaEhUZ21Z?=
 =?utf-8?B?RStFMU5sOXBnRngxeFZTTStnODhQL3hxZEhyaVF3ZFd5NlJZeitOZmZ0aFVs?=
 =?utf-8?B?WCtYaDNMVC9Ja0ZSbkFiamtaaEovVEpnNnA1SFZsVGp1SG9tb1lpckNTUEJZ?=
 =?utf-8?B?dHdJUWx5a3daUDNrRlJYVk9JWVNLb094U3BKVmdTQXlrMGE3bkZHZU1zU0ds?=
 =?utf-8?B?Yy9PaHZHWWZTckk2T0NyWkt2VlFFRHZnOVpVbUx5bGh3VHNNR2pxOEVmUk5N?=
 =?utf-8?B?OWVXTWVMSFZSVDR3blpENXk2Ukt0dTJ3b3J5clQ2ZXlCZG1rMGJ6SDFBelZk?=
 =?utf-8?B?QmpNSXhvQVlGM2wySjVrSEIvTjB1R2xodEVuQ2x0ZTNCbFIrakhRUXZ0aEVN?=
 =?utf-8?B?SVdmNzllRFE5Y09lM0FRanUxNUVxdWpHdnAwa3B2YVpRdkNQMHJQcTB0WVB6?=
 =?utf-8?B?RHF5QzFGWTVYdXp5TVZZaFlpcG96THYrd09DdnpqbFlLbk95QndPTk8wUVU3?=
 =?utf-8?B?ZUNOWUE5dGIyclIvUnVINVpJSDhTUzRNd2c4RFllYmdoWlkxR2ZmQnVQbnpa?=
 =?utf-8?B?eUxyd21Bek5SRHZBVE9xZUZLSG9vV2haaDloYjQweHpiVDFpdm5lQmZOaTh1?=
 =?utf-8?B?LzM5S0UrUVZlQnErMjZCUEhFcTVQYzlnRzNkeERRPT0=?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SWtCTGI3aEsyV2hvbjRRYlQwSHI2WFRLOVNQVTMzOFVHUTVpYUppOXk3dWw4?=
 =?utf-8?B?MXgrU0gveUZLNmtRdFJyM01uVFZuN3V5SGFDZkV6VFlmSTRoRVBhbVpwclEz?=
 =?utf-8?B?Tk9xSjZOQ21CZWV1cTgxRUhsLzFueUhCUzA2U3lxTStXNy9CTFIwK25FSm53?=
 =?utf-8?B?OUplVDN3ZncwL2RJSDlKcWFIeW5WTmhXelZWcm1PQ3NVV0ZlNGdzUUQ4MFV3?=
 =?utf-8?B?Wkc5UWtidzVXR0R1aUhGeWJFR0NpOWowVmhqbW52SWk5aDBFK09kY255L3NL?=
 =?utf-8?B?ajVzNmdjSmFjVDFkSm9LeEVJaFV6Rnk4NHNuSURBcCtGZzRYNXdlbW1wazF0?=
 =?utf-8?B?c2JQWmRlVVlsKzZ4cUNpMy9IS0Z4Q1pPVytsSzJsUmhPa04zemg5OExyZ1Aw?=
 =?utf-8?B?UVhTNU9LYnV5Q0NVUEFPdTFxY0g4ckpZb0dWbnF1cWJvUXQ5N05KMGhGZTdi?=
 =?utf-8?B?dy9kQ1VIMTh0bC9wenY0Y1VsQnhMMmF3ZWF1c0tTbXBtRHV4U0U3bWdEVUIv?=
 =?utf-8?B?MDI5YlpSVEhtWnFMdkhzNXM1UHFHR3ZBTXozUmxDRkFETFl1MHZrOXRyeU51?=
 =?utf-8?B?SWJScVVIZ2NkUW5ZYkFPcUhRWUF3emVEd3liUXV1QlliZjJMWHdKcWlkM29H?=
 =?utf-8?B?OTRCUGZPYTJXNkR3emkzK0E5dEZObzZLc1orSU1CQ25iLy8wNDVNd2xGS0Nk?=
 =?utf-8?B?THBUN1VOLzBHL2hTOXAvSlR3YmloVUwyYitDWmpvemhvY0VvWTJKR0labEl2?=
 =?utf-8?B?ZHREeG5tbkxHZW9wY0NaOXhWdWxYNDI1VG81RU5yT1EzSG5nWTluUGhJakIz?=
 =?utf-8?B?OGt6ZVJyNzVKOXkraEN4NzFxQldjRHlONkhXbHI2QXdKUFh2L3dRY3A3Rk9n?=
 =?utf-8?B?SE9TQlQ5RFRMNFBsYjgxSVZCQWNSMERTR1dDZW1sdnNUOEtqWktvd0dxKzgr?=
 =?utf-8?B?YURYcW9wbTJmSjFxRGdzVEE3NlVuVlpuYVV1NmdkYi9jTkswR1pMT2pJRnZU?=
 =?utf-8?B?cWRoTm9IYkVBWmVQZ0dnVnh6RG14VGRGTUNhcTNuNEkwbyswSm44MnVHQ2xM?=
 =?utf-8?B?TTdkMEVDK0NVWEp5Q2FWUGxGdGU0Z1FBLzlzUW9KQlFtMHNodHg1UUhFTHJV?=
 =?utf-8?B?ajNoMCtROTFqdkZnRitFL0F2MGNQbTFuOGVRcjdpM00vdGZVZksreDBWVTJ2?=
 =?utf-8?B?TFNEM0hlQ1R4Zmp1QnRqbU9nRVZraWFaKzZrL09WR1NlWHRJZDRCVjhkcThz?=
 =?utf-8?B?dDJmQWZQTXZoMmR6YUJiWFJYUWRrbW9JMkFkSjQ2ZGNickYySi9mTVZIOWs1?=
 =?utf-8?B?T1JmQm95dWF1R1REOWR0RWVmbk02L0U0Yk9iY2ptbXFRZFdlRGlHanBKQ2sx?=
 =?utf-8?B?ZEcrcThKN0F1Ym1rcklaVEtXQ0xkNm1yVkovMFEwcUJpQjlVUi9rQVlDOGNB?=
 =?utf-8?B?WXJVRldyNEY4SVNHTGx1YVJveUdzbHFTSENRcWU5bG0xMkhKdVNhMXp4Z0dT?=
 =?utf-8?B?a1VzVnpkNDVtWU5XMjZHTGNJcjhERUVNL2JzYnVmM3hEaHJ1d21YcVNaVHVR?=
 =?utf-8?B?RnlMT1l3S2Z1cFY1Z0pZSDZqWmo0MG9EdW9SQmdqYzhlcnV6cjdqdC9EQ3ha?=
 =?utf-8?B?RmxjOXhDck4raTJSUnRNdkJQc2lWb2UrTFlpd1RMUlRTNjl1OVJPMTJyWGwy?=
 =?utf-8?B?czE3KzZqKytGSGFCbEVJanlydUNRNnlOeWtrOEs1eklJS2NoL0NxT3BDVGRa?=
 =?utf-8?Q?oLVjxsEg9QQq97sd9SzHCMc02DCh6JRx1iXL9aV?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <61B67ABD5C2233478D2EC41E45E6BF03@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ed82fe2a-3f42-4b7d-47fb-08dd620050cd
X-MS-Exchange-CrossTenant-originalarrivaltime: 13 Mar 2025 07:26:05.1326 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN2PR01MB4137
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

DQoNCj4gT24gMTMgTWFyIDIwMjUsIGF0IDEyOjU44oCvQU0sIEFuZHkgU2hldmNoZW5rbyA8YW5k
cml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tPiB3cm90ZToNCj4gDQo+IE9uIFdlZCwgTWFy
IDEyLCAyMDI1IGF0IDA3OjE0OjM2UE0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPj4+IE9u
IDEyIE1hciAyMDI1LCBhdCA5OjA14oCvUE0sIFN2ZW4gUGV0ZXIgPHN2ZW5Ac3ZlbnBldGVyLmRl
dj4gd3JvdGU6DQo+Pj4gT24gV2VkLCBNYXIgMTIsIDIwMjUsIGF0IDEzOjAzLCBBZGl0eWEgR2Fy
ZyB3cm90ZToNCj4gDQo+IC4uLg0KPiANCj4+PiBJIGRvbid0IGhhdmUgYSBzdHJvbmcgb3Bpbmlv
biBlaXRoZXIgd2F5OiBmb3IgU01DIEkganVzdCBuZWVkIHRvIHByaW50DQo+Pj4gRm91ckNDIGtl
eXMgZm9yIGRlYnVnZ2luZyAvIGluZm9ybWF0aW9uIGluIGEgZmV3IHBsYWNlcy4NCj4+PiANCj4+
PiBJJ20gcHJlcGFyaW5nIHRoZSBTTUMgZHJpdmVyIGZvciB1cHN0cmVhbWluZyBhZ2FpbiAoYWZ0
ZXIgYSB0d28geWVhciBkZWxheSA6LSgpDQo+Pj4gYW5kIHdhcyBqdXN0IGdvaW5nIHRvIHVzZSBt
YWNyb3MgdG8gcHJpbnQgdGhlIFNNQyBGb3VyQ0Mga2V5cyBzaW1pbGFyIHRvDQo+Pj4gRFJNX01P
REVfRk1UL0RSTV9NT0RFX0FSRyBmb3Igbm93IHRvIGtlZXAgdGhlIHNlcmllcyBzbWFsbGVyIGFu
ZCByZXZpc2l0DQo+Pj4gdGhlIHRvcGljIGxhdGVyLg0KPj4+IA0KPj4+IFJpZ2h0IG5vdyBJIGhh
dmUgdGhlc2UgaW4gbXkgbG9jYWwgdHJlZSAob25seSBjb21waWxlIHRlc3RlZCBzbyBmYXIpOg0K
Pj4+IA0KPj4+ICNkZWZpbmUgU01DX0tFWV9GTVQgIiVjJWMlYyVjICgweCUwOHgpIg0KPj4+ICNk
ZWZpbmUgU01DX0tFWV9BUkcoaykgKGspPj4yNCwgKGspPj4xNiwgKGspPj44LCAoayksIChrKQ0K
Pj4gDQo+PiBUaGF0IHNlZW1zIHRvIGJlIGEgbmljZSBhbHRlcm5hdGl2ZSwgd2hpY2ggSSBndWVz
cyBUaG9tYXMgd2FzIGFsc28gc3VnZ2VzdGluZy4NCj4gDQo+IEkgZG9uJ3QgdGhpbmsgaXQncyAi
bmljZSIuIEVhY2ggb2YgdGhlIGFwcHJvYWNoZXMgaGFzIHByb3MgYW5kIGNvbnMuDQo+IFlvdSBj
YW4gc3RhcnQgZnJvbSBibG9hdC1vLW1ldGVyIGhlcmUgYW5kIGNvbXBhcmUgaXQgd2l0aCB5b3Vy
ICVwIGV4dGVuc2lvbi4NCj4gDQo+IEFsc28sIGNhbiB5b3Ugc2hvdyB0aGUgYmxvYXQtby1tZXRl
ciBvdXRwdXQgZm9yIHRoZSB2c3ByaW50Zi5jPw0KDQpIZXJlIGFyZSB5b3VyIG91dHB1dHM6DQoN
Ci0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQ0KRm9yIGFwcGxldGJkcm06DQoNCmFkaXR5YUBNYWNCb29rOn4vbGludXgk
IC4vc2NyaXB0cy9ibG9hdC1vLW1ldGVyICRQNCAkTUFDUk8NCmFkZC9yZW1vdmU6IDAvMCBncm93
L3NocmluazogMS8xIHVwL2Rvd246IDY0Ly0xOSAoNDUpDQpGdW5jdGlvbiAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhDQphcHBsZXRiZHJtX3Jl
YWRfcmVzcG9uc2UgICAgICAgICAgICAgICAgICAgICAzOTUgICAgIDQ1OSAgICAgKzY0DQphcHBs
ZXRiZHJtX3Byb2JlICAgICAgICAgICAgICAgICAgICAgICAgICAgIDE3ODYgICAgMTc2NyAgICAg
LTE5DQpUb3RhbDogQmVmb3JlPTEzNDE4LCBBZnRlcj0xMzQ2MywgY2hnICswLjM0JQ0KDQphZGl0
eWFATWFjQm9vazp+L2xpbnV4JCAuL3NjcmlwdHMvYmxvYXQtby1tZXRlciAkUDQgJE1BQ1JPIC1j
DQphZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDEvMSB1cC9kb3duOiA2NC8tMTkgKDQ1KQ0K
RnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcg
ICBkZWx0YQ0KYXBwbGV0YmRybV9yZWFkX3Jlc3BvbnNlICAgICAgICAgICAgICAgICAgICAgMzk1
ICAgICA0NTkgICAgICs2NA0KYXBwbGV0YmRybV9wcm9iZSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAxNzg2ICAgIDE3NjcgICAgIC0xOQ0KVG90YWw6IEJlZm9yZT01MjE3LCBBZnRlcj01MjYy
LCBjaGcgKzAuODYlDQphZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDAvMCB1cC9kb3duOiAw
LzAgKDApDQpEYXRhICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGQg
ICAgIG5ldyAgIGRlbHRhDQpUb3RhbDogQmVmb3JlPTE1NjAsIEFmdGVyPTE1NjAsIGNoZyArMC4w
MCUNCmFkZC9yZW1vdmU6IDAvMCBncm93L3NocmluazogMC8wIHVwL2Rvd246IDAvMCAoMCkNClJP
IERhdGEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAg
ZGVsdGENClRvdGFsOiBCZWZvcmU9NjY0MSwgQWZ0ZXI9NjY0MSwgY2hnICswLjAwJQ0KDQphZGl0
eWFATWFjQm9vazp+L2xpbnV4JCAuL3NjcmlwdHMvYmxvYXQtby1tZXRlciAkUDQgJE1BQ1JPIC1k
DQphZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDAvMCB1cC9kb3duOiAwLzAgKDApDQpEYXRh
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRl
bHRhDQpUb3RhbDogQmVmb3JlPTgyMDEsIEFmdGVyPTgyMDEsIGNoZyArMC4wMCUNCg0KYWRpdHlh
QE1hY0Jvb2s6fi9saW51eCQgLi9zY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgJFA0ICRNQUNSTyAtdA0K
YWRkL3JlbW92ZTogMC8wIGdyb3cvc2hyaW5rOiAxLzEgdXAvZG93bjogNjQvLTE5ICg0NSkNCkZ1
bmN0aW9uICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAg
ZGVsdGENCmFwcGxldGJkcm1fcmVhZF9yZXNwb25zZSAgICAgICAgICAgICAgICAgICAgIDM5NSAg
ICAgNDU5ICAgICArNjQNCmFwcGxldGJkcm1fcHJvYmUgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgMTc4NiAgICAxNzY3ICAgICAtMTkNClRvdGFsOiBCZWZvcmU9NTIxNywgQWZ0ZXI9NTI2Miwg
Y2hnICswLjg2JQ0KDQotLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0NCkZvciB2c3ByaW50ZjoNCg0KYWRpdHlhQE1hY0Jv
b2s6fi9saW51eCQgLi9zY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgJE9MRCAkTkVXDQphZGQvcmVtb3Zl
OiAwLzAgZ3Jvdy9zaHJpbms6IDEvMCB1cC9kb3duOiAyMjAvMCAoMjIwKQ0KRnVuY3Rpb24gICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcgICBkZWx0YQ0KZm91
cmNjX3N0cmluZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDc5ICAgICA2OTkgICAg
KzIyMA0KVG90YWw6IEJlZm9yZT0yNjQ1NCwgQWZ0ZXI9MjY2NzQsIGNoZyArMC44MyUNCg0KYWRp
dHlhQE1hY0Jvb2s6fi9saW51eCQgLi9zY3JpcHRzL2Jsb2F0LW8tbWV0ZXIgJE9MRCAkTkVXIC1j
DQphZGQvcmVtb3ZlOiAwLzAgZ3Jvdy9zaHJpbms6IDEvMCB1cC9kb3duOiAyMjAvMCAoMjIwKQ0K
RnVuY3Rpb24gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgb2xkICAgICBuZXcg
ICBkZWx0YQ0KZm91cmNjX3N0cmluZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgNDc5
ICAgICA2OTkgICAgKzIyMA0KVG90YWw6IEJlZm9yZT0yNDcxOCwgQWZ0ZXI9MjQ5MzgsIGNoZyAr
MC44OSUNCmFkZC9yZW1vdmU6IDAvMCBncm93L3NocmluazogMC8wIHVwL2Rvd246IDAvMCAoMCkN
CkRhdGEgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3
ICAgZGVsdGENClRvdGFsOiBCZWZvcmU9MjI5LCBBZnRlcj0yMjksIGNoZyArMC4wMCUNCmFkZC9y
ZW1vdmU6IDAvMCBncm93L3NocmluazogMC8wIHVwL2Rvd246IDAvMCAoMCkNClJPIERhdGEgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAgZGVsdGENClRv
dGFsOiBCZWZvcmU9MTUwNywgQWZ0ZXI9MTUwNywgY2hnICswLjAwJQ0KDQphZGl0eWFATWFjQm9v
azp+L2xpbnV4JCAuL3NjcmlwdHMvYmxvYXQtby1tZXRlciAkT0xEICRORVcgLWQNCmFkZC9yZW1v
dmU6IDAvMCBncm93L3NocmluazogMC8wIHVwL2Rvd246IDAvMCAoMCkNCkRhdGEgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIG9sZCAgICAgbmV3ICAgZGVsdGENClRvdGFs
OiBCZWZvcmU9MTczNiwgQWZ0ZXI9MTczNiwgY2hnICswLjAwJQ0KDQphZGl0eWFATWFjQm9vazp+
L2xpbnV4JCAuL3NjcmlwdHMvYmxvYXQtby1tZXRlciAkT0xEICRORVcgLXQNCmFkZC9yZW1vdmU6
IDAvMCBncm93L3NocmluazogMS8wIHVwL2Rvd246IDIyMC8wICgyMjApDQpGdW5jdGlvbiAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBvbGQgICAgIG5ldyAgIGRlbHRhDQpmb3Vy
Y2Nfc3RyaW5nICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICA0NzkgICAgIDY5OSAgICAr
MjIwDQpUb3RhbDogQmVmb3JlPTI0NzE4LCBBZnRlcj0yNDkzOCwgY2hnICswLjg5JQ0KDQoNCj4g
DQo+Pj4gd2hpY2ggYXJlIHRoZW4gdXNlZCBsaWtlIHRoaXM6DQo+Pj4gDQo+Pj4gIGRldl9pbmZv
KGRldiwNCj4+PiAgICAgICJJbml0aWFsaXplZCAoJWQga2V5cyAiIFNNQ19LRVlfRk1UICIgLi4g
IiBTTUNfS0VZX0ZNVCAiKVxuIiwNCj4+PiAgICAgICBzbWMtPmtleV9jb3VudCwgU01DX0tFWV9B
Ukcoc21jLT5maXJzdF9rZXkpLA0KPj4+ICAgICAgIFNNQ19LRVlfQVJHKHNtYy0+bGFzdF9rZXkp
KTsNCj4gDQo+IC0tIA0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+
IA0KPiANCg0K
