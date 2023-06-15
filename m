Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B53F7732030
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 20:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01C2910E0A0;
	Thu, 15 Jun 2023 18:45:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2087.outbound.protection.outlook.com [40.107.212.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C4E410E0A0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 18:45:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TTYE1DcdDGAbSx8UFSHhrVm7yU/wQRw5b/6Gg53516UqHW7ONfT+CeCi4+O+mGQBFVXRUs9l0ruZ/RsWYZy16v56sp1cjJKY5KbowBMOrUoHvWujwJu92c3lz2Td6akX7MivuSxlayadi7lYEmUXfouiKhZ6eIjI2xYh/be/cgG/LujyojBkQocgzjOpBwttNgt9+tboFlY9BTnn3RLjE/qtxAQdn+ta2JJDjiYQx45cgi1aBx2aa/8OVx6amfH9YTCCmC3/Nt2mg+TulaeRDRhcRI4nk8CI7iu4PS1OR3/Fc1EZ8a8J9QF+fRropQrchxmpokr47QLJrSsOfMDM7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d6RFlmfJ80tC1u30LsoW68GLEu5kiQTYzwnWe8J9nFQ=;
 b=Ph85rDBOJ9K7twxcwv2DNumpZg1uwK7zETE7W5qAsPz73XvQ2Y31agfJo/qdPQPuqSxwQSr2cHdAkxn0ACGY2DkTXclJSFKwOXJDv7IMCeI2IHQdCnLI32XfQXCtT3l4w8N8MDAUEgxstz+CXOJGGR75BiZHpD1dvx95ybTzkiUy05L+G9ocasGqivDjUM461vA1Z8yFsc5SW6J9coARitregylS2Rr7m0VHK7sTrPputaf9G3atM5fTA34mL15IxpMmplqAEagZGthcD2I0cnahITQW57VJBC4vx4BnTIejEdBWtuJa61KztuqdS+1eFtgKXgRf1oSOTImWfYuTgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d6RFlmfJ80tC1u30LsoW68GLEu5kiQTYzwnWe8J9nFQ=;
 b=P0lDJCnTPP7WG7cxYU6O9+tC2Oewog9wCNufruavaoaNHgaOfosBjgoOdxRpuauol5OKza263GOmmff0R9nCJQwp2CAsKXPjDsy0S+edEsP8yZ5SP1c7+wv9q8c9sUNoQhNcv7W7E+zToWKVnuRfeDLwYL/sQq2wRHfvIdZpyEE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW4PR12MB7238.namprd12.prod.outlook.com (2603:10b6:303:229::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.46; Thu, 15 Jun
 2023 18:45:34 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6455.020; Thu, 15 Jun 2023
 18:45:34 +0000
Message-ID: <e4535b8c-b5ef-bbc9-4804-004f408a3eb7@amd.com>
Date: Thu, 15 Jun 2023 14:45:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-CA, en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 l.stach@pengutronix.de, tvrtko.ursulin@linux.intel.com,
 robdclark@chromium.org
References: <20230615115630.164098-1-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 1/3] drm/scheduler: implement hw time accounting
In-Reply-To: <20230615115630.164098-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::8) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW4PR12MB7238:EE_
X-MS-Office365-Filtering-Correlation-Id: 3df25d1e-77a6-4a69-567e-08db6dd0b40f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sA4fwBm9vtsDkTjrXr/AZpruNDOmS5eY3pSacbore2ijlCU5aDRIr7AJexV9ZboV7maqGspoBHzO+MCRlnA9MDZ6WWBKsltfJ7V+JZk+4AkEmgcjJarcgFyHgfjlFB3Vi4uAS84tR0lgg/7zMBEy5GcPTuNiqmNJL5mZM36k0qXvde2oNAYUtNQxolN5ug/59w/vC031+04v0Ti8AT/toP0qu90eoPGTSVLKJVyBGyoeHCKfeKErlN2jZSNh8sDcV9GofaTIPwjYpJuJhfdBpLNQG7DLBjQjwFR0OEbqKSLt1fsJdxKP1Df1QM3AhtJURP3YgiH31iUnm/2y31Z7YmjyxZK18CmaxrEaSHoxEvLteSvfk0C/XiOnHbrG7llz129YOT8kKW/8NYMFfhdAYFKuZNHH0fYD2RUf1nWxxMGfXoquT842fvltrZyIJPgOVZ0Rzxv39x8vmx4qnPplY1oE/pn/Gqgg2btjKsgAjfNTUegvj4QcV0qqMr50CzGbIsSK09EyFzcO9JM745I7dMlyRZ2LI6f13Lma9GWwmdUPYHgN/o09BLSWrLlfQMDVnvhD7QCdG8N2jVa43j9WOxRD+lOwVOSFnup+YjwU5ieiulitP6BvEMzilUyR7tEFKhLhpZDzJa+MSWI2hapHFw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(396003)(39860400002)(366004)(346002)(136003)(451199021)(5660300002)(66556008)(2906002)(8676002)(30864003)(15650500001)(8936002)(31686004)(66476007)(66946007)(44832011)(4326008)(6486002)(6512007)(26005)(6506007)(53546011)(41300700001)(66899021)(316002)(186003)(66574015)(83380400001)(2616005)(478600001)(38100700002)(86362001)(36756003)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RWt3S01yd1lYaVgwQTlLNDlhZ0FvYnRoTU9meXpQNHJJMlQ3eVFzZHhrYnYr?=
 =?utf-8?B?TVgreGVmWlFoR0NYZUdraXo1MEtlazJoWElTMlVRWEZGYUU4TmwzRCtmOFJB?=
 =?utf-8?B?eEFoRmM1UFp1Zk1nNnVjOUVsTGZFZDRyZjBZOTlUMEYvYWxGbWgxLzNtSXFr?=
 =?utf-8?B?U3NhRDl3NG5Da2VZVnpISGxPRG9rby9renVjVW9QU1RYZnEwaVhmV2ZZRlhT?=
 =?utf-8?B?RVZKVnhSZEd0dTNHdzlwZnFGZ0FabTg5TW5iMkNyMG0rZXZ4MjExMUVYdFg0?=
 =?utf-8?B?T2hoZXUzeHpPbGFCd2lRRU1qM0sreThTT3FuZWlpU29vL2hKMmR6d3I4U1dF?=
 =?utf-8?B?bTJGdy9wQVl6RTJhSGFhTWViS1hKd29ya1BHdTFldUd0b1luUG1HUzlQTVUz?=
 =?utf-8?B?Mm14Vng4czNCNHJFMHBLVDdMTDJ2bmUydUhQSE1ta0x3Z2F2bXlJZ0hQajlE?=
 =?utf-8?B?QTRVUkRBRG12U0p3US8wT3ZDMnZVemdtdEphYXhtWlVoaURnTmlJNHJqWG5U?=
 =?utf-8?B?UDluR3J5clFOYmkzZ2V5SmhtTGRYRmZJSTdsYzg0a2s2cjZRd3FRM2dGUHJu?=
 =?utf-8?B?WDZZS1ozdDdKUFVwaEt5WFFERzhvM1pSZW9aY1dNZzBmdlBTbDNFTVJXemRy?=
 =?utf-8?B?dU1pM2hjeXBncjF0UDFLbWZscDl4ZHc3cWptWnlVUHF6aDF0amF0cjZ3eEZj?=
 =?utf-8?B?Yjl3cW0zWVJhYTZ5aTBEQS9zdkNKejUrWno4TU0yRWc2YXBVYzRrSnV6U0k5?=
 =?utf-8?B?WjRPQUd5d2VMblArUHZCTGVWendIWVB2TCsyQUxIZ2NFUDlzNUJjdjJrQlFI?=
 =?utf-8?B?cTgyNlZkZHpSemkzYUx4dWV6ODIwTkN1VVV1UlhjSm5MNmxKUFlGOEZWRWZp?=
 =?utf-8?B?Q2tBeGxDSlk2WTNRTURZTmlKdDErc2ZsZEVhWWl0dFQrWjdxektFbWM1U0F6?=
 =?utf-8?B?ODZBa1QveVZiaWk5aUN3UjZuWmRZZEl0cE4rN0xieXcrSFF3dWtQZVRGSUtv?=
 =?utf-8?B?RVlqOHR6VU03blA4MVI5ZWJkaUgwUks5Lzg3WWorVmE3UHZsWURQN3AvZklH?=
 =?utf-8?B?MkpJVUhYelpSOWE4ZlhvRkl1MkE0MjR4d0phUjNPMms3d1Z0SDZSRFZ4ZitE?=
 =?utf-8?B?QXIwbXNDQmhtR3d3OGFZMGVsUTd4MnRtUFA3Y0F5MWR6Y1MxYmlsanNvTXRx?=
 =?utf-8?B?cTZhUndkMnJjTFdJR3JCZnYvVnRyZlArQTBSUm94bGJPMWtKTUcva05HSktF?=
 =?utf-8?B?U21NVFVETU1GaEpqTGJvbDBXY3NGajRCMFlwYm5ReXhKRTNFVG0reGRSN3lr?=
 =?utf-8?B?S1VYVlgzdFhDNXJYeWllZ093L0lJSWdIemJsaWs0ME5qM2g2SzhWTEU0MXJR?=
 =?utf-8?B?NTArZ3VVN2Fkdk5RSGNBNGpmcnF3UVdZZTVQeUVFVThKQU5KaEg1dkhFN2pG?=
 =?utf-8?B?MnNCeHlCVmJSU2Vldi96MElZWnJ1YmFuNUU1T2lCVElmbjFMSE84SW9LMmQr?=
 =?utf-8?B?ZDZjTVh6UnVQSmtQN0gyZVpIL3Bpc0FWaFJDT20zVGo1N2wyTWVPeGJUS1F4?=
 =?utf-8?B?bzNzNFJxVFpmRFkxZyt2N2xqZTJlcVROM2pWNFRMUmVmbWp6OWVFTzcxZ1ln?=
 =?utf-8?B?UUpRWFVEdUw2VHJoMVNaY1hPM3lZK0ZvTEcyN2VJUHBLU2tXdUtIeEY0N3dY?=
 =?utf-8?B?L3doUEdaeWVsUXpJNkVkYlBtblpjV0JxbzdZU0hLZGxUS214blFheTViaGV5?=
 =?utf-8?B?M1U5eWlOV3krYUNpeU1leUE3ZzhkRXZ6dkkycGlaQ0FUOEQzd1RvNGNoTlVs?=
 =?utf-8?B?QTcyenhyenlKR2RDTG8rQjdNWkxSckdiVGtiTVVxM1hOK1d6ZVNWTzRFKzBL?=
 =?utf-8?B?cGNvUnZYdXowME1zUHFOYjlJbjJTL1FyRWV5NEtsNU1zMjgxZnJhWkpkVnAy?=
 =?utf-8?B?OFM2SUo5RnRyTDVPdGU2UHVMNmZ4NWV1SXFxSVhURTBtMllZZ0Frd0tONGtM?=
 =?utf-8?B?VFgwL1BDbTVVUGU1eHFXNWxLUHlFWnVZUVNjd25vN3dvQWk3YTNCZEcwL3dh?=
 =?utf-8?B?STM1UjhwQzFpUVhNNFNVVGFDM0J1blpMUFEzZ3dNZTRESjJQK2pCc0tYY25I?=
 =?utf-8?Q?8t38=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3df25d1e-77a6-4a69-567e-08db6dd0b40f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 18:45:34.6698 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mw2Sp2YemCW7UEwRex82PRVJdQ0wH8MF/FN3g/Mb3rtcC3cWXBmfD0kox4q/QrUu
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
> Multiple drivers came up with the requirement to measure how
> much time each submission spend on the hw.

"spends"

> 
> A previous attempt of accounting this had to be reverted because
> hw submissions can live longer than the entity originally
> issuing them.
> 
> Amdgpu on the other hand solves this task by keeping track of
> all the submissions and calculating how much time they have used
> on demand.
> 
> Move this approach over into the scheduler to provide an easy to
> use interface for all drivers.

Yeah, that'd be helpful.

> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 89 ++++++++++++++++++++++--
>  drivers/gpu/drm/scheduler/sched_fence.c  | 19 +++++
>  include/drm/gpu_scheduler.h              | 29 ++++++++
>  3 files changed, 133 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 68e807ae136a..67307022a505 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -62,7 +62,9 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  unsigned int num_sched_list,
>  			  atomic_t *guilty)
>  {
> -	if (!(entity && sched_list && (num_sched_list == 0 || sched_list[0])))
> +	unsigned int i, num_submissions;
> +
> +	if (!entity || !sched_list)
>  		return -EINVAL;
>  
>  	memset(entity, 0, sizeof(struct drm_sched_entity));
> @@ -75,9 +77,6 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
>  	RB_CLEAR_NODE(&entity->rb_tree_node);
>  
> -	if(num_sched_list)
> -		entity->rq = &sched_list[0]->sched_rq[entity->priority];
> -
>  	init_completion(&entity->entity_idle);
>  
>  	/* We start in an idle state. */
> @@ -88,11 +87,68 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  
>  	atomic_set(&entity->fence_seq, 0);
>  	entity->fence_context = dma_fence_context_alloc(2);
> +	spin_lock_init(&entity->accounting_lock);
> +
> +	/* We need to be able to init even unused entities */
> +	if (!num_sched_list)
> +		return 0;
> +
> +	entity->rq = &sched_list[0]->sched_rq[entity->priority];
> +
> +	num_submissions = 0;
> +	for (i = 0; i < num_sched_list; ++i) {
> +		if (!sched_list[i])
> +			return -EINVAL;
> +
> +		num_submissions = max(num_submissions,
> +				      sched_list[i]->hw_submission_limit);
> +	}
> +
> +	/* FIXME: Entity initialized before the scheduler. */
> +	if (!num_submissions)
> +		return 0;
> +
> +	entity->num_hw_submissions = num_submissions;
> +	entity->hw_submissions = kcalloc(num_submissions, sizeof(void *),
> +					 GFP_KERNEL);
> +	if (!entity->hw_submissions)
> +		return -ENOMEM;
>  
>  	return 0;
>  }
>  EXPORT_SYMBOL(drm_sched_entity_init);
>  
> +/**
> + * drm_sched_entity_time_spend - Accumulated hw time used by this entity

Use the adjective form to "time", "time spent":

drm_sched_entity_time_spent

> + * @entity: scheduler entity to check
> + *
> + * Get the current accumulated hw time used by all submissions made through this
> + * entity.
> + */
> +ktime_t drm_sched_entity_time_spend(struct drm_sched_entity *entity)

"time_spend" --> "time_spent"

drm_sched_entity_time_spent

> +{
> +	ktime_t result;
> +	unsigned int i;
> +
> +	if (!entity->num_hw_submissions)
> +		return ns_to_ktime(0);
> +
> +	spin_lock(&entity->accounting_lock);
> +	result = entity->hw_time_used;
> +	for (i = 0; i < entity->num_hw_submissions; ++i) {
> +		struct drm_sched_fence *fence = entity->hw_submissions[i];
> +
> +		if (!fence)
> +			continue;
> +
> +		result = ktime_add(result, drm_sched_fence_time_spend(fence));
> +	}
> +	spin_unlock(&entity->accounting_lock);
> +
> +	return result;
> +}
> +EXPORT_SYMBOL(drm_sched_entity_time_spend);

This is a good show-and-tell, ideally we want to add to entity->hw_time_used,
so that that quantity is updated. 
Otherwise, as it returns result = "new time spent" + entity->hw_time_used; we want
to make sure that "result" is accounted for somewhere more permanent. But
as I said, this is a good show-and-tell. I'd imagine we'd develop this function more
once it lands in the tree.

> +
>  /**
>   * drm_sched_entity_modify_sched - Modify sched of an entity
>   * @entity: scheduler entity to init
> @@ -288,6 +344,8 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
>   */
>  void drm_sched_entity_fini(struct drm_sched_entity *entity)
>  {
> +	unsigned int i;
> +
>  	/*
>  	 * If consumption of existing IBs wasn't completed. Forcefully remove
>  	 * them here. Also makes sure that the scheduler won't touch this entity
> @@ -303,6 +361,9 @@ void drm_sched_entity_fini(struct drm_sched_entity *entity)
>  
>  	dma_fence_put(rcu_dereference_check(entity->last_scheduled, true));
>  	RCU_INIT_POINTER(entity->last_scheduled, NULL);
> +	for (i = 0; i < entity->num_hw_submissions; ++i)
> +		dma_fence_put(&entity->hw_submissions[i]->scheduled);
> +	kfree(entity->hw_submissions);
>  }
>  EXPORT_SYMBOL(drm_sched_entity_fini);
>  
> @@ -427,6 +488,8 @@ drm_sched_job_dependency(struct drm_sched_job *job,
>  struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  {
>  	struct drm_sched_job *sched_job;
> +	struct drm_sched_fence *fence;
> +	unsigned int idx;
>  
>  	sched_job = to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>  	if (!sched_job)
> @@ -475,6 +538,24 @@ struct drm_sched_job *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>  	 */
>  	sched_job->entity = NULL;
>  
> +	if (entity->num_hw_submissions) {
> +		fence = sched_job->s_fence;
> +		dma_fence_get(&fence->scheduled);

Okay, you're doing a get-op on the "scheduled"-fence for
a job which is to be started. [1]
Presumably, temporally, the "scheduled"-fence
gets a signal that it's been started, after this function.

> +		idx = fence->scheduled.seqno;
> +		idx &= entity->num_hw_submissions - 1;

Since num_hw_submissions isn't guaranteed to be a power of 2,
we can mitigate this here by indexing by the remainder of integer
division,
		idx = fence->scheduled.seqno % entity->num_hw_submissions;

This would give you a uniform distribution indexing into hw_submission[],
if the distribution of "seqno" is dense/continuous, and doesn't jump
by num_hw_submissions or more.

> +
> +		spin_lock(&entity->accounting_lock);
> +		swap(fence, entity->hw_submissions[idx]);
> +		if (fence) {

This here needs a comment and an explanation of the intended purpose.
You're swapping fence with hw_submission[idx], thus assigning the fence
whose job is to be started into hw_submission[idx] and assigning
to fence the old value of hw_submission[idx].

Now "fence" is either NULL (if that's the first time around) or
the old "seqno" which mapped to that index. (Which would be
seqno - num_hw_submissions, as you should use modulus above.)

> +			ktime_t spend = drm_sched_fence_time_spend(fence);

Change to the adjective:
			ktime_t spent = drm_sched_fence_time_spent(fence);

> +
> +			entity->hw_time_used = ktime_add(entity->hw_time_used,
> +							 spend);
> +			dma_fence_put(&fence->scheduled);

Are you temporally relying on the fact that you did a get-op in [1] above?
And are you doing a get-op above to keep this around until you get
another seqno which maps to this, (thus you'll need seqno to increase
by at least num_hw_submissions _and_ pop_job to be called for it,) so
that you can time-spent account for it here?

So, unless seqno advances by num_hw_submissions, _and_ pop_job is called
for it, we'd never put-op the "scheduled"-fence (and account for time spent)?
(Which implies that we need a consistent feed of jobs in order to put-op
the last num_hw_submissions - 1 "scheduled"-fences.)

If you're kref holding the fence, then wouldn't we only want to account for
it if it's been completed only, in drm_sched_fence_time_spent()?
And we'd somehow want to guarantee that it would achieve completion/done
status by the time we wrap num_hw_submissions and the newly mapped
entry maps to a done fence... Although, come to think of it, if we're
submitting the num_hw_submissions-th job then we're not interested
in the 0-th job since the hw cannot hold it anymore. So, I guess
that seems fine, but low-level driver writers should be aware of this. 

It would appear that the snippet of code here relies on the fact that
by the time we reach seqno + num_hw_sumissions, then seqno is done, or
more correctly put "uninteresting" to us anymore.
Which is an okay assumption since the hardware cannot hold more
than num_hw_submissions jobs... or can it? :-)

So, whether it's done or not, we don't care, we just care to account
for it when we "push it out of the hardware" by lieu of now
having num_hw_submission new jobs in.

So, this snippet of code here needs very lucid comments in [1],
also before the swap(), and also after the if (fence).

I'm concerned that if we don't get new jobs, then the last num_hw_submission - 1
"scheduled"-fences would lag behind since no put-op would be called
for them unless we get new jobs, which could be indeterminate time later.

> +		}
> +		spin_unlock(&entity->accounting_lock);
> +	}
> +
>  	return sched_job;
>  }
>  
> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
> index ef120475e7c6..9abd076923f5 100644
> --- a/drivers/gpu/drm/scheduler/sched_fence.c
> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
> @@ -60,6 +60,25 @@ void drm_sched_fence_finished(struct drm_sched_fence *fence, int result)
>  	dma_fence_signal(&fence->finished);
>  }
>  
> +/**
> + * drm_sched_fence_time_spend - calculate time spend on the hw
> + * @fence: fence to use
> + *
> + * Calculate how much time this fence has spend using the hw.
> + */
> +ktime_t drm_sched_fence_time_spend(struct drm_sched_fence *fence)

Use the adjective form:

ktime_t drm_sched_fence_time_spent(...

> +{
> +	/* When the fence is not even scheduled, it can't have spend time */

"it can't have time spent (in the hardware)"

> +	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->scheduled.flags))
> +		return ns_to_ktime(0);
> +
> +	/* When it is still running account how much already spend */

/* If it is still running, then account for time spent. */

> +	if (!test_bit(DMA_FENCE_FLAG_TIMESTAMP_BIT, &fence->finished.flags))
> +		return ktime_sub(ktime_get(), fence->scheduled.timestamp);
> +

If someone calls this more than once while the same fence is alive
and its task being worked on in the GPU, and then they use the result
of this function to add to some counter for the fence or its container
entity, then this would over-account the time spent for this fence.

So while this function is fine, the way its result is being used
can result in over-accounting. So we should be careful how we use it.

I can imagine that if the fence is still alive, we don't accumulate;
or if the fence is still alive we just assign the new value; or
we can subtract the time from the last measurement to this time (a bit more
advanced, and this is what I used for my own accounting when we had "elapsed_ns",
but I digress...)

> +	return ktime_sub(fence->finished.timestamp, fence->scheduled.timestamp);
> +}
> +
>  static const char *drm_sched_fence_get_driver_name(struct dma_fence *fence)
>  {
>  	return "drm_sched";
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index e95b4837e5a3..7f9296202841 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -239,6 +239,33 @@ struct drm_sched_entity {
>  	 */
>  	struct rb_node			rb_tree_node;
>  
> +	/**
> +	 * @accounting_lock:
> +	 *
> +	 * Protecting the array of hw submissions and the time spend
> +	 */
> +	spinlock_t			accounting_lock;
> +
> +	/**
> +	 * @hw_time_used:
> +	 *
> +	 * how much hw time previous submissions have already used
> +	 */
> +	ktime_t				hw_time_used;

This needs to age, and we can add aging code once this lands
in the tree, so no need to worry about it now.

> +
> +	/**
> +	 * @max_hw_submissions:
> +	 *
> +	 * Maximum number of submissions currently in worked on bye the hw
> +	 */
> +	unsigned int			num_hw_submissions;
> +
> +	/**
> +	 * @hw_submissions:
> +	 *
> +	 * Scheduler fences of the hw submissions in flight
> +	 */
> +	struct drm_sched_fence		**hw_submissions;

Perhaps just use singular, to mean:

	hw_submission[i] --> pointer to the i-th hw submission fence.

>  };
>  
>  /**
> @@ -572,6 +599,7 @@ int drm_sched_entity_init(struct drm_sched_entity *entity,
>  			  struct drm_gpu_scheduler **sched_list,
>  			  unsigned int num_sched_list,
>  			  atomic_t *guilty);
> +ktime_t drm_sched_entity_time_spend(struct drm_sched_entity *entity);

drm_sched_entity_time_spent

>  long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout);
>  void drm_sched_entity_fini(struct drm_sched_entity *entity);
>  void drm_sched_entity_destroy(struct drm_sched_entity *entity);
> @@ -593,6 +621,7 @@ void drm_sched_fence_free(struct drm_sched_fence *fence);
>  
>  void drm_sched_fence_scheduled(struct drm_sched_fence *fence);
>  void drm_sched_fence_finished(struct drm_sched_fence *fence, int result);
> +ktime_t drm_sched_fence_time_spend(struct drm_sched_fence *fence);

drm_sched_fence_time_spent

>  
>  unsigned long drm_sched_suspend_timeout(struct drm_gpu_scheduler *sched);
>  void drm_sched_resume_timeout(struct drm_gpu_scheduler *sched,

Regards,
Luben

