Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D4BBA42684
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D5E10E41A;
	Mon, 24 Feb 2025 15:40:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="YexEqbGO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011038.outbound.protection.outlook.com
 [52.103.68.38])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38FE510E41A
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wyeMwJRNKSZEyCoVOL2Pni2I/VuAmoKPukvxLztT2QAnviemZYOyrfGi2ROzRy9+blHs0Q8GXvQOVk2mB1eYw7h6wt15rvdwXc4ak5+71wgMoHQtYBlT3uO0/smvks9VtKqrhuz/v52l9hM2wcoDJBde7X990M2kGmaYzNc6fLSpcxb880TBGIMYWSVItfj+7eVKg1aeRICErfLqD89b/f+hW9cqqJMNIbbOuRNCVijuEQe52ZUyJNzgpqIH7Bl2TbNidtRK8EHMbl/rnWS9RIt4pzsgzYff6KQXepMUNak5mZJo1eSiHCpiz9psTgm58kVjOHyRKZSSf3OxQV57jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=caJtHJkxT5gA2xHrd9aHKUxASCSY+ZfiRtOduLHElkE=;
 b=gholJyya+fQ9LS+j035YJbanUFXP7c8X2wAO9NVq47NbEBRcO6TVyX7Z3dO3TVNB4ZIilVWPXMOQWZKsexxvS0ezSonG+zRYjA9wZPD/6nYzJ38S4kKjDUitu24Pw9ITikPxj21ao5kDxdjm9j7DOxSJgTuOm0IDrH1QRClIxsHtwuWb7lMunRQEqUoPTLR0EYZI4688KPx3nuICk5RwMoCDvJF+kKeLWR4x2VeUw1WMUdNW/CGg9u8l0ASfV+KyN74+lhqjh0Q+8QPEn1IyuKHMZjNnoI7gwxxmZN9hJwT6Y1833WCHV5vL7JDmd8erDHqcv5AGl8C6VUrFSRSVmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=caJtHJkxT5gA2xHrd9aHKUxASCSY+ZfiRtOduLHElkE=;
 b=YexEqbGOqvp0+Y5l6ziIisr6GkPDK4IjzuCMRWoA0YITr8XK7PZrZY0Y/OskEDcjbIN1IatwG6Gx4aOoA8uCD2yzNlKQt9Aub0WZAfQrKUqcFvpd1W3pMeKNq6/O2ENrJcQsEdd/nkc4ushABKIGfiOYLZ/xhPfxuENVsZ2gc8upenwOxZdaabeeN5ASQguFPBlOgBPxHmux/rhvcSjIK4cLcZWXd84TYWSt+87S7Blhr8ZWtSIdMQeHKl8zK7ZTVTXpPpeGTVYweF7vcVbcxJB8kecFZMwu2uNN7n2KRl21iKOEOJyeO3L7JhTt+PhutLHl9o0G12I+9BuC6HZbXw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by PN0PR01MB9765.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:14c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Mon, 24 Feb
 2025 15:40:29 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:40:29 +0000
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
Thread-Index: AQHbhsGm46fWR/3mxEipqc6+PMbxkrNWe38AgAAI1YCAAAcMAIAAAaKAgAACOwCAAAJQAIAAA7BUgAABjYCAAACPRw==
Date: Mon, 24 Feb 2025 15:40:29 +0000
Message-ID: <PN3PR01MB959780B670AB514305790D8BB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <Z7yMIC1wxm0AGBCt@smile.fi.intel.com>
 <PN3PR01MB9597D4FD9FD8B8A8FB0F2B3CB8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <PN3PR01MB959729DB53C0D359F8A83292B8C02@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z7ySdcYWZjCVd-7v@smile.fi.intel.com>
In-Reply-To: <Z7ySdcYWZjCVd-7v@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|PN0PR01MB9765:EE_
x-ms-office365-filtering-correlation-id: 6a3796e9-b362-468a-d671-08dd54e99136
x-microsoft-antispam: BCL:0;
 ARA:14566002|6072599003|19110799003|8062599003|8060799006|7092599003|15080799006|461199028|3412199025|440099028|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?M2VGOTVnT1hRZjc5K3BBNUMvNGlQRk4vRmx1Z21MSDlnaHJVMVUzR0VRSUpI?=
 =?utf-8?B?eU9JeHJKZmlkTGNPb1B2QTl1dFJmdXdZL2xDTlFlUmYwWXVKa2FjK1N6ckMy?=
 =?utf-8?B?Y3AzZ2NZUmo3akhNVGtrSkNmOEcrZjE0OTZLU3pQb210dVVINjR0c2o4K0NW?=
 =?utf-8?B?RUZQcldTQTRCTjhJUTlRZ3k1TENSQ0V1TmhGdnduYXN3eHNlMGxUcWNKUHEr?=
 =?utf-8?B?cHh0VDdQNzRXdFRXK2VQQnVXMi9ORG5nY3ArOVdRVVVaMkN6S3V5NmxYWnpY?=
 =?utf-8?B?NU9DalNsNjJBYlNKSFJOL3JRZ3pmY2txUlZvZFRuNHRkQlhTdWR3NEw4L0l2?=
 =?utf-8?B?N1dCWlppT1MvK0ZZSjVVSnZrMzdQWHJFTFBpOTRoRy9tdVVYQTdUNGxITGJN?=
 =?utf-8?B?NlgyRnh1L2lLMXJPVEt3cDVIcG55MG1WdXBqWDVEVWxZSkY3MkJVV013SWl5?=
 =?utf-8?B?VjZnbWxyT2s4anBhNXErS0haOUd6SGhSMUlGQmNmdFlDY0V2NHBSd0FJVWps?=
 =?utf-8?B?eUMzS1NhYmw1U0RlQStkRDdOajY0UzU1UzFLYURBaVNJMlA2OHBsaEdwVHQ0?=
 =?utf-8?B?MElZT1BRNlAxZ1FrSEg1QWhjbU94OWg3WG1STFFwdFVNbUdWTG9TbHRIL1Ax?=
 =?utf-8?B?b3hjZ0dGV0ZQZzd6R05VWjlldGFsREZxKzhSVHFha1BqRWJMR3dHRFhZWDMz?=
 =?utf-8?B?V21zUWlsTVFQTmZzbjhrbVhraTZKeHUzTFR2NDZNek5hdFIrVEE5N1pjNis2?=
 =?utf-8?B?UC94WjdUZkMyRWJwcDBsdjY5V1lYQ3JYK3BPMHMyV0VTRU84MEJMclJab3hD?=
 =?utf-8?B?MzFVWERCeUFEZW5yc20xWW0wRlNyQmU2MVBNWVN1MWdvdFZwTlhWdmdrdDRJ?=
 =?utf-8?B?clVrU051Q3JqTWc4MnplMFJUU2FockpuWjRpdmxmVUVRVFpQRi91VkpKanFv?=
 =?utf-8?B?LzJHMkQ4QktKeDFrRHJCampVcUJLeVJGcUxwRzJtU0pxV0hhUDNTRlhnN2VW?=
 =?utf-8?B?eklaN1BpLzF6U2R6eFpMNlBOdmcreVhSZFZaV3AvbXZRUjBBTEcwUHBTaXpz?=
 =?utf-8?B?eERPK1lFTVBkelVhSlA1K3hUcURuQndiWng0ZS9jeW8yRjdqdU02VTdhcWlr?=
 =?utf-8?B?MnJFWDRyeEFFZzk3bXFwSW1aeWZnVnpPL1N0T1NwbU1ZY2dRZzJId3MyZFdI?=
 =?utf-8?B?bG9QellwZ3RxeGIxaFpBaUdqYkw3V291L3QrMGcxb2M0UlB6V2pXS1ExZEEz?=
 =?utf-8?B?dUY2QXF4eWpXbFBGMjM2YlJISVBRd3pNdkJoemxFcE1zbXpRcHNVa2pENlZx?=
 =?utf-8?B?M0Q4RW1hamNZNFVJMzBSZ3lRTHE5anNrdFdQSWpidjMwbW8xRGFsY0FyQ2xp?=
 =?utf-8?B?QWZuOXVIMWZkSFBzb0trelljeUp3N1g4SjBWdmZ5cUh0eUV3bHdIVktmVURv?=
 =?utf-8?B?azZsQkowM1piZExPSEUySW5uWGx3K3dmQ2hzWnVUSE5oSTlIVS9iVENNYXFP?=
 =?utf-8?Q?VFm73s=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cENOcmVISm5sbHJGeDg3RnByOFVrdHlMY0Qrbk5uRGQ5T2VYYU90QnJpYnI0?=
 =?utf-8?B?T0M2dVk1VW1vOFBZdWtLS1hRZlVDTytXZkRIOExJOEhOV0tpdk52MVkvQ3ZT?=
 =?utf-8?B?M0Fhbi9EeTlRWklRc3ZsY0VxaWtNNkNIUVlCaXFOdENobWtwUHVnRnpXd2RW?=
 =?utf-8?B?S1hmcDJtN0xkT3ZGSzUwazBlNE5KSnpITitpNzdkRlZxSEkyREdWeU5qeGYr?=
 =?utf-8?B?RHloc0pRWmd1Qm0yVTNsZ0VueDIwc3pqc1NEVGRvQWR3UVBOdnorcGdoVDJV?=
 =?utf-8?B?dWkwb0VsS0l1eTN5Rk12dnVQSXdGdW5aYlJodStGNmlMNEYwSTBva2ZoQWJS?=
 =?utf-8?B?MWJ2OTVnZExxUTQ0Tkk0S3J2NDhQaXpSK0NsVnVXbkJWa0o0Nlh5RnhpY1Uv?=
 =?utf-8?B?YU5tSUMwemg5KzVPSjFUNjFxZTkxV1Z6eE1SQWd2TU5ROVJmOC9LNWpSRTJp?=
 =?utf-8?B?MEg2TDNTTFhaVERFYTRkQ2VlSkFRTnlhR1JaSk8rUHhnQXlaY0hMeFl1OTc3?=
 =?utf-8?B?YTF5dnR2alpqTUJTeTM4YkN5UzM4aXExNFgyWHZNVEs1T2dZalpGMFFFTm5W?=
 =?utf-8?B?N205cWluM2NBdmNPMXlKLy9vaDNlalpBUUJ2dkFRNGFXdWRjZk5KMkl0SDZ2?=
 =?utf-8?B?eDBuUlh6dXdVOVU4STF6ZzM1UkdmYmlWMytjL3VwSVJmOTByVmdlZUVnVVVO?=
 =?utf-8?B?Y2xtTHUwWUdpSWVsOGpiR1d1ZUYrNFBwOFpZSytrR3JUMzhuM1R5UTk5aEtR?=
 =?utf-8?B?Y2NRc1NXd3FveHN0Wi92SVliM1A1U0VkOUZJN2hhOW05TE83VkRqRmpabW5o?=
 =?utf-8?B?a2h6c2ErQzU0MnJHcE9MMjhvZnFFUXdUVER3YzBYazJ0N3RiMVQ3RFQxeW5h?=
 =?utf-8?B?U2ZselJvK3NDWnczdjcwb1NlYUIraFpOZFFLejhncHQrMXZtamRMTVFuUGlo?=
 =?utf-8?B?YjFXYXpnalB3NmI3MitoeGJGakJoWEt6TjVmWERnd1hpWngvbmFTK0k5dlhs?=
 =?utf-8?B?ditLdEZ0aFozazlRWUg2TDJqTHpQT1M2MjlDUEFCQzF1WWZ4b0RtOUFWQ1hl?=
 =?utf-8?B?dUR3NVRPeS9FcG96a0E1UksyK29DSk0xcWNJdTgxdkJMQTd0ekhseXN6b0N3?=
 =?utf-8?B?alZ6Q3BYRXR4RlFmTWY4RmxxRGIxa1kxMTBib1RqZkhpbmlJUUVxNjluREhS?=
 =?utf-8?B?enVJa2RMcFo5YmYyQkMxQStDbG1zZUFSTkZZVDZvNk9QR2dBdU9RMm9rUkJa?=
 =?utf-8?B?RTN5N0ZqbEhCSG0ycnFkVGRkOGxnTGtJZXEwZm5kcFlhZWtmREpCUVV0YjBV?=
 =?utf-8?B?SkJNSTVOcGI5TlY0WFpMdy9tanppUWh4anRyOE1SMWo3bC83djd5RUthNUZV?=
 =?utf-8?B?QjNEOE8rNm1pT0RwU2I3d0p5ZW9oWnYwTzhiVG91QkdGbkxYNWhIVnpaZWVJ?=
 =?utf-8?B?aVg3S0lOR1dSa1BkOU1sMk1Kd2s1T0lRMmhUYmNNOVZyZ1NJWnQ0WlZ4elZ2?=
 =?utf-8?B?SzcxWGlpT2ZpOGdFM1hVcjJ3cXdHTDB3SzAzOEhWenlod0dmWGtWWW83Tmg2?=
 =?utf-8?B?c0R1cUVIeFcvR0NCa2l6L3FKbzdUN2F1QWJXOFV1cWFmNE9icmxWclgvbHAz?=
 =?utf-8?Q?A79XsCqTKeFkfBhbNnT+5wPSxsOUO1uIXPr2RU8ZRXzo=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a3796e9-b362-468a-d671-08dd54e99136
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 15:40:29.6598 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN0PR01MB9765
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDk6MDjigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDM6
MzI6NTZQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4gT24gMjQgRmViIDIwMjUsIGF0
IDg6NTDigK9QTSwgQWRpdHlhIEdhcmcgPGdhcmdhZGl0eWEwOEBsaXZlLmNvbT4gd3JvdGU6DQo+
Pj4+IE9uIDI0IEZlYiAyMDI1LCBhdCA4OjQx4oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4
LmludGVsLmNvbSB3cm90ZToNCj4+Pj4gT24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDM6MDM6NDBQ
TSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+Pj4+IE9uIDI0IEZlYiAyMDI1LCBhdCA4
OjI34oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+Pj4+
PiBPbiBNb24sIEZlYiAyNCwgMjAyNSBhdCAwMjozMjozN1BNICswMDAwLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4+Pj4+Pj4+IE9uIDI0IEZlYiAyMDI1LCBhdCA3OjMw4oCvUE0sIGFuZHJpeS5zaGV2
Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+Pj4+Pj4+Pj4gT24gTW9uLCBGZWIgMjQs
IDIwMjUgYXQgMDE6NDA6MjBQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiANCj4+IC4u
Lg0KPj4gDQo+Pj4+Pj4+Pj4+PiArI2RlZmluZSBfX0FQUExFVEJEUk1fTVNHX1NUUjQoc3RyNCkg
KChfX2xlMzIgX19mb3JjZSkoKHN0cjRbMF0gPDwgMjQpIHwgKHN0cjRbMV0gPDwgMTYpIHwgKHN0
cjRbMl0gPDwgOCkgfCBzdHI0WzNdKSkNCj4+Pj4+Pj4+Pj4gDQo+Pj4+Pj4+Pj4+IEFzIGNvbW1l
bnRlZCBwcmV2aW91c2x5IHRoaXMgaXMgcXVpdGUgc3RyYW5nZSB3aGF0J3MgZ29pbmcgb24gd2l0
aCBlbmRpYW5lc3MgaW4NCj4+Pj4+Pj4+Pj4gdGhpcyBkcml2ZXIuIEVzcGVjaWFsbHkgdGhlIGFi
b3ZlIHdlaXJkbmVzcyB3aGVuIGdldF91bmFsaWduZWRfYmUzMigpIGlzIGJlaW5nDQo+Pj4+Pj4+
Pj4+IG9wZW4gY29kZWQgYW5kIGZvcmNlLWNhc3QgdG8gX19sZTMyLg0KPj4+Pj4+Pj4+IA0KPj4+
Pj4+Pj4+IEkgd291bGQgYXNzdW1lIGl0IHdhcyBhbHNvIG1pbWlja2VkIGZyb20gdGhlIFdpbmRv
d3MgZHJpdmVyLCB0aG91Z2ggSSBoYXZlbid0DQo+Pj4+Pj4+Pj4gcmVhbGx5IHRyaWVkIGV4cGxv
cmluZyB0aGlzIHRoZXJlLg0KPj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4+IEnigJlkIHJhdGhlciBiZSBo
YXBweSBpZiB5b3UgZ2l2ZSBtZSBjb2RlIGNoYW5nZSBzdWdnZXN0aW9ucyBhbmQgbGV0IG1lIHJl
dmlldw0KPj4+Pj4+Pj4+IGFuZCB0ZXN0IHRoZW0NCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4gRm9yIHRo
ZSBzdGFydGVyIEkgd291bGQgZG8gdGhlIGZvbGxvd2luZyBmb3IgYWxsIHJlbGF0ZWQgY29uc3Rh
bnRzIGFuZA0KPj4+Pj4+Pj4gZHJvcCB0aGF0IHdlaXJkIGFuZCB1Z2x5IG1hY3JvcyBhdCB0aGUg
dG9wIChpdCBhbHNvIGhhcyBhbiBpc3N1ZSB3aXRoDQo+Pj4+Pj4+PiB0aGUgc3RyNCBsZW5ndGgg
YXMgaXQgaXMgNSBieXRlcyBsb25nLCBub3QgNCwgYnR3KToNCj4+Pj4+Pj4+IA0KPj4+Pj4+Pj4g
I2RlZmluZSBBUFBMRVRCRFJNX01TR19DTEVBUl9ESVNQTEFZIGNwdV90b19sZTMyKDB4NDM0YzUy
NDQpIC8qIENMUkQgKi8NCj4+Pj4+PiANCj4+Pj4+PiBMZW1tZSB0ZXN0IHRoaXMuDQo+Pj4+PiAN
Cj4+Pj4+IEp1c3QgaW4gY2FzZSBpdCB3b24ndCB3b3JrLCByZXZlcnNlIGJ5dGVzIGluIHRoZSBp
bnRlZ2VyLiBCZWNhdXNlIEkgd2FzIGxvc3QgaW4NCj4+Pj4+IHRoaXMgY29udmVyc2lvbi4NCj4+
PiANCj4+PiBJdCB3b3Jrcy4gV2hhdCBJIHVuZGVyc3RhbmQgaXMgdGhhdCB5b3UgdXNlZCB0aGUg
bWFjcm8gdG8gZ2V0IHRoZSBmaW5hbCBoZXggYW5kIGNvbnZlcnRlZCBpdCBpbnRvIGxpdHRsZSBl
bmRpYW4sIHdoaWNoIG9uIHRoZSB4ODYgbWFjcyB3b3VsZCB0ZWNobmljYWxseSByZW1haW4gdGhl
IHNhbWUuDQo+PiANCj4+IEFuZCBub3cgdGhhdCBJIG9iZXJ2ZWQgYWdhaW4sICVwNGNjIGlzIGFj
dHVhbGx5IHByaW50aW5nIHRoZXNlIENMUkQsIFJFRFkgZXRjDQo+PiBpbiByZXZlcnNlIG9yZGVy
LCBwcm9iYWJseSB0aGUgcmVhc29uICVwNGNoIHdhcyBjaG9zZW4uIEFuZCBJIGFtIHVuYWJsZSB0
bw0KPj4gZmluZCB3aGF0IG1hY3JvIHVwc3RyZWFtIGNhbiBiZSB1c2VkLg0KPiANCj4gJS40cyBz
aG91bGQgd29yayBhcyBpdCB0ZWNobmljYWxseSBub3QgRFJNIDRjYywgYnV0IHNwZWNpZmljcyBv
ZiB0aGUgcHJvdG9jb2wNCj4gKHRoYXQgcmVtaW5kcyBtZSBhYm91dCBBQ1BJIHRoYXQgdXNlcyA0
Y2MgYSBsb3QpLg0KDQpJIHN0aWxsIGdldCByZXZlcnNlIG9yZGVyIGluIHRoYXQuDQo+IA0KPiAt
LQ0KPiBXaXRoIEJlc3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQo+IA0KPiANCg==
