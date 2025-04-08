Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A83A7F877
	for <lists+dri-devel@lfdr.de>; Tue,  8 Apr 2025 10:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 364D210E19B;
	Tue,  8 Apr 2025 08:52:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="KeHsVB9v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MA0PR01CU012.outbound.protection.outlook.com
 (mail-southindiaazolkn19011036.outbound.protection.outlook.com
 [52.103.67.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73FC210E19B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Apr 2025 08:52:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xU2j83Pbw6SgFqc1YgAVLWEhRC9ujgqDxcWnJ3G4CIzN88XZcKcmuhPAS7jYbsf+HSGt53vOW/rawUAf4DxBNxxM/Jn3c4K2UW3NMxILn2TNH6s9W2hLg2zW/Q5HAeX8XvFoNaDfqgvirJYtoby71NcCZiU79+OQ+DJ17NptNJ1SRVt36CeB2wLHJ15dtDbL9ZkEsk0Eeav476DM0bPN+9A2q0qJ+bKd0hPgWeB8uywq/p/pEZrKKuUAwwvZE8WgoRRr4+FGXECfE2j/e5iqz4V6k9IPvulx3YjdqDAPLWt4tEP1vvsxJ/25H08NhzZrHluJ1+RSaIZtYNFft4c5bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0rEvr1V5JU9s/Y4JaBw5QUq1BinZMUFI5F8iT4EOs18=;
 b=JdgwLi5GRca0TdQkBg3uovz8QO4uLAYF/zCIqgfEHxx6a6oZ9T0R/oUHsLDtE6BDAsFMGjcHA5TPwQnzlQ7fixcPIFoqUdASFWICUc1RQ1mZ/k0vd2isi+mC+P6nP+KMDSowIgDcIgd5Rs7Jo9Z6oy0wSIszh491JFRRNjMCLqRiYFsg9MvaCqhVQLMckwj4Ly9VPfHKN7shYcnb6N8ofG5wpKVoo/UTyKtHrE4051VrJjVfr2U4d8p3sSBhLi6OxFtopKKC1BOuwg6fYDNdhrslGNdw/v3QIdt7xBGFreIkVc9AHZa9sXEpBIukFECm3iIUxm1JDGCjY9o6O+8M3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0rEvr1V5JU9s/Y4JaBw5QUq1BinZMUFI5F8iT4EOs18=;
 b=KeHsVB9vJkDqOvdIq60bDCKFkLv2Evtnifo1m9pR7mqjkRypYhvX+6DY002Jw41umwiGBJlZ3P/BV3/euIFjY7CZ3wqVp95hdMWmk0pqG3XWxZmAh+g7XrsgMRS2g1DTM0KJcEOC+v82gciKtOmr4PVx4ro41BARl8j7xqjoRwj5OySzR+nVjYv3NG8AjW6rDmq6UhMR1tvwCF9GmeFP4eIVAonl28iccQ0igwYkQkB3LJQZoxlgVDY9+50/7gMi8fqWVYWOOEfR6BWVPFl/hJiEQHE6Hl6LRGQ+HfIPEcXAfKEQNQRbnj5XR532Wf0BqGVG4iT7D+JktITWnjBlaA==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB7635.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:3e::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.35; Tue, 8 Apr
 2025 08:52:11 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8606.029; Tue, 8 Apr 2025
 08:52:10 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: "alyssa@rosenzweig.io" <alyssa@rosenzweig.io>, Petr Mladek
 <pmladek@suse.com>, Sven Peter <sven@svenpeter.dev>, Thomas Zimmermann
 <tzimmermann@suse.de>, Aun-Ali Zaidi <admin@kodeit.net>, Maxime Ripard
 <mripard@kernel.org>, "airlied@redhat.com" <airlied@redhat.com>, Simona
 Vetter <simona@ffwll.ch>, Steven Rostedt <rostedt@goodmis.org>, Rasmus
 Villemoes <linux@rasmusvillemoes.dk>, Sergey Senozhatsky
 <senozhatsky@chromium.org>, Jonathan Corbet <corbet@lwn.net>, Andrew Morton
 <akpm@linux-foundation.org>, "apw@canonical.com" <apw@canonical.com>,
 "joe@perches.com" <joe@perches.com>, "dwaipayanray1@gmail.com"
 <dwaipayanray1@gmail.com>, "lukas.bulwahn@gmail.com"
 <lukas.bulwahn@gmail.com>, Kees Cook <kees@kernel.org>, "tamird@gmail.com"
 <tamird@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Hector Martin
 <marcan@marcan.st>, "asahi@lists.linux.dev" <asahi@lists.linux.dev>
Subject: Re: [PATCH v4 0/3] Use proper printk format in appletbdrm
Thread-Topic: [PATCH v4 0/3] Use proper printk format in appletbdrm
Thread-Index: AQHbqFISqYppg0YGuU+gL+V/nAqiTrOZc2oAgAAC+Nk=
Date: Tue, 8 Apr 2025 08:52:10 +0000
Message-ID: <PN3PR01MB959761E1B759183D83C1AC33B8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <PN3PR01MB9597382EFDE3452410A866AEB8B52@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z_ThPOOKXa3VwvmO@smile.fi.intel.com>
In-Reply-To: <Z_ThPOOKXa3VwvmO@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB7635:EE_
x-ms-office365-filtering-correlation-id: 2889320b-5af6-4bb7-5468-08dd767aa66e
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|461199028|8060799006|19110799003|15080799006|6072599003|7092599003|440099028|3412199025|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?aUhud1lrQllONTNXWHlmRDNFeEpBWGNZb1lDT3pkdU1adWZYMElvdVNQMG9O?=
 =?utf-8?B?MFJYUVU2d0FaaUl6MzFNcStrdVNrakJTRnFCYklLelBHZXZXQlhFOVpzbVlX?=
 =?utf-8?B?dzJxZGVQemlsVVJuT3dlb3cvc05oMTRrem9uQ0lReXRZajdISXRWZW92RVBn?=
 =?utf-8?B?MXRMOGxBR0t2YlNvWHJwMmNpK2pjNVF3K2lDYVZHVUVEcUNhMDAyd0tzayti?=
 =?utf-8?B?V05kLzQ0UHZMN05KVWNYUWsveXlicHZSVTBkNmhISm4yQ1QydjQyK2xvcnVL?=
 =?utf-8?B?cTVIeVNMZ3R4cndGakNMVHAya21LRGpQMHcyM05RbERvckF6KzBGTTlJM01W?=
 =?utf-8?B?U0l2T2ltaHhDbG81dGZuN3BNdzNEMy9lc2Npdm50Q0RXY2xGMXFUdE91Tm9N?=
 =?utf-8?B?SlkySWl0Y0ZGekFERVZYMjF5K0E3aTR6YW0xSlVIcWI3OVJlbDBHaFVLSmVN?=
 =?utf-8?B?d1RCYXNiYXdkTlhxSEI1b3RFTkgwYm1Fc3pXaXdOaHRJVXpxOTN6N29yVzVz?=
 =?utf-8?B?OU9lQ0xoM3R0WWxKWmdxcU9JS3A1NUVyS09oem1qTDNUOHE0ejNZOGd3clli?=
 =?utf-8?B?bXUzRTl3ZXFFdVNvRmdpM2l5NSttNG16VXVVdjNScHF4aU1LTUxyVC9RS3E4?=
 =?utf-8?B?RWJYaEdjSnR4aVViRjUxSGlJOVJtNkl1SWQwRnNpbnYwZ2ZYc3ZXSm1EZmJ5?=
 =?utf-8?B?ZFB0azZFT3V4Z216Q0pnQVJPR1cxNTNBQXk1aklwYzBNU1cxSnV4cG1xUVA2?=
 =?utf-8?B?MERrTTRPUEJWbUxBRG5KSDh6MTc3Q3R5eExjK0I5aDZlRmgzZHhKUnlncHRK?=
 =?utf-8?B?UHA4blJzOVVRdnR2MWpBeHRDYVVwS2FxZ0kwNzlZM2JvcDNqNUJGN3hkQVJO?=
 =?utf-8?B?NnJORThSSGtzQUN2RHJ2bGs2UUtuRDNXcHZhWDNXSkhyQ1hKZWtmYi9sSnl3?=
 =?utf-8?B?dzY1UVFNQzhpN1MyZ2FaU3J5L2w3WGxXRWNjUit4UWU0djY3T0g4YWg0bkV2?=
 =?utf-8?B?RWhDdlViSXBTMExVanIwT3kyZnZKVjlRWGJ2L0lhNXNISVliVy90YmF3WlFq?=
 =?utf-8?B?TkYvNXptYlZoUzVOYkZCK0htMjNkdFNDcVpzL2dZRFZiZWVlL1R0WUdBelJQ?=
 =?utf-8?B?SHRMeUlGVGFya1YxcHA1ek03dXVwRmpWQUZLNVRESnBMMXo3L0lpZFo5VzFK?=
 =?utf-8?B?aUNMUUlkcm0zSlpCRTNwdEF1WVhtdjFsUFpDSHZONTFLZ2REZ3R0Y1J6S2ty?=
 =?utf-8?B?K2FLOWNCamJDZDFhQkhncDV2WnN2anhaa1JzSHZFMGF3ZWtLQmNMSSsraGlI?=
 =?utf-8?B?SzhRWVprMDJNTDZmOFJTZmJTZU9wbVBKVFdwbi9YVXkyM1RqVnFkVFl4cy9D?=
 =?utf-8?B?c0VtV3hTTnFLZjR1QXhDcFNkOWNvUGpkOEdqcDlBZVZGRS9COHQ2UkNYei9L?=
 =?utf-8?B?aWV0anZFdUdxY0VGRkNnUU9yeUp3NU9xelNsOU15aTlwQVErRlhyM2hoNklR?=
 =?utf-8?B?NjZuTFNFcEMySjZMSmpWQnM1WEpIM3d1WHp0WXhqcWxKaWgzME9TNkJTR2tQ?=
 =?utf-8?B?dFFHUT09?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WGY0NGZWaVV2MldxRVhIcURmV0M4Wm9Wa1NPbDZvTXF0QjByVWZCbWdpZjA5?=
 =?utf-8?B?RW05cXhodnl3Mzg3S1FySXh0bG5DNW4xb2xtaU5YNGM1VHRXbXhvdVBla0hI?=
 =?utf-8?B?eCt2cXZ6KytTVGoyUFFYKzZLQWdFSno3M0RFWDVqRUM4Z2U1RWxyU1JSUHBp?=
 =?utf-8?B?VU1KT1lxV2I1TFQzK0hEaFpRdWFWejFKNTBVeGdOS2NONG53bkN6SCsxYm5G?=
 =?utf-8?B?dFIwUE1BVUpvT0ZNQThZQ0VxS1YyZVZHRVBwNXpvTFpQa0Q2TFlBei9xNVdV?=
 =?utf-8?B?MGY4WmZtaEJMZjlhVDVFemZQbkZCZU1KUzIxSVJCSUkyWFRrcmdXTmswZ3Vl?=
 =?utf-8?B?aG9SaFFHd2tuS0JsYVFYbGJ1YldzV2pvWEhlN3Nidzhob3VHVjlObExDZlo3?=
 =?utf-8?B?QU9yS0NxUkhqdFhUZGFkeVNCUGR0REN5YzAvRVY5cSt6cGkrVGJKSHdmOFFa?=
 =?utf-8?B?TGFnTFdXcG4vbzFnaHFtb0YyKzR6eWNwU1BlNERDRDg0MExRZ1pmYTBJeHU5?=
 =?utf-8?B?V3JBWlBSaG9tWllsNEV2OXU5bEkyUGpPN3NJbndEbVF0UjRQckFYb2xzZkpj?=
 =?utf-8?B?R1lTbkFHeVNPN1JjNVVMdk52cGR5d2JOSUZUa282NkpvelN1cW1yRjR4WkFm?=
 =?utf-8?B?akNzVDE2NThDZmtSY2ptT2ZROURDZm5FYm9RRVlYc2ZHSHNWa0F1bnV6MzNQ?=
 =?utf-8?B?ZG03N0dLdkJCZUhabG5nRGd2cnZoYWZoZ0ZHRHIzMWZ0a3BXalZyMkhoZjBl?=
 =?utf-8?B?OEV3UWw0dWlUcUNpcWdGZWliaVA5NWhzczNJZlc1YjFCUHQzWDB2Y2RiZWpN?=
 =?utf-8?B?S3VTR1FOeXkrSWNGUFlzVzUxMVREVjMzS1ZkZmNJWTl3dVB1K0h3UFo4Z1Y4?=
 =?utf-8?B?citCUng0QTd5MkR4NDNjczBYeHAwdzEzd2NWZWNrVFp0NEkwRFN0UWo1b0ds?=
 =?utf-8?B?MGgzREJLK2QydUVTY3FVWi9YVkVPd2dMNkNpL2xUYTNDemFCTWVqa3FmWFhH?=
 =?utf-8?B?Zy9pbDF5ZDhnMTBCaU04eGFQS0FCMDNseHVUbXRpZzloUVQxa1JMWjhFSUwr?=
 =?utf-8?B?eGlsVTJlaTFkUEQvZHhuS1Z2dUpNV2cxTm82dzJwQlVtbnNSeEg2akFaUjli?=
 =?utf-8?B?ZkpYc1ZDY1B0ZkZjclZNRnVwcnUyTGhZZWpFNmRiQmlVQUlDakYvTkY1V1RO?=
 =?utf-8?B?MjBnKzcxVDR0VUEyRWdVTFZCeENweDlRYmdLUXVtbTVPOG5jVks4dXBXa0Zs?=
 =?utf-8?B?TTNrZTlva3owMGhxQmZTNFpVckRVbEViRERtSkFEbjFrVnBsTk1Lc2UwMSt0?=
 =?utf-8?B?N0JwRUNSMTZVSko1YkRFalB0cXZiTTRBZFlYZWdqaGdtaENPc1MrRFR4YWJk?=
 =?utf-8?B?WS9kOFBHZ1ZJZE1EMmlJYWR1L2hmc1VmdEQyaW5XZ0MxZWdQQkROWlZDRWZv?=
 =?utf-8?B?YzZsTzFXdDVNN3F3ZUVQQlBwRmlaS1M3akVCL0lnaWE1WTVBNFEzcm9KUmV2?=
 =?utf-8?B?SDNnQnkyckx5UmdIU2h4NW1yN1hlR0haSnFaV0UxbllWNU1qZG1xRXl0bERO?=
 =?utf-8?B?SkpwWkRPSittRnd3clJreDMxOW9mM0p0MGZ1THdHUW9LUkozYkZBcVVTc2Ey?=
 =?utf-8?B?Mm1USFBmaTNLREtNQTdialhFcXhiWmZqRVJ5QmR4amVubzRUOXMzQkNTZlhJ?=
 =?utf-8?B?TE5MbFZTY2FMQTd3YlkyWUozOGFjU2Fvb1dHaFEySXo3M0VWOW05TkRTR3c0?=
 =?utf-8?Q?iW9GECbNbp8XNMgKs8=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2889320b-5af6-4bb7-5468-08dd767aa66e
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Apr 2025 08:52:10.6535 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAZPR01MB7635
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

DQoNCj4gT24gOCBBcHIgMjAyNSwgYXQgMjoxMeKAr1BNLCBBbmR5IFNoZXZjaGVua28gPGFuZHJp
eS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbT4gd3JvdGU6DQo+IA0KPiDvu79PbiBUdWUsIEFw
ciAwOCwgMjAyNSBhdCAxMjoxNzoxM1BNICswNTMwLCBBZGl0eWEgR2FyZyB3cm90ZToNCj4+IFRo
ZSB2c3ByaW50IHBhdGNoIHdhcyBvcmlnaW5hbGx5IGJlaW5nIHNlbnQgYXMgYSBzZXBlcmF0ZSBw
YXRjaCBbMV0sIGFuZA0KPj4gSSB3YXMgd2FpdGluZyBpdCB0byBiZSB0YWtlbiB1cC4gQnV0IGFz
IHN1Z2dlc3RlZCBieSBQZXRyLCBJJ20gc2VuZGluZw0KPj4gdGhlbSB2aWEgRFJNLg0KPiANCj4g
WW91IG5lZWQgdG8gZG8gc29tZXRoaW5nIGFib3V0IHlvdXIgdG9vbHMsIHJlYWxseS4NCg0KVWho
LCBJJ2xsIGp1c3QgcmV2ZXJ0IHRvIHRoZSB0cmllZCBhbmQgdGVzdGVkIG1hY09TIG1haWwuDQoN
CkFsdGhvdWdoIEkgZG9uJ3QgdGhpbmsgYSByZXNlbmQgaXMgbmVjZXNzYXJ5IGhlcmUgbm93Lg0K
PiBOb3cgaXQncyBwYXRjaCAzIHRocmVhZGVkIHRvIHBhdGNoIDEsIHdoaWxlIHRoZSByZXN0LCBp
bmNsdWRpbmcgY292ZXIgbGV0dGVyLA0KPiBzZWVtcyBva2F5Lg0KPiANCj4gDQo+IC0tDQo+IFdp
dGggQmVzdCBSZWdhcmRzLA0KPiBBbmR5IFNoZXZjaGVua28NCj4gDQo+IA0K
