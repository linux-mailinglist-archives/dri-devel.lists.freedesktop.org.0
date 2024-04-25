Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B968B19FF
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 06:42:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7056E11A0CF;
	Thu, 25 Apr 2024 04:41:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="z0Xjwj7f";
	dkim=pass (2048-bit key; unprotected) header.d=microchip.com header.i=@microchip.com header.b="RbEEYWJQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com
 [68.232.153.233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A3A711A0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Apr 2024 04:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1714020116; x=1745556116;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=KDEeTQ0togEzHO8BK2gY2RivJIUoRN24dRmSkJ8KXkI=;
 b=z0Xjwj7fMGAZ1ffSihFHirEUOdEWWG+FXDZ7ZUEpOGKOA3wtuUQRYfoR
 p+gGDnggOpExChlzeoUCojdqmOn26OprPf/vUEYdF6YOrI+AQF7D0mB7e
 lGdB0dxPtEcG03a6JhCV8but3v4LWT9OSOtk7k6FOZ4GqVJizLHc07PxR
 IVtBmx18AHNhlHeUaZstI+G5JWHRsANLpIds3iSSiK/GlfhYIavLF7Kd7
 zxgFVhPD1gNlfdErwBtqtYznlNnqHCS2AHQOn3EPM6DWktcjRSVold0Wt
 MZcm1uUjKFle9C1KFBRbQWk4OK44v/7O/4Avt/vtUk1xWvyfch5arHDRn A==;
X-CSE-ConnectionGUID: PB5qwDi1Qz+byM4kbrWImQ==
X-CSE-MsgGUID: oA8LVF9sRmKT2M/LkPNymg==
X-IronPort-AV: E=Sophos;i="6.07,228,1708412400"; d="scan'208";a="22574513"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
 by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 24 Apr 2024 21:41:55 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 24 Apr 2024 21:41:14 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (10.10.215.250)
 by email.microchip.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Wed, 24 Apr 2024 21:41:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PsY4XQ17XutThTkbMTfyT9LPsx+fD45OvSnDb2DtKO/ltc+fSYE/unSs7OvExyr70SE12jZoJmLpq5hxHeOb29FtH2pcJwZmdMPsz3W8+6Ld70PK3l7G8fRvMyKJfcyhBe40rPLMT2TV98mPjAb9frYnIlXNFQf/rNtc69b59QIi0AIX0Y434q+GvyCXwzBlNCB0mjKZWH4UsF5rT2Da7qHZBcrkba6epT64X9B+5ZtWUKhZgSca9ExAkp/FyMzKdAKFTHhID/gzwdPF88mrSdEBYvUmFHxFpImzDa/jeRQ8cjNrMVEJDBxhAXCeoX2rx1yHhnbJm6Rviz+6IF8ORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KDEeTQ0togEzHO8BK2gY2RivJIUoRN24dRmSkJ8KXkI=;
 b=gLgJU0/0Vx6JGZUZSm+NomDxgnJSB4fwuQ54rPsZeQVSO0Z55Ij2jjRneF0CdejUX2fNpcgr8lvr8rPbqoYoAfdghq4zxNXkFSPRkG6EsaRZAH2paqNuOAvdh7Xpz6PqQXc8buYbzzKkmMSo3wblKsZZxMUf4FnEP5CocD4P9g/b0r9uqjT2fA3ktr2BcUGYNyaxJrPgD4O3CDLW+ENjHzx+5jJY63hhyw8815j8sTD7aGa06CX4F1gD5yFKU95Y+KTtkdV1DaVCOWaS0rwZMeDF7oZDNKNYt4tDMrSzpDCNoilULvtKqUOM2ia8/5pkntmpfNb6Qto/ukuNjWi0Pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=microchip.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KDEeTQ0togEzHO8BK2gY2RivJIUoRN24dRmSkJ8KXkI=;
 b=RbEEYWJQMyoOF6LFv2JgAYIOhSCfOOq9rXjrhYBti2tanFBeSBD4o/VY3D+v00+JUsRpT+mE8jkx/F9ZU3LPoeYq0nWss6EEmbUY6sHWZK+A/ACt86ZgoZlcAS7nEhEOb8GEGN1qOHtNTrxNuom+HO5i5e5jpnxZowfGp+Ba1qjWQS58cU8V3iauilHR/oq2UKVwXxPxrnKrCaYZC1MJ6xsdtCF2PconxfaUQrx3daKbphh1ytmablwb7u5UoIvobtfPDiIvYbLSId6Ru3ddc+GQY1F6dA8xNX5OskPBreIdm5iwTxxPfU+Tk4lt8CDsJLoT6Op1KvgggPofFZuyXg==
Received: from PH7PR11MB6451.namprd11.prod.outlook.com (2603:10b6:510:1f4::16)
 by MW3PR11MB4602.namprd11.prod.outlook.com (2603:10b6:303:52::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.22; Thu, 25 Apr
 2024 04:41:12 +0000
Received: from PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd]) by PH7PR11MB6451.namprd11.prod.outlook.com
 ([fe80::c2e8:2ace:1ddf:54dd%3]) with mapi id 15.20.7519.023; Thu, 25 Apr 2024
 04:41:12 +0000
From: <Dharma.B@microchip.com>
To: <Manikandan.M@microchip.com>, <sam@ravnborg.org>, <bbrezillon@kernel.org>, 
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <airlied@gmail.com>, <daniel@ffwll.ch>,
 <Nicolas.Ferre@microchip.com>, <alexandre.belloni@bootlin.com>,
 <claudiu.beznea@tuxon.dev>, <lee@kernel.org>,
 <dri-devel@lists.freedesktop.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
CC: <Hari.PrasathGE@microchip.com>, <Balamanikandan.Gunasundar@microchip.com>, 
 <Durai.ManickamKR@microchip.com>, <Nayabbasha.Sayed@microchip.com>,
 <Varshini.Rajendran@microchip.com>, <Balakrishnan.S@microchip.com>,
 <Charan.Pedumuru@microchip.com>
Subject: Re: [PATCH RESEND v9 3/8] drm: atmel_hlcdc: replace regmap_read with
 regmap_read_poll_timeout
Thread-Topic: [PATCH RESEND v9 3/8] drm: atmel_hlcdc: replace regmap_read with
 regmap_read_poll_timeout
Thread-Index: AQHalglRXTa1W9UegEGrffoC7rsJU7F4aYQA
Date: Thu, 25 Apr 2024 04:41:12 +0000
Message-ID: <287606ef-ef90-456f-9190-bb1168b266f2@microchip.com>
References: <20240424053351.589830-1-manikandan.m@microchip.com>
 <20240424053351.589830-4-manikandan.m@microchip.com>
In-Reply-To: <20240424053351.589830-4-manikandan.m@microchip.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=microchip.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR11MB6451:EE_|MW3PR11MB4602:EE_
x-ms-office365-filtering-correlation-id: 143e6897-0829-4991-50f2-08dc64e1ef60
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230031|366007|7416005|1800799015|376005|921011|38070700009; 
x-microsoft-antispam-message-info: =?utf-8?B?SThSRlBiWFJUMVVGLzBPNm5WajE4cmxaWXUwK3JtY0RZb09KTDlGQjhmd1ZP?=
 =?utf-8?B?dDF4ZmRPYzBRcUFRZEZyZG5tY3hWMldwc0tZaEdod2Jyd2hIWHBpbHVvWDZY?=
 =?utf-8?B?dHdyTEpleFY1Nmt1Tmt3WlVjakxQcDZTcUwrUkprbWFMUkRpaHhSL20zYWlx?=
 =?utf-8?B?cE1uS1NKdkc4UDF5OUErdFJPMytVdE1nK2Q5b3FZdDhQb01BeTB0bXF3aDhj?=
 =?utf-8?B?Z0JUemEzcFI1ellxdXlhcVZnOTU0ak90QkpRT241Z0ZGZkE1U0hRQ01zZVho?=
 =?utf-8?B?bmU4d2hzTk1hbG1RUmdMM281WUhxa3l2cVpxbWdTSjYvVENCWXI3YVVNaG5Q?=
 =?utf-8?B?SXJwdFNXRlQvUU03TkRLNlpUcVQ4Tk5QcmFlNytEMlhkbTRJQnQ1eWs4ekcz?=
 =?utf-8?B?N1l2V2ZWRFBvOVZnTTU1cWVaQzZISGhBL0hGTmFLVi9hc2dlTzZwbjNVeVN5?=
 =?utf-8?B?ZUJIT2EzNGFuK3hRc3BjYlVCRlNRcG1zQ1pRczF0MDJIZHNjR2JHR05tb09R?=
 =?utf-8?B?cW14dXd1VWdwZU1jbElDWU5zakgvTVVpWjdiS2txckdiOHVHWE05TjA5QnpZ?=
 =?utf-8?B?VXRCQ282cWorM0JYTGJQNHNraGZkYUZwODJXbnNVUWZFQXVpRWRNMkFsa3FV?=
 =?utf-8?B?RS9aUWNuTHgxTUY0TDRzRmYvSy9YRWlPL2JGOEtxZVBQdHo3Y0l6SGk4NHBC?=
 =?utf-8?B?cmFMZC8vdUFlOEV3UHBrd2pmYWNYdlgvNklvZjlmT0pwczUxdHdMU0l1ejVI?=
 =?utf-8?B?NUFZaTNrUEp3dlJtUHNnNUNadEZYaU82WkRaVVJoNGptV25uZDlqOVpGVlRJ?=
 =?utf-8?B?WVpreGtQbWZOaDRYUnhXSFdSSE9oa2h1L3F5YXErY05JS084SnFsRVNKa05u?=
 =?utf-8?B?VktRVGxmY0ZpM2RTMkNsK05GOVdXWTNXbWdaWFFkaWV6dVNxbkdFeDlpcnYw?=
 =?utf-8?B?eUFiL0JKNkxhZ0M1QXZrbitLUEVrZndxdVZZUlZMQ21oTCtNOTlNcTVRWURJ?=
 =?utf-8?B?dVNjeXM2VHBkYVFneEpQdGFENDJHaGowQ2lGSXpqNGxXOEFlb1NtMGJMalpC?=
 =?utf-8?B?cXMzdDZJVHZMdGJkbkNlNTIyTmdyQUR3UmdpTC8rNVpkcExpWDhwZU5sQWM0?=
 =?utf-8?B?SW81TGFmN280QXIwMlRZaGRLMmxnTmlLYlV4b1dpajRFVkdCQ3Q1NFEzcjRy?=
 =?utf-8?B?WEQ4azVBaHRJVzFmKzBlTzI5WWZ1T3lRY0xMd21JQXMxMXVIdS9sZmk4bStP?=
 =?utf-8?B?T1dlbWNmZ1RzcGxTaHNGdkVaNHpZOWFUc09IZXhUaG5VZHhMaGtoQXFmWHB1?=
 =?utf-8?B?d3N5eTlTNzVpYXNvUkRtcjJ3bUhOVFdYbmh5U2ovMnVtZGJGaTQ5T2Q0OFpF?=
 =?utf-8?B?Z0FoUit3b3A4T1RaYVUvTTZCWGsxUXZ4RFpFTzVxeHY2L1g0ZUN5L1d1RlRl?=
 =?utf-8?B?Q1BkL1pHRVJpaHhtNkJaWlRPZlBVYUxrRVRwYWZlb3lNdHMxOXh6Wk5aQTdk?=
 =?utf-8?B?d3dRTUJjVG5NZHZEdjNaeUJOcVhRcUhDMkZqZEJoY21LU0o4V2pEYnZTSGRq?=
 =?utf-8?B?NFdoUzB0MVp1TTFFUW9VS243K1R5NWdVdlEwbnpGRmRBa3Y4Q01oa3pEZ1Vm?=
 =?utf-8?B?OVBjcUhKNEtiSDhMc3VaSnNHYnBLNEJLZmdoV2cvWUhYeGR2NHhQM0N0TUNL?=
 =?utf-8?B?S1c0SE9jbjg2QVBNMDhqNEJLTVRVeEJrTitvL1NsUFc1NU5taGlDeG9ocXZX?=
 =?utf-8?B?eDBWeWdZcGZNbmpMVVJTVHZ6SHVJM0pKMnlJWi9HS3I4ZEpwTEJQaE85bGxY?=
 =?utf-8?Q?SnX8QwVw7D1LKnYfcuKshihnQkZQrp9AZ0/QM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6451.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(7416005)(1800799015)(376005)(921011)(38070700009);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TzdsZ052d3ZUV0M1cVoxaDIyU1FWbXFCU1RnRlFpNjVVZ2lTSXFrcElhZ1BO?=
 =?utf-8?B?ZThxVk9oRFRlcnJEUzFXaENsc2Y4N0xoV08rejM2TXVOSk1aSUJRNHUxcUky?=
 =?utf-8?B?cUxNWVBvMTh6bTgwSFBYc1BTNVJTNUhiT2Fqcnkyak4rSzBRZ2ZiNHA2OUMx?=
 =?utf-8?B?bElhVTZiSlgvemxzbEpiU3lUNzFsUjV4RXRUbTJXZm1ETzNEdm8zWlA0SDE5?=
 =?utf-8?B?ZFNqOTVVZHRJaGdqZWwvT1IvV2J1WHhwaWo0T0g1SnNIR2pFcEtXSnk4bGUv?=
 =?utf-8?B?K2lPSUk1T1dHZHpRcVJCNDBaVjEwcytrbFJreWJobUIzaFlSUG54WGpkY25a?=
 =?utf-8?B?M1pZcmtkRDZwWElab3RyYVBYbjNpVXVpZGtHdGhkKzFIRFIxY0NVMjIxZFJU?=
 =?utf-8?B?ZGkxaWpSTWhham52THJjSXVYa29hMlFRYis4SEhyVlk0MVZ5aWdacW5GSXJq?=
 =?utf-8?B?bUg2NlNqZE93bEJGdS9EOU1KWk5IcGN5dmhyMW1XU1dsZTBId1hJV0RWeDd5?=
 =?utf-8?B?dzVkOGh4N2hpZTVuWmRlMXFMRXNyczRpTXBGdXF6RW9VVGkyUkJLVVg4alZI?=
 =?utf-8?B?OURqMjR1cnozUnk1UE0vZ0I3TGlUL2ZIL0hxVVhKNElnOGhyMzdXMWdkLzJt?=
 =?utf-8?B?ZjRHdTBYWWdJMTNETVdyMEZqeUJFT0RKdHRuUmUrSEF2OVd1T2J0bzFaQm9E?=
 =?utf-8?B?TGtuQ0JZbHMvcU1oOSs4ZFhidndLMjRkMVpmVSs3NnJGRUpHUHVxQk82djFV?=
 =?utf-8?B?OWJ4MGdLNDJnTTBFQW53MmUreUF5eEI3YjVFQllqQU02R3ZrL3oyREdjRDhS?=
 =?utf-8?B?b2d3dnBNN3d0Um5BMEl6MWNQUVp2RkJaT3Bhd1ZtTERDWEpYRGhqdGVaSzlS?=
 =?utf-8?B?VlFsQXJvVU1UdFBNaVVSWVZFSzE2WTB1VVBGSU5vUU52TDlURVlKQk8rM24z?=
 =?utf-8?B?S1VKUGJqa2FBd1VoU3BaOW93OG9xRTB2ZUo5M0c3UEVYVGRQQnZtdDNnb1Ry?=
 =?utf-8?B?YWxyanZVcTJlV1dtWVgrcmtTakhrcHdsbTh3NDJ0ZGQxQzk5OHNJNXVMMVkv?=
 =?utf-8?B?c0JxaDloaVAyUERibkxsSjV4M2NFVy9uQ0ZKWFQwSnJWbXd0aU1PcXNUek0r?=
 =?utf-8?B?SXpzcmt4QmZwa21WbGVKUzUxQWgwb1Zyc0dBUmVNZHQ1b05Jd3dBanVqUG0v?=
 =?utf-8?B?ZlBYQXRXMlZXMDhzbnRDRktadWZzbWVEYzNsSzNsSXFUMTBKRkZIVGhWVXBD?=
 =?utf-8?B?eFgvdzdBb2wzMHFJMm1kTkVsS2FqSzZaYlZLbzduampZN1dRb0hIb0ttcElY?=
 =?utf-8?B?ZVRhUC9JbG9XWnZCcVZBNXQrSXkwVjRyWlpMcWYwTUlFVUJtWm5FVllBb3g5?=
 =?utf-8?B?NWNHVDQybzNidnkxRW1ESUNIREloL245S1AyTHNKMGY4S0ZyQTZPUktxSStM?=
 =?utf-8?B?RWlaV3YxZC9RV00xZEI3Vm1VOWVBSDZlT3AweGlUN3FtV2VTT3N2Vll2Nm0w?=
 =?utf-8?B?cUtKVk5YZkYwcWdCOWIwekUwSHhqS3h4UFNBMUEvYzlkQ3hWMU1vdFl1V0oz?=
 =?utf-8?B?OUh0TWRaMjNENGw1MnRIM3YyRkxRV1NjZEJFUExxT29oak55YXdvb3diNGZp?=
 =?utf-8?B?MDBzMkZDMGZhMktuTWVyRDJCTTBNbnFZY2czcUZCUjY4SldPQ25Ia2pJRHI5?=
 =?utf-8?B?b1lGREpzVlV0TVNNUHd6VWllcG1IUGN1Y0FlcTBHOHY5ZWhUUFQrc0lCVkZa?=
 =?utf-8?B?cFovSHdybm5UNjQxRjczN29WT2E1bjZpSU1YenRlc0dDeFpKUWNwTjFCeUY1?=
 =?utf-8?B?Ry9RUmkrbXFxY3B5R1FidXlUNTFEL1VRcXlxNkZ1bXYvK3Y0Zjh6UncxRHRx?=
 =?utf-8?B?anZSenQxOW5BY210MVZTZGZJc3ArajVlOVlNcCthMXVHNm1GVVBuU2pBM3pH?=
 =?utf-8?B?S3pjdnovQ0FoRjVUbkM5LzBIQk5NM3c3SitUVGNNUDZrSmdSS29hcjFwaktO?=
 =?utf-8?B?V3c3WnNZdkZWTmcvRHY5MWs4NXJCWnU0dnBNSC8vei90Ti9USU93Z3hzQW1D?=
 =?utf-8?B?S2g3Q0RCcWNpMCtOQnJNT1VEVVFWS292aGU5L3ZuRTZFT0ZNY1hSQ3lCZ005?=
 =?utf-8?Q?Zq2Z5blR9j/L/Lm8Ks2Fpy4I9?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <5285C47C5F1BFF4BB5CE9062EFC520DB@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6451.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 143e6897-0829-4991-50f2-08dc64e1ef60
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Apr 2024 04:41:12.5815 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: dG6GRuYDuCaPqC9h/xAdx6nawP8EKt+mOxifQ0qcF5eIg8Np0sqVdxJCTGQP0yEsDGp7fj8f+6QhpGFdqIY8Sw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR11MB4602
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

T24gMjQvMDQvMjQgMTE6MDMgYW0sIE1hbmlrYW5kYW4gTXVyYWxpZGhhcmFuIHdyb3RlOg0KPiBS
ZXBsYWNlIHJlZ21hcF9yZWFkIHdpdGggcmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0IHRvIG5lYXRs
eSBoYW5kbGUNCj4gcmV0cmllcw0KPiANCj4gU2lnbmVkLW9mZi1ieTogTWFuaWthbmRhbiBNdXJh
bGlkaGFyYW4gPG1hbmlrYW5kYW4ubUBtaWNyb2NoaXAuY29tPg0KDQpBY2tlZC1ieTogRGhhcm1h
IEJhbGFzdWJpcmFtYW5pIDxkaGFybWEuYkBtaWNyb2NoaXAuY29tPg0KDQo+IC0tLQ0KPiAgIC4u
Li9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGMuYyAgICB8IDQ0ICsrKysrKysr
KysrLS0tLS0tLS0NCj4gICAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTkgZGVs
ZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2Rj
L2F0bWVsX2hsY2RjX2NydGMuYyBiL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9o
bGNkY19jcnRjLmMNCj4gaW5kZXggY2M1Y2Y0YzJmYWY3Li5iMjI5NjkyYTI3Y2EgMTAwNjQ0DQo+
IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9hdG1lbC1obGNkYy9hdG1lbF9obGNkY19jcnRjLmMNCj4g
KysrIGIvZHJpdmVycy9ncHUvZHJtL2F0bWVsLWhsY2RjL2F0bWVsX2hsY2RjX2NydGMuYw0KPiBA
QCAtMjAzLDE5ICsyMDMsMjIgQEAgc3RhdGljIHZvaWQgYXRtZWxfaGxjZGNfY3J0Y19hdG9taWNf
ZGlzYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmMsDQo+ICAgCXBtX3J1bnRpbWVfZ2V0X3N5bmMoZGV2
LT5kZXYpOw0KPiAgIA0KPiAgIAlyZWdtYXBfd3JpdGUocmVnbWFwLCBBVE1FTF9ITENEQ19ESVMs
IEFUTUVMX0hMQ0RDX0RJU1ApOw0KPiAtCXdoaWxlICghcmVnbWFwX3JlYWQocmVnbWFwLCBBVE1F
TF9ITENEQ19TUiwgJnN0YXR1cykgJiYNCj4gLQkgICAgICAgKHN0YXR1cyAmIEFUTUVMX0hMQ0RD
X0RJU1ApKQ0KPiAtCQljcHVfcmVsYXgoKTsNCj4gKwlpZiAocmVnbWFwX3JlYWRfcG9sbF90aW1l
b3V0KHJlZ21hcCwgQVRNRUxfSExDRENfU1IsIHN0YXR1cywNCj4gKwkJCQkgICAgICEoc3RhdHVz
ICYgQVRNRUxfSExDRENfRElTUCksDQo+ICsJCQkJICAgIDEwLCAxMDAwKSkNCj4gKwkJZGV2X3dh
cm4oZGV2LT5kZXYsICJBdG1lbCBMQ0RDIHN0YXR1cyByZWdpc3RlciBESVNQU1RTIHRpbWVvdXRc
biIpOw0KPiAgIA0KPiAgIAlyZWdtYXBfd3JpdGUocmVnbWFwLCBBVE1FTF9ITENEQ19ESVMsIEFU
TUVMX0hMQ0RDX1NZTkMpOw0KPiAtCXdoaWxlICghcmVnbWFwX3JlYWQocmVnbWFwLCBBVE1FTF9I
TENEQ19TUiwgJnN0YXR1cykgJiYNCj4gLQkgICAgICAgKHN0YXR1cyAmIEFUTUVMX0hMQ0RDX1NZ
TkMpKQ0KPiAtCQljcHVfcmVsYXgoKTsNCj4gKwlpZiAocmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0
KHJlZ21hcCwgQVRNRUxfSExDRENfU1IsIHN0YXR1cywNCj4gKwkJCQkgICAgICEoc3RhdHVzICYg
QVRNRUxfSExDRENfU1lOQyksDQo+ICsJCQkJICAgIDEwLCAxMDAwKSkNCj4gKwkJZGV2X3dhcm4o
ZGV2LT5kZXYsICJBdG1lbCBMQ0RDIHN0YXR1cyByZWdpc3RlciBMQ0RTVFMgdGltZW91dFxuIik7
DQo+ICAgDQo+ICAgCXJlZ21hcF93cml0ZShyZWdtYXAsIEFUTUVMX0hMQ0RDX0RJUywgQVRNRUxf
SExDRENfUElYRUxfQ0xLKTsNCj4gLQl3aGlsZSAoIXJlZ21hcF9yZWFkKHJlZ21hcCwgQVRNRUxf
SExDRENfU1IsICZzdGF0dXMpICYmDQo+IC0JICAgICAgIChzdGF0dXMgJiBBVE1FTF9ITENEQ19Q
SVhFTF9DTEspKQ0KPiAtCQljcHVfcmVsYXgoKTsNCj4gKwlpZiAocmVnbWFwX3JlYWRfcG9sbF90
aW1lb3V0KHJlZ21hcCwgQVRNRUxfSExDRENfU1IsIHN0YXR1cywNCj4gKwkJCQkgICAgICEoc3Rh
dHVzICYgQVRNRUxfSExDRENfUElYRUxfQ0xLKSwNCj4gKwkJCQkgICAgMTAsIDEwMDApKQ0KPiAr
CQlkZXZfd2FybihkZXYtPmRldiwgIkF0bWVsIExDREMgc3RhdHVzIHJlZ2lzdGVyIENMS1NUUyB0
aW1lb3V0XG4iKTsNCj4gICANCj4gICAJY2xrX2Rpc2FibGVfdW5wcmVwYXJlKGNydGMtPmRjLT5o
bGNkYy0+c3lzX2Nsayk7DQo+ICAgCXBpbmN0cmxfcG1fc2VsZWN0X3NsZWVwX3N0YXRlKGRldi0+
ZGV2KTsNCj4gQEAgLTI0MSwyMCArMjQ0LDIzIEBAIHN0YXRpYyB2b2lkIGF0bWVsX2hsY2RjX2Ny
dGNfYXRvbWljX2VuYWJsZShzdHJ1Y3QgZHJtX2NydGMgKmMsDQo+ICAgCWNsa19wcmVwYXJlX2Vu
YWJsZShjcnRjLT5kYy0+aGxjZGMtPnN5c19jbGspOw0KPiAgIA0KPiAgIAlyZWdtYXBfd3JpdGUo
cmVnbWFwLCBBVE1FTF9ITENEQ19FTiwgQVRNRUxfSExDRENfUElYRUxfQ0xLKTsNCj4gLQl3aGls
ZSAoIXJlZ21hcF9yZWFkKHJlZ21hcCwgQVRNRUxfSExDRENfU1IsICZzdGF0dXMpICYmDQo+IC0J
ICAgICAgICEoc3RhdHVzICYgQVRNRUxfSExDRENfUElYRUxfQ0xLKSkNCj4gLQkJY3B1X3JlbGF4
KCk7DQo+IC0NCj4gKwlpZiAocmVnbWFwX3JlYWRfcG9sbF90aW1lb3V0KHJlZ21hcCwgQVRNRUxf
SExDRENfU1IsIHN0YXR1cywNCj4gKwkJCQkgICAgIHN0YXR1cyAmIEFUTUVMX0hMQ0RDX1BJWEVM
X0NMSywNCj4gKwkJCQkgICAgIDEwLCAxMDAwKSkNCj4gKwkJZGV2X3dhcm4oZGV2LT5kZXYsICJB
dG1lbCBMQ0RDIHN0YXR1cyByZWdpc3RlciBDTEtTVFMgdGltZW91dFxuIik7DQo+ICAgDQo+ICAg
CXJlZ21hcF93cml0ZShyZWdtYXAsIEFUTUVMX0hMQ0RDX0VOLCBBVE1FTF9ITENEQ19TWU5DKTsN
Cj4gLQl3aGlsZSAoIXJlZ21hcF9yZWFkKHJlZ21hcCwgQVRNRUxfSExDRENfU1IsICZzdGF0dXMp
ICYmDQo+IC0JICAgICAgICEoc3RhdHVzICYgQVRNRUxfSExDRENfU1lOQykpDQo+IC0JCWNwdV9y
ZWxheCgpOw0KPiArCWlmIChyZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQocmVnbWFwLCBBVE1FTF9I
TENEQ19TUiwgc3RhdHVzLA0KPiArCQkJCSAgICAgc3RhdHVzICYgQVRNRUxfSExDRENfU1lOQywN
Cj4gKwkJCQkgICAgIDEwLCAxMDAwKSkNCj4gKwkJZGV2X3dhcm4oZGV2LT5kZXYsICJBdG1lbCBM
Q0RDIHN0YXR1cyByZWdpc3RlciBMQ0RTVFMgdGltZW91dFxuIik7DQo+ICAgDQo+ICAgCXJlZ21h
cF93cml0ZShyZWdtYXAsIEFUTUVMX0hMQ0RDX0VOLCBBVE1FTF9ITENEQ19ESVNQKTsNCj4gLQl3
aGlsZSAoIXJlZ21hcF9yZWFkKHJlZ21hcCwgQVRNRUxfSExDRENfU1IsICZzdGF0dXMpICYmDQo+
IC0JICAgICAgICEoc3RhdHVzICYgQVRNRUxfSExDRENfRElTUCkpDQo+IC0JCWNwdV9yZWxheCgp
Ow0KPiArCWlmIChyZWdtYXBfcmVhZF9wb2xsX3RpbWVvdXQocmVnbWFwLCBBVE1FTF9ITENEQ19T
Uiwgc3RhdHVzLA0KPiArCQkJCSAgICAgc3RhdHVzICYgQVRNRUxfSExDRENfRElTUCwNCj4gKwkJ
CQkgICAgIDEwLCAxMDAwKSkNCj4gKwkJZGV2X3dhcm4oZGV2LT5kZXYsICJBdG1lbCBMQ0RDIHN0
YXR1cyByZWdpc3RlciBESVNQU1RTIHRpbWVvdXRcbiIpOw0KPiArDQo+ICAgDQo+ICAgCXBtX3J1
bnRpbWVfcHV0X3N5bmMoZGV2LT5kZXYpOw0KPiAgIA0KDQotLSANCldpdGggQmVzdCBSZWdhcmRz
LA0KRGhhcm1hIEIuDQoNCg==
