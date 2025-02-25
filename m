Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82791A43E39
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 12:51:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA70A10E64D;
	Tue, 25 Feb 2025 11:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="rYFRi4z5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011024.outbound.protection.outlook.com
 [52.103.68.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D7DB10E64D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 11:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sQkmNHAqrlmJ3Id2903/X1vtlbURjTGYUg3Vb9lvKSshkycAyEpQ0zEeV/RXoNtmjJ5eyfjuHCYpQY5zUTWNaLc1tOkamUSx4FvkPlep1PRbKm9nuu/Ix8WCJOYlcTj8bwxQAP4rCLStn68cOa9tGbybJwBFvcOQbH2fA8pwTosxaYik+img+yoCX9IA3nX9HwTPn86kc2MK5YHpuQDhsSWZX3so/1pweyO2YcZzAzp3qEGMv2ya07SH4FdDZK0dDUzyDNFXJUYYoil9sTJlIsv8wVln3RmonSc15XVpta0f831KTFa7fLO5i7gCtYiIKsICpQ7VlHVethvvkSAsEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bj3i0RGTWT9GsxHTuI6r2iI+av93/7EkhPYGYMHtrO8=;
 b=KYX/Mw/j25ele+mY0zw3C+uhwkHQ3AjBbtjTj5FnIuMYdI1mV4NGVr1mfyG3IVPpeu1EYHJodC917z/nFuqsmmIPX6RYjItpHPbcMXADboCqzrA8nDEwdNRMtwe0KSdfS/ae4PDLm7k+2nu2W+KUQlaUMrqGrxZtpDNncLPA43CtInwo8k91ATqquvB9Q5Ze7fB5zl+EoGuUagTnheK+hTfRNqv1Leew24Tp9FMWvUGbvFndPdZyTOvqVK1T98//Ga2Jb13ZeoSKJy4WJh7rj9d00mlTql3Hp18DkUEmle0CLFXSVm+jcJ25+a++PefYQwaUR2GG/GlJDODCFVpZXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bj3i0RGTWT9GsxHTuI6r2iI+av93/7EkhPYGYMHtrO8=;
 b=rYFRi4z5dfo6IAAw2Aldiq0Yam9xavD6xKVSmM03pqX5GtaX4LqffPrDOH0foXMJ9xIUl79S55hOuPYPuospI9fqNURqviaAaHgEbTM5qOekCELA+rKz3aMSR/o+GpgXfnfPIZ9M6BTJtedi0dt5G7D6j7z2t1pJRoXNdGW1DzHhaQGFshZ/3mBWGAEEZMQ6FUaRmeqiCcTF3SlSAobKmsQ9vpPZfdGMHs0veDUsCQEvDvOld0Vw0lO7ATSFBXFy/1N+oulQ1Dr/JvqU6Q0pEDxclaNNVBErx2ahMHOFPQ3tdvdrfgXFfmJuEYMxoo+G4n6GIzms6PTsiH6LwINUZw==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB9655.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:f0::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.21; Tue, 25 Feb
 2025 11:50:57 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 11:50:57 +0000
From: Aditya Garg <gargaditya08@live.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
CC: "airlied@redhat.com" <airlied@redhat.com>, "jfalempe@redhat.com"
 <jfalempe@redhat.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "kraxel@redhat.com" <kraxel@redhat.com>, 
 "javierm@redhat.com" <javierm@redhat.com>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "virtualization@lists.linux.dev"
 <virtualization@lists.linux.dev>, "andriy.shevchenko@linux.intel.com"
 <andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH 1/6] drm/ast: Remove redundant else in atomic_check
Thread-Topic: [PATCH 1/6] drm/ast: Remove redundant else in atomic_check
Thread-Index: AQHbh3VCWe45FoIm6kKcHy9TN5hOxLNX57EAgAAAcww=
Date: Tue, 25 Feb 2025 11:50:57 +0000
Message-ID: <PN3PR01MB959759051DDE76D2EBC58FD5B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <C8A4C8F8-1568-423E-A656-05D914D9933F@live.com>
 <BD2BA1E2-D61E-4D25-857C-C9F435D41EF3@live.com>
 <325bf106-2b5c-4b13-be2a-e05a3c559bde@suse.de>
In-Reply-To: <325bf106-2b5c-4b13-be2a-e05a3c559bde@suse.de>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB9655:EE_
x-ms-office365-filtering-correlation-id: e2323e63-bbcc-4cca-81c4-08dd5592aab4
x-microsoft-antispam: BCL:0;
 ARA:14566002|8062599003|12121999004|19110799003|8060799006|461199028|6072599003|15080799006|7092599003|3412199025|440099028|41001999003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?REZGQWlPTEd2Ynp5eitvQk1ZRjdVWjE4TFJSUHNObzF0MkNFdHZaQStrTmtT?=
 =?utf-8?B?ekVCOFJnNUhvNTlycWNJak1nalI4NjE1L2tKa21ieDFtQzlYbnk2UG15a2Iw?=
 =?utf-8?B?eHljTTFSYnMzcVgrZFlzNVl4N3V0R05qc1hGNmtjVFBXdFJxeTloTS9MRkRx?=
 =?utf-8?B?VlR0L0ZRQ2dJeVloTDA3M1RySVJDOU1LTDhvYkVOS29vc0xxZmtLMG1OMmpq?=
 =?utf-8?B?NnhMNFRpLzdmemNheFBJWVVLc2RUVVpDUzJ4UDBDcHZiejNYbDNITFBvQ1Ar?=
 =?utf-8?B?KzJMa294VUNuMFlrUCtzS3NHOW9uQWFXcFp5NVo5TWxwWDBlY0tCdTRwbWFk?=
 =?utf-8?B?NWVkZ3pzOWt1QUM2MmF0MUlMVzdYVi8yV1RsaVIra1ZhSHNlYWFmU2VLdXN0?=
 =?utf-8?B?YTVsb0lSSXk1STRUZEpJZ3BDS1dmM3BlMWk0YzJSNXUxaWhXeXQyQ0o5Yk9m?=
 =?utf-8?B?RUpkcUx2cmhrOVljZ3FQaFcrdkhQM0N3NXVrb1NzSlh2N3JzU1liQ2lJeTdS?=
 =?utf-8?B?RzVaRmRXdU9VVkI0NCttRTdIbktaMjJDdFhURVlyWjB4bGxDTDMzQUttTHZp?=
 =?utf-8?B?VkhsQmlqWjVnNXNhcDdLMzhxT3BMbERuV1JoVUJpZjJ6cmpvS2dvRGtTZE9y?=
 =?utf-8?B?ejJvQ04vVHNOSDZFOWhuUkNmUlFjM0NnZjZBYzZLMFhHQjRIMkp6NmI3cXIr?=
 =?utf-8?B?N2J1SUtsaTMvTDY4VnJHRVlhZ3pFb2w3N0hQYW42c2k3Y2RsQW51Qkl6Rm5Z?=
 =?utf-8?B?UXpuNVVseGQ3VlRselJGSHcyYWNmcDVNRkVvalkvTURCSWgzN05OQzlTQ1ZN?=
 =?utf-8?B?WXgrQXhubmsxeWI4aUpQV0QvYmlRbStPbzJZOXBDdkpVRmd3WFJ4VkdXNC9x?=
 =?utf-8?B?cnRoMTVZL2VIQlhvc21iRzF5UE53RXppQXRZUWxuVFkwYW5iNWZYbm1uSE1K?=
 =?utf-8?B?ZzlhbUNLeElKbjNON1RrRnFnZFJOa1VpMkZxZlZNc20wNi9TYnNJZTh5RjNP?=
 =?utf-8?B?OW1WaDN0cXBadFlLMmxzY0IwV2tsdTEzeEZkR0xNMEd5VUlrdGJHSDFGL0I5?=
 =?utf-8?B?amVUdU5ndlR0M1NFUjRGOXB5aHVZaGNVb2VreFlGeUh4V1BVaFVjZmVPSkZ3?=
 =?utf-8?B?SDllbVdoS2g4eWFpbW12NDdLUjFEa0lEVlp2MGx0anpCaWxxNzVmU3FjOXh2?=
 =?utf-8?B?MFhZZjBFcTRyWTc2d2tNd2dkaHJIVW9sRXVRV3V2aU1RcFZacHNQa1U1Qkxi?=
 =?utf-8?B?WFUybkI1V2Y5QTlzeTR3LzNGMWhOemROcWI4UTNzYURTTVg3SzViK1hXZFdS?=
 =?utf-8?B?UjZBTjU2dVF3b1p6K0tJWnZUVVhHMFZJZ1FUejhURHhkN3FYdEtOTTd6MkNp?=
 =?utf-8?B?UDNkOTlLWGFxTExQbCtxaDVZRE1vbkRSc2ZEekdVNGk0WUJSWWhRaWdXa01F?=
 =?utf-8?B?SDdXRFpCNDNEcVVRbC9hSkxCaVNlNFAvNHJaUTBBUXBQbDE2R2tLMkRERit3?=
 =?utf-8?B?YWtDZXBUZDhWMHZtUStHdDBQUTIzcFJPQ0JyNjBMaW8zbUI0OWVyZE95aWNq?=
 =?utf-8?Q?8wfbdn9x4nPpCkWl8x2HxeHSM=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NzIvRjlGcUFFMHpaWFhHT3o1UnpPRmVXb2dRQTlQbFNtc0ZOSGF6Q1VLdTBi?=
 =?utf-8?B?NUgrMktyWUMxUW5TV3p6Q2E1MWQ4d1hiWGE3STJmOFhLU1NCRnJKbWlrbm12?=
 =?utf-8?B?UjlibEw5VDFOcktJOVEwZWEwaEZzTVZJK0djK1RCRW1iVVp0YjBvNFRUYkhy?=
 =?utf-8?B?OWJXT1p6WXUvTTFhd0lpcFY0NlUzSk84dzdkNzkvbENTVzh0bS8rOWFDbDVR?=
 =?utf-8?B?UXNmOGc3b1ZIQnFlMldYc0RteUxxUXBWV3JGeWNCRmZEbFhrZTIrc0R6dkpa?=
 =?utf-8?B?c2lTckhJWGhRU3J1MnM0OE1kOWV1T1h3eEhUMHJkbFRBdi8xckZTY0pST091?=
 =?utf-8?B?dUtjVmppbUN1WFIwUWI0ZUl5YWFuZUpSaS8vUlZZeUlySmtZcHJ0Nm0wMG1E?=
 =?utf-8?B?b2tySGwyZTBsV3V3SXIwMEpkbnVlV1M4c05ZMUIrNjVnWnZsQkFnVjlsQXNo?=
 =?utf-8?B?N3hlZTBiWVFtSjJTcHIxb2tHL3l0VVdDSDRqbEpqcUo4VDlEb0YxRGhNVWYz?=
 =?utf-8?B?TE9HQ2E5Q2xWTVFPRDNtSnprbE5RYkhSUnZ3SkFhVlA4d21MSFlSR3hsdytT?=
 =?utf-8?B?Mk00SnZZSXFkZFE4eVRDUFhxRVlXbnVCN3dlMnB4SWlhRktGS0YyYkZRRWg1?=
 =?utf-8?B?eXRxOGJvaWlFcjdhUlRaM0JPbmxpWGl3dzVxLy9hY3ZsSUVxRURLemdnbjFE?=
 =?utf-8?B?Q2dEWUV1cnNZRnBQY2pzd25LNE5OandGK3JnMFBPamVUcURNM09qTjhaUC9O?=
 =?utf-8?B?ZWhVSHBOeUU4cFloczdHKzhQOUY1R1hnRnVIUHM5OWxRbzNJdXNjeXpkbVJZ?=
 =?utf-8?B?YUlQZ3hxbUJ3T0FlQTBUczNyMWtoOFFwYjJuN2pGalZRKzJrQXp0RWVoN25U?=
 =?utf-8?B?KzV4REZneUhmaysvSnh6bXJSUkpEMDFOR3FMTDZTT0xqQzNKWTR2dWRIWFdE?=
 =?utf-8?B?UXg3L1paR1FpM3VoVllEN0J4ZHUrTkEyRDZyYW10Z2ZzOG0vMTZuQllGUFda?=
 =?utf-8?B?MWpnbzVZSW9HaDU4RUNJYzFjWXF5UThreVZ2T3ZnMHB6Vkl5Q0NSZEx5dEw3?=
 =?utf-8?B?WnhVRmxMOVduRkduMko3UVNsS1JYTWhUTm41U3c5MHYvRDhuQmVSNC9QdFFG?=
 =?utf-8?B?ZnJWQ0xaZUlvWXUxNUpiaDVwZGorZmhGOGJTVHlyTGNZWHZReFdLL3JWaHRT?=
 =?utf-8?B?cE9VdFhMNElRQVFiVFVBdDltb1NaTWcxMGNRY3lrd2hKc082RG8weDFoMUY4?=
 =?utf-8?B?bCtTUDFPbFF4a0NYdTNEWEVFUGN2ZmNKRkJMUTFkL2NKbHdrZVpXT0hwZVE3?=
 =?utf-8?B?VmV5UlJnKzJOdUlHamhaTkNiSDIyTjhNN3dLM0ZqNFFreXd4MDVMSTN1bk1Z?=
 =?utf-8?B?N3dTa2VLa3psbUxQVDlXVElzLy9UYnZGV3BpUXRtc1h2NlVjNU5rRUQvUnFh?=
 =?utf-8?B?UzgyMXRrMkI4bTN1SjVUMlB3TVA1elRsWGk1ZVFQZU82cW5xSDFnN1pZOS9q?=
 =?utf-8?B?MGhweHR5amY2WW50MEFjenVrdWRuVDNzeUtDbnNsSGJwb3cxQ0I5ZzlteWtU?=
 =?utf-8?B?NmUzWTRFbFBpcFZuYlc3Y0VRZXdWU2ZiSEh3K0JYdjBrSXU4ZWZ5OHZhckhz?=
 =?utf-8?Q?NGoQQUtC7tpS92h8B8G4Xx37Qiua9gOM7+QhJKVupArg=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e2323e63-bbcc-4cca-81c4-08dd5592aab4
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 11:50:57.3766 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB9655
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDU6MTnigK9QTSwgVGhvbWFzIFppbW1lcm1hbm4gPHR6
aW1tZXJtYW5uQHN1c2UuZGU+IHdyb3RlOg0KPiANCj4g77u/SGkNCj4gDQo+PiBBbSAyNS4wMi4y
NSB1bSAxMjowNiBzY2hyaWViIEFkaXR5YSBHYXJnOg0KPj4gRnJvbTogQWRpdHlhIEdhcmcgPGdh
cmdhZGl0eWEwOEBsaXZlLmNvbT4NCj4+IA0KPj4gUmVtb3ZlIHRoZSByZWR1bmRhbnQgZWxzZSBz
dGF0ZW1lbnQgZnJvbSBhdG9taWNfY2hlY2sgc2luY2UgdGhlIHByZXZpb3VzIGlmDQo+PiBzdGF0
ZW1lbnQgd2FzIHJldHVybmluZyBpZiB0cnVlLg0KPj4gDQo+PiBTaWduZWQtb2ZmLWJ5OiBBZGl0
eWEgR2FyZyA8Z2FyZ2FkaXR5YTA4QGxpdmUuY29tPg0KPj4gLS0tDQo+PiAgZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbW9kZS5jIHwgNSArKystLQ0KPj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+PiANCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dw
dS9kcm0vYXN0L2FzdF9tb2RlLmMgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2RlLmMNCj4+
IGluZGV4IDlkNTMyMWM4MS4uMzgxN2QxZTRjIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL2FzdC9hc3RfbW9kZS5jDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0vYXN0L2FzdF9tb2Rl
LmMNCj4+IEBAIC02MTAsOSArNjEwLDEwIEBAIHN0YXRpYyBpbnQgYXN0X3ByaW1hcnlfcGxhbmVf
aGVscGVyX2F0b21pY19jaGVjayhzdHJ1Y3QgZHJtX3BsYW5lICpwbGFuZSwNCj4+ICAgICAgICAg
ICAgICAgICAgICAgICAgICAgIERSTV9QTEFORV9OT19TQ0FMSU5HLA0KPj4gICAgICAgICAgICAg
ICAgICAgICAgICAgICAgRFJNX1BMQU5FX05PX1NDQUxJTkcsDQo+PiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBmYWxzZSwgdHJ1ZSk7DQo+PiAtICAgIGlmIChyZXQpIHsNCj4+ICsgICAgaWYg
KHJldCkNCj4+ICAgICAgICAgIHJldHVybiByZXQ7DQo+PiAtICAgIH0gZWxzZSBpZiAoIW5ld19w
bGFuZV9zdGF0ZS0+dmlzaWJsZSkgew0KPj4gKw0KPj4gKyAgICBpZiAoIW5ld19wbGFuZV9zdGF0
ZS0+dmlzaWJsZSkgew0KPiANCj4gSSd2ZSBzZWVuIHRoaXMgcG9zdGVkIGJlZm9yZS4NCj4gDQo+
IFRoZSByZWFzb24gd2h5IHRoZXJlIGlzIGFuICdlbHNlJyBicmFuY2ggaGVyZSBpcyB0aGF0IGJv
dGggYnJhbmNoZXMgaGFuZGxlIHRoZSBzdGF0ZSByZXR1cm5lZCBieSB0aGUgZnVuY3Rpb24gY2Fs
bCBhYm92ZSwgZHJtX2F0b21pY19oZWxwZXJfY2hlY2tfcGxhbmVfc3RhdGUoKS4gRmlyc3QgaXQg
ZG9lcyBhbiBlcnJvciBjaGVjaywgYW5kIHRoZW4gaXQgdGVzdHMgZm9yID52aXNpYmxlLiBJbiBi
b3RoIGNhc2VzLCB0aGUgcGxhbmUncyBhdG9taWNfY2hlY2sgc2hvdWxkIHJldHVybi4gQW5kIG9u
bHkgaWYgd2UgaGF2ZSBhIHZhbGlkIGFuZCB2aXNpYmxlIHBsYW5lLCB3ZSBkbyB0aGUgYWN0dWFs
IGNoZWNrcyBvbiB0aGUgcGxhbmUuIENvbmNlcHR1YWxseSwgdGhlc2UgaWYtZWxzZSBjYXNlcyBi
ZWxvbmcgdG9nZXRoZXIgYW5kIHNpZ25hbCBhbiBlYXJseS1vdXQgZnJvbSB0aGUgY2FsbC4NCj4g
DQo+IEknZCBwcmVmZXIgdG8ga2VlcCB0aGUgZHJpdmVycyBhcyB0aGV5IGFyZS4NCg0KQWxyaWdo
dCwgc2hvdWxkIHRoaXMgYmUga2VwdCBpbiB0aGUgYXBwbGV0YmRybSBkcml2ZXIgYXMgd2VsbCB0
aGVuPw0K
