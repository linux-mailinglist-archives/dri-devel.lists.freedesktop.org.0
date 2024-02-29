Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10C786C0A3
	for <lists+dri-devel@lfdr.de>; Thu, 29 Feb 2024 07:26:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB2310E14E;
	Thu, 29 Feb 2024 06:26:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="zh1enbcu";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="w7ikGpTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30D0010E14E
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Feb 2024 06:26:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1709187974; x=1740723974;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=6fYBVBDpi6MneYJdWuB5dTpPDlo77hlcVuVp/4qdXv8=;
 b=zh1enbcuUVB2Y981x+SqE470LxtfBAGP/hTQamqFfUO1Ct3/eXdR6ihj
 r0T/q1WjQBpcH1bJOYgj66AvZfBgbVEiqJKATgtoxRFPhBQuifrxB+LZm
 N/tv3P1zsFzNrM/WWGsWmsQaKeb4oJrpaI59+23K52fSxHp1s4Q/RFIMb
 sojOHNUHNrDco5iay39pwZD2V7i67dIYVn9fC7qtdeZ5UjqvjABxbzfGV
 H5NZlFMsyHWiXwi3KYa9+kAstBvct+z/uPV288CM6uKAY1w23wEaKvGHg
 wQcdOhMpFWp4QliAe4wpecOecoUn5kum2Hc0tRgbdZm1fUDlHE7YtNr+y w==;
X-CSE-ConnectionGUID: uis828vBQg+QO2jgKvERmQ==
X-CSE-MsgGUID: 49SIP1LqSS6RfiM6b/ZkKA==
X-IronPort-AV: E=Sophos;i="6.06,192,1705388400"; d="scan'208";a="18587393"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Feb 2024 23:26:12 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 28 Feb 2024 23:25:58 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 28 Feb 2024 23:25:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IghBPfOqzw8u7SPj0tM5vWQHi2onJofjbQ3NdRhx7d/OEkIX4xqFe0RiISLN9GZxE9Yj6Ty4yKUrxmOFD4ADRSVA7HuUABhDOFYd169KhBPOiPLA8QKfyft2lJEnlt6nbBjzqon9hL0xAbiNVvcvindX6smTLd+gY0dsslS+whXLPlVovdTf5Sizbqi/idKZ9FjGHbTsfMkjhA28e6ejFELeKuuQnBDrzC7YleOdKvVsRaUhoNMW1lDVXQeLYb61PBEnR5hkwErdwBalGiAtXGTWlhwDSywcD4SxWPagoTISuN4c2HDoLwB1SsfWRTyGyfyiEB5Y23uhFVTvBLeZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6fYBVBDpi6MneYJdWuB5dTpPDlo77hlcVuVp/4qdXv8=;
 b=oLCDpZHVCSzuQtVTC38i4fzsCab1C3PqSdXndIo5h5ugU0lPfefdBz+BJ1uvg5UOOkNPktg06iGh9vdxu6Hh/rusmr6/Dy3ikJFeIkVEdj+7brECPCnEBtjFBwTvttLQ3wbh0L62wWF6samhFPmbb3uzSp0Iq3qTr+RC7gbND/s3863ISb7qXuGNOV4YQoqmVjr59Mb8cgqs/u+Bcx4ExsOE75Z0tBSBeplj9VmyRFsV6iI7oEKxNPYscIzUxPsz3RPOsx4g9MEUP7c7YvjtYIsEg//x9/nztEar6ZRdHygOyewsW8yCJIiA7br2epBQoCrH9bdDwSsa/5anAY+TpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6fYBVBDpi6MneYJdWuB5dTpPDlo77hlcVuVp/4qdXv8=;
 b=w7ikGpTw3NYNA+4w5lZ/AQWh+EYCVDLlmeiUiDwm8ZmiC+udC/y7g5xZ+qkRxSlkHhoy/4f3vNO3eQCmkhEWSxafgBaX+ummtjXaupVHgFrA4RiPHRdoCDeviozlPUafwuikdD3Vt0EDCpuhwza5Vw8QDMZ9Wb0Uci9U8pieLEhP397JSlaUCK1eaoJfkkA7LOcRohhfOR2PXN7XRxyvSHgJxIFDC6rf1Ayh0M7bpUaZi+iPEnF5IQNU9XWlauxz7qA49mr8s1yAeIFRzcuMmYiSiWq1xbTV2tiekTCh05/Z2Xljj3KTDBvK6u9K8+qiU3rcT2beRd753++EwpsbIw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by DS0PR11MB7829.namprd11.prod.outlook.com (2603:10b6:8:f1::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7339.23; Thu, 29 Feb
 2024 06:25:57 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd%3]) with mapi id 15.20.7339.022; Thu, 29 Feb 2024
 06:25:56 +0000
From: <Dharma.B@microchip.com>
To: <krzysztof.kozlowski@linaro.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>
CC: <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] dt-bindings: display: atmel,lcdc: convert to dtschema
Thread-Topic: [PATCH] dt-bindings: display: atmel,lcdc: convert to dtschema
Thread-Index: AQHaZjjd01Ir06e0kkmO7KWz3iDwFbEeHZWAgAE9Z4CAAAOxAIAAM9cAgAABZ4CAAU/ZAA==
Date: Thu, 29 Feb 2024 06:25:56 +0000
Message-ID: <dc8181d9-c7c9-4817-96f1-84a1b64575d6@microchip.com>
References: <20240223-lcdc-fb-v1-1-4c64cb6277df@microchip.com>
 <796652d5-af57-4aca-87c2-10a7b0b55959@linaro.org>
 <11c545e2-45df-4587-a5c7-12b05c2f01e0@microchip.com>
 <9bf7e492-891c-4d8f-b388-3b2ebae611c1@linaro.org>
 <e5cb705f-56cc-47cc-beb5-700c9a35c8cf@microchip.com>
 <34388175-7d5b-4f6b-b264-e85b84e98677@linaro.org>
In-Reply-To: <34388175-7d5b-4f6b-b264-e85b84e98677@linaro.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|DS0PR11MB7829:EE_
x-ms-office365-filtering-correlation-id: 0ba000a3-6cb6-499e-7e1e-08dc38ef499f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uLy0Cw6VTjPcL91kV3v3gQ2ZKcoeL+RQiJ/t266RBjvaLKGI9zZAZZxTCGA/1mq4EJcjIFoQEX4zfh7+ZuEN3G8cwQEtBXw0rgEZzVcnd+yS/pfr2TSJIpVGkblKnE4SJPDRzpE84D4T4W+D1soxMt/AqwTIAyKzU+QgF8++5qqdHgQddDN53HMNL0UztM5V7N7+6RNM4DnHExwJ2cLf9ouX5rcy/I8MIm1xVEiOSedgMe8SnZuS5Gl0Ezm5cT0ktCjImnR2e1wxa65myMXc8dyXjxv+WybimQ5gqnz0T71+hbYAXa50UGXfJ3r3Mtxt7t4M6VhmHfGr3cKo2l+QGQmq7H8XMlj/ZcqAXOTyAqLzOHasA1TYkU8cUhzMHiO/oOsfv4UqghzSEQxrhUOEUrJa7qhlWvBhtfwy0weufdjrvKlMK7F7Lt7fEDo9uETNIRJlD/oIT4k5e/Fpl0gGIDy1aqruAN3r2WYZjQr/Y/0RktcZelzN6CkLCuYLpxMXgirY9tMtLPlf44nVPFNBdQFkPL+eQHcaOZxRBNaxfbhCDPGW9gb18UIYnu1O2SyWm3fBj2xgB1c9L96Ffy/NarWidWAtVTHv557BieOc7o7Rs5c6RBiQnQ0Ik9+HAbSyZZR9+kdJo+uHqDs5auc0JnCzqCF8gEGD5R1XwHuiBqFFvVi5EMYpyzNmAT4OnOM2Eh2dUFkv1jA23z0iAWQkcr9V2duk/1EOHuP6V9bsV6I=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009)(921011); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eSszRDY0VWdieUVPamxwTUYzbDdrWjdRSHprcFVHUUZUMjRWSERSeWNUUUxj?=
 =?utf-8?B?TDFHSUZrN0ZJaWtEWXpRSkJWTDVqVmJZa0hUZTJYb3VUY3ZSUGxJcnc5Q1l0?=
 =?utf-8?B?Qmc5WUJoVmt1eGRrUnoyRGRqTEk0Rjl0clRCQ0s1UktxV0hsRUtwMy9Vazgw?=
 =?utf-8?B?M3p0YmFOanJGcUoycHVPYVJsV3F6NWVkVDEzbjNEZlVhdUdsenFkMkJtWG41?=
 =?utf-8?B?MkpVUDg5Vm1PRUxlZEZsdnNiOWVFYkxJb1JyTWpaSVVSZU5Dakc1OUFTMUcw?=
 =?utf-8?B?a1MydHc4WkhYd1g4U25IM0ZseXptb0dMNnNRTTU3eXJza1FtVGo1TnRvZnFF?=
 =?utf-8?B?dXdmUXhudThTMzdrSGtEbVNoZmFFMkxJeWs3S1BvZ081Q0FPakR3Rm05dDhp?=
 =?utf-8?B?NVVvbGNSWTk0SndFZWpOTlh1Mlp4MERNQWZ1ME5VVkJUbmZhNzJRRWZXcS9J?=
 =?utf-8?B?THgvejQxTytuMEtCd2JQKzlJTWZLMTRvN2p3ZkRNc3JSZmhxWEhxd1R0UERm?=
 =?utf-8?B?Q2lHTkdZamx2RXJqdzdhbzkvWjJaYmw0VGxUL0hqeHZnb0dNRzRTSEVPZE5Z?=
 =?utf-8?B?S0FKTk43Y1Rta040dHZpRFVOSVF2NklaaEFBc0xLL1BrRU5wWTd4NFRBbWE1?=
 =?utf-8?B?SllxS2FhTFlzcC9MTENCbmlMTWpKVHFIb1VHZ04waFRhL3hHVVpZSTFkTlp5?=
 =?utf-8?B?V2RvWklZMU9nYjZsRXN1V3YrbFh5dHRUUmF4cDVTckc5QzkyNGl4NlRpZ3lG?=
 =?utf-8?B?YkZzeDFRZlpkUURWSlY1RitudHM4cDFXdnhzeURSb1AybVozeU5qbVhpOXpm?=
 =?utf-8?B?aU1yT0N1aDJvUjR3QUJ5N08zeS8vV2xsSHVCMGd1US9vS0JBNFgxMlY5WDB0?=
 =?utf-8?B?aXg0RXRxRmN6NWprZXNRaDVhU2dCaGthT2RQSXJqbTF6SjM4aktNWkxKZStT?=
 =?utf-8?B?YjdDdmEycFRTTk0yWVdXKzFQMVE4Q0ZpY0FVbi9HZXV0M3BtNEZHZXdRZHlH?=
 =?utf-8?B?dXBFQW5LdUJmZTZNOHdZbUFXUUVGcTJTMXRmSUxPdEVVQ3lhNnc4UzQxYWhv?=
 =?utf-8?B?MmtWUzBhRFE0YWFydHdQZE0wNU80aWtFWDZHYlhZdmJ1aGpOT0t1TWh0WWd2?=
 =?utf-8?B?eHZhTnlacmdqOUFtek5USkFaV3lucnZQK24wTzh6S1EyOEMvN3c0V1pkTkFY?=
 =?utf-8?B?bUhLRG01MENMazk3cnpMNUxYQzZ1dEhwVnJma2locnl0VlY3ZGNudG9ib2Qr?=
 =?utf-8?B?RThBTXNwWW43aVRQTUwwdXF0NVBrTjZtSlJWa0FVU3JTSElPalppcmZRaGFF?=
 =?utf-8?B?OGlzcXBsUmtFLytNeHBBNzcycHlkWUs1S05lUkJwRXBDa2hzZ3pRZ0ZEQ0l6?=
 =?utf-8?B?VjFTQkhWZmM0YktXWGVsVUZReEdTczJnTXY0L3ZXaUtQVTU3WnZubXNaMUFt?=
 =?utf-8?B?T2VmRlVUSjlIU3FyZFQreFlRNTFmT1lhVXdRVm9ESE9xQlQ1dEhBOGJZNXRX?=
 =?utf-8?B?ZCtNRFpYK2ZGN0IzM1pqUlFFdHcvLyswODBCYTBkb2hCVG5ZN0NQaGUwRitw?=
 =?utf-8?B?QUJqdWFicGpleDNWSDVhWXlHMllZMVFPUFAwYXpIV0M3RURYeFRUcGZjN285?=
 =?utf-8?B?dTVad2R4V3pmekxUYU1ZNHVQelRVamNnMFlic1BQK0J6dXFlQ2RRWkZobEF3?=
 =?utf-8?B?N1FNbUorODlUQURKdFVOdDlieTFuS0NNLzJvejl3S3VPbkRjb2FXN2hyVWxE?=
 =?utf-8?B?R3RmTTkybzZPdVY1dTd1cEhZMmM1NTJUUDdXMGkyNWtNRzYxM1B5TVdFdHhY?=
 =?utf-8?B?QUt0ancvMFlReUhrKzUrRE5GSU4xUSsyK2ExcGxvaVZWK3RjSzQ1bXEwNzBR?=
 =?utf-8?B?aGlZT09IRUNXeHFQSk9xT2c3c3QyM0UvcTQ1L2FjVkppUHV6d0ZoSSs1ck1S?=
 =?utf-8?B?VzJBQTk3M244SWhDMm00UGN5cE5KV0tLbHlqTnM1VWo5Z0NVblcwYWpNcHlQ?=
 =?utf-8?B?QmpGUThKRE9COUpkYXlFeXQ3QzkzVk1nMXJDVXQ4V21DMXRPQlM5ZHJVbHRE?=
 =?utf-8?B?L2xvMFVCYmdlR3Zta1JsaG9zM2g2b0UyS1cxNnUyR0xCTC9QOEVsTWdGU2ky?=
 =?utf-8?Q?T/mak2Qb1Xnnyyd1vnGscL86r?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C8899845C9F6A142BA89336769514D87@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0ba000a3-6cb6-499e-7e1e-08dc38ef499f
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Feb 2024 06:25:56.3266 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: qylLodKoIpzHAi6octYpj8xjYbj2wfC+21aa0KxRdHDBiN0BxAZy0ZBa9LbPQ7bM8oSsPDMpBy6TZBa8mcGTWQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7829
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

T24gMjgvMDIvMjQgMzo1MyBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4gRVhURVJO
QUwgRU1BSUw6IERvIG5vdCBjbGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5
b3Uga25vdyB0aGUgY29udGVudCBpcyBzYWZlDQo+IA0KPiBPbiAyOC8wMi8yMDI0IDExOjE4LCBE
aGFybWEuQkBtaWNyb2NoaXAuY29tIHdyb3RlOg0KPj4gT24gMjgvMDIvMjQgMTI6NDMgcG0sIEty
enlzenRvZiBLb3psb3dza2kgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBjbGlj
ayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVudCBp
cyBzYWZlDQo+Pj4NCj4+PiBPbiAyOC8wMi8yMDI0IDA3OjU5LCBEaGFybWEuQkBtaWNyb2NoaXAu
Y29tIHdyb3RlOg0KPj4+Pg0KPj4+Pj4NCj4+Pj4+IEkgZG9uJ3Qga25vdyB3aGF0J3MgdGhpcyBl
eGFjdGx5LCBidXQgaWYgZW1iZWRkZWQgZGlzcGxheSB0aGVuIG1heWJlDQo+Pj4+PiBjb3VsZCBi
ZSBwYXJ0IG9mIHRoaXMgZGV2aWNlIG5vZGUuIElmIHNvbWUgb3RoZXIgZGlzcGxheSwgdGhlbiBt
YXliZSB5b3UNCj4+Pj4+IG5lZWQgYW5vdGhlciBzY2hlbWEsIHdpdGggY29tcGF0aWJsZT8gQnV0
IGZpcnN0IEkgd291bGQgY2hlY2sgaG93IG90aGVycw0KPj4+Pj4gYXJlIGRvaW5nIHRoaXMuDQo+
Pj4+DQo+Pj4+IE9rYXksIHRoZW4gSSB0aGluayB0aGUgZHJpdmVyIGFsc28gbmVlZHMgdG8gYmUg
bW9kaWZpZWQsIGN1cnJlbnRseSB0aGUNCj4+Pj4gZHJpdmVyIHBhcnNlcyB0aGUgcGhhbmRsZSBh
bmQgbG9va3MgZm9yIHRoZXNlIHByb3BlcnRpZXMuIEFsc28gdGhlDQo+Pj4+IGNvcnJlc3BvbmRp
bmcgZHRzIGZpbGVzLg0KPj4+DQo+Pj4gRHJpdmVyIGRvZXMgbm90IGhhdmUgdG8gYmUgbW9kaWZp
ZWQgaW4gbXkgcHJvcG9zYWwuIFlvdSB3b3VsZCBzdGlsbCBoYXZlDQo+Pj4gcGhhbmRsZS4NCj4+
DQo+PiBJZiBJIHVuZGVyc3RhbmQgY29ycmVjdGx5LCBJIGNvdWxkIGRlZmluZSB0aGUgZHQgYmlu
ZGluZ3MgYXMgYmVsb3cNCj4+DQo+PiAgICAgZGlzcGxheToNCj4+ICAgICAgICRyZWY6IC9zY2hl
bWFzL3R5cGVzLnlhbWwjL2RlZmluaXRpb25zL3BoYW5kbGUNCj4+ICAgICAgIGRlc2NyaXB0aW9u
OiBBIHBoYW5kbGUgcG9pbnRpbmcgdG8gdGhlIGRpc3BsYXkgbm9kZS4NCj4+DQo+PiAgICAgcGFu
ZWw6DQo+PiAgICAgICAkcmVmOiBwYW5lbC9wYW5lbC1jb21tb24ueWFtbCMNCj4+ICAgICAgIHBy
b3BlcnRpZXM6DQo+Pg0KPiANCj4gU28gdGhlc2UgYXJlIHN0YW5kYXJkIHBhbmVsIGJpbmRpbmdz
PyBUaGVuIHRoZSBub2RlIHNob3VsZCBsaXZlIG91dHNpZGUNCj4gb2YgbGNkYy4gSWYgY3VycmVu
dCBkcml2ZXIgbmVlZHMgdG8gcG9rZSBpbnNpZGUgcGFuZWwgYW5kIHBhbmVsIGNvdWxkIGJlDQo+
IGFueXRoaW5nLCB0aGVuIHByb2JhYmx5IHlvdSBuZWVkIHBlcmlwaGVyYWwtcHJvcHMtbGlrZSBh
cHByb2FjaC4gOi8NCg0KVGhhbmsgeW91IHNvIG11Y2gsIHNvIGNhbiBJIHVzZSBzb21ldGhpbmcg
bGlrZSB0aGlzDQoNCiAgIGRpc3BsYXk6DQogICAgICRyZWY6IC9zY2hlbWFzL3R5cGVzLnlhbWwj
L2RlZmluaXRpb25zL3BoYW5kbGUNCiAgICAgZGVzY3JpcHRpb246IEEgcGhhbmRsZSBwb2ludGlu
ZyB0byB0aGUgZGlzcGxheSBub2RlLg0KDQpwYXR0ZXJuUHJvcGVydGllczoNCiAgICJecGFuZWwi
Og0KICAgICB0eXBlOiBvYmplY3QNCiAgICAgcHJvcGVydGllczoNCiAgICAgICBhdG1lbCxkbWFj
b246DQogICAgICAgYXRtZWwsbGNkY29uMjoNCiAgICAgICA6DQogICAgICAgOg0KICAgICByZXF1
aXJlZDoNCiAgICAgICAtIGF0bWVsLGRtYWNvbg0KICAgICAgIC0gYXRtZWwsbGNkY29uMg0KICAg
ICAgIC0gYXRtZWwsZ3VhcmQtdGltZQ0KICAgICAgIC0gYml0cy1wZXItcGl4ZWwNCg0KICAgICBh
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UNCg0KSSB0ZXN0ZWQgaXQgYnkgcmVtb3ZpbmcgdGhl
IHJlcXVpcmVkIHByb3BlcnR5IGluIHRoZSBwYW5lbCBub2RlIGFuZCBpdCANCmZsYWdnZWQgaXQg
YXMgYW4gaXNzdWUuDQoNCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQot
LSANCldpdGggQmVzdCBSZWdhcmRzLA0KRGhhcm1hIEIuDQoNCg==
