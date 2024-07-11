Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE45392E252
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jul 2024 10:31:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AEB110E99F;
	Thu, 11 Jul 2024 08:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="LFam8L6m";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="Rrvg+kOL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3D6D10E208
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jul 2024 08:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1720686676; x=1752222676;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=RMtFD8SEUezDxCzPFk9lrE6a48vxYvQTfsU5aZ4FFfU=;
 b=LFam8L6m05wF0u9dcSiydUmSgi0drU0dtKi6h6eEnvdOOlMVDIEDi2qI
 Y1gk1gKy3YF4C6C3LavQaoD66yKf8A9780fUbLjr53fklmcwkBIRXJSai
 x6yaNDBSZGjJRtj0km+30WbkxvQKiBQzyNFeKN0uLa/1hyo8f1GCT/lBO
 LyZmPlQ4IPOlsb0Fc3RPiDkpFo4AMapN6aWOTB8Xhds46eiynoyKffFud
 Fzkr3Bm5j8/rrZ580EQigm85Gxyg9TA10XzgTE7+KpkYqAPg7tZp6WxOC
 daT0e+8EZPqeRsjiAXR12Qxzescem+xZ01TRTAC4nK0pJ22QwEFC47Cm8 A==;
X-CSE-ConnectionGUID: eqGY7q4kQZSQTfpmPXMLGg==
X-CSE-MsgGUID: mTDCOrjPSti070ns3LyU3g==
X-IronPort-AV: E=Sophos;i="6.09,199,1716274800"; d="scan'208";a="29749985"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 11 Jul 2024 01:31:15 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 11 Jul 2024 01:30:58 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 11 Jul 2024 01:30:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nrZKEtE1jyclxd0WwB7AiQ980k5CZJLiUPbQZfu/yJ8hR9nd+wGyxMC05I91cvUeMF1QI97dpL854MH/KdpSM0k6k4h4Q2NyCcyvBsV63AaiBBhAlstnqLmJaLGw5zwSWqiGtwXvCCS2SxJDjxHa/q6OMLPkAlrOjzrYuroSiyCrxnFr6rXplhaesa8++7pMbmjICCUe5gCed5uqSmwL+z73DDQCMZyB2m/MhoaRknUWOCqhr6wS+Thilj8y3PY1u9Ka2F26D+9B2cUX0hjPeHeHy7Y6/JTQhwg0PDppM2i+YiJU8elw417qywFmX3UN0aC1DoqW/Rc3mcLMhjYjlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RMtFD8SEUezDxCzPFk9lrE6a48vxYvQTfsU5aZ4FFfU=;
 b=mJR7p2yC+OVvvKG459AeZD8TId3E+fABXDBZl9M3t/U1lXIPO1OdjyNDJVcAU247cd6xh7wprkQTRsz3g1T7Nw4A/uDuXpf17VbVVw+zybyyvaaerBUEBNToD4JdC/NIwgIV66njLUkIyryh/40aV6CKeklF/NHDcJUY6UpeIzYZmtMCkuHcATkJTYjWU0W+3Tg62BJnnKRS7omC/tYAFwPA/wBwPxl0EcKmHRMP70Zd2gFnOMZAWd9mKl9b6SUHLY2anrUGnQ2WfeEHfjlBMQZTBHVFMQgiumylebuZ7sx3BH4Jr/AWzRYDfNqqAn4v3v05YsA0uzikJfbyohlqDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RMtFD8SEUezDxCzPFk9lrE6a48vxYvQTfsU5aZ4FFfU=;
 b=Rrvg+kOLUSkAnJWB7owhmdIRLukqt6vlpeZMSyXkCyXxMUBrK1vaVF9fmhek7uyQBs+RDq5mA5+mwPXWRF7KH62U4i7c0AF14divCD7XDrMeyPUtNt2FG1FXK9REvYmM9kO7pkPGEravrXzqrLdXRlekv/CtRq8KI1l9CWBz0TFrQfE+0I/vrqIWgN4QP9fYQW4K1W6et/3i61hl4deicjS7rQ4bDqPj8x3k6lfAURyjdNN0aHM0YH+HScRMuLXgY9rt5Mo6ejVDO8FlOpxLkZ4d6spaVFs+rypiGOdt8DKQqmIlwyo0vTMAQUVbq+507vryONwHBZce+hNpONSwXw==
Received: from PH8PR11MB6609.namprd11.prod.outlook.com (2603:10b6:510:1cc::16)
 by IA0PR11MB7212.namprd11.prod.outlook.com (2603:10b6:208:43e::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Thu, 11 Jul
 2024 08:30:56 +0000
Received: from PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d]) by PH8PR11MB6609.namprd11.prod.outlook.com
 ([fe80::ebc1:5d63:a07c:60d%4]) with mapi id 15.20.7741.033; Thu, 11 Jul 2024
 08:30:55 +0000
From: <Manikandan.M@microchip.com>
To: <krzk@kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <andrzej.hajda@intel.com>,
 <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
 <Laurent.pinchart@ideasonboard.com>, <jonas@kwiboo.se>,
 <jernej.skrabec@gmail.com>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
 <conor+dt@kernel.org>, <linux@armlinux.org.uk>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <arnd@arndb.de>, <Jason@zx2c4.com>,
 <palmer@rivosinc.com>, <mpe@ellerman.id.au>, <rdunlap@infradead.org>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 2/4] drm/bridge: add Microchip DSI controller support for
 sam9x7 SoC series
Thread-Topic: [PATCH 2/4] drm/bridge: add Microchip DSI controller support for
 sam9x7 SoC series
Thread-Index: AQHaze8SbLT0DLpvz0KnSuQXRfjkibHmZhYAgArXVIA=
Date: Thu, 11 Jul 2024 08:30:55 +0000
Message-ID: <aeaeb5d4-5e55-4a7a-bce7-fa207ebf0616@microchip.com>
References: <20240704084837.168075-1-manikandan.m@microchip.com>
 <20240704084837.168075-3-manikandan.m@microchip.com>
 <9ef5a1ba-e404-46e0-8513-5fffbfb5618b@kernel.org>
In-Reply-To: <9ef5a1ba-e404-46e0-8513-5fffbfb5618b@kernel.org>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH8PR11MB6609:EE_|IA0PR11MB7212:EE_
x-ms-office365-filtering-correlation-id: df32e4d6-6f4b-4056-8acf-08dca183c899
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|38070700018; 
x-microsoft-antispam-message-info: =?utf-8?B?TEdOdVZPTk8xSHhVbEVrTzhocTJCeDRGNUtaSEdHT3ZlOFB3V09WdGpJY0dI?=
 =?utf-8?B?bGtDWG42ejUvZHZKUlpQTENwbnpVamZuVDZQUU1UejVlSUNWVExnRndxcDJI?=
 =?utf-8?B?WFVLMXlHaXg5U0NJN0ZyMWJqWXdzK2txaWlXMXhJdnR0UXczMVpreExqa1By?=
 =?utf-8?B?WVE2eS9rZVRTNlBQdlVVNEJ1RTRYSFg5RFp5K2VvMm8zcmlSRCtaaUs2L3Y0?=
 =?utf-8?B?ZWJaWk1TWCtIWkxJZnBKOHN5ZHhnNC9JN0w3SW84a2crN3hxelJNQzJ4eXdy?=
 =?utf-8?B?TUx0SjI1ODN2UG05OUhxeHMycFhaUlBmN3BxWk5XYy9sZ0g3bmVpTUpZeWxn?=
 =?utf-8?B?T0FBRkREYUlybzh2a2M3ZkVVZHZaNG1Vb3lERWw5MDVuVzAvcVZ2cmFJbUhJ?=
 =?utf-8?B?SGFvazRBMXQzTCtVN0tVWDRaY3dkdnNxb3JYTUlselphdWh6d0FjTENodUtW?=
 =?utf-8?B?Z3NjM2hvWGVzazQ5YVhKOU4wNVdkU3FnNi93dDVtTExJSi9DOVN3dUpFcnVs?=
 =?utf-8?B?VGQrYi9ReW1Ba1gvUGIyQytPODBYSVFPaEJTR3FpZVAwMFA3WnRuVjIwd0t6?=
 =?utf-8?B?dlFPOVdrRXlCd0ExSno3NXBzUk02dk5Vam4vM0J3eHd0V3ZZRlFrQ2JwdkNw?=
 =?utf-8?B?ZFZ6RnpONWNSZGRiZXNLQmUwaGVwZnR4cElTcjFQbnpMb09BODFNSFRaSTI5?=
 =?utf-8?B?MnlrbTk5ZWRwSGl4TkxtUVlXOEtSRGh4eTYzeDhHSi9xWlFvSjA4ZEI2YVRF?=
 =?utf-8?B?M25FQWh0anA1Q0REQTUydDNBNFJST1R4U2RlT3YwcmZDWFJYOGJpRGtDUXhj?=
 =?utf-8?B?SVVDK1U1RGJUTkZ3bG5KSkdVRnNKMUozb3ZCbVFkRmZzSFhLRVE0dE0vM2Yv?=
 =?utf-8?B?b2RMUi8zTzR6S25TUUVlYjhuc0hmTFFmS1psVm9HY1QyOG1jOS9BdlgvWXp2?=
 =?utf-8?B?OGE3SEVNc0lpSEZYY0hkYmYvdDJkSUQ1Y20xaFJ3R0dGK1VrUmh1YmpzR2Ry?=
 =?utf-8?B?V0UrcTgvbUtRWVg0Y2FuMGlrWUVuU2RMUFVtYVF4RnNDK1d6YVM1ckdwa3N5?=
 =?utf-8?B?NExwR29vVHJTY2RtcU5zVE5tQk9KNXMrQ01neU9HWGJMOW81K1FGQVFVNU1E?=
 =?utf-8?B?eXZJTWRiQzhjY3RaaWtvM25NRStIWit4WVBVRVlNQk0xYmZaTWZubUVPOFln?=
 =?utf-8?B?L0pXcU1NWUpaNi93Z2NwS2EzQ2ZUaUpjVTJDQlpZUHg5Q29pcXNWZmxVRzhC?=
 =?utf-8?B?bXh1aTh1c21BaUZVRlcyNmFCa3NFREtwY0J4dVdnbkF0a3JLUTZXNHhUM1dx?=
 =?utf-8?B?UVV5K21sRVVvMkhpbStzb2lqNDJnTk4vZ1JqWGJ3UG1MKy8zaTJsUkQ2VW5Y?=
 =?utf-8?B?TmRhVkd4QTV6cGZFMWtkWlVIVlB6azZrOVB0ZEdpQnE3bm15QnlTS0ZLLyt5?=
 =?utf-8?B?c0s1QjExL0xWdUVXcXh0dUpQTFNxZjFDcmNMVHgzcS9YMXlzU0JscXJ0WmIw?=
 =?utf-8?B?SW1IVjN6OWFZTVhuNGlFNUFQL0xpQ0ZhMGdwQnlocE1yK3IwN29YaGNhU0dn?=
 =?utf-8?B?QVNRQ1pvNjBmVUtSVk0rMUVyMmw4ZU1QWjdjdTVodGpHTkdkNzNOYWtYK2to?=
 =?utf-8?B?SXltclFhWFhHbmJjWVJYK0RueHVXWFR6SG4vUHl3MFYvY200alVvT29VRjV0?=
 =?utf-8?B?bmQ1VFJqNlQwKzJtdU1ueVd1ek9kT3QvUUVmdjIzZzliTGJaUi9WNW1qOVRV?=
 =?utf-8?B?TURYbkJLRG1OWUF0dmVwV0Q4aEhMeUxlSEdrZTJkWVlnVENmL1dsYTkycmFN?=
 =?utf-8?B?Q2orU2hSU1N0VFFnTVdSVFFwNnFrUGZFZEk5TlFIOFpya05oT3R3RmhTclAz?=
 =?utf-8?B?K1ZUM1lSV3ZMWHM4aUdkQ2E3S3BuRklvL0hFSG8wdkNWVUE9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6609.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(38070700018); DIR:OUT;
 SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TXYwUG9RRUtodlNoZDE5K29XUHUxY0hFWTZPN1gyVFQ3MTVaamVqWWZlc0R3?=
 =?utf-8?B?Ly9ab3lyN0dBVUNOMXVaWFZKUEQ4SEoxY29NWWl4TFY1UFl3R21YLy8ycldF?=
 =?utf-8?B?eWpJUzBDVGs2RHZLd0RhNUxzZlRHNjR0L3hueUpPU25qc1F5OEdDN3phQVc3?=
 =?utf-8?B?SEN3cEVTTTd6U052c0FLQURCaW9yY3ZadmZzRTlmVEFneEVNbEJmQnFQTG5a?=
 =?utf-8?B?OW5XMUcxdllCTlZLOEE5Mmc5MVRrRE5CUUVObFFFQktwMVZNbUwzMnpReE1L?=
 =?utf-8?B?OGZHanRJdjVRditHbkVxa0JQcHUxNWlQME9MMmE5ckYyZ3k3N3dhL3ZhSjZH?=
 =?utf-8?B?UDhvWEVRVGNYbGMwRnN5R3ZPZ1NWZ010NTE2bm9YLzNXUDVrR0FVZXcydzJ5?=
 =?utf-8?B?M0UyWjA5ODdtTVdLeW45VmlzanN3V21idTZ2TWxGTDNvR2llZHFqWFFWNGRh?=
 =?utf-8?B?VVF6K0NPRytwQThZVjJVVFpKTEdWdjBNcGJVOVd3WmFPbVYzRnpGeTBMZ1Ay?=
 =?utf-8?B?Y1lPcVpnZzViYzk2Z1F6NklkczJlWFV6ekJHaVZBaDFLdlNpY29EU25ET1JF?=
 =?utf-8?B?K3AzQ0hIQVBXWG1IYmNHcjNKMmprNzNkaCthSWhncjI1ZlJVMHZhSlNkeU1B?=
 =?utf-8?B?d2hjMlhLL1k2N3YxREUzMnZwTy9IS1hLVDIyOXdISnRNWXFmWUo5ZnFzdnJX?=
 =?utf-8?B?SlRjd3h1dmRLVEFaYW1qL0ZNcE5DeFRWQnc1STVrQy8xMTh3eEVCdEJueTVk?=
 =?utf-8?B?Tlg4RlBtSzdGbUtCM0w2ZWRWd3FwQTlNZWZpTjc0LytxWFAzYWZERjQ0Y3Jt?=
 =?utf-8?B?UzIxVE8xeHNIUkNKVEorNTRvcUNWK2FRQUJDL2xpdGc2Ynl3S2hmM0k5RE9Z?=
 =?utf-8?B?V1BtUGNlb0Z4ZTU0RzQ1Rk9TZ2FyVmNZSWVmZ1dTR3Q0Q3JJTXdOZjNlVnNk?=
 =?utf-8?B?MU5XWk5JZ2w0R0djN0hYWXJVbjJtZm54MWlUQzBtZzFCUmwrYVY2ZUptUW9E?=
 =?utf-8?B?SThQMllOTXduZ3NMQlNYSXVqSFFuOVdodUZGaTFmc05ST1hHQjZEME9Od2I0?=
 =?utf-8?B?eUF3bzRNTGl6MDYrQWFzcEdTcmNMMzBHbUEvdVZ4bTJpc3BLYTBJODZvUlZj?=
 =?utf-8?B?a0dYLzRHRW4zakJiVGsrYTNvMTA4TlRwVm1MRUdZV2RqR3Zqc1hjVHp5VzJz?=
 =?utf-8?B?b0pWVE5STUFVSWJqcVdJV2EzNXJFNTlnMzJFOGR0cDk2RkpOTEVrZXJEdEV2?=
 =?utf-8?B?RlZadWJ2cm5CWmhmUy9EQS9xY0lVSVR6OXRTc2J6V3JHR3MybXppZEZNV2Ur?=
 =?utf-8?B?U25iK2VhbUFQcGFyQ294NjRleGljZ1VqZWwxWkFyblVGcHNRZlBQM3oyaTE0?=
 =?utf-8?B?NDRaUkdBUEh0NUhxL3ExTHVoQkVyM1M5NWlNSkFrMTUvMDZwOGJDdmlRbi91?=
 =?utf-8?B?UXBJSndFMm9sQlFWd0gzb0dDTkI4UDN6OGw0UDNVanRGU2FBWWFxbEJ3MEd1?=
 =?utf-8?B?dkM2VkltNjhrSEMyK2N5NVN6WSs3ZlBmQ29xNjFzS2QrMXVFaW1sU3J2ZWRz?=
 =?utf-8?B?QVJUb2ZLN2RhdEo4K2xrUm14dXhwU2JKZW40L2l6YXBsQ2lsdEw0ZHVJMHEv?=
 =?utf-8?B?NjZ2aXJCaHRrUWZIKzlUQ3MxcFZFcFpOQk1kSlEzaDZZYjl5SjRZc1huNFgw?=
 =?utf-8?B?ZlF0SnQrTFBDaE9oTFhvYVZScXhCeStTOGZnaURUb1lyUTNrMXNKdWhkRGRx?=
 =?utf-8?B?YU5tWTBFSzM0Z3BMMGJHUkRPeHlYc1F2T0gyanhvbEZpTkhhTnllTThLVHcx?=
 =?utf-8?B?WmNVejVXYzJaR3kwd285ZDJEeXIwRHdOK1Y5NTQ1NjhMMWdUZjlMdnNJTk51?=
 =?utf-8?B?MisxeEptdGFFVjhla0tUdjg4cjEydFVjWnRKMVpZQWxWNVZucmpvRGN0dUx1?=
 =?utf-8?B?NmJJN2grTkZsbEx1MUFIbExBVW5XaytGaEplbU1scDlxZEFIcS9yRm1MT1Bv?=
 =?utf-8?B?eldrVzIzK3JiTG1OM0ZRL2ZiZ1FlakozWk95T1V5bmNEZ1ZEZDViT2dLd2Iz?=
 =?utf-8?B?M3M1TFkvYU9CYm0vWXNabDhnN1FhYlgvMWtjbmY2YkJqRW45blhNcWJaMzhw?=
 =?utf-8?Q?x46IBDcGRB85SOwz2t1vLKo7Y?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <4746BD789565A348A48A74ADD9A5DACF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6609.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df32e4d6-6f4b-4056-8acf-08dca183c899
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Jul 2024 08:30:55.7961 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: q1wsTe6BeEJpQ4KehvOXEIoiYrQVr9r3PETmM0b+tyuQJPFp+QlMqpSRIG/cG1S7n7yCKfBez+ffrM5T7JPwJzjyXh2PmRb/Upz+JiiDmcc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7212
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

SGkgS3J6eXN6dG9mLA0KDQpPbiAwNC8wNy8yNCA0OjI3IHBtLCBLcnp5c3p0b2YgS296bG93c2tp
IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0
YWNobWVudHMgdW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IE9uIDA0
LzA3LzIwMjQgMTA6NDgsIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOg0KPj4gQWRkIHRo
ZSBNaWNyb2NoaXAncyBEU0kgY29udHJvbGxlciB3cmFwcGVyIGRyaXZlciB0aGF0IHVzZXMNCj4+
IHRoZSBTeW5vcHN5cyBEZXNpZ25XYXJlIE1JUEkgRFNJIGhvc3QgY29udHJvbGxlciBicmlkZ2Uu
DQo+Pg0KPj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRhbiBNdXJhbGlkaGFyYW4gPG1hbmlrYW5k
YW4ubUBtaWNyb2NoaXAuY29tPg0KPj4gLS0tDQo+IA0KPiANCj4gLi4uDQo+IA0KPj4gKw0KPj4g
KyNkZWZpbmUgSFNUVChfbWF4ZnJlcSwgX2NfbHAyaHMsIF9jX2hzMmxwLCBfZF9scDJocywgX2Rf
aHMybHApICAgICAgIFwNCj4+ICt7ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
XA0KPj4gKyAgICAgLm1heGZyZXEgPSBfbWF4ZnJlcSwgICAgICAgICAgICBcDQo+PiArICAgICAu
dGltaW5nID0geyAgICAgICAgICAgICAgICAgICAgIFwNCj4+ICsgICAgICAgICAgICAgLmNsa19s
cDJocyA9IF9jX2xwMmhzLCAgXA0KPj4gKyAgICAgICAgICAgICAuY2xrX2hzMmxwID0gX2NfaHMy
bHAsICBcDQo+PiArICAgICAgICAgICAgIC5kYXRhX2xwMmhzID0gX2RfbHAyaHMsIFwNCj4+ICsg
ICAgICAgICAgICAgLmRhdGFfaHMybHAgPSBfZF9oczJscCwgXA0KPj4gKyAgICAgfSAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBcDQo+PiArfQ0KPj4gKw0KPj4gK3N0cnVjdCBoc3R0IGhz
dHRfdGFibGVbXSA9IHsNCj4gDQo+IFNvIG1vcmUgZ2xvYmFscz8gTm8uDQoNCkluIHRoZSBzYW05
eDcgZGF0YXNoZWV0LCB0aGUgaGlnaCBzcGVlZCB0cmFuc2l0aW9uIHRpbWUgZm9yIGRhdGEgYW5k
DQpjbG9jayBsYW5lIGF0IGRpZmZlcmVudCBmcmVxIGZvciB0aGUgRFNJIGNvbnRyb2xsZXIgcmFu
Z2VzIGFyZSB0YWJ1bGF0ZWQNCndpdGggY29uc3RhbnQgdmFsdWVzLg0KSSByZWZlcnJlZCBvdGhl
ciBzaW1pbGFyIHBsYXRmb3JtcyBmb3IgdGhlIGZ1bmN0aW9uYWxpdHkgYW5kIGZvdW5kIA0Kc2lt
aWxhciB3YXkgb2YgaW1wbGVtZW50YXRpb24sICBvbmx5IGEgZmV3IGhhZCBlcXVhdGlvbnMgdG8g
ZGVyaXZlIHRoZSANCmxvdyBwb3dlciBhbmQgaGlnaCBzcGVlZCB0aW1pbmdzLkkgYW0gbm90IGFi
bGUgdG8gY29tZSB1cCB3aXRoIGEgbW9yZSANCmVmZmljaWVudCBtZXRob2QuIElmIHRoZXJlIGlz
IHNvbWV0aGluZyBJIGFtIG1pc3NpbmcsIHBsZWFzZSBzdWdnZXN0Lg0KVElBDQo+IA0KPj4gKyAg
ICAgSFNUVCg5MCwgIDMyLCAyMCwgIDI2LCAxMyksDQo+PiArICAgICBIU1RUKDEwMCwgIDM1LCAy
MywgIDI4LCAxNCksDQo+PiArICAgICBIU1RUKDExMCwgIDMyLCAyMiwgIDI2LCAxMyksDQo+PiAr
ICAgICBIU1RUKDEzMCwgIDMxLCAyMCwgIDI3LCAxMyksDQo+PiArICAgICBIU1RUKDE0MCwgIDMz
LCAyMiwgIDI2LCAxNCksDQo+PiArICAgICBIU1RUKDE1MCwgIDMzLCAyMSwgIDI2LCAxNCksDQo+
PiArICAgICBIU1RUKDE3MCwgIDMyLCAyMCwgIDI3LCAxMyksDQo+PiArICAgICBIU1RUKDE4MCwg
IDM2LCAyMywgIDMwLCAxNSksDQo+PiArICAgICBIU1RUKDIwMCwgIDQwLCAyMiwgIDMzLCAxNSks
DQo+PiArICAgICBIU1RUKDIyMCwgIDQwLCAyMiwgIDMzLCAxNSksDQo+PiArICAgICBIU1RUKDI0
MCwgIDQ0LCAyNCwgIDM2LCAxNiksDQo+PiArICAgICBIU1RUKDI1MCwgIDQ4LCAyNCwgIDM4LCAx
NyksDQo+PiArICAgICBIU1RUKDI3MCwgIDQ4LCAyNCwgIDM4LCAxNyksDQo+PiArICAgICBIU1RU
KDMwMCwgIDUwLCAyNywgIDQxLCAxOCksDQo+PiArICAgICBIU1RUKDMzMCwgIDU2LCAyOCwgIDQ1
LCAxOCksDQo+PiArICAgICBIU1RUKDM2MCwgIDU5LCAyOCwgIDQ4LCAxOSksDQo+PiArICAgICBI
U1RUKDQwMCwgIDYxLCAzMCwgIDUwLCAyMCksDQo+PiArICAgICBIU1RUKDQ1MCwgIDY3LCAzMSwg
IDU1LCAyMSksDQo+PiArICAgICBIU1RUKDUwMCwgIDczLCAzMSwgIDU5LCAyMiksDQo+PiArICAg
ICBIU1RUKDU1MCwgIDc5LCAzNiwgIDYzLCAyNCksDQo+PiArICAgICBIU1RUKDYwMCwgIDgzLCAz
NywgIDY4LCAyNSksDQo+PiArICAgICBIU1RUKDY1MCwgIDkwLCAzOCwgIDczLCAyNyksDQo+PiAr
ICAgICBIU1RUKDcwMCwgIDk1LCA0MCwgIDc3LCAyOCksDQo+PiArICAgICBIU1RUKDc1MCwgMTAy
LCA0MCwgIDg0LCAyOCksDQo+PiArICAgICBIU1RUKDgwMCwgMTA2LCA0MiwgIDg3LCAzMCksDQo+
PiArICAgICBIU1RUKDg1MCwgMTEzLCA0NCwgIDkzLCAzMSksDQo+PiArICAgICBIU1RUKDkwMCwg
MTE4LCA0NywgIDk4LCAzMiksDQo+PiArICAgICBIU1RUKDk1MCwgMTI0LCA0NywgMTAyLCAzNCks
DQo+PiArICAgICBIU1RUKDEwMDAsIDEzMCwgNDksIDEwNywgMzUpLA0KPj4gK307DQo+PiArDQo+
IA0KPiAuLi4NCj4gDQo+PiArDQo+PiArc3RhdGljIHZvaWQgZHdfbWlwaV9kc2lfbWNocF9wb3dl
cl9vbih2b2lkICpwcml2X2RhdGEpDQo+PiArew0KPj4gKyAgICAgc3RydWN0IGR3X21pcGlfZHNp
X21jaHAgKmRzaSA9IHByaXZfZGF0YTsNCj4+ICsNCj4+ICsgICAgIC8qIEVuYWJsZSB0aGUgRFNJ
IHdyYXBwZXIgKi8NCj4+ICsgICAgIGRzaV93cml0ZShkc2ksIERTSV9QV1JfVVAsIEhPU1RfUFdS
VVApOw0KPj4gK30NCj4+ICsNCj4+ICtzdGF0aWMgdm9pZCBkd19taXBpX2RzaV9tY2hwX3Bvd2Vy
X29mZih2b2lkICpwcml2X2RhdGEpDQo+PiArew0KPj4gKyAgICAgc3RydWN0IGR3X21pcGlfZHNp
X21jaHAgKmRzaSA9IHByaXZfZGF0YTsNCj4+ICsNCj4+ICsgICAgIC8qIERpc2FibGUgdGhlIERT
SSB3cmFwcGVyICovDQo+PiArICAgICBkc2lfd3JpdGUoZHNpLCBEU0lfUFdSX1VQLCBIT1NUX1JF
U0VUKTsNCj4+ICt9DQo+PiArDQo+PiArc3RydWN0IGR3X21pcGlfZHNpX3BoeV9vcHMgZHdfbWlw
aV9kc2lfbWNocF9waHlfb3BzID0gew0KPiANCj4gV2h5IHRoaXMgaXMgbm90IHN0YXRpYz8NCj4g
DQo+IFdoeSB0aGlzIGlzIG5vdCBjb25zdD8NCj4gDQo+PiArICAgICAuaW5pdCA9IGR3X21pcGlf
ZHNpX21jaHBfaW5pdCwNCj4+ICsgICAgIC5wb3dlcl9vbiA9IGR3X21pcGlfZHNpX21jaHBfcG93
ZXJfb24sDQo+PiArICAgICAucG93ZXJfb2ZmID0gZHdfbWlwaV9kc2lfbWNocF9wb3dlcl9vZmYs
DQo+PiArICAgICAuZ2V0X2xhbmVfbWJwcyA9IGR3X21pcGlfZHNpX21jaHBfZ2V0X2xhbmVfbWJw
cywNCj4+ICsgICAgIC5nZXRfdGltaW5nID0gZHdfbWlwaV9kc2lfbWNocF9nZXRfdGltaW5nLA0K
Pj4gK307DQo+PiArDQo+PiArc3RhdGljIGludCBkd19taXBpX2RzaV9tY2hwX3Byb2JlKHN0cnVj
dCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpDQo+PiArew0KPj4gKyAgICAgc3RydWN0IGR3X21pcGlf
ZHNpX21jaHAgKmRzaTsNCj4+ICsgICAgIHN0cnVjdCByZXNvdXJjZSAqcmVzOw0KPj4gKyAgICAg
c3RydWN0IHJlZ21hcCAqc2ZyOw0KPj4gKyAgICAgY29uc3Qgc3RydWN0IGR3X21pcGlfZHNpX21j
aHBfY2hpcF9kYXRhICpjZGF0YTsNCj4+ICsgICAgIGludCByZXQ7DQo+PiArDQo+PiArICAgICBk
c2kgPSBkZXZtX2t6YWxsb2MoJnBkZXYtPmRldiwgc2l6ZW9mKCpkc2kpLCBHRlBfS0VSTkVMKTsN
Cj4+ICsgICAgIGlmICghZHNpKQ0KPj4gKyAgICAgICAgICAgICByZXR1cm4gLUVOT01FTTsNCj4+
ICsNCj4+ICsgICAgIGRzaS0+ZGV2ID0gJnBkZXYtPmRldjsNCj4+ICsgICAgIGNkYXRhID0gb2Zf
ZGV2aWNlX2dldF9tYXRjaF9kYXRhKGRzaS0+ZGV2KTsNCj4+ICsNCj4+ICsgICAgIHJlcyA9IHBs
YXRmb3JtX2dldF9yZXNvdXJjZShwZGV2LCBJT1JFU09VUkNFX01FTSwgMCk7DQo+PiArICAgICBk
c2ktPmJhc2UgPSBkZXZtX2lvcmVtYXBfcmVzb3VyY2UoJnBkZXYtPmRldiwgcmVzKTsNCj4gDQo+
IFRoZXJlIGlzIGEgaGVscGVyIGZvciB0aGVzZSB0d28uDQo+IA0KPj4gKyAgICAgaWYgKElTX0VS
Uihkc2ktPmJhc2UpKSB7DQo+PiArICAgICAgICAgICAgIHJldCA9IFBUUl9FUlIoZHNpLT5iYXNl
KTsNCj4+ICsgICAgICAgICAgICAgZGV2X2Vycihkc2ktPmRldiwgIlVuYWJsZSB0byBnZXQgRFNJ
IEJhc2UgYWRkcmVzczogJWRcbiIsIHJldCk7DQo+IA0KPiByZXR1cm4gZGV2X2Vycl9wcm9iZQ0K
PiANCj4+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsg
ICAgIGRzaS0+cGNsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAicGNsayIpOw0KPj4gKyAg
ICAgaWYgKElTX0VSUihkc2ktPnBjbGspKSB7DQo+PiArICAgICAgICAgICAgIHJldCA9IFBUUl9F
UlIoZHNpLT5wY2xrKTsNCj4+ICsgICAgICAgICAgICAgZGV2X2Vycihkc2ktPmRldiwgIlVuYWJs
ZSB0byBnZXQgcGNsazogJWRcbiIsIHJldCk7DQo+IA0KPiByZXR1cm4gZGV2X2Vycl9wcm9iZQ0K
PiANCj4gWW91IGFyZSB1cHN0cmVhbWluZyBzb21lIG9sZCBjb2RlLCBhcmVuJ3QgeW91Pw0KPiAN
Cj4+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsgICAg
IGRzaS0+cGxscmVmX2NsayA9IGRldm1fY2xrX2dldCgmcGRldi0+ZGV2LCAicmVmY2xrIik7DQo+
PiArICAgICBpZiAoSVNfRVJSKGRzaS0+cGxscmVmX2NsaykpIHsNCj4+ICsgICAgICAgICAgICAg
cmV0ID0gUFRSX0VSUihkc2ktPnBsbHJlZl9jbGspOw0KPj4gKyAgICAgICAgICAgICBkZXZfZXJy
KGRzaS0+ZGV2LCAiVW5hYmxlIHRvIGdldCBEU0kgUEhZIFBMTCByZWZlcmVuY2UgY2xvY2s6ICVk
XG4iLA0KPiANCj4gcmV0dXJuIGRldl9lcnJfcHJvYmUNCj4gDQo+IA0KPj4gKyAgICAgICAgICAg
ICAgICAgICAgIHJldCk7DQo+PiArICAgICAgICAgICAgIHJldHVybiByZXQ7DQo+PiArICAgICB9
DQo+PiArDQo+PiArICAgICBjbGtfc2V0X3JhdGUoZHNpLT5wbGxyZWZfY2xrLCBEU0lfUExMX1JF
Rl9DTEspOw0KPj4gKyAgICAgaWYgKGNsa19nZXRfcmF0ZShkc2ktPnBsbHJlZl9jbGspICE9IERT
SV9QTExfUkVGX0NMSykgew0KPj4gKyAgICAgICAgICAgICBkZXZfZXJyKGRzaS0+ZGV2LCAiRmFp
bGVkIHRvIHNldCBEU0kgUEhZIFBMTCByZWZlcmVuY2UgY2xvY2tcbiIpOw0KPj4gKyAgICAgICAg
ICAgICByZXR1cm4gLUVJTlZBTDsNCj4+ICsgICAgIH0NCj4+ICsNCj4+ICsgICAgIHJldCA9IGNs
a19wcmVwYXJlX2VuYWJsZShkc2ktPnBsbHJlZl9jbGspOw0KPiANCj4gRW5hYmxlIGNsb2NrIGxh
dGVyLCBzbyB5b3VyIGVycm9yIHBhdGhzIHdpbGwgYmUgc2ltcGxlci4NCj4gDQo+PiArICAgICBp
ZiAocmV0KSB7DQo+PiArICAgICAgICAgICAgIGRldl9lcnIoZHNpLT5kZXYsICJGYWlsZWQgdG8g
ZW5hYmxlIERTSSBQSFkgUExMIHJlZmVyZW5jZSBjbG9jazogJWRcbiIsDQo+PiArICAgICAgICAg
ICAgICAgICAgICAgcmV0KTsNCj4+ICsgICAgICAgICAgICAgcmV0dXJuIHJldDsNCj4+ICsgICAg
IH0NCj4+ICsNCj4+ICsgICAgIHNmciA9IHN5c2Nvbl9yZWdtYXBfbG9va3VwX2J5X3BoYW5kbGUo
cGRldi0+ZGV2Lm9mX25vZGUsICJtaWNyb2NoaXAsc2ZyIik7DQo+PiArICAgICBpZiAoSVNfRVJS
X09SX05VTEwoc2ZyKSkgew0KPiANCj4gTlVMTD8gQ2FuIGl0IGJlIE5VTEw/DQo+IA0KPj4gKyAg
ICAgICAgICAgICByZXQgPSBQVFJfRVJSKHNmcik7DQo+PiArICAgICAgICAgICAgIGRldl9lcnIo
ZHNpLT5kZXYsICJGYWlsZWQgdG8gZ2V0IGhhbmRsZSBvbiBTcGVjaWFsIEZ1bmN0aW9uIFJlZ2lz
dGVyOiAlZFxuIiwNCj4+ICsgICAgICAgICAgICAgICAgICAgICByZXQpOw0KPiANCj4gcmV0ID0g
ZGV2X2Vycl9wcm9iZQ0KPiANCj4+ICsgICAgICAgICAgICAgZ290byBlcnJfZHNpX3Byb2JlOw0K
Pj4gKyAgICAgfQ0KPj4gKyAgICAgLyogU2VsZWN0IERTSSBpbiBTRlIncyBJU1MgQ29uZmlndXJh
dGlvbiBSZWdpc3RlciAqLw0KPj4gKyAgICAgcmV0ID0gcmVnbWFwX3dyaXRlKHNmciwgU0ZSX0lT
U19DRkcsIElTU19DRkdfRFNJX01PREUpOw0KPj4gKyAgICAgaWYgKHJldCkgew0KPj4gKyAgICAg
ICAgICAgICBkZXZfZXJyKGRzaS0+ZGV2LCAiRmFpbGVkIHRvIGVuYWJsZSBEU0kgaW4gU0ZSIElT
UyBjb25maWd1cmF0aW9uIHJlZ2lzdGVyOiAlZFxuIiwNCj4+ICsgICAgICAgICAgICAgICAgICAg
ICByZXQpOw0KPj4gKyAgICAgICAgICAgICBnb3RvIGVycl9kc2lfcHJvYmU7DQo+PiArICAgICB9
DQo+IA0KPiANCj4gDQo+IEJlc3QgcmVnYXJkcywNCj4gS3J6eXN6dG9mDQo+IA0KDQotLSANClRo
YW5rcyBhbmQgUmVnYXJkcywNCk1hbmlrYW5kYW4gTS4NCg0K
