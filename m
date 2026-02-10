Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mADwJqzJiml+NwAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 07:01:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B7361173C3
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 07:01:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D5F810E1A6;
	Tue, 10 Feb 2026 06:01:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="hRt9iE8O";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010008.outbound.protection.outlook.com
 [52.101.193.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 064B910E1A6
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 06:01:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c2wof53reHiOQvsb0kky11NwcnR1AScH+yY8S1SBeCIgJh99f7cQptZZ1lOmOZm4j+9vX27MgFlMofIU4bMW/OI5hERb6B9Ct1auAXRkYeJj9Sur8yZbRhOglaAFhEoHrNeImhxwRei3fTU6X+uZjQF6pK8wRf7mzn78X+7ICQQN66jSkfTAo7kjR5v/i5D79J0QKWv4flo1F7YHkx9j9jm5+KvilhyGlw26lBkcsA0WlLxLiXzsBQUnA+jyrn3xQFZXZ86zgsSHGFSaY+bR4eQmops+PR/V4Dxt9gujCksaUddhjr7cw64Bsk7spzr9HI2e7LoQlwP4ugUxg9boKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JfAn5HzJhQ0MwO0yhR0rQXK/PDQNNK5YtgOCFyhhiFo=;
 b=dl4Mpf+wwAzeJxI/LETJYtKdYxiHrTfBp3EuaRqiEHjGJaT2FV+Whd1nnlY1VpVytfX9ejf7GIe3hyohAnembU59vh0ERObSDbwBOhbXOdMbpPyejOYT96A/slhJ+MzsUP6qHeKBVdL77pZdXzrDLw+KfKiCpeFBaLx4gwfH7nyheeznXsaOqYX1Tv1gWBO8y/Rg0jEZgsYx6++13aavbWQ5+EmncxXogBuEsDY33mGDn3AyWol9+HF7DMfBEqBYMlxK/V3AakUXluz+EuxxNEQ9sPsX2e/dq6i9meMvTMu7yoZ1p4zDQAw6GguWRwo0rIeVoU+r2DwAsgHGXSKxZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JfAn5HzJhQ0MwO0yhR0rQXK/PDQNNK5YtgOCFyhhiFo=;
 b=hRt9iE8Oeiq7oloE9989yXi9cWsKHq6Ld/vPEZ4qgq7H4aieFzIPaAhzg7/yXok0ZYSL2k1Wuo3oc7/NzJ8FIHOvj6LxwrKTw8WxagAAfY4yQ6nsMRP3GT1T2eMGKbEzdehsa0+QneFkr/1tT+ZdR6SfRgVkJbTSp2oW+Gzm32svh2alcwnlgTFNeNZnallqWYF+v6qYw1E34lN8f8Gdc47nq/xPFymJSvbFl4kp9TsRGnnCJVHg2FFOcYp2zCP7B5MydU/D1/O36nQjLKKUInfanhAyVftd/YJkqBc1FY1nxaalX4VeDhNCPDqdH9TAO1BZUu4MlX1g10dLutpyKQ==
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 (2603:10b6:f:fc00::f3a) by DS7PR11MB6270.namprd11.prod.outlook.com
 (2603:10b6:8:96::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.18; Tue, 10 Feb
 2026 06:01:05 +0000
Received: from DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::1a72:d8c6:a4e8:5199]) by DM3PPF9623118BD.namprd11.prod.outlook.com
 ([fe80::1a72:d8c6:a4e8:5199%3]) with mapi id 15.20.9587.013; Tue, 10 Feb 2026
 06:01:05 +0000
From: <Manikandan.M@microchip.com>
To: <Cyrille.Pitchen@microchip.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <linux@armlinux.org.uk>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
Thread-Topic: [PATCH v7 3/5] ARM: dts: microchip: sam9x60: Add GFX2D GPU
Thread-Index: AQHcmaqNYATxGc6kS0282m9GLsQi4LV7ceEA
Date: Tue, 10 Feb 2026 06:01:05 +0000
Message-ID: <cbd8ee5a-3165-40a0-9ce9-999b61af0f2e@microchip.com>
References: <20260209-cpitchen-mainline_gfx2d-v7-0-0c12e64a0950@microchip.com>
 <20260209-cpitchen-mainline_gfx2d-v7-3-0c12e64a0950@microchip.com>
In-Reply-To: <20260209-cpitchen-mainline_gfx2d-v7-3-0c12e64a0950@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM3PPF9623118BD:EE_|DS7PR11MB6270:EE_
x-ms-office365-filtering-correlation-id: 49cfc4c5-c0dc-4b06-9b2f-08de6869c743
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|38070700021|921020; 
x-microsoft-antispam-message-info: =?utf-8?B?cjJ5Si9tUXh0Q2J2OElseUJQaklDYmlqOTFWUnNBblJIVWdWR1pLeFAxb2h3?=
 =?utf-8?B?RGRENzFIT0RJUWNKRHI3U2YwU05hbHBML2F3R0lnWTV0TE9zNWtUd3FGL0p2?=
 =?utf-8?B?cnUyaW5PbC9LNitGczZJZHJPRnkrMFIvR3FxQk9qTGl6NGswbnFOYm80R0dk?=
 =?utf-8?B?UU56MXpzOHc2M1NLMC9rR2YwVWU0b0pkTURNaTROMWo0UEUyUnZ5K1R1T204?=
 =?utf-8?B?NlRwWHB4aHpsM2xlVSswZy9yUUNJcmtETzNweW5LWGExZTJCTjVrZ3hsYXlS?=
 =?utf-8?B?YU1hTHNpS0FMWFlFVGlCWXZpeHhyR1MvOEFFUVlXbzRCOVpWekRKUW5KRldT?=
 =?utf-8?B?dnRsbUd4U0ZiNFpWeVdvUUp4VDMxNVUrSUYxTDRNUFZxOWtHYTdIa1pCU0xi?=
 =?utf-8?B?VVpRTzdUVTJISXF5S0RuS3lIaTRsV0JWSnRsaGRpUW9lZFZvR05DNVgvQS9U?=
 =?utf-8?B?enZWZW1saEYzRzEvckhyNElEbkRjREtGSXJOVWw2Rmh0bHpDcDNEUkw2aU1S?=
 =?utf-8?B?cGVoTXhpMGtBb0xoNzFpUEVzWldiejE3bkwvQWhabHpXY1I4VlNoOGppdGVy?=
 =?utf-8?B?ZitXdjJMY0pkVk5saWtuakpIYVhVNTlWaS8xRWZyeDQwcXUrQUU3bGpHRDB3?=
 =?utf-8?B?Q2RMN1Z2NHJZajhtTDVPNG16Q01aa0NCVHB1TjFOSit1VUxKNHI5UGFBdkpk?=
 =?utf-8?B?VFNBb1BlRTEvMTd3K0hTTlZqNFZieGEwQUpubXorSDZsUXpTbDdjV1l0QVZH?=
 =?utf-8?B?QzBJR1pyTFFBUnhiM3pPZjFZc0RyUFZnbk1pRU5oNVB3Z05maEFzZXNPRjRM?=
 =?utf-8?B?Rk9KdGdRWUtIYlJheVU5S3B2ajVlbVJvY0dBVTJJOTBraDNmdUtWTWNWY3JC?=
 =?utf-8?B?YURPZjZ4YXZHdXlDTGMrN0JWdkUwd3ZoaHUwcVlPTGtiRVpic1lTZTh2T25v?=
 =?utf-8?B?Y0JEbTNiQnY3eUZ4VFpYVDkwd3FWQ2tjNG5BUUZwTHdyWERhN3pUZTdpeUJa?=
 =?utf-8?B?NVhnTzF3VFJMU0dieUFMelhUdW11QmpMeWM2QkkzNSt0dDFvYkFhNGN1RHhW?=
 =?utf-8?B?QStPY0d0b1FmRFh5QkovUlVIVTNBc1dmQ0h6djRNV3pmTVlFbTFZQUh5Qjhq?=
 =?utf-8?B?YTBrT0FSVWUvZHNBL3dBOW1VN2hESkE3ZWtQK2RWd0VTd3psMldPYzdhdUt5?=
 =?utf-8?B?bkZGT0tza205TVRSSHBIVEhvRmR3WE9Wd1V1bkFmd2ZDbTlWbzJiUDdZMDYw?=
 =?utf-8?B?cm1VeFo2amVFdkgvUTRjS2c2NFJmcmRkZXJkWEcrdWtXb1ZtZGJJcVlVZ29I?=
 =?utf-8?B?NUtuelBnWU10YmtmY0pjWUVLem9jSlJTSGFlQlJZblQzUjQzUnRxc3VRV0pr?=
 =?utf-8?B?WmMxWjgwMm4vL1NmK240VlBlQUZ1dzRKejlqL2RQcy9HYlJaTUFySmQwZWxI?=
 =?utf-8?B?SHIyN1VkdXFMZEorc0JjWUJ3TTVmSjF6emNnVHg3VkdFYUVsM001TGVhUTRG?=
 =?utf-8?B?d0d4K1BNdTY2bmc5Q1kweGk5SHBML0VxZVBvS1YvTUlpWFpyRDc1WXIxMkFD?=
 =?utf-8?B?dWNSM3hVM0tESVpUZ3NnVmVycnU1NVI3VFNrVVRaUUlmTmpMc2I0MS8zTndp?=
 =?utf-8?B?UFhrZTE2bUQydXVDTXN6YWw4VjhzR1RxSDdlZ0hPVVpGWDdwS3JRemVVa1Y2?=
 =?utf-8?B?WUZsdHBLL2VmWjlIYlZWdUJkL0cvVlJYT3NMRFlDOTROdmpOcjJCWEZUdmQv?=
 =?utf-8?B?aTQ5R0dmblZRY3pDd1VFM3ZSVWU2dUpMbTYza0VBQjZhMGVsWW5hbEt6Z1Rr?=
 =?utf-8?B?UGtwU0FBanRyc3V1M0o1Ny9zYytXaFVReXczQ1pLKzJjaTZFYnkrMlJkZDRn?=
 =?utf-8?B?NmZJdnZNYzRpdHFQbjJRM2YzTEU4NkdsekpBYjFaN1loMGdLQWxYbTRkbzQ2?=
 =?utf-8?B?N3RwakpzM0xIbHNpRjFEalAwR2xzbjhzdnpWSGVMdUpmVnVKYklMYkV1SDRT?=
 =?utf-8?B?QmhtNzRPN1krcDhpMzg5SytWS3crWTZ0b0R1ZGt3QllxNmJVR2ZkQ2hlUnVn?=
 =?utf-8?B?aUY3UU03Y3VVcXg0Wm5VZ3lPWFZBRUZrekNUNHZKNTZ5dTJvOU0yWTFIOEt6?=
 =?utf-8?B?RDJubU03UFl3dVpwMUJGR0VMU2N1Q0h6b1pVa3N3S3Zna21sb2ZMR3RDdWJn?=
 =?utf-8?Q?UlLQ5yq8lOBBT28w6YdyDC7PU1apZ9aItY4rRxCAXZcY?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF9623118BD.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(38070700021)(921020);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?R0pRQWtCK3NmbHMwOEdtdkVJbEY1b1RDNVJqK1BaY1Q5bE8wZnJXUzhEb25w?=
 =?utf-8?B?NDN5dEcwQU0xb1BUdjJMMmU0eHpFRkNRdUpKd0RDZEExVkRlNmxYbURHMFZ2?=
 =?utf-8?B?cjF1MEt0d3VtWkN6TmZGK1ljY2pSdFNKTUQ2dlcvaU1uNk5ER2p6ajhVSklz?=
 =?utf-8?B?Tk9SVGFGMSs4VGZVZC9VaXN3UkpZby9mYXlKbEFxMVNQWWl2bFNNeWdac1Br?=
 =?utf-8?B?SmxJZ2FJUjQ5NHYrVExINndSRCtmRmFXcE1FQWYvVkZjTWVvK3lxMjZKMWVh?=
 =?utf-8?B?OGhoRmhuU3BGc0hNamZEeUduVzJKT3Q3ZVp3dy9Eemxya1Jtam5hVUdYYnVF?=
 =?utf-8?B?eHNNWTM0cXBsRnFyL2V4ZHNrVXhCeXZ5WkNSMzZSeituU2JVeDVseXhYTFFr?=
 =?utf-8?B?ekdhTUg5ZlYzNXFyYTMrZDRQSFY5OXZwczBoUm51S1FHR1R3N2d5ay9TVjRX?=
 =?utf-8?B?MXpHNkJnVDRiQ1hObDFXbW5qb2Q0VXpvK2xQS2RtU2JmcGNyOWJLQWc3bmxl?=
 =?utf-8?B?VzlCb1FINm03dE1IanovQStvNzBiNzFFYWtyVllzK05CR1JHQWJ1KzhDeG5s?=
 =?utf-8?B?R3dpbkxrN3BpTGZadStTUEVmZDAxa2FEYy9UWE1RZXU5cGw1eFQ0VWFGamtO?=
 =?utf-8?B?VUNrYWcwTktZMVhrSHVhVW9kNmZ2MituMDB1QTVwenpndUgySllGcmZGSGtk?=
 =?utf-8?B?ZE1URkR6RHgyQUdOSkFGTTc3TmFjYVB3YTEvZ25mSkx2ODdJY2VFNEJnYXZi?=
 =?utf-8?B?Q1NhM3RNZHhCODZyb1Q5S2ZIWlE2NmxhR01PcVRBMnJOczZpMEhiUGdzcXpJ?=
 =?utf-8?B?OTgwUGlJMXNOUmtOa2hvcjVZSGJsUjh0d0szTjhLNnV0enNVYjFIVVRHQlJx?=
 =?utf-8?B?OHhyUEgxU0JkRm5IMGQvajk0M29SUUdJR3dPQ2tkcW11aDRTRnBaVFNUSm5D?=
 =?utf-8?B?all4eWk5L3pRbERnUkUrOUFzUTdGaGNTeDhsdjdnSU90K0NXWVBLOWZ4U2hy?=
 =?utf-8?B?RDRVMkRXeXNnMVQzVE1xUGZSVm5xUXA2dkMzQTVnMmFhbzFmMUVzS2VNejNM?=
 =?utf-8?B?TnRIbXdYVjRNa1MzeXVzRG5VQVBwMDNNc2phdkxodUlWTlp4eElrQytwOU1Z?=
 =?utf-8?B?Y1RNTGhkYTJUeUZ6amlCVEFPblNVc0tUNi93TzU1WFZBVXp0eVY3SzNIODFH?=
 =?utf-8?B?eFFVYU1TSzlVNERaRWJCdnczeGk1NTlRVXBIMFhOaFhha0dCUmxyaTNZOVFw?=
 =?utf-8?B?aVkxQTh3WDB0WEc1QUlockdOTkg5eHZrNTdsTzhoUk9UZ1h1UE9nQXJjc05H?=
 =?utf-8?B?NzJUUHY1VXNOMlduVlJ6cUI2UEVPa3FHWWNSY0hrZXR1S0JtcldSbXBrWHhC?=
 =?utf-8?B?eE5hOGRiZzhwRHRrYkR4SzR2YmtqWFZaTkxaRjVJTEQrWGpDTnRsU2s0bnJ4?=
 =?utf-8?B?QmYyanVndG5lTnJ0TnBqVThueXppbmJudERXU3czTG5Ydy9OZDAxbWEvSTBJ?=
 =?utf-8?B?RHdSZjZXL29hZzRJQWJLUEcxZ2o2YXoyNVlaNm9xK25idko5dWVnRkhWWTlD?=
 =?utf-8?B?WG9UREdhSnA0bzFqcXd2MElCeVYwbDF5b2VTTElsb25MTjJ6UkNSUXBySXdE?=
 =?utf-8?B?Q1JxdXl0cnYxbWRiL2JSR1Z3WGNiL21PU3JUODFCUEFucFRiV0twZjJONit5?=
 =?utf-8?B?bk05NUNZZGNFcDlxR0pxcWtkMHRTT0ozUytjUEs3R3RjRkU5R2p6cDU0RGxa?=
 =?utf-8?B?RG5qRFNmQjFxUXNrK0xkemJ6d1NwY2x2Ym50TjZnUmJMVGRMZCtPTlMzTmpp?=
 =?utf-8?B?N1RBWTdsODlTNCtZaTY1Nmw1N2o5TTROekNVQzdtNWdaaHZPcXpEbEk3WVVD?=
 =?utf-8?B?SGw4N1RLTVJmczIvNnZuTjV6TGpyWnF6NjFtQnZOYXhMZjdwcEQrMlFhRUlD?=
 =?utf-8?B?MXRHSFpINzR6ZkhuRzRvbUI3NUZyb2NzbXI0azRkS1c4blNEVWk5OW0waHoz?=
 =?utf-8?B?dWlSb0VSRDFEOW1LQmZjWm9ZdHg2MEN5S1BjNDlKeDVPVFEvWDhseSsvL2Z4?=
 =?utf-8?B?eWdocTlrSUtWQVNsdTFQRG9mR29JN2xHUDNJMTlaVEdtTkNrcmJDNmwrUS8x?=
 =?utf-8?B?cXJzMzBpZmRFQ3dHcWN4a2t5aWFVdWxwMzR4SjhBU3ZvSld0QVowMzVSNnlU?=
 =?utf-8?B?RkhhMmpxcG0vbDc2czBLYWxHSGMrdW1IbHhsQ3hBUVl2SmZLUXpVNTZCdWZM?=
 =?utf-8?B?ZmlaRWhWeExFN1FHRkc2VENFQ0dma0VONG9xL1FiU0lyZHFkaHZFa1FHZWJ2?=
 =?utf-8?B?ZThVSzB0NWlsQXMvNUg2MUF0U1JnbE14aE94azY1aGtvVUFBZGgydz09?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CC81BF8A0776FD4FA45B2F077197FAB6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: microchip.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF9623118BD.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49cfc4c5-c0dc-4b06-9b2f-08de6869c743
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Feb 2026 06:01:05.6536 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: sHZYfBClQtVkkjcYVV/yX/3C4IAB8lMSmSmrv4IjzenHeKhWJTBNaHCFpXDHhlkjAIyBHCk+c2ZtLv9WZ8vHG8ghvEU2uJWsGQcLA9cgA2M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR11MB6270
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.29 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=selector1];
	MIME_BASE64_TEXT(0.10)[];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:Cyrille.Pitchen@microchip.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:Nicolas.Ferre@microchip.com,m:alexandre.belloni@bootlin.com,m:claudiu.beznea@tuxon.dev,m:linux@armlinux.org.uk,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FROM_NEQ_ENVFROM(0.00)[Manikandan.M@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER(0.00)[Manikandan.M@microchip.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[microchip.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,bootlin.com,tuxon.dev,armlinux.org.uk];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TO_DN_NONE(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	FROM_NO_DN(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,microchip.com:mid,microchip.com:dkim,microchip.com:email,f001c000:email]
X-Rspamd-Queue-Id: 0B7361173C3
X-Rspamd-Action: no action

T24gMDkvMDIvMjYgMzoyNiBwbSwgQ3lyaWxsZSBQaXRjaGVuIHdyb3RlOg0KPiBBZGQgc3VwcG9y
dCBmb3IgdGhlIEdGWDJEIEdQVS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IEN5cmlsbGUgUGl0Y2hl
biA8Y3lyaWxsZS5waXRjaGVuQG1pY3JvY2hpcC5jb20+DQpSZXZpZXdlZC1ieTogTWFuaWthbmRh
biBNdXJhbGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KPiAtLS0NCj4gICBh
cmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvc2FtOXg2MC5kdHNpIHwgOCArKysrKysrKw0KPiAg
IDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlvbnMoKykNCj4gDQo+IGRpZmYgLS1naXQgYS9hcmNo
L2FybS9ib290L2R0cy9taWNyb2NoaXAvc2FtOXg2MC5kdHNpIGIvYXJjaC9hcm0vYm9vdC9kdHMv
bWljcm9jaGlwL3NhbTl4NjAuZHRzaQ0KPiBpbmRleCBiMDc1ODY1ZTZhNzY4ODAwNWQ0NzE2NjU0
NTliM2Y2ZjFmMjZmN2E0Li41OGQwYTJjZTkyMTg5OTllNDY5ZGM0MzVlMjFhY2Q4ODM3YTRiY2Fk
IDEwMDY0NA0KPiAtLS0gYS9hcmNoL2FybS9ib290L2R0cy9taWNyb2NoaXAvc2FtOXg2MC5kdHNp
DQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL21pY3JvY2hpcC9zYW05eDYwLmR0c2kNCj4gQEAg
LTM1Myw2ICszNTMsMTQgQEAgQVQ5MV9YRE1BQ19EVF9QRVJJRCgyNikpPiwNCj4gICAJCQkJc3Rh
dHVzID0gImRpc2FibGVkIjsNCj4gICAJCQl9Ow0KPiAgIA0KPiArCQkJZ3B1OiBncHVAZjAwMTgw
MDAgew0KPiArCQkJCWNvbXBhdGlibGUgPSAibWljcm9jaGlwLHNhbTl4NjAtZ2Z4MmQiOw0KPiAr
CQkJCXJlZyA9IDwweGYwMDE4MDAwIDB4MTAwPjsNCj4gKwkJCQlpbnRlcnJ1cHRzID0gPDM2IElS
UV9UWVBFX0xFVkVMX0hJR0ggMD47DQo+ICsJCQkJY2xvY2tzID0gPCZwbWMgUE1DX1RZUEVfUEVS
SVBIRVJBTCAzNj47DQo+ICsJCQkJc3RhdHVzID0gImRpc2FibGVkIjsNCj4gKwkJCX07DQo+ICsN
Cj4gICAJCQlpMnM6IGkyc0BmMDAxYzAwMCB7DQo+ICAgCQkJCWNvbXBhdGlibGUgPSAibWljcm9j
aGlwLHNhbTl4NjAtaTJzbWNjIjsNCj4gICAJCQkJcmVnID0gPDB4ZjAwMWMwMDAgMHgxMDA+Ow0K
PiANCg0KLS0gDQpUaGFua3MgYW5kIFJlZ2FyZHMsDQpNYW5pa2FuZGFuIE0uDQoNCg==
