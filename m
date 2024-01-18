Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924FE83156C
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 10:05:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB2C10E6EA;
	Thu, 18 Jan 2024 09:04:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1745410E6EA
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 09:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1705568686; x=1737104686;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Nk4EI2g6hJqRP5MqNjLKzl5L1Ah0qQXPV+4ffJKS2+E=;
 b=eISDIjgvGMwgH93+25aXWEUoPH7hT00MpAzQ/OepBs6+w1WvddEaeC9b
 4/1u60kOs4NFWUhNdYweUWcnQeH8Z9qJlHe02XsZJQKL6fjIW7nJFsJcK
 1635s4aBAbSIknVoSirHaTYPfh6SkwTzW7AwazIusWdTHsK+1yUeuB2+3
 eMj7wLOXCy4pb8MMogHvx7LzcFPyQQpi7tnIjlb9QiluQ3Z1KkyhPtIHV
 CtcdXb3EJJKfK0FS7s5WhVAli/zi8hWRvNCT4pODzyDKKPxx2fSi3tOua
 ykIqUJ/geUBOwmfbmIdeJuLzdb0oI4vlic1GZj1JGBHmZ2P9RHsaLTGiO A==;
X-CSE-ConnectionGUID: pE6smgbOTpSApEgqSGYIMg==
X-CSE-MsgGUID: d4Q9BMRgRECgLiuhJYN/qw==
X-IronPort-AV: E=Sophos;i="6.05,201,1701154800"; d="scan'208";a="14928077"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 18 Jan 2024 02:04:39 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 18 Jan 2024 02:04:33 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 18 Jan 2024 02:04:33 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ltLqASyxTgc6/0Cz7qEa3jf6gLzVAUoGyNApiT/xIUdhjle1TAXzDeSMauCI1uuYddGsqsbeMbDfjrS8yDJm6K+AVbFvkrKvaO0aETbfDR+2jniNVAE+rUYw61F0qMfRue/uc1NE24TWoE8RnefYR03FNrcP7zY4tr5tlyOt476hTvSvsL3aF2guR1IrxpoiLEEsMzg51I1EGgeGstlNj3zFVH2uD265bXHwrunG6/6mB2j00pOCdy9L/WvpmXzXLmf74qkxdmMUo/oFTLPA+T6EAku4lgpVI0AHnhXiASzbQOGcYsGgc8mCVF6y08xGPjg1Wvipm6EA68Cjtm3z8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nk4EI2g6hJqRP5MqNjLKzl5L1Ah0qQXPV+4ffJKS2+E=;
 b=j2Ybi9HJKP/yxLix49TgEBpv574tl8vuQ63jvq/A82WHN6jSuAHSDvPrmIW2FgUfeca4F4CK1p1hN7/e33Y8ZG9agRz42vrwZMtXfrFfOpORww4Q8nd0uM0waX6aM2IdhoH7Cl2TI6drqSmDafs+a1/657nq1cGwwCpYamYvYaVLHFytAtMq/DL1aYUwnsKEkBbzIzyOffRk5N6DIiYXQFlzCPSJK6+ykWrJm84i2jlDglYcQqMkvXelyETa5htO/hYpntASkRkTJlc8rGbMquoo9L0P96ArlQIurnUPPC7BtFsPdm2JP93U/7BHqpy4pm9Up3aiIML4mouxSV2MyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nk4EI2g6hJqRP5MqNjLKzl5L1Ah0qQXPV+4ffJKS2+E=;
 b=IufPdIrYBc7vaClcXw+6XP1t2fe1VJtRIdg4xAiUwkLMRZo0df6hO7XMpFQmxkz45Ac5YqSXAvUqmP+c1DXXMc34umYe+jc8qUNYCisu4J0ftI98aemnYCettTsNBI6y7R45o0E/LN536PbH2IcZ3jN7oQstsDeC+/EflwUgZNrXXzvg3RdRhLSNqjD62t1znTAq4XzHJRzcEp3ukokynGekhyMgCJkhxGRZrLTZREbV3k0o8a18KaijiisJ6+dKZIBKlFyQ2yJoCihNRIbsNGvDt0KiOQMcAKt4UQTd+8IkrSadEsLzH3HGA1+B1+GfAiAV0f/1rH4tg0kCMUzHAw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by PH7PR11MB7451.namprd11.prod.outlook.com (2603:10b6:510:27b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7181.18; Thu, 18 Jan
 2024 09:04:31 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7202.020; Thu, 18 Jan 2024
 09:04:31 +0000
From: <Dharma.B@microchip.com>
To: <conor@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Thread-Topic: [PATCH v2 2/3] dt-bindings: atmel, hlcdc: convert pwm bindings to
 json-schema
Thread-Index: AQHaSHChSEXrKWltNkmrAKNQoZ+LobDcu7GAgAAjowCAAG2OgIAA10aAgAElpwA=
Date: Thu, 18 Jan 2024 09:04:31 +0000
Message-ID: <de2b0787-3e4c-485a-b9c3-b0c3afba3eb4@microchip.com>
References: <20240116113800.82529-1-dharma.b@microchip.com>
 <20240116113800.82529-3-dharma.b@microchip.com>
 <20240116-rising-gap-df4124f191a0@spud> <20240116201052544a0791@mail.local>
 <6124f244-23bc-4b84-b678-f7214cf8c48e@microchip.com>
 <20240117-headlock-edge-56ddb1b273d2@spud>
In-Reply-To: <20240117-headlock-edge-56ddb1b273d2@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|PH7PR11MB7451:EE_
x-ms-office365-filtering-correlation-id: 38fe664c-81f8-4e04-326c-08dc18047b86
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: UnVfJCx7RQkcD2WXAuWxYO2QHykngYUTSZ7OVq/uMFNyYXm9z3fBSjhPUqyMorpH8q+ds36crdVS/2a7JpfxfKR7WhTVziRwtvNXyyseWqQjJbI9XwKnt3kVvnBmLdd705Q3ytuS+xYLYLdjKQx97W5IxdJNSkVdoX5ZklSdOXbgaCI/js4O4q5kYNq5rcQMMOmY2PKKa2cIB7mqT2ZdNd3mjzwq8KoPBbIz82xnhbth8JGVmKmWHeZbleXZo3l/59C66cmL7jUSWA0uzWuI/oVeQ3keOF5rvz7JP3OGb63oFP2JlQGpFJ63Bi1pVOpF5nJTuYnWg1U6KtMeJb6G67PMF0goDv5nK+rNTim6eUw9Kq2Fw1cW79MUyrodpOoV6y7/4b90KC5ZnkSAWvdJHa0q/vmYjc+k01vOUgChiw0U1DgEVRwOK9BQUSLTtYqIZhW210sU0CJaiiRGINpRBFOqKQW5JaqV3DgDIn3iFOFhGvY4T0Z5XH8nduotgjJz/CnVK/KIRQIpbn8VcaQYGByw2BMfEo9s968mpyLaaeHSPTiL3L64dzbXOg4z2+sYk2BkYzJSv9qdH5ZB2EAQZOLL/NRSJF3RUqoWu0pKAmtWndyjyHbyfQPQ1rXuLnpelmS0UF5KjHDYZeKR8VAOVj5DgYGcR00yBkjX7jcaHx99Ea3ody7i2rsqL62gUwab
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(376002)(366004)(136003)(39860400002)(346002)(230922051799003)(230273577357003)(230173577357003)(186009)(1800799012)(451199024)(64100799003)(83380400001)(107886003)(26005)(66446008)(2616005)(54906003)(4326008)(6916009)(91956017)(38100700002)(76116006)(71200400001)(8676002)(316002)(53546011)(64756008)(6486002)(8936002)(41300700001)(478600001)(2906002)(6512007)(36756003)(66476007)(66946007)(7416002)(66556008)(31696002)(86362001)(122000001)(5660300002)(6506007)(38070700009)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SVVnV01GNzltWHRVM1FXeXFDakg0aytUc21DMXhHTnBXdFRMdm15SHB4Y01i?=
 =?utf-8?B?bjFCeTAxbjhLbXo2S0h1ZCtnSFY4NE1JaHhGU25idXFCZ2sxelNmL29Pd01Y?=
 =?utf-8?B?RVlFaWxsRjRHc0ZUb1Rwb0dSaDZEZlNRbTArOWphaTREMEJydUdlK1FIRzhB?=
 =?utf-8?B?K0FWQjdyVW5uaDdtQU5uUjlVT2poUmg3eEFPRW1STFVia2s4RE1JTVVDS2tS?=
 =?utf-8?B?S0Y1c0lCeUZtOXVWandTUDlLUnRXQktua0tPUW9oS1phNUVocE50ZDVibFpJ?=
 =?utf-8?B?WmVFWVNNcVZKenhBbEhWbEY1aWd0TWVSSm5aSDhyS1VLV2tnUEIvVXBtQW1E?=
 =?utf-8?B?UUovQkh1NGlUSXRCa3hucWZ2MnBhZTNLKzVqdGpQRHc4eWlyMlozZmt0UGdl?=
 =?utf-8?B?eFAxTWl4T1d5VEpXSnlObVA2cEVhNUttanozcmdnaEV0K2RsWnBMZ250ZDZO?=
 =?utf-8?B?c2hqenc1a0M5bE9kQ1ZkVzV1aWkwSFBGZnFYQVJmNjRrUHFoTFlDdVRURENs?=
 =?utf-8?B?TTNWQzNWY1g5Y25ZbktCZmZ3NmoyR0Ntd2JFUGxnRjFnWmhHMmxuVzM2b21R?=
 =?utf-8?B?R2ZoOWxYUlkyRkttS3hzWEw3ZlFUTkYyYVJBaXVMeXNtcGNZNnBOb25sV0xu?=
 =?utf-8?B?bjE5Y0YwVmtkZGFTbEFSbFNzMytOaGpIajdyNGdqK21jTzMvdTh1R3dNMmRR?=
 =?utf-8?B?Q0hyUFlDVnA5bkxWMjBQN0l5dlY5MHhSNGZPdHNTZm9hSEx5SjNJRFNuVWZh?=
 =?utf-8?B?Y1JaSittcFJweFBQNjExTHA5VUxoM0xXcFgwRDd2NGpSckMwWkVKNmxtY0JO?=
 =?utf-8?B?V2xUMXdEcXB6MUgxdVRuZDVuNEpvZzR2UHcwOE1mYnRTL0RCWU5UZklMNGhX?=
 =?utf-8?B?eTYwK2ZlK3pJYWVZMHZNWFdRVkZXcFRGRTJxZitQdks2YzQxL2RWeWJSdHJq?=
 =?utf-8?B?bHBzL3BhakJrVWxBRkcyMG5OTUJXcGhqaXhCbGxrdWtiM2RYdHJKRE92YU5o?=
 =?utf-8?B?S0kxVVlVUWFxZWI4eVZrZDRkM2hhaTlrQ2U5bkFxRHlMS3JUbGpMRnA3TjZw?=
 =?utf-8?B?b3ZhTXk1QVJ1Q1NBckk1UXFOM1dESUd6ckdhVGxvNUh1Wk0zRlV4dVZSK29I?=
 =?utf-8?B?U2RLRWdaTE5aR1AwQzYwY2RKTHRNenZXQWp4U1EzMk42OHRXUlhGU0txTi9G?=
 =?utf-8?B?Ri9DVGR4NFZFVnBhYmJmbStWL2VxcC9YWU9KMW1lVjQxeU5YM1ZwRjU3Q0ND?=
 =?utf-8?B?RkJCQVo3R1FlS3Q1SFJ2TkE4M0t4ZUhQMTlvRHR2SFZjQlVZYkt5TzRTMTNx?=
 =?utf-8?B?UnAzaFErOXBQRHdVSmE4aUgxRTVSbXIvK1pwRjJaN2RnaFRTd2FFaWZHTDBQ?=
 =?utf-8?B?c214U3pENGRKakh1OXN4eENBVzM1YlUvTGxvYzRic0RRM2FxV0lKVWM3T3BC?=
 =?utf-8?B?T3ZVYlpsMTNQMWVPWitXdzBRR2VPWU5oeDlZdVlSTlYwc2Y5REN1TjgrY0lw?=
 =?utf-8?B?aVlQZktCV05JbHJRU3h4anZvVDdrWCtTVUxIVFJLdFk2RUhKemYyY1N2Qzc2?=
 =?utf-8?B?UVlOL2ZpaVJmQnVtSXZHZnAreklvbWx1ZGsvRGltZjZ5RytuYWtZc0V3RkZH?=
 =?utf-8?B?K0dic3lIT1YwSDIzSnZERHNXTmhFTy84OElidktiTTFjcWE4Q0VBb0lPSDAx?=
 =?utf-8?B?dmFwR21icW5EbHFEekxTZW1FZmxqTEZQeDc3WnRCZWVHYVFTT2lrWm5MVXRT?=
 =?utf-8?B?UEZaeHBSTHZWWU1NeFV3bXFkVTVmOFJEcmhWMXJXRHI5TEMzekorbXRHckNB?=
 =?utf-8?B?Q1dTNVpPcmZzaElrNjkwbGtRQi9nT0Fsdk1FVFlleHRMUi81SlcrdDFHN1Yz?=
 =?utf-8?B?OUVnUC91SzZBalhBV2ZVRHlWNVdscXRjVmNhRWtMcldyemNaT3RhYzlWVVI5?=
 =?utf-8?B?cmtjek9lOHlNRVBUWnhBME8za05iVS9IUDBMU2tmNXpZTWRjZzQ4ZTcwckRY?=
 =?utf-8?B?YUVRS3J5Nitrb25nYTJ6RERWR0RkallrQVVOU2hqK29SOHlUeGI1TEFsTmZs?=
 =?utf-8?B?eGUzRmV2d3F2SlBRUDhVWHhXa0ViQmZXQktpQzE3NzhFdG1CVTNvMkM5YTdE?=
 =?utf-8?Q?1eZAgROXsI2HQ2HlzsUD7g21C?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BA6D4D6C38766346AF378FFBAB633FF4@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38fe664c-81f8-4e04-326c-08dc18047b86
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jan 2024 09:04:31.0572 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: A/5sY/FBsBixN/jLuHY/F/VpLxZ277V961zSm9wMjv+Ldmlv+i1pVfeEP3nuzOHmTScR5O93a4pdSqxk3DIBjw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7451
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
Cc: alexandre.belloni@bootlin.com, linux-pwm@vger.kernel.org,
 Linux4Microchip@microchip.com, dri-devel@lists.freedesktop.org,
 Nicolas.Ferre@microchip.com, Conor.Dooley@microchip.com,
 thierry.reding@gmail.com, krzysztof.kozlowski+dt@linaro.org,
 claudiu.beznea@tuxon.dev, airlied@gmail.com, sam@ravnborg.org, lee@kernel.org,
 u.kleine-koenig@pengutronix.de, devicetree@vger.kernel.org,
 conor+dt@kernel.org, tzimmermann@suse.de, mripard@kernel.org,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 bbrezillon@kernel.org, linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

T24gMTcvMDEvMjQgOTowMyBwbSwgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiBFWFRFUk5BTCBFTUFJ
TDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMgdW5sZXNzIHlvdSBrbm93
IHRoZSBjb250ZW50IGlzIHNhZmUNCj4gDQo+IA0KPiBGb3J3YXJkZWRNZXNzYWdlLmVtbA0KPiAN
Cj4gU3ViamVjdDoNCj4gUmU6IFtQQVRDSCB2MiAyLzNdIGR0LWJpbmRpbmdzOiBhdG1lbCxobGNk
YzogY29udmVydCBwd20gYmluZGluZ3MgdG8gDQo+IGpzb24tc2NoZW1hDQo+IEZyb206DQo+IENv
bm9yIERvb2xleSA8Y29ub3JAa2VybmVsLm9yZz4NCj4gRGF0ZToNCj4gMTcvMDEvMjQsIDk6MDMg
cG0NCj4gDQo+IFRvOg0KPiBEaGFybWEuQkBtaWNyb2NoaXAuY29tDQo+IENDOg0KPiBhbGV4YW5k
cmUuYmVsbG9uaUBib290bGluLmNvbSwgQ29ub3IuRG9vbGV5QG1pY3JvY2hpcC5jb20sIA0KPiBz
YW1AcmF2bmJvcmcub3JnLCBiYnJlemlsbG9uQGtlcm5lbC5vcmcsIA0KPiBtYWFydGVuLmxhbmto
b3JzdEBsaW51eC5pbnRlbC5jb20sIG1yaXBhcmRAa2VybmVsLm9yZywgDQo+IHR6aW1tZXJtYW5u
QHN1c2UuZGUsIGFpcmxpZWRAZ21haWwuY29tLCBkYW5pZWxAZmZ3bGwuY2gsIA0KPiByb2JoK2R0
QGtlcm5lbC5vcmcsIGtyenlzenRvZi5rb3psb3dza2krZHRAbGluYXJvLm9yZywgDQo+IGNvbm9y
K2R0QGtlcm5lbC5vcmcsIE5pY29sYXMuRmVycmVAbWljcm9jaGlwLmNvbSwgDQo+IGNsYXVkaXUu
YmV6bmVhQHR1eG9uLmRldiwgZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZywgDQo+IGRl
dmljZXRyZWVAdmdlci5rZXJuZWwub3JnLCBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVh
ZC5vcmcsIA0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnLCBsZWVAa2VybmVsLm9yZywg
dGhpZXJyeS5yZWRpbmdAZ21haWwuY29tLCANCj4gdS5rbGVpbmUta29lbmlnQHBlbmd1dHJvbml4
LmRlLCBsaW51eC1wd21Admdlci5rZXJuZWwub3JnLCANCj4gTGludXg0TWljcm9jaGlwQG1pY3Jv
Y2hpcC5jb20NCj4gDQo+IA0KPiBPbiBXZWQsIEphbiAxNywgMjAyNCBhdCAwMjo0MzowMEFNICsw
MDAwLERoYXJtYS5CQG1pY3JvY2hpcC5jb20gIHdyb3RlOg0KPj4gT24gMTcvMDEvMjQgMTo0MCBh
bSwgQWxleGFuZHJlIEJlbGxvbmkgd3JvdGU6DQo+Pj4gRVhURVJOQUwgRU1BSUw6IERvIG5vdCBj
bGljayBsaW5rcyBvciBvcGVuIGF0dGFjaG1lbnRzIHVubGVzcyB5b3Uga25vdyB0aGUgY29udGVu
dCBpcyBzYWZlDQo+Pj4NCj4+PiBPbiAxNi8wMS8yMDI0IDE4OjAzOjE5KzAwMDAsIENvbm9yIERv
b2xleSB3cm90ZToNCj4+Pj4gT24gVHVlLCBKYW4gMTYsIDIwMjQgYXQgMDU6MDc6NTlQTSArMDUz
MCwgRGhhcm1hIEJhbGFzdWJpcmFtYW5pIHdyb3RlOg0KPj4+Pj4gQ29udmVydCBkZXZpY2UgdHJl
ZSBiaW5kaW5ncyBmb3IgQXRtZWwncyBITENEQyBQV00gY29udHJvbGxlciB0byBZQU1MDQo+Pj4+
PiBmb3JtYXQuDQo+Pj4+Pg0KPj4+Pj4gU2lnbmVkLW9mZi1ieTogRGhhcm1hIEJhbGFzdWJpcmFt
YW5pPGRoYXJtYS5iQG1pY3JvY2hpcC5jb20+DQo+Pj4+PiAtLS0NCj4+Pj4+IGNoYW5nZWxvZw0K
Pj4+Pj4gdjEgLT4gdjINCj4+Pj4+IC0gUmVtb3ZlIHRoZSBleHBsaWNpdCBjb3B5cmlnaHRzLg0K
Pj4+Pj4gLSBNb2RpZnkgdGl0bGUgKG5vdCBpbmNsdWRlIHdvcmRzIGxpa2UgYmluZGluZy9kcml2
ZXIpLg0KPj4+Pj4gLSBNb2RpZnkgZGVzY3JpcHRpb24gYWN0dWFsbHkgZGVzY3JpYmluZyB0aGUg
aGFyZHdhcmUgYW5kIG5vdCB0aGUgZHJpdmVyLg0KPj4+Pj4gLSBSZW1vdmUgcGluY3RybCBwcm9w
ZXJ0aWVzIHdoaWNoIGFyZW4ndCByZXF1aXJlZC4NCj4+Pj4+IC0gRHJvcCBwYXJlbnQgbm9kZSBh
bmQgaXQncyBvdGhlciBzdWItZGV2aWNlIG5vZGUgd2hpY2ggYXJlIG5vdCByZWxhdGVkIGhlcmUu
DQo+Pj4+PiAtLS0NCj4+Pj4+ICAgIC4uLi9iaW5kaW5ncy9wd20vYXRtZWwsaGxjZGMtcHdtLnlh
bWwgICAgICAgICB8IDQ3ICsrKysrKysrKysrKysrKysrKysNCj4+Pj4+ICAgIC4uLi9iaW5kaW5n
cy9wd20vYXRtZWwtaGxjZGMtcHdtLnR4dCAgICAgICAgICB8IDI5IC0tLS0tLS0tLS0tLQ0KPj4+
Pj4gICAgMiBmaWxlcyBjaGFuZ2VkLCA0NyBpbnNlcnRpb25zKCspLCAyOSBkZWxldGlvbnMoLSkN
Cj4+Pj4+ICAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvcHdtL2F0bWVsLGhsY2RjLXB3bS55YW1sDQo+Pj4+PiAgICBkZWxldGUgbW9kZSAxMDA2
NDQgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3B3bS9hdG1lbC1obGNkYy1wd20u
dHh0DQo+Pj4+Pg0KPj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9i
aW5kaW5ncy9wd20vYXRtZWwsaGxjZGMtcHdtLnlhbWwgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRy
ZWUvYmluZGluZ3MvcHdtL2F0bWVsLGhsY2RjLXB3bS55YW1sDQo+Pj4+PiBuZXcgZmlsZSBtb2Rl
IDEwMDY0NA0KPj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi43NTExMjIzMDlmYTkNCj4+Pj4+IC0t
LSAvZGV2L251bGwNCj4+Pj4+ICsrKyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5n
cy9wd20vYXRtZWwsaGxjZGMtcHdtLnlhbWwNCj4+Pj4+IEBAIC0wLDAgKzEsNDcgQEANCj4+Pj4+
ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVz
ZSkNCj4+Pj4gVGhlIG9yaWdpbmFsIGZpbGUgaGFzIG5vIGxpY2Vuc2UsIGJ1dCB3YXMgb3JpZ2lu
YWxseSB3cml0dGVuIGJ5IGENCj4+Pj4gZnJlZS1lbGVjdHJvbnMgZW1wbG95ZWUsIHNvIHRoZSBy
ZWxpY2Vuc2luZyBoZXJlIGlzIGZpbmUuDQo+Pj4+DQo+Pj4gSSBjb25maXJtIHJlbGljZW5zaW5n
IGlzIGZpbmUsIGV2ZW4gYXNzaWduaW5nIHRoZSBjb3B5cmlnaHQgdG8NCj4+PiBNaWNyb2NoaXAg
KG5vdGUgdGhhdCBCb290bGluIGlzIGxlZ2FsbHkgdGhlIHNhbWUgZW50aXR5IGFzDQo+Pj4gZnJl
ZS1lbGVjdHJvbnMpDQo+PiBUaGFua3MgQ29ub3IgYW5kIEFsZXhhbmRyZS4NCj4+IEkgd2lsbCBh
ZGQgdGhlIGNvcHlyaWdodHMgYmFjayBpbiB2My4NCj4gSnVzdCB0byBub3RlLCBpbiBjYXNlIHlv
dSBtaXN1bmRlcnN0b29kIG15IG9yaWdpbmFsIGNvbW1lbnQgaGVyZToNCj4gV2hhdCBJIHNhaWQg
aGFkIG5vdGhpbmcgdG8gZG8gd2l0aCBhZGRpbmcgYSBNaWNyb2NoaXAgY29weXJpZ2h0IGFzc2ln
bm1lbnQNCj4gdG8gdGhlIGZpbGUsIGJ1dCByYXRoZXIgYWJvdXQgdGhlIGZhY3QgdGhhdCB5b3Vy
IHBhdGNoIHJlbGljZW5zZXMgdGhlDQo+IGJpbmRpbmcgZnJvbSBHUEwgdjIgdG8gR1BMIHYyIE9S
IEJTRCAyIENsYXVzZS4NCkkgYXBwcmVjaWF0ZSB0aGUgY2xhcmlmaWNhdGlvbjsgbXkgaW5pdGlh
bCB1bmRlcnN0YW5kaW5nIHdhcyBub3QgDQphY2N1cmF0ZS4gVGhhbmtzDQo+IA0KDQotLSANCldp
dGggQmVzdCBSZWdhcmRzLA0KRGhhcm1hIEIuDQoNCg==
