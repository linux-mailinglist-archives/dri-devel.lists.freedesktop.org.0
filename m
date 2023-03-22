Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3B476C5928
	for <lists+dri-devel@lfdr.de>; Wed, 22 Mar 2023 22:57:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D249610E2E9;
	Wed, 22 Mar 2023 21:57:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on20616.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8b::616])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B301210E011;
 Wed, 22 Mar 2023 21:57:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUV3HBRSzRMFU8qkdV4ubf/Y20+0GF8Dbm5n/0hErQC3/s484i5cfjPGuWPqrDzCXoObIoJ2eRe9lLm6wA70/KESStYrFnbspqunkG5s2QZ7KMcT9jFLftTOo4PbABEsl3M+WrnxdqjWLE+znim0iUw8s+I24SgHdVPz3KjejkpL/Sl6FIwZDNB+vUEbRhRgCs3nG7WzUyYQBmokcsWE0KDbTXBmIxe7bNM7UaHV9smx4htQMwbsKqqt8R6RBTlloQtzm+rGw17O4/Iu/rv0OEJ6k0uGJOnxp4hChXC9lVkeIfypTWbEnNi0MnGwwJPZKRP6Qzk5Z9htNjtJAGnkmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m5r6wXXKuYuO44nPb54NoLD9n8m7PSOoAbF/+ILvumI=;
 b=NdE7DeMqNCvZwvAfUZnhwnXv55tfXN+LC/fcjHLoK4fJNrTkZgYlfHRzLwMqlKiVuWoOuYmJZCuz0lZkZO1srl4nckdeQP8VYn//aj863kCjm4lS8aUSdrfDdMU3xZZrLK/xA+yoHQok4zx874p0Ryfd9dQTRqxDYuhSLGYrueN3oMSI6HX8af3aXKTkFGgJcqknpUsx1kROFMOFx0qdyXV3CwMqHRHOnTNpVIkxlQBCN/YUJEkra1KPHHIO66woUeJGRuXVfsR+igiZaCN4r5xht+Evb4dQLRLa3MVfkh6uadrOg297254L7/6mzaricg4H/eBZMYmfZGrCscYoGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m5r6wXXKuYuO44nPb54NoLD9n8m7PSOoAbF/+ILvumI=;
 b=Iy7UtaJ9JzhQFvtycGCXkOqG5ITvQ0dJjM0QK0KZABocTqXwW+Z4LYGDVQWdWyUwgAqEZPEcasyfYu557OlWX2nMpJ/r8NZyX8LCgx2cnvctu2AHbHrM6mhIoVm27rowwaGtSSU8zf4NfmN8/Qx2PkLOAfHf8FKP41ShbxSLRgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by PH0PR12MB7009.namprd12.prod.outlook.com (2603:10b6:510:21c::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.27; Wed, 22 Mar
 2023 21:57:02 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::23f:22c1:b49e:b77e%5]) with mapi id 15.20.6178.037; Wed, 22 Mar 2023
 21:57:02 +0000
Message-ID: <4c7fa5ea-6774-408e-e8a3-e09eeb6212ed@amd.com>
Date: Wed, 22 Mar 2023 17:56:59 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 32/32] drm/amdkfd: bump kfd ioctl minor version for debug
 api availability
Content-Language: en-US
To: Jonathan Kim <jonathan.kim@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230125195401.4183544-1-jonathan.kim@amd.com>
 <20230125195401.4183544-33-jonathan.kim@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
In-Reply-To: <20230125195401.4183544-33-jonathan.kim@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: QB1P288CA0013.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:c00:2d::26) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|PH0PR12MB7009:EE_
X-MS-Office365-Filtering-Correlation-Id: 6a40dead-f9fb-416c-f5f0-08db2b205dee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +AHT2KZCCxcUJLDsOrMe3q3KDM5ehHZdUBIycuBbCa3KJd3rqfkXAozz/5bYVXyZOG0/nTm7EAHb+f7jdapeBWoXaJ1mjQZmBZhD0am7kaRFKXSlDvif9J2yDHxhakO6g6ow0X+Ji787k8n8elVKff88bQGfPW26myDnMCxNysLLGtrMU/4uDgKzqu2ctAe/p8GVNEdHC3wI7qHwm92TJZC6TKNTaJpr0IpaDmFpic7KcsUw1CP82Nb0+MqqiXPIhqQLeL3AxxJD0gOhgmgfIo2Jcy4K87UoFNM7jnVkr6P4KjMFwLIwOdabh1fnaGIxETv39yXMkDT67vm21L2F75PzeC31khtWubVB3Qm5UbLU9aIsMkOEcpjgjcp5JBwnsOkOrwEC34yPwCPRnKtdtmNvAwIN5dFfSlZ3Cs5ENKPo9G+wQ92jhTzZDb3YYpQXKxDgR2s7a6k8N8L2XcowRH+VVr9thXXJQLJO4NwYiEF4zZkPZUSyrgcN7imkIYl0wwRETx7v3PPInhkUV1OdIoQO9CP/Frd3XC4785dRj8NqQu8SUR6muIvY7MDVFhDzMhINQYUmKNWfumi8vaq41kGACvEGpXO8uTCuBBFEe+0/TNRSia1rFkWwKNqyEZJVlYL+q4UzpVE+xn4oxs1t6et/kF2pRnIGUIzNWhUav48K8qI2r6Q4qn9lVnlhe1iwkhQfXFhd1BQClImMTdDgnVkIITPFU99WBUiyb3VSQiA=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(39860400002)(396003)(376002)(136003)(346002)(451199018)(31686004)(6486002)(83380400001)(316002)(6512007)(6666004)(478600001)(31696002)(450100002)(8676002)(38100700002)(36756003)(26005)(41300700001)(86362001)(6506007)(8936002)(66946007)(186003)(66556008)(2906002)(66476007)(44832011)(2616005)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RjkzNlFRTkxvTWtTVGtiQTJ3MFdzK0QvQnR2R2Z0U0s0TDN2VFRlS01EUWVx?=
 =?utf-8?B?ZFdxNEVnK3lOeStycjhOaytDUzVxc0d0VzZDOWZjZVZSWGh0YTQydEpPZWhq?=
 =?utf-8?B?U0Y1M0NEcVBGb21QajY5cytSR1YvTktCaS91dGdJVXlXWWtmTlI2S1cvNDBH?=
 =?utf-8?B?TllCL0ZWdWYwTjg0VklQeTYycFpFWEkvL3ROUS9CSWliSWlsbGdpOE16ZDZR?=
 =?utf-8?B?YW9OTk55eVBHYU5paStRWEtPRGdvZHptMkdQTUV3cU1xQlhIN0lsTWFlVDRG?=
 =?utf-8?B?Rm8rQzdhMXNxNXdNbzF0NU9HNmFydmx4NTluazFJVWtGY2pUZ29DZUxmZ1Qr?=
 =?utf-8?B?cW1IbjdnVGRWRjNBdTNsNENZK1I0VXl1Y3ZOdmdsZ1lHQ2dLeURVVXI2Q0Vv?=
 =?utf-8?B?bSt4amthdEZxRmFPYmlwWEJNZEM2eU8rb2tVanlpand3ZHRTdTgvMS9zUVFQ?=
 =?utf-8?B?ZVFOYzhxSzg1blRqbFZ2Vm5GcDB0dW9oWHg5dGxqYSttekN6Tm5KdGgvWXNy?=
 =?utf-8?B?aEQ1eWlxNnEva2hxSkFVWnVyWU5pN3p3RFMzVDFaTDlNallrY3hNUXRXTmlj?=
 =?utf-8?B?c2o3RTZ4clVEZFAzbmdOMzVQZlRHRjREQXYwTkc4SUFjYk14c3ZtSnJ4VEUv?=
 =?utf-8?B?OENuY2g3TFo2cU94WS9CTmNNL3pSS0VCcGpnUnUwUE1wTEFIZWYzNkswR0gx?=
 =?utf-8?B?QlhaWTNrMjZoamxQVUhwM3plT0tLNW1JZS9OYStZOWNkYjd6RGx2VnVYci9B?=
 =?utf-8?B?cXA0L3VYaHVoRmlLdlU0SXJJSEI0bUZNQXcwclVRYlZ2OUhvWUFmcDhheUNU?=
 =?utf-8?B?eXkzMEZVTWJlYXJ0a2REem9zcTF3czUxaUdxY3pmZWRjOHBFeXg2WVgwNXdo?=
 =?utf-8?B?S0JEbzBnbWpRb0U2b3JSWDJuN21CQkMyeTVVeEZDbndXSGt2SFFHL1hscWpR?=
 =?utf-8?B?SW5vbEFyZXhPc0xXTEN4TGNIYnNTa3YzL0swY0I3UVZjZnpoMW5LbTMwWHBp?=
 =?utf-8?B?TjZWOVNyc0pqVXJVdkI2eFcwbWhScnlXOUFKNlMwdEpjL3VnYXV6OFpZNnZr?=
 =?utf-8?B?ZVJhUm5MSFRWNDBzaVVzWFA1TFhJclZaVkRMbGV2SGw3OGJHeGZvU2w3czU2?=
 =?utf-8?B?ekh1T2t6UHRXTnpBREJmeGtyazBWWFFrRnRyR3FlN0VTaXozK0VLZmIyL0Vj?=
 =?utf-8?B?STRFditQMmFPRWtYYlN4ZzBaSlBXbjQ1RUlMREpIUE5iWUpVeTFPaEcyQlZV?=
 =?utf-8?B?V3QyUE9EZ2xBUmlHRWVsUlFuWVhDbEI5eTNGREZTZm1BVnVyOUdIcExHOHFZ?=
 =?utf-8?B?Tk9tZkVnTXQwN0ZVUnRCL1V2ZnI3ZHV1cml3T3l1QUxBbFVRRXhIdFNpVkFi?=
 =?utf-8?B?b2tkbGcybDdrb1ZrMXY2b1E5WTdjU3BPRjBUbXFqYjBwd0tsQ2QzWDhNREo4?=
 =?utf-8?B?QlI5YURNd3I4dXpLOWI0T0V5ZzRPcnZWYmNVV09qUXdXdTVxMHdwU3llWDYw?=
 =?utf-8?B?Q3FzL28xMzFlZ0RrUXdKVEJzZDhCWldIc2d3LzJqMzF5emFkWndQWngxR2J1?=
 =?utf-8?B?M3RtckhlTmh2UmdWSldqcUd0ck5HYWpHTElNaXFPcWl0M2VDcytXdnhkZEJW?=
 =?utf-8?B?THNPYVN2czdkWEpTcnpnQlg1M3QreEYzeUdnY2ZKNlZUenJienFoTXVpZlpo?=
 =?utf-8?B?eDN1VmJTb1VXdDFidis3UUM4YkdxbDVnUXpwR2lkZy81K09lQ1hMM29OYXlX?=
 =?utf-8?B?TFhmcGlxcnBkV0ZESzgyWGFoNUpKeGVxR0ZGU3NQd3N4VlMrZ3p4RHcrdWhw?=
 =?utf-8?B?ZlFCNnMzbzQ2bk1hQWE1KzAxOWFGa3pzazE3S2E1TytlL2pTWllLN1JGcFM0?=
 =?utf-8?B?Q0tpUDh0anlHNnlHQ05OSlBSVkFsd3hxejB2NCt3MktjSWp1VThFeEViVitC?=
 =?utf-8?B?OFJmaWlRWk9NS3B1a25ubVNOcHRLOXFsNTNtRU5ydFdTTVZSNFozakFNdWUw?=
 =?utf-8?B?dVZlK1lJMldHc1oyZ0EyVisvVk4wb1NhV2VIWklXN3MwbHg0VlYwOFpqcTg0?=
 =?utf-8?B?ajN3cHZqYUhpRUhLVFcyclBBTWNYTFpXcXo5ZFRRTytkRUlCTFl6SVcyUkdK?=
 =?utf-8?Q?nPZCt0bJme6UkJNJtmAAhG/ZG?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6a40dead-f9fb-416c-f5f0-08db2b205dee
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Mar 2023 21:57:01.9821 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HNd3CgLZIjCH934JgxsXeXF6Me9IuqTgZxsZt5kCEftKA9pSKocKqTAjs0XtTII7BCbIHUw411O0nED/MQ8KNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7009
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

Am 2023-01-25 um 14:54 schrieb Jonathan Kim:
> Bump the minor version to declare debugging capability is now
> available.
>
> Signed-off-by: Jonathan Kim <jonathan.kim@amd.com>
> Reviewed-by: Felix Kuehling <felix.kuehling@amd.com>

This needs to be bumped to 1.13 once you rebase on the latest staging. 
With that fixed, the patch is

Reviewed-by: Felix Kuehling <Felix.Kuehling@amd.com>


> ---
>   drivers/gpu/drm/amd/amdkfd/kfd_chardev.c | 1 -
>   include/uapi/linux/kfd_ioctl.h           | 3 ++-
>   2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> index da74a6ef4d9b..c28d4b2dd0ef 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
> @@ -2896,7 +2896,6 @@ static int kfd_ioctl_set_debug_trap(struct file *filep, struct kfd_process *p, v
>   		if (!r)
>   			target->exception_enable_mask = args->enable.exception_mask;
>   
> -		pr_warn("Debug functions limited\n");
>   		break;
>   	case KFD_IOC_DBG_TRAP_DISABLE:
>   		r = kfd_dbg_trap_disable(target);
> diff --git a/include/uapi/linux/kfd_ioctl.h b/include/uapi/linux/kfd_ioctl.h
> index 9ef4eed45c19..a0efe1ccdbd6 100644
> --- a/include/uapi/linux/kfd_ioctl.h
> +++ b/include/uapi/linux/kfd_ioctl.h
> @@ -37,9 +37,10 @@
>    * - 1.9 - Add available memory ioctl
>    * - 1.10 - Add SMI profiler event log
>    * - 1.11 - Add unified memory for ctx save/restore area
> + * - 1.12 - Add debugger API
>    */
>   #define KFD_IOCTL_MAJOR_VERSION 1
> -#define KFD_IOCTL_MINOR_VERSION 11
> +#define KFD_IOCTL_MINOR_VERSION 12
>   
>   struct kfd_ioctl_get_version_args {
>   	__u32 major_version;	/* from KFD */
