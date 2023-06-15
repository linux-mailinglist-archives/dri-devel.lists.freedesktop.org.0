Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12978732031
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 20:46:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA82310E0CF;
	Thu, 15 Jun 2023 18:46:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on20603.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7eb2::603])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D74CF10E0CF
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 18:46:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NFjnPoMw3WKLgrngUj6vn67Dr1OpOK1GV/8wVvlWoV5F0rfY7BNa+hjQWuO9BJcljakM5Ceb/gUMbdNMEqJGinaH5+osYGYLWHGjYmuZzpA7JHCafyZ0jK2ooYFz+HZd65aNvt/SKJ6UTvnuv8UwttsjHyiv6Tw5xImwx5xiROvzLjF2HBZAYXtoxBxWe27z0w7jwXOWgSD8wlLt3hr2oBK/QhlzkWjL19Uu03wjHR9FablgmOn/gWsGScE3RR3OVkjwhR2kV4SbFzo7lLlgjvCys8/xjkBr+0VU1F5jJ5fu7ahUsA5nnbiPGc7lbQZQNTMfIj5Jrpn3CPMOEwgpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0S+5lqMARVB0bInK05Pj44Ww81y88XbPjD3gDayDwE0=;
 b=kA/t2xYS5yV+z4F79VgNzuJLTRwPyWibtjvfpL8eIbTyLEmVLPVNT+nXHgSruBzBiEflfUHo4A7x5xaDtAf5nGF6p4rtzNGCGTQQC33rYpUV8Y8P1W46In13jX+xjabGyj6JTiL6iF2Pif1P2gShpaSkWy8b98J+tqgo9+zXHt01hMtUJIuyIVKOX7nr1Hct2Cr3t585AlGkQenF2nAGKO0RqOR47vt1oc3ML/fO7+crwfNSJ2XZZJjtb35/3hhDhvJ+1kWU1UzLkqKueR3+S3IlooODN3FwYJPbD0t6uaaQxJ0MJhLLETDfALuhwcir+YAj3t98YIY6lVhJH2Y+MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0S+5lqMARVB0bInK05Pj44Ww81y88XbPjD3gDayDwE0=;
 b=aPnVkDsFG1aYlAqqsES1dqm34LPiixSJ0E2ta4Nkg+rhFltjUEaIlxWIOetzRDTbSC2iWZyykemkJxYYU96IiR5L7tPJm98tDpLR15QetmLpHrebLBD7S21UGFhX012PbyPDhCThmxDyN7W0OH2fzG9QMGeeIad3LJMzjtxJnHo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB7238.namprd12.prod.outlook.com (2603:10b6:303:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Thu, 15 Jun
 2023 18:46:03 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6455.020; Thu, 15 Jun 2023
 18:46:02 +0000
Message-ID: <8ecae8c8-ced6-ecc5-b960-995f5ea2370f@amd.com>
Date: Thu, 15 Jun 2023 14:46:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 l.stach@pengutronix.de, tvrtko.ursulin@linux.intel.com,
 robdclark@chromium.org
References: <20230615115630.164098-1-christian.koenig@amd.com>
 <20230615115630.164098-3-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 3/3] drm/amdgpu: use new scheduler accounting
In-Reply-To: <20230615115630.164098-3-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0091.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::29) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: 485eab35-d43f-45a7-5b58-08db6dd0c47a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gmrk+D6K6jyfr2584XabD27GSLfyeYo7NzWfVSZExAjG4YLE1zBjBDPx84HcZiZsMktEJnZKZeQtW0cg8X+4WJqtKFcUUsFjaSSqSbgUuGW+WU8Vf2g7NBX0L9EHW3iXEsFU2Elgt03vqxiMgAfvzjd3mItAdCY5MXp3Z8bS74aWZbL7tf0I6a+ePZfyaKKf/e7Hg7EwGL9YY40dblHW4sfNzUNpELmvPN9lN5C1xCZfSSpo9r/n4BHX/CKN+CnY83kEcIjsc1fe9MdwE9suGDVs7//PuKS5HjYRumvE8aQYYXrH/AeiRhuS9o2Pqv7UIavbySZ0F+yfe7NarwnOs5XSaKNgkPZAcENTleEZhmrvVtUdvVFMTF+wroNcoPwDTpCMI4RpTb4Yo9rjyNYLN52mJYPVQSD9oREhEg53M2usQrUw6nmcZV4u0U+Nge7NpnJ0tG19yBj7uL9aiStIgLnjRd0OpuR0ZzCm6r1BQ9OIFxtIuHBq/juGhdORxHYEXNFXrk8itDL1eoqHuZS1fkTM+8Zdzz2yLo+hGEmGZvR8fLXDyoc8v2lebk/C9QANQh1PEr552ULGaguGNKaQsjcRPQFSLTK7ZGo3StcD2bMHynXHG16UEHB7WKs7w0T5FHPz3o7KJ+8G//JDP+T84A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(5660300002)(66556008)(2906002)(8676002)(15650500001)(8936002)(31686004)(66476007)(66946007)(44832011)(4326008)(6486002)(6512007)(26005)(6506007)(53546011)(41300700001)(316002)(186003)(66574015)(83380400001)(2616005)(478600001)(38100700002)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?a3RQbUFhOXhsK0hrQ3pnNlRhWkk1QUVMcURxbWJUMGVjMEwvUTY3eUMySVdD?=
 =?utf-8?B?ODg0U296TUVJU1IwUmEybnAxcVlZd2tFVlNTZVc2aWVyNVNaMFRjWDlGSk0y?=
 =?utf-8?B?aGVkV0diNUpEaHg4WXVYTFlMcWVrNWJjUDFsNWpISDlyblQ3bU1mOFZibDYy?=
 =?utf-8?B?RHlGOXhLUjhUWFlzUmFRM3l0djNXQS8xNDVxVEg1TzlsODhRRDJ0aUJueXMz?=
 =?utf-8?B?a0Y1YnhHQ1c2eW5nMGY1UEFlTXJQZGg1VUE4WENobmlhaUE1N3Q3Vy9DSmti?=
 =?utf-8?B?THZIZkRQaHFBYkZnNkoxdzdaVTg2dFAwMU5IdzkxaG9kQUE0TVhzOUJNL0E3?=
 =?utf-8?B?YXgwYVgyZVlzQmkyajdvVHpvamtrMmxIRVY1ZWUwV1ZLY01OTVczN2xuQVRz?=
 =?utf-8?B?WmgxYVlSbTVSd1hnbnFWOCtFdGU0REJaamI4ak9jKytxSHNwbUNpRE9hM1k5?=
 =?utf-8?B?eGdXUCsxRUFpODJMTEhMMUp0VzVVM1lrTXdhWnp6bWRoUFhBdlNyQkVoZHZ3?=
 =?utf-8?B?aFk0bHhOVUw4SHBzQ1ZKUGNZampRQXFEdXcyNnJVdkhtWEltNUlyWUJlbU83?=
 =?utf-8?B?YkNOcHdyVnJDUnpHUzMxU2RpNTZSdG8ySy9mOFpvQXNQTkRzdm1pS2pNOWwr?=
 =?utf-8?B?NGZHNjVjL2ZoOWpMQVgyNVMzSzNaTVZwQllYTXZzMkhjR3o2VHFZT082QzZB?=
 =?utf-8?B?MnAzcXBkLy9rWXlRSXlsNDBCOGt2WHlLUjhZNUh3eUNDZS9nNlJ2eE5wZ1Fv?=
 =?utf-8?B?YzlrU244bmJYa3BxUDFPdWV0SW5DSVo3dldVckdlc0FQcjZKbmx1d3pJK2hm?=
 =?utf-8?B?TEdJa3hKWFpWWTZYaStBRVd2Tzg2VGVXMjNMb2lOUTNsWC9FYTVzOUpBdldm?=
 =?utf-8?B?UnZWZklna3gwb1Zhb2lrWGVZOEhYNEFwOU1MOElkOEZjN1h1VXpBUXZQL3c0?=
 =?utf-8?B?NFFRbno0SWpiTk5DOVE4WXVEM2FuNzBZYW9jSHptTFd4cXdGOG96NzRnKzJ1?=
 =?utf-8?B?NUZtSVdxR1JCcmpnemF4UkxKSkRkVFl4dUdoZ3NESzErVldEQ1pUSy8za1lT?=
 =?utf-8?B?eFBadWpUOXJPVEw3NFJaMTljVSs3VnlESGNOTUxIdm1mWmlXVnBBSU5PRWtF?=
 =?utf-8?B?Ti9pVi9XN1cwTlBjR0xaUkxQMmZxUkhYcDJQYU5OZ2NSb1JvZUJDQm00dzQz?=
 =?utf-8?B?c2JreHZvNzIzN3c5bHJQNlZ1NzJQSlhNamFoSG5LMDFNU2RlVGV3RlBQd2cw?=
 =?utf-8?B?N2M1SHlPbzNHakJSWUpFU2ZNaFhVUkY3L0R4Q3RmdnZNOUJPWnZVWFZFT1Yx?=
 =?utf-8?B?aDQwTHYzMXJYWkpzZW9JOTl0MnlhZ0t1Q2VjTWZVUFA5djVtM21aeVFVd25a?=
 =?utf-8?B?MHVITmdXWEM1S2pwQi90cmxxWFFka1lsRmc2U1ZZZEVvZXVnVkhNbEgyc2V4?=
 =?utf-8?B?ZEp5c1VnUkYrS25FVy92MkRiQ3NYT2R1R05VUDBqdFh2RS96dHljZFBYRk9m?=
 =?utf-8?B?VjZJYUxFR2U3ZVh3UE5XZ3p4MWFkSTViRFUrc1lldWhjSTNXNFVJRlUwa2pr?=
 =?utf-8?B?dC81NlRseUlPUkEzWWxoVU82NzlEVG1pUGVsS251N1dDM0lTVGVPOU5SOVB4?=
 =?utf-8?B?c2FiaFBVajdOeEI4MWsvZkJkQmlYeWNwL2ZEVEpHZi9OQUhnWXczUnljQ3g0?=
 =?utf-8?B?V0FUQVlmelZxTDFlOGhYcExMZmd1S0NORTk5dCtjU2w2aTRiMnJoQVRMRDBJ?=
 =?utf-8?B?ZU1oME1zY0JoRXVwZjVOb1BvS2VacStKOUV6cDRIZlBUV3I2VVlQUXBmYmt0?=
 =?utf-8?B?WEFZN1ZaVlFEcEg0T3o2c2xDcVRtTjFpaTNmZ054RlRwaWNaK0JDSFV2Tito?=
 =?utf-8?B?TkFLOHBaU3hTYndVUWZPWFRLdEEweFEwZFVTUE1SZkhNTFhoczUvSGQ2TnFx?=
 =?utf-8?B?V1V4K2FWKzl5UzF4YW9tcFNZSHhiZFQrMXFBbjlVM1k5SG1RSVY4VHc5Tjl1?=
 =?utf-8?B?RnZ5T0JhZWR4L3N3VThaUS93UGdFa3hQQjNNN0tIMnh0YURiT1BmeGNyS1hz?=
 =?utf-8?B?RFdpL3FOV1lUaTg0bEJQbVNHMjhra2RwT3RLNlhWZVp6MmZQYy94akhTZkpy?=
 =?utf-8?Q?vL/o=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 485eab35-d43f-45a7-5b58-08db6dd0c47a
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 18:46:02.4898 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4mnWshNlBeYXAch71bAGsENNkruFfT272qe9N4zMR/l0Wjk6lReqEulhNeomRbwf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7238
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-15 07:56, Christian König wrote:
> Instead of implementing this ourself.

Spellcheck: "ourselves".

Acked-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c | 52 ++++---------------------
>  1 file changed, 8 insertions(+), 44 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> index 1445e030d788..f787a9b06d62 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c
> @@ -163,41 +163,6 @@ static unsigned int amdgpu_ctx_get_hw_prio(struct amdgpu_ctx *ctx, u32 hw_ip)
>  	return hw_prio;
>  }
>  
> -/* Calculate the time spend on the hw */
> -static ktime_t amdgpu_ctx_fence_time(struct dma_fence *fence)
> -{
> -	struct drm_sched_fence *s_fence;
> -
> -	if (!fence)
> -		return ns_to_ktime(0);
> -
> -	/* When the fence is not even scheduled it can't have spend time */
> -	s_fence = to_drm_sched_fence(fence);
> -	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &s_fence->scheduled.flags))
> -		return ns_to_ktime(0);
> -
> -	/* When it is still running account how much already spend */
> -	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &s_fence->finished.flags))
> -		return ktime_sub(ktime_get(), s_fence->scheduled.timestamp);
> -
> -	return ktime_sub(s_fence->finished.timestamp,
> -			 s_fence->scheduled.timestamp);
> -}
> -
> -static ktime_t amdgpu_ctx_entity_time(struct amdgpu_ctx *ctx,
> -				      struct amdgpu_ctx_entity *centity)
> -{
> -	ktime_t res = ns_to_ktime(0);
> -	uint32_t i;
> -
> -	spin_lock(&ctx->ring_lock);
> -	for (i = 0; i < amdgpu_sched_jobs; i++) {
> -		res = ktime_add(res, amdgpu_ctx_fence_time(centity->fences[i]));
> -	}
> -	spin_unlock(&ctx->ring_lock);
> -	return res;
> -}
> -
>  static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>  				  const u32 ring)
>  {
> @@ -257,16 +222,15 @@ static int amdgpu_ctx_init_entity(struct amdgpu_ctx *ctx, u32 hw_ip,
>  
>  static ktime_t amdgpu_ctx_fini_entity(struct amdgpu_ctx_entity *entity)
>  {
> -	ktime_t res = ns_to_ktime(0);
> +	ktime_t res;
>  	int i;
>  
>  	if (!entity)
> -		return res;
> +		return ns_to_ktime(0);
>  
> -	for (i = 0; i < amdgpu_sched_jobs; ++i) {
> -		res = ktime_add(res, amdgpu_ctx_fence_time(entity->fences[i]));
> +	for (i = 0; i < amdgpu_sched_jobs; ++i)
>  		dma_fence_put(entity->fences[i]);
> -	}
> +	res = drm_sched_entity_time_spend(&entity->entity);
>  	drm_sched_entity_destroy(&entity->entity);
>  	kfree(entity);
>  	return res;
> @@ -718,9 +682,6 @@ uint64_t amdgpu_ctx_add_fence(struct amdgpu_ctx *ctx,
>  	centity->sequence++;
>  	spin_unlock(&ctx->ring_lock);
>  
> -	atomic64_add(ktime_to_ns(amdgpu_ctx_fence_time(other)),
> -		     &ctx->mgr->time_spend[centity->hw_ip]);
> -
>  	dma_fence_put(other);
>  	return seq;
>  }
> @@ -900,12 +861,15 @@ void amdgpu_ctx_mgr_usage(struct amdgpu_ctx_mgr *mgr,
>  		for (hw_ip = 0; hw_ip < AMDGPU_HW_IP_NUM; ++hw_ip) {
>  			for (i = 0; i < amdgpu_ctx_num_entities[hw_ip]; ++i) {
>  				struct amdgpu_ctx_entity *centity;
> +				struct drm_sched_entity *entity;
>  				ktime_t spend;
>  
>  				centity = ctx->entities[hw_ip][i];
>  				if (!centity)
>  					continue;
> -				spend = amdgpu_ctx_entity_time(ctx, centity);
> +
> +				entity = &centity->entity;
> +				spend = drm_sched_entity_time_spend(entity);
>  				usage[hw_ip] = ktime_add(usage[hw_ip], spend);
>  			}
>  		}

