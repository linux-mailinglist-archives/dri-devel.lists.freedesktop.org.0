Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52CD76D85E6
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 20:23:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A65B892AA;
	Wed,  5 Apr 2023 18:23:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on20604.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7ea9::604])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1D67892AA
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 18:23:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AsE7ddGjCESrXmWDs0TubItMzn+wTVlTE/WCLAapZN9PEXwVcuPzpexHXbTiqkAUZ/9qJPFtq2hobET1pZrctklGjnEWAuV+cgFTDToHBVmkBYt7U3tUyrC9XjCGBXgcxOJxLl6OiNUlbLpptGkyGrKpFYr4zeiVkka26fAnvLRnPwe5r1TMUf1aawaLLdaji3Em7f6t+U6R4ZBQ5L5aK7qLnqp8Uc48D6Xc4N70kJsd/ktgDOHqMzuSunatl2bSzZvk+j/ICbJgzsIdQGPToFEPR7ivvLdKQ8srDrRvfqjdySv9oylv+4U3XFFGJn3q7BCAPB/UmP27FNExzSw6tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XyV4Oo8W9PFipzAyIxXlJomh9ZdUsww7SX35J7vs0os=;
 b=ntHx0JtiQJwMldoxx3kpJpAuWHnW+8DVPtdTRg5A/cW4Y/pIdrHiYluGrI045ZfCdUENyZ7Jn6+rcpWmkL/9U0uQBorw+ruFz0YORdNx9BxfeYGCFAL2jpz3exfQBD8ESpY0/vPd4b/FNB+K6/zoVUVaYQdJeXy13X6dYWx2tYtrB5PENWBT7zHI8Fn7lG6c5EavzBzDc8oN5O+WwZAQ+sizXTFNoifty0jKRrNfwQhqHjC2Zj2aWMmgiicJi0RH7hDxyZssaO1w1d6sTeBdCspX1XhwxtFJJGjlXPRIr6tLmIm8mPvRajm1/2RdyL4lT8pCeHvZhBo7U+PaeC91fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XyV4Oo8W9PFipzAyIxXlJomh9ZdUsww7SX35J7vs0os=;
 b=V5OLEMLUbfbh87O35VuQhcaYG7fZISRvJbvpc97qZ057XyTpd92yZyx3IK4+WIJVmDiXbqduJydIM2SMoGfaZcA3RA5yRFHTftoc2G3OVMtqFwJhbHaz63RxL4AYiBq2rSSUYJ1Xl7N8awXMllKRVOX0jb4uLuHXrW1CLXgGTFI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 PH7PR12MB7428.namprd12.prod.outlook.com (2603:10b6:510:203::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6254.33; Wed, 5 Apr 2023 18:23:36 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::8299:158a:c296:de80%6]) with mapi id 15.20.6254.033; Wed, 5 Apr 2023
 18:23:36 +0000
Message-ID: <9bce7374-ef67-75d0-4040-870ba131819e@amd.com>
Date: Wed, 5 Apr 2023 14:23:32 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Content-Language: en-CA
To: Asahi Lina <lina@asahilina.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
References: <20230406-scheduler-uaf-2-v1-1-972531cf0a81@asahilina.net>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH] drm/scheduler: Fix UAF race in drm_sched_entity_push_job()
In-Reply-To: <20230406-scheduler-uaf-2-v1-1-972531cf0a81@asahilina.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT4PR01CA0471.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d6::22) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|PH7PR12MB7428:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d05666d-3ee6-40fd-a9e1-08db3602deb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yPVkLt8eNuw4Rx2t4P4WydFB6biFgLCVOeEGvhTwhIWcS2Gsh8ykjiuc9LhfnOOYBnfBZr5MGNUbhKvqrWC/+KB2kqx1GOrzo/Hcrup1YBMQTHQ+3V+EBRFu6lBaESjQ4xlDsJL35tsLeGdB4VeiPyBmzBfTrvoW1g5x2LlM9Af3KaoBLL5Yx7Ebz66HdGzfucrFXOEvexRNK0dyBSIYQPBClXSi7+MK911v9zE7EEmLIKt5Jo+DdmTmRRkizgFSfKKYegttLbKgXXuWK3z+fdE2cB8vTNaE6oUVU2fu9JfwpCx5cy9IyJrGkp3bkoOUT+GtVA8LhMIpj30MCQkqcGef78topaCEWTxvDmiMEn7uHH8b7zwP2fTAW6rlrqTkE4KTYWehDJYBd5Xx+xp9dCOLBpPYwt+bC8xLu0G+RcS9+ZoTD99TXgpttknL6BK67aqY5pDa4mLUaq8oqJzxLI6zQtwNL6tLUrpY4H4gE96tOKFDK5CoR/JtYNUfAvOMyG7WoKt82zq31nEfBc7k6cqdBbqG/DslSAm2Ja4kJm7RFAFh8LW9gmbEz5Qev1h2GohWsuaWq7n8xys3gRHtjrgg0n2s694/gkXEWaYWMsueYRV1QM5iiZTF4Q1cIWwzg3X8EFNIEOO9gmqEo6YJaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(376002)(39860400002)(346002)(366004)(136003)(451199021)(31696002)(86362001)(8676002)(36756003)(6486002)(66946007)(66556008)(66476007)(41300700001)(4326008)(6666004)(110136005)(316002)(186003)(6506007)(44832011)(5660300002)(8936002)(38100700002)(2906002)(53546011)(478600001)(6512007)(2616005)(26005)(83380400001)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SDFvMFJUNjFZRFFQWjI4SkNkYi9rdkUyYWpCdENJRUFHVU5WUVV1Tndic2Jp?=
 =?utf-8?B?cllnREE0My9QSDQxNXpvd0l1RFFkMFRvdnpEKzUwblRJbEFiSlJGOFpjSTBY?=
 =?utf-8?B?QkY3SVArckppamJlQTFIM1VCeEVXYXRZOGx4RG91ZUVTcHdkWkxFTDRzR2gy?=
 =?utf-8?B?a2huZDU2WFJPTkM1YllYRTVTaWp3SXM1Y0ZPYTkzVWx1NVJpM0tCMGNEYWFa?=
 =?utf-8?B?TlFpOFlJd2NtVEJRUGYyaThtTUtwRGxUL0RhVzlxWlduMTZWcU81Z2VJajNr?=
 =?utf-8?B?Q1NyU1RJSlRLU0pwL3pET0h4dzJtczJmQXk1bmZXbXVDbmFSMDBpNGFCcDdG?=
 =?utf-8?B?L2JvR3JCNmVkZldMM0Rtckx2T2JaWExEeHk2czVBdVJnaVVVWVQ0Nk82N3RV?=
 =?utf-8?B?dkV6YU5jOVJRVU9mVHBoVGJlbjdzRFlwdklFSHI1NmhQaUNPKzR6aWFzcDB2?=
 =?utf-8?B?L3pGR3R3V3dmaTFmVklRN1loa3R4aTF6Qm04aFhScVFpUjdMdGRIbjZMRUdl?=
 =?utf-8?B?eGdWdFVzaVdPOFV1OEdDTE9sbE9hSHdFYWtZcFNrWVZWTndQdjk2dUxGMEUw?=
 =?utf-8?B?cWJ6c0RLZlNDSmlVa1I5eVZzN2l2K0ZwQXRBaDN6eEdGUWtQMzhwcWFXWjhj?=
 =?utf-8?B?ZTBxN0psZGZCQUxtSGJHT0hrRml6ZENldlFFQUlZamhoYkw1OUN4TGhnMW1R?=
 =?utf-8?B?VzhRalAyTXByaTdyS3VhZzZDZ3RLQW1XbUJOb003V1ZwYm5xUlJvQlRveTdE?=
 =?utf-8?B?aTBXMFk2T3czOEpKbWdXRUloaWxGQURkaTBsWjc3WE9tSlp3UTVod25VaVZ1?=
 =?utf-8?B?dzd4Nkc0UnVoN0VCN2lKcmJKQ2hVdWlGc3oyeWZyTFJDY3oxUy9VZm9RRnhM?=
 =?utf-8?B?eTlxdWJsaXRETmtQa09aVzdMZWFYeUJDWTlOTDJsUzJHWDdGWmtRUklRQTlK?=
 =?utf-8?B?K1VUaXNhVzhsektEMElJd2Fvbm84aDY1WmlDK2s2QWJTMEs4VGRBVVEyL0x0?=
 =?utf-8?B?U0dESzR6T1BsUC9ZZExtRVN2QkNHOTA0Nnp4c3NQZXlDTWhISmlLbzVVUnNX?=
 =?utf-8?B?dzkzQ2tsS3hGTEJMMUZWSTVYOUEwMVlKYnVBWDJrelBZcUh5Q0lOQm5YNGZu?=
 =?utf-8?B?cUFRUzVaWXVLaEp2OVpoNVVYOXhVeW94VmwwUmRMdnhwbEZMTGRhVEVGRnVH?=
 =?utf-8?B?NmYvL0ZndmFzbmowUm1ybFZiRHcxNHJzcGxXMzRFY3dwYW5WY1lmaTN2SXlh?=
 =?utf-8?B?NFVuaUkzTlQvaEdxUGZvUTFMNU9uRGNkcjQrWEg2bXVKTWNWeDNNaStHbVRx?=
 =?utf-8?B?d0ZoME9tRjFYbEtNRU55UVU4NTlWUnY0YUFGWnE2MDZOOG5kSmdkZGpjMWR2?=
 =?utf-8?B?MjRNZG9ZN3lPc3oyWm1LTVlRRXNsa0xRQnAyaGplWDVwSGpQd1NsOVpwQlFk?=
 =?utf-8?B?TFBjR2x1UTcvNnVhMDdwaTZZUERjV1JYT0FpZldRcG5OeWpZcDZDaFhDZkVu?=
 =?utf-8?B?VGNNMVZGcWlQeWpFTGZXeEk5QTlXbGRTcFljQlEzWlpYSHpYMFFWc3VscWdn?=
 =?utf-8?B?azRSUkxHU0owTm1MM0Y1T2pVQUV4VU1oYUwvdlphRUhOY3o3RW1pZHl5QXh5?=
 =?utf-8?B?ekF4ZlZWRWxndyswWGVwQTVKS2xBS0s4aC92TjZYbU5RWjhXcVFNSGlXZE42?=
 =?utf-8?B?ckw3anQvaFY4aFBqY2RVdHI5YTJVUWk2NHRjU2Jlc1R2S3I4dkp2a2Frc3Mx?=
 =?utf-8?B?WitpYmVFbUtFU1JDaE1uUmxHbnVENG9kNnVzVWZnQTVmeGtRbkhVOWtEMDlM?=
 =?utf-8?B?YitTZlJBdXp1R0QvMDRkYzlyVDEvZER5eDRwcjRvaXZla2ZxeU04eGE4UEVm?=
 =?utf-8?B?K1RnODJ2clRMUzQ2a0hTMDVwaGF3cDdaKzIrUjcvdW51cHQ0Qng3RWhrL2xG?=
 =?utf-8?B?d2tRZ3hNRUROQ0gydWNMbFJIWlVVQWtwcWZxWnU0blg3aG5sbnZrUzNGc0Vn?=
 =?utf-8?B?TDFmczVtZTlWTWoyMDVWeE1CclNSTDN2cFIwbGF1ZTMwS2g1M0VJdDVNRnhD?=
 =?utf-8?B?dG5Sd2VBaHUvV0thVSszZS9Yc1JPcW9OR0pJTW5NcnhaL0YwaHRuckJXdnNl?=
 =?utf-8?Q?7S7GwBnZMtNWsuGX6CXtxaXrH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d05666d-3ee6-40fd-a9e1-08db3602deb0
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:23:35.8434 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6Y0CHZ1M+7gPmBEXTi1zqkCgrDVxwDompNMC6Leg9C+ECACFB9QOq8OzFCPTDhwv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7428
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 asahi@lists.linux.dev
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-04-05 12:37, Asahi Lina wrote:
> After a job is pushed into the queue, it is owned by the scheduler core
> and may be freed at any time, so we can't write nor read the submit
> timestamp after that point.
> 
> Fixes oopses observed with the drm/asahi driver, found with kASAN.
> 
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> ---

That's a good fix! Thanks for fixing this. I'll push
this through drm-misc-next and drm-misc-fixes, if there
are no objections.

Reviewed-by: Luben Tuikov <luben.tuikov@amd.com>

Regards,
Luben

>  drivers/gpu/drm/scheduler/sched_entity.c | 11 +++++++++--
>  1 file changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 15d04a0ec623..e0a8890a62e2 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -507,12 +507,19 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  {
>  	struct drm_sched_entity *entity = sched_job->entity;
>  	bool first;
> +	ktime_t submit_ts;
>  
>  	trace_drm_sched_job(sched_job, entity);
>  	atomic_inc(entity->rq->sched->score);
>  	WRITE_ONCE(entity->last_user, current->group_leader);
> +
> +	/*
> +	 * After the sched_job is pushed into the entity queue, it may be
> +	 * completed and freed up at any time. We can no longer access it.
> +	 * Make sure to set the submit_ts first, to avoid a race.
> +	 */
> +	sched_job->submit_ts = submit_ts = ktime_get();
>  	first = spsc_queue_push(&entity->job_queue, &sched_job->queue_node);
> -	sched_job->submit_ts = ktime_get();
>  
>  	/* first job wakes up scheduler */
>  	if (first) {
> @@ -529,7 +536,7 @@ void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>  		spin_unlock(&entity->rq_lock);
>  
>  		if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
> -			drm_sched_rq_update_fifo(entity, sched_job->submit_ts);
> +			drm_sched_rq_update_fifo(entity, submit_ts);
>  
>  		drm_sched_wakeup(entity->rq->sched);
>  	}
> 
> ---
> base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
> change-id: 20230406-scheduler-uaf-2-44cf8faed245
> 
> Thank you,
> ~~ Lina
> 

