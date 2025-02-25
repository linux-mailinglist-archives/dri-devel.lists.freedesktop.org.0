Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E2B4A44580
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 17:09:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25DF10E73E;
	Tue, 25 Feb 2025 16:09:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="HeZnMIJ3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNYPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19010001.outbound.protection.outlook.com
 [52.103.68.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 338D910E73E
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 16:09:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LJZ4QkDiau+UzyyNy5DpJkciB0tW5Em/ibQ5nIKklU//iitBXZXliGlDOK23hiwr65Fbo4X04BxM+9l/TOvkxAhXytzWCGDiRCf4cHmOD4ao0hmoLu34RuJpU9Bnh/QL0kha3wDVVCrf/4sXAQs82jeruJzEBzFOvYPsOHdX52XFY/FJvgRB/CZgg3gUzD8NqoJfr7jQVqGVdSCCPByfMdMBA1n4q4B7sB9Oycafy5O23YF0RAI+CKiuhznt79sZVXwyX83l4Kdyd8uPVd23K9Jv8h1J4LhY2jM0Mau1XtyEl6YnGpE1B3dG/HQ3Z1rbUC8qoOP7n4YY9Ddaat/HNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hllfPKyXp9N+ws1NnoI/yTPM29j34hNY5Fhd+8C/MQY=;
 b=PuyhMi0ChyWt9wGnobvy3mAW8Chkmk4WFz+S95z44z1wqGdKimcG52+QPzobMsjinVlFg9NxI948ZClrI3PYlHUOaoqXOtuRv/k71WXRmBuDLCM2M0TmREncVGvVhxLlb//+TbAU3BmUnYYBBe/NG4seswvzfWM2BvydPw4nYoFJkiyEXRbhtyHWMyjCjf7/o0PAzr/lYaJge3OFPYaQiKUg4jTNlUm4F/DhYdkWFoFIqzN7hJJRTHOiRBsBUcwomgLLd50XnThYfSosME9aqppw/YavdorNAdg6kkr+ulUIUnEPo5dlaQrdmhOzDomPaaUNjcgRjJS1IFXztFAyNw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hllfPKyXp9N+ws1NnoI/yTPM29j34hNY5Fhd+8C/MQY=;
 b=HeZnMIJ3t1T1fBlIsAI1QPxka7sc2Snfle0Fd861CuHrSfLNJM696yZ4XgJM4N7+ceRaCjgARXxcCW4vXc0L5I08xpKy6Ht7bgIsTz06RAVlYrlupY1iVUeVNdTHc05Np8FjFthG5PW9QGcPX7lAtipMGaSEVbbpv3u4qy3GH4/hKHnHbnVeZ+nHVTDZFEkLo+wPY67rjdFSIS22cl7vjQXXsu7tMibSSDxjc4qw6EOduugba161FFbUMmw9VHjVvZa2SsJzxAmXE+PrrFZJPGWEzWFJClIkmp2VqgrHVekOM/D/HywUdmlHRBs+TiThVVsQrxdXJGpTD+RZETAGzg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAYPR01MB10666.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:15b::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 16:09:09 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 16:09:09 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "airlied@gmail.com"
 <airlied@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay
 <kekrby@gmail.com>, Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi
 <admin@kodeit.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbh21jOPDlavrp2kW5T/JI6UK95bNX0p8AgAAXooCAADE6yoAAFCiAgAAAtSo=
Date: Tue, 25 Feb 2025 16:09:09 +0000
Message-ID: <PN3PR01MB9597AC25AAC82FC9BAC0598AB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <c0249cd8-68e4-4860-b5c3-e054df10ae30@suse.de>
 <PN3PR01MB9597287D0FFDBD11CC1F6167B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <28e67cc5-6932-48ac-84ef-93af893b2ed9@suse.de>
In-Reply-To: <28e67cc5-6932-48ac-84ef-93af893b2ed9@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAYPR01MB10666:EE_
x-ms-office365-filtering-correlation-id: 3b458eeb-b701-4008-20f1-08dd55b6bcc2
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|19110799003|8062599003|461199028|6072599003|7092599003|15080799006|3412199025|440099028|10035399004|41001999003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?dmdQbWhHcUhFRjN3TjNpekh6NFBZY040OEhRYm9ua3ZRSDNxMmlNWFVjNWIz?=
 =?utf-8?B?RDFIQnhnZEI1Tzl0dXoxUklMdGNaa0pFQW5vYUNySksyZlFlbHN1ZTloOXp1?=
 =?utf-8?B?Q3pYZHVONW1PNFlVdnB4cjFpdEhLRU9yaTcrd2ZlK09HaUN2YzRjL1JhZ2pM?=
 =?utf-8?B?UUdRNisrMjB2Wlh2bTFIbEdTS0xuTHNFQjAvcFNYZWllVFcwbW9xN0tOZW44?=
 =?utf-8?B?UkdhMDBDZWJNcGFiL3REWTZJNTFGdnk2SnVsS0t1a3VmL2Vzbkw0MXNoRmNS?=
 =?utf-8?B?RmxzbU5WVE1iSHlzakJ2WVhUVVF3Zm1HVlZidVR6OG83RFUrYWVhOG5Nc2NI?=
 =?utf-8?B?Z2FzMjM0T3VGaWNGdjZKTmM5c2lZbnJFN0FFMVVnaldiWjhNUFkvLzRvQk9o?=
 =?utf-8?B?Mzc4RnpCL3hkSnhnay9Ma1M3bGJoV1dlSld0YlFXV1diODRMM2cvanpBaU1V?=
 =?utf-8?B?YTZuZldpb1JLa2pZMDZLU2xmU2FsTUtWd0g4NWkyVVhGUEg0anJJdnFPQkx4?=
 =?utf-8?B?L3ltV2NYbm5zMXQ0THFwTUMwRHh2K01RdW9vcE9ma2Y3eTN0RmVBL1NtK3ho?=
 =?utf-8?B?WWVGY09yWk9WVkRGZnNXMEdyaEwreWxlcVdKZ1ZtTTAzdUZYWG9VYU9qcHAz?=
 =?utf-8?B?aDlhOUx1TTl5eGN4eEZzOWZKTU5EUEJpYzh4MDd2ZFBPOTJ4ajRrMzN0SkNW?=
 =?utf-8?B?WGFyWEJ1bHJQcGNFS3E2b1A1NVIyS2VHSUkzVGZjL1ZxcUZpMEN4TVlGSlpl?=
 =?utf-8?B?d3I4M1E2SFUzOExiaGpBUlN6L3FGb2tPcmFnVVg4TmthVFNrQStRSjZ1c3lN?=
 =?utf-8?B?bFRzek1tYlE2b0NiUHdFZmVVZHkvelU0VWRsc2hIWGRDL0VyY0VrbWZrRllX?=
 =?utf-8?B?bFZiV1AvVUxaVHZGbFhYbi9jQ3JWOGFPUXVjK2dOV3h0RDVNZVNQOU15c2hE?=
 =?utf-8?B?aDk1NUd3VVkrZXVmeFFwaGFFVTZCd1lBZGZuSGVLS2pvQnhldGNKVmphNlNl?=
 =?utf-8?B?QXlGNXRBOEhjYVdmK1pNL3AyWU1WMi9FZFlDOFdHNGJqOVo1dG8vMlVyY3hz?=
 =?utf-8?B?VC9XRkdYVXJ0bXp5WEYwYW9GZGt5QTRCaGZnVWtMaFErOWYyWlFaNHZ5eVYv?=
 =?utf-8?B?Q2Vwc0NZR0drVy8yNHNUK3VGUlpmR3pxcmZjNXVKS1BFYVJKM1A3MzUrSk9i?=
 =?utf-8?B?QlhvUUM4NFVxMjJZUk10a05oWXBUVlhhTytjbit5QjRYSWRSNGRtNm1MN2gw?=
 =?utf-8?B?S2RKbTNhY09lUVdjMWZRZDZuZmZyZ08xSkxBVnZ1WVpkQUtMaThZZGhYbm1C?=
 =?utf-8?B?RU5NLzRLcmUwaCtyOVVxYWdBSUtBdkFlazIzaFhTbHp3OHZNV1hNNGhqV0N4?=
 =?utf-8?B?aDFDdTVXY0NtNm1La0s0WTVZMXdFQUpudCs3R1JpMGl6N2pzSTJlZkMwczc5?=
 =?utf-8?B?YW5Mc3ZLRGJ0aFV6cGZzQnVuMENVazRKaEEvM0ZObHRuUGxzRkdPNlNhS1hR?=
 =?utf-8?B?WVdzTDhzbjNMZlM1bE1PeEYyaXJDbjFEb3NFQ3Nxc216K09wU3dSditOYmw3?=
 =?utf-8?Q?J+3d8kH4c0yFPbfUt8Yv6P29m5RHoAi98h3D6lhzelihm2?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?U3laMmpnUkV6RFUrUWh3aU1ZaHhIWUNSNlhsYU9Wck0vMTVRdHd1M044anky?=
 =?utf-8?B?RVoyWXYvMHBVSzkrUEx6c3RUYVVqaGMwY0VZY3BETDZ6cUR0cWVzZCs2UU9o?=
 =?utf-8?B?V3VsQmt6aW5jR1c5VlpJVDM2c3dnbnFiYnpJaVRvU1I2eVg4NE5DKzVkTm1q?=
 =?utf-8?B?TllaTlBWaXNqMmlNdWtVRGJ0anJzZjdNcks3ZkNOTTRIY1ZQRHFUMy9qQlN5?=
 =?utf-8?B?UXdCWDY3RjAvemRzV2dnMHJGY3FVcU5ZdVlEOXFVYnpzWWl2dkNIN09lMVIw?=
 =?utf-8?B?T0lrK2ZKWE1wZnRnRFF3TzRVNGpoTEZXQnpJV1djMVp6aW9DK1V5Um5KbzBU?=
 =?utf-8?B?WHVkMm1LZDh2akNhNG10by9SS2ltS2p6eVFJdVZOSDdMY0RXVXJodG45NVBI?=
 =?utf-8?B?T2NEZ1MxZEhJWDdHTDRHUU4wYllXWG4yc3NYSHU5MWhKdXhPTjczV09kbm0v?=
 =?utf-8?B?NVpzYUhGZzVhdUVxMUxsajVDZHA4U2YvOVJUUExZYkgwWFV0enNaWS8rZnk3?=
 =?utf-8?B?bnRPTE5IbFhlK1dPazBuRVlvVHBlVU5ocXJVZURKU1RtK01haXdNLzR1aEp1?=
 =?utf-8?B?bVYwdTNXa2NzeXEvMGpBK1R1bkVQOEg1anJqNVIyM1hMam9qaHNZTENPTmJy?=
 =?utf-8?B?VWY2RFVBOENqdks0dzVwS2paMFVVWldpK2FjWjduU2xBcTdLZnJ2aTdTbWVx?=
 =?utf-8?B?SnhPMDQybk9jME5kRHJoVTgzNDRjYnZhTHRUWlBEZGFweldYbGk0Q2JreURU?=
 =?utf-8?B?Qk5HUVNESHBqQ1RzLzVVRlFMdU8yTEZLUWR6L0ZZN3JPNXdTQUwxWjJSOGlG?=
 =?utf-8?B?VUlUODd5Z1pHSDRZVTd5ZEEvc3BsTGduRWN3NlJRMnQ1VEhXV3lrU0ZpbjNP?=
 =?utf-8?B?SlNPTmtWbTQwcU9uaHhzYzVGak55R1BNZ201SW5XVGVRdGIwUHBYZXRDMnVK?=
 =?utf-8?B?MCtXNXQyazFkemlMSysrQkxleVZvbXlQTVg2VXVNYW5SUXR2UmtvVXVwQ2xF?=
 =?utf-8?B?QlVXbko5TmZCVHBEWXF3dXZYQ0p6UlFFaXFpUDMxYlVSSDNhUDZ2K3g0dUZV?=
 =?utf-8?B?Yld4NHFIaWVvdVlFdE56OE04eG1qRGppR2pGS2NKQnI3MzJLZnBldjIrcFZ3?=
 =?utf-8?B?bURKZ2NTbGtpVDhOM3NCMFA2TEFmZlhYWkJIZTBiczJPbk52bVFOamJjSXY5?=
 =?utf-8?B?TUl3VlQ3NVVsRk5tK2tIZTMyWjZkZGdzNTdFMEhuSzNrTnpJRnA5NjlNZVBW?=
 =?utf-8?B?QlNCMVFmb0h2ZkV3YzRqdkg4cHYwWUd0a1o2OHY0NnAwbCt1MXVQZ3Z4djBW?=
 =?utf-8?B?czA3MGRtdFJjVjJJajhBclcwQjVvaTBXQmJTWWFWVW5CSzkxUUxzSFFhNEI2?=
 =?utf-8?B?b0YybXh1c2RmeWN1aDlNSjN5T0ZyYlJRV3hTNUlBVUZDYUlodHVrNVc5Rm9F?=
 =?utf-8?B?MW04bkFYOE1vSllzVDIxcGN4bE1scm9OdEFuTE9ldTlMM05ycVhtakd6TlZM?=
 =?utf-8?B?ZDk5ZFlGKytQTS9MUzZieDFSQkZGSDBTWjdZNWJjQjFEZWxuVmUvUjRYU0ZD?=
 =?utf-8?B?SHhkUmJhc0tzQmtxdFpiZk1VQStUWFk0YUEvUDN6SkZ6SFptVHhrY1R4Skd6?=
 =?utf-8?B?bWZtbW00YTlHVmdHZ1RLK2tFK21BNVNUQ2JGWFhBM3F0UWcyMGRxbnRuYVVi?=
 =?utf-8?B?MzlGa3NsSkZhT0p4M2VhVFk1OW0wRlM2Q1JyUzBmN01sNEl4TnNoZWtEaFBO?=
 =?utf-8?Q?ouit+q3Q4M/fcartDU=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b458eeb-b701-4008-20f1-08dd55b6bcc2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 16:09:09.5296 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MAYPR01MB10666
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDk6MzbigK9QTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4g77u/SGkNCj4gDQo+IEFtIDI1LjAyLjI1
IHVtIDE1OjU0IHNjaHJpZWIgQWRpdHlhIEdhcmc6DQo+IFsuLi5dDQo+Pj4+PiArc3RhdGljIGlu
dCBhcHBsZXRiZHJtX3Byb2JlKHN0cnVjdCB1c2JfaW50ZXJmYWNlICppbnRmLA0KPj4+Pj4gKyAg
ICAgICAgICAgICAgICBjb25zdCBzdHJ1Y3QgdXNiX2RldmljZV9pZCAqaWQpDQo+Pj4+PiArew0K
Pj4+Pj4gKyAgICBzdHJ1Y3QgdXNiX2VuZHBvaW50X2Rlc2NyaXB0b3IgKmJ1bGtfaW4sICpidWxr
X291dDsNCj4+Pj4+ICsgICAgc3RydWN0IGRldmljZSAqZGV2ID0gJmludGYtPmRldjsNCj4+Pj4+
ICsgICAgc3RydWN0IGFwcGxldGJkcm1fZGV2aWNlICphZGV2Ow0KPj4+Pj4gKyAgICBzdHJ1Y3Qg
ZHJtX2RldmljZSAqZHJtOw0KPj4+Pj4gKyAgICBpbnQgcmV0Ow0KPj4+Pj4gKw0KPj4+Pj4gKyAg
ICByZXQgPSB1c2JfZmluZF9jb21tb25fZW5kcG9pbnRzKGludGYtPmN1cl9hbHRzZXR0aW5nLCAm
YnVsa19pbiwgJmJ1bGtfb3V0LCBOVUxMLCBOVUxMKTsNCj4+Pj4+ICsgICAgaWYgKHJldCkgew0K
Pj4+Pj4gKyAgICAgICAgZHJtX2Vycihkcm0sICJGYWlsZWQgdG8gZmluZCBidWxrIGVuZHBvaW50
c1xuIik7DQo+Pj4+IFRoaXMgaXMgc2ltcGx5IHdyb25nIChhbmQgaW4gdGhpcyBjYXNlIGV2ZW4g
bGVhZCB0byBjcmFzaCBpbiBzb21lIGNpcmN1bXN0YW5jZXMpLg0KPj4+PiBkcm1fZXJyKCkgbWF5
IG5vdCBiZSB1c2VkIGhlcmUuIFRoYXQncyBteSBwb2ludCBpbiBwcmV2aW91cyBkaXNjdXNzaW9u
cy4NCj4+Pj4gSW5kZXBlbmRlbnRseSBvbiB0aGUgc3Vic3lzdGVtIHRoZSAtPnByb2JlKCkgZm9y
IHRoZSBzYWtlIG9mIGNvbnNpc3RlbmN5IGFuZA0KPj4+PiBiZWluZyBpbmZvcm1hdGl2ZSBzaG91
bGQgb25seSByZWx5IG9uIHN0cnVjdCBkZXZpY2UgKmRldiwNCj4+PiBUaGF0J3MgbmV2ZXIgZ29p
bmcgdG8gd29yayB3aXRoIERSTS4gVGhlcmUncyBzbyBtdWNoIGNvZGUgaW4gYSBEUk0gcHJvYmUg
ZnVuY3Rpb24gdGhhdCB1c2VzIHRoZSBEUk0gZXJyb3IgZnVuY3Rpb25zLg0KPj4+IA0KPj4+IFRo
aXMgc3BlY2lmaWMgaW5zdGFuY2UgaGVyZSBpcyB3cm9uZywgYXMgdGhlIGRybSBwb2ludGVyIGhh
c24ndCBiZWVuIGluaXRpYWxpemVkLiBCdXQgYXMgc29vbiBhcyBpdCBpcywgaXQncyBtdWNoIGJl
dHRlciB0byB1c2UgZHJtX2VycigpIGFuZCBmcmllbmRzLiBJdCB3aWxsIGRvIHRoZSByaWdodCB0
aGluZyBhbmQgZ2l2ZSBjb25zaXN0ZW50IG91dHB1dCBhY3Jvc3MgZHJpdmVycy4NCj4+PiANCj4+
IE9rIHNvIHRoaXMgaXMgYWN0dWFsbHkgYW4gaW50ZXJlc3RpbmcgY2FzZSwgc2luY2UgSSBhbSB0
cnlpbmcgdG8gZml4IGl0LiBUbyBpbml0aWFsaXNlIHRoZSBkcm0gcG9pbnRlciwgd2UgbmVlZCB0
byBpbml0aWFsaXNlIGFkZXYsIGFuZCB0byBpbml0aWFsaXNlIGFkZXYsIHdlIG5lZWQgdG8gcnVu
IHVzYl9maW5kX2NvbW1vbl9lbmRwb2ludHMgZmlyc3QuIFNvIElNTywgd2UgY2Fubm90IHVzZSBk
cm1fZXJyIGhlcmUsIGJ1dCByYXRoZXIgZGV2X2Vycl9wcm9iZSBjYW4gYmUgdXNlZC4NCj4gDQo+
IE1heWJlIHN0YXJ0IHJlYWRpbmcgdGhvc2UgY29tcGlsZXIgd2FybmluZ3MuIFRoZXkgYXJlIHRo
ZXJlIGZvciBhIHJlYXNvbi4gWW91ciBjb21waWxlciB0ZWxscyB5b3UgdGhhdCB5b3UgYXJlIGRl
cmVmZXJlbmNpbmcgYW4gdW5pbml0aWFsaXplZCBwb2ludGVyLCByaWdodCBoZXJlOg0KDQpUaGUg
dGhpbmcgaXMsIHRoYXQgSSBkaWRuJ3QgZ2V0IGFueSBjb21waWxlciB3YXJuaW5ncywgZXZlbiB3
aXRoIHNwYXJzZS4NCj4gDQo+IGh0dHBzOi8vZWxpeGlyLmJvb3RsaW4uY29tL2xpbnV4L3Y2LjEz
LjQvc291cmNlL2luY2x1ZGUvZHJtL2RybV9wcmludC5oI0w1ODYNCj4gDQo+IENsZWFyaW5nIHRo
YXQgcG9pbnRlciB0byBOVUxMIHdpbGwgZml4IHRoZSBlcnJvciBhbmQgbWFrZSBkcm1fZXJyKCkg
d29yay4NCj4gDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCj4gDQo+Pj4gDQo+Pj4+PiArICAg
ICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4gKyAgICB9DQo+Pj4+PiArDQo+Pj4+PiArICAgIGFkZXYg
PSBkZXZtX2RybV9kZXZfYWxsb2MoZGV2LCAmYXBwbGV0YmRybV9kcm1fZHJpdmVyLCBzdHJ1Y3Qg
YXBwbGV0YmRybV9kZXZpY2UsIGRybSk7DQo+Pj4+PiArICAgIGlmIChJU19FUlIoYWRldikpDQo+
Pj4+PiArICAgICAgICByZXR1cm4gUFRSX0VSUihhZGV2KTsNCj4+Pj4+ICsNCj4+Pj4+ICsgICAg
YWRldi0+aW5fZXAgPSBidWxrX2luLT5iRW5kcG9pbnRBZGRyZXNzOw0KPj4+Pj4gKyAgICBhZGV2
LT5vdXRfZXAgPSBidWxrX291dC0+YkVuZHBvaW50QWRkcmVzczsNCj4+Pj4+ICsgICAgYWRldi0+
ZG1hZGV2ID0gZGV2Ow0KPj4+Pj4gKw0KPj4+Pj4gKyAgICBkcm0gPSAmYWRldi0+ZHJtOw0KPj4+
Pj4gKw0KPj4+Pj4gKyAgICB1c2Jfc2V0X2ludGZkYXRhKGludGYsIGFkZXYpOw0KPj4+Pj4gKw0K
Pj4+Pj4gKyAgICByZXQgPSBhcHBsZXRiZHJtX2dldF9pbmZvcm1hdGlvbihhZGV2KTsNCj4+Pj4+
ICsgICAgaWYgKHJldCkgew0KPj4+Pj4gKyAgICAgICAgZHJtX2Vycihkcm0sICJGYWlsZWQgdG8g
Z2V0IGRpc3BsYXkgaW5mb3JtYXRpb25cbiIpOw0KPj4+Pj4gKyAgICAgICAgcmV0dXJuIHJldDsN
Cj4+Pj4+ICsgICAgfQ0KPj4+Pj4gKw0KPj4+Pj4gKyAgICByZXQgPSBhcHBsZXRiZHJtX3NpZ25h
bF9yZWFkaW5lc3MoYWRldik7DQo+Pj4+PiArICAgIGlmIChyZXQpIHsNCj4+Pj4+ICsgICAgICAg
IGRybV9lcnIoZHJtLCAiRmFpbGVkIHRvIHNpZ25hbCByZWFkaW5lc3NcbiIpOw0KPj4+Pj4gKyAg
ICAgICAgcmV0dXJuIHJldDsNCj4+Pj4+ICsgICAgfQ0KPj4+Pj4gKw0KPj4+Pj4gKyAgICByZXQg
PSBhcHBsZXRiZHJtX3NldHVwX21vZGVfY29uZmlnKGFkZXYpOw0KPj4+Pj4gKyAgICBpZiAocmV0
KSB7DQo+Pj4+PiArICAgICAgICBkcm1fZXJyKGRybSwgIkZhaWxlZCB0byBzZXR1cCBtb2RlIGNv
bmZpZ1xuIik7DQo+Pj4+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4gKyAgICB9DQo+Pj4+
PiArDQo+Pj4+PiArICAgIHJldCA9IGRybV9kZXZfcmVnaXN0ZXIoZHJtLCAwKTsNCj4+Pj4+ICsg
ICAgaWYgKHJldCkgew0KPj4+Pj4gKyAgICAgICAgZHJtX2Vycihkcm0sICJGYWlsZWQgdG8gcmVn
aXN0ZXIgRFJNIGRldmljZVxuIik7DQo+Pj4+PiArICAgICAgICByZXR1cm4gcmV0Ow0KPj4+Pj4g
KyAgICB9DQo+Pj4+PiArDQo+Pj4+PiArICAgIHJldCA9IGFwcGxldGJkcm1fY2xlYXJfZGlzcGxh
eShhZGV2KTsNCj4+Pj4+ICsgICAgaWYgKHJldCkgew0KPj4+Pj4gKyAgICAgICAgZHJtX2Vycihk
cm0sICJGYWlsZWQgdG8gY2xlYXIgZGlzcGxheVxuIik7DQo+Pj4+PiArICAgICAgICByZXR1cm4g
cmV0Ow0KPj4+Pj4gKyAgICB9DQo+Pj4+PiArDQo+Pj4+PiArICAgIHJldHVybiAwOw0KPj4+Pj4g
K30NCj4+PiAtLQ0KPj4+IC0tDQo+Pj4gVGhvbWFzIFppbW1lcm1hbm4NCj4+PiBHcmFwaGljcyBE
cml2ZXIgRGV2ZWxvcGVyDQo+Pj4gU1VTRSBTb2Z0d2FyZSBTb2x1dGlvbnMgR2VybWFueSBHbWJI
DQo+Pj4gRnJhbmtlbnN0cmFzc2UgMTQ2LCA5MDQ2MSBOdWVybmJlcmcsIEdlcm1hbnkNCj4+PiBH
RjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2Vy
bWFuDQo+Pj4gSFJCIDM2ODA5IChBRyBOdWVybmJlcmcpDQo+Pj4gDQo+IA0KPiAtLQ0KPiAtLQ0K
PiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFwaGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0Ug
U29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkgR21iSA0KPiBGcmFua2Vuc3RyYXNzZSAxNDYsIDkw
NDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPiBHRjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFu
ZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2VybWFuDQo+IEhSQiAzNjgwOSAoQUcgTnVlcm5iZXJn
KQ0KPiANCg==
