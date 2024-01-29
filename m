Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A960A83FCEA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 04:42:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20E410F5CE;
	Mon, 29 Jan 2024 03:41:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.154.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 041F910E44D
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 03:41:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1706499711; x=1738035711;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=GoD6rZdgiP0eg1SXF8eVbSwuQbex+65N4AydufQiwq0=;
 b=wIutt+dglWMrobYO/TcnMg2dEFxtePau1mvwnX1pUDMvJzbfJd+h7nyb
 YELNTWA8jv6LYX1gyLyj+tvKYvRt2ogRn6dr5z7/Cqc6Dw+m4Vm43xACO
 b9uoEQJfLxRF1U0grsMpCtRYSOZrtWjP/AsHd8AsA2759nQjKsZDszbM3
 fAf7IVRLzRzMS6egzwrE6lT/a7rSDanCZyZcoO2xow1oS7NkGLomF66d0
 155DCkbZnWWc6N5LmvOEwTZJBy1X6QsRpm6Widgq/SKt6m94ptU1MK+Rq
 XW4mFK7+csunxc5YOrVTbhNdjRqPZq//VGTaThuARp7ibmxq0z3m/ZWPR A==;
X-CSE-ConnectionGUID: q+ZyFAQVT6qdzUDEEIbzxQ==
X-CSE-MsgGUID: 6BitDxufQvmzFatL5Mvr9Q==
X-IronPort-AV: E=Sophos;i="6.05,226,1701154800"; d="scan'208";a="182669890"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jan 2024 20:41:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Sun, 28 Jan 2024 20:41:25 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Sun, 28 Jan 2024 20:41:25 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h5EfhY+tKnB5jVXEoJy13njQnucsHXYV9SMsJX3SV+C0zAEfKxH480118iM16kwhjDPRu/qI1QawbfMdSKOMHb1YUXSAD3xGdy3PV7/hNH9HIz8pxHsDFqMH33PEaGvwgXpDAIzxL4CawijDGjFtbpqbglQMIdb5iKuplGms5B8ZwLOSRlzaFRbWxm88Ee4+k7efhqpaHMVoWXcqcfeVYOPHhr54E/oS37zBH3bCu3XfZAV8nyPuUo2UY6sJ6/f8S2/N1hxoDU/+9JbtuHVXh10yzJFVqMdcljQDHBPCFk3I0gR0FZBRqVS7KlCV3oE3ISdHFcv+qn0mrWmgf0+mYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoD6rZdgiP0eg1SXF8eVbSwuQbex+65N4AydufQiwq0=;
 b=EfvkQXioIz1WjHUGCK0BmT6S6LQnQgHkLNtbkOn7tlpsVPZEsadqnUSCJVKW0ImFdNsqUMsKoK2GwBRcF8aEIGeBQKqM7iTAu3db5Cz7ZjFHAqquMcIAkzymDw9FpT/ZDYDuN7bbeSmHaC/ah34BNCjQMak0/e4nWSyO/w3dM8SjNYZbv2A7u3szeoWfqMPrOWA3Nxzv0m+2Sye/e7XIY6VIJ6TWb7kQ+nca0jV0gIMMcXdcSX3CVfHS/clXXtwfgtBxgWMrPF3Sw9Nr1YuemJUtRIMCd9pszNNiOb4pzjGfr+G1NomTGYBg/IsEbyHKziSw+Ye6hwslWYk05TjRbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoD6rZdgiP0eg1SXF8eVbSwuQbex+65N4AydufQiwq0=;
 b=BbNOWk2juO7wgMH9lSGgbYv2TXjN6W0+uIQZMSX/9gS/MB2QFT7xZ1Oc+8ZcKuJSaU5rUL14uQ0XeNJ2GNHOiLeVBc21CRDm7e6gowVGnLM1BKY1aaljltEWAhLsAoaf+BIYwWm96KNukvWxLLL7FVqVXvfphtidgVYk5XcUQzbi6jphgA5awwpK97D+OXhHcQyCW+Z5JMcu6fQ1a0ppxOXMz8UAjjWsyP/RaUluLXTYqexcYyAzkmI/Nozxv7BB8xkvqmSs657AE2C0MMHysTSU7yTmj6Q/G/40/10pYfRuvs5DCCFdb58QK0VuQ48ndhdSvhaASRJQCBTZvBI9qw==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by SJ0PR11MB4895.namprd11.prod.outlook.com (2603:10b6:a03:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.39; Mon, 29 Jan
 2024 03:41:22 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::80b9:80a3:e88a:57ee%3]) with mapi id 15.20.7228.029; Mon, 29 Jan 2024
 03:41:22 +0000
From: <Dharma.B@microchip.com>
To: <conor@kernel.org>
Subject: Re: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Topic: [PATCH v3 3/3] dt-bindings: mfd: atmel,hlcdc: Convert to DT
 schema format
Thread-Index: AQHaSfB9G+vm5oXSwEmW6mjsJvC8kbDftWKAgADHFQCAAI7AgIAEKeOAgABefoCAAuIIAIAAvjkAgADtGQCAABv2gIAAKg+AgAHfFACAA/AhAA==
Date: Mon, 29 Jan 2024 03:41:22 +0000
Message-ID: <e2080c19-a62b-4716-8de1-d3bdc299a49c@microchip.com>
References: <20240118-recent-glorified-fd35d72e006e@spud>
 <c33868c8-dc42-4800-885c-5e5f24c2044e@microchip.com>
 <20240119-character-mardi-43571d7fe7d5@wendy>
 <da60f9f3-f955-4a87-a020-5710185953c0@microchip.com>
 <20240122-stark-duress-2f59294dcf27@spud>
 <4906b7e2-0ddb-4d3c-a48b-e16278f2d649@microchip.com>
 <20240124-lend-emerald-1028fe65cc39@spud>
 <c3c30bf2-e7c2-4861-bfdf-519a7afde476@microchip.com>
 <20240125-proved-passage-7fa128f828db@wendy>
 <51da296d-a8a9-417a-8875-3b5e866a89a3@microchip.com>
 <20240126-uncommon-stout-dd3243e6b43f@spud>
In-Reply-To: <20240126-uncommon-stout-dd3243e6b43f@spud>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|SJ0PR11MB4895:EE_
x-ms-office365-filtering-correlation-id: 322c1e67-1ceb-4821-b817-08dc207c2977
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EP64eysM3g0kywf5CRPcvPFsVI5nx1/dHvFAAxMuUHp5CM9OdXuCmhZTUNWxqX/H+E7OpNTrNZ9VX5q2jEOjLf3ESWfJ6zLh2Tu915MTMIPE7nbz4Bsmfla+kCfvrqchvofyP729lKKm+vsyMs+R1EDAZ+h9P9/+xJaqwUaJynB+1oGaC9ne30wb2mkTPrixND0zDDiv7gyqtdVzMNFwzAucljG4a3wHRmPDYgpa9XmUqG9SisIwfDsXkHlpVEi1Tf4Y+ATr1eKE+v7ooVrg4XrzOPU95bGYsNlodCz4NLAg2jSbcydAj0dN+55yMAIgjBGTb2fRzv+IzV9A6ZRruRAEftaGzfF1sjVrXsJtmH93OE44bMJj0hSHecZKuus0NHzWzPTxgIIn5WDyOwO3x4uRlnU8DGredruiSJEHCGcWtJMBNEYNEJJm+OuwEUu2uHlQvQB1uHx/JroM24iWU/bYk4QoIuPvG9YSxry3z039leX4psFPmW1IpR5S8WLyp9wq6SID20SPNFTtGsiBI87OP0IAXcQ06HTOlAr79f4oidMIC66cFNzgz97j9gi8mP22nyyeKtRSyCGu75C7hBNq3ceey5ecw6sA8QTNbQ9JkUpFOPyuOIZ82Y5g+fmNcuYDJrs2AQ3o6rI7/CXCtQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376002)(346002)(396003)(366004)(39860400002)(136003)(230922051799003)(64100799003)(451199024)(186009)(1800799012)(71200400001)(8676002)(83380400001)(6506007)(122000001)(53546011)(6512007)(4326008)(8936002)(38100700002)(107886003)(36756003)(26005)(2616005)(31686004)(86362001)(2906002)(478600001)(31696002)(966005)(6486002)(7416002)(66476007)(5660300002)(66446008)(66556008)(54906003)(64756008)(6916009)(76116006)(91956017)(316002)(66946007)(41300700001)(38070700009)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dlR6cms5cmlxM0sxMlJBTE12WkdxUEhOa1Z1amJZYWlJWVJ5NFFLOUFUekNE?=
 =?utf-8?B?bTNBbEhicUtaeWk4OHJnS3ZWcEw1ellTM3hHbG5jWGdERWZGa0M3WEhFUWdh?=
 =?utf-8?B?bzUrQVNlTnI5bWhxRFlONzVRdW5TeVNhUzkxRmRqK1RpZGFLNERWbXk4Yndn?=
 =?utf-8?B?dTVHa0N2L3Y4M0FYdmJtNy93NXI2Mmo1VTNJR0hXeTBEZDgvZkgwUXl1R1di?=
 =?utf-8?B?SkdsZDBMN3kzeG1CSk9EeEJmQ1FFWWgzQXdSbUVXeHBNdmZpZWI1YVJRQWdW?=
 =?utf-8?B?ZklrQ0U4MXlPa1g0SW5ncW5teVkxVTVxYlk4MlZHVFVUc1ErSGdPRTBPZ1Ba?=
 =?utf-8?B?Uyt0MjJQWVdhYVlVUVY1WTZoR2x2bWhKRjRLY01DdHozM3Y0ZFg0aGR4eW1j?=
 =?utf-8?B?R2tvTUo2MzlnRi9wSVVxZ1NxbUlwUXdJNWVFR0VwSm5tRGd2d2dOc3FnT29v?=
 =?utf-8?B?c0ViS2Q3N3UwTmJQSjhyd05nL2lLdWczS3A5eDVIeE1jREp3cmtiRlNoTTNm?=
 =?utf-8?B?SEthd3lWOWlsRDRhd1VlVWt4UVNnUjZUa0drWUR3UFZ1R0I5VWkweWFtdU9E?=
 =?utf-8?B?dGJwZmdpUmdVeFYwd09WZitQMkRQKzFkTGx5OHp5dVBTS01SbzRtRDdTN0Fh?=
 =?utf-8?B?QUtvenJDbU0zWjZrWkVKRmVEaHA0aGlGUWN2MklLcGloYjRqS0FKRThVRlVS?=
 =?utf-8?B?Q2FDemdhbW4ycW10Ykg3VENnRDMzRGZaY2dzOUVLQ3p3bVA3T1RGeHBzTnA1?=
 =?utf-8?B?VEE4Y0pBdzdFV2pYMUk5ZlZLUjVZMkcvMFZ1c1lzUTg3T3V6SnJJQWhnMC9B?=
 =?utf-8?B?UUIxUXBsbzltN3RNR0JWNENRNDV2VHpKYVFVNjNXbURHZEFmdmx6clNXaGRE?=
 =?utf-8?B?YmRQMDNxTHNaWXczY0k1aVY0NVpSM3VsUlNWN05yclVsczdyY3IwdGtmM0JM?=
 =?utf-8?B?WHRSVWJZQ3pNWnVhSFRtNlNISUJGZjZudjl6dm5vWDdQeDZhQjVrTjQ1MzA2?=
 =?utf-8?B?MG9QVTFtbTNCUXJqendta0pmSnlpVndtNWNXaDlRaDdIb2Rxc1hLTTZnTmdZ?=
 =?utf-8?B?V1VFVk9rV1NwUVVDbXZzeGRJUDZRK0VDWk82d2xRRnhQK1g5bWUreUN4N2JL?=
 =?utf-8?B?YnJKbGlFZExoNE5xdmZVaGhxV3pmdUpLY05CWHkrdDJFb1hzZjYydVJ2Nytu?=
 =?utf-8?B?dW1Yd09UckN2aVFZYzZzVGVvaUVIUVZXeWk4dkpSMG44M0FSc0ROVWVZUkxS?=
 =?utf-8?B?cFZUWlZoVkgyS1pLYlJraFJ2dHJzczU4Uy9hbTBteWJVTytsRFR6ZWh2aldt?=
 =?utf-8?B?NmFaa3pud2JnWVBNTFFIQ0tCRWFlRmlSOCtzMTlZNkI3b0VLTEtpbGM3c2ZH?=
 =?utf-8?B?cm5QTE0zRmhLYmw0TWtKdTFpYjlBMjdKRWdzcGFaam5tN1pZY1lWbHZ4cnlB?=
 =?utf-8?B?ck5nN1hZZ2hhWmVkWUt6WFBPdCtuMkNma2FoZFZXYUZoK1VzaEdrYWN3ai83?=
 =?utf-8?B?cHRWeHpSaVZCei9McldoUHlubU1aeW5NWHUreGNxQzN2MU5LbHVoRmFGMENl?=
 =?utf-8?B?L001RDJyOEJpU3E2WVdPRXVIY0plWFJ0dEhYUkZKY0ZZdElGY3dkV1JZcWFu?=
 =?utf-8?B?L09NQjVPQjkzYW1YOElNUDFSTkQyVElsMFVLQ000WHc2bk9FWlZsMnNvMEcz?=
 =?utf-8?B?ajhQNktOSXdNbVFYVXVGSWFwdDJsN1JXTTRiNmJLMjBaRlNQSXcrZWYvakJh?=
 =?utf-8?B?ZUtQWjJvNFRKYVZlV2svMUR4ZjViSjcwRU5ob3U5Sm5hZ0tIQk1xRnpXUm41?=
 =?utf-8?B?YUVQdksydmhBRUlCazlncFgyaTNia001YXYxM0ZMRkhCMDVZUlNaRW9yZTZp?=
 =?utf-8?B?ZFNDRzFoemZSN3RWSGViWGdYUTNPYllZZ09mbUZsMGJLV0NsTjFwdnVZRUJm?=
 =?utf-8?B?VmZlaklKNU1zalpybzV0SzVQWDloemptMHR4R1gyblByM1VpbWtoOVp4UXZk?=
 =?utf-8?B?M3gzMS9WNVNUY0RGQUt4cU5WV3hwTGJDQ0pZbGtXcWNjQlVkeHRWd0hqMVZS?=
 =?utf-8?B?bUE4Skc5LzNhckhoZTFwUFYzMGJ6a0RmQUZiR3o1clV0YTE2TXBWVmtiVGRw?=
 =?utf-8?Q?+FMt3gvwdCPzoafDqRyrEVQg1?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <92B03984934642428BD01A343F692959@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 322c1e67-1ceb-4821-b817-08dc207c2977
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jan 2024 03:41:22.3314 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KJCigc4e4geWJouFwpAEmrmadvuK7iJ0bD/lH0B9pV/wre+YkfbKx6YzTyrf+SZLxDFPuCwavo9FU/7vl7rRbQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4895
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

SGkgQ29ub3IsDQoNCk9uIDI2LzAxLzI0IDk6MDMgcG0sIENvbm9yIERvb2xleSB3cm90ZToNCj4g
T24gRnJpLCBKYW4gMjYsIDIwMjQgYXQgMDI6MjI6NDJQTSArMDAwMCxEaGFybWEuQkBtaWNyb2No
aXAuY29tICB3cm90ZToNCj4+IE9uIDI1LzAxLzI0IDE6NTcgcG0sIENvbm9yIERvb2xleSAtIE01
MjY5MSB3cm90ZToNCj4+Pj4+IElmIHRoZSBsdmRzIHBsbCBpcyBhbiBpbnB1dCB0byB0aGUgaGxj
ZGMsIHlvdSBuZWVkIHRvIGFkZCBpdCBoZXJlLg0KPj4+Pj4gICAgRnJvbSB5b3VyIGRlc2NyaXB0
aW9uIGVhcmxpZXIgaXQgZG9lcyBzb3VuZCBsaWtlIGl0IGlzIGFuIGlucHV0IHRvDQo+Pj4+PiB0
aGUgaGxjZGMsIGJ1dCBub3cgeW91IGFyZSBjbGFpbWluZyB0aGF0IGl0IGlzIG5vdC4NCj4+Pj4g
VGhlIExWRFMgUExMIHNlcnZlcyBhcyBhbiBpbnB1dCB0byBib3RoIHRoZSBMQ0RDIGFuZCBMVkRT
Qw0KPj4+IFRoZW4gaXQgc2hvdWxkIGJlIGFuIGlucHV0IHRvIGJvdGggdGhlIExDREMgYW5kIExW
RFNDIGluIHRoZSBkZXZpY2V0cmVlLg0KPj4gRm9yIHRoZSBMVkRTQyB0byBvcGVyYXRlLCB0aGUg
cHJlc2VuY2Ugb2YgdGhlIExWRFMgUExMIGlzIGNydWNpYWwuIEhvd2V2ZXIsIGluIHRoZSBjYXNl
IG9mIHRoZSBMQ0RDLCBMVkRTIFBMTCBpcyBub3QgZXNzZW50aWFsIGZvciBpdHMgb3BlcmF0aW9u
IHVubGVzcyBMVkRTIGludGVyZmFjZSBpcyB1c2VkIGFuZCB3aGVuIGl0IGlzIHVzZWQgbHZkcyBk
cml2ZXIgd2lsbCB0YWtlIGNhcmUgb2YgcHJlcGFyaW5nIGFuZCBlbmFibGluZyB0aGUgTFZEUyBQ
TEwuDQo+IFBsZWFzZSBmaXggeW91ciBsaW5lIHdyYXBwaW5nLCBub3Qgc3VyZSB3aGF0J3MgZ29p
bmcgb24gaGVyZSwgYnV0IHRoZXNlDQo+IGxpbmVzIGFyZSBzdXBlciBsb25nLg0KPiANCj4+IENv
bnNlcXVlbnRseSwgaXQgc2VlbXMgdGhhdCB0aGVyZSBtaWdodCBub3QgYmUgYW55IHNpZ25pZmlj
YW50IGFjdGlvbnMgd2UgY2FuIHRha2Ugd2l0aGluIHRoZSBMQ0QgZHJpdmVyIHJlZ2FyZGluZyB0
aGUgTFZEUyBQTEwuDQo+IFlvdSBzaG91bGQgYmUgZ2V0dGluZyBhIHJlZmVyZW5jZSB0byB0aGUg
Y2xvY2sgYW5kIGNhbGxpbmcgZW5hYmxlIG9uIGl0DQo+IGV0YywgZXZlbiBpZiB0aGUgTFZEU0Mg
aXMgYWxzbyBkb2luZyBzby4gVGhhdCB3aWxsIGFsbG93IHRoZSBjbG9jaw0KPiBmcmFtZXdvcmsg
dG8gY29ycmVjdGx5IHRyYWNrIHVzZXJzLg0KPiANCj4+IElmIHRoZXJlIGFyZSBubyBpbnRlbnRp
b25zIHRvIHV0aWxpemUgaXQgd2l0aGluIHRoZSBkcml2ZXIsIGlzIGl0IG5lY2Vzc2FyeSB0byBl
eHBsaWNpdGx5IGRlc2lnbmF0ZSBpdCBhcyBhbiBpbnB1dCBpbiB0aGUgZGV2aWNlIHRyZWU/DQo+
IFRoZSBiaW5kaW5nIGRlc2NyaWJlcyB0aGUgaGFyZHdhcmUsIHNvIHllcyBpdCBzaG91bGQgYmUg
dGhlcmUuIFdoYXQgdGhlDQo+IGRyaXZlciBpbXBsZW1lbnRhdGlvbiBkb2VzIHdpdGggdGhlIGNs
b2NrIGlzIG5vdCByZWxldmFudC4gVGhhdCBzYWlkLCBJDQo+IHRoaW5rIHRoZSBkcml2ZXIgc2hv
dWxkIGFjdHVhbGx5IGJlIHVzaW5nIGl0LCBhcyBJIHdyb3RlIGFib3ZlLg0KPiANCj4+IElmIHll
cywgSSB3aWxsIHVwZGF0ZSB0aGUgYmluZGluZ3Mgd2l0aCBvcHRpb25hbCBMVkRTIFBMTCBjbG9j
ay4NCj4+DQo+PiBjbG9jay1uYW1lczoNCj4+ICAgIGl0ZW1zOg0KPj4gICAgICAtIGNvbnN0OiBw
ZXJpcGhfY2xrDQo+PiAgICAgIC0gY29uc3Q6IHN5c19jbGsNCj4+ICAgICAgLSBjb25zdDogc2xv
d19jbGsNCj4+ICAgICAgLSBjb25zdDogbHZkc19wbGwgICMgT3B0aW9uYWwgY2xvY2sNCj4gVGhp
cyBsb29rcyBjb3JyZWN0LCBidXQgdGhlIGNvbW1lbnQgaXMgbm90IG5lZWRlZC4gU2V0dGluZyBt
aW5JdGVtczogMw0KPiBkb2VzIHRoaXMgZm9yIHlvdS4NClN1cmUsIHRoYW5rcy4NCj4gDQo+Pj4+
IHdpdGggdGhlDQo+Pj4+IExWRFNfUExMIG11bHRpcGxpZWQgYnkgNyBmb3IgdGhlIFBpeGVsIGNs
b2NrIHRvIHRoZSBMVkRTIFBIWSwgYW5kDQo+Pj4gQXJlIHlvdSBzdXJlPyBUaGUgZGlhZ3JhbSBk
b2Vzbid0IHNob3cgYSBtdWx0aXBsaWVyLCB0aGUgN3ggY29tbWVudA0KPj4+IHRoZXJlIHNlZW1z
IHRvIGJlIHNob3dpbmcgcmVsYXRpb25zPw0KPj4gU29ycnksDQo+PiBMVkRTIFBMTCA9IChQQ0sg
KiA3KSBnb2VzIHRvIExWRFNDIFBIWQ0KPj4gUENLID0gKExWRFMgUExMIC8gNykgZ29lcyB0byBM
Q0RDDQo+IEknbGwgdGFrZSB5b3VyIHdvcmQgZm9yIGl0IPCfmYINCj4gDQo+Pj4+IExWRFNfUExM
IGRpdmlkZWQgYnkgNyBmb3IgdGhlIFBpeGVsIGNsb2NrIHRvIHRoZSBMQ0RDLg0KPj4+PiBJIGFt
IGluY2xpbmVkIHRvIGJlbGlldmUgdGhhdCBhcHByb3ByaWF0ZWx5IGNvbmZpZ3VyaW5nIGFuZCBl
bmFibGluZyBpdA0KPj4+PiBpbiB0aGUgTFZEUyBkcml2ZXIgd291bGQgYmUgdGhlIGFwcHJvcHJp
YXRlIGNvdXJzZSBvZiBhY3Rpb24uDQo+Pj4gV2UncmUgdGFsa2luZyBhYm91dCBiaW5kaW5ncyBo
ZXJlLCBub3QgZHJpdmVycywgYnV0IEkgd291bGQgaW1hZ2luZSB0aGF0DQo+Pj4gaWYgdHdvIHBl
cmlwaGVyYWxzIGFyZSB1c2luZyB0aGUgc2FtZSBjbG9jayB0aGVuIGJvdGggb2YgdGhlbSBzaG91
bGQgYmUNCj4+PiBnZXR0aW5nIGEgcmVmZXJlbmNlIHRvIGFuZCBlbmFibGluZyB0aGF0IGNsb2Nr
IHNvIHRoYXQgdGhlIGNsb2NrDQo+Pj4gZnJhbWV3b3JrIGNhbiBjb3JyZWN0bHkgdHJhY2sgdGhl
IHVzZXJzLg0KPj4+DQo+Pj4+PiBJIGRvbid0IGtub3cgeW91ciBoYXJkd2FyZSwgc28gSSBoYXZl
IG5vIGlkZWEgd2hpY2ggb2YgdGhlIHR3byBpcw0KPj4+Pj4gY29ycmVjdCwgYnV0IGl0IHNvdW5k
cyBsaWtlIHRoZSBmb3JtZXIuIFdpdGhvdXQgZGlnZ2luZyBpbnRvIGhvdyB0aGlzDQo+Pj4+PiB3
b3JrcyBteSBhc3N1bXB0aW9uIGFib3V0IHRoZSBoYXJkd2FyZSBoZXJlIGxvb2tzIGxpa2UgaXMg
dGhhdCB0aGUgbHZkcw0KPj4+Pj4gY29udHJvbGxlciBpcyBhIGNsb2NrIHByb3ZpZGVyLA0KPj4+
PiBJdCdzIGEgUExMIGNsb2NrIGZyb20gUE1DLg0KPj4+Pg0KPj4+Pj4gYW5kIHRoYXQgdGhlIGx2
ZHMgY29udHJvbGxlcidzIGNsb2NrIGlzDQo+Pj4+PiBhbiBvcHRpb25hbCBpbnB1dCBmb3IgdGhl
IGhsY2RjLg0KPj4+PiBBZ2FpbiBpdCdzIGEgUExMIGNsb2NrIGZyb20gUE1DLg0KPj4+Pg0KPj4+
PiBQbGVhc2UgcmVmZXIgU2VjdGlvbiAzOS4zDQo+Pj4+IGh0dHBzOi8vd3cxLm1pY3JvY2hpcC5j
b20vZG93bmxvYWRzL2FlbURvY3VtZW50cy9kb2N1bWVudHMvTVBVMzIvUHJvZHVjdERvY3VtZW50
cy9EYXRhU2hlZXRzL1NBTTlYNy1TZXJpZXMtRGF0YS1TaGVldC1EUzYwMDAxODEzLnBkZg0KPj4+
IEl0IGlzIG5vdCB0aGUgc2FtZSBleGFjdCBjbG9jayBhcyB5b3UgcG9pbnRlZCBvdXQgYWJvdmUg
dGhvdWdoLCBzbyB0aGUNCj4+PiBieSA3IGRpdmlkZXIgc2hvdWxkIGJlIG1vZGVsbGVkLg0KPj4g
TW9kZWxsZWQgaW4gbWZkIGJpbmRpbmc/IElmIHBvc3NpYmxlLCBjb3VsZCB5b3UgcGxlYXNlIHBy
b3ZpZGUgYW4gZXhhbXBsZSBmb3IgYmV0dGVyIGNsYXJpdHk/IFRoYW5rIHlvdS4NCj4gV2hhdGV2
ZXIgbm9kZSBjb3JyZXNwb25kcyB0byB0aGUgcmVnaXN0ZXIgcmFuZ2UgY29udHJvbGxpbmcgdGhp
cyBQTEwNCj4gc2hvdWxkIGJlIGEgImNsb2NrLWNvbnRyb2xsZXIiIChsaWtlIGFueSBvdGhlciBj
bG9jayBwcm92aWRlciBkb2VzKS4NCj4gWW91ciBQTUMgc2hvdWxkIGhhdmUgdGhpcyBwcm9wZXJ0
eS4gSSBkb24ndCBrbm93IGlmIHRoZSBjb3JyZWN0IGxvY2F0aW9uDQo+IGlzIHRoZSBtZmQgbm9k
ZSBvciBzb21ld2hlcmUgZWxzZSwgeW91J2xsIGhhdmUgdG8gY2hlY2sgeW91ciBkb2NzLg0KU3Vy
ZSwgTm90ZWQuIEknbGwgZG8gdGhhdCBpbiBzZXBhcmF0ZSBwYXRjaC4NCi0tLQ0KSSB3aWxsIHBy
b2NlZWQgd2l0aCB1cGRhdGluZyB0aGUgY2xvY2sgbmFtZXMgdG8gaW5jbHVkZSAibHZkcyBwbGwi
IGFuZCANCmFkanVzdGluZyB0aGUgY2xvY2tzIG1pbml0ZW1zIHRvIDMuIERvZXMgdGhpcyBzZWVt
IGFwcHJvcHJpYXRlIHRvIHlvdT8NCg0KUGxlYXNlIGxldCBtZSBrbm93IGlmIHRoZXJlIGFyZSBh
bnkgYWRkaXRpb25hbCBjb25zaWRlcmF0aW9ucyBvciANCnNwZWNpZmljIGFzcGVjdHMgdGhhdCBy
ZXF1aXJlIGF0dGVudGlvbi4NCg0KLS0gDQpXaXRoIEJlc3QgUmVnYXJkcywNCkRoYXJtYSBCLg0K
PiANCj4gVGhhbmtzLA0KPiBDb25vci4NCg0KDQo=
