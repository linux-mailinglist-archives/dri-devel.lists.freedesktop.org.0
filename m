Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD262ADA8B6
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jun 2025 08:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44D4610E042;
	Mon, 16 Jun 2025 06:59:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="tp172i2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90B6610E042;
 Mon, 16 Jun 2025 06:59:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Fx6vfNknidQQP8DhCzyeHNNOlOmEAtW9WICSJImz+8hMnvYuWlhmwwXC58dWafTTfpjV22h06B6jNOVhYuHivZ7DuEjjNiN2tIxbaN1+Gto2w4BiPHQz7rbMxG31+vJaavWJuZQS33Cc2UzA5zdcVujInKw9hoPQVft6ISJlvFUzZjWBAjTU8EtVd79JKirzrVQ0MxohmvUCHTVwGedzD/QzuPyLATAnvB5ErOE2z3d3+uC/nNtNszkOrZXliesiY9BrAIXoZPQHE6IH1qGnmZEjHTh589EoEvo6JoB5u0TDhAVAovM24jM1tAPFVyBa8lQxvCqf78qBWpqHZzAWQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lsacblAMED6EBJU67kp3U5qqB/NElqUTp9P5cuHP55Q=;
 b=rdZTm3JdskqmiV62WzImsb2bSw0m7Uc6c+y4jBKjzMF+ZWNyu7Nd+nt5qWEpn1WVNL2s4uj1QC3twlDy4hTzajQfFOb/bp2zoYAlS2MGd4RMAr/y9I+xNl07AX4sBx6Tyjx2TnIdSOd+KB6uJQ9f1MJ/ZiDJcuUrgjkEq0P7M9+Jbeu+Sw0Fbx5SbNrRePI/auyM2vwkgpJnTVPDpdhh79M6PVJKIg5rbdcfoOKidDhBaMIZWSDD6VfKTxRhMuc1SutBJoUiQEO1QZEExtEGIpAThjiKglmAC1w+j9SANr2MS8NOgZXZt8L9UaCg9VrUrVaflcbeaGsqd7pXrvcRNA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lsacblAMED6EBJU67kp3U5qqB/NElqUTp9P5cuHP55Q=;
 b=tp172i2AnWxvw6qdpXMQIbmVTfzYRczMigrSxIG906jES55m13iA/TVKZ6SMnO3P7EMiZtheknVLHR4zPZvfQUFVuG9+IU6uvQB1B/+u5QEZqjTRxFMz6D4R4ZX3V69pSu0Xa+H4aUlCDCsHMyOmhWJLmBs2MjGd1MueQFnOkkk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BL3PR12MB6476.namprd12.prod.outlook.com (2603:10b6:208:3bc::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.23; Mon, 16 Jun
 2025 06:59:08 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Mon, 16 Jun 2025
 06:59:08 +0000
Message-ID: <4907bbe3-14e7-49cc-b5bd-78ba375bf46d@amd.com>
Date: Mon, 16 Jun 2025 08:59:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm: amdgpu: Fix includes of <linux/export.h>
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org
References: <20250613182651.1758760-1-andrealmeid@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250613182651.1758760-1-andrealmeid@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0117.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BL3PR12MB6476:EE_
X-MS-Office365-Filtering-Correlation-Id: 53c45616-35aa-4983-2b26-08ddaca349cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkFPbDRKNnZDRUtsdVhwK1RaQktFakZqTXY0ZlFLTUpHVEk3am1ZNXdkWmw5?=
 =?utf-8?B?ZkZ5eklNeldkMXJLYnlhcUZtcjdxUW1UNGRrcjNoN2RQZUFGNlp3U0ZzVlpx?=
 =?utf-8?B?TUJON3pvTkl0KzV2OUtqMkpHYmtScDRna0kvbzRlTW5HQzBNWHBIKzBTWlo1?=
 =?utf-8?B?ZTdYU2ZweFNjellNMWR0cmp0cExVQ2RTbjV6N0dzUnovMWFpQ1NOVU54dG1H?=
 =?utf-8?B?NFlxOU4wcFA4Q2t0Y2tzc3prOGlJczRzd0ZWMVpQQW1UTjdRQXFZRjhIaWZE?=
 =?utf-8?B?anlwQ0dBZkNlekYvQmZxcEFscVppanh2QzRja3BmcmQwOXE2THc2ZGl0WkZi?=
 =?utf-8?B?TXNUR0o0azR6THJMUFZTYkY5amxpcm8xQWpoWGJhT21vRXluQmVBcmV1Uksz?=
 =?utf-8?B?QThVc0JmVGRsSlpXdHg5TEcxNUN1bnJyOXRrakxWR3FkblBlUjl3UUc2NjNu?=
 =?utf-8?B?WSt5WCtvZTViY1ZDL2s4MGF3TEV5UTVzelUrcUtkQmRpK3MxelhRUER0dCtS?=
 =?utf-8?B?LzB3VWtmMHhPVjIyNUtYZ1dHQ3BVaDVENkx3aDZlTkRWWmVKWEdraXI0bktD?=
 =?utf-8?B?cWhjR2hoSXVxSkJDZzRTZTZ3bmU2bEQxN1kyUU5GVWEzRjJGTzM1U3dLWWZX?=
 =?utf-8?B?aGVySDExd0R0QlBaL2YyenRieHlwaXFsMW5LYkV4UzkyVkcyTDg0SGdyUDdM?=
 =?utf-8?B?cXNBamtBOGY2K2ovMkJrcFNsbll1NmEvaEZmVDR3Z3k2b3hSYmJMOStUVnZn?=
 =?utf-8?B?S2JVQlZTblpmenpSZFdJb3NnZ01lVHY5K3d3V1c1NzRYeFptcFRIYUt4UGYx?=
 =?utf-8?B?M09LZGczUFZCSGZ0Uk1hRUdGMFEvNEo0a3dVT3V4amM3Sk9QNWNTSmVnai9G?=
 =?utf-8?B?cGRPR2hLdHQvUGlaM05qQ0kwVmpHMlpVVWVJR3g3YVJBVDBpWVdRaDJnaUg0?=
 =?utf-8?B?Y0krNFFWREgzRE9GdXZsT3ZQaytmay9WNS8rL2JEem5oeHNsZjdyV3d0ak4v?=
 =?utf-8?B?YTNvaVJVeUNDVDVJdVFjSThzVzUvWjhyQ0RHUVdDUVFsakNDa0F4T1ZKNldQ?=
 =?utf-8?B?Q08xUUQwamxKbzlPbTRYU2lFWVdncEpwZ2libER6bkRKaXhxemZPQzVMRTJo?=
 =?utf-8?B?aHpXVjdYWldDTlY1TjJzNWFOTFA1Kzlnc0dSbE1SUXN4WW1uN29RTFdHUFNQ?=
 =?utf-8?B?dmxOeXozRWYrTktRZkhXbXc0VzNjQ05aNldpQXRLdHhHKyswOFUra3hjQlpk?=
 =?utf-8?B?WXg1OG5ScG5TY21tSjhlRHAvYmJFWjNKZ29rUHNTaHU2dDlWYldHTE1nd2x0?=
 =?utf-8?B?UXdMRWZETGd6R2lHdi9ZU29CQm96RlExTEtsempGUVlaNmNVM0FJWk1JK2dH?=
 =?utf-8?B?Ukh1MHkwL1FNWFZWRzdSVTN5N0ROWVZUcGhzVnNnU2svNUMyOWthY0NnOENB?=
 =?utf-8?B?bjY0Q0Y3ZUh6TE4xVDA3Y0ZaSmIwTHc5MTRvTjFCd1J1WnFCdHhsMXkwS09O?=
 =?utf-8?B?SEhMYWdqaFJSL2dDdFF4c085QVI1MU1qYkxUNktXTTlZSFJwaTNMOVJFZ0w5?=
 =?utf-8?B?c0pVNjdJODJoSGRWV3ZqajBqdXdPS2FGbnJSNkxCNHVBTzNGd2pyWEFJZ0NX?=
 =?utf-8?B?bklWTkR2ZU5YeC8ydU42dWxlWVEybDFnYUh3R3ZHRHV1TWFsRjVZMEhxSGhz?=
 =?utf-8?B?S2NhYmYvTzVmZUhrTDBKYzZ3TkM1dWRZWnhmN3FHczMyNndGNDVMSzZxSEhu?=
 =?utf-8?B?b29ucTZWUzM2K1hSa2U2SlExVTMrdTBtYkdFeUFoVy9XQUNZazBTSGwzR0Nj?=
 =?utf-8?B?L0k5K29sSkU0bVphOGhLb3ZXY3ROUGxIMGt1cTJCWEkraVI4OFY0RlExVHM3?=
 =?utf-8?B?WDA1VXA0UnJpRnRCWS80Q2xNTGthQ2pBemJFdTVZWlVVY3EzU21aaVVaWk5p?=
 =?utf-8?Q?n8D0FIWrQLE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eWhBMjdIRy82OHRaM1d5MUhEZGFrRjg3SGdLUUZjMGdZdEp0VVUvRE1LMURx?=
 =?utf-8?B?SS9YRUgvQ3lLVjhONFFiaHNVMG9RR3hIVXFWbUVFUkw4dEpsdWFvMjFOeTlY?=
 =?utf-8?B?Rk5Ra0hGb1NYeUg2RVdTcWM0ODNCVDNET0FBRXJ0WEFxV0hBZFk1V0tiZkph?=
 =?utf-8?B?MU9iaWVtU3NkWFBGYW83aXZzWmRwNEw4MzFWR0NNK0VCeEFVb1NHaFl0ZXN3?=
 =?utf-8?B?MjZZazBUNktKWktKcjFRejd5cDh4bTQ5NDN5cnd1dHhkRmk4ais2NFkzWUpP?=
 =?utf-8?B?UWp2ODZZWVZWcWhCN213dVdiVDJIRkFSd0xLMm5wREZxRHNpL3Q5OXNFZUJS?=
 =?utf-8?B?MVR1YVlTNmJmZVFvNHVleWlYUDhFemplRWZkcml3QlZEYjg0MXRRUkIzdzQy?=
 =?utf-8?B?Qm4rQ0lYM2FVaWx2eEVhS2ZMcm44ZEkzR2dpT0VHZlV6K2xoNDF6QVNYVks1?=
 =?utf-8?B?eFdMd2VyZlJRc0FyMlFIS2VId3IyWGlyR3I0b1NjOFRoWlhROUxiQS81L0E3?=
 =?utf-8?B?OGVSMldhaHZlRGtQNjJUbGFmd2IxV1JxNFY1Nk1zVTlLVlZVd1B3WDE4U2pP?=
 =?utf-8?B?QnQ0aTNvNEtSblhlblBQdUNCbDlyOGNMNUNBN0xiOTVHbWN2TkRxOVp0cmVG?=
 =?utf-8?B?OEdPN1JYUC8yNk1zN09TSG9nQVRqbTVBeTVyN0VlN1AwOHVQbUl2QVczOWVu?=
 =?utf-8?B?MFNxcUp0ckdldlQxV2M2dEZoTVN5Y015VkNRVWQ0bktRVVJ2VDRqSWM1M2JS?=
 =?utf-8?B?UWxCUkhNV2NtL0dlRG1YRVF4MmVRampFbGM2c1paQzg4bVptSDFGcVJzNDdy?=
 =?utf-8?B?QUNCUm1KRlNwc09mT00vaUFHUEtScW1PV3lJU2dlT0kzVisvdVlqRERwK2Yv?=
 =?utf-8?B?d2FFbmtwOCt2K0xMemlmWko0aUNlMTRtdEo5OHBPTFJRMGZKcjlvYStWVU9s?=
 =?utf-8?B?OGNlckhzYWpPMllVSHM4ZEQ3QlJ1Tzl4M0RPWjFTclpQcExXRS9GQ3dPckFL?=
 =?utf-8?B?T0FzMnUxNCsvN2h3b0NCMUZ1ZERPWDU5bzBMc2lMU1phNC85VnZqNFR2L29i?=
 =?utf-8?B?QTJxRFJReEJJS0dsUlhDM0lnaHFMRng2bFZ0TTNrSjJMUUNzdjhsU0VyS0Fk?=
 =?utf-8?B?bnZmZmhiSE5sc2FpU3pkWTI0eEpJSVF2bjNLM1lnMHoyZzdaZm9xQWovVWhM?=
 =?utf-8?B?bkloQ3E1d1FlUHcxdHJmNmtXanJ4NEMxUXpUUHlZZHQ4RnF4REhCNHRSNXpZ?=
 =?utf-8?B?YUsySGZYQWJLTkh1T09iSnoveVNCbWhNMXphenFyOWFCc3h4LzFDbStITldT?=
 =?utf-8?B?M0VlOEF2UGlPVjRkTGQza1JlWFlrQ2ZrTTdTeGYzcjBZWFdoQVd2MWNhb2lM?=
 =?utf-8?B?SnRWcFFxZzVuNElrWmVqNmhtNWd6ZmtkcXh5bHFidW9ONkJDbFZVK2N0NDlx?=
 =?utf-8?B?YUtOTTI3YlEzdDRKa1o0bWpwU2k2dEErbURZMGJPdlpwb1NmK0FKUHVPaFNI?=
 =?utf-8?B?ZGpLcm4zVkc0R0dIT1gvOEd5NnVTTG9ya3JDa2lXS0d0emt4WndVSFlIclNT?=
 =?utf-8?B?WEl6SHREcFBYSjNtZTR4djRxQWNlZER5b1JuUFR1UyticjEydVdqWTBDNDVB?=
 =?utf-8?B?dTYxbHBnWlplWldJOWwwVlpKd0QwN1ZzZDlBOUl3MlNYR1BKN29IdWwwZ1Ni?=
 =?utf-8?B?U1N4N2VJMXk1NWpZZzJsRmZuZTdCa0FKOHd2VXQ2L0NoL1FHMWYzajFTRmNT?=
 =?utf-8?B?Q3NOWVduS1FjRHB1L2Fpb2tHOFdXV3pIRnRsYWJ5VTdsM0JZdWtPZlVEK3J5?=
 =?utf-8?B?azJPR1R3c3FBdWpCMlBWalF1QkVaREY1Z3RIc3NWbVZYWDBmeEIveDJwOHNS?=
 =?utf-8?B?b2tBcUExY1ZaUE1KTkIxR0NrWERqS1lMZmZCZWdBVDh6TEJCY1VNbTRQWk1x?=
 =?utf-8?B?a3h0M2IxdlBEM3UwUjR4d0c3aVJBSnl2U0RyMGxDYjFHVlc0RXBEdVN2UlIx?=
 =?utf-8?B?dm9zYll0OFEvckgzN0NYV0cxc2ZoWDhiM1ZtTUVKU0lSM1lxVWlMZGpYZFJj?=
 =?utf-8?B?cTZxYkxZdTU5NGQ1SzN0OWpjN0xLd3NqMDlHbFdkYkc0dXEyYjRxQ2w4OWZN?=
 =?utf-8?Q?2NWA=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53c45616-35aa-4983-2b26-08ddaca349cf
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2025 06:59:07.7716 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WjNJb8oac2DF3/Y/n6biNdWrmLM6RHY2/wigRhmuBVgrSIFuY82Jx9yGwcgGPAgR
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6476
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

Acked-by: Christian König <christian.koenig@amd.com> for the series.

On 6/13/25 20:26, André Almeida wrote:
> Commit 7d95680d64ac ("scripts/misc-check: check unnecessary #include
> <linux/export.h> when W=1") and commit a934a57a42f6 ("scripts/misc-check:
> check missing #include <linux/export.h> when W=1") added new checks for when the
> include <linux/export.h> is missued by drivers. This patchset make drm/amd code
> compliant to this new commits.
> 
> See also: https://lore.kernel.org/dri-devel/20250612121633.229222-1-tzimmermann@suse.de/
> 
> André Almeida (2):
>   drm/amd: Do not include <linux/export.h> when unused
>   drm/amd: Include <linux/export.h> when needed
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c      | 1 -
>  drivers/gpu/drm/amd/amdgpu/amdgpu_object.c   | 1 +
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c     | 1 -
>  drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 1 -
>  drivers/gpu/drm/amd/amdxcp/amdgpu_xcp_drv.c  | 1 +
>  5 files changed, 2 insertions(+), 3 deletions(-)
> 

