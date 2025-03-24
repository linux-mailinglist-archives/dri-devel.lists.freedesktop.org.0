Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B57A6DD68
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 15:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C02F110E3A3;
	Mon, 24 Mar 2025 14:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=imgtec.com header.i=@imgtec.com header.b="ytjjesj4";
	dkim=pass (1024-bit key; unprotected) header.d=IMGTecCRM.onmicrosoft.com header.i=@IMGTecCRM.onmicrosoft.com header.b="b0czEYCB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx07-00376f01.pphosted.com (mx07-00376f01.pphosted.com
 [185.132.180.163])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A129E10E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Mar 2025 14:50:27 +0000 (UTC)
Received: from pps.filterd (m0168889.ppops.net [127.0.0.1])
 by mx07-00376f01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6Nwsf023878;
 Mon, 24 Mar 2025 14:50:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=imgtec.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=dk201812; bh=4A0TFgR0fdBHZy+aYAL1VrHuh
 p2+EiNosweNVLlcl2A=; b=ytjjesj4VsFl0D8hefsV1y2mh9ekZWNpIwH9d9P6A
 zpDqaxkuN8bBIPSqj/sBfK77UBWwvM1UDKe3wavdfQKIzTEW/a3M8CCCHwiySaY1
 h8+3N4K4DbefP3gljuvjGEXU8YUeZALEzPA1PQ8YKHFSSvanPwwJ5cr3c2nhufrS
 J9kKtO7wwqnS6VBnEDsQNRzeBMEyLT+J34AF+F8NPReZzL8eIRYdQSdIAPkA2cis
 dGoWc8q8DUidEdzX8K82SXVMYaorhAliCirmZkzkXyGEcwq02mqXPZ0KlthiO+8i
 Rr0LxGD+2ZtsyoyYdeHDShGZohRTaohGmFV1z2kyumJ8A==
Received: from cwxp265cu009.outbound.protection.outlook.com
 (mail-ukwestazlp17011030.outbound.protection.outlook.com [40.93.68.30])
 by mx07-00376f01.pphosted.com (PPS) with ESMTPS id 45hp60sh0g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 24 Mar 2025 14:50:08 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UG0tPjVMyAVM1Y8hdbDQdEJ4lawpzVmh5LOQtIsxWO4JOdkUOAPO8uuk6SQlLxyjan8B7HPFiaETWotK1uI45rY+ppEZEbRXi0ZIUG6ZYmw60uZXS7dJoR7NkSlW8jZBYpKiYTxbOMl8OZHiu8DmiGiSwcrjrPfmap+07dk+A6tiBR3CmkBQLbAH4wDEWC40DzJqKT8nO2WeFHyC309ClSsQavteQEZp6qEn2ahNpesYMdxf/ynaVZg+MI5Yacx//xC9/xPGgrWCUKkwJ+D0nmdE/Uj900w8ERTgSScneZo5T9SS97zyy3LMtlDIastwwq1NarrR3mWnsZ8rURkZ7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4A0TFgR0fdBHZy+aYAL1VrHuhp2+EiNosweNVLlcl2A=;
 b=VodntHh5SjTQ/QOq9EBoBPA3ISwgyPY8XYrWykIc4b1x6GW40Ed550ItizQa74WZrWEJel+QSeD6UCexDV7143sta/9hPuh2TQv1feX6+H297GDp2G+OzrYBAk24Q16Gawt+wC9M8L8Hs8B6Ju0G3IUbftFcDgENMVoDJgwZdbo7TB3II1Tv2U2TmVBcm3AfIy48uaYZG0XP+q2B092e7PMGFwvhUkBliM1qqbv5YpW0ucAKhqKrRuJ/6ChPgsLq0hbYe2ZWWxCCTcS+AenYKzjIoNa+yuLOXr/5LFvCQcEsUy/bimtiAIZplmEow+0G/y0Bd7FApxIvjqxRc9e6jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=imgtec.com; dmarc=pass action=none header.from=imgtec.com;
 dkim=pass header.d=imgtec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=IMGTecCRM.onmicrosoft.com; s=selector2-IMGTecCRM-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4A0TFgR0fdBHZy+aYAL1VrHuhp2+EiNosweNVLlcl2A=;
 b=b0czEYCBmPBqrDi+T5PWAq1WiHFWXws6rt+a5eIYe3DIE7L+qb7WnrRiDMEXUJj47twrQz3I9WPRY/m9sajk+mjX5V7wLhd32ukSe//AAuah/FZCnhlIIMttXhkSf3U+3oqY5tNnuCui6QQAX2h9bkC9+TRYSXTX0rndz/7fd2s=
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::8) by
 CWLP265MB2211.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:6f::11) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8583.25; Mon, 24 Mar 2025 14:50:06 +0000
Received: from CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15]) by CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
 ([fe80::8e9d:6b2f:9881:1e15%4]) with mapi id 15.20.8583.023; Mon, 24 Mar 2025
 14:50:06 +0000
From: Matt Coster <Matt.Coster@imgtec.com>
To: Brendan King <Brendan.King@imgtec.com>
CC: Frank Binns <Frank.Binns@imgtec.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH] drm/imagination: fix firmware memory leaks
Thread-Topic: [PATCH] drm/imagination: fix firmware memory leaks
Thread-Index: AQHbmBXghfCmgZj+zUuFLJLy8+YLkrOCZ+OA
Date: Mon, 24 Mar 2025 14:50:05 +0000
Message-ID: <af290775-f690-475c-8458-5047b9cf59c4@imgtec.com>
References: <20250318-ddkopsrc-1339-firmware-related-memory-leak-on-module-unload-v1-1-155337c57bb4@imgtec.com>
In-Reply-To: <20250318-ddkopsrc-1339-firmware-related-memory-leak-on-module-unload-v1-1-155337c57bb4@imgtec.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CWXP265MB3397:EE_|CWLP265MB2211:EE_
x-ms-office365-filtering-correlation-id: 551305e4-9bac-4147-24a3-08dd6ae32a88
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|38070700018|4053099003; 
x-microsoft-antispam-message-info: =?utf-8?B?Q0hUQllZaGhZSGtDVnZoeEdMTm81U0FmT0Fxd2tsVk5CU1N4MkJQU3pxL2g3?=
 =?utf-8?B?U0JBUWFMT3RRS2xneWVXY1c1OE1sbUd3cFN2M1hIVHEzQVhzMGJOb1BGUFAx?=
 =?utf-8?B?cU1Tdk5yRTRab3lsMUNIK1R6VHErRVNFajRsU0VKSE5udHM0L3gveFh6TUI5?=
 =?utf-8?B?MmRXcWpHTk1sMERWSmxXWHF4bUREa1dzempjL1VDV3h0N2MzUEVBcERDMUVz?=
 =?utf-8?B?amNsR3Z4NXdkbDV0dHdFbE5ydUQzRU9XTDR1dHAwdXB6dUVqM0Y3TVpxeFg5?=
 =?utf-8?B?NU9aT2tMNFNTTUpSQXFSK01TdEszbmdSWG13TjczRXRxZExqdGR6SXBLK3h4?=
 =?utf-8?B?NGlLNHgrNTAxcnZyTFV1L3NlZkZDd3l0N1dFbHA5WGV6bThpR3F5d0xXa3lz?=
 =?utf-8?B?cFhucmNENXNlb2cxZDZNYSs1SkVmcEZsQ2V5bWF5UjUrSDdCazQ0Mm9jcFUr?=
 =?utf-8?B?emtza3Z4Rkw4MlFWMmF3bXRNUDhmVmFCOC9Sbkg2RDV1SXVpN0ViRk90aGUr?=
 =?utf-8?B?V1pmaC9pNStVMnAxZmowclNCVlJ6R3ltSnVWZmQ2Qzl4VTkrOEZvYWttM1VH?=
 =?utf-8?B?NldOUkJ5MGxyYXl6QVYwNlViN2Y4OThjd09ZTFRRSHo4Tm8rSS9nV2RHTHhk?=
 =?utf-8?B?bFNEaytQMWQvd0N6VG9jTWxVM1czaW51eXBDY0xLTDByaDBDbk1OU2FURDhu?=
 =?utf-8?B?MENmM3FSVGV5RnoxS2VEM1ZPWDVMaXhzSjREVnE3eS82NzhFcHlXbXNsaWcy?=
 =?utf-8?B?N2NQTXRPWElpVXRlOHR6UUgwekhXcFZIUDhpZFIvR2d2RXExY3FUVFJ6VnFF?=
 =?utf-8?B?cHE3VjBVQzNOQko1emdGTm5RR0JkVXdielJmdUNpSTJpR00xVUk4cFFpZHN4?=
 =?utf-8?B?OXdQeHREcE5aM0VpV3pySjZERlhNUFp1eEx4NDZHTWNXUUc5VXVrcUhoclpy?=
 =?utf-8?B?QkN0V2hDRUc4enVLNlA5OWNlVEU5M1YrVHRGS0NCRWF5Sk5jVlk2SW9CTVVZ?=
 =?utf-8?B?aThzanBwUkdXaE1aVmpERnJUeEJCRG0vV1hTSWg1bEpIekdVQXZ2U3cwNTgr?=
 =?utf-8?B?L2RFVmY0cTA2bDgwRXovcUNobWdNMTJPWlIwK1ErYjdsb0JoV1h5K1EvK3BM?=
 =?utf-8?B?S1RwdE1UZ0RzL0FSYld0VnoyZlNiUms4N2N0Y1ROOElGSGp1WWRmb0N4Y2J1?=
 =?utf-8?B?UFErR2hLaUhNT2tURFphbWlMVWdnTUhFRHZ4SnVVYVFvdG1ET2ZROUZpeUpD?=
 =?utf-8?B?MzNUeVVlbHBJZDR3cjNJM0xWK3dETDZicFh3b2hCUkUrbEZKcjNBRnpPeWIz?=
 =?utf-8?B?SmNGeTJOYXg4UDZOckdLNE1oc2pzV0xJa0hOTG9kTGhvLy9vSFczTFh6RUVU?=
 =?utf-8?B?Z0ZvOUZGMGN4ZFV0N2ZST0JBR2Ivb1pxckJYUEdTalRhV0lHYjU5TCs0RDd4?=
 =?utf-8?B?SHF0dUp5TFExcitFTVVWWDVobDFsWW5nMnFDOXE5SUVuTnB4bjVLbjBPdWpL?=
 =?utf-8?B?Tzk4cndrQ0FvdU80dHJrN01QUW5VWXJ6L0VVLy9YZWtTWnhVV1dDR2tyOW9I?=
 =?utf-8?B?SXpTMTFVbHYvdTZDOE8yMitUeDdxcmNuYkNHUDlJdHBDdWZJNmpWQzdPMXV4?=
 =?utf-8?B?ZDlISHkvQUtERVJ0QkhmaG5sR1I5WkU4M3QvUndiMjBZczZVTHBIK1A0cEhO?=
 =?utf-8?B?eGlBVEpsbFBONkR5VjVlZC92aTFRYzRaOG5NbVVwMzF3UEVtSnZzUHA2aFN6?=
 =?utf-8?B?SUtsZUhKaHdyWHBrQ2ZTR0ZNZ0FVRUJvZ0s0cnBYVTJjZHRsd0x1V1dDUjdW?=
 =?utf-8?B?NUwzcy85QkhXcDhHZ1pITlA3aldmRTFmWHgwUnA5K1VxdFlpKzJka3BDTmVi?=
 =?utf-8?B?TEJ0Qmk3RjVZVkhxelFGMStCZDlLcDZtdjdxUVFwYW4wVjNPejl4aXRlY1ZC?=
 =?utf-8?Q?5CmuK75p0+AcoJWKBNwiw+QudcA9OXqz?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(38070700018)(4053099003); DIR:OUT;
 SFP:1102; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VlplLzdPbURqSDliVkxQUjczem95am1ZbGtNZVo4RzFFUUFxbUZUVzVlL0pH?=
 =?utf-8?B?Uzk1WndoZk5ZSGoxR01uTEFZejNJYVQwc29HOE9LcHk1bFhoYUlrRDY1YTBY?=
 =?utf-8?B?eGRoWk5acThQT0JHTDQ3U2FUb1pUMm56M0NyZzB3OTZNUTlDQWRYRTdiZWhX?=
 =?utf-8?B?eFNnbDN0SGJJbVpKNjhwWEJHb1duNWp1OFZkbWtocE15d01PUWVTMHpWR2Vm?=
 =?utf-8?B?MkxPV21rcFVPRGdnWllqSzlVQ044M21uUnhmN05xQ2pXVTJHOU8rekZoZ1dX?=
 =?utf-8?B?b3Npa05QWEpxZE1TVVlJT1pqbmFFbWNUbGtzT21DOVhsa1UxOHl6akt4T1RV?=
 =?utf-8?B?TVUvRlkxWTBYR3hqbmZFcmlzamtLT2NTbUJVbE1meW5Uc1UxZHhwOXpZeTdq?=
 =?utf-8?B?amZubDBkVXVSTCsyNm82QWkvQldka0haSkhuNituV21DVTdmaWRtNEYvQ1Ez?=
 =?utf-8?B?dlFjdU5TWDJmTWRMenRnKzgvNFF1Y2Jnd3lkVmVWdG9rNlpZVU9TMWE5U1cx?=
 =?utf-8?B?ZDVDaGVLSFk1cTErMFN0cmpwTWIvbXh1ZkdQODZFNHBJNm1TZkhDYnduU1Ur?=
 =?utf-8?B?eUNvQWpWeWhXaGk1UU45Z3ZtRVZGZFhabDBoMFNpcjBkQzdhUzlKbjM5RTBD?=
 =?utf-8?B?dzI2YTNVam9KZ21mTjFVMWNndGZ5Z1E3Z0oreHBhMVdXZ09WSitXTVk3NTZh?=
 =?utf-8?B?L05INFlxT1RTaGVaWmFBRmRGb0VzK1NGNUFmaWlLUStBaENUMnJsbldWZmdh?=
 =?utf-8?B?V1JVeW1UUTB3U1VsRzdUaitadjRCVkxXbXVnc3ZLemJMako3TlRsTWQweFh2?=
 =?utf-8?B?dFdWSWpUd3hJaVZjbG5xQVphVlFZK0Zzd2tlSmdhdXJhdTBmd1dzS1pkZ3VP?=
 =?utf-8?B?dWZKSjFiVW8rRkFsbEhwM3c4bUVuYXZjZHVSMHpZVENJQlowSFZlQzY0Ui8w?=
 =?utf-8?B?MnRXbXFDS3hBTzB4V29BM2lzck1ubjh5Y29TNnlmbU1lS3NKSFZTRnN6RFRn?=
 =?utf-8?B?d0FWRGx4N215LzF0bkxkcklFNXY4U05iWm84MHVTUkJCMDArVkEweHQvTTVS?=
 =?utf-8?B?U2NaRHV5Uzd0VGpyNTBFNzNINnlmZld3YnUvYk9OWHBOeUhNWXlCR2MwZDVw?=
 =?utf-8?B?dXREd1VnZVFiWVMwbWQ4U3pEYmR4V2xjNHNPQndGWnJKRW5QUU9VcnNjZHVy?=
 =?utf-8?B?NVVXVUZRZDZVRm54ZkpnMmVOc21IOHR4YWVOOXpUcjhoclZ2WlRMSE8zK1Fr?=
 =?utf-8?B?TmprcXYwNWhHS1BSTnlYbytHZmQyUlRaVEtJNVNYNnh6STVNZnAxVEl4alJL?=
 =?utf-8?B?Nk12MCtTVVJxNHI4U0JWWi9rajIzbm83MVNzYXd6eVhycVhvbms5Q2ZlMGdE?=
 =?utf-8?B?ZExEbTRYOWFjOUwvOHNlY2xWNFpFYTNKY3Z4RmpOU3pISVdzME5KU2l1MDlL?=
 =?utf-8?B?djZFUENIbStiU1hoZFpJb1BNQWlYcEMyNFFLWUxOYWtURUpyT3BaWW53Qzkw?=
 =?utf-8?B?clczbElpV3ZMbzBNZGVoZ0tETXEwRG5HTXJINEdFRWhneFlrRFFyQWtYdWZa?=
 =?utf-8?B?bEMrQ2hwRmFJSUVOZVV0UU1yb2kraWZLNFJTRE1zTTlrRjdkbjhteWYxcUk0?=
 =?utf-8?B?TTYvQTNzTlZMRkI4SDRoa0c1Q3BnZkZ0elB0TEk0aGNlQ3BzTGptYzZPNU5v?=
 =?utf-8?B?UmRhSlRDVWd5WkxUTHB6a1F4SmdURjdtNGY1U0Q4clFzZHVaaytGcFF2VFFy?=
 =?utf-8?B?NDhUWlNzV2dDU3B6US9zMmRIVFdldUluTUVuT1BoOC9ES0dCSmdQNC9OVldY?=
 =?utf-8?B?b1hsZkVTQXd4M2tOQ2VkWE0wdCttam5zd3NlZWxRczZtM0UxZE9ZeGZTdWtj?=
 =?utf-8?B?MkJwSXg3T1FyYzVpVy90a3gxS1RXbDI1Mm1kS01MQlluRENqblFPVlRKOWxG?=
 =?utf-8?B?bnFoRUt6dHJyN2tmZnVhUFRuRVZNSWs3Z2RzZEw2MlV3Z2lwU2t0QlI5MVV1?=
 =?utf-8?B?aFYrMDUxaElqT3VDUlE5bFQ5TWVXZWZnciszOXlCc245eWpEaEFDYyt3V1Vl?=
 =?utf-8?B?MjFnNzljMllTUEozWEhBOFFkZXNLbWtGYU1QblhmL0k5c1hwS3dld1lHZjJT?=
 =?utf-8?B?NUdJbzJteUovT3RiSXVGWXliSUVqYTBNdktGb0p5NnRZaHdGVWxuQ01rWlFq?=
 =?utf-8?B?cEE9PQ==?=
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------5swW1qIISZurWzrCaei0660s"
MIME-Version: 1.0
X-OriginatorOrg: imgtec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CWXP265MB3397.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: 551305e4-9bac-4147-24a3-08dd6ae32a88
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2025 14:50:05.9982 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 0d5fd8bb-e8c2-4e0a-8dd5-2c264f7140fe
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: RIsOtEUYcfFNAI0B0prYdDHjy9yLmDrAMAIbpCxa1F2oFwsBI/9voB7ANTjnYNSHl3Xcs31F9bnDODpJls+b1g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB2211
X-Proofpoint-GUID: 2j1fn4WW4Naeq6NMNMcKuwrMa6XY-OCf
X-Authority-Analysis: v=2.4 cv=Qb5mvtbv c=1 sm=1 tr=0 ts=67e17121 cx=c_pps
 a=h72tj/vcfevIRsfYUpnJeg==:117 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19
 a=xqWC_Br6kY4A:10 a=Vs1iUdzkB0EA:10
 a=H5OGdu5hBBwA:10 a=NgoYpvdbvlAA:10 a=r_1tXGB3AAAA:8 a=VwQbUJbxAAAA:8
 a=i4s8dUDdjnhDxNR2G6AA:9 a=QEXdDO2ut3YA:10 a=400PYHpdZu8KaQM2OfoA:9
 a=FfaGCDsud1wA:10 a=t8nPyN_e6usw4ciXM-Pk:22
X-Proofpoint-ORIG-GUID: 2j1fn4WW4Naeq6NMNMcKuwrMa6XY-OCf
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

--------------5swW1qIISZurWzrCaei0660s
Content-Type: multipart/mixed; boundary="------------k6JQAX0lwQTsxryGuICCzOOQ";
 protected-headers="v1"
From: Matt Coster <matt.coster@imgtec.com>
To: Brendan King <brendan.king@imgtec.com>
Cc: Frank Binns <frank.binns@imgtec.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
Message-ID: <af290775-f690-475c-8458-5047b9cf59c4@imgtec.com>
Subject: Re: [PATCH] drm/imagination: fix firmware memory leaks
References: <20250318-ddkopsrc-1339-firmware-related-memory-leak-on-module-unload-v1-1-155337c57bb4@imgtec.com>
In-Reply-To: <20250318-ddkopsrc-1339-firmware-related-memory-leak-on-module-unload-v1-1-155337c57bb4@imgtec.com>

--------------k6JQAX0lwQTsxryGuICCzOOQ
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 18/03/2025 14:55, Brendan King via B4 Relay wrote:
> From: Brendan King <Brendan.King@imgtec.com>
>=20
> Free the memory used to hold the results of firmware image processing
> when the module is unloaded.
>=20
> Fix the related issue of the same memory being leaked if processing
> of the firmware image fails during module load.
>=20
> Ensure all firmware GEM objects are destroyed if firmware image
> processing fails.
>=20
> Fixes memory leaks on powervr module unload detected by Kmemleak:
>=20
> unreferenced object 0xffff000042e20000 (size 94208):
>   comm "modprobe", pid 470, jiffies 4295277154
>   hex dump (first 32 bytes):
>     02 ae 7f ed bf 45 84 00 3c 5b 1f ed 9f 45 45 05  .....E..<[...EE.
>     d5 4f 5d 14 6c 00 3d 23 30 d0 3a 4a 66 0e 48 c8  .O].l.=3D#0.:Jf.H.=

>   backtrace (crc dd329dec):
>     kmemleak_alloc+0x30/0x40
>     ___kmalloc_large_node+0x140/0x188
>     __kmalloc_large_node_noprof+0x2c/0x13c
>     __kmalloc_noprof+0x48/0x4c0
>     pvr_fw_init+0xaa4/0x1f50 [powervr]
>=20
> unreferenced object 0xffff000042d20000 (size 20480):
>   comm "modprobe", pid 470, jiffies 4295277154
>   hex dump (first 32 bytes):
>     00 00 00 00 00 00 00 00 09 00 00 00 0b 00 00 00  ................
>     00 00 00 00 00 00 00 00 07 00 00 00 08 00 00 00  ................
>   backtrace (crc 395b02e3):
>     kmemleak_alloc+0x30/0x40
>     ___kmalloc_large_node+0x140/0x188
>     __kmalloc_large_node_noprof+0x2c/0x13c
>     __kmalloc_noprof+0x48/0x4c0
>     pvr_fw_init+0xb0c/0x1f50 [powervr]
>=20
> Cc: stable@vger.kernel.org
> Fixes: cc1aeedb98ad ("drm/imagination: Implement firmware infrastructur=
e and META FW support")
> Signed-off-by: Brendan King <brendan.king@imgtec.com>

Reviewed-by: Matt Coster <matt.coster@imgtec.com>

I'll apply this to drm-misc-fixes tomorrow if there are no objections.

> ---
>  drivers/gpu/drm/imagination/pvr_fw.c | 27 ++++++++++++++++++++-------
>  1 file changed, 20 insertions(+), 7 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/imagination/pvr_fw.c b/drivers/gpu/drm/ima=
gination/pvr_fw.c
> index 3debc9870a82ae7de9b2dc173df84c466c137bb3..d09c4c68411627714c14dee=
5ed4e61b07baca1ba 100644
> --- a/drivers/gpu/drm/imagination/pvr_fw.c
> +++ b/drivers/gpu/drm/imagination/pvr_fw.c
> @@ -732,7 +732,7 @@ pvr_fw_process(struct pvr_device *pvr_dev)
>  					       fw_mem->core_data, fw_mem->core_code_alloc_size);
> =20
>  	if (err)
> -		goto err_free_fw_core_data_obj;
> +		goto err_free_kdata;
> =20
>  	memcpy(fw_code_ptr, fw_mem->code, fw_mem->code_alloc_size);
>  	memcpy(fw_data_ptr, fw_mem->data, fw_mem->data_alloc_size);
> @@ -742,10 +742,14 @@ pvr_fw_process(struct pvr_device *pvr_dev)
>  		memcpy(fw_core_data_ptr, fw_mem->core_data, fw_mem->core_data_alloc_=
size);
> =20
>  	/* We're finished with the firmware section memory on the CPU, unmap.=
 */
> -	if (fw_core_data_ptr)
> +	if (fw_core_data_ptr) {
>  		pvr_fw_object_vunmap(fw_mem->core_data_obj);
> -	if (fw_core_code_ptr)
> +		fw_core_data_ptr =3D NULL;
> +	}
> +	if (fw_core_code_ptr) {
>  		pvr_fw_object_vunmap(fw_mem->core_code_obj);
> +		fw_core_code_ptr =3D NULL;
> +	}
>  	pvr_fw_object_vunmap(fw_mem->data_obj);
>  	fw_data_ptr =3D NULL;
>  	pvr_fw_object_vunmap(fw_mem->code_obj);
> @@ -753,7 +757,7 @@ pvr_fw_process(struct pvr_device *pvr_dev)
> =20
>  	err =3D pvr_fw_create_fwif_connection_ctl(pvr_dev);
>  	if (err)
> -		goto err_free_fw_core_data_obj;
> +		goto err_free_kdata;
> =20
>  	return 0;
> =20
> @@ -763,13 +767,16 @@ pvr_fw_process(struct pvr_device *pvr_dev)
>  	kfree(fw_mem->data);
>  	kfree(fw_mem->code);
> =20
> -err_free_fw_core_data_obj:
>  	if (fw_core_data_ptr)
> -		pvr_fw_object_unmap_and_destroy(fw_mem->core_data_obj);
> +		pvr_fw_object_vunmap(fw_mem->core_data_obj);
> +	if (fw_mem->core_data_obj)
> +		pvr_fw_object_destroy(fw_mem->core_data_obj);
> =20
>  err_free_fw_core_code_obj:
>  	if (fw_core_code_ptr)
> -		pvr_fw_object_unmap_and_destroy(fw_mem->core_code_obj);
> +		pvr_fw_object_vunmap(fw_mem->core_code_obj);
> +	if (fw_mem->core_code_obj)
> +		pvr_fw_object_destroy(fw_mem->core_code_obj);
> =20
>  err_free_fw_data_obj:
>  	if (fw_data_ptr)
> @@ -836,6 +843,12 @@ pvr_fw_cleanup(struct pvr_device *pvr_dev)
>  	struct pvr_fw_mem *fw_mem =3D &pvr_dev->fw_dev.mem;
> =20
>  	pvr_fw_fini_fwif_connection_ctl(pvr_dev);
> +
> +	kfree(fw_mem->core_data);
> +	kfree(fw_mem->core_code);
> +	kfree(fw_mem->data);
> +	kfree(fw_mem->code);
> +
>  	if (fw_mem->core_code_obj)
>  		pvr_fw_object_destroy(fw_mem->core_code_obj);
>  	if (fw_mem->core_data_obj)
>=20
> ---
> base-commit: 96c85e428ebaeacd2c640eba075479ab92072ccd
> change-id: 20250318-ddkopsrc-1339-firmware-related-memory-leak-on-modul=
e-unload-c18a9a4fd0db
>=20
> Best regards,


--=20
Matt Coster
E: matt.coster@imgtec.com

--------------k6JQAX0lwQTsxryGuICCzOOQ--

--------------5swW1qIISZurWzrCaei0660s
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQS4qDmoJvwmKhjY+nN5vBnz2d5qsAUCZ+FxHQUDAAAAAAAKCRB5vBnz2d5qsKL0
AQD5tik2tAEDVCsrHY1yaLSIud95buAF0iObBnjXsccr1QD9HNGxrgXeZVTM7RDoI1gXlZPGINUo
gkHBLnGzGx+RtgU=
=V5zr
-----END PGP SIGNATURE-----

--------------5swW1qIISZurWzrCaei0660s--
