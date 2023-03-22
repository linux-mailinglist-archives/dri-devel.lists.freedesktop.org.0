Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D2E6C42CC
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 07:16:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6CB610E274;
	Wed, 22 Mar 2023 06:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DEU01-BE0-obe.outbound.protection.outlook.com
 (mail-be0deu01on2108.outbound.protection.outlook.com [40.107.127.108])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAB1610E274
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Mar 2023 06:16:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fETFrcIECLh9iIyM81yVresRypOenyPLSMo4+73J5vmnBqq1d8lPSZDvMU3R1iaZePaJRwoehduVu/RiHT5ISTe5Wrmv5O2I2PrcmHtox/rpJtLFJY2hTRR/a/iO5yiSEO8I1MHpCQMcqt7CjR6jXHtOhrLH3VL9AveVnpx2SzbSGUGyBWK6/S29auxTATJ0XT0NXlHAbxr0DD28H7QSQSTtp6mjmo9ZdDO0P4pvCNOVJtJ02dJ6xZ1h1UY8nmHG6gZE9Yf9H392C4iPw14HjRJ6WkkQjiEJuXme9CLORAEWtR+cPHYw5vJiNBJVHIN3dnl7YPemo7JpiKZFE+4+Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X3wCjSiE9TNi+CFeOkCRRtUTxcNhHRlek8E99SWTKt4=;
 b=S1m9XjJ0AZgR5A/t8RkIHufWFzwJFqajCju48ldNQKMuI3PURmADYuA/jlLlruoM0KUj7Durn6XKu16nL25f+3iceDVS71vrbKMn19du9/Jyftnt8wFN5sBbbqaf8wB55e8n6SiqdC/oLIZNg6UfQpveYjHr3NJxCAuJH1meXC+323bWoVDAmxHoNYk+wDs8HxOCa82H8ety10x+e0h3V46uNCr3wd/Tyc/sj1Hvq4S05t8FotLxp982rLqLFCG5nYlRluOSv09fGohDiXMKyvjCJgNbVmaGcYTbHtQIXj1sxo6cSvM9xO+tRPo5sF/NCudCktetv5pIF/faTD8+QQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fi.rohmeurope.com; dmarc=pass action=none
 header.from=fi.rohmeurope.com; dkim=pass header.d=fi.rohmeurope.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rohmsemiconductor.onmicrosoft.com;
 s=selector2-rohmsemiconductor-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X3wCjSiE9TNi+CFeOkCRRtUTxcNhHRlek8E99SWTKt4=;
 b=szMSbgmR1n81E501m3/Zg0Aux06jsiBuJBUAYAFVRqTYn5m2OCZGBEsacwG6B2p2cKoewhizwSZQlyAY2WA7SbvYPOCbcW9hLXZWN+xPRWgEbHBmH/KtoLDZYxjvN4QZVfeQor+2yHSFW9XtD1ZkE7tCKpTgXLoZ8W8uvToQVx8=
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:59::10)
 by BEZP281MB3030.DEUP281.PROD.OUTLOOK.COM (2603:10a6:b10:28::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Wed, 22 Mar
 2023 06:16:27 +0000
Received: from BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3657:656:f6f6:dc8f]) by BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
 ([fe80::3657:656:f6f6:dc8f%6]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 06:16:27 +0000
From: "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>
To: Stephen Boyd <sboyd@kernel.org>, Matti Vaittinen
 <mazziesaccount@gmail.com>, Maxime Ripard <maxime@cerno.tech>
Subject: Re: [PATCH v4 2/8] kunit: drm/tests: move generic helpers
Thread-Topic: [PATCH v4 2/8] kunit: drm/tests: move generic helpers
Thread-Index: AQHZWN69xf/DMme1S0azqrQYW3vgiq7/EyMAgAKVWgCAAmi0AIAArdwAgADd3YCAAL0DgA==
Date: Wed, 22 Mar 2023 06:16:27 +0000
Message-ID: <b8e20a65-005c-0576-6adf-8735f81c19db@fi.rohmeurope.com>
References: <cover.1679062529.git.mazziesaccount@gmail.com>
 <1abd47784b08939ff08ff03d3d4f60449e87625f.1679062529.git.mazziesaccount@gmail.com>
 <20230317150916.a3xrh25ywe5k77yp@houat>
 <e8f50fe8-bad3-e59e-4d80-e2f7db9c9933@gmail.com>
 <5ace543cae7a54db399750a1b330c3ae.sboyd@kernel.org>
 <d13cd7bf-0b1e-e9e1-266a-00db40e51de7@gmail.com>
 <3479e3d4e5e1d84243ca35398ab392ef.sboyd@kernel.org>
In-Reply-To: <3479e3d4e5e1d84243ca35398ab392ef.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fi.rohmeurope.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BEZP281MB2454:EE_|BEZP281MB3030:EE_
x-ms-office365-filtering-correlation-id: a9d4910a-941e-436b-3b50-08db2a9cf859
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: aFHGKZ4U+8qL0e2AI3fUS5kqQQXzlOF9/oom+jZgO6PfwrJTd2LFnzF9YLVth5ARwliEbTEM0nH+o82em8tg5/3yzUuHZ6Kd+30bWnFkp3FyQXJBz7ZdAbkbHTazgOuMYTTlQDtPplTEjT6LLaIyfcTSj23OOb25VaW7C+p0GuKSEasXHLS0lYchw46nehcd84G091EblbcPlCtDlOc0MOUZz+RHnQieOubQ7ZR61GTNIiTY1NmBnM3R979Np1st5faGmywNbf54TPWvdIo0adMNwCmeUyXKfi2WfRsvFOcjMLYI3FDrakRKd/fkwq188Gm2yKSGwfgwlzGlyMfnmAbztV2sbvK+YbyvK8bQ+31y1NkPo2Caj0GBp6yilPUHCJK35SddR8WMzvV+C4fSv+4l9HICH7icymSEmokHQGa58f0iXnSXC58JVORz2euFN9fF097XHcmheUjRs74kQ5+Earh1emhyIR9TkG+elZ89bbc3MJS/KWbparAEGuzDGt8WGo4azV0XCcvYmEBPB52N0H7y3XSqdaWrmxV7G6RTHtVv8gjogTGaRnqB35KH4cavi+cV1Jus5iZBaDjU36l7/CCdhtMXDBpAFqHzHRvpQFuoGRCQSnRPOKu7IE2ExG2zYWGCVOamvZrVd9FwXzDbxRfmqsz1ZO70JL6gI+aq3XVQAes/iywjE4NUGSczRXnOLxJEQcmO/X+bJJmC93Y2haAta8+uxvXSy6mscIFPdVQfJUsDdQnPgDyelIMN9xCKCJfV+6QCIYxWQfhxMWZPB96gXRshmJncU09p4mE=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(39850400004)(366004)(376002)(396003)(346002)(451199018)(2616005)(71200400001)(6506007)(6486002)(4326008)(186003)(478600001)(83380400001)(316002)(110136005)(54906003)(66446008)(91956017)(76116006)(66476007)(64756008)(66556008)(66946007)(8676002)(31686004)(6512007)(53546011)(8936002)(5660300002)(7416002)(41300700001)(38100700002)(122000001)(2906002)(31696002)(38070700005)(86362001)(41533002)(43740500002)(45980500001);
 DIR:OUT; SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dDNNdGlGanFrNzdTOTJQK0NMQjZSaURCenBNYWRwaklHcHF2Z05idVczYlVF?=
 =?utf-8?B?WlBPcWo2VzkrYXZiS3QwM0RyWmIwSnB2ZlMvMC80K3BOc2wvU096SVJzVzlo?=
 =?utf-8?B?YVgrdVJUaW1VZWR6SjJ6VkdjWDI1V1RpcHo1dUEvYWJ0Yll0aXhENUswS3Jp?=
 =?utf-8?B?TkdVWmJ4RWpjSkhMa3dYcUFtSHNWSnB4WGlkMktKRjlURkl2V2J6T0xWR1Js?=
 =?utf-8?B?alJSdndKR09XMWVlWVFLWmFOenc1a05JNE9KdzNZMkt2VGlSL2tqMGYzZ1Rh?=
 =?utf-8?B?NFI1ek1DYTV3bENtYWovSDYxS3dkY1IrRENiTGJVVG1VMC83dnZicW5aVTB4?=
 =?utf-8?B?TmRueEpBNUt1ZVJKdmwvQ0xtdGtCWXp3OWYvcm1GdEJWa3NHRnNqMERnbWg1?=
 =?utf-8?B?eGdIQVVqK1NBT29qSVM2TUlMeUtsNjlnUUZ2Y0RXbDhXMU11UHNHY1dyVzJR?=
 =?utf-8?B?WkFYc1VMSDRRZTZiUlpZalBTV01FV0R5ZmIzclVFZHN6S1ZHQWZKSFJ2Sndw?=
 =?utf-8?B?ZFM2STZHR2ZBcFROYmRUdEdhMXc0a1BUTkI0RyszRWkvOGkyTFBtbG13VjJM?=
 =?utf-8?B?MTJ2djk0a3h2dlphdG9SMWpBWDIrTW8wbjB5aGZ2NUlsZWxkV2NjTm0wN3BO?=
 =?utf-8?B?eGpFWWxxSnJrK3kzejBMYm95MzFYalNHV1p5bE1kUmpheGJ4MkJqOFJLVE9L?=
 =?utf-8?B?SmRJNkV6eXBOUW5ja2pyTEZTME5Pa3M0VW5vNUxFMkFnSldvc3cxMVNPS0dG?=
 =?utf-8?B?TVlVMjc3blVzdnh3L3hWdFE4ZnlmZ2lNNXk4QUcwa2Y1WDVKTWt3b0Y1L3Uy?=
 =?utf-8?B?WUsyOWJ4UGhGN3hPZ1IvSEQwZHhVRWovTzZmYzNXK0FnWGI0WmZORTRZcVdl?=
 =?utf-8?B?WnNYVUF3WTRCcFdhRUtxeENLUHhRZGpmdFhKbkRoY3R1dWFqQTEwU2lyWEdU?=
 =?utf-8?B?SU5Ic2lndHRwWnhUeHVRYzRpNW1haExKQmJ0YTV6ZzcxUTl0bm1Gd3Q4N3h1?=
 =?utf-8?B?WWMyMGVkK24zVTRmU212YytRRzBoQ1c4VWczNk42cUtQSnVKY0hsUEdKQlBx?=
 =?utf-8?B?YlZGZmlGbUREUVI4U0YxV0NjVHpjZzVDRUZsem1aZ29uejVwTWw3Vlh1eUhZ?=
 =?utf-8?B?TUI1UlhYbXJkU0VQc1pDVW5kRHIxUkZIZC9sYml2WkMySTgxZDdtTzFHWHNW?=
 =?utf-8?B?VWpjQVh6bmtNOTU5dFVVRkxrR0lsS3l5bmNselRLanF1dVNpaGZoQld2cFNn?=
 =?utf-8?B?NlZhelBKY0M4TzM4Z3FPTDdZVEk2UGJ0ZWhBU3Y1UjdlNHo5aTdGRmgrNGpa?=
 =?utf-8?B?U2g5TGhXZ1lNNXpPYk95WlV6V1FTbWswVnh5OURSUVNrelpqVXZ0VUtGaTRs?=
 =?utf-8?B?R2c3Y2g0RXdVUWZVQjl0Vzd0RnI2dGZZc29STGdEdDliTTN3ZFVMaVpLS1hE?=
 =?utf-8?B?VjhxSzRQSUNaT3g4dGo0bUc1WHlFMFVabC9ZeGdHTm15SjN1K1hGcHNRdmVG?=
 =?utf-8?B?WEthQWxycGVIZXZNTWx5THlveEpoYnVXaHVGT2pGQzhzeStRWTNxYlRldmlN?=
 =?utf-8?B?SHo2UGtXc2s2eG5HTjdiVjlvMUdMTkZTMjZ4ZGgvVlplZDladS90d0NaenJ1?=
 =?utf-8?B?SWo1WDZ2cHFzTGhjNHJ5VThMR2ZTdGg4N1ZkL1JraDdxdXZnL0lJZzNMYkZW?=
 =?utf-8?B?anFMdXllUVhSZkRjUEE3KzUzSHNIOTk2cEphNzMzMThZNUVna28yQ1VKNHZF?=
 =?utf-8?B?YTFFQVhkejFYOU1JTlFPdGthOTNDLzlLd0NsdC9kam4vZjUyU3VrNFZHMyt5?=
 =?utf-8?B?MDFqQ2hGWSsrMlUxbHIwK3kvR0NWZ1BoUFNVRTdnRkNRUzJlTTN2RHFxanBt?=
 =?utf-8?B?TEtidktYbHhtcHVmMmlZNDdCUmNXcHVmU210OHAvVHp3aEtIOE1IY2FTbHVm?=
 =?utf-8?B?c1d0eTE1WFA5NXduSy9Tb2RoeC90UExZWXF4NkgwSmdqdWpOMmpWWGNtUnRq?=
 =?utf-8?B?SXFZa0dIODdzM1JxR1dSVjZ4V3Fwd0ZEYnFtZDJuZDAxU29nVTZDRlgvazR1?=
 =?utf-8?B?cVZrMmFjRjJlZG16dFh4c1FaSktsei8zTVdTR2IrQnFob1NhSVpCT0R2QUNj?=
 =?utf-8?B?Z1pZbC9VZ0psWWN0WC9taXVFQlVpUlAvdUtzNUNmN3BVYkx0RlFwbUpQaDdR?=
 =?utf-8?Q?aUX9EEZWPdNjPklKCP11SzE=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <0C0F8AA4461EDB48B42EB8866B0485E9@DEUP281.PROD.OUTLOOK.COM>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: fi.rohmeurope.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2454.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: a9d4910a-941e-436b-3b50-08db2a9cf859
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Mar 2023 06:16:27.2450 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b24d4f96-5b40-44b1-ac2e-2ed7fdbde1c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4O6Eau6GNqNbuZqNNzZ1Fz1vdfN45tjLDmt5ot53O+BhXBWYnDiPLc/lliehdFBjvc2FQ6Q2RbNKH3MdvZhrRuR55uFAvhcUtLiAWv3R31AkSvDVG5FCgltVa4GL9F3H
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BEZP281MB3030
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Emma Anholt <emma@anholt.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?utf-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?utf-8?B?Tm9yYWxmIFRyw7hubmVz?= <noralf@tronnes.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMy8yMS8yMyAyMDo1OSwgU3RlcGhlbiBCb3lkIHdyb3RlOg0KPiBRdW90aW5nIE1hdHRpIFZh
aXR0aW5lbiAoMjAyMy0wMy0yMCAyMjo0NTo1MikNCj4+IE1vcm5pbmcgU3RlcGhlbiwNCj4+DQo+
PiBPbiAzLzIwLzIzIDIxOjIzLCBTdGVwaGVuIEJveWQgd3JvdGU6DQo+Pj4gUXVvdGluZyBNYXR0
aSBWYWl0dGluZW4gKDIwMjMtMDMtMTggMjM6MzY6MjApDQo+PiBCZXNpZGVzLCBJIHdhcyBub3Qg
c3VyZSBpZiB5b3Ugd2VyZSBwbGFubmluZyB0byBhZGQgc2ltaWxhciBoZWxwZXIgb3INCj4+IGp1
c3Qgd3JhcHBlcnMgdG8gaW5kaXZpZHVhbCBmdW5jdGlvbnMuIFdhbnRlZCB0byBwaW5nIHlvdSBq
dXN0IGluIGNhc2UNCj4+IHRoaXMgaGFzIHNvbWUgaW1wYWN0IHRvIHdoYXQgeW91IGRvLg0KPiAN
Cj4gSSBkb24ndCBoYXZlIGEgbmVlZCB0byBiaW5kIGEgZGV2aWNlIHRvIGEgZHJpdmVyIHRvIHNh
dGlzZnkgZGV2bSBBUElzDQo+IGN1cnJlbnRseS4gSSBjb3VsZCBwcm9iYWJseSB1c2UgaXQgdGhv
dWdoIHRvIHRlc3Qgc29tZSBkZXZtIGNvZGUgaW4gdGhlDQo+IGNsayBBUElzLiBUaGUgb25seSBp
bXBhY3QgaXMgdGhhdCB3ZSdyZSBtb2RpZnlpbmcgdGhlIHNhbWUgZmlsZXMuDQoNClRoYW5rcyBm
b3IgY2xhcmlmeWluZyB0aGlzLg0KDQo+Pj4gSGF2ZSB5b3UgQ2NlZCBrdW5pdCBmb2xrcyBhbmQg
dGhlDQo+Pj4gbGlzdCBvbiB0aGUga3VuaXQgcGF0Y2hlcz8gVGhleSBtYXkgaGF2ZSBzb21lIG9w
aW5pb24uDQo+Pg0KPj4gVGhpcyBwYXRjaCB3YXMgc2hvdWxkIGhhdmUgY29udGFpbmVkIHRoZQ0K
Pj4gaW5jbHVkZS9rdW5pdC9wbGF0Zm9ybV9kZXZpY2UuaC4gVGhhdCBmaWxlIHdhcyBwdWxsaW5n
IHRoZSBLdW5pdCBwZW9wbGUNCj4+IGluIHJlY2lwaWVudHMgYnV0IEkgbWVzc2VkIHVwIHRoaW5n
cyB3aXRoIGxhc3QgbWludXRlIGNoYW5nZXMgc28gYm90aA0KPj4gdGhlIGhlYWRlciBhbmQgcGVv
cGxlIHdlcmUgZHJvcHBlZC4gSSdsbCBmaXggdGhpcyBmb3IgdjUuDQo+Pg0KPiANCj4gT2ssIEkn
bGwgYmUgb24gdGhlIGxvb2tvdXQgZm9yIHY1LiBGcm9tIHdoYXQgSSBjYW4gdGVsbCBrdW5pdCBn
b2VzDQo+IHRocm91Z2ggdGhlIGtlcm5lbCBzZWxmdGVzdCB0cmVlIGFuZCB0aGVyZSBpc24ndCBh
IGt1bml0IGdpdCB0cmVlIGFzDQo+IHN1Y2guDQoNClJpZ2h0LiBJIGFtIG5vdCBzdXJlIHdoYXQg
d2lsbCBiZSB0aGUgYmVzdCB0cmVlIHRvIGNhcnJ5IHRoZSB0ZXN0YWJpbGl0eSANCmNoYW5nZXMu
IEl0IHNlZW1zIHRoYXQgYWxsIG9mIHRoZSBJSU8tdGVzdHMgaW4gdjUgd2lsbCBkZXBlbmQgb24g
dGhlIA0Ka3VuaXQgc3R1ZmYsIGFuZCBJIHRoaW5rIEkgd2lsbCBhbHNvIGluY2x1ZGUgdGhlIERS
TSB0ZXN0IGZpeGVzIGluIHRoaXMgDQpzZXJpZXMgYXMgd2VsbCBqdXN0IHRvIGtlZXAgdGhpbmdz
IHNvcnRlZCBpbiBteSBtYWlsYm94LiBBbnl3YXlzLCBJIGhvcGUgDQp0byBmaW5pc2ggdGhlIGNo
YW5nZXMgZm9yIHY1IHNvb24oaXNoKSAtIG1heWJlIGFscmVhZHkgVG9kYXkgYW5kIGluIGFueSAN
CmNhc2UgZHVyaW5nIHRoaXMgd2Vlay4gSSdsbCBiZSBDQzppbmcgeW91IGFuZCBCcmVuZGFuIHdp
dGggKHJlbGV2YW50IA0KcGF0Y2hlcyBvZikgdjUgYXMgd2VsbC4NCg0KWW91cnMsDQoJLS0gTWF0
dGkNCg0KLS0gDQpNYXR0aSBWYWl0dGluZW4NCkxpbnV4IGtlcm5lbCBkZXZlbG9wZXIgYXQgUk9I
TSBTZW1pY29uZHVjdG9ycw0KT3VsdSBGaW5sYW5kDQoNCn5+IFdoZW4gdGhpbmdzIGdvIHV0dGVy
bHkgd3JvbmcgdmltIHVzZXJzIGNhbiBhbHdheXMgdHlwZSA6aGVscCEgfn4NCg0K
