Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05C5B9B4542
	for <lists+dri-devel@lfdr.de>; Tue, 29 Oct 2024 10:07:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A76B10E5DE;
	Tue, 29 Oct 2024 09:07:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="lSsNPSbq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
 (mail-db8eur05on2078.outbound.protection.outlook.com [40.107.20.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB91210E5DE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Oct 2024 09:07:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nGlBWwYAuGgGrEp1gblyEcrXPsWd7kEAd9Pr+jWQv1rq2leRjQV0iWyB5bYoS0gPxhwc3gVSJqzr156FPjgA0jrs9TRXSg1oOBJU7Ba6ojbrjbPjjio8Ncs67DzwyPWwU4VkZ2NqKgk9TfZAyD5rJ//JMs0Fd8ES7vpbru0iPC/KnTRE2bWeADwjIh/aTAmjTgioAXfUapwSeYXKpYi9fI6J3R/3PIcZh6tNLIGhlcJM3wFlcyUGJG1JK3NCnW1KWL4VoDXuN2eSazlw+sKgESAHANc8EBYmo2NDUS4yyNHx4TBrDXRH6AAdrT+9nbKnVDs7di70YxwHmAQ8jo8UoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0yJRS6cHP3/soQfEDFV1EqhvBgyZqcpUvGClwMGti0Y=;
 b=c3JHmQgCqXrQ78Lbi2DzkREHvza892mfn11vKlfPJhGZgyiLYbmS1jN3s5s6hVHGIXp/slkn0whkAxaLXJjN5rMUsGsMbk+dG0Rvan0utZPAqQjRAsD0x3EV0pQESAsNQETZPqU97quatwgJnv2ER2ouXA1Shwu0YUPbo9OF48iOrHKMeOJdN51jLzyX7Wlt2A2vYMqJsYBl18lxRJGcOGU/V7JE4jDQDnqOuF11StJqKHhcmo1pKOJ04gKPpJgGmlQObmYx+ZTrJGrQn8c5o2JKcDBt1n6diVJhvqmdWF+Dti5F6y/NBTi0k+llEpgvkG1xr93LC/m6ZXmfPgL81A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0yJRS6cHP3/soQfEDFV1EqhvBgyZqcpUvGClwMGti0Y=;
 b=lSsNPSbqsBM3SOe+Fwrl0tEHNrjcWIDKJR1haFZ8a+jUu68GBuzvSVfhTGHv3xa0iCj6w1ofONmdQZgzBOV8CsJrn48Er7d6uC+AmR1fbxK//Hl0PAlcGHGe9Z6XgqlJmHaGEcH81onJ/Cehvn/LrqWlzhN5u+YTbBt2JAAQkjQf1Pob5WnSqbfhJ2eKkFg8uc+/QKQWK6XJdlGHcAXWvqqOeMzJuj2VdQBgVLmrgg4g92TnnbSmy4RlfbVDRvX5EFTY+ScbfO+pwjnf4uvAESWG/pWRj7vLfkQtch817ch5vlNQwMvYuOEU0gJtc1jXXBolasU0NqmJFa1euaOPFQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM8PR04MB7986.eurprd04.prod.outlook.com (2603:10a6:20b:245::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.27; Tue, 29 Oct
 2024 09:06:57 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::d1ce:ea15:6648:6f90%4]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 09:06:55 +0000
Message-ID: <17b6858e-1afc-4fec-9044-2d17395ec6a5@nxp.com>
Date: Tue, 29 Oct 2024 17:07:16 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS
 display common properties
To: Biju Das <biju.das.jz@bp.renesas.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Cc: "andrzej.hajda@intel.com" <andrzej.hajda@intel.com>,
 "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>,
 "rfoss@kernel.org" <rfoss@kernel.org>,
 "laurent.pinchart" <laurent.pinchart@ideasonboard.com>,
 "jonas@kwiboo.se" <jonas@kwiboo.se>,
 "jernej.skrabec@gmail.com" <jernej.skrabec@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "airlied@gmail.com" <airlied@gmail.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "robh@kernel.org" <robh@kernel.org>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "quic_jesszhan@quicinc.com" <quic_jesszhan@quicinc.com>,
 "mchehab@kernel.org" <mchehab@kernel.org>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>,
 "hverkuil@xs4all.nl" <hverkuil@xs4all.nl>,
 "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
 "quic_bjorande@quicinc.com" <quic_bjorande@quicinc.com>,
 "geert+renesas@glider.be" <geert+renesas@glider.be>,
 "dmitry.baryshkov@linaro.org" <dmitry.baryshkov@linaro.org>,
 "arnd@arndb.de" <arnd@arndb.de>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>,
 "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 "sam@ravnborg.org" <sam@ravnborg.org>, "marex@denx.de" <marex@denx.de>
References: <20241028023740.19732-1-victor.liu@nxp.com>
 <20241028023740.19732-9-victor.liu@nxp.com>
 <TY3PR01MB11346FDF74840ADF7273A218D864B2@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <69cfeb75-696e-43c4-ad27-aaf9ad3c6c78@nxp.com>
 <TYCPR01MB11332FF433F4E10E4D0B7FE2B864B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
From: Liu Ying <victor.liu@nxp.com>
Content-Language: en-US
In-Reply-To: <TYCPR01MB11332FF433F4E10E4D0B7FE2B864B2@TYCPR01MB11332.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
X-ClientProxiedBy: SI1PR02CA0013.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::7) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PR04MB7046:EE_|AM8PR04MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 29aaee1a-0beb-4a92-2735-08dcf7f9094d
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0NKWHorcjB2OHRhNFE4MUUzSlNZbzhUUjBHUWdNM2dqeVJWa1dPNjczOHJG?=
 =?utf-8?B?TmlqdnN3OStYVUhUZys2LzhDN20rQW5JWHlZdEF6NUdhWmNZNkphM1NEaDNG?=
 =?utf-8?B?aDlhWkdRdWN1MzFPaE53a0RpMldHKzlEdmJaVUZYVjFZRXdFUDNTT0NIWmx3?=
 =?utf-8?B?TkpZWkJzTGNheFYrSXlTNzByMTdFTzZmWWp2RHQ1TGtta2UxbXRvVDdKR2pY?=
 =?utf-8?B?Sy8wYnAwU1BsWTBPeElpN2krR2dCSEpxaXo3S1FqblhRcUMxN0VxYTJ4Z0ll?=
 =?utf-8?B?QjhQNEV0MVFqUEVjeTBGS0VoMzFqS3JQNzRjQXlTNDdKQldtb0Rud1VUY0h5?=
 =?utf-8?B?L3hSdjRrSVZIL1IrNkVjWnZiSEQrejNaYkk3MXd5TEt2UVJyOHUvTDFHM2s3?=
 =?utf-8?B?SnA1bHVMNjI1ajQ5dTBjQ203ME5vRldnaERlZ3pKUzkrU2xOVTE2aFU0SWNG?=
 =?utf-8?B?Q2xWZHpoMEU5WTgwbUJXQTVUWDlYVC9ZL0ZNTC9pc3pkeUxkOFFHS1pqaGwz?=
 =?utf-8?B?WG9SYm1ZS2F1blhoek5JMzZncGJKNy85bVVndGljNk9naENQSXVRaG9mMThI?=
 =?utf-8?B?S0loZm5LNTlPcHJqYjFnTDlQdHpjNmt0V21mc0NLbjJJR0V0cCtRYkgzZVQ4?=
 =?utf-8?B?TGpjK3dseVkxaHV2azhPWG1NODhiT0JLdTFrSStaTzdkckljcTU0YmZqeEpS?=
 =?utf-8?B?R21idkgxUmN2YWptVC96Z0ZLSkFyaG5SbFMxL0tIV0NWY21YZFdXdHBjeEVK?=
 =?utf-8?B?dHYwM3A1NFV6Z016S3VIais1alIrV0Y0NzlaS1ZaNVdBdmJ6UHRkNUFGSFFT?=
 =?utf-8?B?T2JxTGY0MmhQOWZMS1pmd29IY3dWREYydk5PeDMvbXUzeXdxdDBodnNpdEUv?=
 =?utf-8?B?ZFl5aEZGeGZZQllZMlNQbnYzV0JtdDNQZGlncjhWd0Vxbm1Mb0JmODlzaTJN?=
 =?utf-8?B?N0ZvSXhzT0lBaFplclBRS1B4M1RwRjExUHdhRzZkdExFNVMzczRFQ0htVjVD?=
 =?utf-8?B?Q1VkN2RMVUFtbWd1R2o2Q2pMYmFmc3YzaWlVc3M0Q0l0WFd1ZDRHcTJrZVJh?=
 =?utf-8?B?c0M5VEJQWWtmZFlxTjU5Y2tUOWtzeGFXSGx2dFFXbVB1aDFuNVp3RHkrVjgw?=
 =?utf-8?B?OU9tUHY4VVl0WExCdjVIZ1VOend1cUM1dHIweEl0azUyOFR2UWFTbUNVZDNa?=
 =?utf-8?B?ZVljOWFlOFQxbU1sRmxGbUlhaElBbzRsYzNyODZpU0NQUFJlM1JZQlpaY25T?=
 =?utf-8?B?dk9DYkp5bnNtNy9ObUtQSWI3djdvSzArV0JPTTNsS1JodXUvbGIzRDVVWUUr?=
 =?utf-8?B?L3lRRXJSTEhvdGpLTzVadDhHTFhoL3hObEc4WWt5Zk9qWWozWUJhSE9QcVBB?=
 =?utf-8?B?Kyt4L2h5REsyTlkwMnQwSjFRUGdMak5XdkFkOHpnRXZ1bzJaSXZLRmxJY2Ez?=
 =?utf-8?B?MWR5a1pZalZYbmE2VHVKRCtaa1lha29lN0Z3U1FyMUpvVjUxbzFXMjdBbnd5?=
 =?utf-8?B?aWpUT0tQTDVEeGo0cHJmWnJpYmV3aDRQNCtjR1R0SWNLeEJSZ2laOGRTZHRR?=
 =?utf-8?B?SlNwS2JGNm4wUnQzR1lOTW95M3hlVFFJNTFESXNLV0tlRTZNa1FNTlhyRWR1?=
 =?utf-8?B?UjZxSUdRem0vaDJ3aGdRT2hkM2wwUU5wd2VQa3MxL2ttRlVqYVpHWnlpR29m?=
 =?utf-8?Q?UAcGVjy9zafMEXjh2fGo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AM7PR04MB7046.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WmV5Yms1VVpUalEwcnh4WlpRTHIyREp3T1grK1BtMFhxT2JyMWdTb2NuMDVy?=
 =?utf-8?B?QWs0V0VIOTdHRlVKaVZ1NHljQ1JUNzNzRC9ZcDNXYyszcTdMeFZ1T05lKzZh?=
 =?utf-8?B?aUhDU2lIdjBIVWxtNFowd0FwRDVPL1NZeGxDZTg2cFN1OHBYTVpOd1VYWmE3?=
 =?utf-8?B?WUZubXpiZzRqdXNJN3Y4NXJ0UWpuTUo5bm4vUnpIVUdiRktFcVhTbnhPak1G?=
 =?utf-8?B?ZDh0Q1lHdUp2WEZON2p1SnY2b05Ua0pmYXRmZk8wbTJvTE5HUDZ1alVMZzUr?=
 =?utf-8?B?YTVSZ1o3dW1MbU1Fb0paY1FmTXNVRnI1SFVudUgzVHhRUnY5UkRyMHhmYTZK?=
 =?utf-8?B?SUVDaUxkVFZLMnphSG14T3diQzh2ZUQ1MXZaek9tSjFvUUY1QzJQVlA4TmFY?=
 =?utf-8?B?Mmp2aUxYeThIYW85OXU1bFJKQkF0RUlVaEgwN3JGd1g4VU80YWFjeHoxM2NR?=
 =?utf-8?B?SFhYRHMvQ1NISmJJeWNMaTBaU0Z5SUFEaWQwZFVCbTZMM3lmRkJSaTZKdURM?=
 =?utf-8?B?SlUwT2FBMTloOFFnaFZ5Q0V6SUtNUThJQUhIajFOb1BGN0RhU0xTRmxYenU3?=
 =?utf-8?B?c2Y2LzY4d3lsZ3M4UDZiaGd0VHpIOE1RTm16Z3R4aS9YUTNheVI4OTFZZWRR?=
 =?utf-8?B?NlluaDdrUEdoc21VUWlIRjdNMnRBaUVvU2YrUWpOYUlHcmRoNGduS1BJOVJ5?=
 =?utf-8?B?QlMza3Y5K0x1UHlibEZPeWM0b0x5SU5vWTlFYWJiQnFCS2gwcFRYUU9rTTBH?=
 =?utf-8?B?UGlvdlJRbWphOU1tZU9XR2FVcjNpc1FaMHdYN0dOUjR1WXNvblZ2alYwY1FB?=
 =?utf-8?B?VXVZM2ZHeUwwUzluS2VKZXI3RkV4TzhLbW9MbEtFUjlKV0F4T09oMyszUER3?=
 =?utf-8?B?YUNLQm9GZUpzWEVkSExXc3RFTWdSM2QzMlloTm8zWjJCK1d3aTRjMDdsRnY2?=
 =?utf-8?B?M21ySDBCbkE3bWNQUG9hSitaRjM0a2NCNHBjMDN6ZER3akp2cFN5RFoyTitG?=
 =?utf-8?B?c2kzUm1qRm5KMDM0YmJDVURTTFMzMzE2TUZlOWxqTXhXeFo2TERqQ0JNUjZ2?=
 =?utf-8?B?WWM3c1E4NGZhMlE1NGJvQllHRU9yZWZ6TXVKZFlHZ2ZQR3VoaGJDMWpBZFNm?=
 =?utf-8?B?WmJ6V21hYVlNczBFQWIwNjlPbXkyVXFLR09Sb3hjcEVMRXRDcThwckZrc3VD?=
 =?utf-8?B?bWhiZlJ5U2ZNVkYrcVE2cmtpK29FZzVFYXhlUUhmQlRYcHVKUWNCSHB4T2Rm?=
 =?utf-8?B?T3FZL2Yzck85cHFXTGMxU2g5RnJhMGlTSHVyRFhZb1FNb1BnRWc3a3ZlZk9N?=
 =?utf-8?B?aGNVNVlkaWkySk1hQWphRmpORG1wc0Q3Ty80akRVYWRzT2dnOXNIYjRmT1Rx?=
 =?utf-8?B?TGs1c0tZZEU3VHU0azdaSVBjTXo3K29US0ZINDFTTEFieERTR1Q2OEZCSkRw?=
 =?utf-8?B?SHJSd3ZHWURGZ2VmLzRGaDVseUVBa3BMYnVDUENleEIxdzkxejBKWlFKK2dE?=
 =?utf-8?B?Sng3UTdPNkxWQ3h4MFVQYkw0STNUaWN0RFhjMzVDcEZvRlU0WHU5c1hMNGJV?=
 =?utf-8?B?VGc4eGgxQzZmaHpiZGs2TklOYUNuemNhK2Yyd2lwN1lSS1NCYWczOGRmZDQ5?=
 =?utf-8?B?RzFPaXJndVRFY2czYWdwZ0taZUFsaEg2VDh2QzdlbUVXSWpTVFRjeXozSkty?=
 =?utf-8?B?Mm1TYnBqbUVvS2xhZ3FuNnhOWGpSKzJsUHorV0QreUJnM2F4SksvOW1JVlN0?=
 =?utf-8?B?VkF0Z2taRE9rR2RuOHdPVmlYbEdpK2k2YUd4SHhSdzhiYXFwZU9YNTU3RUYv?=
 =?utf-8?B?Q3ZreXNSREhMZnRzOGVYdFVkT2M0d3pxQjVhNkNFay9qSk1KZUc1U1k1Q21h?=
 =?utf-8?B?ZFBwY0tReklxNytXRUR5NndEOXFIWGhpWWFRSlRMdjJHNDN1OHNNSUZvaUZO?=
 =?utf-8?B?bzl3V0p0MjVqdCt5elVmQkc5U0JJWGNNZzYzYU5MZzNGbVd5UCtLTlp6K0ZQ?=
 =?utf-8?B?VFhPWFZ4UUcwamxqQzE2eUd3RlFFdlkyY09GQzhZYXNkWFZVL2FRZjN4UTBS?=
 =?utf-8?B?WUlyL0JSdFAzUW0xWkhOT0FEWmpqdlYzMUtjWDZ4NTBMRHpqcmlnMzdRWGRu?=
 =?utf-8?Q?OTNoxfrOzMe7DbuvB7wmwpE9l?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 29aaee1a-0beb-4a92-2735-08dcf7f9094d
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 09:06:55.8847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2W4zWh56Yozmv0k5nac6qNLVl0awNTClnPY42wKh61CU/9zEs9JeVWIYO+w7ktG3aCoxbu1hzMhrVoZLAZ0bXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7986
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

On 10/29/2024, Biju Das wrote:
> Hi Liu Ying,

Hi Biju,

> 
>> -----Original Message-----
>> From: dri-devel <dri-devel-bounces@lists.freedesktop.org> On Behalf Of Liu Ying
>> Sent: 29 October 2024 08:02
>> Subject: Re: [PATCH v4 08/13] dt-bindings: display: Document dual-link LVDS display common properties
>>
>> On 10/29/2024, Biju Das wrote:
>>> Hi Liu Ying,
>>
>> Hi Biju,
>>
>>>
>>>> -----Original Message-----
>>>> From: Liu Ying <victor.liu@nxp.com>
>>>> Sent: 28 October 2024 02:38
>>>> Subject: [PATCH v4 08/13] dt-bindings: display: Document dual-link
>>>> LVDS display common properties
>>>>
>>>> Dual-link LVDS displays receive odd pixels and even pixels separately
>>>> from dual LVDS links.  One link receives odd pixels and the other
>>>> receives even pixels.  Some of those displays may also use only one
>>>> LVDS link to receive all pixels, being odd and even agnostic.  Document common properties for those
>> displays by extending LVDS display common properties defined in lvds.yaml.
>>>>
>>>> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> Signed-off-by: Liu Ying <victor.liu@nxp.com>
>>>> ---
>>>> v4:
>>>> * Squash change for advantech,idk-2121wr.yaml and
>>>>   panel-simple-lvds-dual-ports.yaml with lvds-dual-ports.yaml.  (Rob)
>>>> * Improve description in lvds-dual-ports.yaml.  (Krzysztof)
>>>>
>>>> v3:
>>>> * New patch.  (Dmitry)
>>>>
>>>>  .../bindings/display/lvds-dual-ports.yaml     | 76 +++++++++++++++++++
>>>>  .../display/panel/advantech,idk-2121wr.yaml   | 14 +---
>>>>  .../panel/panel-simple-lvds-dual-ports.yaml   | 20 +----
>>>>  3 files changed, 78 insertions(+), 32 deletions(-)  create mode
>>>> 100644 Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>>
>>>> diff --git
>>>> a/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>> b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>> new file mode 100644
>>>> index 000000000000..5f7a30640404
>>>> --- /dev/null
>>>> +++ b/Documentation/devicetree/bindings/display/lvds-dual-ports.yaml
>>>> @@ -0,0 +1,76 @@
>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) %YAML 1.2
>>>> +---
>>>> +$id: http://devicetree.org/schemas/display/lvds-dual-ports.yaml#
>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>>> +
>>>> +title: Dual-link LVDS Display Common Properties
>>>> +
>>>> +maintainers:
>>>> +  - Liu Ying <victor.liu@nxp.com>
>>>> +
>>>> +description: |
>>>> +  Common properties for LVDS displays with dual LVDS links. Extend
>>>> +LVDS display
>>>> +  common properties defined in lvds.yaml.
>>>> +
>>>> +  Dual-link LVDS displays receive odd pixels and even pixels
>>>> + separately from  the dual LVDS links. One link receives odd pixels
>>>> + and the other receives  even pixels. Some of those displays may
>>>> + also use only one LVDS link to  receive all pixels, being odd and even agnostic.
>>>> +
>>>> +allOf:
>>>> +  - $ref: lvds.yaml#
>>>> +
>>>> +properties:
>>>> +  ports:
>>>> +    $ref: /schemas/graph.yaml#/properties/ports
>>>> +
>>>> +    properties:
>>>> +      port@0:
>>>> +        $ref: /schemas/graph.yaml#/$defs/port-base
>>>> +        unevaluatedProperties: false
>>>> +        description: the first LVDS input link
>>>> +
>>>> +        properties:
>>>> +          dual-lvds-odd-pixels:
>>>> +            type: boolean
>>>> +            description: the first LVDS input link for odd pixels
>>>> +
>>>> +          dual-lvds-even-pixels:
>>>> +            type: boolean
>>>> +            description: the first LVDS input link for even pixels
>>>
>>>
>>> port@0 we know it is first link
>>> port@1 we know it is second link.
>>> dual-lvds-odd-pixels: We know it is for odd pixels.
>>> dual-lvds-even-pixels: We know it is for odd pixels.
>>>
>>> Not sure, whether we can give common description and avoid the
>>> duplicate from port@1 ??
>>
>> Yes, it'd better to use patternProperties. Thanks.
>>
>> --8<--
>>     patternProperties:
>>       '^port@[01]$':
>>         $ref: /schemas/graph.yaml#/$defs/port-base
>>         unevaluatedProperties: false
>>         description: |
>>           port@0 is for the first LVDS input link.
>>           port@1 is for the second LVDS input link.
>>
>>         properties:
>>           dual-lvds-odd-pixels:
>>             type: boolean
>>             description: LVDS input link for odd pixels
>>
>>           dual-lvds-even-pixels:
>>             type: boolean
>>             description: LVDS input link for even pixels
>>
>>         oneOf:
>>           - required: [dual-lvds-odd-pixels]
>>           - required: [dual-lvds-even-pixels]
>>           - properties:
>>               dual-lvds-odd-pixels: false
>>               dual-lvds-even-pixels: false
>>
>>     anyOf:
>>       - required:
>>           - port@0
>>       - required:
>>           - port@1
>> --8<--
>>
>>>
>>>
>>>> +
>>>> +        oneOf:
>>>> +          - required: [dual-lvds-odd-pixels]
>>>> +          - required: [dual-lvds-even-pixels]
>>>> +          - properties:
>>>> +              dual-lvds-odd-pixels: false
>>>> +              dual-lvds-even-pixels: false
>>>
>>> Why this is false here? oneOf is not sufficient?
>>
>> The 'false' is used when this LVDS link works alone as a single LVDS link, being odd and even
>> agnostic.
>>
>> The 'oneOf' allows a LVDS link to be defined as a single LVDS link or one link of dual LVDS links.
> 
> Ok, it makes sense for single LVDS link. Maybe rename the file to lvds-dual-ports.yaml->lvds-ports.yaml
> to make it clear, it is for all LVDS ports, if it is going to address single link case aswell??

Single-link LVDS displays are supposed to be documented
without referencing this schema, i.e., they may reference
lvds.yaml and define the single LVDS sink link with port
property(for panels) or port@0 property(for bridges).
port@1 would be defined as output port for bridges, not
input port.  Maybe, we'll have something like
lvds-single-port.yaml in the future.

> 
> Cheers,
> Biju
> 

-- 
Regards,
Liu Ying

