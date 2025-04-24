Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51B51A9B80E
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 21:11:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD21D10E469;
	Thu, 24 Apr 2025 19:11:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="E4q4vSS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2072.outbound.protection.outlook.com [40.107.236.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75A4210E464;
 Thu, 24 Apr 2025 19:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a8t4aH0eda7/JDOItBsidwzI4nfAV0zG3RDdajOyFAdBVgJYknIQb381zKUj07KvB392Ht2BjchhfYAPHgMPxMkXNBHKxqT2qBM5kt4SDa/glMjXuKfLCzb0BfBPQjLr/AZRyHbXRCuJZeIfuCr7C7MX4zsQFfXukdIiXwlbPHdZHF+oR9IgrJg2VPxN3g9jLk9Lrz/0L0LnBnEBsBjNd69pLq7w2bhv40V8iRdZKQPcUVZGNPWcdGne/B1f0wSRyxeDKmQnwXfH6imfFSRcMfGGxDJKc/qpFg9oZppRto1fafb7S2ecrjSIG9Pzrb4wGWHlX7ygBYdZo1kUOsDJ2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+gkK1DqKhsVSzpioKT3IGn2oWyXZWyaqJ5BMAEpoYWk=;
 b=uvSFNkgXgJabs16NXcV0Ir82VBhIxPnsLnynT3OGtYV1Z0Ivd9JZhg/U8W2oDjZXtrzN7wokKK74sDPJuZrtcyTkG5c7HyfUcIrumaoTyn/d6w++Qdq0BD06D8+FEXoWqqbi4LVLUscrDXn8yJF77q86wS564GfCy25zsXQgnP6SQjVjIWJ7rlZkKYVuoXUdZmWS2SH9xbhaBeDXwlBbb3Cxicmp7jRL7cP2gAD4VOlFZDa1D7WjDcs5ejc/YX11SpEFm3xLDU/i7h9h6STXDBuO2y/RMAwqhfcnYH8ub9D5Q+Ux3D5p7/aAKZZ3ynRIGSL1f7G2HzYTv127AqLV3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+gkK1DqKhsVSzpioKT3IGn2oWyXZWyaqJ5BMAEpoYWk=;
 b=E4q4vSS3AiMDT2vmBnEv783OCONkpLNxcygmiIeTVYzeUX6D+EBynNg3NI3b5r5z2txYK3GpQQtv51QtqCviE5cAhU0gHm03FkDNorwPfRR6T4MRynrmZ0eu6xhrBr8p388z7dMSJaBNTPu2hVTJ9JA8S2o6qgTPgt+4I9wvxAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by CY1PR12MB9581.namprd12.prod.outlook.com (2603:10b6:930:fe::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.23; Thu, 24 Apr
 2025 19:10:51 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%7]) with mapi id 15.20.8678.024; Thu, 24 Apr 2025
 19:10:51 +0000
Message-ID: <060be9f5-e5bd-421f-9168-5a7e709959f7@amd.com>
Date: Thu, 24 Apr 2025 15:10:46 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/amd/display: Hardware cursor changes color
 when switched to software cursor"
To: Melissa Wen <mwen@igalia.com>, sunpeng.li@amd.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, airlied@gmail.com,
 simona@ffwll.ch
Cc: Michel Daenzer <michel.daenzer@mailbox.org>, Alex Hung
 <alex.hung@amd.com>, Aurabindo Pillai <Aurabindo.Pillai@amd.com>,
 Nevenko Stupar <Nevenko.Stupar@amd.com>, Roman Li <roman.li@amd.com>,
 Xaver Hugl <xaver.hugl@gmail.com>, Rodrigo Siqueira <siqueira@igalia.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20250422150427.59679-1-mwen@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20250422150427.59679-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0251.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:66::15) To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|CY1PR12MB9581:EE_
X-MS-Office365-Filtering-Correlation-Id: 27aaa2dc-ce86-413e-77bf-08dd8363ba4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VWpnQnVjeFNUZjRZZHVjdUV6N0txQUJwZmJER3c0dzVKcGtXam9lQWpFVFVS?=
 =?utf-8?B?US9HU1hYVFJnY0VZV2MyS21vQThidUVRR3dtLzVOekw2V2xhZ3U2SmNCVWc4?=
 =?utf-8?B?NG0yYitaZEVTQThZbk1Ya1RWcVJQaWRQREEzTDhiVHVieVpXcjcwZWVVOHNm?=
 =?utf-8?B?dHZEZDhaTjBQMVZ2M3owVFVOL1ExSjk2bkZOVTN4ZDhIajlIQXZKVkRGR2FY?=
 =?utf-8?B?dVJXSTJFNWdoMVVzaDFiWUVlMUZ0OVpDU0p1K3NES3BaR2ZtdVc4V2E3K1VZ?=
 =?utf-8?B?UnRZOGROWDNvTXhhUTRwS1dBUDRYUzB2TjZ3eTVKK0N4TTM1V3cvQUdDNHlk?=
 =?utf-8?B?OHBYUGhWVTlLTUVTQllSSXlBM2VCQUFHT1dEdHJWMndTT0t1OE41eVNoOG1w?=
 =?utf-8?B?QTh0dGpNL3E2bU5BUU9sZUJXY3hDLzdUQzArVUZxMWh6dFY3MzVHL3h4Zms3?=
 =?utf-8?B?dWtSdkY0M2xCODkvTGFidUhhVk94a2FCS2dyVTlrWmc4ZlRpenE5YW1DUlRv?=
 =?utf-8?B?Y3M4V2VLVitjNVFOM1ByM0FxVTB2cHlvZzdkZmNLUERVNTBNRUQwSWQyRkRS?=
 =?utf-8?B?YmkyTGdhT0NHTHNzSlQ0TVk1R1hmZndiTGJqcHloaGRqNi9GUit6V2p6SlpE?=
 =?utf-8?B?VkFqRGI1bzUxSmpkMnN2WGVEalBLYjhoZFZwVmh5YVlmNzNubFlWK0QrM0E0?=
 =?utf-8?B?WnN3cGM1Vi9XY1NzTXlWbEZETm1XN2l2WGhTYS9PT1pJS2pVWUxPL2kvL202?=
 =?utf-8?B?RVVjWENsVUJhTXhubXVzZVFTdjRIaWpyWng5VSsrU1FMckVHOS9vTXBDTVFX?=
 =?utf-8?B?TWo4L21ydzVZRmpTdWFvZHN4MW95RExMMlpiTndFVGc5Y2FXL29yekZoUUJC?=
 =?utf-8?B?SHJ3MVZoVXZ1OThGWUZETjBZY3F4bElJYW0zYzJYV2YxWS9yUUE2VzQyeWZE?=
 =?utf-8?B?bEZoeXo0Z055ZWQ3azhyNHJzcG9EaHlFT2JGaVUrQTRNa2V6azlpMnhhbDhj?=
 =?utf-8?B?L3k4alpiKzdsRlFqdFhoUjRpdUlwWWdJL1NDUHZ4QnUxTWhuUFN1OGs3TDZ1?=
 =?utf-8?B?b3A5cGxTVUxnTFdyYUxtQUMyMlNnQlcxUXV0WkJJV2NPTXBhTVF0U1hJL3ZU?=
 =?utf-8?B?cStCbFFYNnROZEFvRWpPSGZ6b0NDODRNVEx2OFowck5HR1ZEbXcvYVlTSXpz?=
 =?utf-8?B?eFpXamdEV2Z0akxtMzdTblpqZmU0aTZVWlhBOGpubzBZTG1UTW5DM3JRV0Q3?=
 =?utf-8?B?VnRvL0NxOE1oOUJBM2tvZityREdpcHdKaDVBYWFESnlaZXZmOTRqQWlFZ2o2?=
 =?utf-8?B?YWovdWV3ZkYwNDg5S2NCSitVVk42WU5YdnFuZjZBbURRdFN2NmtIaFdsUThk?=
 =?utf-8?B?SmhYbXY0bGh6czVZVjVIS0d6N3U5ZGxnOStyZFBUMWNVOXNLR0owdHl0ajkz?=
 =?utf-8?B?NEwwNkJ6L092YXVkbXg2Nm1PZDRtZVJ1dyttTXpDQmxjeWRyK0E3UmpFNE9N?=
 =?utf-8?B?Z0czNjBacmh5WEczTzhucmh5Q0M0ZnpVL0dQTkcyOStqclNNdThEZkJQcXZS?=
 =?utf-8?B?aGVzZklhb1I4RnJpRElmUHBaWjlTVUpXYlhzbm9laHg4dm9ZWmJudGNsRmVx?=
 =?utf-8?B?U0RiVmY4eGRrUkFCeHRoMVdOYUpUbFNsZmRsL3pFMityN2dQdVh6anIrU21H?=
 =?utf-8?B?VDNMaE1uTFp3SEc5NzgzdDNkMXBBSS8zdm1wL1lZYTFBdSttb2JIckNuSlpu?=
 =?utf-8?B?aCsrWE51N2pxa1RlbWlnMnNkdUprL1crRHpZNWFac1hEZFZEWmtVR0Y5ZGh3?=
 =?utf-8?Q?KvVX1111e4Iq9psAM8LjYBu2Mwbtn8gdQzqsY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MGtRK3JWa2hnSEMxRkh4K2JaWTR4RCt0WTkxSjBOb1pXOWRqZEZsVWl4UVlQ?=
 =?utf-8?B?NHhER1hpa3h2RGJxUlRYbWZMeHc2RE5XcFB6S1k1aE4xQjhKRmlZcllkMFZW?=
 =?utf-8?B?U3E0R1RFN1IyQjNUaEZnRld0bXZpV05YaHVXQzh2eW40eWl1NmFibVFYYklx?=
 =?utf-8?B?NFdmNTdoZ2tONnRsRlNHM3hSd2UrZllDcXVucXhhM1Z5RGN6c2ZVWm53YSt2?=
 =?utf-8?B?MHpNcWt1ajJvdUtEbW1DZU5pcUJrNVpLamZMbnVkWitVYmNFQ1NiM3prenNF?=
 =?utf-8?B?SWhxRzhmcUI2WUs0VGN0cUk3ZTVBbXVCYWhQRTdQbU1pRWN5OVhwS2o2aGFH?=
 =?utf-8?B?ZnNuTG56eWtnSUY3V05tUnFDNzMyWVdaTmNTK1E0d0hVd3J0NnFiQ2NHbndM?=
 =?utf-8?B?SUxMK1lvTjlzNmdVMG5zVWc1Q1czRkp5ME93SktPNWxJeGh0UjBIVWg2UHRJ?=
 =?utf-8?B?VVhRaEt6QlpUWDRzUlpEekRCTy9nMHZ3OTlJcGpFWFJWMG91RTRoRW1kRllQ?=
 =?utf-8?B?M2JId2h4V0kwUkUyVTNjQ001UDhkQ3ZMU1pocmpzbjZhOGJ2eUloZ2Yyalp5?=
 =?utf-8?B?RjR2S1dtdlRGSzlTeWdtaE04aVVpbU9CeG5tM3Q5NkNKUkxuZ2xoTm15b0pH?=
 =?utf-8?B?VFR5WWoxbnFxVjZOQlEyNVN5bDBTN0lRaDA4ZjlMSTZzWUZqbVEwNU9Cakkx?=
 =?utf-8?B?WUh6OWJrcndsamZJVEdoeGNuNkJ3c1krVFNycVdaY2NPOHp2c1M0aUdabEZS?=
 =?utf-8?B?VW56L2RCV3d4SFpyNjluUURTOVhHRGJ1aU5sYU9yUU9SMVpWd014N3kwN2Q4?=
 =?utf-8?B?TU1pZXU5Sm9RSUloMkNGUVVURUpzNWt0Z0RsaGVDQ0lUNzV2MW1Ib0RBZFpl?=
 =?utf-8?B?SXBUUkJha2Nna3AxRjBUNjNzaUgxeHlQdGxZWklranRqSGxWS3FSZVVJYzll?=
 =?utf-8?B?QUpHTnZVVmJoZjZodEtJS1NqUVZnbldWUG9ic0w2L1VsWnR6Z3lUS3Y2N3Vt?=
 =?utf-8?B?WmFoZTY4ZVJhWmUyQWRhN0hySDVhdlEwOFEwZUQ2eUsyRzVueHh1T29KZ0tS?=
 =?utf-8?B?WmRsWWhJOGNTaXI4RC9qcEdLZmNPZ3l3dDlVLzhoN0N3QWdaMTZNL1YwRkdo?=
 =?utf-8?B?d0FGeXhFbk1ySFR2RWhWbmFXR0FtelJrdm5SQk5wM0h2Z0hUbUpoalpLTmVw?=
 =?utf-8?B?Z2w2UkpWUm91UjRTSkxqS3VZdXhvUytKK2ltRnlxQ3ZPODVhcmRUNlZTV3lK?=
 =?utf-8?B?UkJ6VG9WWkd3THRwK00raThrUlhad3dmM1d4TjdhWStmbDVFVU5OdXlNWXNL?=
 =?utf-8?B?SGRWSTVsTkFSUGVBQ3RLRURFQ3pxZzA2MVdaZjB6WG03R3E1R2g0dVVVRWw1?=
 =?utf-8?B?RlVjK09qMjF2aFdHL2lWOGNBbVp3UitycGIyeUt4VWx4bk0zS2dCVlgyS29W?=
 =?utf-8?B?bUw2VFdYY3kzajFNMWp6d1VTT3ZWanZKNk1ZU082NEpLMWtiMkhqS3dPOWp5?=
 =?utf-8?B?UkRBM0VkeDJvVU5LaUFWektabGhLQWR3VzdhUHJTOGtvSjdSUGpWd0Q2czly?=
 =?utf-8?B?Q1NiWG13UmIzT1h6c3lXbDRIL1JZVmMyTUU1aXl4ZTFxQThGSDRXNUFvUXlh?=
 =?utf-8?B?Z1lyUlFWM2JjSnUxNzlreGZ0UzlpTHRYeXl2RmJQU2FIVEFIYUdYWEQrRGV6?=
 =?utf-8?B?RXliMXpESElLRG9rZWRMNExnOEM0ZGJPOTZvYU5teWQxUXdZSGxweUNpSDJJ?=
 =?utf-8?B?RmViV1A4cUlMMmN1djRNSW1ySVFPUkZ3N1B4UDJqNGk0cWhNMHVjQi9TOWor?=
 =?utf-8?B?Rk1tTHdjcDFuODRndEl0K2NNbDZGODBFTWtKd0plK3hMbm0zczU5ZkZ3Wllp?=
 =?utf-8?B?UTd5ZU82ZE0reVp0U0k4dXhBNkY5MS9qaXdTaENDNHcvUWFJYTVCQTJhYnNn?=
 =?utf-8?B?dDNQYmdrcFhPRlAzdjFGd2pyaXo1Z2xlMitCbU9oOVZMRG9aUHN4cENpTHJm?=
 =?utf-8?B?emV1QktKZVdia2xObU9MRWRudDFVNDdmUHoxV0VJQlhnUm5aek52WlljZ0I2?=
 =?utf-8?B?Rm02M29EVDd4cERNdmxmcFMwRWdWWnlPelU3bWhXTUlhRFZ2b3NlNFNBUTZX?=
 =?utf-8?Q?6r8/Vsk6weNKABF/+B97RU01T?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27aaa2dc-ce86-413e-77bf-08dd8363ba4c
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2025 19:10:50.9212 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SctSfxpHj1MOrNbA2fqt51CALwgzIcdMEBhzvoY38L2bguYhMf5/iJ0AkWfNoquCovRTIjH7Jdysrh7ghy4SOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9581
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



On 2025-04-22 10:58, Melissa Wen wrote:
> This reverts commit 272e6aab14bbf98d7a06b2b1cd6308a02d4a10a1.
> 
> Applying degamma curve to the cursor by default breaks Linux userspace
> expectation.
> 
> On Linux, AMD display manager enables cursor degamma ROM just for
> implict sRGB on HW versions where degamma is split into two blocks:
> degamma ROM for pre-defined TFs and `gamma correction` for user/custom
> curves, and degamma ROM settings doesn't apply to cursor plane.
> 
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/1513
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2803
> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4144
> Reported-by: Michel Dänzer <michel.daenzer@mailbox.org>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
> 
> Hi,
> 
> I suspect there is a conflict of interest between OSes here, because
> this is not the first time this mechanism has been removed from the
> DC shared-code and after reintroduced [1].
> 
> I'd suggest that other OSes set the `dc_cursor_attributes
> attribute_flags.bits.ENABLE_CURSOR_DEGAMMA` to true by default, rather
> than removing the mechanism that is valid for the Linux driver. Similar
> to what the Linux AMD DM does for the implicit sRGB [2][3], but in their
> case, they just need to initialize with 1.
> 

That's a good suggestion and I started that conversation with
Windows devs.

Is there an IGT test that would test for this behavior? Without
an IGT test I think we're apt to end back here again at some
point.

Harry

> Finally, thanks Michel for pointing this issue out to me and noticing
> the similarity to previous solution.
> 
> [1] https://gitlab.freedesktop.org/agd5f/linux/-/commit/d9fbd64e8e317
> [2] https://gitlab.freedesktop.org/agd5f/linux/-/commit/857b835f
> [3] https://gitlab.freedesktop.org/agd5f/linux/-/commit/66eba12a
> 
> Best Regards,
> 
> Melissa
> 
>  drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
> index 1236e0f9a256..712aff7e17f7 100644
> --- a/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dpp/dcn401/dcn401_dpp_cm.c
> @@ -120,10 +120,11 @@ void dpp401_set_cursor_attributes(
>  	enum dc_cursor_color_format color_format = cursor_attributes->color_format;
>  	int cur_rom_en = 0;
>  
> -	// DCN4 should always do Cursor degamma for Cursor Color modes
>  	if (color_format == CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA ||
>  		color_format == CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA) {
> -		cur_rom_en = 1;
> +		if (cursor_attributes->attribute_flags.bits.ENABLE_CURSOR_DEGAMMA) {
> +			cur_rom_en = 1;
> +		}
>  	}
>  
>  	REG_UPDATE_3(CURSOR0_CONTROL,

