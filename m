Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FA385B537
	for <lists+dri-devel@lfdr.de>; Tue, 20 Feb 2024 09:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C19F10E1F5;
	Tue, 20 Feb 2024 08:31:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="VUaRPqk2";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="RMcK4LF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7973E10E1F5
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Feb 2024 08:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1708417885; x=1739953885;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=uZ3YbEg9D/P9meiXTN3+tUs0CpO/hfG6tkgSaeVGmJY=;
 b=VUaRPqk2nK0P8NWL25MSP0GHpebOLaXKgM8IpdmL8fMMiv0yebKCxxZw
 8/pvhhkVNymc6fry7By8NJHQmYMOXtMFIMP9yt+37+ph9fsmu5wrGHFM1
 ZghKibYyKuZZog12jS8+Z2zHHQ0hBa6NORdgI/lf9Ds3F2tQ40IAEnpw+
 /X9UwrevkK9n+vK1rRFQ7nTWdjLNJOXVK/VvTRH2FsdIn+m8JeJXRnuS1
 tmtGLgEo4VAiVbOElPD8pKwCuaF4P08Qh1HJH2oS2WoRfIkVldpe+6lTN
 w5kWplHCgNMLnp3WKzS9LXO5bXE2pBLNDFBcnXaHFTkztUQIj3XlPOELK A==;
X-CSE-ConnectionGUID: 1pQGQaqCSHKSuC2bZKH31Q==
X-CSE-MsgGUID: 5KS7F59BSzqIZbjiG+Lo2Q==
X-IronPort-AV: E=Sophos;i="6.06,172,1705388400"; d="scan'208";a="17032926"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 20 Feb 2024 01:31:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 20 Feb 2024 01:30:41 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 20 Feb 2024 01:30:41 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Crx+4Ukdjh7ZTKpu1vAChDukx9KjGu6V0KD1M1QPgVP8gtQL4gVNVZ74GMzJ/JU5T/z6yUPUV2rAy8PgXKIj4F+qP2IeeveuklEPVhN/KOg+NNy/GxP+Rp4XNbMy5mJZuSKox2JwboBaeB0nF8di1cp953eiIgeu6Fw3ca+rPrjzJyLqFArznRHLnlZbhPw9+EwnQqMjYw61h9vOI8kaLzWj4ocSF7xUhUwW+K3akm8MWnuKZf+uvPUv9d+ZWHcYmRvUqYFITiIGihQOwFeHNUPej++d9pQ2y41ZvaD53Yzjukf0Yq6uIuctrhaegj2K5hziaBhZpoKksKJr5E06ug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uZ3YbEg9D/P9meiXTN3+tUs0CpO/hfG6tkgSaeVGmJY=;
 b=QRYUA3GyzXnvJBWtVcwglTUFsZxObVj3Xgp74Os03+RAJaVigNF3h0ujIrBa+py0vWLPaaMx4pJtLy8uo1V6bF21AEyWNBWmlq312rPQp0+7IAjlRuYD2VsumbkKrm4GN60lI1JZCj8z4vTy9hWmw5//xmeG85Pc69vGHTm0Q64BGhXAwAnxTB6tsbB8+nKr3fb9YoH/r5BbKDrW4/7Dv/253zffSrNqdMn8lNH87NMfaJT14HgQy32SJfafDB95jo4kWD1+J8aQ2AePCkBz2BvvO1PyCkFVRXx6eaf5f1PrATdi8xUwLA+U5RIc3h8VJq/Arj+3Az0EhG8eXgc4dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uZ3YbEg9D/P9meiXTN3+tUs0CpO/hfG6tkgSaeVGmJY=;
 b=RMcK4LF76/cHVd2GemEmOgsBwSZVSj5DGG5hNa5q+RzcL2WLP0/L4sJAGnHkUj3t5TPsgT3R3HbFvFtPkkwKd8UBddBOo7KryaOpq8zFoKwm79MkbOQHZ9vKCFcQbEVB+U3sO/M5IYtw2XbuzaCUGrKZAUcwCyan3Xj5D8lZk5RjIQLMPAbY/GYsg3+V694NmNBhCQr4BBfwhYogFDrd/VFy9M5WXQCjbY0+tSFOz3ZLU8e7ODwlOveWq62hfsNqfue3yb4R2QDP71WzxyFhLzTaxMv1swssZhpXvee6946UdUwxp+CkIH7Bm3wD8FYDeaaYN5KTHp7EkQcF70bWtg==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by MW5PR11MB5812.namprd11.prod.outlook.com (2603:10b6:303:193::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.38; Tue, 20 Feb
 2024 08:30:38 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7270.036; Tue, 20 Feb 2024
 08:30:38 +0000
From: <Dharma.B@microchip.com>
To: <lee@kernel.org>
CC: <krzysztof.kozlowski@linaro.org>, <sam@ravnborg.org>,
 <bbrezillon@kernel.org>, <maarten.lankhorst@linux.intel.com>,
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <daniel@ffwll.ch>, <robh+dt@kernel.org>, <krzysztof.kozlowski+dt@linaro.org>, 
 <conor+dt@kernel.org>, <Nicolas.Ferre@microchip.com>,
 <alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <thierry.reding@gmail.com>, <u.kleine-koenig@pengutronix.de>,
 <linux-pwm@vger.kernel.org>, <Hari.PrasathGE@microchip.com>,
 <Manikandan.M@microchip.com>, <Conor.Dooley@microchip.com>
Subject: Re: (subset) [linux][PATCH v6 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Thread-Topic: (subset) [linux][PATCH v6 3/3] dt-bindings: mfd: atmel,hlcdc:
 Convert to DT schema format
Thread-Index: AQHaVW1agMCd01Ttxk+iqd3BnnFM67EATF8AgAZDsACADCB0AIAAT/IAgAAC24A=
Date: Tue, 20 Feb 2024 08:30:38 +0000
Message-ID: <9dbfbeac-3a00-4571-95c0-83e4d47737c5@microchip.com>
References: <20240202001733.91455-1-dharma.b@microchip.com>
 <20240202001733.91455-4-dharma.b@microchip.com>
 <170738899221.920003.15342446791449663430.b4-ty@kernel.org>
 <cedecdb7-fe4a-42ea-9a11-faa82f84b57d@linaro.org>
 <ffd43756-b24e-4f19-be33-0e33047ad70c@microchip.com>
 <20240220082026.GG10170@google.com>
In-Reply-To: <20240220082026.GG10170@google.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|MW5PR11MB5812:EE_
x-ms-office365-filtering-correlation-id: c141a5c8-e515-4569-678a-08dc31ee3788
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 5oiCT03pGkKvhVXsWNDp/7BW9xL4C+aRmgJcJBcA4inmMH2Ls4f23qyz41UwH512Ap/NbHV4PAw5Yu5K/g11LeU68Peqx2xRHx4yzZASwB1Xxn4VmpMG8oza6sPsciLZX0bZ05A4OJyoKe+jQEkGRrB0i+eJqZAK58VEY/2STXCzXlw06R7Er5dkVK1IWFVkjTJvkwzqNpd8vsNEBqTgbwAQx1R33XZDPkQ1cFkwNlqTMrhASxVM8KGrVetzSljnEYqSAcWKn3ypnXCDWNrpg0hlkk1l3vCRVU0BkDJ2I59RnGxcbcEAqIT3u4aQbVla+fFkoCDXXkPRcR4OB543c2tTm9Mm+E5j4jZFw9UCDGWb0yGmp/IYxuHRiHmDba2U4paz71JjTkg/vW+wVCfi65En/q6+W4vj5M+WdySieb49P4Q9FOL3DYYIy4waSWLSUaYP1xLnRe4y/ilc9Uh7mX1oKnLmpM8C23erjn/vcSnnsVy/cdf9b7kz7L8F7vMmnUr83w5NA9efrrPdI+IKp7mzbqHlK50RjfvhB/PYTbWqvburRL1W5L6TCb1WlXbq4cDBMC1WZjCwbjajlBQ7FwPz+A+/PbbyKvnCEaftOHSijg5bbBAyOaWsWj1ge28K
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(230273577357003)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VkxHUjNjWG12eUx6NVZwTjdsVmtTb3dUaUMvTEY1M2JCeHY0eXZ5YlRaK1ow?=
 =?utf-8?B?WFhueGQwWEVYNHlCUGw3TnRhR2JtZ2xScG9IakpMejNUQ2lWSVNtKy9QYnFW?=
 =?utf-8?B?UTA4anZ3L3V3aHBiNFdFcmREZXhLUnpGbTgyMHVWdFVUaXV2b3ZRalFVZTlo?=
 =?utf-8?B?SE9hV0htRVpMblVsYnJ3SFM0UDlhbDN5cmE1Z2hWNUZkK1F4cTlTU1hWa1JN?=
 =?utf-8?B?eVJJeVNkMzlsQTVkVXRMMURMU1VKb2I5NzI3dkNoemNpbVZCM0tjdWk0b2g5?=
 =?utf-8?B?bDhKNndjUDU4N01yb1BJWEgwNGhtbGtBMkZybXMwNGpxRmc5ZEpvWXRibVJ2?=
 =?utf-8?B?cWg1M3hCWkJpbGdIeWlPVnZXSXN2OVB0SEd6L1NHYzZRcWJGeGtSNlpFMm04?=
 =?utf-8?B?T3pDNjFWeFlmL1dwanN4ckowclNYeUdGdTVlV2pya0FqREVVSm9BelVsZkRn?=
 =?utf-8?B?eUJ0NS9ZNFZvUytZZy9UaFgwWkZ5dGlyV2lyQ21jSFBXTHloT2VHRXo3Tk1X?=
 =?utf-8?B?Z0lQZjZFbVpPeUVIZGF1Wk4vRTRaODJnUlZvbk1ZK1RuTnBxZEdjRGludEtt?=
 =?utf-8?B?YkFNNXhqQjVXemFhbzh2VnBKTm9RMVkzYTY3K21weHY5NWx0RWdQbWExSmhM?=
 =?utf-8?B?R2tVTTFsSkdIMXBRNWVGbkhXSHBUYWFXdFJsc2ZVYU5qekZtN3FIcXpPT2px?=
 =?utf-8?B?N1B1b0VocTFnRnRiK2Y0ZFhlZnUxZElGMThZWGxLajB4VC9LLy9WbjJuYTM2?=
 =?utf-8?B?K2tsUlNFb1BtdGd0bzZJdDQ4elVpY041WGVCSmhXc2g3Z3Rta1hYZzdidDRS?=
 =?utf-8?B?VHpMWThWYnJWbVJjRVVOMFdLa1NnN1J6cElFVThacG9FL1RaUG5tQmZhNU5h?=
 =?utf-8?B?M0x5SHhRRlhtalZFaDhIc2tTVG1DZVYvZHBJQ2lXTGlLeHZkcldFUjMvaWgz?=
 =?utf-8?B?Yk1rTnVTTGV4MGlad1hFNmJiZDV0dmY0eTBJa051SlMvZUNWVkhQWnAvbWp4?=
 =?utf-8?B?Nk5zVUlvTnFIRUdoYkFrVFlKY0NETVJTSFJaaHpoN1I1Yi9aQ1BGR0ZkMndH?=
 =?utf-8?B?R01PZWRURnJFUEY4cXlWLzNhK24wcnNlZHBVdnd6dWE1Q2JJTmdjc05WOGx5?=
 =?utf-8?B?RUpQNjRNOWM2TU5IbnM2bTltYUhwTW9jb0hjYk1sb0xjUXNiQWRVTVRqTGJ2?=
 =?utf-8?B?T3I0ZVRFMXpaZEQxd0hhdlNHRWxQNUYvcFJuVHdDcFBsRXdZVEhIZGZMeE5n?=
 =?utf-8?B?cGtSKzlhTlREOTVyVzR4aWtNUDJpdnJRaDVqOFltSzZvWlFxMDcrWWJJSHVW?=
 =?utf-8?B?Z0N1THpaME9yZ05YWW8wZU1ycW1wL1VzYkM1WnVIa2tnVFZjME54V1RDU2w0?=
 =?utf-8?B?V1pIcWdiR0ZROU5SZkhnRzdLcjNCVFIyRkZUUHAyQWpZM3JQVU9adWZCbVJy?=
 =?utf-8?B?UEpTUjYwTTUzZzdhUXlsMERROWd5QUZTS0FIcExJT0F5NUtHWDBocWt2ZVVq?=
 =?utf-8?B?ektkc3ltNkhPOHdVTTdPU012RlRqcUFMaGtuN3htQWlrTmNXcUQxa0NPL3lD?=
 =?utf-8?B?MHF5bjlRcWpEUEp5SnZDZHNwa1M0ei9JNXVhbUJKZEVGVlQyUjltVzc0VjJ2?=
 =?utf-8?B?aVU4eU8yemFFam5FVmIwM25kTE1nN1FxeVBTbldTdkg0cFhnSlBmMkNoREd5?=
 =?utf-8?B?OEtvUzhaUTVqQXpvTy8ycy9VeGJxSFFoU0RZY1pxSHBzR0NuMi9NQmZkYnUr?=
 =?utf-8?B?Ym91aGQyS3dhOS9wMEN5NVFLTElpOExXRDFWL2lESFBUTm9xenQzSWpORUJm?=
 =?utf-8?B?ajFReENYV0hVNHcvaTlFcE96Ly9hNUR1ZEhDMWZ2dTZzV3dxSStFWEhuQlJF?=
 =?utf-8?B?KzBkeUV5c3FhU1B3N0czaldDMmh1SHEvcm12SXM1U25wVDZ2SlBGZFUvdGk1?=
 =?utf-8?B?ekpkeFJLY0p6K3ZOcG5NdHJDWGd6VVBCdERpeGtQakNveGJHUlVheUdsZS9i?=
 =?utf-8?B?ODBqWFdOR2JlNHNNSUtHc1VxMk1sMnA4d2E5QzI1STl6QllTbW40TTJLSlhR?=
 =?utf-8?B?dVlQS0hVelVpdTVod0duRG13UFpZd0kwRlBZeDUvWEJCZ3Facy9RdmRuYVF6?=
 =?utf-8?Q?k1VVS0MmKfht1O48QVPqWbjPr?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <83BEF52F52A7C248A7231BC4909EF316@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c141a5c8-e515-4569-678a-08dc31ee3788
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Feb 2024 08:30:38.2985 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VfoaLx3MUTqOulgZWsMOXsOkQsJGuMFnkqBhtoyff8J6/MAB9IzpC7EebIPj2k8Ks6Alub0GBS5x7X67WvQTQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5812
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

SGkgTGVlLA0KDQpPbiAyMC8wMi8yNCAxOjUwIHBtLCBMZWUgSm9uZXMgd3JvdGU6DQo+IEVYVEVS
TkFMIEVNQUlMOiBEbyBub3QgY2xpY2sgbGlua3Mgb3Igb3BlbiBhdHRhY2htZW50cyB1bmxlc3Mg
eW91IGtub3cgdGhlIGNvbnRlbnQgaXMgc2FmZQ0KPiANCj4gT24gVHVlLCAyMCBGZWIgMjAyNCwg
RGhhcm1hLkJAbWljcm9jaGlwLmNvbSB3cm90ZToNCj4gDQo+PiBIaSBLcnp5c3p0b2YsDQo+Pg0K
Pj4gT24gMTIvMDIvMjQgMzo1MyBwbSwgS3J6eXN6dG9mIEtvemxvd3NraSB3cm90ZToNCj4+PiBF
WFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5s
ZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4+Pg0KPj4+IE9uIDA4LzAyLzIwMjQg
MTE6NDMsIExlZSBKb25lcyB3cm90ZToNCj4+Pj4gT24gRnJpLCAwMiBGZWIgMjAyNCAwNTo0Nzoz
MyArMDUzMCwgRGhhcm1hIEJhbGFzdWJpcmFtYW5pIHdyb3RlOg0KPj4+Pj4gQ29udmVydCB0aGUg
YXRtZWwsaGxjZGMgYmluZGluZyB0byBEVCBzY2hlbWEgZm9ybWF0Lg0KPj4+Pj4NCj4+Pj4+IEFs
aWduIGNsb2NrcyBhbmQgY2xvY2stbmFtZXMgcHJvcGVydGllcyB0byBjbGVhcmx5IGluZGljYXRl
IHRoYXQgdGhlIExDRA0KPj4+Pj4gY29udHJvbGxlciBleHBlY3RzIGx2ZHNfcGxsX2NsayB3aGVu
IGludGVyZmFjZWQgd2l0aCB0aGUgbHZkcyBkaXNwbGF5LiBUaGlzDQo+Pj4+PiBhbGlnbm1lbnQg
d2l0aCB0aGUgc3BlY2lmaWMgaGFyZHdhcmUgcmVxdWlyZW1lbnRzIGVuc3VyZXMgYWNjdXJhdGUg
ZGV2aWNlIHRyZWUNCj4+Pj4+IGNvbmZpZ3VyYXRpb24gZm9yIHN5c3RlbXMgdXRpbGl6aW5nIHRo
ZSBITENEQyBJUC4NCj4+Pj4+DQo+Pj4+PiBbLi4uXQ0KPj4+Pg0KPj4+PiBBcHBsaWVkLCB0aGFu
a3MhDQo+Pj4+DQo+Pj4+IFszLzNdIGR0LWJpbmRpbmdzOiBtZmQ6IGF0bWVsLGhsY2RjOiBDb252
ZXJ0IHRvIERUIHNjaGVtYSBmb3JtYXQNCj4+Pj4gICAgICAgICBjb21taXQ6IGNiOTQ2ZGIxMzM1
YjU5OWVjZTM2M2QzMzk2NmJmNjUzZWQwZmE1OGENCj4+Pj4NCj4+Pg0KPj4+IE5leHQgaXMgc3Rp
bGwgZmFpbGluZy4NCj4+Pg0KPj4+IERoYXJtYSwNCj4+PiBZb3UgbXVzdCBleHBsYWluIGFuZCBj
bGVhcmx5IG1hcmsgZGVwZW5kZW5jaWVzIGJldHdlZW4gcGF0Y2hlcy4NCj4+DQo+PiBJIHNpbmNl
cmVseSBhcG9sb2dpemUgZm9yIGFueSBjb25mdXNpb24gY2F1c2VkIGJ5IHRoZSBvdmVyc2lnaHQu
IEkgaGF2ZQ0KPj4gb3JnYW5pemVkIHRoZSBwYXRjaGVzIGFjY29yZGluZyB0byB0aGVpciBkZXBl
bmRlbmNpZXMgaW4gdGhlIHBhdGNoDQo+PiBzZXJpZXMsIGJ1dCB1bmZvcnR1bmF0ZWx5LCBJIG5l
Z2xlY3RlZCB0byBleHBsaWNpdGx5IG1lbnRpb24gdGhlc2UNCj4+IGRlcGVuZGVuY2llcy4gSSB1
bmRlcnN0YW5kIHRoZSBpbXBvcnRhbmNlIG9mIGNsZWFyIGNvbW11bmljYXRpb24gaW4gb3VyDQo+
PiBjb2xsYWJvcmF0aXZlIGVmZm9ydHMuIFBsZWFzZSBmZWVsIGZyZWUgdG8gcHJvdmlkZSBndWlk
YW5jZSBvbiBob3cgSSBjYW4NCj4+IGFzc2lzdCB5b3UgZnVydGhlciBpbiByZXNvbHZpbmcgdGhp
cyBtYXR0ZXIuDQo+IA0KPiBJZiB0aGlzIGNvbnRpbnVlcyB0byBiZSBhbiBpc3N1ZSwgSSBjYW4g
anVzdCByZW1vdmUgdGhlIGNvbW1pdC4NCg0KVGhlcmUgd29uJ3QgYmUgYW55IGlzc3VlIGlmIGJv
dGggcHdtIGFuZCBkaXNwbGF5IGJpbmRpbmcgZ29lcyBiZWZvcmUgdGhlIA0KbWZkIGJpbmRpbmcu
DQoNCkNvdWxkIHlvdSBwbGVhc2UgcGljayB0aGUgZGlzcGxheSBiaW5kaW5nIGFzIHdlbGw/DQoN
Cj4gDQo+IC0tDQo+IExlZSBKb25lcyBb5p2O55C85pavXQ0KDQotLSANCldpdGggQmVzdCBSZWdh
cmRzLA0KRGhhcm1hIEIuDQoNCg==
