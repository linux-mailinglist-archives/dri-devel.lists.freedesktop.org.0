Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9D52A424EE
	for <lists+dri-devel@lfdr.de>; Mon, 24 Feb 2025 16:03:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2ACE189CCE;
	Mon, 24 Feb 2025 15:03:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="AxMc+EuQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011036.outbound.protection.outlook.com
 [52.103.68.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C66989CCE
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Feb 2025 15:03:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g8ZlHPsVMVoLjU2RiysYpVhgGjytavwAP08NxtZLpUDLRFIl5sfS+yzayPIBTYAS8/LLLoL3H7MFcG6MaUk2iwZPtSP3jjncvbAli/9k/PNUj5lIOXrB7rYoZ83WPJ0ZXzYC8H9RwOhUMgb62UZQoNk0iXbSbopsh9q49sIC5qmtbH3Qq9Kn/ztXS/oKxTX1c7LIcEJ08nTVUlg7e/cTaIAcRC4uGhLcgK0Nq9CL9wKBjfeEIHZfJua+IHssFQ/b3OM6kxwd71BGJpSgAVCcjY+sVqIsg9IkVSUQBqmb4imE4AgULzHcdnpIpz/BywzN5+ApqmwnGLJ4/zbIuK/sEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6uDDOfADDhtSmv7V8wOTqdtukh4WmF33qN62q+k89YY=;
 b=km2xScQGU3BSQWlJABBnCVlFto3gJQcwF55KRO4eN6CwDxtYj2o0UMJV0JZzWfU5suXeSj9DTWL8IJV9V6jkOjzR/PpFHkmOV2jvUMNjhgxo0xW8NUymFemZkESNzzUf5yVjTYvAC4hiFTQ0mRveQZYleAZxLnvwUyCmDrAb47AqgxFwW7qkBT4yGpRCS2mqf0bT91pKcKqep5iuDz/eSezFXmqo61qLXizQw26ZdJ4l931xs8Vv5lSbasTQAUoCILqXq8+3/KyngdGLhbVwfbxz8EwJyqTUiY0kPYGXFWHYZJOSdxl8scl6r8nBCqqBf9qgUWeS5JXYdGLgKT92uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6uDDOfADDhtSmv7V8wOTqdtukh4WmF33qN62q+k89YY=;
 b=AxMc+EuQwYXKY0M04AzuPlgGnXkpua5t45ek6tLaGNmlWQzI3BJemoM8wjnqHlHP4ONOG6A+QwYigqz57wAIZuKFbu/2BbCSti0IJnfB9WKXAAih5XC0nriNwowxtpAhGxT7i9SyK8tR83wfKnwlu5q09/Vd2k6N/DlUhzfVn7A4OZl8x+p16tzwmfi0xHjODcx4cnXUI/wNHkGbI7xBR/8q021GnfWKRRVtCxUUYCiYn72Ou6LmMG9WAKjGqv7C0x5E7UnxvlYdiZDNIS/cswNT3eWsAqZ+cuv5h8tfTmwXxFspN4pszBI4qOV3wkfHNwxT1YpSmPMVrNW/GvIYcg==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MAZPR01MB8022.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:a1::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Mon, 24 Feb
 2025 15:03:06 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Mon, 24 Feb 2025
 15:03:06 +0000
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
Thread-Index: AQHbhsFl29NGb4UbJkm7lCmt/AKS7bNWg2SAgAAG9ACAAAHsgIAAAJUA
Date: Mon, 24 Feb 2025 15:03:05 +0000
Message-ID: <522EFFA1-0691-4AA3-AA77-820BBC013BCA@live.com>
References: <B08444CD-38A8-4B82-94B2-4162D6D2EABD@live.com>
 <03FA573F-6D01-40E8-A666-CEA17A917036@live.com>
 <Z7yCLxBN4Cl4btQm@smile.fi.intel.com>
 <7D98DED5-5B18-4AAE-A347-C880232530B7@live.com>
 <Z7yJodpB4WAB5oHn@smile.fi.intel.com>
In-Reply-To: <Z7yJodpB4WAB5oHn@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MAZPR01MB8022:EE_
x-ms-office365-filtering-correlation-id: 25ab2107-65eb-4c13-3686-08dd54e457db
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|8060799006|19110799003|15080799006|7092599003|461199028|440099028|4302099013|3412199025|10035399004|102099032|1602099012;
x-microsoft-antispam-message-info: =?utf-8?B?ZndLZ3drZ3h4VFVBSGtlZ2VjR3BVZm01SDgwZXViWG5ZdWVnR2dHQVRkQW9K?=
 =?utf-8?B?ZWtzLy8vL00vU3NrdkFFYmFSTFVtMlFMa3Vqd0NqYit0N2ZkZ1hjVW92Z2Yr?=
 =?utf-8?B?ZEhEaWNtazFwZDQ2elNjMVJ0Mkljb0JpQUtPVUVMdVRVVlpTdFNHa05saGxm?=
 =?utf-8?B?UzRkRzh1T1V1akcxUS9lQUhNVVFkb1U2SDZjT0RoVE0xMUc4VDZBdXVDeVkv?=
 =?utf-8?B?V2VObzhkU2s0UHJUbU5wcEs1RTdpdU9MZmtVTjg4NThqWWdyWXYwZ3o5ajdX?=
 =?utf-8?B?SjB5UU9CRWcwbmx6czh4RDQwbU85M25PSGVid3ZKWWVXQVpmZDFIdGc2anFx?=
 =?utf-8?B?dzRrOEdLeGlIUnhpek5SVEJLM1B0VTNUeEJhbFlsTE1HSFV3bUVqckFBNGdX?=
 =?utf-8?B?WHcrNW5xUUJKQkJrMzMzWUpFREZWcHBzL1JtODkrNGpVR3ZqTzhEWlNhSXJN?=
 =?utf-8?B?VzBWc2hqR2tKSldacm5wUmwzeUJYQ1pJQjBXUTJ4K3dsMXBmYzBvU2loTlJE?=
 =?utf-8?B?NkJ4cERRZEt2bWJSMVN0ODM2Q3g2MVd4ajVOV2NLbVdoNFlLMDFNWWFWWnBT?=
 =?utf-8?B?WWdpSTlXdGhpR3VuK05HVGtZUWhIaURWSjhJanFMQUlXWDY2Sjl5MVJqbGV0?=
 =?utf-8?B?K3I3cFI0U2dFQXl6TU41V2IxTENWTmdRUVJQeUR1bWRTU25OSk9IWmVsUGYw?=
 =?utf-8?B?cGZlZGx1VE5HRzJhWWsxOGtQUm1iUFZSdzR5QThuVXJkVDNRaktLZ2p2UEJ6?=
 =?utf-8?B?QmdoZUlOSHZiNDVaR2VEcTRzNG5CTlI3eXdGVGptdWpXUWxVcUY3UzFPVTUy?=
 =?utf-8?B?VWY4ejdydHljN1RScUErTk1ya09jMGp6YkdNaDRMK01NaHJaZllmS3BlbFBo?=
 =?utf-8?B?REZuT0cxQlpMVzJVYnMxS3A4cDAzejRuSVNVTzRscmhaY2JvUjhwQTNjMmtk?=
 =?utf-8?B?VWtUbjRQU2VSL2N5b0YzeXkycEZ1L0dqTVhUckV1T09SSXNxR1lqZHV0Rkpm?=
 =?utf-8?B?alhkN0RtWjVpaTVNT1Vtb2x6NmtPUzcwZFJiVVlTUkN6Y0JJUU1SRktMdUlC?=
 =?utf-8?B?Mm9kL0lWUmtrK0I3NWlXVkk2RjJhQVVsaUM4RGxVSkp3VVB0N0pvWEd2NGtw?=
 =?utf-8?B?SWFvMzZOd05wRkFIaDF6WEdHYVhZRzZXMGY2bE5iMmdIV1VUZmtONTkrWTdu?=
 =?utf-8?B?U3Z1R1VsWUNJV2NhMyt0YzBIc0c5QTR6My9kMUxMa2xyU21RNXRRa0lOMVFm?=
 =?utf-8?B?ZG5aYWFQMDdvbytZd3RrSHFhOHFVTyt4MG0yMTFYM0UzRW4zd0Nmem55aGY2?=
 =?utf-8?B?QXJxUHNRbFFyajJoNlFDeHppalJQNm50TVd6dmMyQkU3S3A3c28xc3ZybHdn?=
 =?utf-8?B?V291d1IrRDRBWndqZjlkdWR1a2F1bER3N21jVGRVd3JHYUhjekltcnlKLzBp?=
 =?utf-8?B?RUxQRHBxcjdIME1qeHNybXVabjNYUEdUekl6WDFNeFJGT3c4Ni9ydVBWZlg3?=
 =?utf-8?B?RzUwaDhvbUpJeDBFaFY1dnhtUnp1dmFQZnJDMHJFekJCNGdzUXpDMWVtYURl?=
 =?utf-8?B?ZENDMkFIR3RZdUtoMWtaSEEvUnhxcXNTVzZTN0haSDBWL0ZCYlkxUklLTUFy?=
 =?utf-8?B?YkhyaFBkQkJnY3c3OHBlc1BWSkhWcHBwdHExT1NuWHVXeWJDc1NVZFY5YnBU?=
 =?utf-8?Q?jE6yttAD49Hcw6ODZuI8?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MEwrbWhVeTZ5eDU4Ukk3OVJpSnNGWWZYQnpFY3VWZ1M3eTdSdFZhNVFEdnBX?=
 =?utf-8?B?NFZMUzRoNzJodXVVOVJ6Y1pLeGZMMUtVNVdDRXpiOUhWRGtBNWN5Z3pSQ0sw?=
 =?utf-8?B?OW1EdHFvSXd3ejBSNnBma1B6QkFTbTNBVXBKbFZkN1c0dXY5R1N6ZytySDhj?=
 =?utf-8?B?TDFLa05XUXNtUGIxdkpFRnF2YUcxVkxNRTU1cVRnbEFGaUY4dG16Rlg4RUxs?=
 =?utf-8?B?alhWdW94OUZFSm1idW5XQXRBelRoNmVJajRDVTU2QmJpZEx6bnNxL2IwanRW?=
 =?utf-8?B?Y1hxNmdiRWZYdjNBK0tZR2Y0bGtNZ0Y3T29EaTgvTEZhaUp4Z2ZHcXIrbVFU?=
 =?utf-8?B?aEpRMWdwV2gzU1ZFWHZTeGFEWlRiRVpWeTBJM1RNcnM3ZGxvY3ZVN0JWWnhM?=
 =?utf-8?B?Wi92bmpUSFBxUS9mNW5Ha1NZV0p5Z0JTSUJ4aHo2RjlpWm5Jc0Q0YXZyUGVu?=
 =?utf-8?B?bjVNN3FnaHQyR3dUQzkvZjFDQktJQjZXOFpsKzBSVjdmT3JQajZuWnd1YzJO?=
 =?utf-8?B?SUYrcDNMNTJPdGREZUtQWUR4WmVHMWVONldYa3dFMmh6RGNIVEZMMWhhTzh0?=
 =?utf-8?B?R1NYeXFsRFhadDVPTnVObU5VTHNIanBDR2JRRHVQU3VqbmVDWmw4WERObTZ5?=
 =?utf-8?B?WFNpdTV6c2pWQ2FXVzM1QysyRnU0R1Q5ejJuYmlPS2FXN01zQ0NnaXBJV010?=
 =?utf-8?B?dGJaNUMyRnBuOHFoQVZMV1JiWnlSMDJ5SGEzZm91TS9TdE9MaEs0ZENjL1RB?=
 =?utf-8?B?aHE4T0JDUjcycG85bjFJUFErcWtqbDN2UC9GKzJYaFVCbnVRaTRYSjZhVFVT?=
 =?utf-8?B?MUtIVkt3aDlackZWNnBIRnU1UGlpamMrVldVdllyQ1NUQmJUeTNOTTM5dkRK?=
 =?utf-8?B?bnArS2d6eDAvQnRBU1hTTS9XeGRSejkwMmVhTm9RYWVWTjJ5by9mWTkvTkVB?=
 =?utf-8?B?NUhTMjlaVmdrMytMc1E2QWQwRWdOc29jbXV5YzloQnRpVS9kd2Y5aEVqU2I1?=
 =?utf-8?B?OU5rVW5HWTZDNGdDTFQzU0NYTWg1alN3UEFCd3VoeEhVSTdRaldobXJsU0ZT?=
 =?utf-8?B?cDlOdXFqcDdWdWxMZkJmOGx6YnZsV25RNy9CTUEwcUpmNS8weDJPRDRwQ2wr?=
 =?utf-8?B?TVdZVzZRdEg3bTZ6ZHNnYlVXVGZmMmVvMmxNMlJad0pxSzc2Rzc5ejRTMGpC?=
 =?utf-8?B?ZlhneFp2aUZDM0hSQlBjWmdmWE9SdFJ3RDZGNm1qVldpYWUzZVVpUWl4SVJD?=
 =?utf-8?B?ZzhyUUdkTXpKQ2F0WFRWa24zVStSc3lzMVo0eVZydmlXcWNEN3ozUW9FdU9q?=
 =?utf-8?B?QnphTjAzYkVwdUVSUTJCVTZlZGF0eEFYL3JsYTdCM2Z1TVZOQVVYekZYaDUx?=
 =?utf-8?B?VWVQdE9QUlU1VVdteTgvVUI2U3Rza0NyVk5JbUN3VmpoOFp4TkxlNjUrV1V1?=
 =?utf-8?B?OXdIemJkODR4ek1oYzF3RFJHR3pjR1BNTmF1Q0dEL0dXVzd4bHNVMk5sK0Vw?=
 =?utf-8?B?SnhvRDl4bGc4S3lOaDBlc3pEemRZa3BKaVNicHAyR1VWYkpsNFE3UUxscWx5?=
 =?utf-8?B?SS9mVlp0Szl5cjBTYUFvTlN2R29URlZVanJ1Rm02NzI5UTloWVNNajREVmd2?=
 =?utf-8?B?dTJ3TThzcWZ4NlJpTWdsdFR0Zzh2Umh2SUxpQndOL2xLN3JSTk5qQmZRZks4?=
 =?utf-8?B?WmZCYndKSUFzVkMzZ24vTXJMdXpUeVhjbFhyY2tmMHNtK04vR1h2TTVxalE3?=
 =?utf-8?Q?TCm6HH9YR5z2+yYLSEgLq1r2Vo7eTx25/ZP/fDX?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B282888899AA324981F5FB74F3A41021@INDPRD01.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 25ab2107-65eb-4c13-3686-08dd54e457db
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2025 15:03:05.9526 (UTC)
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

DQoNCj4gT24gMjQgRmViIDIwMjUsIGF0IDg6MzDigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4gT24gTW9uLCBGZWIgMjQsIDIwMjUgYXQgMDI6NTQ6
MDdQTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+PiBUaGlzIGNvbnZlcnNpb24gaGVscGVy
IG1pbWljcyB0aGUgZXhpc3RpbmcgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjg4OCBoZWxwZXINCj4g
DQo+IE5vdCByZWFsbHkuIFNlZSBiZWxvdy4NCj4gDQo+Pj4gT24gMjQgRmViIDIwMjUsIGF0IDc6
NTnigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGludXguaW50ZWwuY29tIHdyb3RlOg0KPj4+IE9u
IE1vbiwgRmViIDI0LCAyMDI1IGF0IDAxOjM4OjMyUE0gKzAwMDAsIEFkaXR5YSBHYXJnIHdyb3Rl
Og0KPiANCj4gLi4uDQo+IA0KPj4+PiArc3RhdGljIHZvaWQgZHJtX2ZiX3hyZ2I4ODg4X3RvX2Jn
cjg4OF9saW5lKHZvaWQgKmRidWYsIGNvbnN0IHZvaWQgKnNidWYsIHVuc2lnbmVkIGludCBwaXhl
bHMpDQo+Pj4gDQo+Pj4gT2theSB0aGUgeHJnYjg4ODggaXMgdGhlIGFjdHVhbCBwaXhlbCBmb3Jt
YXQgaW5kZXBlbmRlbnRseSBvbg0KPj4+IHRoZSBDUFUgZW5kaWFuZXNzLg0KPj4+IA0KPj4+PiAr
ew0KPj4+PiArIHU4ICpkYnVmOCA9IGRidWY7DQo+Pj4+ICsgY29uc3QgX19sZTMyICpzYnVmMzIg
PSBzYnVmOw0KPj4+IA0KPj4+IEJ1dCBoZXJlIHdlIGFzc3VtZSB0aGF0IHNidWYgaXMgX19sZTMy
Lg0KPj4+IEFuZCBJIHRoaW5rIHdlIG1heSBiZW5lZml0IGZyb20gdGhlIF9fYmUzMiB0aGVyZS4N
Cj4+IA0KPj4gU28sIGxpa2UgZHJtX2ZiX3hyZ2I4ODg4X3RvX3JnYjg4OCwgd2UgYXJlIHVzaW5n
IF9fbGUzMg0KPj4gDQo+PiBodHRwczovL2dpdC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2Vy
bmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQvdHJlZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1h
dF9oZWxwZXIuYz9oPXY2LjE0LXJjNCNuNjU3DQo+IA0KPiBUaGUgcmdiODg4ICE9IGJncjg4OCwg
dGhhdCdzIHdoZXJlIHRoZSBieXRlIHN3YXBwaW5nIGhhcHBlbnMuIFNvLCBvbmUgc2hvdWxkDQo+
IHVzZSBfX2JlMzIgaWYgdGhlIG90aGVyIGhhcyBhbHJlYWR5IGJlZW4gdXNpbmcgX19sZTMyLg0K
PiANCj4+Pj4gKyB1bnNpZ25lZCBpbnQgeDsNCj4+Pj4gKyB1MzIgcGl4Ow0KPj4+PiArDQo+Pj4+
ICsgZm9yICh4ID0gMDsgeCA8IHBpeGVsczsgeCsrKSB7DQo+Pj4+ICsgcGl4ID0gbGUzMl90b19j
cHUoc2J1ZjMyW3hdKTsNCj4+Pj4gKyAvKiB3cml0ZSByZWQtZ3JlZW4tYmx1ZSB0byBvdXRwdXQg
aW4gbGl0dGxlIGVuZGlhbm5lc3MgKi8NCj4+Pj4gKyAqZGJ1ZjgrKyA9IChwaXggJiAweDAwZmYw
MDAwKSA+PiAxNjsNCj4+Pj4gKyAqZGJ1ZjgrKyA9IChwaXggJiAweDAwMDBmZjAwKSA+PiA4Ow0K
Pj4+PiArICpkYnVmOCsrID0gKHBpeCAmIDB4MDAwMDAwZmYpID4+IDA7DQo+Pj4gDQo+Pj4gcGl4
ID0gYmUzMl90b19jcHUoc2J1Zls0ICogeF0pID4+IDg7DQo+Pj4gcHV0X3VuYWxpZ25lZF9sZTI0
KHBpeCwgJmRidWZbMyAqIHhdKTsNCj4+IA0KPj4gQWdhaW4sIA0KPj4gDQo+PiBodHRwczovL2dp
dC5rZXJuZWwub3JnL3B1Yi9zY20vbGludXgva2VybmVsL2dpdC90b3J2YWxkcy9saW51eC5naXQv
dHJlZS9kcml2ZXJzL2dwdS9kcm0vZHJtX2Zvcm1hdF9oZWxwZXIuYz9oPXY2LjE0LXJjNCNuNjY0
DQo+IA0KPiBBcyBwZXIgYWJvdmUuDQo+IA0KPj4+PiArIH0NCj4+PiANCj4+PiBPciwgYWZ0ZXIg
YWxsLCB0aGlzIF9fbGUzMiBtYWdpYyBtaWdodCBiZSBub3QgbmVlZGVkIGF0IGFsbC4gV291bGRu
J3QgdGhlIGJlbG93DQo+Pj4gYmUgdGhlIGVxdWl2YWxlbnQNCj4+PiANCj4+PiBzdGF0aWMgdm9p
ZCBkcm1fZmJfeHJnYjg4ODhfdG9fYmdyODg4X2xpbmUodm9pZCAqZGJ1ZiwgY29uc3Qgdm9pZCAq
c2J1ZiwgdW5zaWduZWQgaW50IHBpeGVscykNCj4+PiB7DQo+Pj4gdW5zaWduZWQgaW50IHg7DQo+
Pj4gdTMyIHBpeDsNCj4+PiANCj4+PiBmb3IgKHggPSAwOyB4IDwgcGl4ZWxzOyB4KyspIHsNCj4+
PiAvKiBSZWFkIHJlZC1ncmVlbi1ibHVlIGZyb20gaW5wdXQgaW4gYmlnIGVuZGlhbmVzcyBhbmQu
Li4gKi8NCj4+PiBwaXggPSBnZXRfdW5hbGlnbmVkX2JlMjQoc2J1ZiArIHggKiA0ICsgMSk7DQo+
Pj4gLyogLi4ud3JpdGUgaXQgdG8gb3V0cHV0IGluIGxpdHRsZSBlbmRpYW5uZXNzLiAqLw0KPj4+
IHB1dF91bmFsaWduZWRfbGUyNChwaXgsIGRidWYgKyB4ICogMyk7DQo+Pj4gfQ0KPj4+IH0NCj4+
PiANCj4+PiBUaGUgY29tbWVudHMgY2FuIGV2ZW4gYmUgZHJvcHBlZCBhcyB0aGUgY29kZSBxdWl0
ZSBjbGVhciBhYm91dCB3aGF0J3MgZ29pbmcgb24uDQo+PiANCj4+IFRoZXNlIGNvbW1lbnRzIGFy
ZSBsaXRlcmFsbHkgcmV3cml0dGVuIDoNCj4+IA0KPj4gaHR0cHM6Ly9naXQua2VybmVsLm9yZy9w
dWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMvbGludXguZ2l0L3RyZWUvZHJpdmVycy9n
cHUvZHJtL2RybV9mb3JtYXRfaGVscGVyLmM/aD12Ni4xNC1yYzQjbjY2Mw0KPj4gDQo+Pj4+ICt9
DQo+Pj4gDQo+Pj4gQnV0IGl0J3MgdXAgdG8geW91LiBJIGRvbid0IGtub3cgd2hpY2ggc29sdXRp
b24gZ2l2ZXMgYmV0dGVyIGNvZGUgZ2VuZXJhdGlvbg0KPj4+IGVpdGhlci4NCj4+IA0KPj4gSSBk
b24ndCByZWFsbHkgbWluZCBhbnkgY29kZSBjaGFuZ2UgdGJoLCBidXQgSeKAmWQgcHJlZmVyIHRo
YXQgYXMgYW4NCj4+IGltcHJvdmVtZW50IHRvIGV4aXN0aW5nIGNvZGUsIGFuZCBub3QgYSBwYXJ0
IG9mIHRoaXMgcGF0Y2hzZXQuDQo+IA0KPiBSaWdodCwgYnV0IHNlZSBteSBhcmd1bWVudGF0aW9u
IGFib3ZlLg0KDQpHdWVzcyB3aGF0LCBJ4oCZbGwganVzdCB3YWl0IGZvciBUaG9tYXMgdG8gcmVw
bHkgaGVyZS4gSGUga25vd3MgbW9yZSBEUk0gdGhhbiBtZS4NCj4gDQo+IC0tIA0KPiBXaXRoIEJl
c3QgUmVnYXJkcywNCj4gQW5keSBTaGV2Y2hlbmtvDQoNCg0K
