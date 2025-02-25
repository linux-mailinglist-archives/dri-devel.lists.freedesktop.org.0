Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14C9BA43C2F
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2025 11:49:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BBD310E06D;
	Tue, 25 Feb 2025 10:49:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=live.com header.i=@live.com header.b="RkNdSbUg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PNZPR01CU001.outbound.protection.outlook.com
 (mail-centralindiaazolkn19011036.outbound.protection.outlook.com
 [52.103.68.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F0810E18A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2025 10:49:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q0LSm0P8xrJ5RRKwBq9um3T5/2ojj2mtAGNixxTaPQa5LIt2hk4mRQO4PFCqIK4dOaon9lVWzlv1oqq/ukjroxT4uLxyrFg2808EU0Zzg5nja49/xY5SCitmGricHbxN30t8wHeatQL7VvhiWvEl8atsMdjuXyahCiCDJq0iNd8hSciz5yvYaVpdGPuIX62V/oF66el6/W5wQ9MJo/A8fBZWu5Ajk7BpJIDqBSg6NPjnl6I+7l/jSNacw92gnBrPTkl+L3LBkLq15lVo77VlbhSD/uQxxgyXx+kR40VrPEuVwLNp9qaIZDGkgMCcT685hUSjCWtKV3qo0NuIybi8IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aFoBM8Ac94NgyKamEHG1KMTPIfWmP2EuEaLf+o5Bt2A=;
 b=cYGtii/WlhqjofXdlntY1Z8vtaHz3hLFl9fTEHU2ulPxHKzVYCdBMMZgPPj7eCmUbRI3jfq3qdOEH5IxnmNj6B/BFiFNcPxweKhS7EL86GU7HzClIeFArvPLdPvNi9wi10+i+MxNk2Idx9SvK6pzvj3W3MFesZb85qrO7uKSsXqkGqHUsi3w+tIQrsAxn39imc7ZletMUKO2rhdYxuVwHtc4SHcI08jgosykA+FQrfij2xGouolOZvkux7xaw+u2osuiUAVm/SmjcnHj2XArEGuG0cBovUtDffy717kBMF2QRZYyVuow8nsZSjrQFUL/5PZ5clbcqfYNxhnB/fDByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=live.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aFoBM8Ac94NgyKamEHG1KMTPIfWmP2EuEaLf+o5Bt2A=;
 b=RkNdSbUgPvbfocC8/4P208Klq4J8/+fUTLijZ9dBSJGLBxuxshmDr5zrEFB0pC4iM52S8dpu/qM9ENXwSMYsjTOeF/BiiVwg10PJXFfb4U/TUf/ehI6NcO9faZA+ObanGqlDY2DqX/PyGm+fJB6mbYGX0v+kdSPbVG5L8TuMp/U7NgpchpaVvR0Tw0m8hh9n+kat8NGzHWoENNKhKD71349l3krnmKyXGSEgnTc7KrHsh/drZ7mAqEINwXUrD0r8NVkT1YRvRAm54Dlk41Kg/zXdDTHUlyqxWomjJRJFMlBVnqbVLAhHYg8a4A35ri+vSEv7i4ELyn24QDmyhaqIeQ==
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:f7::14)
 by MA0PR01MB8088.INDPRD01.PROD.OUTLOOK.COM (2603:1096:a01:9c::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8489.18; Tue, 25 Feb
 2025 10:48:53 +0000
Received: from PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77]) by PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::324:c085:10c8:4e77%7]) with mapi id 15.20.8466.016; Tue, 25 Feb 2025
 10:48:53 +0000
From: Aditya Garg <gargaditya08@live.com>
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
CC: "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, Kerem Karabay <kekrby@gmail.com>,
 Atharva Tiwari <evepolonium@gmail.com>, Aun-Ali Zaidi <admin@kodeit.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Topic: [PATCH v5 2/2] drm/tiny: add driver for Apple Touch Bars in x86
 Macs
Thread-Index: AQHbh21jOPDlavrp2kW5T/JI6UK95bNX0p8AgAAAqJOAAAMMgIAAAIrp
Date: Tue, 25 Feb 2025 10:48:53 +0000
Message-ID: <PN3PR01MB9597B5ECF47B04E3201DD56BB8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
References: <3457BF95-0E50-4B70-86DE-EE5EE95D3ACE@live.com>
 <4D7C00B4-7B75-4715-8D37-0059B22C030D@live.com>
 <Z72chunE_vvxtjLQ@smile.fi.intel.com>
 <PN3PR01MB9597BF95EC490951D75748F1B8C32@PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM>
 <Z72foRL3diil9icd@smile.fi.intel.com>
In-Reply-To: <Z72foRL3diil9icd@smile.fi.intel.com>
Accept-Language: en-IN, en-US
Content-Language: en-IN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PN3PR01MB9597:EE_|MA0PR01MB8088:EE_
x-ms-office365-filtering-correlation-id: a07c15fb-d50e-4b96-75a2-08dd5589ff4d
x-microsoft-antispam: BCL:0;
 ARA:14566002|8060799006|15080799006|6072599003|7092599003|19110799003|8062599003|461199028|102099032|440099028|3412199025;
x-microsoft-antispam-message-info: =?utf-8?B?aHZXSm0wRGJYeEVQM0FGZS9lTUEwWGFqZWhJZm9OS3VZejN2MEhXTkduSkpj?=
 =?utf-8?B?d0FFdGJQbTIrckljWmRaVG84MjZ5S1BHV1FBVHVGMUM3c0FJV0xuL1hMOXJC?=
 =?utf-8?B?QjF6SWRIYWZKdUlyN2ZYQ2ZPZUV4ZnMxZ3hPM2E1Q3RIMzZ5UDlQK09LZ05M?=
 =?utf-8?B?NXM0T29oK0g0NUM4RkRMTGcwSjFsL0FZcHE2eUpkVlRKbnV3S2dtaXVJUVQ1?=
 =?utf-8?B?VE00WHE5cC9EQ0dMenA2VWNlcWxVZ3FmdDRYYlZiektaWlAyK3dEWVVvTjIy?=
 =?utf-8?B?TXJWZXQ2Z0pYaTRkd2lyeTBrcFBFaWRnZHRlTnlKSC92Smd1Zkw5d0hUcisw?=
 =?utf-8?B?bW1saGRuQ0NQMmNzOWlnWmRUNzdiK3NJancxQWFBSmRTUWp0b3ArdmF0bW1Y?=
 =?utf-8?B?ekI2K2grTzFtcC9FMk03Q0tXMDFMSVVFRWhhT2tZelQzM2hLeXI4eWkyTlk1?=
 =?utf-8?B?aS91YzRuOFdQRG5uZDdzS1Zqd3hDL1hqV2pjMkxlMk9IYUVnSXQxdEFuQUF6?=
 =?utf-8?B?Z0x4Q2NwQVFJZ1I3OC9tamtoSVNNaExTOUFvQkNaQ09lcGR0TXQ5LytLcStI?=
 =?utf-8?B?R3BvNUorNkhSeXFVbndSWDdwRkVTc2p2WmRjdU5RZUNUNGJwUXp5RVVkTGwv?=
 =?utf-8?B?dXA5TWF6Q0I0NHgrbmt1QkZ6clFwTHp6c3ZNUkJmMDZTNVJERHA5TDR3VzEx?=
 =?utf-8?B?dEx3Q2ZsMzNYbEVaeDJsemlBWEd4ZnByY0F1UzYrK2QxcnJsR0w0bEozTTJ0?=
 =?utf-8?B?OEFrM3FXMmlSVmxIbnpmbXZkWkYyeDM3cElwaGpoRnBHSXpDQ0E3QnVNT0dG?=
 =?utf-8?B?RzR4RGdBMXp4MnF3ZzVpMlkrRm50YVl1UXhCcFJTNzJwZzVqeDBFa3l0dFlw?=
 =?utf-8?B?bk0vS0F6a2RVMlhZc0I4U0l0UElZWjV6YkdZeE9TQnRjdVBaVUhIbmZCdDZB?=
 =?utf-8?B?QjJPNFg0dU54RVlsY0NxVGNjM1Q3S0lOUmtPeTcyVkJDcm9LZWtzR0pkQ21q?=
 =?utf-8?B?UWdjejA4ZnIyMjJ6NTFKREFDdXNvVURQc3BmTDZuM3BPeEpDR1FmVk0za3VR?=
 =?utf-8?B?RWpXZ2IybnZOb2VnbEQ3Mzh0YUQrSSttdG1nckxrU1o3NzFOUUhnQ0FvckNo?=
 =?utf-8?B?dDlQN0Uxc0pXWnBHS2JUbXEvdFRuRXBib2k4QldTSVFYSGtTNUpTZXpuVkth?=
 =?utf-8?B?aTFESzhJd2JpbkdyeUcwL0VsS05rMFZmb2tZNmJ6M1dXdjNTVlRkSVFrZVhE?=
 =?utf-8?B?aDZFNjVjMUlLbHdQYW1vV1dZL0s4UC9GM1VyZkhPeDhZT1o5MnFZTkZteE53?=
 =?utf-8?B?cWd1enpKWlVyNnZNLzJtd2RESEhvd3ZJdjhTYkpLcXI3eWowTWZib25wei9J?=
 =?utf-8?B?MklLb0U5ZUZoV2t0Y2ljSTVQYXBVd0xjQi9tK3hxK1ZFYnpPZ2loeWFmZnlC?=
 =?utf-8?B?MW1XaFNvQ3B0dE9DTzROUW16V1hBNHdkdzJxeFFia25hNVZ4aUNvQ1Y0U2Jt?=
 =?utf-8?Q?2UmZE0=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3c5dUtKQ2ExOUVZdWtIWFU1SlhWclNIT2N0dFpEbHJsdU9oU29uUFhMUHVv?=
 =?utf-8?B?ZDlGcENIYVp0T0V3elQrWlVNUkdYQW1SUjFVYTZyT1N6NTBsUlRLUFQvT29Y?=
 =?utf-8?B?alhiSFNTRW9xSTYyYTFmRlQ5MzZkL0lWalZETjNCNG1YczZ3dDJ0OHJtaFVD?=
 =?utf-8?B?Kytwc2VOSkhtYi9hb1kxcU02OUx0R0FLZlhBRVRxTDRyMVc2Q3MrWEZwSXdp?=
 =?utf-8?B?YXBhS2VubnRTdVpMazl1NTU5M2wxZ1cydFFsUktmNkJjbHhDeGJLZUhYcUZN?=
 =?utf-8?B?b2JtNGxSWnFSbGhlcUxMWjhFMmVacnJXTHpXVUJWTWltZ0lyejRNMjBtVWFO?=
 =?utf-8?B?M3JtRjlCbGdkQ1R4TXpKM1RsYzFFalUvR3YyQnJmTUpOM2lrNzRzblAyUy9k?=
 =?utf-8?B?NkwzMnV2ejJuZjc2bm1qeEVlaWFCSjk5VHFtaGVmWGdzcFA3YnhCQlBlTTdP?=
 =?utf-8?B?b0NTV0xuOXk4dS9wREJXd0JqS29mb0NVQXZ5eG9WOGQwd0FRRnoweklwOVdB?=
 =?utf-8?B?cmVwZmVyMCtreitFYWsveEhicXB3WG1yNjdTLzZYdnpscjQraEpSWWZuWHF2?=
 =?utf-8?B?SnBPTTc0cm9obWRsZEJNODFFcTUyZjhoemoweTdCRWp1WVdveWhaSXRkYlV2?=
 =?utf-8?B?aGJYSkJ2YWRRa3o3bG82MlJ1TkRNNnRvUFdVb2xWMEZOVFJEZjA4amI3Q3VX?=
 =?utf-8?B?OTl4Ull1NzdtZ3M5ZklSOHAvaktYOTI0OUhDbTVBNS9nOEdCY3d6T1pZaGE2?=
 =?utf-8?B?TjZreFBYSXhYOGlkVnd2RU5IOVJZc2JLMGRaOSswODlsUlBzZmdmLzl4ZkJK?=
 =?utf-8?B?MkU2a0MzdjlSVzJwNWFOYnRKYXV2akNDanNISmxaQ1FERC9GelVSR0xLekR0?=
 =?utf-8?B?N0g4WDFlMFl6THlzRlM5Yi9ibW93cjlwWXltL0RuTU9qZk1NMUlKMFdmMHB3?=
 =?utf-8?B?dWV6ancvRlFKSXJKN21ETEgzOUN6RlI2NVRuZFBSdUtWSUZhZkd2WSt3VTEw?=
 =?utf-8?B?UEc5QUowQnM1d3BOY1B5NDBrQzFBMXpDcXN5RDZ1THhLaEhjRUZ0OFhucENs?=
 =?utf-8?B?MjhLcDh6bjZmV2RFUEpJbHZHNlJOZVhWSEgxaXFvTkppS2F3VnM3R3pHY2Fp?=
 =?utf-8?B?MUNyaHZTV0R3NXdpSkpNZ2JFUGVNb25DUTl5Wng4a2Y5NWlad2JXK254Um5L?=
 =?utf-8?B?UE5MWlh6Wlp5b1g1VEFya3B6SDJ6YWl3U1Q1NjFvSjhUU3VqRUhYY0YrZFVs?=
 =?utf-8?B?eXA4VXYxYWRuQURDaGZHWXlVdi9hdWlodUxtYkI3c0VGdU1xOFV4eGp4a2N4?=
 =?utf-8?B?OFRROGJvdnF4ZU9EMnF3dGtiWlQvd2syV0hyMVk1N0c2Yi96bFRKaVNHWDVW?=
 =?utf-8?B?Sk5ITzlQaDdoTkp5bEpJVUJ2bU5VYVA2Z1NYL3R5cmQzQUp5YW5MTnU1N3Zx?=
 =?utf-8?B?MFhzdTUyN3lEc1hUQXlxUTZaeWZ1TmxnOXh2aE8vVnk5eUhZK3hBOEJiRTFR?=
 =?utf-8?B?bDJZbCtnbk1iYnpkWVplWkVHMGxDZGhiZCtHZGluMU1ZaXpSbFNiZnBuTVJp?=
 =?utf-8?B?SDE0YTA2TjFvMnFHenRobldlS0Q0M0NQNGRvL24renVGNmM2Vm5RMnREWmls?=
 =?utf-8?B?Sndnc3BhbXgwczdJTk1pUDlqQ2FWcDk1cytXTEhCaFFEZjRlTEFpelZkOHZ0?=
 =?utf-8?B?SzJoYjdQM1grRWs1Sy91amE1SDM2a3doNE9COXZGZTNKMUhUYy9rTWRGajVR?=
 =?utf-8?Q?1cK/E+BbmZULkGsCSQ=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-7719-20-msonline-outlook-ae5c4.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PN3PR01MB9597.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: a07c15fb-d50e-4b96-75a2-08dd5589ff4d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Feb 2025 10:48:53.8395 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0PR01MB8088
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

DQoNCj4gT24gMjUgRmViIDIwMjUsIGF0IDQ6MTfigK9QTSwgYW5kcml5LnNoZXZjaGVua29AbGlu
dXguaW50ZWwuY29tIHdyb3RlOg0KPiANCj4g77u/T24gVHVlLCBGZWIgMjUsIDIwMjUgYXQgMTA6
MzY6MDNBTSArMDAwMCwgQWRpdHlhIEdhcmcgd3JvdGU6DQo+Pj4+IE9uIDI1IEZlYiAyMDI1LCBh
dCA0OjAz4oCvUE0sIGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbSB3cm90ZToNCj4+
PiBPbiBUdWUsIEZlYiAyNSwgMjAyNSBhdCAxMDowOTo0MkFNICswMDAwLCBBZGl0eWEgR2FyZyB3
cm90ZToNCj4gDQo+IC4uLg0KPiANCj4+Pj4gK3N0YXRpYyBpbnQgYXBwbGV0YmRybV9wcm9iZShz
dHJ1Y3QgdXNiX2ludGVyZmFjZSAqaW50ZiwNCj4+Pj4gKyAgICAgICAgICAgICAgICBjb25zdCBz
dHJ1Y3QgdXNiX2RldmljZV9pZCAqaWQpDQo+Pj4+ICt7DQo+Pj4+ICsgICAgc3RydWN0IHVzYl9l
bmRwb2ludF9kZXNjcmlwdG9yICpidWxrX2luLCAqYnVsa19vdXQ7DQo+Pj4+ICsgICAgc3RydWN0
IGRldmljZSAqZGV2ID0gJmludGYtPmRldjsNCj4+Pj4gKyAgICBzdHJ1Y3QgYXBwbGV0YmRybV9k
ZXZpY2UgKmFkZXY7DQo+Pj4+ICsgICAgc3RydWN0IGRybV9kZXZpY2UgKmRybTsNCj4+Pj4gKyAg
ICBpbnQgcmV0Ow0KPj4+PiArDQo+Pj4+ICsgICAgcmV0ID0gdXNiX2ZpbmRfY29tbW9uX2VuZHBv
aW50cyhpbnRmLT5jdXJfYWx0c2V0dGluZywgJmJ1bGtfaW4sICZidWxrX291dCwgTlVMTCwgTlVM
TCk7DQo+Pj4+ICsgICAgaWYgKHJldCkgew0KPj4+PiArICAgICAgICBkcm1fZXJyKGRybSwgIkZh
aWxlZCB0byBmaW5kIGJ1bGsgZW5kcG9pbnRzXG4iKTsNCj4+PiANCj4+PiBUaGlzIGlzIHNpbXBs
eSB3cm9uZyAoYW5kIGluIHRoaXMgY2FzZSBldmVuIGxlYWQgdG8gY3Jhc2ggaW4gc29tZSBjaXJj
dW1zdGFuY2VzKS4NCj4+PiBkcm1fZXJyKCkgbWF5IG5vdCBiZSB1c2VkIGhlcmUuIFRoYXQncyBt
eSBwb2ludCBpbiBwcmV2aW91cyBkaXNjdXNzaW9ucy4NCj4+PiBJbmRlcGVuZGVudGx5IG9uIHRo
ZSBzdWJzeXN0ZW0gdGhlIC0+cHJvYmUoKSBmb3IgdGhlIHNha2Ugb2YgY29uc2lzdGVuY3kgYW5k
DQo+Pj4gYmVpbmcgaW5mb3JtYXRpdmUgc2hvdWxkIG9ubHkgcmVseSBvbiBzdHJ1Y3QgZGV2aWNl
ICpkZXYsDQo+PiANCj4+IEknbSBub3Qgc3VyZSBob3cgZHJtX2VyciB3b3JrcywNCj4gDQo+IEl0
J3MgYSBtYWNyby4NCj4gDQo+PiBidXQgc3RydWN0IGRybV9kZXZpY2UgZG9lcyBoYXZlIGEgc3Ry
dWN0IGRldmljZSAqZGV2IGFzIHdlbGwuDQo+IA0KPiBZZXMsIGJ1dCBvbmx5IHdoZW4gaXQncyBp
bml0aWFsaXplZC4NCj4gDQo+PiBBbnl3YXlzLCB0aGlzIGlzIHNvbWV0aGluZyBJJ2xsIGxlYXZl
IGZvciBUaG9tYXMgdG8gcmVwbHkuDQo+IA0KPiBUaGUgY29kZSBhYm92ZSBpcyB3cm9uZyBpbmRl
cGVuZGVudGx5IG9uIGhpcyByZXBseSA6LSkNCg0KSSdtIGtpbmRhIHN0dWNrIGJldHdlZW4gY29u
dHJhc3Rpbmcgdmlld3Mgb2YgMiBrZXJuZWwgbWFpbnRhaW5lcnMgbG9sLCBzbyBJIHNhaWQgbGV0
IFRob21hcyByZXBseS4NCg==
