Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C727883A142
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jan 2024 06:19:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B134F10E947;
	Wed, 24 Jan 2024 05:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E5710E947
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Jan 2024 05:18:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706073533; x=1737609533;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=zQQbAq+bbxq12iM3xL4cXGH8CjixZyeFs5PX3PfWFsQ=;
 b=CtfC2+Al2zUOrvqmxxqxOa84FrOHipyG+nveNOayqcRUNnMvF5lF8BYY
 3c99PzxMa+7NdX7lupZOPBgLhjhBH7qgIB6xESjcW4xdSCS3LPOML3lga
 +xEUEp4VBvwWLgDL7jAkGQ8bQaSjeZR67lcEA/FInJTlh922HpV0GAoqX
 8dVP55GJD81kose9ZMGyB9ArNz3x6ArVjSoXREYb9QnkC14GgmoM6pbRJ
 E/l/9tK+egIh5MC9HxbUK1XBigvmGmy+emr/cpUZ3ATDS1hgYGB61bevW
 j8T55gzWaxTceyN0obFN6S2Telt+R9WYXzDxltVf3pvZNohtQVzbekaiv w==;
X-CSE-ConnectionGUID: phPKyoNJT4qQ4jzxUq7xnA==
X-CSE-MsgGUID: JT6F1kgKSeCuVGaHNBd7vA==
X-IronPort-AV: E=Sophos;i="6.05,216,1701154800"; d="scan'208";a="15201450"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 23 Jan 2024 22:18:51 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 23 Jan 2024 22:18:29 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Tue, 23 Jan 2024 22:18:29 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d5NWIp6g2z04UeuBhI0ulGoidL+IfnTJMbOIoMCmnvUM4bTIxteD/PGww8tqOaxSzID0rnMv7zPfNlg4AmWm7S0TDCE0HYKF10yhNgPDf7BO0AqcYzy5WTbucyc+E+WDJhBIeC61ySdEujfweF8uYV4QeFVqvgHcHXhkLMtWFWdtxp9I+ClIcmp7SaEtQ8A7H9HcT7hDgTq7Qp0FZNz/e6Qs3oQCodiTOz4jROXiFDOjQvIZ/e6o48yf6eYGBEZKkjQzsc4M3y4D4mOkyioxhxcn9OqimbHfArEtFH7wSV+ayS9aieu4/gJnf6uZ1rhu+MMS8bRlrzGtNcwRhgiIAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zQQbAq+bbxq12iM3xL4cXGH8CjixZyeFs5PX3PfWFsQ=;
 b=W0pGUv8bO4v/a0RtVNc0ArUXUYHtMN7DsdUZvfXoJMEaADcDRAt2FRejjmpAM2WG158H9W2zP0ySK1KBzfnBpwNtiSo/zFWKMJihT9FDFMxPHWLCxVUOg4Ck+P27YCrSVX7v8os8SGBos4uLgcCBGjXAtZRVgl8YMyt/Ebl1FqwmPRXJeuZOKVf880/OC3RMii0S1xWpfTDLj/f5STwljYndgltMWlDwyZlrZr+e+UJfzcBvfZdPY/s7mr20zOOl0rq4kHRdxBI2725/vMuaLMtDxFVbSkoaGE7L4BtbaVf3322ksZ7+FkFs+oOUCmM0nxF3HBeuO4xLiShywleVHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zQQbAq+bbxq12iM3xL4cXGH8CjixZyeFs5PX3PfWFsQ=;
 b=ZRzt7BlWm2ZLOFxhzu0UyBsRTHjBHfaUSX330xFilYiX6LC2ikVLvfEGAZlezo5pUUdSJcNG9nOyrY02LNrER1tanZ9z1xHe+FrJRSNmx2j0n2RFmOpHTSqQI3iOjSvDUvAkxeWIa9DQXYeKsLDZxjFpLZ6UwpEosUMeoszh/Cm2oaieC4saEA6fYVRc23u7kKq2HQ4/gy2PqsPoMFnye7JfyfFWMDcIkukddkubMaBGirGe6SZJ3iBlglV1uaG5XRqItrb8pMDgo1UW4if0oTECu2efLja/n/ZOZ9Y27XsUdOBPcT9qfZZTc1mGhbXwkA0uFEeFde0FKkgANMC/dg==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by DS0PR11MB7831.namprd11.prod.outlook.com (2603:10b6:8:de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.34; Wed, 24 Jan
 2024 05:18:26 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7228.022; Wed, 24 Jan 2024
 05:18:26 +0000
From: <Dharma.B@microchip.com>
To: <conor@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Topic: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Index: AQHaSfB9G+vm5oXSwEmW6mjsJvC8kbDftWKAgADHFQCAAI7AgIAEKeOAgABefoCAAuIIAA==
Date: Wed, 24 Jan 2024 05:18:26 +0000
Message-ID: <4906b7e2-0ddb-4d3c-a48b-e16278f2d649@microchip.com>
References: <20240118092612.117491-1-dharma.b@microchip.com>
 <20240118092612.117491-4-dharma.b@microchip.com>
 <20240118-recent-glorified-fd35d72e006e@spud>
 <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
 <20240119-character-mardi-43571d7fe7d5@wendy>
 <da60f9f3-f955-4a87-a020-5710185953c0@microchip.com>
 <20240122-stark-duress-2f59294dcf27@spud>
In-Reply-To: <20240122-stark-duress-2f59294dcf27@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|DS0PR11MB7831:EE_
x-ms-office365-filtering-correlation-id: acaafc70-01ae-4559-c235-08dc1c9be4d2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uBZw+s71Snf4zB/17jMfYOXmfpgr1cWP/annI9IjmtNuMAVsEhKTlsSBDGbv5izdatcXUEP/1ue9NjhIrNWTIGSMzMMxyW8v3zD/tw1qBDYJ8drY4HgUmTD4B5A+Jzg1X1wlgVoUoT7dDRABvZWUE2emxcrl/l0vRSFAF0OF3drpSSy2ZU5zetvcNTBFX/H+dWrLzpqsME84pekB4LeWfDFKklqXf/2gM59jtJ/i4oQeOV6CLr4d/TmLC0+Idqx9QicZrXcqhuzdjyvzmsZAAsHWj25mZV4wznZVa8mQfs1x8+AOmjuOsgriQxoXg8E12Etrn/4+HMDLm1o967G6NJQ2ndfgXx6BjEMFBYpoCgCz9nD3GZd2EItbjCfZUtNdE4mgL7TlMe2ehx6IOcc/zAj2RjZqVCZHw1xgKb9qlLCQx87Bh1dt9oezAJqQLTV19k3EGyI6cVO9jFJgQ+YeVX5jG4NEjhgTZ4JCoNRlKu2FkGDZmemJwV+817/ZR+3OutdxEv+y0qNCQXg9bvrJrlLz95qJ/Ei5Apj91JVDMl0F9wI4GkcZaVqw6M3gVCFsAzSRddu6CtjVA5+7NGi4DjVE9KOThXtyFK7Ij9TN7n4AL2hnIDZGLGsijB9lE9NFueOgEyMMrrKN9I9i2BHAgZlCeYXqRS8DbK3GZbvOiLotZCPz9H8GtwqqF+1Pu4OY
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(136003)(366004)(39860400002)(396003)(346002)(230922051799003)(451199024)(64100799003)(1800799012)(186009)(6512007)(64756008)(66476007)(66556008)(6506007)(6486002)(66946007)(66446008)(53546011)(71200400001)(478600001)(6916009)(8676002)(316002)(8936002)(76116006)(54906003)(107886003)(26005)(2616005)(83380400001)(2906002)(7416002)(5660300002)(4326008)(41300700001)(38070700009)(36756003)(38100700002)(122000001)(86362001)(31696002)(31686004)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGRiNE04MFdWU2RRTDJDL3lKS2g3RkZ2UmRLUkxLY1FGM0pBaHcvSmMwTzRH?=
 =?utf-8?B?aWdwMUhxVkVrOW1MNTRYM2UzMW1kZmhXK0VSaHpnQndYcnNBVVJ2clQzem9O?=
 =?utf-8?B?d0l3S1NCblJZY1hscGIxRTV6WG9PNC9iaGc0ZDZKZGpDQWNpV3Z2MWdoeUYz?=
 =?utf-8?B?Y3g5NVNxNHUwZ0luZnV6OFdRaWxudzJWdEtFVEZzeU45VHFGWEc5SnhWMWZh?=
 =?utf-8?B?NEhIKzc5aENpUU0yNm1zV3JPdlZ3KzljbkdmRU5HNWFKUmduWkR5L0VUVmpj?=
 =?utf-8?B?bHBybXJmWkp0MVJ4Um4wZGcvUTBqc25mQ2pLNjdueUR4QmJESzFnTjd0QmQw?=
 =?utf-8?B?U3A4WnpQQlpxUjNQUHdNdEwrVXhsb3Nra3dZSC9wZnhvQVMwY1FhRUJOcXRs?=
 =?utf-8?B?aXFJZE1SN09BdE03OUVkTHVSbFhEbUVoZFN4ak82aFBqVUM1a21rRFVTSXdG?=
 =?utf-8?B?UHRZZUM0YXBNSXEyRFF2c2JBcWd1NndkaVJLNWRoY3FPOTEwbzBKV1VlaVQv?=
 =?utf-8?B?NGFLT0k4ZHFTaHhrdDIrN2xDVEtHMkdDMElUSU9oY2dvZHFIcFc2aXc2S3hB?=
 =?utf-8?B?YWRySG5RYTlrSm8zTGcybEpvazFqdFFkNnZkbVFQbjJuSjNnbjhuYXNPWXZJ?=
 =?utf-8?B?NkJUQ3pVZSswcGpyLzhKRitxL1ZTbG1yY04wdG13MmxqTVMxVW1kQytqTDF3?=
 =?utf-8?B?bHJ3bEVIcWNKcjJZRWVpbkExMXROT2VWN2NIVFpFcjMxRGQ5Rm9uMU5WNmIw?=
 =?utf-8?B?KzI0RDMzN1VzRW51YVc3WEZ4blQrcmUvNm96azZhZkNHUmJPMlZqZ09tNEVD?=
 =?utf-8?B?NXBUallvZUZEcTN6VEY1MmFMWG9BMGdmLzY0Z0FsTWFvRUFkNXBLSkJ1TkhL?=
 =?utf-8?B?czkrQkJUT2c4Qk9ucTlqY3dGRGNIWTZpZDdrU1Q5S0haTmRPVWMrbERUbW1B?=
 =?utf-8?B?YTBGejJsQmw3RkZwMDhsbmlOWFkzVzNuYktaOU43bGRuSEU3eHF5bnNHTGxx?=
 =?utf-8?B?UzI2L0VhSEpiNm5TMG8yWldFbU9paHF4QlVoOWdnYjlwaXdJYVh6emQ5SlBI?=
 =?utf-8?B?RDFYb2l6ZHlFUHA2QklJRnFCOXJ3cFJUZXFsZklzL1REOW1rWXdrS2pjM1lT?=
 =?utf-8?B?ZGtTN1Nuay82TCttYWdVNlkzWnZLNnVVOWRMU0kvYXlKd1lEQ1pOWXBISHJj?=
 =?utf-8?B?azdQS01oQkNCU1hRQnJVc29Yb3F5dWNhVmZDMm1kN1lIb2g5d3VZWGJjc3RJ?=
 =?utf-8?B?MWZMRnNrU2tBb1NMNko3elJ4dmFnVFB0TU5MVTFCa0F1MFdaR2NUT1FUWFpG?=
 =?utf-8?B?UHVCa09aY1Y0eUNhLzg2cERmakduQmljVHRsNjZlejgxKzk4aVI0TGw1aTQv?=
 =?utf-8?B?RHQvMGJ5ZktWWlJqa3hreXdGSTJhOFZhZWU3MmVMNnZJeWZxNHB0b2FTdEFE?=
 =?utf-8?B?T1NkNmRDZG56Z1p5VHpoNWMzY2VJVTZXYmpYYW51VjF5ZHhBWE13c2ZFK3dj?=
 =?utf-8?B?T1RLR0k5NHNHMkxXM1I1WjAraDBXdVRwT1FnZnhTbzZHM1pid3o5U0xPZXJs?=
 =?utf-8?B?RDhaWTU5cVRqb1J5VUlyYWZkU1RUM2E0VnRhUWVoMytJQnFoSlFsNVl1WHQy?=
 =?utf-8?B?ZUNRL1ovOW8vcC9oQ2tGRVRudkFQS25SVDkrWGMwWXNvWmZjWTVON2ZGcy96?=
 =?utf-8?B?ZkRyMkZ4Mk92Vy9qRk1JZFgxMDVEeHNpYU1tZk0xOHZOY3Q2U1ZEVWtjUjdK?=
 =?utf-8?B?bXpab2hoQUY3dDdHVmlWT2F1L1pSay8wK0l5RkJQbzBUU1hGQ1hUVU1ZS1Y4?=
 =?utf-8?B?MC92dWJKelpnbDRMWlNsRk5pTUd6TFpFV2xDeXpETHJRSW5TQnpwVHRFUkZm?=
 =?utf-8?B?SE5xd2FXbStwOEYvejI3N3VCZTQ5ckFKKytFMzM0UUtwUmZhMmJTUGgrZkox?=
 =?utf-8?B?MFlUNnFZenU1Nzd1Ti9UN1VQWnpSYllSSlc2eEpZNWFtc2tacU5Jck56TDNj?=
 =?utf-8?B?ZUVJRmE3dk1YMm83RlE1TnlnN25FVSt3d3MrZmN5ZEtlb0FtZC9BSDM4VmVG?=
 =?utf-8?B?ZlVtSzZvWVRINDRPUzlESDdsUER0WERuaTArUE1DNytpWSsydk1ROW9ESjJt?=
 =?utf-8?Q?WB6JAT/skCpZtHuM++s7BYWsD?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AB725261D35B4243A1FB8E2C157BFB08@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: acaafc70-01ae-4559-c235-08dc1c9be4d2
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Jan 2024 05:18:26.3928 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iGanHChSa+Na7l9cCwy/i0kdGeK/GxgbLBrWigu58A0irdKo3b90s2Tn3rYL8UN5D/GSZOvpGyxvlyYzPEl2HQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7831
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

SGkgQ29ub3IgJiBBbGwsDQoNCk9uIDIyLzAxLzI0IDI6NDYgcG0sIENvbm9yIERvb2xleSB3cm90
ZToNCj4gT24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDM6Mzg6NDFBTSArMDAwMCxEaGFybWEuQkBt
aWNyb2NoaXAuY29tICB3cm90ZToNCj4+IEhpIENvbm9yLA0KPj4gT24gMTkvMDEvMjQgNTozMyBw
bSwgQ29ub3IgRG9vbGV5IC0gTTUyNjkxIHdyb3RlOg0KPj4+IE9uIEZyaSwgSmFuIDE5LCAyMDI0
IGF0IDAzOjMyOjQ5QU0gKzAwMDAsRGhhcm1hLkJAbWljcm9jaGlwLmNvbSAgd3JvdGU6DQo+Pj4+
IE9uIDE4LzAxLzI0IDk6MTAgcG0sIENvbm9yIERvb2xleSB3cm90ZToNCj4+Pj4+IE9uIFRodSwg
SmFuIDE4LCAyMDI0IGF0IDAyOjU2OjEyUE0gKzA1MzAsIERoYXJtYSBCYWxhc3ViaXJhbWFuaSB3
cm90ZToNCj4+Pj4+PiBDb252ZXJ0IHRoZSBhdG1lbCxobGNkYyBiaW5kaW5nIHRvIERUIHNjaGVt
YSBmb3JtYXQuDQo+Pj4+Pj4NCj4+Pj4+PiBBZGp1c3QgdGhlIGNsb2NrLW5hbWVzIHByb3BlcnR5
IHRvIGNsYXJpZnkgdGhhdCB0aGUgTENEIGNvbnRyb2xsZXIgZXhwZWN0cw0KPj4+Pj4+IG9uZSBv
ZiB0aGVzZSBjbG9ja3MgKGVpdGhlciBzeXNfY2xrIG9yIGx2ZHNfcGxsX2NsayB0byBiZSBwcmVz
ZW50IGJ1dCBub3QNCj4+Pj4+PiBib3RoKSBhbG9uZyB3aXRoIHRoZSBzbG93X2NsayBhbmQgcGVy
aXBoX2Nsay4gVGhpcyBhbGlnbm1lbnQgd2l0aCB0aGUgYWN0dWFsDQo+Pj4+Pj4gaGFyZHdhcmUg
cmVxdWlyZW1lbnRzIHdpbGwgZW5hYmxlIGFjY3VyYXRlIGRldmljZSB0cmVlIGNvbmZpZ3VyYXRp
b24gZm9yDQo+Pj4+Pj4gc3lzdGVtcyB1c2luZyB0aGUgSExDREMgSVAuDQo+Pj4+Pj4NCj4+Pj4+
PiBTaWduZWQtb2ZmLWJ5OiBEaGFybWEgQmFsYXN1YmlyYW1hbmk8ZGhhcm1hLmJAbWljcm9jaGlw
LmNvbT4NCj4+Pj4+PiAtLS0NCj4+Pj4+PiBjaGFuZ2Vsb2cNCj4+Pj4+PiB2MiAtPiB2Mw0KPj4+
Pj4+IC0gUmVuYW1lIGhsY2RjLWRpc3BsYXktY29udHJvbGxlciBhbmQgaGxjZGMtcHdtIHRvIGdl
bmVyaWMgbmFtZXMuDQo+Pj4+Pj4gLSBNb2RpZnkgdGhlIGRlc2NyaXB0aW9uIGJ5IHJlbW92aW5n
IHRoZSB1bndhbnRlZCBjb21tZW50cyBhbmQgJ3wnLg0KPj4+Pj4+IC0gTW9kaWZ5IGNsb2NrLW5h
bWVzIHNpbXBsZXIuDQo+Pj4+Pj4gdjEgLT4gdjINCj4+Pj4+PiAtIFJlbW92ZSB0aGUgZXhwbGlj
aXQgY29weXJpZ2h0cy4NCj4+Pj4+PiAtIE1vZGlmeSB0aXRsZSAobm90IGluY2x1ZGUgd29yZHMg
bGlrZSBiaW5kaW5nL2RyaXZlcikuDQo+Pj4+Pj4gLSBNb2RpZnkgZGVzY3JpcHRpb24gYWN0dWFs
bHkgZGVzY3JpYmluZyB0aGUgaGFyZHdhcmUgYW5kIG5vdCB0aGUgZHJpdmVyLg0KPj4+Pj4+IC0g
QWRkIGRldGFpbHMgb2YgbHZkc19wbGwgYWRkaXRpb24gaW4gY29tbWl0IG1lc3NhZ2UuDQo+Pj4+
Pj4gLSBSZWYgZW5kcG9pbnQgYW5kIG5vdCBlbmRwb2ludC1iYXNlLg0KPj4+Pj4+IC0gRml4IGNv
ZGluZyBzdHlsZS4NCj4+Pj4+PiAuLi4NCj4+Pj4+PiAgICAgLi4uL2RldmljZXRyZWUvYmluZGlu
Z3MvbWZkL2F0bWVsLGhsY2RjLnlhbWwgIHwgOTcgKysrKysrKysrKysrKysrKysrKw0KPj4+Pj4+
ICAgICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwtaGxjZGMudHh0ICAgfCA1NiAt
LS0tLS0tLS0tLQ0KPj4+Pj4+ICAgICAyIGZpbGVzIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKyks
IDU2IGRlbGV0aW9ucygtKQ0KPj4+Pj4+ICAgICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL21mZC9hdG1lbCxobGNkYy55YW1sDQo+Pj4+Pj4gICAg
IGRlbGV0ZSBtb2RlIDEwMDY0NCBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWZk
L2F0bWVsLWhsY2RjLnR4dA0KPj4+Pj4+DQo+Pj4+Pj4gZGlmZiAtLWdpdCBhL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwsaGxjZGMueWFtbCBiL0RvY3VtZW50YXRp
b24vZGV2aWNldHJlZS9iaW5kaW5ncy9tZmQvYXRtZWwsaGxjZGMueWFtbA0KPj4+Pj4+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0DQo+Pj4+Pj4gaW5kZXggMDAwMDAwMDAwMDAwLi5lY2NjOTk4YWM0MmMN
Cj4+Pj4+PiAtLS0gL2Rldi9udWxsDQo+Pj4+Pj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0
cmVlL2JpbmRpbmdzL21mZC9hdG1lbCxobGNkYy55YW1sDQo+Pj4+Pj4gQEAgLTAsMCArMSw5NyBA
QA0KPj4+Pj4+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAoR1BMLTIuMCBPUiBCU0QtMi1D
bGF1c2UpDQo+Pj4+Pj4gKyVZQU1MIDEuMg0KPj4+Pj4+ICstLS0NCj4+Pj4+PiArJGlkOmh0dHA6
Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL21mZC9hdG1lbCxobGNkYy55YW1sIw0KPj4+Pj4+ICsk
c2NoZW1hOmh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9tZXRhLXNjaGVtYXMvY29yZS55YW1sIw0KPj4+
Pj4+ICsNCj4+Pj4+PiArdGl0bGU6IEF0bWVsJ3MgSExDRCBDb250cm9sbGVyDQo+Pj4+Pj4gKw0K
Pj4+Pj4+ICttYWludGFpbmVyczoNCj4+Pj4+PiArICAtIE5pY29sYXMgRmVycmU8bmljb2xhcy5m
ZXJyZUBtaWNyb2NoaXAuY29tPg0KPj4+Pj4+ICsgIC0gQWxleGFuZHJlIEJlbGxvbmk8YWxleGFu
ZHJlLmJlbGxvbmlAYm9vdGxpbi5jb20+DQo+Pj4+Pj4gKyAgLSBDbGF1ZGl1IEJlem5lYTxjbGF1
ZGl1LmJlem5lYUB0dXhvbi5kZXY+DQo+Pj4+Pj4gKw0KPj4+Pj4+ICtkZXNjcmlwdGlvbjoNCj4+
Pj4+PiArICBUaGUgQXRtZWwgSExDREMgKEhMQ0QgQ29udHJvbGxlcikgSVAgYXZhaWxhYmxlIG9u
IEF0bWVsIFNvQ3MgZXhwb3NlcyB0d28NCj4+Pj4+PiArICBzdWJkZXZpY2VzLCBhIFBXTSBjaGlw
IGFuZCBhIERpc3BsYXkgQ29udHJvbGxlci4NCj4+Pj4+PiArDQo+Pj4+Pj4gK3Byb3BlcnRpZXM6
DQo+Pj4+Pj4gKyAgY29tcGF0aWJsZToNCj4+Pj4+PiArICAgIGVudW06DQo+Pj4+Pj4gKyAgICAg
IC0gYXRtZWwsYXQ5MXNhbTluMTItaGxjZGMNCj4+Pj4+PiArICAgICAgLSBhdG1lbCxhdDkxc2Ft
OXg1LWhsY2RjDQo+Pj4+Pj4gKyAgICAgIC0gYXRtZWwsc2FtYTVkMi1obGNkYw0KPj4+Pj4+ICsg
ICAgICAtIGF0bWVsLHNhbWE1ZDMtaGxjZGMNCj4+Pj4+PiArICAgICAgLSBhdG1lbCxzYW1hNWQ0
LWhsY2RjDQo+Pj4+Pj4gKyAgICAgIC0gbWljcm9jaGlwLHNhbTl4NjAtaGxjZGMNCj4+Pj4+PiAr
ICAgICAgLSBtaWNyb2NoaXAsc2FtOXg3NS14bGNkYw0KPj4+Pj4+ICsNCj4+Pj4+PiArICByZWc6
DQo+Pj4+Pj4gKyAgICBtYXhJdGVtczogMQ0KPj4+Pj4+ICsNCj4+Pj4+PiArICBpbnRlcnJ1cHRz
Og0KPj4+Pj4+ICsgICAgbWF4SXRlbXM6IDENCj4+Pj4+PiArDQo+Pj4+Pj4gKyAgY2xvY2tzOg0K
Pj4+Pj4+ICsgICAgbWF4SXRlbXM6IDMNCj4+Pj4+IEhtbSwgb25lIHRoaW5nIEkgcHJvYmFibHkg
c2hvdWxkIGhhdmUgc2FpZCBvbiB0aGUgcHJldmlvdXMgdmVyc2lvbiwgYnV0DQo+Pj4+PiBJIG1p
c3NlZCBzb21laG93OiBJdCB3b3VsZCBiZSBnb29kIHRvIGFkZCBhbiBpdGVtcyBsaXN0IHRvIHRo
ZSBjbG9ja3MNCj4+Pj4+IHByb3BlcnR5IGhlcmUgdG8gZXhwbGFpbiB3aGF0IHRoZSAzIGNsb2Nr
cyBhcmUvYXJlIHVzZWQgZm9yIC0gZXNwZWNpYWxseQ0KPj4+Pj4gc2luY2UgdGhlcmUgaXMgYWRk
aXRpb25hbCBjb21wbGV4aXR5IGJlaW5nIGFkZGVkIGhlcmUgdG8gdXNlIGVpdGhlciB0aGUNCj4+
Pj4+IHN5cyBvciBsdmRzIGNsb2Nrcy4NCj4+Pj4gTWF5IEkgaW5xdWlyZSBpZiB0aGlzIGFwcHJv
YWNoIGlzIGxpa2VseSB0byBiZSBlZmZlY3RpdmU/DQo+Pj4+DQo+Pj4+ICAgICAgY2xvY2tzOg0K
Pj4+PiAgICAgICAgaXRlbXM6DQo+Pj4+ICAgICAgICAgIC0gZGVzY3JpcHRpb246IHBlcmlwaGVy
YWwgY2xvY2sNCj4+Pj4gICAgICAgICAgLSBkZXNjcmlwdGlvbjogZ2VuZXJpYyBjbG9jayBvciBs
dmRzIHBsbCBjbG9jaw0KPj4+PiAgICAgICAgICAgICAgT25jZSB0aGUgTFZEUyBQTEwgaXMgZW5h
YmxlZCwgdGhlIHBpeGVsIGNsb2NrIGlzIHVzZWQgYXMgdGhlDQo+Pj4+ICAgICAgICAgICAgICBj
bG9jayBmb3IgTENEQywgc28gaXRzIEdDTEsgaXMgbm8gbG9uZ2VyIG5lZWRlZC4NCj4+Pj4gICAg
ICAgICAgLSBkZXNjcmlwdGlvbjogc2xvdyBjbG9jaw0KPj4+PiAgICAgICAgbWF4SXRlbXM6IDMN
Cj4+PiBIbW0gdGhhdCBzb3VuZHMgdmVyeSBzdXNwZWN0IHRvIG1lLiAiT25jZSB0aGUgbHZkc3Bs
bCBpcyBlbmFibGVkIHRoZQ0KPj4+IGdlbmVyaWMgY2xvY2sgaXMgbm8gbG9uZ2VyIG5lZWRlZCIg
c291bmRzIGxpa2UgYm90aCBjbG9ja3MgY2FuIGJlIHByb3ZpZGVkDQo+Pj4gdG8gdGhlIElQIG9u
IGRpZmZlcmVudCBwaW5zIGFuZCB0aGVpciBwcm92aXNpb24gaXMgbm90IG11dHVhbGx5DQo+Pj4g
ZXhjbHVzaXZlLCBqdXN0IHRoYXQgdGhlIElQIHdpbGwgb25seSBhY3R1YWxseSB1c2Ugb25lIGF0
IGEgdGltZS4gSWYNCj4+PiB0aGF0IGlzIHRoZSBjYXNlLCB0aGVuIHRoaXMgcGF0Y2ggaXMgbm90
dCBjb3JyZWN0IGFuZCB0aGUgYmluZGluZyBzaG91bGQNCj4+PiBhbGxvdyBmb3IgNCBjbG9ja3Ms
IHdpdGggYm90aCB0aGUgZ2VuZXJpYyBjbG9jayBhbmQgdGhlIGx2ZHMgcGxsIGJlaW5nDQo+Pj4g
cHJlc2VudCBpbiB0aGUgRFQgYXQgdGhlIHNhbWUgdGltZS4NCj4+Pg0KPj4+IEkgdmFndWVseSBy
ZWNhbGwgaW50ZXJuYWwgZGlzY3Vzc2lvbiBhYm91dCB0aGlzIHByb2JsZW0gc29tZSB0aW1lIGJh
Y2sNCj4+PiBidXQgdGhlIGRldGFpbHMgYWxsIGVzY2FwZSBtZS4NCj4+IExldCdzIGRlbHZlIGRl
ZXBlciBpbnRvIHRoZSBjbG9jayBjb25maWd1cmF0aW9uIGZvciBMQ0RDX1BDSy4NCj4+DQo+PiBD
b25zaWRlcmluZyB0aGUgZmxleGliaWxpdHkgb2YgdGhlIGRlc2lnbiwgaXQgYXBwZWFycyB0aGF0
IGJvdGggY2xvY2tzLA0KPj4gc3lzX2NsayAoZ2VuZXJpYyBjbG9jaykgYW5kIGx2ZHNfcGxsX2Ns
aywgY2FuIGluZGVlZCBiZSBwcm92aWRlZCB0byB0aGUNCj4+IElQIHNpbXVsdGFuZW91c2x5LiBU
aGUgY3J1Y2lhbCBhc3BlY3QsIGhvd2V2ZXIsIGlzIHRoYXQgdGhlIElQIHdpbGwNCj4+IHV0aWxp
emUgb25seSBvbmUgb2YgdGhlc2UgY2xvY2tzIGF0IGFueSBnaXZlbiB0aW1lLiBUaGlzIGFsaWdu
cyB3aXRoIHRoZQ0KPj4gc3BlY2lmaWMgcmVxdWlyZW1lbnRzIG9mIHRoZSBhcHBsaWNhdGlvbiwg
d2hlcmUgdGhlIGNob2ljZSBvZiBjbG9jaw0KPj4gZGVwZW5kcyBvbiB3aGV0aGVyIHRoZSBMVkRT
IGludGVyZmFjZSBvciBNSVBJL0RTSSBpcyBpbiB1c2UuDQo+IElmIGJvdGggY2xvY2tzIGNhbiBw
aHlzaWNhbGx5IGJlIHByb3ZpZGVkIHRvIHRoZSBJUCB0aGVuIGJvdGggb2YgdGhlbQ0KPiBzaG91
bGQgYmUgaW4gdGhlIGR0LiBUaGUgaGNsZGMgYXBwZWFycyB0byBtZSB0byBiZSBhIHBhcnQgb2Yg
dGhlIFNvQyBhbmQNCj4gdGhlIGNsb2NrIHJvdXRpbmcgdG8gdGhlIElQIGlzIGxpa2VseSBmaXhl
ZC4NCj4gDQo+PiBUbyBlbnN1cmUgcHJvcGVyIGNvbmZpZ3VyYXRpb24gb2YgdGhlIHBpeGVsIGNs
b2NrIHBlcmlvZCwgd2UgbmVlZCB0bw0KPj4gZGlzdGluY3RseSBpZGVudGlmeSB3aGljaCBjbG9j
a3MgYXJlIGJlaW5nIHV0aWxpemVkLiBGb3IgaW5zdGFuY2UsIGluDQo+PiB0aGUgTFZEUyBpbnRl
cmZhY2Ugc2NlbmFyaW8sIHRoZSBsdmRzX3BsbF9jbGsgaXMgZXNzZW50aWFsLCByZXN1bHRpbmcg
aW4NCj4+IExDRENfUENLIGJlaW5nIHNldCB0byB0aGUgc291cmNlIGNsb2NrLiBDb252ZXJzZWx5
LCBpbiB0aGUgTUlQSS9EU0kNCj4+IGNhc2UsIHRoZSBMQ0RDIEdDTEsgaXMgcmVxdWlyZWQsIGxl
YWRpbmcgdG8gTENEQ19QQ0sgYmVpbmcgZGVmaW5lZCBhcw0KPj4gc291cmNlIGNsb2NrL0NMS0RJ
VisyLg0KPj4NCj4+IENvbnNpZGVyaW5nIHRoZSBwb3RlbnRpYWwgY29leGlzdGVuY2Ugb2Ygc3lz
X2NsayBhbmQgbHZkc19wbGxfY2xrIGluIHRoZQ0KPj4gRGV2aWNlIFRyZWUgKERUKSwgd2UgbWF5
IG5lZWQgdG8gaW50cm9kdWNlIGFuIGFkZGl0aW9uYWwgZmxhZyBpbiB0aGUgRFQuDQo+PiBUaGlz
IGZsYWcgY291bGQgc2VydmUgYXMgYSBjbGVhciBpbmRpY2F0b3Igb2Ygd2hldGhlciB0aGUgTFZE
UyBpbnRlcmZhY2UNCj4+IG9yIE1JUEkvRFNJIGlzIGJlaW5nIGVtcGxveWVkLiBBcyB3ZSBkaXNj
dXNzZWQgdG8gZHJvcCB0aGlzIGZsYWcgYW5kDQo+PiBqdXN0IGhhdmUgYW55IG9uZSBvZiB0aGUg
Y2xvY2tzIEkgYmVsaWV2ZSB0aGF0IHRoaXMgYXBwcm9hY2ggcHJvdmlkZXMgYQ0KPj4gc2Vuc2li
bGUgYW5kIHNjYWxhYmxlIHNvbHV0aW9uLCBhbGxvd2luZyBmb3IgYSBjb21wcmVoZW5zaXZlDQo+
PiByZXByZXNlbnRhdGlvbiBvZiB0aGUgY2xvY2tpbmcgY29uZmlndXJhdGlvbi4NCj4gVGhpcyBp
cyBwcm9iYWJseSBhIHF1ZXN0aW9uIGZvciB0aGUgZm9sa3Mgb24gdGhlIERSTSBvciBtZWRpYSBz
aWRlIG9mDQo+IHRoaW5ncywgYnV0IGlzIGl0IG5vdCBwb3NzaWJsZSB0byBkZXRlcm1pbmUgYmFz
ZWQgb24gdGhlIGVuZHBvaW50IHdoYXQNCj4gcHJvdG9jb2wgaXMgcmVxdWlyZWQ/DQo+IEkga25v
dyB0aGF0IG9uIHRoZSBtZWRpYSBzaWRlIG9mIHRoaW5ncyB0aGVyZSdzIGFuIGVuZHBvaW50IHBy
b3BlcnR5DQo+IHRoYXQgY2FuIGJlIHVzZWQgdG8gc3BlY2lmaWMgdGhlIGJ1cy10eXBlIC0gaXMg
dGhlcmUgYW4gZXF1aXZhbGVudA0KPiBwcm9wZXJ0eSBmb3IgRFJNIHN0dWZmPw0KDQpZZXMsIGl0
IGNhbiBiZSBkb25lLg0KSSB3aWxsIGhhdmUgdGhlIGx2ZHMgcGxsIGluIHRoZSBsdmRzIERUIG5v
ZGUuDQpJIHdpbGwganVzdCBjb252ZXJ0IHRoZSBleGlzdGluZyB0ZXh0IGJpbmRpbmcgdG8geWFt
bCB3aXRob3V0IHRoaXMgDQphZGRpdG9uYWwgbHZkcyBwbGwgY2xvY2suDQoNCi0tIA0KVGhhbmtz
LA0KRGhhcm1hIEIuDQo+IA0KPiBDaGVlcnMsDQo+IENvbm9yLg0KDQoNCg0K
