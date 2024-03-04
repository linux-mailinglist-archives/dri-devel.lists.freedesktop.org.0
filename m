Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE34786F921
	for <lists+dri-devel@lfdr.de>; Mon,  4 Mar 2024 05:15:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D81B10E6F4;
	Mon,  4 Mar 2024 04:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="TWNTF+2f";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="qPE2Oi5M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9376110E6F4
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Mar 2024 04:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709525708; x=1741061708;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=k0RCiI7ngT/dcIYg4MGY7jFqWWjoxpqiYFMQ5bmOVV0=;
 b=TWNTF+2fueRZGDux6+xtCer0CRZRDJrI3Z1Uio7ltUmDB21EVOLiJqiz
 bBPJSB5CbJjsPnXTShi+sjs4PFOvj5HAZDOHG6EtWASxE44iPRISSfzKP
 0Odvhw1g1OltHTeym3P6BjrFhNoiQaWcJ1eBZtoBJJe88lnUGXnp1H/x1
 GenQVIOqXSPKQeEyzNmZjRVfnpSx+QlOpKnz/d2XRPjmRlfmaied5pBxr
 DFDMdxjhLYOHEWP8ZFLTVLaVtttYIHEWGN96++XmJxgWINaJlFNSocNoo
 UslhPVxL9H3jG1ETvgaeq/PvdhHveaPfvVKl4UmTU3RYdol4vXdbrhgpX g==;
X-CSE-ConnectionGUID: Su6vTMwzQ961PgqGPeVIpw==
X-CSE-MsgGUID: 87qvCGH2QMC3O5U9F6XmYA==
X-IronPort-AV: E=Sophos;i="6.06,203,1705388400"; d="scan'208";a="184416707"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 03 Mar 2024 21:15:06 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 3 Mar 2024 21:14:58 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 3 Mar 2024 21:14:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MtJu8sI54IJ+MR+lzaC5byNUhWrC9kJ8cCzSfjhxC3QeWq2vUReLWsXKRn2PPlSGWptVqwyWknraQ1uOw0i4EN2LRysoNBk+fguLm7vvEub/kgwzp2vLAiextL8HP0nCACnPQCpxM6WRdOcVmG+VLzY5wg5NUnhRZHwtR9Jv3O6LI4KTDoHetdQIHqehQpH5cq3IRP8oCyyJ2bh82B/GMpWD0H05zrnUnLHlmh6HjbUql4uGVdLd+FAqN3QucddXyg1M8Sn3PFWnLnhyFkOEVeqQBTZl94LrLsoErS0oT2RRzIEwkOz19fymkeNRsOxFPBvmBkdhelNK/fadTCUCzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0RCiI7ngT/dcIYg4MGY7jFqWWjoxpqiYFMQ5bmOVV0=;
 b=K8nw068fpcRW1wy6h3yD+pbERJhhqyW9dYSCPnySYIWgg3p3zD8JBSIqESBX6wAvqWaBPy21AwHkjVZupdtyTOqCDcRBEiFCtjhgWIs34IB7tS7F7u5ZNWmruuhYBsjQDnq2QwFI+QYcFah8KXavdwcHVXRu7zEPC5AbCR/tQnPwgSO2KT4E2Zrcr1wVB8W9nBAQ2SWcV8Aomql1nMhuoUgIIhU+MWDDwmlpZ2IF8NSSumLfHZiQ/mVCNwRMZ+q3Pxou8cN/7xTMQe/8ibz8H6MEoxfMYOivYTduZK2tZo5Sc8lGJz9EbMZzqBFMqnawZpsgMuThwOOUbDj1I080PA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0RCiI7ngT/dcIYg4MGY7jFqWWjoxpqiYFMQ5bmOVV0=;
 b=qPE2Oi5MSTHbKKtuvEPgvP6/CnPdyAHTIxS+860VDW4DIg0MTkom6UFbNnxASb5ll27d4DAM5Ar6GwH5P8pDqXBOc4Ohfmi4SqkiHIE5XfVpm9CsfSnT0rZ0+uYhYe827SJaa0JWgPN7VY4zStbJbB5RhcJsJcYxJKQ0BNF2XHpV1S+s6S6JKUkiQCkS4E6+0yrVZlnJPIvn61xDfuI/hDMDIYrja+nYdX3bx5OonNpS43L/78JGcxBjl2QTAkwhSsx6XNVFnbEBHoWZa/LOxb7eYgrjkTtLr7QUMYpWn6cDmc0q8ufJwSAwlfqRClIsfuQL4A2yXySqXA6ZJ1eBfw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by BN9PR11MB5289.namprd11.prod.outlook.com (2603:10b6:408:136::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.23; Mon, 4 Mar
 2024 04:14:56 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd%3]) with mapi id 15.20.7362.019; Mon, 4 Mar 2024
 04:14:56 +0000
From: <Dharma.B@microchip.com>
To: <robh@kernel.org>
CC: <krzysztof.kozlowski@linaro.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <krzysztof.kozlowski+dt@linaro.org>,
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: display: atmel,lcdc: convert to dtschema
Thread-Topic: [PATCH] dt-bindings: display: atmel,lcdc: convert to dtschema
Thread-Index: AQHaZjjd01Ir06e0kkmO7KWz3iDwFbEeHZWAgAE9Z4CAAAOxAIAAM9cAgAABZ4CAAU/ZAIACVyyAgAPNmoA=
Date: Mon, 4 Mar 2024 04:14:56 +0000
Message-ID: <62f3e424-0d09-4cd2-ab3c-d2032fc3284d@microchip.com>
References: <20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com>
 <796652d5-af57-4aca-87c2-10a7b0b55959@linaro.org>
 <11c545e2-45df-4587-a5c7-12b05c2f01e0@microchip.com>
 <9bf7e492-891c-4d8f-b388-3b2ebae611c1@linaro.org>
 <e5cb705f-56cc-47cc-beb5-700c9a35c8cf@microchip.com>
 <34388175-7d5b-4f6b-b264-e85b84e98677@linaro.org>
 <dc8181d9-c7c9-4817-96f1-84a1b64575d6@microchip.com>
 <20240301181007.GA2481641-robh@kernel.org>
In-Reply-To: <20240301181007.GA2481641-robh@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|BN9PR11MB5289:EE_
x-ms-office365-filtering-correlation-id: 84ec1338-55db-4e4a-24bb-08dc3c01a650
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RGEChburZoHnHmWEEtlcL0lXKhs9uSmJDQK0JrACskO5ae0iu4mlH2NzyrdQbo4FTyOQ39ZVWAFOVqTxtz7sUO7SVToxbD+YcTpBLrncfyupDxPxP3R+Yct5UPYNJE91/4fUxVfTfl7ZdHEIVpf1NDiJt2hHX8Xq/+sFATIMlyrE+mb/JF64/As7kUuIT1nr8l8M0EQzJ3D0CmVspr7HnmL9l6Q8RS9G6VOmrGd5hH+SBXCIwMeZfHBWz4JcnkwnE0uFhIrzFKdKGUX9zygGzQwr9rWJ0NymE4OB9Yj9qtf7nDHSp+wQYeW5vjndtMeFMgSoMHrSCVtjaPgYHNcAbcye30laV37XI5iBuV2KbdR314Y4caThIyby5+pklWppTgx7rI73dlUzsuqMQXGgEas2yyjxalV6YdOoWCkexDSb+F722JZt6mivpQZk9P8G9cfAWJXG+n7HglOBdJEiwWvYIsOJIX9BxZssGH6oNVkP6u6pobS7NOHy0oz5lhtLhHWdQxBkfHG4gA7QAmyP1XXrYv/DWIWosqbpDbI/+ObhNtmZLBh3/B7MsNvuHd7hzPrm1yUb79ajOHRqEQv/FqcvrNDY9WSwUaRbxo2GWHfFxrSJAghvbN/W3ofOt3ku+LQwcjvp9OvT2RH6nUJ8iSYoRF4bDaNnaYVXZ4Se4EKpZlCP26npTtQExUXKMayoTowCaYxC/pnGRU518AQLf6EUrgyH2V0uuFYkXXB7HB4=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?c3NYOEhXR1hReWh0NUh0b3RGayt3SUcwaG4zU3RnbWxqWWtua3NSTUxOc0Ra?=
 =?utf-8?B?Mm5xZU5aSlZ4enVBV0t2NlBBVDJVazJoTHFUK3JvdTJQckp3UTkzOFN1bVpu?=
 =?utf-8?B?NEw2MytYUUx0TG1QeVI4VjgyazdjVWFoOXc3TktyR0VFQ2FhaDh6dTFQOGhh?=
 =?utf-8?B?L2piN0kxR1liSUVKc2NpaFZIK3hzN1hTejBmSUxyOTB5aC9uUnR2c1ZURTlD?=
 =?utf-8?B?bVg5RkVSZXEwWEdSdWJVYXdQUlpvRUgyR0M1TjdzVlEzWDBjVDhMTncvazZ5?=
 =?utf-8?B?dEZEU0tHTDhXZDcvcWM1SVJlR1VHSEM3b1JySlJoTVpsbmpycUxpQStEZ0dz?=
 =?utf-8?B?MmtIenNrMkxIRW9ENE8yQ3F0dXRoZVVFeEovUVFZTklaUHQxYUJNTHBzckRT?=
 =?utf-8?B?SndVVHBqNWtUaXlNbCtWNnpWZDVzNGZvVEJSRkczQWVrTmNmbTZuT2dYcUtz?=
 =?utf-8?B?NGxFaElzTzhVS3hKS2szdnl1SG85SlM2MEdad0pKQXcwNVpVeDF3RzRqY0Fj?=
 =?utf-8?B?QVdrS3g0WVd1Vk1nVjc5THRLWEFZWFpGNlRBSTREYXJYcTVEMklscUsxOHVC?=
 =?utf-8?B?VGg0YlVBTFdTTEhWR25FOTNKL2Zod1lhRHhDeG9XK2dXU2Q1ZlR5WERPUjZo?=
 =?utf-8?B?eWxGelpWTENGeTd3elZmYzlmam83bGJyVlNjWkVlYVFjcGN4K21vaVpLaTNT?=
 =?utf-8?B?YkVpbDEwdngrbC9DU3lOUzhGMktYN0pGMi9pZFdEMXMzTGtNd1QxRE4rTXJi?=
 =?utf-8?B?Y0tPaTBPTWwxVFVxRjlzWngzL1U0cEd2alhOK2ZpT1hoTFFld3d6UkJTZmZC?=
 =?utf-8?B?VUVvWWhIVU8zYm40ZVJxUzNiMFM5SUNRVmdFWmkwZVFzaTE4N2gvQU9KMEw2?=
 =?utf-8?B?RlpFV2xHdWhWZGgrL1RSdUZyc1ZURmMxVzAyM3QxdU5UckhoOVlWVFZLWjhp?=
 =?utf-8?B?VmR4VlJoMFlUeXJiOUxJWVlKY1Q1Z2hqRlUwcmxZM3V1S2ZWRXduTEIrWm85?=
 =?utf-8?B?Wlh3THQvQmpjaWFvUlFmOTcydDFHcjlOM1dZa3Z5U1dmOGE3ZnBBdWdCU2FU?=
 =?utf-8?B?ZEFlaERETVppWDd4Lzd3TEs5a1BadUtKam5KVDBpWmJIVkR4TWJZejQ5dWV4?=
 =?utf-8?B?WnFOb2F5VE9NWk1HZ2dsdFB5dFNXY285TTBsUjdzc08vQng2Q0IwSVJGdzRt?=
 =?utf-8?B?MzJ1dldQOXJ0K21Mb3ZSTGtlK1RNNXlyS1BEV25MeWVudzlNcDRmd1R3eVd2?=
 =?utf-8?B?V2xUT0p6enFqS2N1ang0NkRRTGdQR201RXpaNDlwNS9MRUVhcWhxVWJaK3Y3?=
 =?utf-8?B?SFpsSXpxa0g1Z0h0c0VNdFZQdlNQU0d4RG9zWnByY3lRNjF4UStRMnhSOGVC?=
 =?utf-8?B?UC9EWm4zcXpaR3c2TmMvUUJudjNHaUIrRXV2cnlpbXN6dHFZYW9kS0NTUGll?=
 =?utf-8?B?ZmloQ3B4L3FwcHBzQXVWckwzUktGTlJpWi9qMmNPNWtBOFplZXR2Y0dzcDJp?=
 =?utf-8?B?MGVnODBHdmxsaDZpUHdSNm4zczcxWThyVE5saGdLaGd4dGorT0FZVlE5b3Zi?=
 =?utf-8?B?d3V2U3BvVUljZEhyZFFiTjM4cVROSU1QUFl1aW9QKyttMUdsRktRSUpxeElR?=
 =?utf-8?B?a01TUnlSWkwrM2pwNTY4OWlxWklUQ3JJQTZ4eXVBd0EvallhN2lSeEo4bUtM?=
 =?utf-8?B?NTFqSHBZTUgvQWhUQ0owTUpBbE5WQVdYdnMyUjB1akZ6S0VwVUxQU0x2VTI4?=
 =?utf-8?B?SnZ5dmRwK1FEdHk0cEJmUEpKdTNnMWxnUi9ycVovVHZNVFYxTUE1a3RwRVlE?=
 =?utf-8?B?V1FXOTAvcUxHc3FaT0FIbzBPWE9wUlBkZ3BnTEdERHJML0pmRnlIN1pEZnhP?=
 =?utf-8?B?eGlCSWNYdS84RjhxN2JuVzNDT1JQR0pUTTcyRE8wbUN0d1BSYUROSlRCOThF?=
 =?utf-8?B?U1AraWhsNDM2QS9ZdUZBWWZhWFlqOUpFOWxaL0FqRUdRWkp3UXVTS0RKQk9P?=
 =?utf-8?B?QmhjN0hpV0NDNkZSZVJPcXk2R0hlUmFSbVNxNzQ5bFBzZEtWTVFaajhZbEhN?=
 =?utf-8?B?RE9tNVlCU1ZrU0ZsRFA4NjhVa2ZYblJKUEMyRjRzODRiY0ZwSHpKaUQ3TkdW?=
 =?utf-8?Q?ZSjXj1cxYJ3lOtiunWtu+O9+U?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <3C4999EA2CFA594A85DDA9DAD3F32071@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 84ec1338-55db-4e4a-24bb-08dc3c01a650
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Mar 2024 04:14:56.2455 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IOypc1dC9CouCrmj7tcv8DixPJWqlEICbraq/TqkgyKdoAzh5deaA+yNKrtJ10kn5tpPXPMAZd38N0OxjmBxUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5289
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

T24gMDEvMDMvMjQgMTE6NDAgcG0sIFJvYiBIZXJyaW5nIHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIFRodSwgRmViIDI5LCAyMDI0IGF0IDA2OjI1
OjU2QU0gKzAwMDAsIERoYXJtYS5CQG1pY3JvY2hpcC5jb20gd3JvdGU6DQo+PiBPbiAyOC8wMi8y
NCAzOjUzIHBtLCBLcnp5c3p0b2YgS296bG93c2tpIHdyb3RlOg0KPj4+IEVYVEVSTkFMIEVNQUlM
OiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3MgeW91IGtub3cg
dGhlIGNvbnRlbnQgaXMgc2FmZQ0KPj4+DQo+Pj4gT24gMjgvMDIvMjAyNCAxMToxOCwgRGhhcm1h
LkJAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4+Pj4gT24gMjgvMDIvMjQgMTI6NDMgcG0sIEtyenlz
enRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4+PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNr
IGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlz
IHNhZmUNCj4+Pj4+DQo+Pj4+PiBPbiAyOC8wMi8yMDI0IDA3OjU5LCBEaGFybWEuQkBtaWNyb2No
aXAuY29tIHdyb3RlOg0KPj4+Pj4+DQo+Pj4+Pj4+DQo+Pj4+Pj4+IEkgZG9uJ3Qga25vdyB3aGF0
J3MgdGhpcyBleGFjdGx5LCBidXQgaWYgZW1iZWRkZWQgZGlzcGxheSB0aGVuIG1heWJlDQo+Pj4+
Pj4+IGNvdWxkIGJlIHBhcnQgb2YgdGhpcyBkZXZpY2Ugbm9kZS4gSWYgc29tZSBvdGhlciBkaXNw
bGF5LCB0aGVuIG1heWJlIHlvdQ0KPj4+Pj4+PiBuZWVkIGFub3RoZXIgc2NoZW1hLCB3aXRoIGNv
bXBhdGlibGU/IEJ1dCBmaXJzdCBJIHdvdWxkIGNoZWNrIGhvdyBvdGhlcnMNCj4+Pj4+Pj4gYXJl
IGRvaW5nIHRoaXMuDQo+Pj4+Pj4NCj4+Pj4+PiBPa2F5LCB0aGVuIEkgdGhpbmsgdGhlIGRyaXZl
ciBhbHNvIG5lZWRzIHRvIGJlIG1vZGlmaWVkLCBjdXJyZW50bHkgdGhlDQo+Pj4+Pj4gZHJpdmVy
IHBhcnNlcyB0aGUgcGhhbmRsZSBhbmQgbG9va3MgZm9yIHRoZXNlIHByb3BlcnRpZXMuIEFsc28g
dGhlDQo+Pj4+Pj4gY29ycmVzcG9uZGluZyBkdHMgZmlsZXMuDQo+Pj4+Pg0KPj4+Pj4gRHJpdmVy
IGRvZXMgbm90IGhhdmUgdG8gYmUgbW9kaWZpZWQgaW4gbXkgcHJvcG9zYWwuIFlvdSB3b3VsZCBz
dGlsbCBoYXZlDQo+Pj4+PiBwaGFuZGxlLg0KPj4+Pg0KPj4+PiBJZiBJIHVuZGVyc3RhbmQgY29y
cmVjdGx5LCBJIGNvdWxkIGRlZmluZSB0aGUgZHQgYmluZGluZ3MgYXMgYmVsb3cNCj4+Pj4NCj4+
Pj4gICAgICBkaXNwbGF5Og0KPj4+PiAgICAgICAgJHJlZjogL3NjaGVtYXMvdHlwZXMueWFtbCMv
ZGVmaW5pdGlvbnMvcGhhbmRsZQ0KPj4+PiAgICAgICAgZGVzY3JpcHRpb246IEEgcGhhbmRsZSBw
b2ludGluZyB0byB0aGUgZGlzcGxheSBub2RlLg0KPj4+Pg0KPj4+PiAgICAgIHBhbmVsOg0KPj4+
PiAgICAgICAgJHJlZjogcGFuZWwvcGFuZWwtY29tbW9uLnlhbWwjDQo+Pj4+ICAgICAgICBwcm9w
ZXJ0aWVzOg0KPj4+Pg0KPj4+DQo+Pj4gU28gdGhlc2UgYXJlIHN0YW5kYXJkIHBhbmVsIGJpbmRp
bmdzPyBUaGVuIHRoZSBub2RlIHNob3VsZCBsaXZlIG91dHNpZGUNCj4+PiBvZiBsY2RjLiBJZiBj
dXJyZW50IGRyaXZlciBuZWVkcyB0byBwb2tlIGluc2lkZSBwYW5lbCBhbmQgcGFuZWwgY291bGQg
YmUNCj4+PiBhbnl0aGluZywgdGhlbiBwcm9iYWJseSB5b3UgbmVlZCBwZXJpcGhlcmFsLXByb3Bz
LWxpa2UgYXBwcm9hY2guIDovDQo+Pg0KPj4gVGhhbmsgeW91IHNvIG11Y2gsIHNvIGNhbiBJIHVz
ZSBzb21ldGhpbmcgbGlrZSB0aGlzDQo+Pg0KPj4gICAgIGRpc3BsYXk6DQo+PiAgICAgICAkcmVm
OiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy9waGFuZGxlDQo+PiAgICAgICBkZXNj
cmlwdGlvbjogQSBwaGFuZGxlIHBvaW50aW5nIHRvIHRoZSBkaXNwbGF5IG5vZGUuDQo+Pg0KPj4g
cGF0dGVyblByb3BlcnRpZXM6DQo+PiAgICAgIl5wYW5lbCI6DQo+IA0KPiBKdXN0ICdwYW5lbCcg
YW5kIG5vdCBhIHBhdHRlcm4uDQo+IA0KPiBIb3dldmVyLCB0aGF0J3Mgbm90IHdoYXQgdGhlIG9y
aWdpbmFsIGJpbmRpbmcgaGFkLiBJdCB3YXMgYSBzZXBhcmF0ZQ0KPiBub2RlLiBJZiB5b3Ugd2Fu
dCB0byBwcmVzZXJ2ZSB0aGF0LCB0aGVuIHlvdSdsbCBuZWVkIGEgc2VwYXJhdGUNCj4gc2NoZW1h
IGZpbGUgYW5kIGEgc3BlY2lhbCAnc2VsZWN0Jy4gU29tZXRoaW5nIGxpa2U6DQo+IA0KPiBzZWxl
Y3Q6DQo+ICAgIGFueU9mOg0KPiAgICAgIC0gcmVxdWlyZWQ6IFsgYXRtZWwsZG1hY29uIF0NCj4g
ICAgICAtIHJlcXVpcmVkOiBbIGF0bWVsLGxjZGNvbjIgXQ0KPiAgICAgIC0gcmVxdWlyZWQ6IFsg
YXRtZWwsZ3VhcmQtdGltZSBdDQo+IA0KPiBVcCB0byB5b3UgYW5kIGF0OTEgbWFpbnRhaW5lcnMg
aWYgeW91IHdhbnQgdG8gaGF2ZSB0byB1cGRhdGUgeW91ciBkdHMNCj4gZmlsZXMgb3Igbm90Lg0K
PiANCj4gUm9iDQoNClRoYW5rIHlvdSBzbyBtdWNoIFJvYiwgSSB3aWxsIGludHJvZHVjZSBhIG5l
dyBiaW5kaW5nIGZvciBsY2RjLWRpc3BsYXkgDQp3aXRoIGEgc3BlY2lhbCBzZWxlY3QgYXMgeW91
IHN1Z2dlc3RlZC4NCg0KSSB3aWxsIHNlbmQgYSB2MiB3aXRoIHRoZSBmb2xsb3dpbmcgY2hhbmdl
cw0KLSBSdW4gY2hlY2twYXRjaCBhbmQgcmVtb3ZlIHdoaXRlc3BhY2UgZXJyb3JzLg0KLSBBZGQg
dGhlIHN0YW5kYXJkIGludGVycnVwdCBmbGFncy4NCi0gU3BsaXQgdGhlIGJpbmRpbmcgaW50byB0
d28gbmFtZWx5IGxjZGMueWFtbCBhbmQgbGNkYy1kaXNwbGF5LnlhbWwuDQpmb3IgeW91ciBraW5k
IHBlcnVzYWwuDQoNCi0tIA0KV2l0aCBCZXN0IFJlZ2FyZHMsDQpEaGFybWEgQi4NCg0K
