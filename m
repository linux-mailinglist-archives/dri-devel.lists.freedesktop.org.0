Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 029DA9F86D9
	for <lists+dri-devel@lfdr.de>; Thu, 19 Dec 2024 22:23:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16F3C10EDC8;
	Thu, 19 Dec 2024 21:23:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="OXiBs+4J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2061e.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2009::61e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D4610EDC8;
 Thu, 19 Dec 2024 21:23:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UFbByOzHDY4ygdUpvatNdsX6bRJi3sko7D1asuXl/3OMo5cZCaYoiE5bIkkfop11MIuefLH7ZUbi9+AvBQMGB2AqlIING2hrVFu+KXFPYmwqUsILldchxV1uh4CyTwhJuSsysDnQ82VrvBED9Q8tdYQWbpSVB4ltbM3z7NljGjn8OESxWkaBy8fArEgTUzRDtMNDOcPImJAbGziYJREvCeGYrGXydxUZgYhIQ8vbgIM3dAfQ7JNR0zc6fhKqQnFnfmnsXDqmv73Msyh7FkccPCBnzepS9drHJZBVwFoT52U30pYe/yFCRJX+VmE6+EKRfgw81wcH2ORgs/xt8ZWrZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I1cWOq8+TbD7oTfTyVnOcH7ydZD2I5MXDbT4yxl37YQ=;
 b=I5TTCZoWV4IOaUvOYnAOIFjcnoF9NuFGBwPkfMdPrE40/Mo6EB+7R29xAwpiYyRwLbwO+fu6of4Ogyb4P6v7q8vLs6qDQYGcZr+qbGNMAqL5tryIBCgzv69l+1DISLwKqkdWFTh6l/rSxC7/ybhBZeQcJIcMyepVqm3ybFYQ4Kzt8nPLXl/WfyQwplGYyOws8rkpaCj+265zG8H0CC/OxbPO+Vxew/jHEfZesVEUfIubwnPD76jeDXBO3HwdMZr46AbQ30Oo5Pvceg60v65XLTJsA5u+Ku9Mkw3WyR3jzgQb1ZP/PasWOU0zxUj/REEnLc08KwY97JwVSShUNtEJVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I1cWOq8+TbD7oTfTyVnOcH7ydZD2I5MXDbT4yxl37YQ=;
 b=OXiBs+4JlrbjzV4sjrPSbNdVwzk0kjZHu22yOPmZwjFvE0Kh4GMJg9dQuB3b8lx5aAUwU8Zsfr4n6GMr4dEQC2nnGZ8gQiYm/kd60XPAQn5VRwC0gFtoSC7JCfjf/3Ti8o9coOW2eF46tZQ6NSmDyOWuQlQxl46YrB7SyLfVl80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW6PR12MB8733.namprd12.prod.outlook.com (2603:10b6:303:24c::8)
 by MN6PR12MB8543.namprd12.prod.outlook.com (2603:10b6:208:47b::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 21:23:12 +0000
Received: from MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e]) by MW6PR12MB8733.namprd12.prod.outlook.com
 ([fe80::71a6:a9da:c464:fa2e%7]) with mapi id 15.20.8272.005; Thu, 19 Dec 2024
 21:23:12 +0000
Message-ID: <bfbe55e8-77c1-42c8-a00b-6e72ede3ab22@amd.com>
Date: Thu, 19 Dec 2024 14:23:06 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] drm/amd/display: fixes for kernel crashes since
 cursor overlay mode
Content-Language: en-US
To: Melissa Wen <mwen@igalia.com>, airlied@gmail.com,
 alexander.deucher@amd.com, christian.koenig@amd.com, daniel@ffwll.ch,
 harry.wentland@amd.com, pekka.paalanen@collabora.com, sunpeng.li@amd.com,
 Xinhui.Pan@amd.com, zaeem.mohamed@amd.com
Cc: Mario Limonciello <mario.limonciello@amd.com>,
 Timur Kristof <timur.kristof@gmail.com>,
 Victoria Brekenfeld <victoria@system76.com>,
 =?UTF-8?Q?Michel_D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Fabio Scaccabarozzi <fsvm88@gmail.com>,
 Matthew Schwartz <mattschwartz@gwmail.gwu.edu>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com
References: <20241217205029.39850-1-mwen@igalia.com>
From: Rodrigo Siqueira Jordao <Rodrigo.Siqueira@amd.com>
In-Reply-To: <20241217205029.39850-1-mwen@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YQ1P288CA0021.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c01:9e::27) To MW6PR12MB8733.namprd12.prod.outlook.com
 (2603:10b6:303:24c::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW6PR12MB8733:EE_|MN6PR12MB8543:EE_
X-MS-Office365-Filtering-Correlation-Id: 64e23c46-7d32-4ed9-00a8-08dd207357fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|921020|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RDFhWUlqd3BPMC93dXducHN5TjVXVWdlQ2tCRWdwdjEvbTFYYWR2b3UyeWk0?=
 =?utf-8?B?TjYrVGYrdXowelJUM3VaSjhuZG94VVk1YWlHOUxxZGxDM3lQZklYSHhkQVMz?=
 =?utf-8?B?T0ltbm9XOVhDdzkycEpiOHVOWVE3SmJ3TkFjN1JtWVZrQnI3NzhTeStNQlF6?=
 =?utf-8?B?djFnR1lzckNrS2hqMngxc2hXc09YTWdTOWlpcVA2Z09xa0pGaTRIYmIzbXgv?=
 =?utf-8?B?V0JuaFFRUnkyUUlsZTNwRXB5M3Z0VjhvcTE1WmhOb05NM2IzVldTcHBFZlpo?=
 =?utf-8?B?Nk5nQkNLZzNLZXFTYlIwRTJjSm9ZWi9oOFhVcjBxRmV2Tjc3T25zM0JzU0Rm?=
 =?utf-8?B?M0hEdHEwalZQRGR1YlpIeUdXenF5ek11c20zUmxiNjBRd082alVJSGdrQmZh?=
 =?utf-8?B?QmZ0eTNDcTBudVBiRGhGMWw1cjYvLyttcDlySzY1Q24yWVZIS2Z2VVlhMFJl?=
 =?utf-8?B?bVVRODJoQTBSSUttUEFFVk1tU1R1RWNEK1haWExmU1A5NVZLRmNmVzNlR1Zl?=
 =?utf-8?B?eXRBVlFJNmdub0tDN3lqUS85MmlDVXlUT09DSVAzK1NEY3RYYUl5OW5Nb3Ru?=
 =?utf-8?B?ZE11YlBEcnVVeXM2SmtuS1dyVGtGZ2FvUG4vZk9mRU5RQkE3dU14T1hyaDJR?=
 =?utf-8?B?RlQ1S3hKb09DdDJMOGhldTYrUklSSWg5OEVYdVZZa2k1cFZubDZwb2JmbHlO?=
 =?utf-8?B?eWc5SkhvM015dUttTVZiVXBwM0ppNmpUUjhBallGaFROeWxNQ21HNEppaFRv?=
 =?utf-8?B?OC82MGFvYnZnbUhaZUZxZmwva0dIMlJOR1NYZWNTUXFmTFJJVC8wUjZlR0x5?=
 =?utf-8?B?Qi92VUVxU0dUdnc4ZHY2VldZRTI1MDJiYjJLRzUyZnVNaHNkdnNiT0psaGVu?=
 =?utf-8?B?UVhXbnNGZHdtVlJyWG1FdXYxWjNJMUc0c2dLWTAwSXMzTUZsWlVYNm1tZnR0?=
 =?utf-8?B?M2MvVDBiWDhMQ2NUL3ArcUtKOWVreldRdHNFYUZCWEl2VXNEald2R2RGRjQ2?=
 =?utf-8?B?MHV6MWt2a2tOcVlrVkpjOEJyTHFFUFEzQ011TFE2TUtyTUVOK0docmExZDFU?=
 =?utf-8?B?b2tnNUhxbEpqdEp4eDlIeTBwRFp3N2JkWW1mY0xYc0FqK2xiN0E3bU0wcmsy?=
 =?utf-8?B?Uk5ob2NHaFpZeXRjZzc0Q3VhY0xkR2p6Q1RSR2hocENKMjBLVDE4SVdrSXJw?=
 =?utf-8?B?NHRCTGVnTFlBSXpKbjJFMEhBcHhQTThwV3hzdHFIQjhPTDV6L2FJcDVORzJl?=
 =?utf-8?B?cDRNMWpmRkVOQWFCdkd5NVBnQWsrQndRTTNnd2d2RTREaVAyaG9ZZWxScmNZ?=
 =?utf-8?B?K1pkNXdmL1dZb2E0SldwYnl3aVNzc2V2dU44N2lyVUI5aDRHL3U0anpKci9x?=
 =?utf-8?B?aWNMWSsvMUY3K2JTRGpvbkd0dTN3SUg0bXhFbWZhYjF1SEl4QTZMQnhyMVNG?=
 =?utf-8?B?U00vSUwyVURIVEhTa05GUTVsS3ZYY2R5Mk03aXduVmxwdEJReWNjNVpHOXNI?=
 =?utf-8?B?WjBCN0RqNW9SM2tHbUJYMDNaaEpzeGcxT1VmcFRtL244UlNxcXJGdW5HYlVW?=
 =?utf-8?B?emxTT2F5Q0twaitFajRPcUtHZk5wbTB6RGxkK1VUMityaHJVQzJIWmNUSXFp?=
 =?utf-8?B?SkN3NUpYWmdSdlZsUzNKNXN2SVoybWp1OGNPY2F4SUVyd3l4RmJNQmQwdjRQ?=
 =?utf-8?B?YlBPT1pCOTlyNjRYVVJaanFRZyt0bGlPTVVRNThlOWZ0cldiNVd3YTIzdTE2?=
 =?utf-8?B?OHpZTkdHWCtqWmpLYWtlNFg4Qk5uQlBDUytmdVNKYTVFVGF3UXA1STFCZ3NE?=
 =?utf-8?B?eGRGM0ZEZDc4NFBGdTB1ZUZHdGo0cHVmczVROUFvSjVLSTJYZnViZkFxWCs1?=
 =?utf-8?Q?N86ESscThua0/?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW6PR12MB8733.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(921020)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YXgwNXkzd1phOEw0Mlo0bjFRZVZBNWNxcUxCWGRqTXhTZmVuVUpUYlhTNHFK?=
 =?utf-8?B?eElieGdBT1BZODlQUGsyaHBPNVhmZzFVNzh5WWRzTmZMUFB0dGFyM2VxU1Jj?=
 =?utf-8?B?ZndpTWhIK3FxTVlyTlluUkVjRCtRb0RQMGhKd1p4YkNGZFlNRmhaQTlqUHdB?=
 =?utf-8?B?TDFGbnhQam5kSVNiV2xjZ0F6OVhmamtqNEFhc0s0a1g2K1pCSnFIaVp5LzZE?=
 =?utf-8?B?enV1aFlEQ0lvZlA5QUJXblIzN012Rk5zQnBSaE1lWXQ0Sk9hZ3lXcGF2Z0Zx?=
 =?utf-8?B?bk9OT1Vja1lEUWFVMWkwYm9Fcm1aei9FZU12WnFTWlhRZWlXRE9WS2lMQmFI?=
 =?utf-8?B?YjlSR2hkb2JpK0hxbnFBY1RrRmhEWVhNT29CZDJBNEF3bzBRWVY0dVkrZStl?=
 =?utf-8?B?NTBYR0cwTFpjQXBjVUM5djZyMHJXei9GancxejNMdEpwWWx3eXUvVFlNYnJu?=
 =?utf-8?B?ZWdXTDYxOTUxN3lXSk00REVOc3dVR0U4NEtDRzBpcFFUaDlVYXlRV1dQbk5U?=
 =?utf-8?B?eVlNaEc3UFBnc25NOWRhRGZnemxicWFFdElhSG1sU3FJNzhtR3V4K1dBNitR?=
 =?utf-8?B?bmhLVDJiR3F3VnVra2dMRGVrQnJzQ25FNzZHNm4zeTZqMW5HM2J1OHVJVGd3?=
 =?utf-8?B?U3NEQWk3Nk05eXZjZGdMTlI1bXpmZVhGVUNRdlN1aUFSTTVuUEIrWGMyZWhP?=
 =?utf-8?B?b053SEtPd3NWZWpNMnBhVzFiTVJHQWxyVkpXdVpDbTVYanFFWTRyOFJZdGxR?=
 =?utf-8?B?NCtTalVKVXVjMzRCRW1BcGtoYlVrTFlZNGxKS0wwTG1VUEVrdUlodk9rc3R3?=
 =?utf-8?B?U2lPWENReTFTRkpZR2NWclppdEJqMFpwUXpIdUljTUw1dGVtYUZ1R25QTWFP?=
 =?utf-8?B?TklsLzRtRXFEVXhlWmZxTzR4NXJpd3pGQVZXOGJnaXE5cjlqbGNGZU1HeTFS?=
 =?utf-8?B?Z1RxNmJ3Z1NiWjgxRkVXTXRqT2RUNlJVYm1ITWJtaXdPMmxrRDBEcG92cjFK?=
 =?utf-8?B?QnZDYUYxK3VMeFNOOVV1MVRWY0FreUg0d2hNQm1yb3JBeXlJRk5lcVpJdWkv?=
 =?utf-8?B?SVQzNVVJc1JwUlNCQmxZdHdUOEJWeENOWnpOYnQ3NUZubmVyQ0RZYVJ6Mm1o?=
 =?utf-8?B?UHVodTZVTzFwNHJ3L0FnYWF1NWpHZ0NmTnY4NU9id3FjRDl0WFdFYzIwY2Nx?=
 =?utf-8?B?UzhEcm1QOG9ISkVXUHhHWU9pcUxKKzNCbHNBK3Zka2dZaittdTBWY0dNN1di?=
 =?utf-8?B?eU5QRU9OSWpOWnM3RnhVTDVDcllxQjN4UDVGT1lUM1lLUlh0Q0JYRVhXQm1U?=
 =?utf-8?B?UGViajAwTzRzV1BORWtPQkUyVS81VkdBZU9LYkIxU1RWaU55cjdxTSthUTFE?=
 =?utf-8?B?R3E3R3lUUXVRc21WbTAwZzZuN1NTU2tzTVNzem1YSzl6VWFMTUI5MHV2TDMy?=
 =?utf-8?B?bGZzSXdZVEdnandJbDZVUkZOL1IrV0Z6c0dtQUdIeGhFNGFTNG9Rck1ubXhl?=
 =?utf-8?B?ak5pNXBYSHFuZE9XTm9LY0E4dHVVaCtkODJDalp5UlUvSGF5UjA1NEhQeWxk?=
 =?utf-8?B?cTVWSDNxaXNZOVVTWlVyT0U0aFBKV2tML3NvN2lVOGVIeDF1dDNlM1VHcUpi?=
 =?utf-8?B?SjBlYXIzZlNkTHJ6TjUvRDhTRUR2VCtGQVBXMzQyMlZZOFppai8za1RJNVg3?=
 =?utf-8?B?VmROZElmUkY4ZFYrRGhIT3UxSXRKRDUvcmNUU0dFbURkZDJxeDVBNEhBcDUx?=
 =?utf-8?B?OW5aK1pRMTlzbUhmTXFETm9tTHY2K2xrZFhFM3hOMmhtakJUNDF3eXpsYUdZ?=
 =?utf-8?B?ZUJ3cWJJRTVnOGN5WVhidjlybDNJend1RWpFcmo1N0xNTTdEb014NkcvSHFG?=
 =?utf-8?B?UFpnbFl5ak1LUFY5czM0bFVJcklwL1lsR2Nyc3NpZHYwSjFCdjhocGhGN1Vv?=
 =?utf-8?B?SjJxVzY5Umo4cjg2UEk5ejhrVVJHRE1ubm5MRGdZNllnMUFjZEFiWjNDNDJw?=
 =?utf-8?B?elNVYUNJNk1WUVpncE9PamltelFJbjZUQzlrTnQvRVp0SWtGcFRpVEJtamlU?=
 =?utf-8?B?ZHhvZVVVRUsxdlFMNkw4SjM0SnNCb0Q5dUE3aTQ3QkZ0Nys4K0hYS0F2emEr?=
 =?utf-8?Q?++4Mv18QFq6H7d0+7ogcRX2Xn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64e23c46-7d32-4ed9-00a8-08dd207357fc
X-MS-Exchange-CrossTenant-AuthSource: MW6PR12MB8733.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 21:23:12.7034 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GPOiGIP3nZfFKsn81jN7NsVYLyzFYDcyaqHumKU3zWjcl4VroRhrTdGpdJDmvzXT4F+5tpyWtZtWLHNeMTBdAw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8543
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



On 12/17/24 1:45 PM, Melissa Wen wrote:
> Hi,
> 
> Some issues have been found by Cosmic users of AMD display since the
> introduction of cursor overlay mode: page fault and divide errors
> causing interface freezes. Both are 100% reproducible and affects
> multiple HW versions.
> 
> Patch 1 addresses the page fault error by resolving the definition
> mismatch around the number of surfaces supported by the hw, where two
> different values (MAX_SURFACES and MAX_SURFACE_NUM) would be taken
> through the DC surface updates flow. The regular flow take MAX_SURFACES
> == 3 into account and commit_minimal_transition_state uses
> MAX_SURFACE_NUM == 6. I noticed that Leo Li has proposed this change in
> a previous discussion [1], so I added a Suggested-by tag.
> 
> Patch 2 expands the maximum number of surfaces to four, since it's
> supported by the hw. Also, this amount accomodates current needs,
> avoiding `dc_state_add_plane` complaints of not enough resource. Note
> that it somehow reverts the change proposed by [2].
> 
> Related AMD issues:
> - https://gitlab.freedesktop.org/drm/amd/-/issues/3693
> - https://gitlab.freedesktop.org/drm/amd/-/issues/3594
> 
> Patch 3 fixes a kernel oops due to division by zero error by checking if
> the destination scale size is zero, avoiding calculation and just
> setting the out-scale size to zero, similar to what is  done by
> drm_calc_scale(). Even though the missing check in dm_get_plane_scale()
> wasn't introduced by cursor overlay mode, AFAIU the cursor mode
> assessment happens before plane state checks, so
> amdgpu_dm_plane_helper_check_state() can't prevent
> dm_crtc_get_cursor_mode() taking an invisible plane into account.
> 
> Related AMD issue:
> - https://gitlab.freedesktop.org/drm/amd/-/issues/3729
> 
> Other previous discussions can be found at:
> - https://lore.kernel.org/amd-gfx/20241114143741.627128-1-zaeem.mohamed@amd.com/
> - https://lore.kernel.org/amd-gfx/20240925154324.348774-1-mwen@igalia.com/
> 
> Thanks in advance for any feedback.
> 
> Melissa
> 
> [1] https://lore.kernel.org/amd-gfx/20241025193727.765195-2-zaeem.mohamed@amd.com/
> [2] https://gitlab.freedesktop.org/agd5f/linux/-/commit/3cfd03b79425c
> 
> Melissa Wen (3):
>    drm/amd/display: fix page fault due to max surface definition mismatch
>    drm/amd/display: increase MAX_SURFACES to the value supported by hw
>    drm/amd/display: fix divide error in DM plane scale calcs
> 
>   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c       | 4 ++--
>   drivers/gpu/drm/amd/display/dc/core/dc.c                | 2 +-
>   drivers/gpu/drm/amd/display/dc/core/dc_state.c          | 8 ++++----
>   drivers/gpu/drm/amd/display/dc/dc.h                     | 4 ++--
>   drivers/gpu/drm/amd/display/dc/dc_stream.h              | 2 +-
>   drivers/gpu/drm/amd/display/dc/dc_types.h               | 1 -
>   drivers/gpu/drm/amd/display/dc/dml2/dml2_mall_phantom.c | 2 +-
>   7 files changed, 11 insertions(+), 12 deletions(-)
> 

Hi Melissa,

Thanks a lot for your series. I tested it on a couple of hardware 
devices, and I think everything is alright.

Series is
Reviewed-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>

and your series was merged into the amd-staging-drm-next.

Thanks
Siqueira


