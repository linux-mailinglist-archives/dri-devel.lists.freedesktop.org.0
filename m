Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762E43D349
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35DE86E529;
	Wed, 27 Oct 2021 20:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80139.outbound.protection.outlook.com [40.107.8.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D57F6E529
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 20:54:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bB33pb0LSiFtkBqj2L13hAHa2qAfOqUZHJHJBYanBa7qlCGu5X9fqQLaxuGllEc8Fgq2O0fGX8EuW7NAOYmcxpzNpaDL6V1qjF5fa26bTWe18v14bALOE9jt7tjRKCbvbER4aP+yY/f2iqEKAucsSJQHJpdG2afblzL5kieRNfPz90cdMRKbbArqzUYXLx0KHlF8cBP22OkaWQoZICMrHnUPlySRbCY8JPQv8L+vrf053ztWp7fVDdmARAU82KUpvcmbXzOd+BbPxGcbegXdX2MaAv62RL6a1jUl+hCBVOp8/JwLe2s8KlbuMlF0aHPWY/+b6Vo9cxsSYZP8s81flA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PamNjXSsvsvIbblmkx2LHeFi/jeIbXp2ysiYeFlnUTs=;
 b=SYx/Wjg7cyENaUF0rFqbezwRq4VhV/ynuTY04n54Lm6mYWfzSpajeLuY3swggAbUYQ8xMrgX0PSlMqNNqGB/NepNNugFWcJ7DZcPGjJQg71lMnDdzFTFYR9KIcPVkWslJTHV7OrVK9D8Svhuz1SFNf0EVl3wjCn2o32+kYiuGtSTqgvzh1UKFRXJrf3XnKMvPCJWvUKkSBFDNT6VaFiO5Y/FV/5jaqcgLXQrWJRPpDLAc+Bi5wkL+txXouPZ2A86fjiKJatwaDjOeepp64fC9OshafhUZdByGqAwD5P1HhPBgdZKUKYPyfwcTbmCPRW412DoXy4rfYOteTGat7GunA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=toradex.com; dmarc=pass action=none header.from=toradex.com;
 dkim=pass header.d=toradex.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=toradex.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PamNjXSsvsvIbblmkx2LHeFi/jeIbXp2ysiYeFlnUTs=;
 b=Qu2P/P1YXuRlRgmotShoAolQ45HibbSsMdFDdYOglWHbv140x6dvg2yX23bF/sQJz9rpm/wqDjNA7fB8EBvMLcudBdOv0+Hvd4arKtumM8mNnmFRKVbn0cJxoV0PYyFEb/s4xEdONS+mbGUdM8tstOybKRxTfGYQ4UPkeQHHWyc=
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com (2603:10a6:10:55::32)
 by DBAPR05MB7253.eurprd05.prod.outlook.com (2603:10a6:10:1af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18; Wed, 27 Oct
 2021 20:54:24 +0000
Received: from DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::91e8:e960:243:da70]) by DB7PR05MB5431.eurprd05.prod.outlook.com
 ([fe80::91e8:e960:243:da70%5]) with mapi id 15.20.4628.020; Wed, 27 Oct 2021
 20:54:24 +0000
From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
To: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-next@vger.kernel.org"
 <linux-next@vger.kernel.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>
CC: "sfr@canb.auug.org.au" <sfr@canb.auug.org.au>, "airlied@linux.ie"
 <airlied@linux.ie>, "andreyknvl@gmail.com" <andreyknvl@gmail.com>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>, "arnd@arndb.de"
 <arnd@arndb.de>, "lkft@linaro.org" <lkft@linaro.org>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>
Subject: Re: [PATCH v1] drm: import DMA_BUF module namespace
Thread-Topic: [PATCH v1] drm: import DMA_BUF module namespace
Thread-Index: AQHXy0b0gZ5pUr/KX0G6WBvl+vAPP6vnKucAgAAoL4A=
Date: Wed, 27 Oct 2021 20:54:23 +0000
Message-ID: <0f90b5da6139316429363fc14f76e96366f4a4b5.camel@toradex.com>
References: <20211027152534.3366799-1-marcel@ziswiler.com>
 <77d1966e-3081-10d3-d7a8-c159b62004aa@suse.de>
In-Reply-To: <77d1966e-3081-10d3-d7a8-c159b62004aa@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=toradex.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a6ef53d3-bdd3-4865-15c4-08d9998bf51e
x-ms-traffictypediagnostic: DBAPR05MB7253:
x-microsoft-antispam-prvs: <DBAPR05MB7253ED8BFFC67E55B921662FFB859@DBAPR05MB7253.eurprd05.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:4502;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 2VdZOd70B3/zn2mXCLuj0Bo335DNzthjTmaRPyryw8XGDW3mfjRMmHYgKsmd6lnufE7xTnWolixDaiT6KfvBFewspB7pVru3wwtCH8LRv0M5xANUJ79G5G5xdd5QPtvTXlYHlB18B4lmVh7FWO3Qy7Yrls/F+dhy1NJajvLIjFyVe4oVW7xbmw8K9SyK5XINzVTt0lilTTIg5HJP0CPBR0mmb1Jed7dZXe1A7AlxJIhFtPbOUrmQPYyIeVUJIzetcExsh2RFQE8vu/du/49naG42V0lzY7uGP7nyChmADQhP1G6CDvngMdrpmOb4zFYnqzxcXN1vNmKKVKW+74wnlSYBUA5dzNPfjl1hKJhb6abgGBsBotEi/9YwtpiJTw/NLN09Vvv95JjO4QEYS8bzZKS9pcFq1YCKhO0Ox/AzM5zEIUh2TpugDfzQo01e7vPcfVGkI5UG7qrSkI3sS7UR84DYRQUynY4WfsCK7rmkqiiat5fUlo7pu+nL6xwL6TTh1IWROXf+qqnxEMi+xxpZ+OauqS5qdzsjNkCeqkVyedJ4ByMPPuNrnOzUns1ujUauggAeJrNQJAXS90VWvGk+e3TZfvkS7gBHLE3v2+9YcWveijjx04wcsmgqISVHUFxzCfDU86mw5p0tXCrp7T6SlWiiInI9lyHrtouqeFL3eWNxwXKhOgojzyTBknUMvF0aQsB5mDdnyWQpROcpgE+dzg==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR05MB5431.eurprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(39850400004)(376002)(396003)(366004)(136003)(44832011)(66946007)(6506007)(91956017)(66556008)(64756008)(66476007)(76116006)(8676002)(2906002)(36756003)(4001150100001)(66446008)(2616005)(186003)(4326008)(122000001)(71200400001)(38070700005)(5660300002)(26005)(38100700002)(86362001)(7416002)(508600001)(66574015)(6512007)(316002)(83380400001)(54906003)(110136005)(8936002)(6486002);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZkJ1Yk9NSkpwbi9GWGJWM093djBhYnVHSkRqMnVQcmVUcHBiUmY3UE9hM2Q0?=
 =?utf-8?B?c3NnMisrdytDRmxCOHRrRlExWlRLZnFKN1VRUVYwWnpWeWZSZUF6dXdyakV5?=
 =?utf-8?B?RkxEdHQ5RkJlVW5oN0lKOGpIc3YzVkVRdGZXS29UaHFZZU1vZHhTQkw4bzBa?=
 =?utf-8?B?QjFmdFp5cFlyUW5VZTJiUWJxYTd1OTYvUnhaeU1DRkhYYWpkNDZRVDhlTUw0?=
 =?utf-8?B?WWs0NXFVWDdiSjk3YWZqZXF4eUpYeU1PQTJKVjNNZEQvRHhIWWVoZHFHbTZm?=
 =?utf-8?B?OUJ5cDQvMmxqTW5MaHF0cEQ3TWNRbUpiOWNtd0VsUFU2SEZrcStjdlBCdWNU?=
 =?utf-8?B?V0g2RzExZTluSDVGQWFuQWEwVUtuQ2UycCtld2VYZmFMMDNqbm8wWXY1QXFt?=
 =?utf-8?B?U2xYRndneFhxdHV0eTA2R2lUUW9BU0F6aVNwUmdmQVFGVWxydEFOOVE4c1BG?=
 =?utf-8?B?ZVlxanFYQmlieFA1RTh6bzV6VSt5ZC9NK015QmRYaGFYS2J5RmdjbDZwMkdP?=
 =?utf-8?B?VHc4WTZ6dDFLTjJlWHFFaTJVU3dWMmtZanBNRlFJNFJvai9KVjIvM3RReHQy?=
 =?utf-8?B?cHlJdFB3bDhqQm8wbGlMNzRNS2VyLzNoS1VGbC9SbG0wbE9FVE9aYTAzT0Jl?=
 =?utf-8?B?Y09ZdHFpWXZyMUM5ZUtVbHBMK3kyVmJYNGJCY1Q5WDZDQTVNeHFkNmlqbFo2?=
 =?utf-8?B?QmFmcnJMOUJpdzV4a3lKZWdTZFp4WlJGMVBZTFU0VitiQkNidXdueTNjZTVN?=
 =?utf-8?B?SlRqd3k4Y3pwYXhoYTFraXlsNFdnZFNYM2JYUmVaOHpKdk1VVDdDdGxUV3hE?=
 =?utf-8?B?azFvZDYzZnIzcVh1VGpHcjY2OS9ZbTZIOXErelI0ZExrQUJsUGlLeU93S2Q2?=
 =?utf-8?B?S2J5cGRQMXNQekpzNEtkaGRTOG0yWGhHa0JHV0tWN29TQThTbWtuQUhiMkJX?=
 =?utf-8?B?ZWc0K2R1TGtYeGxMeVFHemlja0ppSnlTUG5GZmdlOHY5bWVTa0p2dHQzZk83?=
 =?utf-8?B?SE9JVkZNM1JiWDRTclhXTkVXYWFDci9iQnIrdXdUS0RLeGVwM0thYjJncXd3?=
 =?utf-8?B?Wnc3S0ZueDRqRGdvSklqclI4eUs5ZldnK3EzTk0xaEVQMG5QUHc4WjVQMDlW?=
 =?utf-8?B?aVZLU2R2WWUyamxyMGNDSWlqckdnL3p4ekl6K2h5dDVQdGtWWk41NFk1YXlO?=
 =?utf-8?B?VTZZKzZBN2t5WCt4VGl2NGlKTjUyd0RzYnJHMUN6dnNiSWIrRXRWYzhJM2RP?=
 =?utf-8?B?K2M1SlgvMkxWZmVHR1BiS2FpYTdQcDFnYWh2MEJYN0l0Q1hBVEFRZForc214?=
 =?utf-8?B?UCtKZmd1bjJoOHlPYWo0djZ4QVdWTjNza0prQ084cTNlRzExTmhqRGYvK1l1?=
 =?utf-8?B?VHZ4UmhjMkRWTjBoTUE0U3NzYkhTY3I0blp4NWJ1M2RubnJSM2hoRkZ5Tmlu?=
 =?utf-8?B?SEllOEJudkpvK2JWSkhWNzkwSXlOZVdBaS9JdVJPeFhsTnRzNkJjTklvNzUx?=
 =?utf-8?B?YmJVRC9KRUFJbjgvMGhXdTl4Y1pObkd2Q2pDaTdUT3FZbWpWazBKSHRNNmJX?=
 =?utf-8?B?OVpXZ3dOTmQyUTUyVU1LVTA4VDVzdFVzcE1VNnBIamVnV2Y2YTI4THVnNTVs?=
 =?utf-8?B?Qk02M1hSUTFFODRuT2tTN0dBeVNRNWJiWHpSekVpbWxSSUdCdlQzL25xaHN3?=
 =?utf-8?B?Z2ZMcWQ4ejRENE95c3o3WHg1QXIzMFdyNkR6UUNRMFFlRFN6VUI5T1d1Y1BU?=
 =?utf-8?B?aVpWV3BISTROY1E3NXBVMjJLNWtzWkZUeHVoRUhwaGlBdFAwVTZqRUpzU08r?=
 =?utf-8?B?ZjI1SWROTUlreG5FakZZWmtGZmJoRVB6QjJocG1PcEZCbTdsZkMvUGFFR3J3?=
 =?utf-8?B?dlNGbzQzTkgvcHZzTUFackFaNUhFUm5pYlNHdjQzZmdkdGlOV0kzYm1QeDBt?=
 =?utf-8?B?VzVlb2FYYkliMUN0MmF6TW0xOG5Ba3BHbzBST3J5eG5jNmFQamNMNXhUbDY0?=
 =?utf-8?B?WG9Sa2RVdFhCRVZNTDdZOGlkNnpiMUFNZ251L01yQlh5MWxqZnNFcFdMSlZo?=
 =?utf-8?B?Sld6bXRaZWc5R1V1MVVhbkZVUDlJU0wvclBjUHFLVUxTVjNPMEJjTlA2ZVB5?=
 =?utf-8?B?SUNJSm1hVEdISFVwZ1Z6YWRvV3Y5QlNSeXZyd2l2eHlQUjJta0ppS0Vmcy9s?=
 =?utf-8?B?T2tnK25CcEhsd3htR2ZSdnRlOUFkUUtiY2hWWlJkeGozbUFGUGMvd2JEUmh0?=
 =?utf-8?Q?KfcL4SgXs9LwlqeNB7t13ucyIYaZI4i0dnmX3VEa4w=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5082D25C1BF463408E33AD13D94510B1@eurprd05.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: toradex.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DB7PR05MB5431.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6ef53d3-bdd3-4865-15c4-08d9998bf51e
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Oct 2021 20:54:23.9550 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d9995866-0d9b-4251-8315-093f062abab4
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MWCeCEkPjGAknoEWStqj4XhuDEWhHgs3Q9mLU5zvy6yFu/t1q259tBEE7hFF+O7IGyCb33KL9BYBzumeOUWGZxkcGC4kgRLQnBx/Or++t88=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR05MB7253
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

U2FsaSBUaG9tYXMNCg0KT24gV2VkLCAyMDIxLTEwLTI3IGF0IDIwOjMwICswMjAwLCBUaG9tYXMg
WmltbWVybWFubiB3cm90ZToNCj4gSGksDQo+IA0KPiB0aGFua3MgZm9yIHRoZSBwYXRjaC4NCg0K
WW91IGFyZSB2ZXJ5IHdlbGNvbWUuDQoNCj4gQW0gMjcuMTAuMjEgdW0gMTc6MjUgc2NocmllYiBN
YXJjZWwgWmlzd2lsZXI6DQo+ID4gRnJvbTogTWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2ls
ZXJAdG9yYWRleC5jb20+DQo+ID4gDQo+ID4gVG9kYXkncyAtbmV4dCBmYWlscyBidWlsZGluZyBh
cm02NCBkZWZjb25maWcgYXMgZm9sbG93czoNCj4gPiANCj4gPiBFUlJPUjogbW9kcG9zdDogbW9k
dWxlIGRybV9jbWFfaGVscGVyIHVzZXMgc3ltYm9sIGRtYV9idWZfdnVubWFwIGZyb20NCj4gPiDC
oCBuYW1lc3BhY2UgRE1BX0JVRiwgYnV0IGRvZXMgbm90IGltcG9ydCBpdC4NCj4gPiBFUlJPUjog
bW9kcG9zdDogbW9kdWxlIGRybV9jbWFfaGVscGVyIHVzZXMgc3ltYm9sIGRtYV9idWZfdm1hcCBm
cm9tDQo+ID4gwqAgbmFtZXNwYWNlIERNQV9CVUYsIGJ1dCBkb2VzIG5vdCBpbXBvcnQgaXQuDQo+
ID4gDQo+ID4gUmVwb3J0ZWQtYnk6IExpbnV4IEtlcm5lbCBGdW5jdGlvbmFsIFRlc3RpbmcgPGxr
ZnRAbGluYXJvLm9yZz4NCj4gPiBGaXhlczogY29tbWl0IDRiMmI1ZTE0MmZmNCAoImRybTogTW92
ZSBHRU0gbWVtb3J5IG1hbmFnZXJzIGludG8gbW9kdWxlcyIpDQo+ID4gU2lnbmVkLW9mZi1ieTog
TWFyY2VsIFppc3dpbGVyIDxtYXJjZWwuemlzd2lsZXJAdG9yYWRleC5jb20+DQo+ID4gDQo+ID4g
LS0tDQo+ID4gDQo+ID4gwqAgZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jIHwg
MiArKw0KPiA+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykNCj4gPiANCj4gPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jIGIvZHJpdmVy
cy9ncHUvZHJtL2RybV9nZW1fY21hX2hlbHBlci5jDQo+ID4gaW5kZXggNmY3YjNmOGVjMDRkMy4u
NjlmODU2NGFkMTFjZCAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9j
bWFfaGVscGVyLmMNCj4gPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2dlbV9jbWFfaGVscGVy
LmMNCj4gPiBAQCAtMjMsNiArMjMsOCBAQA0KPiA+IMKgICNpbmNsdWRlIDxkcm0vZHJtX2dlbV9j
bWFfaGVscGVyLmg+DQo+ID4gwqAgI2luY2x1ZGUgPGRybS9kcm1fdm1hX21hbmFnZXIuaD4NCj4g
PiDCoCANCj4gPiArTU9EVUxFX0lNUE9SVF9OUyhETUFfQlVGKTsNCj4gDQo+IENvdWxkIHRoaXMg
bGluZSBiZSBtb3ZlZCB0byB0aGUgYm90dG9tIG9mIHRoZSBmaWxlLCB3aGVyZSB0aGUgb3RoZXIg
DQo+IE1PRFVMRSBzdGF0ZW1lbnRzIGFyZT8NCg0KSGVoZSwgZ29vZCBxdWVzdGlvbi4gSSB3YXMg
YWN0dWFsbHkgYXNraW5nIG15c2VsZiB0aGUgc2FtZSBidXQgcXVpY2tseSBsb29raW5nIGF0IGEg
ZmV3IGZpbGVzIGFuZCB0aGV5IGFsbCBoYWQNCml0IGFmdGVyIHRoZWlyIGluY2x1ZGVzIHRvd2Fy
ZHMgdGhlIHRvcC4gVHVybnMgb3V0IHRoYXQgd2FzIHJhdGhlciBzaG9ydCBzaWdodGVkLi4uDQoN
CkxldCBtZSBsb29rIG1vcmUgY2xvc2VseS4gQ3VycmVudCAtbmV4dCBoYXMgZXhhY3RseSAyMDAg
ZmlsZXMgd2l0aCBhIE1PRFVMRV9JTVBPUlRfTlMgc3RhdGVtZW50LiBPa2F5LCBzb21lIG9mDQp3
aGljaCBhcmUgZG9jdW1lbnRhdGlvbi4gQW55d2F5LCAxMzIgb2Ygd2hpY2ggZG8gaGF2ZSBpdCB3
aXRoIHRoZWlyIG90aGVyIE1PRFVMRSBtYWNyb3MgdG93YXJkcyB0aGUgZW5kIGFzIHlvdQ0Kc3Vn
Z2VzdC4gMjAgb2Ygd2hpY2ggYW5kIG1haW5seSBEUk0gc3R1ZmYgaGFzIGl0IHRvd2FyZHMgdGhl
IHRvcCBhZnRlciB0aGVtIGluY2x1ZGVzLiBGdW5ueS4NCg0KV2hhdCBkb2VzIHRoZSBkb2N1bWVu
dGF0aW9uIHN1Z2dlc3Q/DQoNCkRvY3VtZW50YXRpb24vY29yZS1hcGkvc3ltYm9sLW5hbWVzcGFj
ZXMucnN0DQoNCiJJdCBpcyBhZHZpc2FibGUgdG8gYWRkIHRoZSBNT0RVTEVfSU1QT1JUX05TKCkg
c3RhdGVtZW50IGNsb3NlIHRvIG90aGVyIG1vZHVsZQ0KbWV0YWRhdGEgZGVmaW5pdGlvbnMgbGlr
ZSBNT0RVTEVfQVVUSE9SKCkgb3IgTU9EVUxFX0xJQ0VOU0UoKS4gUmVmZXIgdG8gc2VjdGlvbg0K
NS4gZm9yIGEgd2F5IHRvIGNyZWF0ZSBtaXNzaW5nIGltcG9ydCBzdGF0ZW1lbnRzIGF1dG9tYXRp
Y2FsbHkuIg0KDQpUaGVyZSB5b3UgZ28uIFBsdXMgdGhlcmUgaXMgZXZlbiBzb21lIGZhbmN5IGF1
dG9tYXRpb24gKDstcCkuDQoNClNvIGxldCBtZSBtb3ZlIGl0IGRvd24gdGhlcmUgdGhlbi4NCg0K
PiBJbiB0aGUgZml4ZWQgY29tbWl0IDRiMmI1ZTE0MmZmNCwgdGhlcmUncyBhIHNpbWlsYXIgY2hh
bmdlIGZvciANCj4gZHJtX2dlbV9zaG1lbV9oZWxwZXIuYy4gSXQgdXNlcyBkbWEtYnVmX3ZtYXAg
YXMgd2VsbC4gRG9lcyB0aGF0IG1vZHVsZSANCj4gcmVxdWlyZSB0aGUgc2FtZSBmaXg/DQoNCkxp
a2VseS4gTGV0IG1lIGp1c3QgcnVuIHplIGF1dG9tYXRpb24gYW5kIHNlZSB3aGF0IHdlIGdldC4u
Lg0KDQo+IERvIHlvdSBoYXZlIGFueSBpZGVhIHdoeSBJIGRvbid0IHNlZSB0aGVzZSBlcnJvcnMg
aW4gbXkgYnVpbGRzPw0KDQpXZWxsLCBJIGd1ZXNzLCB0aGVyZSBhcmUgdmFyaW91cyBLQ09ORklH
IHN5bWJvbHMgaW5mbHVlbmNpbmcgdGhhdCB3aG9sZSBzdG9yeS4gSG93IGFib3V0IGUuZy4NCg0K
aW5pdC9LY29uZmlnOmNvbmZpZyBNT0RVTEVfQUxMT1dfTUlTU0lOR19OQU1FU1BBQ0VfSU1QT1JU
Uw0KDQo+IEJlc3QgcmVnYXJkcw0KPiBUaG9tYXMNCg0KQ2hlZXJzDQoNCk1hcmNlbA0KDQo+ID4g
Kw0KPiA+IMKgIC8qKg0KPiA+IMKgwqAgKiBET0M6IGNtYSBoZWxwZXJzDQo+ID4gwqDCoCAqDQo+
ID4gDQo+IA0KPiAtLSANCj4gVGhvbWFzIFppbW1lcm1hbm4NCj4gR3JhcGhpY3MgRHJpdmVyIERl
dmVsb3Blcg0KPiBTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHZXJtYW55IEdtYkgNCj4gTWF4ZmVs
ZHN0ci4gNSwgOTA0MDkgTsO8cm5iZXJnLCBHZXJtYW55DQo+IChIUkIgMzY4MDksIEFHIE7DvHJu
YmVyZykNCj4gR2VzY2jDpGZ0c2bDvGhyZXI6IEZlbGl4IEltZW5kw7ZyZmZlcg0KDQotLSANCkJl
c3QgcmVnYXJkcyAtIE1pdCBmcmV1bmRsaWNoZW4gR3LDvHNzZW4gLSBNZWlsbGV1cmVzIHNhbHV0
YXRpb25zDQoNCk1hcmNlbCBaaXN3aWxlcg0KU29mdHdhcmUgVGVhbSBMZWFkIC0gRW1iZWRkZWQg
TGludXggQlNQDQoNClRvcmFkZXggQUcNCkViZW5hdXN0cmFzc2UgMTAgfCA2MDQ4IEhvcncvTHV6
ZXJuIHwgU3dpdHplcmxhbmQgfCBUOiArNDEgNDEgNTAwIDQ4MDANCg==
