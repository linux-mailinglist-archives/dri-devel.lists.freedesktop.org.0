Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE03C8747BC
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 06:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 447DA10EFDC;
	Thu,  7 Mar 2024 05:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="x08IFgEJ";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="fGoWFzeO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC0DC10EFDC
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Mar 2024 05:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709790644; x=1741326644;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=lp0vWiLMErDQHDDsVpVKo6TvBomUI+mE99qT0VIwBdE=;
 b=x08IFgEJhuFl5gvzYKRbQYEXzy11LlLYTlLP6YAvcGBez2H/uJp5Hy7Z
 G+GmHIs+3kJgEc3v6vlyMYzNFHVoekIB1BA+We8f2KDf9YxAlWeVYuz2V
 QJOsIF18C9XK3dg8g1DfvgGX/tGnmfuJbvzbbiSryOoJgfqxBi/KA68Qa
 Qd2o5l28y7eqODnHFZo4via8eUcA7QkEKioqa7OJbvgRa3OYzU3mx6eXf
 tEwhlFB1yQfAykfGn0uYoaVRKgLoY9Yaz3wiYDsjIUnqg2AdWGaA4J2aw
 EXYExvSlHoZ0y7+h9HZ77kRHEI48CkMOdXg8YKYm6aBaX1OjA8JNvjpBV A==;
X-CSE-ConnectionGUID: ncbopNxESjKpbCEuSSMcww==
X-CSE-MsgGUID: ag8PegzoQ1OMcCDKXS6xZQ==
X-IronPort-AV: E=Sophos;i="6.06,210,1705388400"; d="scan'208";a="17316863"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 06 Mar 2024 22:50:43 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 6 Mar 2024 22:50:27 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 6 Mar 2024 22:50:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UQlqJNxXkq8V5euN6ui51HS2HxN19h8f/7cBmvEsOcWwBcD0xjMhizm1G3LlkJJjvk5YydUjlPtnzoRjyqb9Bk7Frv8838GjX6WQ/kUYdXiuGwMgONyIiOWJOR4U9HxGGPYMJscfBO6G2AACZ/FRYPRD6yAjkurwx80HpyiiwvafyL8g/7P0uLiHztEpY9RRx0rmT5744IG9UJ4bb80iq6V1NKyyUYVl+DUJxSVRwa/TYD7ZhU7J7htjDVyBWq4kEMjywnOWJiobt2WLS2ox905cfLca7FXqPPJZULOZWOuyzBU5+3YIVv0X/z9TGQpgO+o0M+CHj14aE/USPxO7GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lp0vWiLMErDQHDDsVpVKo6TvBomUI+mE99qT0VIwBdE=;
 b=gc0gl1p88QGFaP+qAagnQtm95ubzs2IITF001ZP0V3YLr7t1Cs2fpM0REtQsZji/MOrjsa9OssqdugCXmLdIzAzX7bmdlnSe79DrofoablLkkF3qCqAzxpUbCuV3LtcyxvMfFz0OsKQp87YQ9Z4qh8SIB5mNJpfr8W8TaWc2qqTEB3jogK0W+xNLiGE3rdgDI5rAn1weu+KX3V2sL9augAgNxLFZ1pcoc35sIvi4AqEBcmkWmh23DytRuw0inEvVc2S3WigovAwN22Q8B79D/KTX4sGI6Xp7PmCKdpGDmZDBYUgvLefY5gV9cqDkeXEA/zHuB+gC08oHhLDcOZw8eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lp0vWiLMErDQHDDsVpVKo6TvBomUI+mE99qT0VIwBdE=;
 b=fGoWFzeOYC5kDsakeBtpjllhr2MvQJHgh8zPAw1dcqcGtdicR6siSbC9mXPDYZksVeFX/m2kuIDbgBZhG9C0ymADRdWYUe4glyiTJKQ67Zz0Am3RTEiWPV7QSV93maq/STpgTOQ2f1PqgGEQxw1sbXxWBHs84aimI/LMY47UOaTp31s/dyxSl3QQRUJIPi6uvs3Khv+A2Kw7jTrwAeofjsyQP7kULexH2nvwh4itzfAE0v3eMuEF0GNJjVy2m/SQijkSNan6GZ+cTlQqxwc7zV//34aXB8vf0vnIfS1Pxgf6eHmuraeB+UMBw9N6mZsRX+lSopvC5ydqxtwMzygapw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by IA1PR11MB7755.namprd11.prod.outlook.com (2603:10b6:208:420::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.24; Thu, 7 Mar
 2024 05:50:25 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd%3]) with mapi id 15.20.7362.019; Thu, 7 Mar 2024
 05:50:25 +0000
From: <Dharma.B@microchip.com>
To: <Nicolas.Ferre@microchip.com>, <robh@kernel.org>
CC: <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3] dt-bindings: display: atmel,lcdc: convert to dtschema
Thread-Topic: [PATCH v3] dt-bindings: display: atmel, lcdc: convert to dtschema
Thread-Index: AQHabkCPzXhfZiNH0USPLHqXgkqUkrEoIqEAgAKn3gCAACSggIAA2xCA
Date: Thu, 7 Mar 2024 05:50:25 +0000
Message-ID: <9e9122b1-8a04-4c4c-8377-4af0e3a5c39c@microchip.com>
References: <20240304-lcdc-fb-v3-1-8b616fbb0199@microchip.com>
 <20240304220154.GA1115739-robh@kernel.org>
 <d3ae3196-4e8a-4e73-bc36-f53541598ab2@microchip.com>
 <e6537742-d9be-4745-b457-b36e60ccaa9b@microchip.com>
In-Reply-To: <e6537742-d9be-4745-b457-b36e60ccaa9b@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|IA1PR11MB7755:EE_
x-ms-office365-filtering-correlation-id: 08e9a59c-5504-458a-e336-08dc3e6a7c8f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ikZ1MU2pk765lHGm6IxqdZ0NcN5SsZ+WC6a9LDIhAeFuMG4DlnoFDD5dLabyXGALDCxfPzxT3UbJ8f9nmZTT1o5gpnvSmepJvKOxUdrrVMFb0TTzXhNdKI2XF+0xpyeb5kQ6ARTvAzVb+TrARyhUCR8bj8dDjLGekq0BcTO+WdR6ZP+82K5mjZit/J5NBQ7OUM0cbwE/lFBJS7uLNTi1o3dcCDDA8s+QklApi+8GcgzzzQ2OW3UwjtGWEyZu6teIKfPDBCYybqfoJ+12/5V026BwExcRfbK8RbjNuWDmz4W1BL330H4dlDMztxSg+Re3ttreaZ8fgu9XEECAXGOCyakxV5hxrrj/wDj1nLxkxZZO8kprBI1P29LmUS1ZQea+txEp5pq98SMZPlmO5WfCF0otAGSLSw3/jGgO76MbBPFfwUjm84B2ci6kxb2LGSjzrb6zincC3HWpfMOh0W0js7Ec/LZoTPSKZuTKulToiBsvZVYqAzKfAAsUOTbNkxj72IKHHRaomAbYrFTUMSkKUC823s8r2ScQDcutVvCQurSnshzwK3/4hteXcX8kjG52LbjxTFAMgom1YDT5m1exLadZpFbrExqQ+tVblDZErcYVLIOv8b78kO49cMaKrrqhOeXZa4ULO/0CzgOle1D5HDyekBIrUMqqdHHxGMXkdO+2coKc1Seo+vtSJDk8ZwCE
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?ZXcyUUc0amxMY1hKbi9YaDBCeWkxZC9PSVZJaDJGTUhnVHZqQ1lDOWdwbXRR?=
 =?utf-8?B?MThZZzJNYjZ5S2JiQjgyQ2VGdzRGbWR1WE13S1oxTzFIZThsQnFZeHFRZjN6?=
 =?utf-8?B?WkdMK2E3QXZoYUFsbDdUeGE4QWkxV3o5U0g3LytuU3J5Z0NUWkJXQUZNMGpW?=
 =?utf-8?B?T1BWK1dWeDNLcHl6YVNUODFsSmdObVhQZmVSS1JoMGtDQUhodTExczVEUVN6?=
 =?utf-8?B?cnlrQ1RrMnhDSEhMdCt3dWxPUVBsZFVGaVBKYTVRckwwVXRLMmNBNngrKy9T?=
 =?utf-8?B?dTZvTUxuWFZOZGRIT2JDdGFIMzRudnBicEhtTStXZUpaak5xRjU4UG1MU2Fz?=
 =?utf-8?B?VkFIOXJOemlOS0RobFBrcDVFTldGTStuNTJMVkJtSjB4c05FTDh6QlhmK25x?=
 =?utf-8?B?Ulc1UzFrc0pWRVNjK3F3R0xvVzlUcFYwa0YvcnY2NlVzdnpqVmNSSG9ibUNL?=
 =?utf-8?B?dHBBM1BsNTduL20vcXRZQnIzbXFJanJxSG4rVUZDRDEwNWRQM2F6UzRwc0wz?=
 =?utf-8?B?S0JqWDZhNm5YdFZXaSsybWRpOE96MmpyRGsrNFNHYWp3eDdXTUZKZmVLNVpG?=
 =?utf-8?B?MEJ5bERSemwzRjd0SFNBNDZta05mVVErUWlEdldId3pBbFNuTm5mUFFKUVQ4?=
 =?utf-8?B?UkV0bjV6Z0tNbUlBNzU0SzVEWG1EZEtWcjdWN3BNaXR2N0tWZW1BS2RtRmxK?=
 =?utf-8?B?eCtqaDB2UU00ckdJVXcyOElZTzkyR1N4TlBTZXpsaUo2b2xXSGFERkNuaWNi?=
 =?utf-8?B?d3VUeUNDTEYrb1dXcC9IK1hNVjlFNkVLc2FnYVB1WTl4Y3djdEMwZ1FKY0Va?=
 =?utf-8?B?SURkMUFZT3BxaU85Y3ZUdHVVKzhiTWFzNitOQnpPb1B5Q2dzNUNwUWszRlNR?=
 =?utf-8?B?bUliZ0RUNTB0Ym1iakpGWkFBSVZSL1NoTFpwUGI3NVRQcmtscXBQZnkwL2xk?=
 =?utf-8?B?eFNwRVFZcjRyRXo3SXdYdmQzdVlUQU1NOHFGQUJ2c2d1R01rd3ZUVHFweG40?=
 =?utf-8?B?VENtTFphdEZiWVJUelpheWVTeHpsWnFzNDB4QlpIV0wzUmRUMTlPZGlaTHpL?=
 =?utf-8?B?Ulk1ZkQyWVE2K0RBbTVYK1RlY2ZvRndQZWg2WTd5K1ZWaW1HUXJrcy9UeGta?=
 =?utf-8?B?YlpxV29KMkhxT3hxazY4MG1OeGR5M2did1ZGZ05sdVAzaDJzYmJHd3E4S2Yz?=
 =?utf-8?B?dm1ZdDhCWEJzOXBROEtVMlkvbURiU3MxY2h5cFpka0VmOFBBd2ZGb3U0TTg3?=
 =?utf-8?B?eTlJRDVKQzJSYTZKVXU4eGZrdFNxWDRURkFmSEloa0UvVExFTDdsdlFLQzFp?=
 =?utf-8?B?NVZSQ0E3b1RsU2VIU1JjSzlrSGRrTXZnKytsYkJIMi9mdU5vWUs2Qkl6RG5B?=
 =?utf-8?B?SXlobGpzWDhaUWNVcEg1aytZSFlHdUNsNk9JOExSbzQ1MHljQk53MnpSK3RV?=
 =?utf-8?B?TUJodnNhZHZsbjZHRTBKTFpRQURVOW5lL0RkMjhidDNCVVRDY2dCYW5qRmtR?=
 =?utf-8?B?MHpIdDF6ZDVZVjBVSWxjTzlncUFZazBiVmhGQVR6L2tEVW5JU1pyQS9EemEw?=
 =?utf-8?B?WFM4YTJhWWgrbDdSYmVXWFAxUDVDT1BJSm01K0JBa0JjaWovbit4OVA0eXRp?=
 =?utf-8?B?TytWR1BNMTNhbmRDNVc4UUVTK2dVTWQ3Tmk3MVhhWTZmN29kTXhQUGZrc3pH?=
 =?utf-8?B?eC9hOWZ4MFNaQWZCM0ZYU294ZzgwOWJmZ2VlekRyK25Qbmc0TS9ZNGZKWHVL?=
 =?utf-8?B?ZWxPNWNVWkZFV084OTYyOUxHRU1qcks4ay9vS3dFMUs0OHR6ejhYa3UxUURV?=
 =?utf-8?B?SXM1b2MvQTBRVjZGd0FjUEp3WWNLUTNRVkpIdXVmb0liZ0tVQ0ZhR0xub0lV?=
 =?utf-8?B?ZGNKQndQZi9UVU42VnJ6MTVNcjVUOGpCM21WYXFVY0EzMG9STjd5RDF0NlVH?=
 =?utf-8?B?YzNBQjJ2cmR4aGJNdythYjFDa21GRnIyWG9JQzFwWnVhUTA1M3FRMEpIN3Iy?=
 =?utf-8?B?cjZURFZ0cVpWemVHT1pkZjVlTVh4N081SktyVE1lMG45ZFprOUlyb0xxV2pG?=
 =?utf-8?B?eTY1K2lpUjl5SXNFQTFlN1h4LzNRQ3dhSjZUbnBybUJ3Z2tYdGtwdkZJZkVn?=
 =?utf-8?Q?S3/ywsdczUtjVM864yLzvQHk5?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B72FED82651F2646A1F99BC7DD2C53BB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08e9a59c-5504-458a-e336-08dc3e6a7c8f
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Mar 2024 05:50:25.6742 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MFehSdp5pT69+RqEEDccbcC2iEJW/vJlzrszVZBj63lfPZDTiBthcxuHjrvAisAQhzwFHQfivFv7OEThq7Wejg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7755
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

DQpPbiAwNi8wMy8yNCAxMDoxNiBwbSwgTmljb2xhcyBGZXJyZSAtIE00MzIzOCB3cm90ZToNCj4g
RGhhcm1hLCBhbGwsDQo+IA0KPiBPbiAwNi8wMy8yMDI0IGF0IDE1OjM1LCBEaGFybWEgQiAtIEk3
MDg0MyB3cm90ZToNCj4+DQo+PiBPbiAwNS8wMy8yNCAzOjMxIGFtLCBSb2IgSGVycmluZyB3cm90
ZToNCj4+PiBPbiBNb24sIE1hciAwNCwgMjAyNCBhdCAwODowMDowM1BNICswNTMwLCBEaGFybWEg
QmFsYXN1YmlyYW1hbmkgd3JvdGU6DQo+Pj4+IENvbnZlcnQgdGhlIGF0bWVsLGxjZGMgYmluZGlu
Z3MgdG8gRFQgc2NoZW1hLg0KPj4+PiBDaGFuZ2VzIGR1cmluZyBjb252ZXJzaW9uOiBhZGQgbWlz
c2luZyBjbG9ja3MgYW5kIGNsb2NrLW5hbWVzIA0KPj4+PiBwcm9wZXJ0aWVzLg0KPj4+Pg0KPj4+
PiBTaWduZWQtb2ZmLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmkgPGRoYXJtYS5iQG1pY3JvY2hp
cC5jb20+DQo+Pj4+IC0tLQ0KPj4+PiBUaGlzIHBhdGNoIGNvbnZlcnRzIHRoZSBleGlzdGluZyBs
Y2RjIGRpc3BsYXkgdGV4dCBiaW5kaW5nIHRvIEpTT04gDQo+Pj4+IHNjaGVtYS4NCj4+Pj4gVGhl
IGJpbmRpbmcgaXMgc3BsaXQgaW50byB0d28gbmFtZWx5DQo+Pj4+IGxjZGMueWFtbA0KPj4+PiAt
IEhvbGRzIHRoZSBmcmFtZSBidWZmZXIgcHJvcGVydGllcw0KPj4+PiBsY2RjLWRpc3BsYXkueWFt
bA0KPj4+PiAtIEhvbGRzIHRoZSBkaXNwbGF5IHBhbmVsIHByb3BlcnRpZXMgd2hpY2ggaXMgYSBw
aGFuZGxlIHRvIHRoZSBkaXNwbGF5DQo+Pj4+IHByb3BlcnR5IGluIGxjZGMgZmIgbm9kZS4NCj4+
Pj4NCj4+Pj4gVGhlc2UgYmluZGluZ3MgYXJlIHRlc3RlZCB1c2luZyB0aGUgZm9sbG93aW5nIGNv
bW1hbmQuDQo+Pj4+ICdtYWtlIERUX0NIRUNLRVJfRkxBR1M9LW0gZHRfYmluZGluZ19jaGVjaycN
Cj4+Pj4gLS0tDQo+Pj4+IENoYW5nZXMgaW4gdjM6DQo+Pj4+IC0gUmVtb3ZlIHRoZSBnZW5lcmlj
IHByb3BlcnR5ICJiaXRzLXBlci1waXhlbCINCj4+Pj4gLSBMaW5rIHRvIHYyOiANCj4+Pj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDMwNC1sY2RjLWZiLXYyLTEtYTE0YjQ2M2MxNTdh
QG1pY3JvY2hpcC5jb20NCj4+Pj4NCj4+Pj4gQ2hhbmdlcyBpbiB2MjoNCj4+Pj4gLSBSdW4gY2hl
Y2twYXRjaCBhbmQgcmVtb3ZlIHdoaXRlc3BhY2UgZXJyb3JzLg0KPj4+PiAtIEFkZCB0aGUgc3Rh
bmRhcmQgaW50ZXJydXB0IGZsYWdzLg0KPj4+PiAtIFNwbGl0IHRoZSBiaW5kaW5nIGludG8gdHdv
LCBuYW1lbHkgbGNkYy55YW1sIGFuZCBsY2RjLWRpc3BsYXkueWFtbC4NCj4+Pj4gLSBMaW5rIHRv
IHYxOiANCj4+Pj4gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvci8yMDI0MDIyMy1sY2RjLWZiLXYx
LTEtNGM2NGNiNjI3N2RmQG1pY3JvY2hpcC5jb20NCj4+Pj4gLS0tDQo+Pj4+IMKgwqAgLi4uL2Jp
bmRpbmdzL2Rpc3BsYXkvYXRtZWwsbGNkYy1kaXNwbGF5LnlhbWzCoMKgwqDCoMKgwqAgfCA5NyAN
Cj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKw0KPj4+PiDCoMKgIC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Rpc3BsYXkvYXRtZWwsbGNkYy50eHTCoMKgwqDCoCB8IDg3IA0KPj4+PiAtLS0tLS0t
LS0tLS0tLS0tLS0tDQo+Pj4+IMKgwqAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9h
dG1lbCxsY2RjLnlhbWzCoMKgwqAgfCA3MCANCj4+Pj4gKysrKysrKysrKysrKysrKw0KPj4+PiDC
oMKgIDMgZmlsZXMgY2hhbmdlZCwgMTY3IGluc2VydGlvbnMoKyksIDg3IGRlbGV0aW9ucygtKQ0K
Pj4+Pg0KPj4+PiBkaWZmIC0tZ2l0IA0KPj4+PiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9kaXNwbGF5L2F0bWVsLGxjZGMtZGlzcGxheS55YW1sIA0KPj4+PiBiL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L2F0bWVsLGxjZGMtZGlzcGxheS55YW1s
DQo+Pj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+Pj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uNWUw
YjcwNmQ2OTVkDQo+IA0KPiBbLi5dDQo+IA0KPj4+PiArwqAgYXRtZWwsbGNkLXdpcmluZy1tb2Rl
Og0KPj4+PiArwqDCoMKgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL25v
bi11bmlxdWUtc3RyaW5nLWFycmF5DQo+Pj4NCj4+PiBJc24ndCB0aGlzIGp1c3QgYSBzaW5nbGUg
c3RyaW5nIHJhdGhlciB0aGFuIGFuIGFycmF5Pw0KPj4+DQo+Pj4+ICvCoMKgwqAgZGVzY3JpcHRp
b246IGxjZCB3aXJpbmcgbW9kZSAiUkdCIiBvciAiQlJHIg0KPj4+DQo+Pj4gZW51bToNCj4+PiDC
oMKgwqAgLSBSR0INCj4+PiDCoMKgwqAgLSBCUkcNCj4+Pg0KPj4+IE5vIEJHUj8NCj4+DQo+PiBJ
biB0aGUgY3VycmVudCBkcml2ZXIgaW1wbGVtZW50YXRpb24sIHdlIGhhdmUgaW50ZXJwcmV0ZWQg
dGhlIHdpcmluZw0KPj4gbW9kZSByZXByZXNlbnRlZCBieSBBVE1FTF9MQ0RDX1dJUklOR19CR1Ig
YXMgJ0JSRycgaW4gdGhlIGFycmF5DQo+PiBhdG1lbF9sY2RmYl93aXJpbmdfbW9kZXMuIENvbnNp
ZGVyaW5nIGNvbnZlbnRpb25hbCBjb2xvciByZXByZXNlbnRhdGlvbiwNCj4+IHdvdWxkIGl0IGJl
IGFwcHJvcHJpYXRlIHRvIGNvbnNpZGVyIG1vZGlmeWluZyB0aGUgZXhpc3RpbmcgZHJpdmVyIHRv
IHVzZQ0KPj4gdGhlICdCR1InIHN0cmluZyBpbnN0ZWFkIG9mICdCUkcnIGZvciBiZXR0ZXIgYWxp
Z25tZW50IHdpdGggc3RhbmRhcmQNCj4+IG5hbWluZyBjb252ZW50aW9ucz8NCj4gDQo+IFRoaXMg
IkJSRyIgdGhpbmcgaXMgZGVmaW5pdGl2ZWx5IGEgdHlwby4gV2UgbmV2ZXIgaGFkIHN1Y2ggdGhp
bmcgYXMgYSANCj4gQlJHIGNvbG9yIHdpcmluZyBidXQgZGlkIGhhdmUgQkdSIHdpcmluZyBtb2Rl
Lg0KPiANCj4+IHN0YXRpYyBjb25zdCBjaGFyICphdG1lbF9sY2RmYl93aXJpbmdfbW9kZXNbXSA9
IHsNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBbQVRNRUxfTENEQ19XSVJJTkdfQkdSXSA9ICJCUkci
LA0KPj4gwqDCoMKgwqDCoMKgwqDCoMKgIFtBVE1FTF9MQ0RDX1dJUklOR19SR0JdID0gIlJHQiIs
DQo+IA0KPiBUaGUgdGhpbmcgaXMgdGhhdCB3ZSBoYXZlIG9uZSBEVCB1c2luZyB0aGF0Og0KPiBh
cmNoL2FybS9ib290L2R0cy9hdDkxc2FtOTI2MWVrLmR0cw0KPiANCj4gU28sIGVpdGhlciBJIHdv
dWxkIGxlYXZlIGl0IGxpa2UgdGhhdDogaXQncyBvbmx5IG9sZCBwcm9kdWN0IHVzaW5nIGl0Lg0K
DQpUaGFuayB5b3UgZm9yIHlvdXIgaW5wdXQsIE5pY29sYXMuIElmIFJvYiBpcyBpbiBhZ3JlZW1l
bnQgd2l0aCB0aGlzDQpwcm9wb3NhbCBhcyB3ZWxsLCBJIHBsYW4gdG8gcHJvY2VlZCBhbmQgc3Vi
bWl0IHY0LCBpbmNvcnBvcmF0aW5nDQphZGp1c3RtZW50cyBiYXNlZCBvbiBvdGhlciByZXZpZXcg
Y29tbWVudHMuDQoNCj4gT3IganVzdCBmb2N1cyBvbiBmaXJzdCBjaGFyYWN0ZXIgaW4gdGhlIHN0
cmluZyBzbyB0aGF0IGl0IHdvcmtzIGZvciBib3RoIA0KPiAiQlJHIiBvciAiQkdSIiwgYW5kIG1h
aW50YWlucyB0aGUgYmFja3dhcmQgY29tcGF0aWJpbGl0eS4NCj4gDQo+IFJlZ2FyZHMsDQo+ICDC
oCBOaWNvbGFzDQo+IA0KPiANCj4+IH07DQo+Pg0KPj4NCj4+Pg0KPj4+IEJ1dCB3YWl0LCB0aGUg
ZXhhbXBsZSBzaG93cyB0aGUgdmFsdWUgaXMgJzEnLiBUaGF0IHNob3VsZCBmYWlsIHRlc3Rpbmcu
DQo+Pj4gSXQgZGlkbid0LCBidXQgSSd2ZSBub3cgZml4ZWQgdGhhdC4NCj4+DQo+PiBJdCBzZWVt
cyBjb3JyZWN0bHkgY29uZmlndXJlZCBpbiBvdXIgZHRzIGZpbGVzIGJ1dCBkaWRuJ3Qgbm90aWNl
ZCB0aGUNCj4+IHNhbWUgaW4gdGhlIGJpbmRpbmdzIGV4YW1wbGUsIHRoYW5rcyBmb3IgbGV0dGlu
ZyBtZSBrbm93LCBJIHdpbGwgY29ycmVjdA0KPj4gaXQgaW4gdGhlIG5leHQgcmV2aXNpb24uDQo+
IA0KDQotLSANCldpdGggQmVzdCBSZWdhcmRzLA0KRGhhcm1hIEIuDQoNCg==
