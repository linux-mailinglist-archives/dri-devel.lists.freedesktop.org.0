Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5428B3DABD0
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 21:24:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 558576EE3D;
	Thu, 29 Jul 2021 19:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 627676EE3A;
 Thu, 29 Jul 2021 19:24:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1627586649; x=1659122649;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=BrzIPmVJIcXktdNijGTfglym0nza4FHDfOV7YnOUQUc=;
 b=tj0g3IqaiWi7Y88+1uHWijpvGtdL0DDldTfBirvEzL+cp9uwO+jA3pma
 T4ZdvGwzAVhsVbVF+SQvrsNEOArho6gmZsa3ajDCRkHN7uniV/F/v81EJ
 v5u5QVxzbHKjjRqub/oZMBymznEyqcKWNbaD0iy24neoMAxBRVBeA2fLQ
 6D3GKCz2rN/1E5AeyECABmQNUik/9tlQnvd1T4ZrJWtk5o2/Vhzmwfd4j
 tpWjsghujvuMnh8/oIRudHgRL7Eslzb/wxLbMurk+PQuToBk8rk4HVKNx
 RymojivY9JsgtR5lSbQeLSRMcxnsZsIMuk86j/yDLgZmtZuUYp0MtV0cC Q==;
IronPort-SDR: AEQYI0E11iH5KOVsvhKi4Jntdan5U1ohYfr1t+Hg6dXyAPAqNcTdirVs9vkXrSTDSZwAa/LADt
 YrQp/QeuL/Zw3mzmTN5vKlSiI7XG+zZHiDqevIDQsl1ZifRAqA9pzCgmHscLCqlxuFNAm277p1
 Ge7e+ZsFkot+dQykDCWHzazys7iAO5leuac5YGOZdESMPhjnSBDomti9gpZtF+torZ3WhfzJl6
 pUaGHAV0l3dC0xZ6ZM4Zq8j4ShLc05Sfb92Nb9ropWwXV0pKZGY7NR0U1N/UXGCrzNsWXJJKuL
 SQmSznPP5heSGu7/367XkUAJ
X-IronPort-AV: E=Sophos;i="5.84,279,1620716400"; d="scan'208";a="130340803"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Jul 2021 12:24:07 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Thu, 29 Jul 2021 12:24:06 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, 
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2 via Frontend
 Transport; Thu, 29 Jul 2021 12:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l+0yAeKbiVGtgg1QIsgb/9JWaQoRlxn/evnhrtMZII6KbFBkUmsBeV+8tnk0anGCRS+G7hRxVvTAqmN1bZY354NXlvleozQ4TqLZWP+lB6huHMTp0Q+elgXFA3gyPtP/JGeO/1FRpKShBFhFuQZb95+o4M8cungAmGlyHajXPsoz2L0oDZqwtWwxQt9UKOnpmvP5MV8sHramkAosuVK4/qC/Ad6NtcNYM+D871kRmgAHgVNVemLBALko00SlsgRrfjSxa8ZJ01dR44dbC4ME7FgszMeOYr7S4DfJwa4WazjK5osQuKZYdjhDKoGNVWg2Y10dJ38QNm4+Y47hl6pwNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrzIPmVJIcXktdNijGTfglym0nza4FHDfOV7YnOUQUc=;
 b=GMURDLEJtb7niiTg1Ma7s92nssbgt28L++6jUmTrwSwTxJSp6mdUZHQ20jb93LzYwUUPzlrnMNyslVTy3vqxzYs704ugckQOGXvHtgYEHDrw5a2wWVTXqOvC5M3J418SGd3QfnzbD/dKNinKgDvObCJ6At31jxE/vfKQ8DM/QQFfvn9qS0MKm+EQKAiDwa7Zy0JgOm5KgSqR9KkI7vDs3uZaja0ChrhRGgkBsdbW0MjDOuTFfZ7ktgz5dWy+4m5ZF0l3gSobOcRwXTp6AN8jCxRyPvPMRJK+320/47RHINRN4XMR8WR3R76eMwbD1rUx9q7wsottSd8oV03SPNN3Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BrzIPmVJIcXktdNijGTfglym0nza4FHDfOV7YnOUQUc=;
 b=m6TOzuebqDGNXzaNDtT0YZj6zEn8j3iRWlZCXoBWDt/lvj1vVrIAte8Ld4omjffEtWAJqqvqeApJyXjjHNk8EZOKZJ5viPF4rHu532IDV7pK8QQxd28hvWSmiN95SIVhCDzjJZdb7+MVWdzTOG0djEttBkvKzfhcx4uTv6X12/c=
Received: from BY5PR11MB4007.namprd11.prod.outlook.com (2603:10b6:a03:189::28)
 by BY5PR11MB4308.namprd11.prod.outlook.com (2603:10b6:a03:1b9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.19; Thu, 29 Jul
 2021 19:24:02 +0000
Received: from BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf]) by BY5PR11MB4007.namprd11.prod.outlook.com
 ([fe80::e478:6b2c:f71e:65bf%5]) with mapi id 15.20.4373.021; Thu, 29 Jul 2021
 19:24:02 +0000
From: <Dan.Sneddon@microchip.com>
To: <tzimmermann@suse.de>, <sam@ravnborg.org>, <Dan.Sneddon@microchip.com>
Subject: Re: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
Thread-Topic: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ
 interfaces
Thread-Index: AQHXg+V9u4IBzc/SHUWKaqikrAmiK6tY0cGAgAGDewCAAAGLgA==
Date: Thu, 29 Jul 2021 19:24:02 +0000
Message-ID: <cf070795-a660-535a-0bb4-65c01710f280@microchip.com>
References: <20210727182721.17981-4-tzimmermann@suse.de>
 <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
 <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
In-Reply-To: <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
authentication-results: suse.de; dkim=none (message not signed)
 header.d=none;suse.de; dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 27046d47-b48d-47c0-2622-08d952c66c62
x-ms-traffictypediagnostic: BY5PR11MB4308:
x-ms-exchange-transport-forked: True
x-microsoft-antispam-prvs: <BY5PR11MB4308F1C530893D70881FC462E1EB9@BY5PR11MB4308.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:3826;
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3We0H0F/nvrvskGm8Ca5JTDulxE5K1PTkeM6Tcp4CqnVTEtrhx8qZYaetk6Odhn5o2JM4+cFT2c0b7RVsKWJ6WOYhQpy+zUvzPDfcuw6K8Q5fDMS8nM4i/RqIO6tURlfzKYK2IC5YpTXeL1kkhSSUz4ZGz8z04Axm07lTayFZgqZYMrnUhFtvZsjsQm+Vp+yPtLdQ+Sy0oLLsBRWYriNL1hm7YLyl3gXlznhHy3+TiMsJicqLvy/91F2uU9eVq57v88tJ37XgATElwd99AhlyO2O9SSmHWvF5IvHZniI/OWHjdojwtG9IGBp5KunyctZn2QQ8ox+EL6gXiqi9Odu30qEYCW44jlOwgut3QOqwy9WB65RJaer1GyILpXYteqJVpZmlidpO1eZ/VZExhwTnGLDaedCIdc3FpqRQPBJlt2ce+gv71lCw18AM0zdQwPXSYMslFV5OV+0YZbxjc41hw2cT8V4905Kf8ejF1csTTKYdYoc3nMcd62hS4eCZjUnPrwPglov43O32yslGzv+gZQBkHP4Mqd1yPj5kZijQ2q4inVhj4M10OI2PyJLmarz0k/WD6Kiaa9FSp1TQkZZjvuceS6yuaxCtSviMYhCyBTjjHYwycbd9f+0ESuArD9UGybYcOKZYs846MxiOcXHD7wrnU+bUzac52bYf9RpGAXpsRrTv4p7mV1f5togtdl4WoTALzskwr6iMUj2oTqxA5hUb7Q4eDew7Vi8sML6kaAn7bp2rwt71xKkwTp2Ayzcp6FlMC4iyiJ3IQ5erQHWfQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR11MB4007.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(396003)(39860400002)(376002)(346002)(136003)(316002)(26005)(31686004)(110136005)(2616005)(36756003)(6512007)(54906003)(5660300002)(8676002)(186003)(76116006)(66556008)(83380400001)(38100700002)(122000001)(66446008)(66946007)(38070700005)(66476007)(64756008)(6506007)(86362001)(4326008)(71200400001)(478600001)(31696002)(2906002)(6486002)(7416002)(53546011)(8936002)(91956017)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?dkFxNWlyZThmU0Y3d25wTnhFcm1NcFdaTUVnTHlKdGRHQVNyUmJXN1R0N0NG?=
 =?utf-8?B?NUV5aTZRcmRqM2VkdkladmpJRmVQTm1namVoL0Q2TEtScmYzaHVKQlBkZzVh?=
 =?utf-8?B?d0s4ZkVWNUFrZitTYUwyMlMyL0psd1NRN0liQXpVeFZYUWZIUVczTEQ2YjNz?=
 =?utf-8?B?NXpUTStMSm9BeTRqazdnZGtqb2xQaDJDQkRIQTI5WjMydGRFdmpaM3ZrM25R?=
 =?utf-8?B?bHhQOXhqNzNwYU9NZTJFWXUwU1NYbG9leENwUEhvWHVCU25nUi9Gc2s2dk1v?=
 =?utf-8?B?L2tFY3BERHFDN1lJR24rdzFQckFnZktHT0ZRWmF0b1BkWGlWNU13dnNkNStk?=
 =?utf-8?B?Y0ZrdjZwZk0xUEFidmhKR3V1WjNJblduUCt3VjhlQXFWVEF5UGJ2LzkweWgw?=
 =?utf-8?B?L0VDNFl3dkZNclVpSndVUGJlV3dXTTROWHNsZEsxTy83M0NmT3Z6STZVcjZJ?=
 =?utf-8?B?N3VTWjNkdjNvd1BaTHB2MVVWSmJFVVRjMGFnbk1pVFVQQ3ExQkxGT0huN254?=
 =?utf-8?B?eGxMTDNsZEUyTzhTbnJQMlNIWDZwTUJSU0gweUFza213NER0aXhOekN5cUNw?=
 =?utf-8?B?UDNQSWt3WjNCczU5OEZ4UVdZYitOVS9TRnRGZEFqeGFFQWdPeWRSNkh3UmJS?=
 =?utf-8?B?ZEpZNGVqS3MxZEdTbndjY3gycHRWOTJEdUZTSWRVMm1oRHBYbWRDZDdTK3Vz?=
 =?utf-8?B?cDhNYURMdmsySXpUQnUwN05GVXVXNzRuSUM0WXFtd3pTYldob2o5SHlkWDhW?=
 =?utf-8?B?elEwdGxpc2s1QXpCZ2hWeW96NCtLYzBJMEs3U3Y2YlAwdi9zMmZxR0VOZ0JW?=
 =?utf-8?B?enorZFZ5aEQxbHNmdXREQUdIT0lJTGdkWGlPNkU3dVRZUGdaMlFmNVlJaTRy?=
 =?utf-8?B?anlIMVpVRTFwN3FHUWppVHpTM0pRcGt3bjFxNk9yTmRZbVFXczVxbkxIY2N4?=
 =?utf-8?B?bm85YjRKNTJkUWtOYUFvYzZlV2JRdVZoRjBqSEx0Y3lyV0ErU3llNmRsckNR?=
 =?utf-8?B?SWE5OWkrWGVLdHVVbmtMRDdqQktSekRuT2xmWjRwRzNGcXhxTVNiK2NscHkr?=
 =?utf-8?B?cUJMZko5VEpObGlPTXhac1JzN2dvSTN4MVpaL2FFTE5abTRZY2owVXVlaS9Y?=
 =?utf-8?B?SlBGcy9DZjkxa20vZGNSb0t1eVpMdEwwQUtYcUpiSVFRbEhOakNyVDRVdFE1?=
 =?utf-8?B?TzltYXVQaHp5Ylh5ZnJzenh6YjROSVZhaFpKVDBSRXdtQ0hCV1F5c0ptRW4v?=
 =?utf-8?B?WWN1dGo2elhzM1lCaFlKdy9HZVdRdFlEb01TejlmemQzMnlXUEtkQnZiNUth?=
 =?utf-8?B?dm0wWFJVdnNmZ0RWdkYyWjZFdkxJYWZWQUpEQlBNWkkrKzk4MVhMd0ZROCsv?=
 =?utf-8?B?ZXBoaVArNVM4ZE42QkNVakQ0TmtWUU1VZkZBVVdaS1hUWEpYU1pacTdMQkxX?=
 =?utf-8?B?anZRZFNLN21VV1ZrUkdGemRta2JmZHJ3ZVlzL3dGVmdPUFFHdHJKVVEvb2l3?=
 =?utf-8?B?YlJVdnorT0FUeDJ4NDZRZ3d6NXJZQkxYajQzNTJ2cDdscDhxNWNleSttN3Iw?=
 =?utf-8?B?ZTZKMERNYituaWUrWnZhRnUySFpaYnoxRTN2TURTa2k0Nk9zL2pCZGsxaWdV?=
 =?utf-8?B?NUE1ZzFyMXRhUXVJMXVuWFhrdjlUZ2ZGUGVOWVFjNlc2L3I5cjdQQUNndXhn?=
 =?utf-8?B?TjdlWndCUXVleVpYVEpWdUFQTG0zZnNuVDVQaWtqTWcwNlZvNjdrdHI1SjJJ?=
 =?utf-8?Q?8ft2Wkzh8sn0rX3M1U+wLTUBR1hjoyGgXPq18wL?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <26ADC88EECD9C44796B22639FFE9D00D@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4007.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27046d47-b48d-47c0-2622-08d952c66c62
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Jul 2021 19:24:02.3350 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wSfX0gtdNHZaRRjv7fmHb8XkksYk/6NQxcgJUPWow40pJybBAuShIB9tQAXu6C7WOPIDGMc5L/3YQciuaRzC3F3cBxplMyZo1j2oxTU+qVk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR11MB4308
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, Nicolas.Ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SGkgVGhvbWFzLA0KDQpPbiA3LzI5LzIxIDEyOjE4IFBNLCBUaG9tYXMgWmltbWVybWFubiB3cm90
ZToNCj4gSGkNCj4gDQo+IEFtIDI4LjA3LjIxIHVtIDIyOjExIHNjaHJpZWIgU2FtIFJhdm5ib3Jn
Og0KPj4gSGkgRGFuLA0KPj4NCj4+Pj4NCj4+Pj4gSSB0aGluayBJIGdvdCBpdCAtIHdlIG5lZWQg
dG8gc2V0IGlycV9lbmFibGVkIHRvIHRydWUuDQo+Pj4+IFRoZSBkb2N1bWVudGF0aW9uIHNheXMg
c286DQo+Pj4+ICINCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBAaXJxX2VuYWJsZWQ6DQo+
Pj4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgICoNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBJ
bmRpY2F0ZXMgdGhhdCBpbnRlcnJ1cHQgaGFuZGxpbmcgaXMgZW5hYmxlZCwgDQo+Pj4+IHNwZWNp
ZmljYWxseSB2YmxhbmsNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiBoYW5kbGluZy4gRHJp
dmVycyB3aGljaCBkb24ndCB1c2UgZHJtX2lycV9pbnN0YWxsKCkgDQo+Pj4+IG5lZWQgdG8gc2V0
IHRoaXMNCj4+Pj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgKiB0byB0cnVlIG1hbnVhbGx5Lg0KPj4+
PiAiDQo+Pj4+DQo+Pj4+IENhbiB5b3UgdHJ5IHRvIGFkZCB0aGUgZm9sbG93aW5nIGxpbmU6DQo+
Pj4+DQo+Pj4+DQo+Pj4+ICtzdGF0aWMgaW50IGF0bWVsX2hsY2RjX2RjX2lycV9pbnN0YWxsKHN0
cnVjdCBkcm1fZGV2aWNlICpkZXYsIA0KPj4+PiB1bnNpZ25lZCBpbnQgaXJxKQ0KPj4+PiArew0K
Pj4+PiArwqDCoMKgwqDCoMKgIGludCByZXQ7DQo+Pj4+ICsNCj4+Pj4gK8KgwqDCoMKgwqDCoCBp
ZiAoaXJxID09IElSUV9OT1RDT05ORUNURUQpDQo+Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJldHVybiAtRU5PVENPTk47DQo+Pj4+ICsNCj4+Pj4NCj4+Pj4gwqDCoMKgwqDCoMKg
wqDCoMKgIGRldi0+aXJxX2VuYWJsZWQgPSB0cnVlO8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCA8PSBUSElTIExJTkUNCj4+Pj4NCj4+Pj4NCj4+Pj4gK8KgwqDCoMKgwqDCoCBhdG1lbF9o
bGNkY19kY19pcnFfZGlzYWJsZShkZXYpOw0KPj4+PiArDQo+Pj4+ICvCoMKgwqDCoMKgwqAgcmV0
ID0gcmVxdWVzdF9pcnEoaXJxLCBhdG1lbF9obGNkY19kY19pcnFfaGFuZGxlciwgMCwgDQo+Pj4+
IGRldi0+ZHJpdmVyLT5uYW1lLCBkZXYpOw0KPj4+PiArwqDCoMKgwqDCoMKgIGlmIChyZXQpDQo+
Pj4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybiByZXQ7DQo+Pj4+DQo+Pj4+
IEkgaG9wZSB0aGlzIGZpeGVzIGl0Lg0KPj4+DQo+Pj4gSXQgZG9lcyHCoCBXaXRoIHRoZSBpcnFf
ZW5hYmxlZCBsaW5lIGFkZGVkIGV2ZXJ5dGhpbmcgaXMgbG9va2luZyBnb29kLg0KPiANCj4gQXJl
IHlvdSBzdXJlLCB5b3UncmUgdGVzdGluZyB3aXRoIHRoZSBsYXRlc3QgZHJtLW1pc2MtbmV4dCBv
ciBkcm0tdGlwPyANCj4gQmVjYXVzZSB1c2luZyBpcnFfZW5hYmxlZCBpcyBkZXByZWNhdGVkIGFu
ZCB0aGUgZmxhZyB3YXMgcmVjZW50bHkgDQo+IHJlcGxhY2VkIGJ5IGNvbW1pdCAxZTRjZDc4ZWQ0
OTMgKCJkcm06IERvbid0IHRlc3QgZm9yIElSUSBzdXBwb3J0IGluIA0KPiBWQkxBTksgaW9jdGxz
IikuDQo+IA0KPiBCZXN0IHJlZ2FyZHMNCj4gVGhvbWFzDQo+IA0KDQpJIHdhcyB0ZXN0aW5nIHdp
dGggNS4xNC1yYzMuICBJIGNhbiB0ZXN0IHdpdGggZHJtLXRpcCBvciBkcm0tbWlzYy1uZXh0LiAN
ClRoZXJlIGEgcHJlZmVycmVkIGJyYW5jaCB0byB0ZXN0IGZyb20/DQoNClRoYW5rcyBhbmQgcmVn
YXJkcywNCkRhbg0KDQo+Pg0KPj4gR3JlYXQsIHRoYW5rcyBmb3IgdGVzdGluZy4NCj4+DQo+PiBU
aG9tYXMgLSBJIGFzc3VtZSB5b3Ugd2lsbCBkbyBhIHJlLXNwaW4gYW5kIHRoZXJlIGlzIGxpa2Vs
eSBzb21lIGZpeGVzDQo+PiBmb3IgdGhlIGFwcGxpZWQgSVJRIGNvbnZlcnNpb25zIHRvby4NCj4+
DQo+PiBOb3RlIC0gaXJxX2VuYWJsZWQgbXVzdCBiZSBjbGVhcmVkIGlmIHJlcXVlc3RfaXJxIGZh
aWxzLiBJIGRpZCBub3QNCj4+IGluY2x1ZGUgdGhpcyBpbiB0aGUgdGVzdGluZyBoZXJlLg0KPj4N
Cj4+IMKgwqDCoMKgU2FtDQo+Pg0KPiANCg0K
