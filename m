Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A16CEF178
	for <lists+dri-devel@lfdr.de>; Fri, 02 Jan 2026 18:45:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1C0510E1E9;
	Fri,  2 Jan 2026 17:45:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=outlook.com header.i=@outlook.com header.b="ewSq6RFE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azolkn19010030.outbound.protection.outlook.com [52.103.23.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 502A410E1E9
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jan 2026 17:45:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MkTyV/cFzV84jLEAlhAnkyyjSVzk1S7LHvI8AsHGPCGOU3F22rfUHWkv+mlohfp4wHczBi6hvW129zMix3m7Oms/CCBMPClGxJeCbOVBO6Cxbk2jD7KNpbefdS2zu+q/50fvBOdyd6WcDUf2LK2R4O6hDk50kumi9hrgi5rzo49DwRwliIiEkZKzOXAf0R+TkYiEHxqDnJQphaxeYocn6FdeNWyjLtBON9ZtRuobvJM4bayFlW81hmgSc0GkxCRzVQxOajO4C14ltnpg4Syk5eIzSzBMDy3aLEpsvLHDrhW2GciPaVYIO5UOqiRVfjIbcOCSQlTfVf4nTYJCMRr9GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=khtFR7WZ4U497YunnxUj+5kqdSneLe55BD08Egrj7tc=;
 b=jGJuQgbdrPJCJxc9kEiskZ8qQnNRhnSQsVOrdIt+9XCJ19OWlztwfS8k2zmVlFxriBe0VekB7cqTxQG3qt8ypUpjE8PB88xghixre9zV+kZD69YlinwzvdrxuhFA91zCofTDZ5SAryxOaQe6dRv/dgEatBmU52sqM6xYTYv6h/c24bwu3qs32NdwDNM/Q23hfRBRc8xjsA1ucpHzz8l4yQ7UMiy29gAOwnc1obxgVshydEVGNCVolNPrxxFIQwvbwR276CyA/dfkMENmfplqqPVuSbSM1DvmWPMRV6p1CQqo23AYd7iygdQKE9RKPiXGKBNjrDJvcqrlpNd4VS6eIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=khtFR7WZ4U497YunnxUj+5kqdSneLe55BD08Egrj7tc=;
 b=ewSq6RFEU6BKTWhfCc6nA5trbIXyrpA96cJZ3tTIOS+ZY96N+IMQKlgkydN7DAvoli79FEWXvAGTLBI90PpPctKkPU/19GCNgBhK+FC6x2ohdIPnYgoqe7949Q5inl5AWObr2ULRkuCffpJ57YOc7YGa2m6FC2gacRJTraseCRleOZ0UV7jblbV1bQf9oHNry/RV+Ku+/VUtHNun4MVtwoi9BmED2xctxuz9t/8uaVbtdDkb4N5KCipAh5MlDQtmAv62ZCcOB+C4XEpkySReopF4lqVor0NDes6/r6kkUU6O1YYvirBIGMYzPkFiLPP9pZQpnQMa0+v/Fxdp0Eq6fw==
Received: from SN6PR02MB4157.namprd02.prod.outlook.com (2603:10b6:805:33::23)
 by DS0PR02MB10991.namprd02.prod.outlook.com (2603:10b6:8:28f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Fri, 2 Jan
 2026 17:45:41 +0000
Received: from SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6]) by SN6PR02MB4157.namprd02.prod.outlook.com
 ([fe80::900:1ccf:2b1e:52b6%3]) with mapi id 15.20.9478.004; Fri, 2 Jan 2026
 17:45:41 +0000
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
Thread-Index: AQHcdui+KQXRjOIFVEuflSwlcErRcrU56WyAgAVGySA=
Date: Fri, 2 Jan 2026 17:45:40 +0000
Message-ID: <SN6PR02MB415700F34CA2A4296A542F73D4BBA@SN6PR02MB4157.namprd02.prod.outlook.com>
References: <1766809486-24731-1-git-send-email-ptsm@linux.microsoft.com>
 <e37ef037-fb4f-418c-937b-b3deb632d0ca@gmx.de>
In-Reply-To: <e37ef037-fb4f-418c-937b-b3deb632d0ca@gmx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN6PR02MB4157:EE_|DS0PR02MB10991:EE_
x-ms-office365-filtering-correlation-id: 272bdf51-e5b0-4f30-9651-08de4a26bf1f
x-microsoft-antispam: BCL:0;
 ARA:14566002|31061999003|461199028|15080799012|13091999003|8060799015|19110799012|8062599012|3412199025|440099028|52005399003|40105399003|102099032;
x-microsoft-antispam-message-info: =?utf-8?B?QW1OSFJwTnlhdmtvZXBDblVHQjh4RHpDTmhQZ3JFSXBxck03eFlvd1E5Nk0x?=
 =?utf-8?B?WnVuMnQ4dkhSU2p4R3p1Q2dDT3dZdUtqdkh3eng1ekFvZGt1U1RIMFJOTzFy?=
 =?utf-8?B?ZEI5VVVzMU05MFcrejZncDgyQkc0VGpDMmw5RWlwclM0MWZtNFp0SzRjL1pz?=
 =?utf-8?B?ZXJ0blVnS0syNUx5MSs5M1BZU0FmUjgweFRVaWFERG5sakJVZE9aeGdIcFlC?=
 =?utf-8?B?QnhGaGdldm12RW83ckVxVS8yZm1mZno5b2FlbU93R3gwVy9PU2xEWWNQM1VG?=
 =?utf-8?B?TS8xSFhuT2psbldsYVExTDJUNTZmYUk3VExqUk16UVk2YytZVFBiVGJ3T0pJ?=
 =?utf-8?B?bWNjN3JxSmZBalRmQzVYU255SEdma20zdE5KdEJuUzdQMUdKeElsMmI3L2FM?=
 =?utf-8?B?Zmg5Mm9zeHp4MFlZUSt1ZmdHRitQY0s0cWNoUmFmRXhXOWhPTUxXTlFKUUZG?=
 =?utf-8?B?RWpwanNxY2RIQlBZRnU2WE1ZN216REpwcWR5WlBqR21pb0cwVThnUUVGWThV?=
 =?utf-8?B?dENveXUzZldXd2Qvc2tmOCtYcldOc2YrZ2MrbzlMMytsbHAwaE5mVFcvTUwz?=
 =?utf-8?B?cER2THJpL3YvNFZjVk5DOXR6SGVwSTdGUVJ6eFRpMUIyR2FXanRwL0pjUWdn?=
 =?utf-8?B?S3B2UGQ2eDlCaGtDZ3FtVm1uaW1LVnBmK3A1S3V1dW1DWDlOdUR3c3NCWVlW?=
 =?utf-8?B?SzJqanVIVkRUY3pNSUV5cU9HN1JJUDE5MEVKUEtERU0wbXdsNEl1VkZHWnRx?=
 =?utf-8?B?eGtQTmJPUnIvSXREbXhqVEFkYlNEcGxLVklycHBSQ1ZGM3llZGxWSW1zSlNE?=
 =?utf-8?B?YUQ1QW0zL2xEcVBabzFvQUdEV0RMNlVOTk8raUdIT3hsNHZoUEdoOUdRY3k3?=
 =?utf-8?B?elcrTHFEUHIvZzF3NkVNZk9tWVJCb0lRWTBCNUZzcXgxanMvSk51dHllTmtD?=
 =?utf-8?B?MzBGemRjZnk1NE9UNE5VYTAraTRPK0VHYzlhZThQd3ByUjR0T0UrMjYwclBm?=
 =?utf-8?B?WWxWMktqOUVwMUlNSjVaQ1AzbFhsdTlDOVFpOWdaVDFGYnJYQTdVRVZwMTYw?=
 =?utf-8?B?NmdaYTBuSEs5ckwzQVh5b0JGR3J1QURvVXhUOVhkb011Q0lYRm5TUUVrcVZq?=
 =?utf-8?B?SFhnQVA0S2pHdW1VaEJ2WVZHUFlxZ2wxWVZ3TDVMMzlKZTZVbWdsdHM5blMx?=
 =?utf-8?B?VjZqWGlLR0JrRTRQNE1ZUDN2WkpzM2JlTnZTaGhXdnJNcTJvWXVFYzNraHZw?=
 =?utf-8?B?WHVLa1dpZk5hNDZ5dWI5UnpHVDE4NFBQbElkdHBFaS93TURTanJpbmlqdVBN?=
 =?utf-8?B?eW9rYzM5YURLY2U2Ri9tME1ubFdDQ1ByMnJHTTFrcEZlVnIwWSs1eGhLSW9D?=
 =?utf-8?B?aGw1QzBma0ptRG1zZnZnSnpMVjdBTHJZTnd3dEtSeVJtVXYxWUZlSWE3WDZU?=
 =?utf-8?B?VHN0cFpXM05WdEc1NnJ3TytDeTgzcklWZXladTdyL0E2TEEvV3hVM3NVd0Yz?=
 =?utf-8?B?Zk5RczJCS1BXby9CaldoVGs1Y2dKcjBwUDBwek0rSXk1NG1jOWtxWmxuSExS?=
 =?utf-8?B?d29WNFhZeHJ5ZVAyS3BBcm9kTUUrNkU3OStkRDZWWkNOU1JOenRVUDRTSlZH?=
 =?utf-8?B?ZnhpMXBrQVBsTWJvSUg1cWhRYVl1WVE9PQ==?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?a2kwbmk5dEExaktUcEFiTG91MmsxUjVFdEdPUUxxazJncFlJckZVQnRnUStj?=
 =?utf-8?B?Y2tKYnZuTXdzczczMVI0c05jc1dSTWdHMDlzS29EdFQ5amV3azFtTExoVGRD?=
 =?utf-8?B?M3dsUXBrdVRTNFM2YzBCRmUxWG5hbHQ5WFIzYnlTdXd5aWJCTVNqczlMbWwr?=
 =?utf-8?B?aEcyNXRWWVJIYU9qYWsyWGo1M3NDOU8zS2M5Ym80QVpmZjFUaWdFdndsc0pS?=
 =?utf-8?B?REhvTUxtZTlDcjlHWkRld0ZoNHZEVFVsZzFvU2Z0OTJDWUZNUG9rWXBPMDFj?=
 =?utf-8?B?VVdEVC9TY282YVRrbjJuZnFES2xwRUpWQmFaOUc4VkpMZGVZU2kyRk1CV09P?=
 =?utf-8?B?QU84WG8rd2xHOXR2eUtFTjVzQ3QyV29GWTlEays0K2U4MHdLLzdCaFVseEZX?=
 =?utf-8?B?M1I2dE5FU1FPa3FXeWF0dEI5TzBCUGpRaU1Ydk1RZ2hObjl1Ni9HWWxNdXpF?=
 =?utf-8?B?QXZjNm5KN1Y1S24vdDRvWkZoaTc1cmx5RXdlNExYcnVrUTdyemRMSWdsTnJP?=
 =?utf-8?B?OXgvaU5pNTlmdnR4NGZZVTYxbjZMZjQ5MnRwREdCZjd6aWZ2YVpXczNzellR?=
 =?utf-8?B?UlJBb2lpK28rT3lNM3ZiaHZyYXZZMytNd0tKUzFnVHRXME4vZmhELzlCaGVX?=
 =?utf-8?B?RmpLdFN6Z1JlZ21EUEMxM0tlZVN3UjRsa2h0LzBGQ3V0RUFqMlRGSWZpOWdS?=
 =?utf-8?B?bERWR0UyS0xqei9wQWdDQkljWkRrZ3JmMXNCbnRzcml6aEtQb1pRS3VQNnNE?=
 =?utf-8?B?MDRRUWtuNGtnUEdnZERRYW01RHVRVmxiNlBIR1FBOEU4ZHJ6b2p1YjcyZUJw?=
 =?utf-8?B?Nk9JMHpVenVSNlN4WmRqcnZ0SFBOT01YWW9wOGcySnlnQ1pmS29JUTdSUDJX?=
 =?utf-8?B?UzNEVkhURXMvK2ZlRmtMZG9kK0kzQitBcDU3RkYvc29TbXB2NVREVVJkelF5?=
 =?utf-8?B?UVN3SFpQMW90MkZyTnlPbFdWcUJycTMrMEo0MHI0Rk42WDRBdW5lcUw5TkZu?=
 =?utf-8?B?bmxGUFljZ0h5YkhVdnZybTVrUW5rajc4bXEwdFFua1paVHg4MHlPWERaYmxt?=
 =?utf-8?B?NnlWTy9Na2JGZmo5bGtBSGNvR2lMV3drQ0tSUnUzYjMrOGNDdW9UMVNWMFBs?=
 =?utf-8?B?S1JkcTM3ZVR3MUtBRWFQNENZbjV2aHo4dzZlTDYxdGF1bmZINTI5TWFiSzVU?=
 =?utf-8?B?WHRGdFNkeUpEL0pBWW85dTZrQWNrM3BtdVFTejJ5TjF3UEo4RUJGMGRXUnVP?=
 =?utf-8?B?cnk2OWg2cktXTzFtWVhoSzg0Um9TVFhMSmxCdkpRcXZCWk9hQ2QzdFVxeGRw?=
 =?utf-8?B?YURPRHlwY2JyUmtDdTJwWXkvVE9zMENTUUdyL3NIdk55WUVPYUR1OE1VaFBQ?=
 =?utf-8?B?YTIyQnpqUG9pY3dudzdVZm15TzZObE9GL1cyYk5tZ3Z6TlQweHNSTmd6am56?=
 =?utf-8?B?ZGJuL20zMjNFenZtYmtjb0IvZnRpS2hrN2tNdVF3MWlrTjRXVmFaWTJzSWdn?=
 =?utf-8?B?aTgvVEkvS1VVLzhJTXRhMkdEMFNCMWY5Q0N2QjJtZCtFTklOei9MK2tEdVNF?=
 =?utf-8?B?SDQxOFF5SWltSkNjZDRtUDA0aHg2aUJDa20xc1RUWlYwWmRQTGQ4enprRkpB?=
 =?utf-8?B?dWNRUnkycHM2VWk3bFFlalJnK01SeUdIdjBCdTdFTVBmbWVFOXBrS2owZDlt?=
 =?utf-8?B?c0J1V29zRXlNTTdVaklGY2QxQkUza3A3a3lNTHhXZnZLLzkvWmtxNmxvUFpX?=
 =?utf-8?B?am04b1pTbzNUaUlTS1RaRHZNY0VqVjk3REpFVFdsZGFXc1dBQjJCTEo3UDBO?=
 =?utf-8?Q?tak2SyvxsRlLRXDhlloicdPLvoqJjlvDkELaY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN6PR02MB4157.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 272bdf51-e5b0-4f30-9651-08de4a26bf1f
X-MS-Exchange-CrossTenant-originalarrivaltime: 02 Jan 2026 17:45:40.8565 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR02MB10991
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

RnJvbTogSGVsZ2UgRGVsbGVyIDxkZWxsZXJAZ214LmRlPiBTZW50OiBUdWVzZGF5LCBEZWNlbWJl
ciAzMCwgMjAyNSAxOjA3IEFNDQo+IA0KPiBPbiAxMi8yNy8yNSAwNToyNCwgUHJhc2FubmEgS3Vt
YXIgVCBTIE0gd3JvdGU6DQo+ID4gVGhlIEh5cGVyViBEUk0gZHJpdmVyIGlzIGF2YWlsYWJsZSBz
aW5jZSA1LjE0LiBUaGlzIG1ha2VzIHRoZSBoeXBlcnZfZmINCj4gPiBkcml2ZXIgcmVkdW5kYW50
LCByZW1vdmUgaXQuDQo+ID4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBQcmFzYW5uYSBLdW1hciBUIFMg
TSA8cHRzbUBsaW51eC5taWNyb3NvZnQuY29tPg0KPiA+IC0tLQ0KPiA+ICAgTUFJTlRBSU5FUlMg
ICAgICAgICAgICAgICAgICAgICB8ICAgMTAgLQ0KPiA+ICAgZHJpdmVycy92aWRlby9mYmRldi9L
Y29uZmlnICAgICB8ICAgMTEgLQ0KPiA+ICAgZHJpdmVycy92aWRlby9mYmRldi9NYWtlZmlsZSAg
ICB8ICAgIDEgLQ0KPiA+ICAgZHJpdmVycy92aWRlby9mYmRldi9oeXBlcnZfZmIuYyB8IDEzODgg
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQ0KPiA+ICAgNCBmaWxlcyBjaGFuZ2VkLCAx
NDEwIGRlbGV0aW9ucygtKQ0KPiA+ICAgZGVsZXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvdmlkZW8v
ZmJkZXYvaHlwZXJ2X2ZiLmMNCj4gDQo+IGFwcGxpZWQgdG8gZmJkZXYgZ2l0IHRyZWUuDQo+IA0K
DQpIZWxnZSAtLSBpdCBsb29rcyBsaWtlIHlvdSBwaWNrZWQgdXAgb25seSB0aGlzIHBhdGNoIG9m
IHRoZSB0aHJlZS1wYXRjaCBzZXJpZXMuDQpUaGUgb3RoZXIgdHdvIHBhdGNoZXMgb2YgdGhlIHNl
cmllcyBhcmUgZml4aW5nIHVwIGNvbW1lbnRzIHRoYXQgcmVmZXJlbmMNCnRoZSBoeXBlcnZfZmIg
ZHJpdmVyLCBhbmQgdGhleSBhZmZlY3QgdGhlIERSTSBhbmQgSHlwZXItViBzdWJzeXN0ZW1zLiBK
dXN0DQp3YW50IHRvIG1ha2Ugc3VyZSB0aG9zZSBtYWludGFpbmVycyBwaWNrIHVwIHRoZSBvdGhl
ciB0d28gcGF0Y2hlcyBpZiB0aGF0J3MNCnlvdXIgaW50ZW50Lg0KDQpNaWNoYWVsDQo=
