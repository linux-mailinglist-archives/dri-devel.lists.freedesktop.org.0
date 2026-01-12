Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2509D11315
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 09:24:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0364910E047;
	Mon, 12 Jan 2026 08:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mpL9QA2c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 935A910E047;
 Mon, 12 Jan 2026 08:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768206257; x=1799742257;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=HDLY76yd1I6rYBUXfKD+tm8x2OiIbjnKhaLaTFzp+nk=;
 b=mpL9QA2cvZ1pGRAs17MDnTHm6JQxhyxJ7OTXy2FH6Aw1hhpaO/01s61O
 7Ke69q4159wMZw+KEtyC51LIYbkIcgl56o0kVv0pwX3r458pws0G11+lr
 dGYo+pXM/LQ5QkmZI2Fc83RGSSCMhX6bsf1rJHbTelG+XiKHdD1X68xs0
 yWNvyYzWUspj9L5KQWn2CCMSxtlpb0HDULi2aUYYk59f/1cI+IL+ZfkCI
 vR5BWnW3Z52RR2qvCco6xlAEllKGgYE5zpy02tIMl6LGIE9MwAON9QZeE
 go4ZiGXSCXknZtBfJVhPjZjQo2qDSkM9cfKr2ZhTszcETgz/N48PIIb2F w==;
X-CSE-ConnectionGUID: ljDmMuZBQK6xgywin1Prbg==
X-CSE-MsgGUID: Z3U1HvFwS920RGJ4VQ4rCQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="69631064"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; d="scan'208,217";a="69631064"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:24:16 -0800
X-CSE-ConnectionGUID: 4tmNvMf4RJ+F3ZEq2Hpu/g==
X-CSE-MsgGUID: Ul/V+lTYSOmZ+ycV3iryFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
 d="scan'208,217";a="208518492"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 00:24:16 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:24:15 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 00:24:15 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.49) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 00:24:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XaxkCs3+s+yFAnrij8Ccmgy6QOPn8nrCGMgn11iGIuBDlvWXh6EM5tpVrlAGvGsxJ/sff/5A5fsmkDUqWMr1Klp3jYnlDYX6WIpK7zMGInz0bmGh/FvbUuMrSxmag/4sx3YPNUVHO0LMnIVesF1uRDfK5zch5EinsTVJAQDBTzu7R64P281/fWShTg1MwJ4w3AKN/oNUJBsAk0Xbm+m2URD/Ouk3+RDjA0oxoZzYYyR0akZ/i1R8ap7B+OyuVe/qtpbb806Y9r0j+yGduejPB1KjiJVk8+N4DflAH3UhffTsRnNa58wQQvrBlMedoEc1e48KV05WatRSG34RiZM0uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hL2iC/EtgE2D5pPnRzYz/zplRHQzjhZWqPpyi0DlUUs=;
 b=NXjru5yhcC6XCG5FffxxIV6Ijxd/cmlHxnsmWgaWELYnXzroxp/KsAi9iaxxBztupK1zh61H8tozxwr8AgWaPWePdQjTGAuqBN5yEfihaGdabARAXWu3CU3Fq1HC+TKX+X0XlK+/t0zvyxvOqbLuD6obAVDHhU2UPNj1F6ZptO8J2NCKtPisc+p/IwMCVzCxqx8KkLy9vCe43Ywg1vYF3r/39U9sAKsmNB3EnXef52Dl/MyF131SMbF5skAjhxUcG/TztsvhpbpDXC2eYUp4n30xsS9TAZWy3F4la1sYDVWPcJvd850JHDVArW4NdadcadH6kZmFkCt7lzZ7Jh5lqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7307.namprd11.prod.outlook.com (2603:10b6:208:437::10)
 by DS4PPF1B1B74C09.namprd11.prod.outlook.com (2603:10b6:f:fc02::e)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 08:24:08 +0000
Received: from IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843]) by IA0PR11MB7307.namprd11.prod.outlook.com
 ([fe80::dafa:d38d:8ac1:e843%6]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 08:24:08 +0000
Content-Type: multipart/alternative;
 boundary="------------jPIX0HM0G4sRHGfdrn8rxK0p"
Message-ID: <83e50bd4-de11-4298-bab9-7a5255b0c5ca@intel.com>
Date: Mon, 12 Jan 2026 13:53:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v3 0/7] Async Flip in Atomic ioctl corrections
To: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, "Maarten
 Lankhorst" <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, "Vivi, Rodrigo" <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, "xaver.hugl@kde.org" <xaver.hugl@kde.org>,
 "andrealmeid@igalia.com" <andrealmeid@igalia.com>, "Kumar, Naveen1"
 <naveen1.kumar@intel.com>, "Syrjala, Ville" <ville.syrjala@intel.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>
CC: "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
References: <20260108-async-v3-0-e7730c3fe9ff@intel.com>
 <342abb15-95e6-4ed6-8b86-a900c0f403a4@mailbox.org>
 <IA0PR11MB730722B84E81A0CC9BF80275BA82A@IA0PR11MB7307.namprd11.prod.outlook.com>
 <d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org>
Content-Language: en-US
From: "Murthy, Arun R" <arun.r.murthy@intel.com>
In-Reply-To: <d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org>
X-ClientProxiedBy: MA5PR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:174::13) To IA0PR11MB7307.namprd11.prod.outlook.com
 (2603:10b6:208:437::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7307:EE_|DS4PPF1B1B74C09:EE_
X-MS-Office365-Filtering-Correlation-Id: 8687eada-60c0-4dc9-b48a-08de51b3f4a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|7416014|7053199007|13003099007|8096899003|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MU1NbmRDZTRVb0I2NmNDRHI0clVBWUFpN2ZydHhoRDcrN3huWkhPSmhteThi?=
 =?utf-8?B?ejBid0NXcnFFMSs1S0xNYy9qeFBuelRVUG15K2dTWllFVkRWZFhFYVc2TFBY?=
 =?utf-8?B?a2NHL1hUdUdTajBIdThERGkyclpTWmRXQVo3Q2NsRVhJR3N6bnY3enFzV2Zr?=
 =?utf-8?B?SFVNdWNObitTS3kzd3FyczNidTVpN1Q4b1lTeWlod05BTDMySFphL3Y4RjZX?=
 =?utf-8?B?TElQT0lGbTJvdS9Qd3AvZkcrTyt4anhwM2pxY0pOb1BqbGwvTFBodUd6V3JB?=
 =?utf-8?B?Sk1ZUVJBa29Wd0Z5QUFiNm9ESzE2QTFxazZxRVhDUlRMOUU1RzdueGk2M0xv?=
 =?utf-8?B?ZDBwNDJKb3hUa1lPZGIrTEhnRUZHWVRpWld5Q1ZIMmEwVHFLSnFvdnJpU1hp?=
 =?utf-8?B?bXF0ekJqR3BtdDYxYkNYc3pZZ2w1MGVaVE5EZFN0c20vSG1Vd0RaL3lzUWNk?=
 =?utf-8?B?NDhXWVBja010R0hpZ0JsZGRtRmJhVWY3Unc0bkQvK3liay8yTDE2VnNZcWM2?=
 =?utf-8?B?L2NJWDdlb0VMZGt4dDFydWtVQ2VtWE9XTHRyeHh2MHF4WE9zeHVFVUl0T2tR?=
 =?utf-8?B?ak1GR215d25MMFVlUFFGNTllTEZscmRMR3p4Z1p3RExHNDZXajUrTVdGYWRq?=
 =?utf-8?B?QkU0QWFKRE52S3A3ZHNUWkwwRHp6K2lVM056RXFmSG9vNUZYQTFxRW9DWnFl?=
 =?utf-8?B?QlZoR3hVcUMzVEw4R3QwWEhXODhHSWxxN05mc0NzYmVrbURIOVNvaXBhU1hK?=
 =?utf-8?B?ZUtaQklsdCtEc252aUkzVWpDVkpNbStiQmIyMGlHelcwRXpsQVVoaUZYb2Zu?=
 =?utf-8?B?cUpnRkhvb2FCUkQrNFJxUUkrTXlBK3d2eGRTb1B2a1lUVDAxYmIxY2tGU0lo?=
 =?utf-8?B?OG1BZ0xMSjRoTWtOS29jaXZqbEZpaVRnbWFDOWNLd20vRWZ5YVdtNTIrU2lw?=
 =?utf-8?B?Z2VYR2pkVWFMRFJYQXlDRHVaWWl0OG45WCtWRGpjUTJFQ1dlazZsOFVjdi9x?=
 =?utf-8?B?aDl3enF5cy9PUjI5aHoxdEJxS29xQ25jTFRTcEhsUjJJQUg1TkFvNTJ3emtS?=
 =?utf-8?B?S1YvZ3gxV1F0cys2SWYxaUkyVFE2ME5tc2ZkaVhjUXhIdk9XK2VpZGIwbXFT?=
 =?utf-8?B?cmtvQ2Rad2xLNW8vWlUxcktJZThMVlRVZ3p4NFBRdS9EMmRvM0U5Y3RmZnhO?=
 =?utf-8?B?bFV1K1JiUDlLTGZGZWNYa0xLUUUrb0xuZ0xVU01OcjNqa2VrazVITmx1TnFG?=
 =?utf-8?B?cFBzY1gyMFVxczkyMXE5WkxnNmlMU2o3OFlKSGRxSTE4QVYvREQrWks5U096?=
 =?utf-8?B?Z04rSVZheGdWbStSaGFraWNCN2VWNUFCUlNYaTVHSHM2WTIyV1g3VGVmSUY1?=
 =?utf-8?B?cTRZMlBSYStJVHM3bXNTMlpNbHB1N3hrLzdxdVJqSE5CbFA4ckF4MGJYUENZ?=
 =?utf-8?B?UXFNaTRWOU1RanZHWG5BRUdJZzNkVHV2Tm53b2hTb2VTZGtlb0hMY244S283?=
 =?utf-8?B?Q2kzMExVamQ2bHYxRkJteU1XTDNEK0x0SGhFck85MmFIMk9SbVFiREl0aTVi?=
 =?utf-8?B?SldZNkZQem5QYmUyQkZoT2tEeGljNStzV1dPWlQ4NUhYcklEY0h2YmpEb09J?=
 =?utf-8?B?Mlk5Wlo3RTBZZEdRV203NjlubTRyZ2c1OWVQL3ozMmtEZXJXZFhLVDZMNWRa?=
 =?utf-8?B?aDVDVXFCcVZTdk9abEgvU2VnejRrb3d5VWk3TFN1dkZQdk90b3NTREpxdWtM?=
 =?utf-8?B?NEJaRXBTQVoyMHd2aXNydEl5VW9MRFptZnUwWEY4cjBYMlFUN1piUzRXY29U?=
 =?utf-8?B?RnVOUCtkWEtiQ0xHNFREblF3YWRBYUlRTlJIS1JqUUtiaEFRQTBQY2U5b0Zo?=
 =?utf-8?B?cEw4V3pTWmRqbjhSejJlVnh4dFZoZis4QzRJYlAvNlRaZ2NTU1NXcW85Q1Fq?=
 =?utf-8?Q?oQqpIqdwWuCo7vZIXU5ZIvelFqUOijZQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7307.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014)(7053199007)(13003099007)(8096899003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?LzBLTXVOZWVjZUllcHRPNXIvVzhtVXRobjJ6M2xpeDhpSTNiRDE1YzJPQ3c4?=
 =?utf-8?B?M3VJSXo2MnFnMjh3SGV4TDhMc1R3TTd5Y203aHVPWEQyN1hPZmpObGZmaytx?=
 =?utf-8?B?UDdUcHdPaTVuVVIzcUNOc0xoZitmYWkyN04zcXJLTDluWnVOQUpWV2ZXcmw3?=
 =?utf-8?B?Y3Ryekp1MDFrd1RSVG9HTGFsd1RKUlk0WEN1bmVaUXNGcVgxQ3BETjRySjRQ?=
 =?utf-8?B?UGtwNDdMdXJFbFlKRXFXWWxybzhRTW1DVUZoZWd0K3hIVmdIMTFDNk8rZ2hy?=
 =?utf-8?B?RktmRmpkMXRsVFM1QStEdGxMaFprSjYyMnRmeFdZY2I3MDhzL2p2bXdPMnBC?=
 =?utf-8?B?YmVVblBuVDRCcHZGYmdlNzkvbnlsQ2x3Wi96cE4zeFlDRjdDVk5VYUkzTm0w?=
 =?utf-8?B?TUEzOVFxUmpCaTkyV1JQbW1HMm5VU0lHWW1zKzMvWU84RW9yZ0FvclB1cWM1?=
 =?utf-8?B?L0ZFRldmaGt1U0p1TWFVOHYzQllRc1dGOVliT0l6Nk02OWxkdmJ1Z3F5VWxF?=
 =?utf-8?B?U0NlN3JIYnRoQTdMREdlNW1oMi9vUWc4bXp6VHF1cHNRZjZxbXl5Z0czUEhW?=
 =?utf-8?B?RGRiNWRWU283a0c1RFdBclpGRWgyUUdRenRUNjNYeERtQVg1STZrRTZqdy9y?=
 =?utf-8?B?SkRYRlNNYXIzTUgrSzBtWWd5NGdtK29JV1B2RTM0aVRtWkZkTmFiNWVLNUNx?=
 =?utf-8?B?S2lpWGs2QjVwU3lWVmZPbFlNS2FZdXgwdW1jVEJud3NDdy9sK1AyUy9vZ0RX?=
 =?utf-8?B?dzU3TjhxVFo3MmdYV0dnSy9kK1pkazFTaDcyMWxIQm1LTmp2K0dhTUF6eEZR?=
 =?utf-8?B?c1h3dU9SRXdUZDNwK0FYSHdTMTFtbDB5U1pQbTZtTTRBUEY1bEhYRHd1WlRo?=
 =?utf-8?B?N1NvYXo5b2dKZExHNnExTitOTERwaGVCM2ZQNHRYMDhydklDYTVsbGxDN2V0?=
 =?utf-8?B?N0FHTVhVZXdZYUlXZndMWjFmQkNhZUR3QjZ4ZGJoaUh6ZTJ5azlIZHRXb01P?=
 =?utf-8?B?UHAwSm9XRXMxVnpGMkw1Y3RpdWhOdnZqOTlvemh3VEJsTmNqWmNCWUc0dzYv?=
 =?utf-8?B?ekhDS1ZCVWJoVENyS0YyZTc4ZXhwNHR0WjJISXZaYVVYeEtKSjIyZWNFZ0x2?=
 =?utf-8?B?Y3hJZEE1UjJSRitOM2Iyc2Zxc2NxdWJVNVJ1UzNBZW5tTlRSYUUyK3ZKbkRP?=
 =?utf-8?B?R1VWYmhQN2paR2J1dTFlM1pEMEtHanR2RmhldzZLNVQrajZ1RTE2UmFXOVVF?=
 =?utf-8?B?Sklad0kzTVlHRnp2V3orV3dHNnJ1NVhBb1luT2k4WHp0Ty9LbW14SXljL1lO?=
 =?utf-8?B?ZGdVUmJvWURlVGJobDFZTWVtT0ZFMUEzQ1NBcVBGQWxpYVJPU3p1ZVQxYTFk?=
 =?utf-8?B?TGE4d0JzVzR1WGZOSGpsTWZsektPd0lMU1VpS3JaVGViWk44WW5razB4RXIw?=
 =?utf-8?B?S0ZpbkR6UG5qUzE2QVVEUGVmYWNpdmVFbGliS1Z4NnVjOFpwQU9hSERLbjhU?=
 =?utf-8?B?WHQ4L2dXcVFmMXlXYjFKVGZpaCtmS0R1c0JUSjJDZTRqZlVmaW00SnNiaU41?=
 =?utf-8?B?VEFoWXA5TEZPOWFqdnpWS1V2MmxhM3Bsemd1emZJVXFnL2ZkWk94eEpIWHQr?=
 =?utf-8?B?blYvSm1ocVZzYXlabTBlckFwV1FmSXBNM0dVZFJsWnF0OEtnRXdVYzlMMkVI?=
 =?utf-8?B?VXc0UmtuZmphdTRKZHRONnJla1gzdTdkVURMUm41ZFZTNUZWUUI3UVYrcEZT?=
 =?utf-8?B?cGJoRHRsdmdETEg4RVk5K2VDS2hkS3E3S0l1dXpVUTJLYVVudlZaemNuR3FG?=
 =?utf-8?B?RFh6Mk8vb0JQRi9LUlRBbjNqZWhmODZjQ0RpaUg0TUVlMHJvVUxkWnoybHp0?=
 =?utf-8?B?QjFGMzNVU3ZjZURPQy9BWnkrVzlsTDZwS0VMRTBNYWdVbE9MK0dpMEFMMFp2?=
 =?utf-8?B?aE9KQlhFSkY2RGUrRnNQYVRpQWNNNDdCKzRaTmhmbTBaaDFXT3RmU2xRRkkr?=
 =?utf-8?B?R08wNUw2TlM2V2hFR1A4Si9wZ2MzOEh1UmRmSm1CNWM1bkY5TE5heXVlT3d1?=
 =?utf-8?B?WGlCKzEwK1ZvL0U3K2lNeWNPZ2k4YU9RSDZGeVhUN3BZbnpaWWl6eWd5c2py?=
 =?utf-8?B?eHUwMjR5dWQxRU1td2JrTkxDK0g4VnR0OHpIRHpvNm9KRm1QUHVrOURObmtj?=
 =?utf-8?B?WjgyeWRxc2lZc2tQTFRxOE5rRDJYUjlocFRCQU1HekM4SEN1cjFmV0Q5ZDJv?=
 =?utf-8?B?cUpJR1FLK3dQNXRBNEw5QWVyT2VWWDZCTjJxRmpZNFdueXN4NkVubmpTWkZR?=
 =?utf-8?B?bkd5L1pOZE9hMFhTTFEwUDRrb0xiRmNYUG5RRU5Zc2NXOVNwUkdzdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 8687eada-60c0-4dc9-b48a-08de51b3f4a4
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7307.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 08:24:08.2280 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9gHdxBpioCVRHVoRXjQoOGmKxYtKgO/8BGt5I4s7vSlPgv/GEKIqAEuhesML521f2aO5WrMjrP84RBcZz494iA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPF1B1B74C09
X-OriginatorOrg: intel.com
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

--------------jPIX0HM0G4sRHGfdrn8rxK0p
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 09-01-2026 16:52, Michel Dänzer wrote:
> On 1/9/26 12:07, Murthy, Arun R wrote:
>>> From: Michel Dänzer<michel.daenzer@mailbox.org>
>>> On 1/8/26 10:43, Arun R Murthy wrote:
>>>> struct drm_crtc_state {
>>>>           /**
>>>>            * @async_flip:
>>>>            *
>>>>            * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
>>>>            * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL
>>>> itself yet.
>>>>            */
>>>>           bool async_flip;
>>>>
>>>> In the existing code the flag async_flip was intended for the legacy
>>>> PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
>>>> As per the hardware feature is concerned, async flip is a plane
>>>> feature and is to be treated per plane basis and not per pipe basis.
>>>> For a given hardware pipe, among the multiple hardware planes, one can
>>>> go with sync flip and other 2/3 can go with async flip.
>>> FWIW, this kind of mix'n'match doesn't seem useful with current UAPI, since no
>>> new commit can be made for the async plane(s) before the previous commit for
>>> the sync plane(s) has completed, so the async plane(s) can't actually have
>>> higher update rate than the sync one(s).
>> That’s right, such mix and match flips will still consume vblank time for flipping.
> Does a plane property really make sense for this then?

As per the hardware this async flip is per plane basis and not per crtc. 
Looking into the corrections in the display driver, the flag that we are 
using async_flip which is defined in drm_crtc_state has been commented 
saying this is to be used with legacy page_flip ioctl.
When support for async was added in atomic_ioctl, approach was taken so 
as to get it working with minimal changes.
Not that I am trying to clean up this. Recently AMD added async support 
on overlays as well for which  few other hacks were added. The checks 
that we do for async flip were all done in place of copy the 
objs/properties, but it actually is supposed to be done in the 
check_only() part of the drm core code. This was the limitation with the 
existing implementation.
As per hardware the async flip is associated with the plane, hence 
changing it to a plane property. Have taken precautions to not break the 
existing workflow.

This change will make the driver more clean for async flips and will 
give path for enabling more hardware features pertaining to async flip 
supported by the hardware.


>
>> This series doesn’t solve that, but rather accommodate multiple plane async flips in an atomic ioctl and allowing disabling of a sync plane which is already enabled. There has been a long discussion in the gitlab(https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834) on this.
> AFAICT that's a false-positive rejection of commits which don't actually change cursor plane state.

https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2855843

Thanks and Regards,
Arun R Murthy
--------------------

--------------jPIX0HM0G4sRHGfdrn8rxK0p
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <div class="moz-cite-prefix">On 09-01-2026 16:52, Michel Dänzer
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org">
      <pre wrap="" class="moz-quote-pre">On 1/9/26 12:07, Murthy, Arun R wrote:
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">From: Michel Dänzer <a class="moz-txt-link-rfc2396E" href="mailto:michel.daenzer@mailbox.org">&lt;michel.daenzer@mailbox.org&gt;</a>
On 1/8/26 10:43, Arun R Murthy wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">struct drm_crtc_state {
         /**
          * @async_flip:
          *
          * This is set when DRM_MODE_PAGE_FLIP_ASYNC is set in the legacy
          * PAGE_FLIP IOCTL. It's not wired up for the atomic IOCTL
itself yet.
          */
         bool async_flip;

In the existing code the flag async_flip was intended for the legacy
PAGE_FLIP IOCTL. But the same is being used for atomic IOCTL.
As per the hardware feature is concerned, async flip is a plane
feature and is to be treated per plane basis and not per pipe basis.
For a given hardware pipe, among the multiple hardware planes, one can
go with sync flip and other 2/3 can go with async flip.
</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">
FWIW, this kind of mix'n'match doesn't seem useful with current UAPI, since no
new commit can be made for the async plane(s) before the previous commit for
the sync plane(s) has completed, so the async plane(s) can't actually have
higher update rate than the sync one(s).
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">That’s right, such mix and match flips will still consume vblank time for flipping.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
Does a plane property really make sense for this then?
</pre>
    </blockquote>
    <p>As per the hardware this async flip is per plane basis and not
      per crtc. Looking into the corrections in the display driver, the
      flag that we are using async_flip which is defined in
      drm_crtc_state has been commented saying this is to be used with
      legacy page_flip ioctl.<br>
      When support for async was added in atomic_ioctl, approach was
      taken so as to get it working with minimal changes.<br>
      Not that I am trying to clean up this. Recently AMD added async
      support on overlays as well for which&nbsp; few other hacks were added.
      The checks that we do for async flip were all done in place of
      copy the objs/properties, but it actually is supposed to be done
      in the check_only() part of the drm core code. This was the
      limitation with the existing implementation.<br>
      As per hardware the async flip is associated with the plane, hence
      changing it to a plane property. Have taken precautions to not
      break the existing workflow.</p>
    <p>This change will make the driver more clean for async flips and
      will give path for enabling more hardware features pertaining to
      async flip supported by the hardware.</p>
    <br>
    <blockquote type="cite" cite="mid:d1e6ad38-06bf-4139-966d-312bc728225c@mailbox.org">
      <pre wrap="" class="moz-quote-pre">

</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">This series doesn’t solve that, but rather accommodate multiple plane async flips in an atomic ioctl and allowing disabling of a sync plane which is already enabled. There has been a long discussion in the gitlab(<a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834</a>) on this.
</pre>
      </blockquote>
      <pre wrap="" class="moz-quote-pre">
AFAICT that's a false-positive rejection of commits which don't actually change cursor plane state.
</pre>
    </blockquote>
    <p><a class="moz-txt-link-freetext" href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2855843">https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/13834#note_2855843</a></p>
    <p>Thanks and Regards,<br>
      Arun R Murthy<br>
      --------------------<span style="white-space: pre-wrap">
</span></p>
  </body>
</html>

--------------jPIX0HM0G4sRHGfdrn8rxK0p--
