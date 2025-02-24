Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D29F7A42704
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:56:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2CD510E43C;
	Mon, 24 Feb 2025 15:56:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="oNkE3nFS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU009.outbound.protection.outlook.com
 (mail-southindiaazolkn19010011.outbound.protection.outlook.com
 [52.103.67.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AB8010E43C
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:56:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qf3gVV7BMxrdHjCF/qEyoEltz3TEqZpZiF7NIOxC1/tnBgeSlHKTLWVaR1c7BzuXGiMao+kqy67+t3/+w++e5JA7xzH+XoFfwMoBGDrqqdPSZbsKx5EZMeZwFktMWIU9BvcqrKR91nvzQ8qAePeHOLfyXRXNmlJILDKctK72jO1m0gOF+6wtKCljCVr9JLXHVuRFWrNP5nfIsI5HufA5aBGN4lEU19IdZ8DIvZpQzb6P2rbwh1D7MG/SNNs6Ol7R41/hInNqM8bR+ozM7aeJrx5fGk3U613QoeIeiGr/IoWq05gu+wTNzBryP3xz2KHUi4LAwsLbwv1+4yNjTnfrYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3vrtd5xlcyYpB3I0+6x9gFxKLdZ8ZkVaXKwm/0m7Hps=;
 b=NQrWyjt8EnkMYtoyNEd2IRlKaDERF5Y9nx+RwC7Mjj+38ngVx/IIqADGkJROsBSDB/gvPy5MoUe0u9MKV0lrQMELFOv2muZEm8a0c2pJPvU/HVFndwaJ+dqdH4jnaXffN8ptqJqHUDfXcDw6WETvTS6FxR8ZrZwSail20atFLiY3dPvUo1UeoG84abxoW4vVTHqlGP++OHWQodAlLgdSqY0uX5mENYISFT9FHqK04EJzjAXegzZWsnrivLiCi9+2Ywzyfp6hQGXkckgl4OKO7r9p/LMa7drQASp0o/b7ydR/AIuJ1d/abnvr4JaeBuCKKCi3YLAB8VBPmO5NjiYFyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3vrtd5xlcyYpB3I0+6x9gFxKLdZ8ZkVaXKwm/0m7Hps=;
 b=oNkE3nFS7tkQU2q0tG63YiUHR8fIS5O0L4Cks1IAWYgJ5G/+j4vaJ0MFzsJ5L7Lh0MhPjMn2kqDg941i+lmVTQI+XROHL9wkAlP15LjmGygRB8662nJ0M2PGWXgxvJ3kMpFQEimMcHx4fdXZvhUGZiCkStExMB5i8oR7VNYBsegLQ8fjcCJGUUKKaZlntE2tFVkA+VpKmjUh63jz9y6uhQIRyKlBHV3DYVv1lsdPtnFd0yMACwl6Wf7uSdI1tJ66qWQZjcFCQA4v0w9bJIe0rmGKJkFdkY5PJPuDbbpI+vS51azP+mUhPiMJWzSygkpmvXffNNaXJbkDizGr1ODWLg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN3PR01MB6402.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:85::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:56:36 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:56:36 +0000
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
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWe38AgAAI1YCAAAcMAIAAAaKAgAACOwCAAAJQAIAAA7BUgAABjYCAAACPR4AAA3gAgAABCXQ=
Date: Mon, 24 Feb 2025 15:56:36 +0000
Message-ID: <PN3PR01MB95976A734F6763F1574FC7EAB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
 <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959729DB53C0D359F8A83292B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7ySdcYWZjCVd-7v@smile.fi.intel.com>
 <PN3PR01MB959780B670AB514305790D8BB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7yV1rvSM2OPW_un@smile.fi.intel.com>
In-Reply-To: <Z7yV1rvSM2OPW_un@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN3PR01MB6402:EE_
x-ms-office365-filtering-correlation-id: ff22894d-5754-4ec5-46b6-08dd54ebd150
x-microsoft-antispam: BCL:0;
 ARA:14566002|12121999004|8062599003|8060799006|19110799003|15080799006|7092599003|6072599003|461199028|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?cU9aNnVFTnlRN2xQWTU5azVjQzRlajJIMFcrM1NGTDlGMlJkczdIZEZpNi93?=
 =?utf-8?B?Y3JHSHFvQjZOd3hrK3QrL3RkRm9PdFZzeU1xM095Z0IxcnIyZTlNYmxvUE50?=
 =?utf-8?B?TUZlYzhqclU4WlVOVlNBWXdsYTNhZU8xMFc4UUZPcU4vQ0hxbS8zSjVuLzIv?=
 =?utf-8?B?YVRPa0FpU3BHa3VOQTRTY2xvZldlV0xZdlFTZkxVQ1Y5eUhiOTFnL2ZMKy85?=
 =?utf-8?B?a2pOdVV3emdScFNYSWxXaE90VEZoZk1RZk40K1E0OVVKM3QzMWJFOUx2N2tT?=
 =?utf-8?B?ZXhON1hmRUt3b3QySXY3ZlJMdjZ4QzNmblhCeStBVWdEK24rK2ROb2Q2Ni9U?=
 =?utf-8?B?VFBVOUFCWXp3MHVuRXArTTR3UjBIV3FkbHNrVUtPaEx4UVZuSUV5SUdaNE1M?=
 =?utf-8?B?OXYzSXpNYk5qZ3lyKzdnbnd1NTdmVjAxcWxlRE5NWjN0SXRKVm9GcHhvWUlL?=
 =?utf-8?B?UjltNW52U1JtN0hEM2R5Z2U2UGhKeUVaL2NmcHRDRGZmT0dER0tzZFhzMzYy?=
 =?utf-8?B?dEtVb0d6UnAyWGpIVzRqWHhnUFZBaVorQWxIYkxCdGVLTjMzVVBOa1JlaDU2?=
 =?utf-8?B?RnN2amxqVmd1VlV1RmVNOE0xQUIydzRDemFEc3c4cS9SMGJaRitUYjdxeGZV?=
 =?utf-8?B?QUJoT2Z6OFJDOXR3bWRhOHZQWGRMVDJ5WWh0SnRJazhGNktPSlBVOVFOVXJj?=
 =?utf-8?B?eVY5dVZuU3NZMWlnVEpYYVVCMWFhTUVPMWMyQzZmVnNuQkU3N1UrNEpGS0lY?=
 =?utf-8?B?R2MzWWRwOTFIdXk5L09NYXYvOG55ZHNMZGtrc0w5NjAwOUVqdjBSNWlWYVdq?=
 =?utf-8?B?cVM1a1YzY29nN3dBSDY1aWRYU04rZDI3N2k2dG16YnRrd0E3MGlzK2hhZWZ0?=
 =?utf-8?B?Y2ZKY210a1g4ajVFNDBWN0lsK2IxNmRaUjJkSGZOdndXTHU2OU83QWUwdUp0?=
 =?utf-8?B?MG51R2dtelJ1Ly9xa0xYY01HekIxQis3aEpxa296UElBRzI0NFArd0F3c2dU?=
 =?utf-8?B?SU5yS2luaEN0MEIxTUc3V3FzWkJMd01sSG9SS1R2bytXUmVYQjFKaCtxNklP?=
 =?utf-8?B?L1lrb09SMzdOVHBuYlIyNWZUZ3g5YlI5VUhIU2x4eUFHcE1kMFBESTExQzBP?=
 =?utf-8?B?RVY0UTAwajhoOFN0eVpZN1Ywb1VrZjQ3V0dUcy9FOFRrUEticnVjRkNxQXNm?=
 =?utf-8?B?UVdIMklueUdYSzM1Z1l1ZWtZOW1rZHBWZzdPTmp1SnlTRi9OcWhiZlZVeTVw?=
 =?utf-8?B?VDFpK0xkVEo2WlN4d2ZIWVlSZ20yd1RzWjZlNzBIcWFKTjFPM0JtT2JOZ2w0?=
 =?utf-8?B?U0FLaHRWUzVmamJoQWl1a0tMb1NzODhCZkhQcE83bEhFSExFQVNHVEovKzAy?=
 =?utf-8?B?Qko1MmZKUDlkTzI1OUh1bGs4QkFIeThCcUpWVmYzV3hkUUZxVXV6N1ZTNmxN?=
 =?utf-8?B?YkhLTXM1eG0xQXdEQkhRVHVtV3NhV01RWktwWGVEcGp1UHZHUjg3KzJhUmNn?=
 =?utf-8?Q?RYs/QGjTOqsXB77zQIXeQF65TZ5?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?OEdpZDl0WHYyK0lURlJEZjNDYmZ2WW9vL0tWQUJNWUtzUld3WXpJcm9YeVRv?=
 =?utf-8?B?RE1RVXRaWkU1SlRva3FWTUIva3pteC9vQktYWkZVU0toQzh3K3JxcE15VVNU?=
 =?utf-8?B?c2J0ZlNsWEhsVllIWEVkZmNXOGJ4Rmp0T1d4UUhZb1lSdnZ1a1FFenpyQm1a?=
 =?utf-8?B?SzBoMDQyeHZocDkyZjArZ3dwT0I5MFR5TXllZ2Zld1FBNXp4Z3E0bjM0bVRz?=
 =?utf-8?B?Y1hRa3EwMy9ZL3JXMDZiR1FGSlRvUjZ4TlBzRWpKWm01OXlBZE9YTjBjYlZT?=
 =?utf-8?B?RG05cnBJWkpRZmppbkJXZGlQVjNqQWkrZDNTQ2N5em5xaVM4aldBUU42dTIy?=
 =?utf-8?B?YmlJOXFhdGMxU3NqRXMxZldBUnQweWF3S2EwaGxhY0JOUUlWK3M3UUFacE9Q?=
 =?utf-8?B?QjkweCtDSmxFMGRpUWRmVkRpN3BaSXhQT1p6Q0lhekk4VjFieEU5aHB6UWtK?=
 =?utf-8?B?OHE3bHFoZU80dG1IUWJ6Mlk2ekcxRlJ3Q0o5NEVEcnZMcThaNjdBSGY2VjRW?=
 =?utf-8?B?eFZSMURNazdXdlM5RGtSM3pPelFLaDhJOFJGVlF0ZWZmZUFNVDExUjFsRmZz?=
 =?utf-8?B?ajBoQ3d2amk4TGdPd09LaU5XcWs3cDFmY2kxcFBxcnRaaGhad085TTgveE1P?=
 =?utf-8?B?MHMzbVhMdVd6RWxuQ1pMY3d1ZE1IdEdNZWtUMnV3dnRLZEJoaWVDQ1Z5YUdH?=
 =?utf-8?B?MFNDWTExSjBxeXNJekdhR2s3QVZGMFQySnJvUkZERS9BSEhTUDR1MFpyZVFM?=
 =?utf-8?B?L2QxSHBqbWk3dlJrUE9TQTBzOVNNTlEvajJXeFBZdHNsRmtUVU40a1k1Rloz?=
 =?utf-8?B?MXVNSkV2c01uNmQrMFVaWXlKSUpISlNRWFdBaCt3cmxycjFjODdXOWEzVGVT?=
 =?utf-8?B?RDFqVW12OXBXT2lTVDFoSU5lVkhqV1VmS1p6QTUvVXZmZ0hkS2w1V3B1dGta?=
 =?utf-8?B?ZjUzS0pXN2lHQmhqQmEzcDVlaWFpcXRncDFITFc0Y1IxN0cweFNZZ2dQcXlk?=
 =?utf-8?B?Sk9GUGVJSk9ZVm9TR0k0cEdPOU1iU3Y0VEJvQThoZXcxQnYwVEF4VlJkcjg0?=
 =?utf-8?B?SnNmUzBqVnRHa2lrbjdhNjA4aklxSjBPall2elRrRC9mL2FqRERUZGY1ZURx?=
 =?utf-8?B?RXk0ZDM5dWtHMnB6M0JabmRvMkV0Ky9VTFdvbUM3cFVTY045UVNTQjhJSG1l?=
 =?utf-8?B?eE03MFZYVEJRWmtWYk5SemxXMUJhbXVlZERpRHpubHR3QnNtQ21ycGFGR2hv?=
 =?utf-8?B?MEEyRzh0TS9nb0wvTGcxdDdwbmdUdDJWZ2EyeFJyUnJyTjlOZ3pxOWFJVkZz?=
 =?utf-8?B?SHBoNHo4ZVBqQ1NaTkJRdHNMUGE3SjF6bndGUkxSMjRGVVNXNGhpNjVMcjRy?=
 =?utf-8?B?UkhXalJ1ZWpjQjFETTFSMFZGWGJzNi9aMlcxK3NRSk9XTEIyMWVtb1R6aVpM?=
 =?utf-8?B?cjRsRmNlL3krWUpueWtjN2lJcjhnNXlNdHlDZmNzRnFIWkF0VEtvTjVDRjdX?=
 =?utf-8?B?cGVadEFzb2xjZkxwbWlzYmxzOTVDRXNvMTVHQVkrNlBxMDRDK3pCNGhwanB2?=
 =?utf-8?B?RTBFT1g0cXd2VGJ5N3dNZnhLR2NCZExxYnBUS0JkbDVCa25KcWo4QU8vT3Va?=
 =?utf-8?B?OWdCcXU4QTl3WjBkZUZ4YkdHSHBXeFNYV2paUHcxM1hScytpVlhXQkhkTU5N?=
 =?utf-8?B?VG94NVBvOStRSWU3NGVXUnFJKzdBRW50VXorYXMrSFBocWRnTmNqQVVFeWgx?=
 =?utf-8?Q?QOv4iidm8XTHrwzwJM=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: ff22894d-5754-4ec5-46b6-08dd54ebd150
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 15:56:36.2070 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB6402
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDk6MjPigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDM6
NDA6MjlQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDI0IEZlYiAyMDI1LCBh
dCA5OjA44oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+
PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwMzozMjo1NlBNICswMDAwLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4+Pj4+IE9uIDI0IEZlYiAyMDI1LCBhdCA4OjUw4oCvUE0sIEFkaXR5YSBHYXJnIDxn
YXJnYWRpdHlhMDhAbGl2ZS5jb20+IHdyb3RlOg0KPj4+Pj4+IE9uIDI0IEZlYiAyMDI1LCBhdCA4
OjQx4oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+Pj4+
PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwMzowMzo0MFBNICswMDAwLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4+Pj4+Pj4+PiBPbiAyNCBGZWIgMjAyNSwgYXQgODoyN+KAr1BNLCBhbmRyaXkuc2hl
dmNoZW5rb0BsaW51eC5pbnRlbC5jb20gd3JvdGU6DQo+Pj4+Pj4+PiBPbiBNb24sIEZlYiAyNCwg
MjAyNSBhdCAwMjozMjozN1BNICswMDAwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+Pj4+Pj4+Pj4g
T24gMjQgRmViIDIwMjUsIGF0IDc6MzDigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50
ZWwuY29tIHdyb3RlOg0KPj4+Pj4+Pj4+Pj4+IE9uIE1vbiwgRmViIDI0LCAyMDI1IGF0IDAxOjQw
OjIwUE0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3RlOg0KPiANCj4gLi4uDQo+IA0KPj4+Pj4+Pj4+
Pj4+PiArI2RlZmluZSBfX0FQUExFVEJEUk1fTVNHX1NUUjQoc3RyNCkgKChfX2xlMzIgX19mb3Jj
ZSkoKHN0cjRbMF0gPDwgMjQpIHwgKHN0cjRbMV0gPDwgMTYpIHwgKHN0cjRbMl0gPDwgOCkgfCBz
dHI0WzNdKSkNCj4+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+PiBBcyBjb21tZW50ZWQgcHJldmlv
dXNseSB0aGlzIGlzIHF1aXRlIHN0cmFuZ2Ugd2hhdCdzIGdvaW5nIG9uIHdpdGggZW5kaWFuZXNz
IGluDQo+Pj4+Pj4+Pj4+Pj4gdGhpcyBkcml2ZXIuIEVzcGVjaWFsbHkgdGhlIGFib3ZlIHdlaXJk
bmVzcyB3aGVuIGdldF91bmFsaWduZWRfYmUzMigpIGlzIGJlaW5nDQo+Pj4+Pj4+Pj4+Pj4gb3Bl
biBjb2RlZCBhbmQgZm9yY2UtY2FzdCB0byBfX2xlMzIuDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+
Pj4+IEkgd291bGQgYXNzdW1lIGl0IHdhcyBhbHNvIG1pbWlja2VkIGZyb20gdGhlIFdpbmRvd3Mg
ZHJpdmVyLCB0aG91Z2ggSSBoYXZlbid0DQo+Pj4+Pj4+Pj4+PiByZWFsbHkgdHJpZWQgZXhwbG9y
aW5nIHRoaXMgdGhlcmUuDQo+Pj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+Pj4+IEnigJlkIHJhdGhlciBi
ZSBoYXBweSBpZiB5b3UgZ2l2ZSBtZSBjb2RlIGNoYW5nZSBzdWdnZXN0aW9ucyBhbmQgbGV0IG1l
IHJldmlldw0KPj4+Pj4+Pj4+Pj4gYW5kIHRlc3QgdGhlbQ0KPj4+Pj4+Pj4+PiANCj4+Pj4+Pj4+
Pj4gRm9yIHRoZSBzdGFydGVyIEkgd291bGQgZG8gdGhlIGZvbGxvd2luZyBmb3IgYWxsIHJlbGF0
ZWQgY29uc3RhbnRzIGFuZA0KPj4+Pj4+Pj4+PiBkcm9wIHRoYXQgd2VpcmQgYW5kIHVnbHkgbWFj
cm9zIGF0IHRoZSB0b3AgKGl0IGFsc28gaGFzIGFuIGlzc3VlIHdpdGgNCj4+Pj4+Pj4+Pj4gdGhl
IHN0cjQgbGVuZ3RoIGFzIGl0IGlzIDUgYnl0ZXMgbG9uZywgbm90IDQsIGJ0dyk6DQo+Pj4+Pj4+
Pj4+IA0KPj4+Pj4+Pj4+PiAjZGVmaW5lIEFQUExFVEJEUk1fTVNHX0NMRUFSX0RJU1BMQVkgY3B1
X3RvX2xlMzIoMHg0MzRjNTI0NCkgLyogQ0xSRCAqLw0KPj4+Pj4+Pj4gDQo+Pj4+Pj4+PiBMZW1t
ZSB0ZXN0IHRoaXMuDQo+Pj4+Pj4+IA0KPj4+Pj4+PiBKdXN0IGluIGNhc2UgaXQgd29uJ3Qgd29y
aywgcmV2ZXJzZSBieXRlcyBpbiB0aGUgaW50ZWdlci4gQmVjYXVzZSBJIHdhcyBsb3N0IGluDQo+
Pj4+Pj4+IHRoaXMgY29udmVyc2lvbi4NCj4+Pj4+IA0KPj4+Pj4gSXQgd29ya3MuIFdoYXQgSSB1
bmRlcnN0YW5kIGlzIHRoYXQgeW91IHVzZWQgdGhlIG1hY3JvIHRvIGdldCB0aGUgZmluYWwgaGV4
IGFuZCBjb252ZXJ0ZWQgaXQgaW50byBsaXR0bGUgZW5kaWFuLCB3aGljaCBvbiB0aGUgeDg2IG1h
Y3Mgd291bGQgdGVjaG5pY2FsbHkgcmVtYWluIHRoZSBzYW1lLg0KPj4+PiANCj4+Pj4gQW5kIG5v
dyB0aGF0IEkgb2JlcnZlZCBhZ2FpbiwgJXA0Y2MgaXMgYWN0dWFsbHkgcHJpbnRpbmcgdGhlc2Ug
Q0xSRCwgUkVEWSBldGMNCj4+Pj4gaW4gcmV2ZXJzZSBvcmRlciwgcHJvYmFibHkgdGhlIHJlYXNv
biAlcDRjaCB3YXMgY2hvc2VuLiBBbmQgSSBhbSB1bmFibGUgdG8NCj4+Pj4gZmluZCB3aGF0IG1h
Y3JvIHVwc3RyZWFtIGNhbiBiZSB1c2VkLg0KPj4+IA0KPj4+ICUuNHMgc2hvdWxkIHdvcmsgYXMg
aXQgdGVjaG5pY2FsbHkgbm90IERSTSA0Y2MsIGJ1dCBzcGVjaWZpY3Mgb2YgdGhlIHByb3RvY29s
DQo+Pj4gKHRoYXQgcmVtaW5kcyBtZSBhYm91dCBBQ1BJIHRoYXQgdXNlcyA0Y2MgYSBsb3QpLg0K
Pj4gDQo+PiBJIHN0aWxsIGdldCByZXZlcnNlIG9yZGVyIGluIHRoYXQuDQo+IA0KPiBBaCwgcmln
aHQsIGl0IHdpbGwgZ2l2ZSB5b3UgdGhlIGZpcnN0IGxldHRlciBhcyBMU0IsIGluZGVlZC4gQXQg
dGhlIGVuZCBvZiB0aGUNCj4gZGF5IGlmIGl0J3Mgc28gaW1wb3J0YW50LCB0aGVyZSBhcmUgd2F5
cyBob3cgdG8gc29sdmUgdGhhdCB3aXRob3V0IHVzaW5nICVwNGNjLg0KPiBCdXQgaWYgb3RoZXJz
IChhbmQgZXNwLiBQUklOVEsgbWFpbnRhaW5lcnMpIHdhbnQgdG8gaGF2ZSAvIGRvbid0IG9iamVj
dCBoYXZpbmcNCj4gdGhhdCBleHRlbnNpb24sIHdoeSBub3Q/DQoNClJpZ2h0LCBidXQgd2hhdCB0
byBkbyBhYm91dCB0aGUgY2FzZSBvZiBsaXR0bGUgZW5kaWFuIGFuZCBob3N0IGVuZGlhbj8gSSBy
ZW1lbWJlciB0aGUgc3RhdGVtZW50ICJmb3IgdGhlIHNha2Ugb2YgY29tcGxldGVuZXNzIiBmb3Ig
dGhlbS4gRG8geW91IHRoaW5rIGp1c3QgaG9zdCBlbmRpYW4gYW5kIHJldmVyc2UgZW5kaWFuIHNo
b3VsZCBiZSBqdXN0IGZpbmU/IE9yIHlvdSBnb3QgYW55ICJubyBzcGFyc2Ugd2FybmluZyIgd2F5
IHRvIGdldCBpdCBkb25lPyBUaGUgbWFjcm9zIHRvIGNvbnZlcnQgdG8gbGUzMi9iZTMyIGV4cGVj
dCBhIHUzMiB2YWx1ZSwgYnV0IGluIHRob3NlIGNhc2VzIHdlIGFjdHVhbGx5IGFyZSBwYXNzaW5n
IGEgbGUzMi9iZTMyIHZhbHVlLg0K
