Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB07CA6A73
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 09:17:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FF0E10EA4D;
	Fri,  5 Dec 2025 08:16:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=amlogic.com header.i=@amlogic.com header.b="ItDK33zM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from TYPPR03CU001.outbound.protection.outlook.com
 (mail-japaneastazon11022129.outbound.protection.outlook.com [52.101.126.129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FE7610EA22
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 07:09:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RvfTbNhFfJ7LL7mVVgWI/ffGS+xNwFx3YVm29dz3+Szgyyj7FuYVI/pWg2wFjRHpylkkMrK0wYxAB9D2utpSU9PtZpE0PGUhp4dXj2mbpa6MBJHdKvYbREJcQOOD3TjC19vIKEscGlzc12t5pB5qXWKiCWZZQIu7HnNEaFrW3R0hRz1dwEGhcJntcZx4ao2hRRijwPqenc+65tOb2LT7T1GTrVnWUG8xDb6B0iw7VNeQ4C1h+Yo2nWPsjl8LZkjLFAAk3lWG1Pbtf4Sj0EUKSsdkh3/6dabZ9AhPSrqPdS+aAFgb3HrzRa8eVGoX/V9bUJVwEGw9pzTDGTLNyRb7QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C6X/xJE6G9okbIO/fZVWocnELBI7xMgAiAXIwIsSuZI=;
 b=D8+l8E1xpvMzxxLnhYarVd/5DLglhGrB89h/Pb89bPVtvScpsfg2gYN/Acubw9wQHwW2FDxvBgERFoPIGFpDQUG4x3ZS9kHw4jAYq+CziGeI6PapcPDUD5XAFFXR/dN70J6maUMnoTyjo7PCoeoxzZWM/G2GLx/XkK+kM3FstiyLHbPyP0AFTTzZR2tsIemL+nd47ZKkUdf/qpSLkUI5tjBvZELQLzTIHYD4BlMwSmaVFy5A/kP7tHOFn6FciUUUk8mes4X4JZ0uNyRJaLNKqSu0/kBMzMVcMtLxqjkb2vnCfZk2lT3wwngF9G2t6cnXbtpT+OIOMVQsOyRHMnsY4Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C6X/xJE6G9okbIO/fZVWocnELBI7xMgAiAXIwIsSuZI=;
 b=ItDK33zMVw6sEDpAcvzZtM9E1/hW2Ns9lzz2yFPmV/t2qLYV8WuaBCXbSTyAwTc6avcNkeTiobgCzEM1ktgCsEMUWFgPXjgcguKjsxp2h+zl80bcAaZ8wMVWQ39xsqjfcGm8wWbULrXsjvBsfiPMO1HnGNq9Rhhvx/2lwGVhZniRWwK6BCZJvzGelcWqL78xizKNSMUcKrEBsOZy7WXczkultVNbmiS3m5oBZpNOgxH8p6rri/KasWg2nqoDU4U52698yC7rgYdTJv2KkXyNjlSjue6Dl+m1ETLbmF+qnDHj29B9vfZTJJaWzbOWwrXtS51VjZIvZPyqIRezCdggpw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB7150.apcprd03.prod.outlook.com (2603:1096:820:cb::7)
 by PUZPR03MB7013.apcprd03.prod.outlook.com (2603:1096:301:f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.11; Fri, 5 Dec
 2025 07:09:53 +0000
Received: from KL1PR03MB7150.apcprd03.prod.outlook.com
 ([fe80::5852:e46a:3516:de2b]) by KL1PR03MB7150.apcprd03.prod.outlook.com
 ([fe80::5852:e46a:3516:de2b%6]) with mapi id 15.20.9366.012; Fri, 5 Dec 2025
 07:09:53 +0000
Content-Type: multipart/mixed; boundary="------------o0aZcQ0HMxcBDqAugnnPLsZf"
Message-ID: <b6b8203d-2a51-428f-8124-fa65d2c073a0@amlogic.com>
Date: Fri, 5 Dec 2025 15:09:47 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] dt-bindings: display: meson-dw-hdmi: Add compatible
 for S4 HDMI controller
From: Ao Xu <ao.xu@amlogic.com>
To: Piotr Oniszczuk <piotr.oniszczuk@gmail.com>
Cc: Chuan Liu <chuan.liu@amlogic.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com>
 <20250110-drm-s4-v1-1-cbc2d5edaae8@amlogic.com>
 <3AC316FA-A633-4B6C-81BA-CCCA290E7F03@gmail.com>
 <8c3b9fa4-326e-4791-8154-07b268faa132@amlogic.com>
 <7703796D-35D4-4AD2-B7F8-B75D2BE0F7AD@gmail.com>
 <a71f24c9-1f40-45a1-8fdb-6075bbf89930@amlogic.com>
 <F04DC684-AD64-447F-87EC-F503D411F25D@gmail.com>
 <070eb0a3-2f6e-41ef-8310-0c592a2816dc@amlogic.com>
In-Reply-To: <070eb0a3-2f6e-41ef-8310-0c592a2816dc@amlogic.com>
X-ClientProxiedBy: TYCP301CA0066.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:7d::7) To KL1PR03MB7150.apcprd03.prod.outlook.com
 (2603:1096:820:cb::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB7150:EE_|PUZPR03MB7013:EE_
X-MS-Office365-Filtering-Correlation-Id: 1aca9e46-3f06-41a0-1a07-08de33cd49b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|42112799006|366016|376014|7416014|7053199007|4013099003|13003099007|4053099003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WUNhTjF0emw5WENXbWh3bXRiK1A4VlQ1S2puY1hrUGdCKzNTdkE1Q2lBU2x6?=
 =?utf-8?B?bGQwVUxkZE1GMFQyVUc0a0tMTzhaVWltYjZ1UWxKR1NBQ3loc2JVUlZGY0hW?=
 =?utf-8?B?bk5pTVJ3clovalRUR2FIRVNkUEs0bExiSWZ2eFh6L29QSVViRWZoSmpRRDhn?=
 =?utf-8?B?WGtwZXIxU3NYciswWmczSy9mTWFzU05pK0ZScnhhdEFpdCtkZFE4aVJXK2l3?=
 =?utf-8?B?V1FIVmtjZFVEenJ4L3g3S2RvWFBOYkRGdTMzYXhsdU1aWlFjKytNaHlqcUV6?=
 =?utf-8?B?dWFReDhoNHRNSWs5TklpWnAwSVBsREh4WGl2MFhKclRza2dDWDNJRTlNeHdI?=
 =?utf-8?B?dVJTckpQSFIwRTlBK1NuYnEvV2pIRW52TXAwNjZkY1Z2allmcUV1V0RXbzhy?=
 =?utf-8?B?U3Q3cDZ5eU9tbTlSd2ZNemJJNFE1OXlsdG02WEovY1ZlekhpeWNnT1lPNTU1?=
 =?utf-8?B?Q2FrazZlT0FPdi82T2llYXlaZVVZZm5vZjZuMUNCeUZ3NkpQWlBDUzhoRzZV?=
 =?utf-8?B?VVBqSFZDVVBkcnM0ZXFzbTFnUDhNQ0MwSjZoczNpWnNSTHhYckN2QjQ1d1RX?=
 =?utf-8?B?OHhML3lRN053c3ZGQXE1Wi9HemNNVWwvWG1GOVAxRDE2Vmw1dER6ZVNrMU9D?=
 =?utf-8?B?QzFweEQ5UEFEWlozbnkrQ1labEVqSkdGMXZXVjVEeUpXeW9kNThhUXRKTDZU?=
 =?utf-8?B?VVg0YTJpWnd2S3Z4aWtxcVJUcXVKclZHZFlWOEZZS2xuSk1zNDVUcTdmZzg4?=
 =?utf-8?B?YWorMkswYzlBV2ZpSzZYQkt6c29HTkw3YU5RUzdkUjhZWWNhdDBJeEV5UlMy?=
 =?utf-8?B?Lzh0dG9FRGZRaUl3L0U1b1cxQWEyVmxtbzZPQXdwdWJ6VUcyY0x1Y0dwVVE0?=
 =?utf-8?B?ODhqZEpGeFBQdlBWQkpoalZOQ2N3bU1ZTW9Ld3FZYUwvWHpzZHQzUjY1UWhQ?=
 =?utf-8?B?UXFrb2ErLzNhQlZKcmxOdkNybHVrZTZGZ1pVUFJMVWxoMTFWMTZIbHQ0Y0NQ?=
 =?utf-8?B?eXZXbnVyczdKQndvL1RmWDkzQWlqUGpuWkp2R1ZqMzZma051NW9CVncyWGxH?=
 =?utf-8?B?UVFJUkpWN29wZE9SQkNjdE11NVpHOWlYazFaUWloSWw1NnZBQ0dMNGFJQ2oz?=
 =?utf-8?B?WlhjRTE1TVJscDFpOWNQWFkwNWhvN3ZFZ095VTIxclN5VmlxUUY4cDRFd1I2?=
 =?utf-8?B?SCtteG5hZm8xWEticlFJeXRVTURxM1UyNUhlOEpvaFp3R3JRYVVoNUlOVlF5?=
 =?utf-8?B?VUQ2aEdFSHp3TkRxblJUbitVeEJiNGJFMTlSY2FTdll0UlRoT0dhS3Era2ZX?=
 =?utf-8?B?amZXTmJCRSs0cEx4bTZOYlJhcnZPeXNwOEc2cERMSUZLc1crYm1ZVFlERnBG?=
 =?utf-8?B?anZwT3N2ZlphaHZERHpRaWVjZkloMXNaRitRdWMwK1NuMTJTWVpnV2RMNFFw?=
 =?utf-8?B?K21iSjBQdG5lajVGRzFMK0tKYjFFZVd2R28yZ2xDbDFlY3I2cy81U3dZUTZY?=
 =?utf-8?B?bmRuOE9CdW5zaEE2NTdrM0FaODVSaWk4c0ltQW9EWTZPYWExM216NVBqZjRC?=
 =?utf-8?B?OGR3U2paenlVT05yOGhTYUtKK3pYTCtSU3o5OCtKZXMzSGJCWStYcEw3VHdV?=
 =?utf-8?B?YysxTkhDWFgxM0d2Unl2WFlLVDdVbERGZkVlUXZZL2FFL2R4YTlZVXN3RTk0?=
 =?utf-8?B?MStJOWEwMExEeVQxbnloM0RDN0VJeVFGUWYxTUlQS0FpcnVRbjlBb1ZaRjlW?=
 =?utf-8?B?blFCM1J1QTFGQU8rTjh2U0s5ZWZCdlpJaXJUeUcweldsTUM2UEtvampFWVVq?=
 =?utf-8?B?R282am5hZlk3am9XYjdsOFczNGhuNmh3dEJCR3RoUnhBTTduV2trWGhnMkJm?=
 =?utf-8?B?anBQZWF2cy82TWVFTlA3OVFIY3lCOUEwaTBJOGtnK1Rqb0E9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR03MB7150.apcprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(42112799006)(366016)(376014)(7416014)(7053199007)(4013099003)(13003099007)(4053099003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aHN6VkxEcFZEVmpNckt6WEpzVUo1L1Z1c1pESGlRaUJVL0RCSFVHMEpKTTk5?=
 =?utf-8?B?eDdwTmhvV05HWW9PaHRNcWtPUEdLMFN1dHAra0hsSElYTkk1S1h3V24yUTBX?=
 =?utf-8?B?U2pQc01LeFVZSzBHYnJ3OU04Z0U5OE1oUTZhcVZGNEpxdkJoSi9idGkzS2ps?=
 =?utf-8?B?S2JHTVk1bFRVMVpGeEVQM05TOENmbWljN3psUC9Pd0hTNHluRGtHMHloU2hM?=
 =?utf-8?B?MlBubklKMy80cVcrekRxd2E2T2tjaDhNRXYrdTBmY2QvT3pMNWFzUk55Y2Jx?=
 =?utf-8?B?cWYxUUl1cEQvMjAvT3d3RUJsZlFSZ2VmVFU1MXBtSDZ5MjhISUx1eTNEUmpy?=
 =?utf-8?B?cnJ3d1JwaTRQQlVNR3lnMzFHbXZvZmxtZkZxRkh3VnlPV0VUMzlCZ2poODVI?=
 =?utf-8?B?RklFZjdtTTNncGVldE1LNEZBd25zNExkVC9sdWluQytXaUhqTllFUHNsaFhL?=
 =?utf-8?B?SnBlb096VHhLYVQyeE9reXlwUm5BaFQ5ejdWenNKSnN5K3RIUUoxNkVHYnBY?=
 =?utf-8?B?UjhlWVNtYWhCRThWSHptbW9CeDYrdi9aYjZVcndwQ25NTCtqVU5pRFRncCt3?=
 =?utf-8?B?dzVUTWRQSm9wQU81NVQrU2tMMDRpU3UvbTNNY2lpUFI5TXhyRzJQOHFDb1pR?=
 =?utf-8?B?NWdta1FtbXljd0hPeGppTHdyR0FBWWNrYnNIZVc4OEZCNEtzZUxGVFljb1c5?=
 =?utf-8?B?NDFRK0pKdy9jVHp6THlZRHFHVkdkb2VvaU54TVVTaVlTWkZGMkQzc3lLWjJY?=
 =?utf-8?B?K3l1dkliVGFwYVg2T3ZmVEJCc0I0TGIxRnA1aUJrWXpZbEE3R3BkOVZVU09h?=
 =?utf-8?B?eWVrejh6TFU4VWQwcCtjTE16ZWJFVGxmK3JlR2V0Zlh3MkhBREdBYzRYWlNu?=
 =?utf-8?B?MFNGV3daR01NNFkvS0toNmhoN0ltUGMrSXM5alJ3OVhpWVpXRE91Umd3T01V?=
 =?utf-8?B?RVpJU3BIcG9Ib3dJZ1VndE83TTlIN003Y25CUkcxdnFlMGNQVEZDVU14eHZE?=
 =?utf-8?B?Qk4zVVZYV1o0cUhnY0JxTmd4VStjMFRFanhiUnVIOHhQSkNpS0FjaFNpcU4x?=
 =?utf-8?B?bk9rNHVMK3djYVJDU3JCeEhlN0dhR1d5WjFXVTRnc0NNbE5LUFYzZDljdTJT?=
 =?utf-8?B?K0cvMW9nc1orTStNdWFuQUppQ1AwR29BN1RycTNvcHhqV0VYRFRpSWN0MTUr?=
 =?utf-8?B?NHpONnZESVZoYlNzbVlxYUIzSC9tZGVmRlNmZmdHUUJCdmxBQktvZ1ZRaDBK?=
 =?utf-8?B?b1lSZ2hsbmxjYTI0Zk43VmFCRU90cVNXa1VVcnkyNFB2TUQvQU1DV0ZBUWgw?=
 =?utf-8?B?am5qd3hYWk1KUWtTdVNvTlc1ckN1U3VhNllEbzRFSG5qT2ZUM2ZFU3Z6U0Rq?=
 =?utf-8?B?NUtOekxZSmcxd21yWGRGcTBZK0VldDRiTmwzRm1kVWdzSnVvQ2NDUEo0VkYw?=
 =?utf-8?B?OFpYSkh3bGg5Z0kvWHFZNEUrNVllZWp2V2ZaUGpSbjRUbGFQWGpzZHU3UTRZ?=
 =?utf-8?B?UjFmNS9abXVmZGdvTDB0Tmt1TkFiVW5rQ3Y5Q2lzb0VVTVA0Z3A0NVVNeVI5?=
 =?utf-8?B?RmFCd3B0NXBSM3VmVVEyUGE4cHlHaGVRN0R0eDNweXduTkNVdjI0bEhPQWlG?=
 =?utf-8?B?TmNqWGYvaE5SZEJESTNqb3h4cG9PdzVpMWM4QUxIQk1wWHRaQUVxbzlRb1FN?=
 =?utf-8?B?RUViVlZqdk9GK3hrOE8vS0ZIUkwwSWVxdksxckJMTlNVQllzYkNYL2txbW9V?=
 =?utf-8?B?VlcrMjNRa0wxbzVPVnRKZml4czJ2Ymh4a1dvcTlKSmJvMS96cjlseEp4eUR3?=
 =?utf-8?B?OVAzbzFLK3NPdDNSajV6M1VHdWMrTDFPamcwakEwQS8zaEV2LzVNR0hLcFFS?=
 =?utf-8?B?RHE2ZHdRR1cwUWpXSWhwNnJQbE1nTXIybFUzWTIyYWZoT3didTQ2bHRYU2Vh?=
 =?utf-8?B?bkVwVUtmcTJFbnlyREowTFBRT21WK3JySHV6dTRmN1pBQWJRRkhtdXA5TC9l?=
 =?utf-8?B?MGwxd3RibE9ySXlWRXZEY3Zrd2VjZUlIVUU1WFovanJ0QXJFV0x5dkNBeVhY?=
 =?utf-8?B?WXZHcDZSU1U3ZG9LSnBVdGJSQ3hNSlJCRW0yZWJ2V2QzUXhXQTlKeHdHdkpj?=
 =?utf-8?Q?S+Iw/HklCZj/OufUq8MyTENHq?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1aca9e46-3f06-41a0-1a07-08de33cd49b4
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB7150.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 07:09:53.3588 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 73r4LtkPyuLOMUkc7Zqv2B35DlxO63rVHuo3kq9gP+AMTV/zh3D7dkTyiVrA3MLpwAt6tROZDIAcW0jL/EYj4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR03MB7013
X-Mailman-Approved-At: Fri, 05 Dec 2025 08:16:55 +0000
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

--------------o0aZcQ0HMxcBDqAugnnPLsZf
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Piotr，

     I applied this 
patch: https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.18/files/0312-drm-meson-add-vpu-clk-setting-for-S4.patch, and 
ran it on the board.

     I encountered the same issue—the system froze.

     I found that the patch has a few minor problems. After fixing them, 
the system runs normally. Could you try the following patch?


在 2025/12/3 13:56, Ao Xu 写道:
> Hi Piotr，
>
>     I will need about two more days to look into it. I will follow up 
> with you ASAP.
>
>
> 在 2025/12/2 16:29, Piotr Oniszczuk 写道:
>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn why 
>> this is important at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> [ EXTERNAL EMAIL ]
>>
>> Ao,
>> Any chance for updated s4 hdmi series for 6.18?
>>
>>
>>> Wiadomość napisana przez Ao Xu <ao.xu@amlogic.com> w dniu 21 lis 
>>> 2025, o godz. 03:55:
>>>
>>> Hi Piotr，
>>>
>>>      I will check this issue
>>>
>>> 在 2025/11/19 18:27, Piotr Oniszczuk 写道:
>>>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn 
>>>> why this is important at 
>>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>>
>>>> [ EXTERNAL EMAIL ]
>>>>
>>>> Pls see inline
>>>>
>>>>> Wiadomość napisana przez Chuan Liu <chuan.liu@amlogic.com> w dniu 
>>>>> 19 lis 2025, o godz. 03:57:
>>>>>
>>>>> Hi Piotr,
>>>>>
>>>>>
>>>>> On 11/18/2025 10:50 PM, Piotr Oniszczuk wrote:
>>>>>> [You don't often get email from piotr.oniszczuk@gmail.com. Learn 
>>>>>> why this is important at 
>>>>>> https://aka.ms/LearnAboutSenderIdentification ]
>>>>>> [ EXTERNAL EMAIL ]
>>>>>> Ao,
>>>>>> Is there any chance to get this s4 drm hdmi series for current 6.18?
>>>>>> (i tried backport this series to 6.18 but have some issues with 
>>>>>> reparent vpu_0_sel to sysclk_b_sel)
>>>>> Why do we need to reparent vpu_0_sel to sysclk_b_sel? is there any
>>>>> background here?
>>>> Well - it looks it is because bug....
>>>> Martin Blumenstingl had perfect eye and catch typo in patch 
>>>> https://lore.kernel.org/all/20250110-drm-s4-v1-11-cbc2d5edaae8@amlogic.com/: 
>>>>
>>>>
>>>> By replacing:
>>>> assigned-clock-parents = <&clkc_periphs CLKID_FCLK_DIV3>,
>>>> <0>, /* Do Nothing */
>>>> <&clkc_periphs CLKID_VPU_0>,
>>>> <&clkc_periphs CLKID_FCLK_DIV4>,
>>>> <0>, /* Do Nothing */
>>>> <&clkc_periphs CLKID_VAPB_0>;
>>>>
>>>> with:
>>>> assigned-clock-parents = <&clkc_pll CLKID_FCLK_DIV3>,
>>>> <0>, /* Do Nothing */
>>>> <&clkc_periphs CLKID_VPU_0>,
>>>> <&clkc_pll CLKID_FCLK_DIV4>,
>>>> <0>, /* Do Nothing */
>>>> <&clkc_periphs CLKID_VAPB_0>;
>>>>
>>>> dmesg is like this https://termbin.com/6020
>>>>
>>>> So i'm getting hdmi working - but only when device boots _without_ 
>>>> connected hdmi at boot (and connected later)
>>>> If hdmi is connected at boot - boot hangs at:
>>>>
>>>>      0.341676] meson-dw-hdmi fe300000.hdmi-tx: Detected HDMI TX 
>>>> controller v2.01a with HDCP (meson_dw_hdmi_phy)
>>>> [    0.342750] meson-dw-hdmi fe300000.hdmi-tx: registered 
>>>> DesignWare HDMI I2C bus driver
>>>> [    0.343660] meson-drm ff000000.vpu: bound fe300000.hdmi-tx (ops 
>>>> meson_dw_hdmi_ops)
>>>> [    0.344832] [drm] Initialized meson 1.0.0 for ff000000.vpu on 
>>>> minor 0
>>>>
>>>> FYI: It is after applying 
>>>> https://patchwork.kernel.org/project/linux-amlogic/cover/20250110-drm-s4-v1-0-cbc2d5edaae8@amlogic.com/ 
>>>> on mainline 6.18 (with some my adjustments on this series required 
>>>> by changes in 6.18).
>>>> For VPU clk changes see 
>>>> https://github.com/warpme/minimyth2/blob/master/script/kernel/linux-6.18/files/0312-drm-meson-add-vpu-clk-setting-for-S4.patch
>>>> It is 6.18 adaptation of 
>>>> https://patchwork.kernel.org/project/linux-amlogic/patch/20250110-drm-s4-v1-9-cbc2d5edaae8@amlogic.com/
>>>>
>>>> As kernel hangs - i have limited caps to drill where root cause is.
>>>>
>>>> Maybe above hang is reason of my backports or missing any pre-req 
>>>> required to get s4 drm working?
>>>> Anyway - it will be good to test with updated to 6.18 series of Add 
>>>> DRM support for Amlogic S4 (plus info about any pre-req required to 
>>>> get s4 drm working)
>>>>
>>>>
>>>>> The vpu_clk on S4 doesn't support sysclk_b_sel as one of its
>>>>> selectable clock sources, so this reparent operation will definitely
>>>>> fail. This has nothing to do with the kernel version.
>>>>>
>>>>>>> Wiadomość napisana przez Ao Xu via B4 Relay 
>>>>>>> <devnull+ao.xu.amlogic.com@kernel.org> w dniu 10 sty 2025, o 
>>>>>>> godz. 06:39:
>>>>>>>
>>>>>>> From: Ao Xu <ao.xu@amlogic.com>
>>>>>>>
>>>>>>> Add devicetree document for S4 HDMI controller
>>>>>>>
>>>>>>> Signed-off-by: Ao Xu <ao.xu@amlogic.com>
>>>>>>> ---
>>>>>>> Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml 
>>>>>>> | 1 +
>>>>>>> 1 file changed, 1 insertion(+)
>>>>>>>
>>>>>>> diff --git 
>>>>>>> a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml 
>>>>>>> b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml 
>>>>>>>
>>>>>>> index 
>>>>>>> 84d68b8cfccc86fd87a6a0fd2b70af12e51eb8a4..6e0a8369eee915fab55af24d450a6c40e08def38 
>>>>>>> 100644
>>>>>>> --- 
>>>>>>> a/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml 
>>>>>>>
>>>>>>> +++ 
>>>>>>> b/Documentation/devicetree/bindings/display/amlogic,meson-dw-hdmi.yaml 
>>>>>>>
>>>>>>> @@ -55,6 +55,7 @@ properties:
>>>>>>>            - const: amlogic,meson-gx-dw-hdmi
>>>>>>>        - enum:
>>>>>>>            - amlogic,meson-g12a-dw-hdmi # G12A (S905X2, S905Y2, 
>>>>>>> S905D2)
>>>>>>> +          - amlogic,meson-s4-dw-hdmi # S4 (S905Y4)
>>>>>>>
>>>>>>>    reg:
>>>>>>>      maxItems: 1
>>>>>>>
>>>>>>> -- 
>>>>>>> 2.43.0
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> linux-amlogic mailing list
>>>>>>> linux-amlogic@lists.infradead.org
>>>>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
>>>>>> _______________________________________________
>>>>>> linux-amlogic mailing list
>>>>>> linux-amlogic@lists.infradead.org
>>>>>> http://lists.infradead.org/mailman/listinfo/linux-amlogic
--------------o0aZcQ0HMxcBDqAugnnPLsZf
Content-Type: text/plain; charset=UTF-8;
 name="fix-vpu-clk-setting-for-s4.patch"
Content-Disposition: attachment; filename="fix-vpu-clk-setting-for-s4.patch"
Content-Transfer-Encoding: base64

SW5kZXg6IGxpbnV4LW5leHQvbWVzb25fdmNsay5jCj09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT0KLS0tIGxpbnV4LW5leHQu
b3JpZy9tZXNvbl92Y2xrLmMJMjAyNS0xMi0wNSAxNDo1ODoyOS4wMzE0NTQxNzQgKzA4MDAKKysr
IGxpbnV4LW5leHQvbWVzb25fdmNsay5jCTIwMjUtMTItMDUgMTU6MDA6MzQuOTM1MjA0MjE5ICsw
ODAwCkBAIC01OTcsMTEgKzU5NywxMSBAQAogCQkudmNsa19kaXYgPSAxLAogCX0sCiAJW01FU09O
X1ZDTEtfSERNSV8yNzAwMF0gPSB7Ci0JCS5wbGxfZnJlcSA9IDQzMjAwMDAsCi0JCS5waHlfZnJl
cSA9IDI3MDAwMCwKLQkJLnZjbGtfZnJlcSA9IDU0MDAwLAotCQkudmVuY19mcmVxID0gMjcwMDAs
Ci0JCS5waXhlbF9mcmVxID0gMjcwMDAsCisJCS5wbGxfZnJlcSA9IDQzMjAwMDAwMDAsCisJCS5w
aHlfZnJlcSA9IDI3MDAwMDAwMCwKKwkJLnZjbGtfZnJlcSA9IDU0MDAwMDAwLAorCQkudmVuY19m
cmVxID0gMjcwMDAwMDAsCisJCS5waXhlbF9mcmVxID0gMjcwMDAwMDAsCiAJCS5wbGxfb2QxID0g
NCwKIAkJLnBsbF9vZDIgPSA0LAogCQkucGxsX29kMyA9IDEsCkBAIC0xMTQ4LDE1ICsxMTQ4LDE1
IEBACiAJCW1lc29uX2hkbWlfcGxsX3NldF9wYXJhbXMocHJpdiwgbSwgZnJhYywgb2QxLCBvZDIs
IG9kMyk7CiAJfSBlbHNlIGlmIChtZXNvbl92cHVfaXNfY29tcGF0aWJsZShwcml2LCBWUFVfQ09N
UEFUSUJMRV9TNCkpIHsKIAkJc3dpdGNoIChwbGxfYmFzZV9mcmVxKSB7Ci0JCWNhc2UgMjk3MDAw
MDoKKwkJY2FzZSAyOTcwMDAwMDAwOgogCQkJbSA9IDB4N2I7CiAJCQlmcmFjID0gdmljX2FsdGVy
bmF0ZV9jbG9jayA/IDB4MTQwYjQgOiAweDE4MDAwOwogCQkJYnJlYWs7Ci0JCWNhc2UgNDMyMDAw
MDoKKwkJY2FzZSA0MzIwMDAwMDAwOgogCQkJbSA9IHZpY19hbHRlcm5hdGVfY2xvY2sgPyAweGIz
IDogMHhiNDsKIAkJCWZyYWMgPSB2aWNfYWx0ZXJuYXRlX2Nsb2NrID8gMHgxYTNlZSA6IDA7CiAJ
CQlicmVhazsKLQkJY2FzZSA1OTQwMDAwOgorCQljYXNlIDU5NDAwMDAwMDA6CiAJCQltID0gMHhm
NzsKIAkJCWZyYWMgPSB2aWNfYWx0ZXJuYXRlX2Nsb2NrID8gMHg4MTQ4IDogMHgxMDAwMDsKIAkJ
CWJyZWFrOwo=

--------------o0aZcQ0HMxcBDqAugnnPLsZf--
