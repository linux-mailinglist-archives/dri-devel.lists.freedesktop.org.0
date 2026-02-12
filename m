Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDVOOlZzjWn42gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:29:42 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C17512AB03
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 07:29:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B6D10E6DC;
	Thu, 12 Feb 2026 06:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mCpNcwLY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010045.outbound.protection.outlook.com [52.101.46.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A82E410E6DC;
 Thu, 12 Feb 2026 06:29:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nko4j6+WwGq9vU+8+oYXRrfjj44qsNxlBXMpeEBW6sh0ImxJiLv+ycJiqE25NMqFEP6/sR1+44P5AcFZ8tDZahdeDIYXAgqQUWNFDj21UTNWX9j+CKPydOmZO/iGP/HeuHMO5desGCfNWjoutOeCCQe93ipi5A78ZQJgIdfmh/yMxV0IVEhc4dMAPmcCe5oP2Jo5A3Z252z+dTr0mp1FepcUuiTx05yO6A7CNlzeVTapElQMOB4oPdBZ/eRuBerCiswsyWqI1kNirjwW8zyjdyHMSdpQs5W1f7mhnha/PBCzXBaBnyRJ2Iq8gaxopuo5t54alJvNqgQ0Tu5UsAWhzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OVf+tyk6VlnV2FIhqZxUkEe+zaaWjygblrlfb4CstkE=;
 b=l/cHJykHKkhAOqufJMUeZpbMUCaCISQWnky7fDjcaZ6eTwLOePXfnzGdCml/R1xv5p2KvmKY/wPgYr6bp/6XlHlclZCNjIt+GbYfN41jgNZqXFbxSDecpy7WcB/o2EWVrwdn3HJXJ9UMOWGqk+pCS0R5jxoCK4SX8WKvlkpZqlL0xcHfaEJ9m/det+euuhG+EC+7aW3C1gksraAJnzwYrHwabcc37L37J6tHP4W/Jx28ML+JDeSVrftvNbFo1fkduNHjCD4sYK1UW2SIah1gu8QfNlYNUqawSoal+Mg8U2pmTC1OSKoVWFylyS4yv0RtD9RF97Ih0qseF5YnKQsokA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OVf+tyk6VlnV2FIhqZxUkEe+zaaWjygblrlfb4CstkE=;
 b=mCpNcwLY+zP/v9MocAX2dfyV0n/bKV1ssZdSFPuPXuipIdLUjMakuV5Ad62/zE8EluC9SpoaLV8FhUyrjtCTuKKIC8619CI0prSmR15eFA1eucQnXUcY4saa5pp3smmoiI83McNSYD/1TGpE0GzZC8LJfEpND9GjhIeQcINvqL+va/+Y9K0mMy+eQnx8re7G7UIc3hAwlQ+k/2hLnc1w4Dfw5W5r3gXi6oOgqGEKjOpTZ3uEsyDGvjXq55ANuNEDaUEk4BjosBhVp9kB1x/SUxKQoHwsPrO0zAN3v0HZ5eLwPHdUiPe2sqwFX3x1x0lAIOUeAsyLkWRkNSBPLsE41A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by DS7PR12MB5862.namprd12.prod.outlook.com (2603:10b6:8:79::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Thu, 12 Feb 2026 06:29:33 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9587.016; Thu, 12 Feb 2026
 06:29:33 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Subject: [PATCH 0/7] gpu: nova-core: gsp: add continuation record support
Date: Thu, 12 Feb 2026 15:28:02 +0900
Message-Id: <20260212-cmdq-continuation-v1-0-73079ded55e6@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrDIBBFryKz7oBVKpirlCwSnbSz0DSjlkDI3
 SvN8n3+ewcUEqYCgzpA6MuF19zhflMQ3lN+EXLsDEYbp422GFLcMKy5cm5T7W+cvV9sfHjngoX
 ufYQW3v/N53ix0NZ6ul4jzFOh3kiJ66CiJJRWKmbaK4zn+QPZkdb2lAAAAA==
X-Change-ID: 20260203-cmdq-continuation-b99f3d5966c3
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0262.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::9) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|DS7PR12MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: fc30e974-5819-41fb-afd3-08de6a0015d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|10070799003|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eGtqLzVPSmhobUdtYzc3TFVER3lBc29VSnp5azNHOG1xTDgvZnJjK3VyV0pl?=
 =?utf-8?B?S3hxTUxxNHpzdzJFc1M5V1VHcFljMXFZOVN0V29ZOUdnaU03SkhsS09QV0E2?=
 =?utf-8?B?YVVKUWVra1lPcmZYTG1pcWpIbUIxS2loWFdGSkVsNjkwSHAxZGVKcVUyU29i?=
 =?utf-8?B?dTFud3JHVXlhS3AvVVZWeW9ndTg2cnduRmpwU3dhaVRUR1dFK1ZwdkwyRktr?=
 =?utf-8?B?d0hWcTNQeFhTTFh2b1VGelB1clNncXEvUnZHVURqZENKNDNveGloMUdZeUo0?=
 =?utf-8?B?KzBwSlJSM21FVmplQ1hBRjhKb0s0WnJIUkJGakxlblVSRjFselRINmhaTEFI?=
 =?utf-8?B?aTRhTC9VOGdQbGl6ZXRhTTJWRkJhTVRXRjNlYTAvaTlIK09oQjhjRDg2cTIr?=
 =?utf-8?B?ZUVpc2lEUUV5OFdkTGducFpDNEpLLzIvWVowQ0lRSjNtZUp5eW9iaCtzUHRW?=
 =?utf-8?B?UXFPbmE2SXJYV2tCeWVrRmtwNit0TC9XcGVlN0l2bkZwd2x0aDNsR3RLOWwy?=
 =?utf-8?B?Tkg2WVV0TktFUFZiQy83bkF6NHd1WHZwM2luelFtQjU4V2xxUXdmcnpVZkVM?=
 =?utf-8?B?ZlBqaiswQUtMamlPd0Q5VmsxU0JIeTRYdDRSVWNKY3F1ZUFtL0toWVM1d0VG?=
 =?utf-8?B?NjBJQ081am95dGlrYVZGU2Jpc21UcElJZktWUStGSjNVM205V2RzT014aWx0?=
 =?utf-8?B?MEJXM3hrWnptanhVWkc5VkE4VDlqMzZGOUo5ZW1BOWpDWVdvMlBTZmc4b2tn?=
 =?utf-8?B?Q0huS0d4SHk3Q2UzMUdpWWxQV0xEYUp4OGlnMWpEV0J0NW5ZaFlZK3FjdW5i?=
 =?utf-8?B?clFGcXoyV1VBR2hWRmlKam1Lby9mL29vemFVbkVvb3lFeGFaTDluR0M2c0s2?=
 =?utf-8?B?WmhudHZWMmpzMGF1dlNJc1U0RlI1RHF2bGF3UllaNXVZZ053eFNMYXNsUThQ?=
 =?utf-8?B?MmFLNyt0b3lIaHY2UFlkYXNhYWExQ3pDZ2oyNW05V3FLRTVhZWR0R0wwY0dW?=
 =?utf-8?B?TFp3Z214S09tWDQ2V2ljSm1sZkRQTHRndkJuTy9XaFV2Nk1TTmJpbXQ1VXor?=
 =?utf-8?B?OXVVZ3grY1M3MUJhYXgwd1lyRTR4Q01QRy9mVFFiRDAvZkFMalNzNTIxWk5G?=
 =?utf-8?B?U0lRVnArc1pTeWlxbUtLbTk1bXNqQmQ4b3Z2Nm1HOXNDWFdDUnBiOXFmTmlx?=
 =?utf-8?B?RFRXNm1ubDcrS3hwT2ZlMmdEdEgxUkZBbTNzUzByUGNOWWdpdkhPRGFTZzRX?=
 =?utf-8?B?TVBBaWNsVGVpMGt1b1o0eHhMcm5aeDJqanlYY1ZyekZhR0RsMnZXTG1jdUho?=
 =?utf-8?B?S2dZMyszREtFUERqNS9OemRmZEZ6dXhRK1lsUi94Y2VMZzVwaXUvQzZ5aXdQ?=
 =?utf-8?B?RmRKYmxiOVgrK2crcm95ZHBDUVp1eldLZm0zS3lHV0hOT1Y0ZnFuRXVtWkYz?=
 =?utf-8?B?R1lvTXkrOXdiYU4xRlJpNmxqYjJtL3RpTWJRRGxuL1Y5WDRnVFcyR1QzZ2Zx?=
 =?utf-8?B?VW5JRllyNlU2b2VnT2RPcU80eEdhTjllTEt0b3ZvQjNwaWNOMzBPbEZicER2?=
 =?utf-8?B?V0RhQ3RNL24wMDg0T3NWWGJXSnByN29uV0NiUENGNEQ1UERzTkQrTHhXYndV?=
 =?utf-8?B?RlV6VEdNRHArTXZxTmJISlNVeU9aem9BTDRpeWlPN1JNME9ORFdjb1o0L01h?=
 =?utf-8?B?ZEY2M1B6azBwSnVwaytUc2JhbDdzckRxNkpaSUJNN242RjVsRGZoL2hTRXZD?=
 =?utf-8?B?azRtWEtYYmVYV1hYaGdLOTlKUENwSy8yQ2ZTV25KZlZaSGd4ZDM0S0dVUFlX?=
 =?utf-8?B?Y3J5cEU2U1k1Ykx3RkxiMjBBQXJPMmFSZWNZaUtmMW4xdkFzWEU0YytwbCtH?=
 =?utf-8?B?YXJ3cEkrNk5ldXoxTVJDdkQrZGI3LzliWk5yL2VnWkI5cmxOZmxCRy81YkVI?=
 =?utf-8?B?Y2VQQ3pEUDRNRTEyeWpQNi9kUGh3emcrT2l3U1QwdkFhNjkvdlpGMHhDd1VU?=
 =?utf-8?B?M3c2bzlFSmVTNXF3Ukhxb2Y2eEZXbnNKN2EzSFlOT0tRazZ2d1lPMVZLVmJr?=
 =?utf-8?B?WDRaZzBYS0F0M2pOTUJDTVlBU2ZnL1RYWDFabkwrNS9GSVN2eUZKNjR4Q2Nt?=
 =?utf-8?Q?bp4g=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QU4yaVhyK1B3cURqZkYwM3VXT2xDUTN1RGtwZEh4SFZQYUxOcytablVMRmJU?=
 =?utf-8?B?U3NZUzE4TXBweXhaYno3NktUU1lUTitwdzFmOEVQTzBZRUdUMjBpRTN6ZzB4?=
 =?utf-8?B?NFBuMGdqV0pDVWQvVkhOcUREVlFWQ2F4elJDUm5rZnJISGxtdTNJTmlzbkVO?=
 =?utf-8?B?ZEtlL2Jhdm9TVDIvS0RsNThNQlNQRTJWdlFWUXFtcHQrbDhqNi9UbkdsZlN2?=
 =?utf-8?B?a0wxKzF1VjYrOURVQzBZVFZ1b0pob2Y0VlhSbDlRNjNEZ04rUkRFQVFLejZ3?=
 =?utf-8?B?TWxQZTRZTStCaEJHbEEzSDE2Q2NscjRreUdFalhvbDcraTUremVYYzcvQzY0?=
 =?utf-8?B?a1JMdENGYVJjdklpeXM0VG1nQ294aGEzSjh0MlZCeW94QzRISVhkUUV1T0dj?=
 =?utf-8?B?Q2pKMUwxZ1NWajFVdVdnV2E3RTRwazVQSStkOXU4M3U2WEFTbXNTUHBTSEMr?=
 =?utf-8?B?cThodUJJQjA0KzAya3grMkh2VUsrSEFzQnY5aHloWkZ4U2VuWnN4OWhCQlFs?=
 =?utf-8?B?MVpnOEpYbVBXUDdOQXN5M0hyL1o5c2R0Snc1dDBEZmdXZW9kdXk4VGlwRUtG?=
 =?utf-8?B?Wmp3MEczMm4wUDJkWUd4VDUwVU5PMGZJS1NsOXFwNGd6OWJLQXRUcEpubjNP?=
 =?utf-8?B?VlFkank2dDcrTTZrQkJGcjJ0eU1UcGhheHNhazYxR2xaRGcrSXQ3Q0ZTUEhL?=
 =?utf-8?B?cTBJV2ZJNENCWVd6a0VUaVVYWmI4TWppTE53N2FYOUlJc1EybkNKMHcwODFh?=
 =?utf-8?B?bjBPRG9VQ0J0ZXBvcTY1SWtXT3ovR3pTZWNwQmdQV2N0elRkZnNEbXZaZVJ3?=
 =?utf-8?B?UUdNOHJzazlESVN3Y0U2c0x6cnNxZmtUNDBYVzc5VHlPTkxuTEsyQytoM016?=
 =?utf-8?B?U0hIQXFoOE0xZ3pKRGJLS3p6SFJiYTMxdFp3ODlYRjBXRk1ZR29KWXYzSXlh?=
 =?utf-8?B?d1ovQ3MrblRIdXplZldXajVoVDdrVTZIUjZaZFJwZlJuQWl2QmRndWpnNXln?=
 =?utf-8?B?NTFZWk9QaWYrdXp3Zjd4RnEzTTArSzgwUEt0bmwxUVpXdjBmSkRUdTdLYkRo?=
 =?utf-8?B?ZnN6a3NLZXFoTi94UjJRWVBKdU5iMFI3aXFjY1A1bFZQSmwwVVI0RG5uc3hX?=
 =?utf-8?B?OWJxWmduNzhUNzdkbTgyMTljaWIwVmdudzdhU1ZYUE91TlhuVitLVllMQ1Bj?=
 =?utf-8?B?cGwvWGZpUzNGU1VKRmhVODFWZWQ1UTV3ZWptLzZXTnJhSVRPb1hVUzU0Y2ls?=
 =?utf-8?B?bzF6MSsrdzFKSTNpRVJ6V01pUVRwM0lqUTFoaStaUW5lL212YXRnVVJDeURj?=
 =?utf-8?B?dllUTDdHNnpxNzgyb3UyNllHUy9wemVaeTNORXlOeG4yQjFCL2kxY3Bxd1Rv?=
 =?utf-8?B?aGsxcFVIZzJEOEN0Z3dRUEs1MzduM09HU2dGR2NzRk1Ub2s2REsxbU5ra1M2?=
 =?utf-8?B?eHpqOHZ4QjlBaDNPM05MR0ZhSDZkbHlmT2xrWGF0ZzJxb3liSnpObzFZVGY1?=
 =?utf-8?B?eEZBbVVUbWFjQW95bjNLMGFZSUVGSEFwT2pvRjlyVkZqdFV1Q2NqZUZla1FT?=
 =?utf-8?B?L1RWZTlPNDBKOUhneFdCRWxpaGI5QW5YdHQ1bSs0a0QxNzRTOEhaYjVOOENO?=
 =?utf-8?B?MGM1NDJFeEoxUndtT3dReDlXK0VXRGpwVyt0UUplNVBzYi96ZElyazJmVkVv?=
 =?utf-8?B?bVcrWXJ5dCtYckRCTHNSQ1pxOFk4NTIvQTVnRUh4REt4Z3UyQUkrTWxpa1NV?=
 =?utf-8?B?SndUN2VYQ29mdmszMEJTdjZvTDJsd2RROE1talgxUTZQOFp3T21QWHQwZ1F1?=
 =?utf-8?B?Rm45NkUvNjY5LzFwWXYyeW1tZFozOHlqR1c3N1llNkZaMGJtcVZiY1AxT3BS?=
 =?utf-8?B?aFNRWDU4ZENLRnowZFlyUllWVkI5enBUZ0VURG9yMUNBeHBxVXpCNkJ0eVNu?=
 =?utf-8?B?ZWNCOWRFWFp0ZUNtSDZmNTkvbGsrd29GNitlWFBxTHdYQnJ4c09DZ0w2Um5u?=
 =?utf-8?B?R25ERGhVVHcyWFNDaHIwNUpTR3llSjFPOGpaVnZRaWpzU3d0eDlLRlppRVg2?=
 =?utf-8?B?QlkxQUNZMDE2MTVDN25hV05zcEZyNU92QWhWL004ZGJyY3JlbWpLYXU2eCti?=
 =?utf-8?B?VzAwSkFFc1pweVNBU3N3OHVuaEluMWM3MEdGQlBkWjZSK3dIWDd1MVBKaFF1?=
 =?utf-8?B?a3BrSHhVck95MW5FTWVjakFwN2lHdkZlczJoOEprZERZOTR4bllJRGJYWmgx?=
 =?utf-8?B?Y2dBK1NlNHRjRElQc0JQbFpPbjVwSUEwZkk2UGVXMjJrcVFNNHViKy9ZaFNM?=
 =?utf-8?B?TFpRRUpHSmZ6U2hxeHZFam1nZVh6cmdtMGhXSFplUEdxV2JITUdNTGE0SEpF?=
 =?utf-8?Q?TEAGYKmDeNz3JLvRtUA/WPVDQX94aVasWVMoqTTZia/tz?=
X-MS-Exchange-AntiSpam-MessageData-1: WcCd96371m1dpg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fc30e974-5819-41fb-afd3-08de6a0015d7
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Feb 2026 06:29:33.3456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dH1ebIw83WCxM/evQS5Nk0npmSlrNN3f3M8S1FjzxnnqQ2YUfguGhwvGnIb929ro9d6g+eHxRVBuNS5gTLuwrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5862
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TAGGED_RCPT(0.00)[dri-devel];
	RCPT_COUNT_SEVEN(0.00)[9];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 5C17512AB03
X-Rspamd-Action: no action

GSP commands over 16 pages need to be sent using "continuation records"
which essentially means splitting the payload over multiple commands.

This series adds a command type `ContinuationRecord` which just writes
its header and whatever payload it is given. It also adds a type
`WrappingCommand` which supports splitting a large RPC into smaller
ones.

The send pathway uses `WrappingCommand` to send all commands, but if
the command fits into 16 pages, it still writes directly into the
command queue. If it is larger than 16 pages and needs continuation
records, it writes into a staging buffer, so there is one copy.

This patch series uses EIO for mis-sized commands to be consistent with
the rest of the code.

Patch 6 introduces a single helper send_continuation_record. This is
because the compiler can't properly infer the types without this.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
Eliot Courtney (7):
      gpu: nova-core: gsp: sort MsgFunction variants alphabetically
      gpu: nova-core: gsp: add mechanism to wait for space on command queue
      gpu: nova-core: gsp: add checking oversized commands
      gpu: nova-core: gsp: clarify invariant on command queue
      gpu: nova-core: gsp: unconditionally call variable payload handling
      gpu: nova-core: gsp: support large RPCs via continuation record
      gpu: nova-core: gsp: add tests for WrappingCommand

 drivers/gpu/nova-core/gsp/cmdq.rs     | 113 ++++++++++++++--
 drivers/gpu/nova-core/gsp/commands.rs | 247 ++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs       | 102 +++++++-------
 3 files changed, 401 insertions(+), 61 deletions(-)
---
base-commit: cea7b66a80412e2a5b74627b89ae25f1d0110a4b
change-id: 20260203-cmdq-continuation-b99f3d5966c3

Best regards,
-- 
Eliot Courtney <ecourtney@nvidia.com>

