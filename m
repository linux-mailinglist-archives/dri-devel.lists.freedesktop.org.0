Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEECE4FC10C
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 17:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD9910E346;
	Mon, 11 Apr 2022 15:38:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6574B10E346
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 15:38:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OA97M4bX+IGtmbXE62w0RBEmRQXPFn993Pq8lLVLJS/Wotj0lw2WSZ/7Q8p50wDKSKpm4FKxWW0w7Dh+MQzHvAaAsHITebqo2Pm2U4aXeUuneljL58g2Hpg6Mzqo9FRC17UJctTBzl+5zqADc9DI8oRgkbgkmhuTPIge8gLMgxmA6gqh8r4xgTazJeks24Iby0pNLFzshiN5w7nxHyc3QuHbh+2yQhrbL98qQIEX1VTDwxSHnO0sBwOpLf1trm8wz+JnYXEfPUPZZlqCYZj58VJc41dPYedua5/rGFeGgNycPpNiNUWMVS4k8/NEERU6lg8Nv81Eh/KkjLfKJSEFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WKaKVUlvjWb+LHbYHXE5l3c3J0t3CGFVH3DnWH4POnk=;
 b=ceY4lPW10yEVTPBirItBeT+ixXVDTDEGNw21WGV4eKBaoGHbwq6cduYYwHEtwiMY6ryKxsyuj6szxL9RZOt5KcPFQyl7AVkRXojwyOioxY2LYiq+uCTOnCEfz8Erc4AMjBmePRCpTId94bg5ge5L3KI9KnQzG7qupfuVKFPjWDbjPD4cXw/28o2VAQVX2WIcqq8qBpbr4peEYSFuTvKJ+UmKcT5hgSFZhqRdJpbzC3JF3TUXPVS2s5sbswEUlL3CT+LjQn+aJiDwX03Qq3AwZfp6qUfhNm5Amm0UB2vyXUZDMe2cUVveP176qfTpzQDAWzd/sjs77iVX1o+F9H0ejQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WKaKVUlvjWb+LHbYHXE5l3c3J0t3CGFVH3DnWH4POnk=;
 b=1rAQxTunY4UAWjpFz21dhOqmED7uVnqEH9PR+72LsuqsFiUn5CyMceDii0kUKEMYfo/52j/8OTkAk+AlYzfM4Mc8+8tzk55F53yH41eOStP/C3TPaG3gVg6wmbUFvFBvENrr6mLYzpqV5HTMbOREjLVi4S6TEZXVxgNNsWLtjQo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by BN6PR12MB1538.namprd12.prod.outlook.com (2603:10b6:405:4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Mon, 11 Apr
 2022 15:38:41 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::4967:ac3d:d5eb:ebb4]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::4967:ac3d:d5eb:ebb4%9]) with mapi id 15.20.5144.029; Mon, 11 Apr 2022
 15:38:41 +0000
Message-ID: <25b55418-2858-67a7-5feb-fca2b61d59b8@amd.com>
Date: Mon, 11 Apr 2022 11:38:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/2] drm/sched: use DECLARE_EVENT_CLASS
Content-Language: en-US
To: Chia-I Wu <olvaffe@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220408204612.596597-1-olvaffe@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
In-Reply-To: <20220408204612.596597-1-olvaffe@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT2PR01CA0027.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::32) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e305ba84-42ba-4802-877c-08da1bd15aa7
X-MS-TrafficTypeDiagnostic: BN6PR12MB1538:EE_
X-Microsoft-Antispam-PRVS: <BN6PR12MB153868DA5272D9A70D4E815DEAEA9@BN6PR12MB1538.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7wPvJEv7MSaNwVmjtOFecB9+DrvtMFuFiUH0/HPwM0mJhjXi7vDhygxP4QjbdSB8qU3vvauD7+ORNgqjU2aLCa0Pg1dnHzAoyTXMqZtCAwEDYsbcFl68hSTqFJW4KxSLYY4v3PB/RIFTTcPDocL2mZHfJMlu/DO2iAFRjBXJoKjzqksqCTEqjHM/J1ezZ1FdHCZiNT6HbfHvnQPngRLILDoVKidTMPkZKMP5WaM0oA2/VLtHlUkReCjNhPeJzMFg6Q7+g0a/dQ7ldr309Jl9E4ENXRywGohheJPhLYk9s/sJ80uqi1zoDNAvEtTNFuaRyGJCchUdeljlcgMHipxanvdqZQM7HN7ebFRJ4J39FQFF1gIQZyugcRopT4dNE22225uPYCEyref4I2Bx2oaGT66cn1AosZH4iYD3xFf/1lPRXnIJhxZi3YnSfElFZbR2C/fa2TIY0U8skEnso7/HI3MRvCZGoSzEDWxwx1yMwvUyxRKnjYpEl7w0fqGuUn8QfF47MvCGq5EEMmq9yHjbERh4C7d/DezgUJK3rFkwmwrOpxsjW2+hMjwd1fcU2r+JCpyXN90eIMkIjNwTu2mBo7HL22r8GTEDG5kGZyyqbS0Di/aba6/zqH+EKuXwP9VGr35V5JBWWRmKaU1M2p8i+TqeIeB4W96+Es9MG+NnrzT1u8MYnbWLIRTI7z0LW5aW5mHM6FwKw3JdsCAe9F2/x6lIw49WrdnQdeK6BDsWxBU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(6506007)(83380400001)(36756003)(31686004)(2906002)(2616005)(6512007)(53546011)(31696002)(66556008)(8936002)(86362001)(38100700002)(44832011)(6486002)(508600001)(66476007)(186003)(316002)(5660300002)(4326008)(66946007)(54906003)(8676002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Ly9XR3Bibk41YnNRcmp4a3JSZTZoN2QwYlBiWjhIYWZ3VUxSTmZUVjRISW1B?=
 =?utf-8?B?OGxrdXhMTlEvRVlZcTdHK1MwdXpOU1FqWktWeVdzVGo2a0tkZ3R3RzdXeUZQ?=
 =?utf-8?B?V3BHcFpzK1VyT0pabXdGSnJvSm1xbVhUTWh3Y2Jrbms2Mis4MXp3dUZCSUY3?=
 =?utf-8?B?TzYzb1gxdFlKWC9FV3BBbVp1MnovMVZ1MUxJRlJtUkRhK3UwTGtvVFg5RFlz?=
 =?utf-8?B?aUwyVFhKQkhnSXhNdndXdGNUeVc5Q2xwWDZQVUs1NVpkcklCOFFGVjB5dzV5?=
 =?utf-8?B?eFpmeFQ1RmRkSHBvbU5FWGlGeWQ1TlY4QjNiSW8xWjNlSHJpcmp1RlJJSE9Y?=
 =?utf-8?B?Q2pIcExNNXNGZGtHcEU5b3daZ0VIbmhrbVFoaUc3b09sOU1MOTVGUUtWZjNT?=
 =?utf-8?B?aEluRDcvUUU0UE8weklDR1R3N0NqZGNLZGpQZXVUdksxSjJGaFJTa21BWTVR?=
 =?utf-8?B?bjQ4V2hGbGtBbm83RmttRzJKYURnbkcxTlNQOGN4ZW9PL2wwSEg5TzRkSHA4?=
 =?utf-8?B?TTM5eU5LbHhPZ0RtSENROTlpM093dlg1dEN0WFZtVWo2RnNhMWkvZkEvZG1C?=
 =?utf-8?B?THRMSjhvNm1IQnQyQndVSlV1dWdUY3o1cytVcnBQN3RlbzNoSWlYRU41VFNL?=
 =?utf-8?B?WXc4S1MyaFVNRkdSdGpyZTVMQzNEM0VpUE91WVI4ZTFWS3dmeVJ1UlJOdlh5?=
 =?utf-8?B?Nm41NjdhcDEwaDZtTlNla1NweXJ0MjZhQngrVDhSWjRpTXY4dTNtdTF2ZjdU?=
 =?utf-8?B?NGVZM3pieE5rbTFMY0xzOXkwRDUyNzMzSncwU28xUHkwSjFhUzRTcm82Y0N2?=
 =?utf-8?B?YXdDdXdUOTZwc0wwQ0lvOVNrMk1oK0VIWE9TU1hkeDVJNlZWS09sK1B5N21M?=
 =?utf-8?B?WkdmbWJOZHRVa0JyRkZFZTY2cnBhamIvRklXQml4eHFnTTlFOWZjMXVMUkY3?=
 =?utf-8?B?MjFVbmdtNXk5dFN1OVhHbFJyb3U0M0psLzVsVWRxWEs5bnFDY1dMMjZZZk5Y?=
 =?utf-8?B?U2ptNnFwOW1pK2JmOXRnRDQra2lEUzlCYXhQVWd5alBnTmxVMFpHZHc1aGds?=
 =?utf-8?B?VXZUNy9VaEtabHZmRm5JMU53MU0rUjhUVkZ1QjZ6djI2b0FZUmVvRnFIblRT?=
 =?utf-8?B?SmJwTFdjZmJaSEtNeTFUaXBoL3dTbUxPREtsdVg3S2c4Zkk4ZGhFOUcwMzFN?=
 =?utf-8?B?WWI4cUJWYVUxdDQxMFN1dTQ3aU04ZUZRYTE5UW1NWHdhdnYxZDA5d3ZiWGEy?=
 =?utf-8?B?WTh3d1pmT3dBaCsxWjJ2ZGplb25raXdLM2pmcmxOYUM0Nm5FakdQdURSUGZZ?=
 =?utf-8?B?SGJWOGVGS2ZyZjJtQVBGQ05vWjUzWTQxVWtvdFdQTndPaHl2VS9ORktJU1Bv?=
 =?utf-8?B?OGxJMWdocFBTc0phRkN2ZWJybTlLV09MT2E0QStpclYzQ2FyaU9sbFU0alBr?=
 =?utf-8?B?L0lQbjM2WXdBZDJnOVU4cWhkY2VPRUl2NnMrelZIcWlHVnM0WmdBSm9rQWVN?=
 =?utf-8?B?UVpZSmQ2ZjJSUU1Ud2hvMmhpQ1hkZ1ZiOWZ5cmFQNHdlNjhzR2V5SmMyZEk4?=
 =?utf-8?B?TVJ0RXY1VnJ5ek81TEpQb3oxei9IWXMyL0JXbzBKMWZCWG85YlZCU1RFdWVT?=
 =?utf-8?B?c3FGYlhYck1TSkQxcEhTdjBrL0RDTisvYkZ6QTZmUVQ0U0pyYmVRRENoNUhS?=
 =?utf-8?B?eXhnTkNnVVZPVkxtazE5NTNWdGFDL3B6QU00YkFoR3p4WGs5cDF5OUFmZXZS?=
 =?utf-8?B?bjk1cFVTNnNMUW8vQXgrR0ROUWlaSDBkUUkwU3pnaEgwVTZSOGp0aHF3aVk5?=
 =?utf-8?B?ZGtTb1ZzZmtCMHJvLzlPZ09YdXVxT3hLMVJ3V3RMU2tSbFQyMUo5ZVc4R0ly?=
 =?utf-8?B?UFA5T28rQjBPYmcxV0FSMkJmVUpwTVJ6Y1kwYTRpelZycVFjUk9ZdjY1Ukx4?=
 =?utf-8?B?N1BjYy8rWGxjZVo1Z3ZMdHNrbldkaGJzcXp4UkR2TUZpeWNxd2RSZ1V5Vnh5?=
 =?utf-8?B?V0FIbUxRdlpXSWpaRVVPMG1nRUt5eU9ITm9lV0Zwa1pFczVrZmg4VnV0K0Fj?=
 =?utf-8?B?VkV3Y0d3U1M5WWJCbkRIaVVBMEVPQkVBRWhGNGNvNDd0NE9hb1VGUUo2Z0Nn?=
 =?utf-8?B?MlhrekVpdlBvQk5UTnIxZXk5SlRPNEdJZU42bXFWU3F5aXVVMURvZkNWTFVT?=
 =?utf-8?B?eFpSZlpnU2t2YitMU2hTLzRmUHd2WDMvYThKL2VNdWdORE1ickE1V3AyN1d1?=
 =?utf-8?B?cFFUbUxWT1JNczArVUpqbnNVS2dXSzBQeDIrZUVXdWFjN1RBTGZqY0dyNCt1?=
 =?utf-8?B?UWpiM2VRMUp0MWFLOXNnZXBJaXVvYWkwTHlTNjFuaGNLMlRMQVlIaEdMQ3Iw?=
 =?utf-8?Q?5Oi6SWRs1d3xNwRNNsvWPvrYyg0hGNxqSiTiUCjDciAB9?=
X-MS-Exchange-AntiSpam-MessageData-1: CmDlXpRjru59qw==
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e305ba84-42ba-4802-877c-08da1bd15aa7
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2022 15:38:41.1264 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZMe8tbGbY4q07B7h6n/iA0bAJLl1gHeDyA+5giqYsqWyHlbq/gTtV43AZAJjLd0JkaLJcfTcJC9ZV/cCCvf/JQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR12MB1538
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
Cc: David Airlie <airlied@linux.ie>, Rob Clark <robdclark@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2022-04-08 16:46, Chia-I Wu wrote:
> drm_sched_job and drm_run_job have the same prototype.
>
> Signed-off-by: Chia-I Wu <olvaffe@gmail.com>
> Cc: Rob Clark <robdclark@chromium.org>
> ---
>   .../gpu/drm/scheduler/gpu_scheduler_trace.h   | 31 +++++--------------
>   1 file changed, 7 insertions(+), 24 deletions(-)
>
> diff --git a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> index 877ce9b127f1..2e6eda920fe1 100644
> --- a/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> +++ b/drivers/gpu/drm/scheduler/gpu_scheduler_trace.h
> @@ -32,7 +32,7 @@
>   #define TRACE_SYSTEM gpu_scheduler
>   #define TRACE_INCLUDE_FILE gpu_scheduler_trace
>   
> -TRACE_EVENT(drm_sched_job,
> +DECLARE_EVENT_CLASS(drm_sched_job_entity,


I would just call it drm_sched_job since that what it is.

With that the series is Reviewed-by: Andrey Grodzovsky 
<andrey.grodzovsky@amd.com>

Andrey


>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
>   	    TP_ARGS(sched_job, entity),
>   	    TP_STRUCT__entry(
> @@ -59,31 +59,14 @@ TRACE_EVENT(drm_sched_job,
>   		      __entry->job_count, __entry->hw_job_count)
>   );
>   
> -TRACE_EVENT(drm_run_job,
> +DEFINE_EVENT(drm_sched_job_entity, drm_sched_job,
>   	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
> -	    TP_ARGS(sched_job, entity),
> -	    TP_STRUCT__entry(
> -			     __field(struct drm_sched_entity *, entity)
> -			     __field(struct dma_fence *, fence)
> -			     __field(const char *, name)
> -			     __field(uint64_t, id)
> -			     __field(u32, job_count)
> -			     __field(int, hw_job_count)
> -			     ),
> +	    TP_ARGS(sched_job, entity)
> +);
>   
> -	    TP_fast_assign(
> -			   __entry->entity = entity;
> -			   __entry->id = sched_job->id;
> -			   __entry->fence = &sched_job->s_fence->finished;
> -			   __entry->name = sched_job->sched->name;
> -			   __entry->job_count = spsc_queue_count(&entity->job_queue);
> -			   __entry->hw_job_count = atomic_read(
> -				   &sched_job->sched->hw_rq_count);
> -			   ),
> -	    TP_printk("entity=%p, id=%llu, fence=%p, ring=%s, job count:%u, hw job count:%d",
> -		      __entry->entity, __entry->id,
> -		      __entry->fence, __entry->name,
> -		      __entry->job_count, __entry->hw_job_count)
> +DEFINE_EVENT(drm_sched_job_entity, drm_run_job,
> +	    TP_PROTO(struct drm_sched_job *sched_job, struct drm_sched_entity *entity),
> +	    TP_ARGS(sched_job, entity)
>   );
>   
>   TRACE_EVENT(drm_sched_process_job,
