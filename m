Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AA24AAF863
	for <lists+dri-devel@lfdr.de>; Thu,  8 May 2025 12:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6029110E380;
	Thu,  8 May 2025 10:56:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="1y2tqDn5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2069.outbound.protection.outlook.com [40.107.236.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8834B10E380
 for <dri-devel@lists.freedesktop.org>; Thu,  8 May 2025 10:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fVJR2TQ9Ifh5s/ktB5blNqZ0P2jzS46FpDbMGmxN5RuoJFOmIr9WEpFKg5mHdkxCSGC/WTH9VVpQVSI+4D9d7tCz0/gOOEj7dxbia6xXA0YV/D/dGAvkpCQLhWuV+MumL+nRvaZuLhEjdARKpaVGpKuymdC0vSNpEoKUiN/WwDi//b5Amf3vS3M/xdEwgyXYrpYb7eKpeV0JsDsgLIlR1+ll1jaqaWao3sRrNXwoahZ2R0uuKXli+gmHbwW2xkk0JD9nIDJeLLR+M0Pso/lAFdQg47JQVn7pW2kxiTWwFYVsuef+/uX8KVmDyx6Nn1egDNICCXY8kt1OVwbkiHqw9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aN2b75/gxxaF7JyJKtag5qVjiIJaGinopxYhGj+wTA0=;
 b=o3GQDBCidnEl9e5q3KN37ZHzFGVkRl8o/+jpV31ssq9TxhI930BU2JvHPmchhrwPj5Lwemk4WxZxbJ+OqbzZiqJ8fZaYObSCPwwPqJMxbEi3lxRyItMQskeWM4H8lv7mE3gYyGfIzExMk8KhzShtH8Ps2dVRgx40aduDtrwl0xBgbw19I1iv6hMLxIlyMo0D1JTaDP9PZrBXXkiYc3ZS2qYtTOZ32ACwYXoyvcNzx7p5dslfXXcFqCggGa3lWn0LJzl2vdGXEuwNrjJhhvYC6YL+VTqCvW+eRLEGCJFGRBktOo/RKK/iUTQ5YHFRF/ac+ZGp7I+zCqSw3CXiaJu0iQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aN2b75/gxxaF7JyJKtag5qVjiIJaGinopxYhGj+wTA0=;
 b=1y2tqDn5Of7yMpkKsl/UtoNwDWdFeHpsKwpp5PV1FL+37UC6QkK8tCyFFVzRtnAAezLst2ojAkYfL5peR3fOsYZGewmrBErR8utSsgKK/R86rMpHfgOeuTeEpUL0WiM+JrcyxGKMVnaMbw6CmEzGXG+R0FtTH77RzoSydwaYDzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7786.namprd12.prod.outlook.com (2603:10b6:806:349::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Thu, 8 May
 2025 10:55:56 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8678.028; Thu, 8 May 2025
 10:55:56 +0000
Message-ID: <50c0ce93-5d74-44b4-af7a-049c5d901a7b@amd.com>
Date: Thu, 8 May 2025 12:55:52 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dma-buf/sw-sync: Remove unused debug code
To: linux@treblig.org, sumit.semwal@linaro.org, gustavo@padovan.org
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
References: <20250505233838.105668-1-linux@treblig.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250505233838.105668-1-linux@treblig.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0093.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cb::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7786:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ee1e507-40cc-4bac-985c-08dd8e1ee885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OHliSzQxVTZRVHRPcW9HTTRRTjF5T0EzQlRncmVDQ2h1VGhvZWxva2l1bHIz?=
 =?utf-8?B?S0tBYTJ3bVBhYUtoNU03c0laUVNvYzZldWQ1S1VGSUtkTm1aMmVZRURBUUJP?=
 =?utf-8?B?ODFDV0pKdjNPYjNtR285MGU0RFMrMVYwaWVRbkd2S1V2My81VUQ1M1VNaDFR?=
 =?utf-8?B?azJlaU9CTFdoVFhuaG1qWHcwWHk3UTI2QjUzWnFTenBSL0xqa2ltVGRRU3BK?=
 =?utf-8?B?disxbVhBNVVQdldkYlVIR05oK2pWK21wbUdyYnkrNmNGWWhPdnBjMWk1UEJQ?=
 =?utf-8?B?aTFscEJVaUdkNldnUnRwNm93TXc2STBYU0htS0JMUmhjOTNsS1F1U3BTOXM2?=
 =?utf-8?B?QXZNc2Q3SGx3Q1BWcGViQkxTWVdMYzdaZ0pDeDlNWjk5RE1kSG85QllTQXRj?=
 =?utf-8?B?aVpVa2VvcXByejdnVDM0R0VFbzRXcndkOUlQUFJZWGI2NHAyVGt6ZzM5bUJh?=
 =?utf-8?B?QVhrT0FpYnArdUVPU1JtTDhwUUwwbUpaa3ZIMnlSRUh2bEFZSXE5cVgvYUxW?=
 =?utf-8?B?MWF4YUpnUjAzSG9YRS95NGx0NExwVWxJQll6djVsWTJSdjJCTG90T292L01y?=
 =?utf-8?B?SFpTcFAyQ0RxUzFiQVFsK0dzcWsrTWx6d0Vqdml2d3JtQVNPRjdadktGVUNL?=
 =?utf-8?B?TzRpQnZKYnVTc0gzT1NYaFhHbWF5ZlU5MHlyNkxFbU1lYmlaVWZhWkw2OWYr?=
 =?utf-8?B?SHBneWo3dWVuQVh4UnFPU2FjN1VaOHR2UkY5elpjUjlFUjBiTk54c2NJOWth?=
 =?utf-8?B?K0J0bTNCUUVaajgzdEJDTWVCTENwaE1CbUZhWUxNQWU0Z1ZKeDV5VkFDM2dV?=
 =?utf-8?B?aTJsRnVFb3V4US8rV3lnSTc5dXZibCswYy9BMGdQMDB6ZytQSDl3bjZtOVNX?=
 =?utf-8?B?TTBFVEZoM2VLdldBWXF6UUZjbS8wNEV3SWFNbUk3SnNZNzJSNHNoem9HbzdU?=
 =?utf-8?B?MzRDamhrMVcwVW9WZVczYTEvc1pBTElYMTlkVTZacUNEY3BRRkFjWDZyV0RC?=
 =?utf-8?B?L2NYdUh2MGgzQVd0cWhDcG5BVUJWMW1PNCtYVUZJV2NBZDhPUFEwTkQyRmR6?=
 =?utf-8?B?aW9pVCtPRENnZWc0eUxvU3RnT2QvS2Z0bkJWSEFPUU54M0VTQ1NCNE1NS0xX?=
 =?utf-8?B?VUFsSWUwY0E3UkhBamRwczdMNnNqQlRFNTdxc21KZ3NFTlZWSUJuZ2Z1bWJK?=
 =?utf-8?B?TmxTQnRseGw3ZmQwclpXbmIrSTlMeEhuQ0YxQkdPOSsyMDdFM05aK3Q2a1Zq?=
 =?utf-8?B?OVk5NXJzRUNTWnQzMTUzL24xWFd3NWdMck00YXR0NTI4N0ROb3kySDFNckZJ?=
 =?utf-8?B?L2hFWWRKQ3NheW51elE1YWpGQXlyb1ZaVitDWjZLYWhTRzJCckp3aFFWYVFk?=
 =?utf-8?B?RjhJSzBsYUF1Qi9qdWxMZ29jdHlFcVZHL1BzVmQxckU1cmV1TXlqcUNkQ1Bo?=
 =?utf-8?B?ZG81M0hKd2xTbmdOcjVtRGJ1RmZEZWdNQkVvb1dUT2VMNnYybzBLQ0JJWU0v?=
 =?utf-8?B?aDV6WXN6OWVDTDVZL3dHZDdNL25UdHR6RE9vY2VrN0VBVDBGNEp3bzY5UTlK?=
 =?utf-8?B?KytvSVYvY3VOaXJtaVNHV1FNZktqeTRCNE9nRUZqTXQ3ZmVvTFNuME5oMmhs?=
 =?utf-8?B?UmpJZlpmWlJYcGNVWGR4U1NqL2V1cUJ0b0NpR2d6dXpMa01mdXVURk5uaFZI?=
 =?utf-8?B?UWRFcFhMb2RvZTk4bjRFNjg3RTdBWER0YkRNY0dqNE1BTFRJOGluaXlSMEtY?=
 =?utf-8?B?UEZMUjhjeDc5aXR1ditiVkpSWi9YWndkVm02bk52Skdoait6SzFDRyttL0FN?=
 =?utf-8?B?SllLdzRJYWhlRXgwSlJHRFlaZC9Xb25vZlBnaU02ZC9kMjJSY2YrUXhhRDU1?=
 =?utf-8?B?dkZLSERNUllEL2pMaTBDck1sNjlGQjkyKzdFVktFU3lJbFl4RG5JNjhTUVI5?=
 =?utf-8?Q?zoHK6ESTKPw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NDZoSDJEcExEUk51N3M2ejIwMFdDeEpNY2piLzZFdEZZcm1VNWhHanBDZm5M?=
 =?utf-8?B?Y1FGQzNGbzYyaTlYSG9KblczU2plWkZkdHBKVkFKWlUyZzU3djc1b3V4czJh?=
 =?utf-8?B?dmZMeEZZM3hENXVKVGl5dVFhdTNxRHJKb1hrMTlwSStteG1sUEExOEJweDlZ?=
 =?utf-8?B?OGxtQ1VlbFJKSTR0ZTloa0EzTGUzUkdyVU1walRXaWErVXVVNFd4RjcxZE9w?=
 =?utf-8?B?TENPTy9hZmc1emxQTFk1eXN0MTlWN013Q1hBdUhyandybWtqYzZENnZvTVRC?=
 =?utf-8?B?dkxIcWVxZUJRNXZYRVFvdm1XS0ZlYitaRHJqeElzZTdUand5VXo1V21zem1I?=
 =?utf-8?B?akFOZzBaNUJZMjBHUzZoWVMvNjRqSzVOWWpMUFpxTE9kWUtMcWowWGJ5WnNr?=
 =?utf-8?B?T3ZhMEUzeUxNVnNlaU92NWF1ZEwvbHA2YlhYNHV0dkJteDh4eHJHRWRZbTB2?=
 =?utf-8?B?UDJMcWhRM3RrQkJHZkxCWGpMU3BydXFBRkJNV0J2NnNVbmFpbHBrYjVRTHJ0?=
 =?utf-8?B?THJJUXZ6MjloaWVkTFlzT3NaRDF1SXRUQkhwMEowUjluNjd1S0tTY2JwbmRU?=
 =?utf-8?B?WHFMSXVzT0xIckZxZXFSSmE4MnhyQ2FFakJXbVZJYmlIZ1FVaWhTNTB2dWhB?=
 =?utf-8?B?K1g0Ulo3NDJ6enJ0SEVNYUdqRDhrQnNzcGkxNGFwZU4zOW5ka25ya0RVUUFu?=
 =?utf-8?B?SUpISi80SkNZNmVYT0hNUFBiRlNWZEErM1hqS0hUblFDRXVweVZjclZlM0ZB?=
 =?utf-8?B?c0NSUmovZVYwVGF2aThKY3Zwb3JIZzhrMzVjRXZmKzBoZk1GSkJUczFrVlJT?=
 =?utf-8?B?Y2p0VVR1TW45UGdZcTloSnFHbVhDMXJ3cnl4cHVESldGVDBzRFM5Mk1VdUU1?=
 =?utf-8?B?UkNwYjl4MmQ0Q3hvUG8wRUJqSGFLWVBPS1VvSExndWRrcjkyK2N1UjNBSHl3?=
 =?utf-8?B?Q2Vmdkhyb2ZOemVnL0NwUmlHNm8yMjZxTXA1VzdnM2JHODJGU2o4T1l6YkFr?=
 =?utf-8?B?QkdwamU3UjhqUzNhck1LeTM5MU1PUFFINjBXV3VlVlkyRU1uODRSSCtsNDNT?=
 =?utf-8?B?bVBZUVlxaFBaUkxTZEZXT3FDcFI1eEZ4eXlqQXZ1S2M3VDJVelZkaWJWNk1G?=
 =?utf-8?B?TlcrWXNYOUVzbDVDWkh5VHZaTWtFMHZXd1h5TTJEakNCUUZZLzVqZHd3NXhz?=
 =?utf-8?B?ZW1lZTdWVDN6Y0J3L3ViRzJCRk5DalNuSVpZWk80N0NIZzh3NVJUSnFUNlZ5?=
 =?utf-8?B?NFFiUWlMQlBxbHJxc2YzZmVBUUZraS9pN3RRcW9VQlB2czNzbUZaNmtTbXla?=
 =?utf-8?B?ZndLVnBvV2NXa0xycS9abEFhVEh0M0ZZbDZldWRWcWQzdkx1WGszTlVIbmh1?=
 =?utf-8?B?UjBPZ3g1Y0MxRXNlYU4yaEtnaVBnMVZseWtISlRZL0V2aHVmU3pkeWxYMHRj?=
 =?utf-8?B?QzZJNjdJT1laa0FrcGVlRjNYUERNUm85aFI0ODR1VkRzNHlaclVLRGZpWEti?=
 =?utf-8?B?RGJ2MFBLR0lnb1A0c3RSeUFSVkdLbmdRYjVTRjZqYkhiYWplZEpZVmVhZ1pw?=
 =?utf-8?B?NndRdHZBbVR2eHRrbE4wMy95dTJoZUd2MFBTYWxEN2lzUWpnaTBhUjFlem1I?=
 =?utf-8?B?SDZ4WWRNU0dmVWxTcTBZQ1VrRFB1U3NSdWJaRU1tSlpGMDh2aGJiUENQbWxU?=
 =?utf-8?B?ZE10OExwTHFCS2RLWTVUVFJBYzFjejhkR1R2bHJ5cjhKc2l4bG5QOVQzQ0Vl?=
 =?utf-8?B?MUNNYVQ1U255TGlXOXU3NW82U0pkMWRYMVJraFdGZnd1WlFHaVVyQzB2cFJi?=
 =?utf-8?B?UWN4S0srdHp1ZkV2N2VKRUJNNjdWdFpLeXgrVFZvOE1VUHVjSE5tSE96T096?=
 =?utf-8?B?b1MxcVN1amptMUdvMGd3U05YR3ZzeCtzTzFZbGppMGdMZkt2OWU4WWlvc01a?=
 =?utf-8?B?QTZoeSt5Ui9DZXMrVFBLdDFRRWVDSHMyRm53NjcyTVM4blgyU3kzNTFiT0J2?=
 =?utf-8?B?TGwrREpCN3JoczNrTkJnZkp0VERCK2VPeTBwUG80cjNaQlorcjVjMWdROThI?=
 =?utf-8?B?bUhSa0xlcHFhSnF0QW5CdzJISURaajVvemorbVM5amtjUDRucWpwM1lRSkx6?=
 =?utf-8?Q?E5IN9pbSH+URmFN14K8VSX1LR?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ee1e507-40cc-4bac-985c-08dd8e1ee885
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 May 2025 10:55:55.9393 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UmcQIRx6eXa5xdTPN161FM9RQ5opslzJbcq+sU2SbAwskhK+adNv4ERqBXaEfmOE
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7786
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

On 5/6/25 01:38, linux@treblig.org wrote:
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
> 
> sync_file_debug_add() and sync_file_debug_remove() have been unused
> since 2016's
> commit d4cab38e153d ("staging/android: prepare sync_file for de-staging")
> 
> Remove them.
> 
> Since sync_file_debug_add was the only thing to add to
> sync_file_list_head, the code that dumps it in part of
> sync_info_debugfs_show can be removed, and the declaration of
> the list and it's associated lock can be removed.
> (The 'fences:\n...' marker in that debugfs file is left in
> so as not to change the output)
> 
> That leaves the sync_print_sync_file() helper unused, and
> is thus removed.
> 
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>


I've added my reviewed-by and pushed it into drm-misc-next for upstreaming.

Thanks,
Christian.

> ---
>  drivers/dma-buf/sync_debug.c | 49 ------------------------------------
>  drivers/dma-buf/sync_debug.h |  2 --
>  2 files changed, 51 deletions(-)
> 
> diff --git a/drivers/dma-buf/sync_debug.c b/drivers/dma-buf/sync_debug.c
> index 237bce21d1e7..a9c3312dc85d 100644
> --- a/drivers/dma-buf/sync_debug.c
> +++ b/drivers/dma-buf/sync_debug.c
> @@ -12,8 +12,6 @@ static struct dentry *dbgfs;
>  
>  static LIST_HEAD(sync_timeline_list_head);
>  static DEFINE_SPINLOCK(sync_timeline_list_lock);
> -static LIST_HEAD(sync_file_list_head);
> -static DEFINE_SPINLOCK(sync_file_list_lock);
>  
>  void sync_timeline_debug_add(struct sync_timeline *obj)
>  {
> @@ -33,24 +31,6 @@ void sync_timeline_debug_remove(struct sync_timeline *obj)
>  	spin_unlock_irqrestore(&sync_timeline_list_lock, flags);
>  }
>  
> -void sync_file_debug_add(struct sync_file *sync_file)
> -{
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&sync_file_list_lock, flags);
> -	list_add_tail(&sync_file->sync_file_list, &sync_file_list_head);
> -	spin_unlock_irqrestore(&sync_file_list_lock, flags);
> -}
> -
> -void sync_file_debug_remove(struct sync_file *sync_file)
> -{
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&sync_file_list_lock, flags);
> -	list_del(&sync_file->sync_file_list);
> -	spin_unlock_irqrestore(&sync_file_list_lock, flags);
> -}
> -
>  static const char *sync_status_str(int status)
>  {
>  	if (status < 0)
> @@ -118,26 +98,6 @@ static void sync_print_obj(struct seq_file *s, struct sync_timeline *obj)
>  	spin_unlock(&obj->lock);
>  }
>  
> -static void sync_print_sync_file(struct seq_file *s,
> -				  struct sync_file *sync_file)
> -{
> -	char buf[128];
> -	int i;
> -
> -	seq_printf(s, "[%p] %s: %s\n", sync_file,
> -		   sync_file_get_name(sync_file, buf, sizeof(buf)),
> -		   sync_status_str(dma_fence_get_status(sync_file->fence)));
> -
> -	if (dma_fence_is_array(sync_file->fence)) {
> -		struct dma_fence_array *array = to_dma_fence_array(sync_file->fence);
> -
> -		for (i = 0; i < array->num_fences; ++i)
> -			sync_print_fence(s, array->fences[i], true);
> -	} else {
> -		sync_print_fence(s, sync_file->fence, true);
> -	}
> -}
> -
>  static int sync_info_debugfs_show(struct seq_file *s, void *unused)
>  {
>  	struct list_head *pos;
> @@ -157,15 +117,6 @@ static int sync_info_debugfs_show(struct seq_file *s, void *unused)
>  
>  	seq_puts(s, "fences:\n--------------\n");
>  
> -	spin_lock_irq(&sync_file_list_lock);
> -	list_for_each(pos, &sync_file_list_head) {
> -		struct sync_file *sync_file =
> -			container_of(pos, struct sync_file, sync_file_list);
> -
> -		sync_print_sync_file(s, sync_file);
> -		seq_putc(s, '\n');
> -	}
> -	spin_unlock_irq(&sync_file_list_lock);
>  	return 0;
>  }
>  
> diff --git a/drivers/dma-buf/sync_debug.h b/drivers/dma-buf/sync_debug.h
> index a1bdd62efccd..02af347293d0 100644
> --- a/drivers/dma-buf/sync_debug.h
> +++ b/drivers/dma-buf/sync_debug.h
> @@ -68,7 +68,5 @@ extern const struct file_operations sw_sync_debugfs_fops;
>  
>  void sync_timeline_debug_add(struct sync_timeline *obj);
>  void sync_timeline_debug_remove(struct sync_timeline *obj);
> -void sync_file_debug_add(struct sync_file *fence);
> -void sync_file_debug_remove(struct sync_file *fence);
>  
>  #endif /* _LINUX_SYNC_H */

