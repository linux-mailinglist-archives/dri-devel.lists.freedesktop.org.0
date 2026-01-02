Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EE6BCEF3AF
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 20:23:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD4B010E2D3;
	Fri,  2 Jan 2026 19:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="WPsFK+jU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazolkn19011013.outbound.protection.outlook.com [52.103.1.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA3F10E2D3
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 19:23:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kjgofMTGwuD3o6zkTD7m4h4ZHVKbuiZmE9p9qplmwzaLsBah9Vfn9TsyUsZbCR18YNwnL3fInX77R2KOG1QqPZT9/ur1Eqf8d7YKpCzDbxJbmZu9V+vngET/QvmSNw5JAmkFdYVXGGzt4nKdSAuWZf3Rj7A9c0rgfkvWDs+rgkmaLw3hLcoqmiqnATuKfYribKhnNc8JwTI5GRBJ04GhD6oHAq+8r7ZXlD6hI2rVpS3Ue/M+vDPLB3zuiC6OAAL8QUcet3PqjYUeyKu5Fe7e1+oFc8Iu3yXOasdSVY99Rm2xE+IALHgCL7lbPFCBquMwMx9qOrP/iKojlAQQML5k7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2nRgEKaSc24ef2OjqQEa9R5Xx9gOqAaJoriuaikBJsc=;
 b=eAKA62DmmZbsz5Kp2348xq+3PHkQ6y35Ec+qB/JaoP0APUyAE1uVFOXMyCO8fJ76xrbEDxfFuufVsof/4Q+RzswK9mSkisKzNlQsF55AVkvikRWMa1rlK0qga1fo+ZZ0qQJfXmkzNS1BlzZ4uM2MhBOWkGjqmL4TjSn8TMKfhx5w49cPsOEafJhnn06Xya9VBvtugdWUtWu2Ghd20Fjan6duAf8a1Wn+dUCCP2Di2GppynO/T4ux058f8aQU492bh9zBW2hCihQLdF2W8lcebZT+53UURtFGoDsZTUvARGVniya0JIIcnPHnWjrcfsaC+05qHSz0dMjl1AOsOPR8dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2nRgEKaSc24ef2OjqQEa9R5Xx9gOqAaJoriuaikBJsc=;
 b=WPsFK+jUvbxAHeRJhmz5AGp4ncCTToaH2TIdDS97lfYZWGM5qDXVEcfuY4Jkgd3TLciVjr+9nsvpwOCfmwZDl5uTxb/uFJgqh4LpmQJ4NO9vAg1hRTHUIKAhcDGT2RNFxqQSZEorEvQYFDf4R9m3XKXuTxPeS1/QLYALb2CB29myLCaEceFoXtutafqnf7gawiUP8+BcX3Qon2ASWQsNaflCGNxNmIObWlqu5h4gc/A65gb+kOwjtRaIwXB2keMOXTZCwvz/GMqmT9Dtbuv5S6pYW9pPrQXvYd1W8PjHNaih835WUP5Hba0ZFLl/t8OoLJ2UuAuwYuzLlODx599Qjg==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by CH2PR02MB6933.namprd02.prod.outlook.com (2603:10b6:610:88::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 19:23:19 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 19:23:19 +0000
From: Michael Kelley <mhklinux@outlook.com>
To: Helge Deller <deller@gmx.de>, Prasanna Kumar T S M
 <ptsm@linux.microsoft.com>, "linux-fbdev@vger.kernel.org"
 <linux-fbdev@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-hyperv@vger.kernel.org"
 <linux-hyperv@vger.kernel.org>, "ssengar@linux.microsoft.com"
 <ssengar@linux.microsoft.com>, "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "kys@microsoft.com" <kys@microsoft.com>, "haiyangz@microsoft.com"
 <haiyangz@microsoft.com>, "decui@microsoft.com" <decui@microsoft.com>, Thomas
 Zimmermann <tzimmermann@suse.de>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/3] drivers: video: fbdev: Remove hyperv_fb driver
Thread-Topic: [PATCH 1/3] drivers: video: fbdev: Remove hyperv_fb driver
Thread-Index: AQHcdui+KQXRjOIFVEuflSwlcErRcrU56WyAgAVGySCAABj9AIAAAakggAABPwCAAABr8A==
Date: Fri, 2 Jan 2026 19:23:18 +0000
Message-ID: <SN6PR02MB4157FF20BEAA083882EC42CCD4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1766809486-24731-1-git-send-email-ptsm@linux.microsoft.com>
 <e37ef037-fb4f-418c-937b-b3deb632d0ca@gmx.de>
 <SN6PR02MB415700F34CA2A4296A542F73D4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <7d2fbfe3-eac9-421b-8e75-8d44b26fd2b3@gmx.de>
 <SN6PR02MB415706E623885B4173D238AFD4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
 <e7360fcd-d507-4272-8215-89b15a797b41@gmx.de>
In-Reply-To: <e7360fcd-d507-4272-8215-89b15a797b41@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|CH2PR02MB6933:EE_
x-ms-office365-filtering-correlation-id: 6011486d-d1eb-4d14-00dd-08de4a3462d2
x-microsoft-antispam: BCL:0;
 ARA:14566002|51005399006|8062599012|19110799012|8060799015|15080799012|13091999003|31061999003|461199028|440099028|3412199025|40105399003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?eHJnc296d25WQnVMem1McHIyd0NmOW45M1k4TWR3b21zYkpjN0tncGxFeXZz?=
 =?utf-8?B?OEU1WTVtcXhxbzJpU0dGcXlrUGFLazVCV0pyeDE1RGJJbnJoUEVnbEx5RHBh?=
 =?utf-8?B?SGZqbS9GMURPNnRUTWhkOU5SMUVTalZhVjFwOFFBTUVLbXBqdlpycGEzWnNy?=
 =?utf-8?B?WnFyVGxvT3JoVTUyT0Nzb2wwd2dqMllrTTh5ajlMTVF3MUhOZGp2eTdCenVt?=
 =?utf-8?B?YU5wd1lEa1dRTnpqdVZaQWQ2L1RheHEzQ0dPd0tyS2pqVnF4TG52S2RyUnYz?=
 =?utf-8?B?ZENiR2FtMFBaNENUaEZ2U0czbXVSL3B2cEhLU1kvbWVLd05maDk3aXdRbU9I?=
 =?utf-8?B?c3h5b1hXLzhBZnVkTktvTHhzczFWNmc2TnJkczJ5MjVhTk1KcHRCYXpPYzhX?=
 =?utf-8?B?MFQ3WHg5VE9oYmdienUxUm5ZSXQ4dk04Z1crNnQ2SVgwWDRuZiswcnBkbU40?=
 =?utf-8?B?bjhyakFhazdEdFZHSEpGalVBZzg2TmVsUHdIT3RVd1IzU0dReGdjY2RWNWQ5?=
 =?utf-8?B?OFBub1k2WVVubTlwTVhWa3g3dTIyVGgxc205cFk2KzZveW5JbWM5Qmt6NFp1?=
 =?utf-8?B?MGg4N21pZUU3Yy9HZ2toakZFb29IQnY0b3R1MWxtUUJJNVZCdVAwcnpZVTl5?=
 =?utf-8?B?QjRsZkVOZUZVODNiZHRSOGlQRHloT0s1VTQwZENON2drdFRjdUtXOWtRazYr?=
 =?utf-8?B?eDlqL3g5a0M5YlpiQUxCNWVXNWZyamdmbW1YZ1FYc1M3Zk1BR3BVa0g2RWpB?=
 =?utf-8?B?aHg3ZStzVlRWM2NOYkFWeWRVc0tLNEhXaUtQM21KQTg0UEs1bHpsY25jSG1h?=
 =?utf-8?B?MHhOZHVNOUdOUXBIOHI3eUUxbFdDZzVhNXJ1c0dWZDJXSklZQzdVQXBNYXNk?=
 =?utf-8?B?aHhiL2dsYkxFaVFTcm9qZ1RXZHd3bFByTnlzcFM1a3cwaG5LSEtsRDArSW5m?=
 =?utf-8?B?ajRhNHMxbFVKaE1XOHhYWmZRQXhRaHI4ZG1ya25vQ0JGa2ZZQUw5S3Z1eEFB?=
 =?utf-8?B?bXl5Rk16ejA1ejFtSUYxMm5sOEtjbUtQa090aStORzhUZERmUW1jNTJ6dy9x?=
 =?utf-8?B?OXNKYVBjSUUvcWtWWlJlVXJFR1BVNGdvY3NoK255cXlkSGF6TUV5QVhiR3RW?=
 =?utf-8?B?eGZ5ekI3U0VUVmxuOVVOSFhTMTF0M21hYlZxcVA2cE5qeU9zYmoyZU9XUUI5?=
 =?utf-8?B?Y0pwQlJ1MmptUUJHZkdIMDBJOXhlcEkzN3JzdFJOSjRjZ09QVlpTT3FXbTJk?=
 =?utf-8?B?UGNuVnQxdmJlaStBTFZub29yY1cxZ1BDODZLRmlUNjY3cThUV2lDWm9TRFRS?=
 =?utf-8?B?WElValI5Yk9Ga0VrakZpdjUrU1BTaXR2OXU5ZWFPQ3RGQ21UWlVTdHhkeVZk?=
 =?utf-8?B?N2lidk8zeGd3YlYvS3NaQnliWTI5SUorZXdQeVZpVnhaTGRmdldaOHVjcERV?=
 =?utf-8?B?R2ZsRzJrSmR0YnczY21uZEtlaWNWYXBqOFBhY1dwTDZ5eVZaMEYwYllRVUtq?=
 =?utf-8?B?aWprUE9LOVNVVmNmVzVuNXIwSXNBNENSS3FQaGpnQzNyVjRXMlFzc0sxaWZq?=
 =?utf-8?B?TC9hWXVJM0xNVXA2SnFoeUFkRHBCZWhXY0ZxZHVEaEJkN0pIcERpcVJmeXp4?=
 =?utf-8?B?RVl1RkRpVmwrWXY1V0krYmlvOGgyYnc9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R1lUVFN6RXlkaXFpWENDaUdLN3kySWU2Vnc0N3hiYlVyTmJkb2hydHBkbXlj?=
 =?utf-8?B?Y3QwaHJuTFB4ajNBcmFsTmFvdXg5WG9nbUMwM1FSZVRCSXFOSjJSbGRjYVdj?=
 =?utf-8?B?ZUFDRmozNnN0Ykp0MGUvL0R2cDlHRlplZFZCVGpkMFhxM0ZJUDlHZUFmMHNx?=
 =?utf-8?B?V2ZuTit3L21iRE8yNkJyVy9xeSthZ3ozZ2tWMzZwcm01bnZiSXhZWW1PYmtI?=
 =?utf-8?B?Vm4raDRMbXZhM2g1MXFIcU9iSkIzWTV6YjNVUTVuMjJSenhZblFYRVJoaW5q?=
 =?utf-8?B?NlMxbTZrMGpsdVByTFlkdVp6OWpZQ09wWEN1Qk5DZllOK3VRdjR4cFk2Y2VP?=
 =?utf-8?B?bVp3M0pPb3ZQK2c5a0lTQ1VFRTZzSkJ6ckU2U0ZZZlo0Rkp5QXdCUk1VbEk2?=
 =?utf-8?B?dThNcVF2NDYweUFyQkUyM0xsdHBiNWYzN1BON2pRNjdnQU00c1hCVTVzQUlV?=
 =?utf-8?B?aU1FTEFjb21rTDhlRnBMTGhRd0hXMSs2L2VFM21IYTVSOVY0UUlGa1VRRldT?=
 =?utf-8?B?eVJnRGhhRmRBWll1THdBMWwyQ0FUNUNRM1orSTBSNks4ejgwcFJqVGNoZC9D?=
 =?utf-8?B?Z01tMXVTbEdmdTY4OVovWlNwN3V3M3dJUy95NXRyR1dJa1YyUTM5cEtRT2lm?=
 =?utf-8?B?SzFJWk5TU3RVOHloUUVLc2YwbHF0eEtQbDUyU3NpQzgwSko5d0dhaHI5VHpP?=
 =?utf-8?B?eFNOYWg2ZGpSTnV3cURJV0sxaEU2K3hkcHorQXRDcERubDYyS2NFS1ZyMFQy?=
 =?utf-8?B?UjE1aEJWT2hLek1Dd1Jaa2JxbTZrMG1yYnBjSjFQNzJuaXlBQ2ttUXRobVJV?=
 =?utf-8?B?bWdvdFg5L0FjdW5XR3V5K1RnY0wrM1R6TGU5cHNGRlZiS21iaGh5azk1RldL?=
 =?utf-8?B?TGlzVExYbktKdkM3S1ExMzhOMTlsd0d4dnZXa0thSHBxMERoN0NLTmxhWmlp?=
 =?utf-8?B?ZmZHZ3J6N0N0UzN2S2tXdUVHbUhHeVM0VURCTXpIaDd4bUxPaUcyWUZReXdW?=
 =?utf-8?B?VldIdGNTY2FYSUM5MHZQeTJaQXVHYzVBVHRKOG4vQjBmSXo1dEVLMnRVWEhF?=
 =?utf-8?B?QXBHanREaHI5QkNBMmRja1U2cHhjQTh6S3lRTUFXOU9EekJscnl1K2ZMeHIz?=
 =?utf-8?B?SUE5K1RZdnVTTnc4NkxGN0oxR0wyQTFkTCtpRG9oQ3J2cXVJV0ZybGpYa2Ev?=
 =?utf-8?B?akExYWEzMHpQaVZ0SWJJN3Ywd2x2YUtrUXRJU3lYNFNqcnNPSWM3bXYwMDFZ?=
 =?utf-8?B?c3JpMnRrcVBBVTZ5M0JBVjNCcEtNSm9QSjE0Sm1TMTJTZi8vUnNBcHJmR2dT?=
 =?utf-8?B?UG1jNUFVYjlhNFp2NHRJMjRXcFR5endsbUJ2ZERlempoU1YxNjg2dVlyNjdl?=
 =?utf-8?B?cEJES2ZockthS0hnMit1enRHR2g2djN6QnhvUG9LTkRveitlMzZHRjZPUDNk?=
 =?utf-8?B?bGhRVzBuRHM2L0V2NWpOS0NGczdkZnZ2Unk2WnhzV0RtMmh0OGpPcVJuTG9j?=
 =?utf-8?B?bzBpWERQZlRyN05RNzF2NWsrUm84QTFBUStoS2tPRzM5VE5ZTlRSKzAwdGJZ?=
 =?utf-8?B?UVoyUHZXWkdjMWJJTkp0WFQwNzNHbkRUWTZvbDZjQXBDZytiNVVkcVlaQWFZ?=
 =?utf-8?B?LzAwV3I4RzZVcVZxVVdXMzVGS2ZYOEdsRnJuREpZdjZGR2hCYmJEcnIyWE9E?=
 =?utf-8?B?bUNaUG5uYVZOVXNqbU44UU5FQTVQbkIvYnduQ1VXTEhWN3cwYURiT1VoeER2?=
 =?utf-8?B?SlNYU1JiSlEzeVkrL0RtQUFnZXFMU0ZQK3lkRzJ5YjNTZ2tXTlJBWWpHU3ph?=
 =?utf-8?Q?YKcWMeaPNhKV/PaOTTqd6QrWc7k4RfPxZHL4g=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 6011486d-d1eb-4d14-00dd-08de4a3462d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2026 19:23:18.9583 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6933
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

RnJvbTogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPiBTZW50OiBGcmlkYXksIEphbnVhcnkg
MiwgMjAyNiAxMToyMSBBTQ0KPiANCj4gT24gMS8yLzI2IDIwOjE3LCBNaWNoYWVsIEtlbGxleSB3
cm90ZToNCj4gPiBGcm9tOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBnbXguZGU+IFNlbnQ6IEZyaWRh
eSwgSmFudWFyeSAyLCAyMDI2IDExOjExIEFNDQo+ID4+DQo+ID4+IE9uIDEvMi8yNiAxODo0NSwg
TWljaGFlbCBLZWxsZXkgd3JvdGU6DQo+ID4+PiBGcm9tOiBIZWxnZSBEZWxsZXIgPGRlbGxlckBn
bXguZGU+IFNlbnQ6IFR1ZXNkYXksIERlY2VtYmVyIDMwLCAyMDI1IDE6MDcgQU0NCj4gPj4+Pg0K
PiA+Pj4+IE9uIDEyLzI3LzI1IDA1OjI0LCBQcmFzYW5uYSBLdW1hciBUIFMgTSB3cm90ZToNCj4g
Pj4+Pj4gVGhlIEh5cGVyViBEUk0gZHJpdmVyIGlzIGF2YWlsYWJsZSBzaW5jZSA1LjE0LiBUaGlz
IG1ha2VzIHRoZSBoeXBlcnZfZmINCj4gPj4+Pj4gZHJpdmVyIHJlZHVuZGFudCwgcmVtb3ZlIGl0
Lg0KPiA+Pj4+Pg0KPiA+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBQcmFzYW5uYSBLdW1hciBUIFMgTSA8
cHRzbUBsaW51eC5taWNyb3NvZnQuY29tPg0KPiA+Pj4+PiAtLS0NCj4gPj4+Pj4gICAgIE1BSU5U
QUlORVJTICAgICAgICAgICAgICAgICAgICAgfCAgIDEwIC0NCj4gPj4+Pj4gICAgIGRyaXZlcnMv
dmlkZW8vZmJkZXYvS2NvbmZpZyAgICAgfCAgIDExIC0NCj4gPj4+Pj4gICAgIGRyaXZlcnMvdmlk
ZW8vZmJkZXYvTWFrZWZpbGUgICAgfCAgICAxIC0NCj4gPj4+Pj4gICAgIGRyaXZlcnMvdmlkZW8v
ZmJkZXYvaHlwZXJ2X2ZiLmMgfCAxMzg4IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0N
Cj4gPj4+Pj4gICAgIDQgZmlsZXMgY2hhbmdlZCwgMTQxMCBkZWxldGlvbnMoLSkNCj4gPj4+Pj4g
ICAgIGRlbGV0ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL3ZpZGVvL2ZiZGV2L2h5cGVydl9mYi5jDQo+
ID4+Pj4NCj4gPj4+PiBhcHBsaWVkIHRvIGZiZGV2IGdpdCB0cmVlLg0KPiA+Pj4+DQo+ID4+Pg0K
PiA+Pj4gSGVsZ2UgLS0gaXQgbG9va3MgbGlrZSB5b3UgcGlja2VkIHVwIG9ubHkgdGhpcyBwYXRj
aCBvZiB0aGUgdGhyZWUtcGF0Y2ggc2VyaWVzLg0KPiA+Pj4gVGhlIG90aGVyIHR3byBwYXRjaGVz
IG9mIHRoZSBzZXJpZXMgYXJlIGZpeGluZyB1cCBjb21tZW50cyB0aGF0IHJlZmVyZW5jDQo+ID4+
PiB0aGUgaHlwZXJ2X2ZiIGRyaXZlciwgYW5kIHRoZXkgYWZmZWN0IHRoZSBEUk0gYW5kIEh5cGVy
LVYgc3Vic3lzdGVtcy4gSnVzdA0KPiA+Pj4gd2FudCB0byBtYWtlIHN1cmUgdGhvc2UgbWFpbnRh
aW5lcnMgcGljayB1cCB0aGUgb3RoZXIgdHdvIHBhdGNoZXMgaWYgdGhhdCdzDQo+ID4+PiB5b3Vy
IGludGVudC4NCj4gPj4NCj4gPj4gU2luY2UgdGhlIHBhdGNoZXMgIzIgYW5kICMzIG9ubHkgZml4
IGNvbW1lbnRzLCBJJ3ZlIG5vdyBhcHBsaWVkIGJvdGggdG8NCj4gPj4gdGhlIGZiZGV2IHRyZWUg
YXMgd2VsbC4gSWYgdGhlcmUgd2lsbCBiZSBjb25mbGljdHMgKGUuZy4gaWYgbWFpbnRhaW5lcnMg
cGljayB1cCB0b28pLA0KPiA+PiBJIGNhbiBlYXNpbHkgZHJvcCB0aGVtIGFnYWluLg0KPiA+Pg0K
PiA+PiBUaGFua3MhDQo+ID4+IEhlbGdlDQo+ID4NCj4gPiBBbnkgY2hhbmNlIHlvdSBjYW4gZml4
IHRoZSB0eXBvIGluIHRoZSBTdWJqZWN0IGxpbmUgb2YgdGhlIDNyZCBwYXRjaD8NCj4gPiAiZHJt
L2h5cHJldiIgc2hvdWxkIGJlICJkcm0vaHlwZXJ2Ii4NCj4gDQo+IFN1cmUuIEZpeGVkIG5vdy4N
Cj4gDQoNCkFsbCBsb29rcyBnb29kISBBcHByZWNpYXRlIGl0IC4uLg0KDQpNaWNoYWVsDQo=
