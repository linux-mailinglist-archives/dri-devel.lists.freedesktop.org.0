Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C94FA30FEF
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 16:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 970EA10E6F3;
	Tue, 11 Feb 2025 15:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="G1mslyNS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10olkn2068.outbound.protection.outlook.com [40.92.42.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADB910E6F3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2025 15:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LW5s0mJH0h0NfBekAguEosTBvmAvxbSacRVwJJhj6YC32/jHnl1TpC9Ag/lq7Cf4rz3y6093Vug9OAGwMSelBX+aopRHEWGyaC3doNm2blikmmiEZZCrbucG09sKJ1dDBse0UsLwcxUhhayn0qGsKrRE0ZX4JIKdrspHssRh9wNs8MvCMQiYFpFz7uK5XHBkqK2dL0lH/JigWSAzkomgDXvVQ5wDQDjJSRp2jWWi7fMuxFTL5mbAI6rsIZsZGbccJZz2s3X6xQwAg+naFBgQoat76W84g4ZQVbslqMKRknA7EMV+r+gdkaIg/8HAnci2A4aURWhALID63AA1USCvaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XBMgcOolfe7WgruT51VlyJ+hFxpezWb8MXECfBwYgHY=;
 b=SGCMKfUgcaL8IPYXeSMx3d63ESavXx7wUNnwVanyDGroxbD6/ykfKUkzEO1a9VhIqABX1rAVW0IutypH02Buy6aUAyAFUqo2v4YYyx5Ku2ZWN6oz5Ys5XCRf1StI05BNNogIMuwsXPjmENP6U/i0pTadzcaxELxWdUlyqKw3W36HQzLV8pc9ofUeMrWV+u9jK/ECqh+n5xDHn3wwL3wr4/YlKjWAqDnl3YGMwaJGqfF2WVmwS9VbPX3IWt3YT4gkXPGMu4AgbyI/+v/d3cYxJeq+EZxK8p5a/j1B0Ku5uo2CUFyzPBJirwW3G2zWHiXc11BKwWhAU7haYEd/3W39jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XBMgcOolfe7WgruT51VlyJ+hFxpezWb8MXECfBwYgHY=;
 b=G1mslyNSrFk3wB9ifsMzdzr1xugi/UgTRhnaf/VKP+xc7kc3Ab91itp9VPmbAgMmRi8zseac5DeQj9bRvPzafk6WtaJAVodINyphetQ4jwF3GC8CfoFJI8IRVyjDAEfZrqQ5/VHhnBiCStEs4K1iDR4VtN5dLrx0fJpaISteY1C2mz8gfibr3ZNRnvOiPh256eM5OldyIAaJY4qLa2IAW1VbdQgsKbMPiQgt8APbNMaSuc30kMd3FMqT8JtzsKctD1IqEhReyleKX69dvP8l+8FAicrig+74nwY9b++opYGZUAQLcg5Ffa089J6GvFPuekgWAeX0qsUZJkSvXQrkFg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS0PR02MB9321.namprd02.prod.outlook.com (2603:10b6:8:143::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8422.19; Tue, 11 Feb
 2025 15:36:51 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::cedd:1e64:8f61:b9df%4]) with mapi id 15.20.8422.010; Tue, 11 Feb 2025
 15:36:51 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, "drawat.floss@gmail.com"
 <drawat.floss@gmail.com>, "maarten.lankhorst@linux.intel.com"
 <maarten.lankhorst@linux.intel.com>, "mripard@kernel.org"
 <mripard@kernel.org>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "christophe.jaillet@wanadoo.fr"
 <christophe.jaillet@wanadoo.fr>, "ssengar@linux.microsoft.com"
 <ssengar@linux.microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>
Subject: RE: [PATCH 1/1] drm/hyperv: Fix address space leak when Hyper-V DRM
 device is removed
Thread-Topic: [PATCH 1/1] drm/hyperv: Fix address space leak when Hyper-V DRM
 device is removed
Thread-Index: AQHbe/LnrZljjDR8lku/NvrRVzkSqLNBtuiAgACENbA=
Date: Tue, 11 Feb 2025 15:36:50 +0000
Message-ID: <SN6PR02MB4157BE3E0D84856CF6F22361D4FD2@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <20250210193441.2414-1-mhklinux@outlook.com>
 <445e33f1-280a-436d-8f9a-c94d16c17efd@suse.de>
In-Reply-To: <445e33f1-280a-436d-8f9a-c94d16c17efd@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS0PR02MB9321:EE_
x-ms-office365-filtering-correlation-id: d6d5b9c1-1a50-4fd3-efec-08dd4ab1e773
x-microsoft-antispam: BCL:0;
 ARA:14566002|461199028|8062599003|19110799003|15080799006|102099032|440099028|13041999003|3412199025|41001999003|12091999003;
x-microsoft-antispam-message-info: =?utf-8?B?amdzaUFVc2xNOGxQU093bnIwa0FsTWRpdzUyTkpkT2ZieUNkRFh6MWdDdU1l?=
 =?utf-8?B?TmxrYTc1ZTc0ZDZ4UFFnL1BMV1NpcHhQVWIzN09SaDF6bllPUUNZdndDSklP?=
 =?utf-8?B?UUZqTmthMm8yTXpVYkRRREJwUXk5U2c4UEc1TkpGWHdyRGp4bVd1RGdzYWND?=
 =?utf-8?B?QnVNYUp1UUk4Zk1XaktZTURxb1BTWkxhc2tZeUprR2kyZjdnMDkvRHdRdVlG?=
 =?utf-8?B?NDZKeEpHNytPQWxxUXo4Nmo0aWY3eE80ekRXVjR6cWMyU1FvMHFIaitQY3FH?=
 =?utf-8?B?WTJLRGo5b29GbnpzUHY3aW55YUUrWlo3UXg0QUUrU3NLa0JsUjNNdEpJa1M3?=
 =?utf-8?B?Zko1TDF6azdJRUtiQ0E4Z3VPakg0K28yc1NWczBlWFFYeHRzcGNqSUl2b1Zh?=
 =?utf-8?B?Q1dxQ2UvSVNrNjgrSkhmVk9hWlNjbkJOcWs4UDNraTVJdmVuenoxWnRBK2FD?=
 =?utf-8?B?RENCREl5YmhpMjZYS2R1ODZUaWRiVXNyc2pIOVZ1cGkyUHd0ZEhhbHlMTUdN?=
 =?utf-8?B?djgyd1VEaExpTzRsZjJlT05JY1FWL2xPRnhKSzI4SnNWR2xXcVBLc2grdUdV?=
 =?utf-8?B?eUN1Nk9SM2srQ3hJcUdHK21XeXRieUlNNWQyVWRKUGZFYXZIcDUyNmE3Qzh5?=
 =?utf-8?B?UG8vWnl2amI5cFRQUUtIekFyUm95ZG1wZ3QvRFFMMUR5MFpudDZHcTJndUE4?=
 =?utf-8?B?V2JoZ3hFOTRSVmxCZlB4SFAxNlRJWGJpU2loMVVHYVhwdTBjWWsyQVhlZE9J?=
 =?utf-8?B?eHBYTHpTZGhJdEtPUW16N1ZiMTBFZjJkdFJnMkx3R3FXN3NkOWcwQjM1MVpU?=
 =?utf-8?B?eEhMQlNVQmFNRjdCV2FRVG1ENVlQN0gxU3VvT2FYMWtzZE5zRC9XMHZmN1F0?=
 =?utf-8?B?L3VNTVgzenZadThlVUlCR0oxaDJtNXRraDBaYjhZYVZrK3ZWUUlvM2E2R3kv?=
 =?utf-8?B?aUxhdSs3UUNQaG40UzRxMXNoNXlEL1hETkFzUWpUNWVia0hkeHNFbUJQQTV6?=
 =?utf-8?B?Y0NBTmNXT3p1aUF6aVVQMVZhZVk2cCt4QWcxZzU1UlU2QVE3ajFYKzQ2UGNw?=
 =?utf-8?B?cXIwTlYwelJaUEtadlZrMm1LQTRxWk0xdlVTeFhYZEo5bFV1Zmt3c1JjZzN6?=
 =?utf-8?B?OTZnMVgxMEtYT0hoOHVaQTBYVm1DdHRYWVIraDZGaWRHMUZsc0lpTFE5VGhT?=
 =?utf-8?B?azl0bFh1dkhPSUpHT0ljN3FMc2tGVHI4TnhSTlRlai9rd1NnTHJCblJ5TTE4?=
 =?utf-8?B?U1dLdGFWZ0xTakR0bi82aEoyVmVIMjZ6VUtTSk8za1ZOTmNmQ1MyVmlGRE9P?=
 =?utf-8?Q?lflvyJwC5Mp7U=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cGRMeFJiei9lc1F3c2JzNXJlWTlnWlNqRHhwUjU1OHFWOFBJN2psOVZ1K25W?=
 =?utf-8?B?cFBwWjZKRmNHNWliczlTd25XZlpTRjhBQlhGMW9McVM4eHRwZFh3L1BKblh2?=
 =?utf-8?B?OFh5cUtmMXorYUxacFozZ05Ra28vOStRZ0tiblp4TzJwTWZvdXFCLytsNU42?=
 =?utf-8?B?SVpyZCtjYUd4Nm5WWWdTU251REwrd0RsVDZlVGQrUEdLVGpOenk5N3FRK1hC?=
 =?utf-8?B?NWtYK3JHQ2E3OWlwTFlSbE5WVENFZWgwaVVhYndGSlpJcjluaGtyVHJOQkdq?=
 =?utf-8?B?cjQxcmpRdTVqblROdHpsWlR4QmJkMGhwd010RFhka0dFdm5paHR1cCsya1pl?=
 =?utf-8?B?aGtreEhWekhFaktjOGU2eWhEdi9hV0VqY1ZJbnFtb0ljS1dpb1VJRk9Da3dh?=
 =?utf-8?B?UEUyMGhxRmFJN2xwdGlxNG5nUk9UL0tsb1g1QXMwVzN0TXhWaGVIbzlhTmFs?=
 =?utf-8?B?Z3lCSFRpSnpMNWJjMi9oUzlrTVJtOW81M2lZZytrZy9jdHd5YUYzNU1kKzBy?=
 =?utf-8?B?cGRFOWFpTmZ1WHN2OTNoeVQxOUJFbnFnYlE0UW9KRWNYME9lWUZYTldadTRI?=
 =?utf-8?B?RklYd0QxTVQvNzJpRUZueEFHMWtONTBCaEdISXoyclZ6UG82VUhSUWRKcGxi?=
 =?utf-8?B?cWhRV1dlbCszNGdMeVVvb0VYS0xXRVBZNjlpcmxjelBDV1VJQjRUamhWcU5Z?=
 =?utf-8?B?UFNKM0tZT09rd3ppYURLVWZlbXJPd3gwQW5zSUl4SkZwNTNNZVkxS2YxNFFV?=
 =?utf-8?B?dUEvY2FYWWQ1ay81blRWbE5nK0NmTE1TWlhaYlNOU3RreXlzaEp5UlpXaXRs?=
 =?utf-8?B?SFZuT2puMEw0aHFoSGtVcEhaSVJCajdMUE9Yc0lnR3pnTDFSSU5LS2E2dlJs?=
 =?utf-8?B?RTlWa1Bqa013bEZaa3N1aFNUMXJlYm5JaGp2bWkwdEZPY3M3OXBSb1R5WkJh?=
 =?utf-8?B?TTFKT1dsZHBGcENlNGt2ZTlVWkc1aUZxV0lIcnNENnlocXVkR21iWnlReE1S?=
 =?utf-8?B?TFAyK1JtbFg3WWJhc0dIcE1nVEJaVG52MkhwbUJuUUZBdHp3NEwxclpQZ0hS?=
 =?utf-8?B?b3A0MjdOZGNma205Smxnc0NIQmU4VHFRUUlkSkwza21wN2JZcW5adW8rd3g0?=
 =?utf-8?B?R3FodjhyWU1qTDBWbkFaOC9hc2xlNkkvbkhQcDlyVmduUm1sd3ZIUXoreXlE?=
 =?utf-8?B?eXRvTmlFcS9CY2o5WG1NWHd6Z3FrVkszL1hTdzhvV0tYYXp0Vko4WmNBczhQ?=
 =?utf-8?B?U0FkdUx6cWtqNVFZV3dNcWNDaC9BWWd2RFNNb0NMeDVHbzNzeVN5MDN6Uzl2?=
 =?utf-8?B?OWtWUUU2blhrSmRmU3J5NnFIbnBaNWJUb3RVVW1za2N2TmdaeVYrcHpTOFdq?=
 =?utf-8?B?Q3JXdndkY29LNDcrYjY5WUlZbWF3dHJidHdVWGIwUDV2bG95WGdibW56VTI0?=
 =?utf-8?B?OWE0aXY2MkU1STRNUTdwWk5LOHJPaGxwdkhKcVE5ZWtOMWxSRThxZmMraytG?=
 =?utf-8?B?T25hMW5XZDFNZ083VDZZNmdreEZ5M3I4SzV3akltL0ZvVHRvODJkWlBzQjZI?=
 =?utf-8?B?QW1Dd2JCOHM1bXFjOW13ZW1sUUNlRmtydTRxODJzRG5EWUI4NjVFdjhTS3Fn?=
 =?utf-8?Q?uydPiGfHMIvp2IBXtqB4itqyDksBmOgDTkKmpJRwGsIc=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d6d5b9c1-1a50-4fd3-efec-08dd4ab1e773
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Feb 2025 15:36:50.8673 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB9321
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

RnJvbTogVGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+IFNlbnQ6IE1vbmRh
eSwgRmVicnVhcnkgMTAsIDIwMjUgMTE6MzUgUE0NCj4gDQo+IEhpDQo+IA0KPiBBbSAxMC4wMi4y
NSB1bSAyMDozNCBzY2hyaWViIG1oa2VsbGV5NThAZ21haWwuY29tOg0KPiA+IEZyb206IE1pY2hh
ZWwgS2VsbGV5IDxtaGtsaW51eEBvdXRsb29rLmNvbT4NCj4gPg0KPiA+IFdoZW4gYSBIeXBlci1W
IERSTSBkZXZpY2UgaXMgcHJvYmVkLCB0aGUgZHJpdmVyIGFsbG9jYXRlcyBNTUlPIHNwYWNlIGZv
cg0KPiA+IHRoZSB2cmFtLCBhbmQgbWFwcyBpdCBjYWNoZWFibGUuIElmIHRoZSBkZXZpY2UgcmVt
b3ZlZCwgb3IgaW4gdGhlIGVycm9yDQo+ID4gcGF0aCBmb3IgZGV2aWNlIHByb2JpbmcsIHRoZSBN
TUlPIHNwYWNlIGlzIHJlbGVhc2VkIGJ1dCBubyB1bm1hcCBpcyBkb25lLg0KPiA+IENvbnNlcXVl
bnRseSB0aGUga2VybmVsIGFkZHJlc3Mgc3BhY2UgZm9yIHRoZSBtYXBwaW5nIGlzIGxlYWtlZC4N
Cj4gPg0KPiA+IEZpeCB0aGlzIGJ5IGFkZGluZyBpb3VubWFwKCkgY2FsbHMgaW4gdGhlIGRldmlj
ZSByZW1vdmFsIHBhdGgsIGFuZCBpbiB0aGUNCj4gPiBlcnJvciBwYXRoIGR1cmluZyBkZXZpY2Ug
cHJvYmluZy4NCj4gDQo+IENvdWxkIHRoaXMgZHJpdmVyIHVzZSBkZXZtXyBoZWxwZXJzIGZvciBp
b21hcCBvcGVyYXRpb25zPyBUaGF0IHNob3VsZA0KPiBmaXggdGhlIGlzc3VlIGF1dG9tYXRpY2Fs
bHkuDQoNClBvc3NpYmx5LiBCdXQgdGhlcmUncyBubyBkZXZtX2lvcmVtYXBfY2FjaGUoKS4gVGhl
cmUgYXJlIF91YyBhbmQgX3djDQpmbGF2b3JzLCBidXQgbm90IF93Yi4gSSdkIGd1ZXNzIHRoYXQg
ZnVsbCB3cml0ZWJhY2sgY2FjaGluZyB3YXMgZGVlbWVkDQpub25zZW5zaWNhbCBmb3IgYSBkZXZp
Y2UuIEJ1dCBpdCBkb2VzIG1ha2Ugc2Vuc2UgaW4gdGhpcyBjYXNlIG9mIGZyYW1lYnVmZmVyDQpt
ZW1vcnkgc2hhcmVkIHdpdGggYSBoeXBlcnZpc29yIHRoYXQgaXMgYWxzbyB1c2luZyBXQiBjYWNo
aW5nLiBBZGRpbmcNCmEgX3diIGRldm1fIGhlbHBlciBtaWdodCBiZSBzZWVuIGFzIHNvbWV0aGlu
ZyBvZiBhbiBhYm9taW5hdGlvbi4gOi0pDQoNCk1pY2hhZWwNCg0KPiANCj4gQmVzdCByZWdhcmRz
DQo+IFRob21hcw0KPiANCj4gPg0KPiA+IEZpeGVzOiBmMWY2M2NiYjcwNWQgKCJkcm0vaHlwZXJ2
OiBGaXggYW4gZXJyb3IgaGFuZGxpbmcgcGF0aCBpbg0KPiBoeXBlcnZfdm1idXNfcHJvYmUoKSIp
DQo+ID4gRml4ZXM6IGEwYWI1YWJjZWQ1NSAoImRybS9oeXBlcnYgOiBSZW1vdmluZyB0aGUgcmVz
dHJ1Y3Rpb24gb2YgVlJBTSBhbGxvY2F0aW9uDQo+IHdpdGggUENJIGJhciBzaXplIikNCj4gPiBT
aWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEtlbGxleSA8bWhrbGludXhAb3V0bG9vay5jb20+DQo+ID4g
LS0tDQo+ID4gICBkcml2ZXJzL2dwdS9kcm0vaHlwZXJ2L2h5cGVydl9kcm1fZHJ2LmMgfCAyICsr
DQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspDQo+ID4NCj4gPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZfZHJtX2Rydi5jDQo+IGIvZHJpdmVy
cy9ncHUvZHJtL2h5cGVydi9oeXBlcnZfZHJtX2Rydi5jDQo+ID4gaW5kZXggZTA5NTM3NzdhMjA2
Li5iNDkxODI3OTQxZjEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL2h5cGVydi9o
eXBlcnZfZHJtX2Rydi5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL2h5cGVydi9oeXBlcnZf
ZHJtX2Rydi5jDQo+ID4gQEAgLTE1Niw2ICsxNTYsNyBAQCBzdGF0aWMgaW50IGh5cGVydl92bWJ1
c19wcm9iZShzdHJ1Y3QgaHZfZGV2aWNlICpoZGV2LA0KPiA+ICAgCXJldHVybiAwOw0KPiA+DQo+
ID4gICBlcnJfZnJlZV9tbWlvOg0KPiA+ICsJaW91bm1hcChodi0+dnJhbSk7DQo+ID4gICAJdm1i
dXNfZnJlZV9tbWlvKGh2LT5tZW0tPnN0YXJ0LCBodi0+ZmJfc2l6ZSk7DQo+ID4gICBlcnJfdm1i
dXNfY2xvc2U6DQo+ID4gICAJdm1idXNfY2xvc2UoaGRldi0+Y2hhbm5lbCk7DQo+ID4gQEAgLTE3
NCw2ICsxNzUsNyBAQCBzdGF0aWMgdm9pZCBoeXBlcnZfdm1idXNfcmVtb3ZlKHN0cnVjdCBodl9k
ZXZpY2UgKmhkZXYpDQo+ID4gICAJdm1idXNfY2xvc2UoaGRldi0+Y2hhbm5lbCk7DQo+ID4gICAJ
aHZfc2V0X2RydmRhdGEoaGRldiwgTlVMTCk7DQo+ID4NCj4gPiArCWlvdW5tYXAoaHYtPnZyYW0p
Ow0KPiA+ICAgCXZtYnVzX2ZyZWVfbW1pbyhodi0+bWVtLT5zdGFydCwgaHYtPmZiX3NpemUpOw0K
PiA+ICAgfQ0KPiA+DQo+IA0KPiAtLQ0KPiAtLQ0KPiBUaG9tYXMgWmltbWVybWFubg0KPiBHcmFw
aGljcyBEcml2ZXIgRGV2ZWxvcGVyDQo+IFNVU0UgU29mdHdhcmUgU29sdXRpb25zIEdlcm1hbnkg
R21iSA0KPiBGcmFua2Vuc3RyYXNzZSAxNDYsIDkwNDYxIE51ZXJuYmVyZywgR2VybWFueQ0KPiBH
RjogSXZvIFRvdGV2LCBBbmRyZXcgTXllcnMsIEFuZHJldyBNY0RvbmFsZCwgQm91ZGllbiBNb2Vy
bWFuDQo+IEhSQiAzNjgwOSAoQUcgTnVlcm5iZXJnKQ0KDQo=
