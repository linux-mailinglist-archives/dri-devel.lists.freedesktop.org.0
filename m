Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EADDE7385CD
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jun 2023 15:56:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B473810E1A2;
	Wed, 21 Jun 2023 13:56:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2045.outbound.protection.outlook.com [40.107.101.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0EA810E1A2
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jun 2023 13:56:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DxX5Bfab7EjCO7T7L5FDbCg/gw+6sEAchU3EDoE7A/2jhYQ9Gt/K0vmu4q2X0Cuo2pps38xTCF7hhHzqE+PD8zHs2IvjDwldOPsSs3N8we+2d+PO+55n1eYDxxiLu3Tkf1WGJ+CBxoyUoU3bl/leEdgoAPU3NtQ/O7OfKlVoKzf2wgoTvbeqyQN41Labjs5MNdM0Q9RcokP57smeDYJul8XRnYpciu3MI2knL+3oovma/oFlGKAP/YaILLrjkw/C4u0yBJ7xJ1n3quhlCQgcdHY71bPcHRi6KFxjvSJ69WkG1MgkmdkEJVg/U5iUWywCAQ9qfRxB9toRJ1hJ6fyVNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CuKivliOnsDaIIdxnTSR4YtKpgkxZed8LNQWZbwwG0M=;
 b=OPSYC5foTaZFifvh1vmwQbj5AhxS+rzDk1zhTsamZKUL6VUwJFyBE/w9yH8bgq0ZaFbMsmjnMAgyBNhXLMBPQVyvejTTfMfPsmY8et1J2Hp4dW6+obhozM66F8MytQatfEPMCKL5H7fGMVdvvLJJf+FhFdDFp+V0xW99JEabVGqIxAQWiNhqYac0/GQ7KkqV0/T/woHxPOoO+VbLXwqNIG27NysWPJOCx6f8DAhbWm0EMtIRqtRpbkNlLOFyf+4fggbpMBiWOCEUaHVdqOZMyQyCCT0U7nu+tnmQrcS7hvOZQy+ECDPycl/kxAW0hsaZSSf4qq0kC7bmezypGJlshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CuKivliOnsDaIIdxnTSR4YtKpgkxZed8LNQWZbwwG0M=;
 b=VYqAzyz6CfVVBaXGdr/q2p/m6n01raImXnAKSR4CdRpVGgsPeOI/fNPk/vdjm5Q8vPT+HRNFbnDuUinQu+XSUcPYbopTqz+HY30s4j2X41Cp4FQU3r9aViLoFA7v0ruS+cU78axOe0a1vraCxe6nTx0CdMwuaFyy1xuD1FW2qTI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 CH3PR12MB8354.namprd12.prod.outlook.com (2603:10b6:610:12f::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 21 Jun
 2023 13:56:43 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::b59e:105c:f546:4310%7]) with mapi id 15.20.6521.020; Wed, 21 Jun 2023
 13:56:43 +0000
Message-ID: <dca9af00-271b-168d-c5f5-e6a662be38dc@amd.com>
Date: Wed, 21 Jun 2023 09:56:40 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org
References: <20230619071921.3465992-1-boris.brezillon@collabora.com>
Content-Language: en-CA, en-US
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH v6] drm/sched: Make sure we wait for all dependencies in
 kill_jobs_cb()
In-Reply-To: <20230619071921.3465992-1-boris.brezillon@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0082.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:3::18) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|CH3PR12MB8354:EE_
X-MS-Office365-Filtering-Correlation-Id: 81a978d9-c36a-458f-cfd9-08db725f5859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aNtpx5ZJpewRtESfe+ZNNSaa09RXmQsJSCCMvLdDmUaUpPogkfKZ0YvcoEDIPtQTBKmr6vrBAlrWKowqXswrq4ZXxQoxiNDUnAvgekHlTSB0k7ZtNS58KWlc+7Vp7Ao+BZBdVjL9KE24MdZHncymcyij3/0QDISai4ywJhMF9oR+jwNZxtBib6nCaLrnxV0qnW0+meamftXxJlRSOUa3s9fwcswgt9RqcOCLYHJwhX4GrIe9sZQ9ZNwDXTaal5h4qIGW04bheIkzztOfZ+RTMFbzHL1XZ7jQk+6z2Dqm/k4wiuRGyleKUBbpF4iBVEmxH15S0OgogdtrL51CcVjbomE66sXajletF1+t2XCElhCIK6X11HsuPFbpbNZscYwcSMHJc3EKwCbzipT1EgaRDA24ZjPNOEraej8QtC7SpOzuLCBzvjMFctuK6PcLOChqjpS3H9hnunVuUiIlfLuXg6gv+UM+tC5EjZu4h0ro/hHmQfGlGW267NJ6bzAbBsn8v964dc81eFWibcukzRdMh0/TUwvImgXcTbogiAGJ8exUkNFJLSkgEZ8dqrTrxlLKW6ZwEg9NTKhdDZKBa/giXPSW1IMbrwQ/d2mLKdAhP+YRBcSkpcLkQM+xSCzec51udx4mRo+XVrIvjXnawaJg1Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(451199021)(6486002)(38100700002)(83380400001)(53546011)(186003)(6512007)(6506007)(66574015)(2616005)(36756003)(316002)(4326008)(66556008)(66476007)(66946007)(2906002)(8936002)(8676002)(26005)(31686004)(44832011)(86362001)(5660300002)(31696002)(41300700001)(54906003)(478600001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0hiWC85SmI0eHhDUmdYTkUyV2o2YldqN2hPYS92Nkt3RTM0MDhpTVZtaXpN?=
 =?utf-8?B?TWhqSnRLVnNhSkRHc0UvZ1M5bGkwaVBnT291aDlKcGhLY0ZnZFR2NkhFcExF?=
 =?utf-8?B?YS9vV3BReGZ1UEZBY0c4bllvTXorSHZ1MXBSbkxRRDNrMTBtdGRDRFdldlpL?=
 =?utf-8?B?UHpoTm53SW5NYk5sbmpKSUg2RnZFTE5xOEtVVWdPYXpJNURITTdiK2tJbmp2?=
 =?utf-8?B?cXltRk81TVdPdWJBTEI2NXlLcWthQmhYTkNSL25xRUY2a3ZVczVLcHVMcTBk?=
 =?utf-8?B?ZklSakxUeXptTkROelphdWtvMGlxUUdOcTdjUG4ycnIzdFplTU5nVDA1VFND?=
 =?utf-8?B?WWxhYlFhOXpsT1grVFROc2xNaU9WWHh2MU4zSEVmM2s2b1Y5R3lTaGg1UmRp?=
 =?utf-8?B?U2d0OXR6aWhpMWFONUpuNG1saDgzR0FuUllIWHpuTGcvdklmSFQ4UnhGVE1m?=
 =?utf-8?B?UU1JTVhLU3pJUjNOT1ZjSFBOR3drbEZ3dlRrL1d2TThKNjBSUjByelNOUFAx?=
 =?utf-8?B?cmViRi9BVWh1SjFBa3hycTIrMU5TZFVtSDZGdnQ2TUJ1a0IvZ1pSS0NhRUM1?=
 =?utf-8?B?QTRyc05JWitFenpQUk03bExCckhCZGhzK1lOWTgzc08vSHUxc2ZiMGF6aFhr?=
 =?utf-8?B?WUN1aU8rN1RIK3E5SkdaTWNuNzJCZTNDUzZESHBTcDhGZDVRdlVRM2ZvQWRj?=
 =?utf-8?B?QWhZNEZsTU5HbVJFQXNxdTBvcGtxdHNhdTJWWjNCMmhHaEpvcm9VdHRxVklB?=
 =?utf-8?B?bXdRTkNPWThDdmpKV3JRbWxQUXlEQkFLYytKWFRsTXNHVzRTNjZXTVBnU0J1?=
 =?utf-8?B?djAyeG1NWlBFNVNMZTlSMUxCcGFyVVZkYVhpZVhqMzk1OGdFSVhVbE1NV3lK?=
 =?utf-8?B?ZCtLSDh5NXVSMndTazAxM0dRc1BLeUJWQnF3by91U3N2NnU4SjNLZDBsZkhD?=
 =?utf-8?B?YS9aTnN2cSt0VWE1WkZZMnkxU3Nwa2tZbXFQaDFQdUVlU3RSSE9oVGNTeHlS?=
 =?utf-8?B?b2FMdzdKa24zK083dlVaVTJnc3c4Y0FJMDNpLzFYdHVnRyt0OGNCTU5PSXJD?=
 =?utf-8?B?ZDBJdTMxQnNBWGszelBlQTdmRC9LZzJrb01mNmVwY0lBdXhkblFsa3NSRG4v?=
 =?utf-8?B?bXJzTDJNQnBKMWNKVThxNUxzV0xxdHJCT2c4OERuem9oYStoT3BqbFY2SHNZ?=
 =?utf-8?B?N3NaMERTTUNFNFJqVGlVWWJ1cUVkajE0SmlPemYzM25leHBGOXBhaWdZbU0x?=
 =?utf-8?B?NWJTQS9wRU9RaUhobTJoc2Z3YkYrZkJOaVU4ZW9NQy9CdEVIcTFaL3JuSXNw?=
 =?utf-8?B?RHFOYU85MCtUcVZhUnEwVXRBUlVoakpScXNTaTB3NkR3ZzNRMjZ5OFpFdS9q?=
 =?utf-8?B?dU5wK3lPLzhjUTh2bUJMbnR3cjFkSGJqenJJNy9lb2RTT0pTZXN2RHZBSTVL?=
 =?utf-8?B?SC9CNmJOaks1NHRydGNQWFdTOENNSlJpTE82anBlNWhRemFtZlQ5bmFsSFRW?=
 =?utf-8?B?akJyc1RuS0VXb1dtZUhlQXpMV3JBcjNnMU5SNDhpTDhGVWhkaWloZjV2V3hP?=
 =?utf-8?B?WFdidmRpWnpFMWxNbUlGTUw2cnRPTjIxdWF3dERKTjlJYWdWQVRrdjlHR3lR?=
 =?utf-8?B?STlKT25SUUNORXRlY1p5Mm1vR1ZDdS9xVzJ2bElITE9GQVd1WkU2MjBXejZs?=
 =?utf-8?B?aklXbzN0VUhvWTdzSXdVcHR2cjNkaTZ5VnRlNW53V1FPQjFnOTd2OGtSNGll?=
 =?utf-8?B?bnd5VlgzNlIzekNXNFpvTE84ZEtnSnU5aXlmVmZKSHpaQ09zUlF6Z1JLMFdK?=
 =?utf-8?B?QTd5cGF1NVAzT0RCSG1GMTkxbzZjSUREb2Q5MHJMTWFSU3FYZnUxYUtqd2JJ?=
 =?utf-8?B?Zm52K2JFQXRKL0tCcGhON3ZtdzFPMHY4OXRZSzJOUVNIUnh6VUhyMnd6bHdh?=
 =?utf-8?B?M2p6UHg3SXNNdmtOaEw0RFZvSDVUdHVRLzlUSmMweEdRTjFHL254a0I2Vkl6?=
 =?utf-8?B?czR6RHdnZnlDS1ltU1NJTGY3MXhsWW9BNW9DanZzeXhKRG1SaFNiRk9ycjNE?=
 =?utf-8?B?QVkyenN1OTB6RGtQVjJ5ZXAyVkJWUHR1ZTBzNHIxUGJCOWFvanJCMHkva05P?=
 =?utf-8?Q?slJbpVvQUe9bLIG5aNgGKC2Hg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 81a978d9-c36a-458f-cfd9-08db725f5859
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 13:56:43.4795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kja73aTHznVX/uTX/hjA5x2tKXw1z/rVvAsb6TUub2sfa1hC6wy8T4hk/MoeNfwP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8354
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
Cc: Sarah Walker <sarah.walker@imgtec.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Donald Robson <donald.robson@imgtec.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2023-06-19 03:19, Boris Brezillon wrote:
> drm_sched_entity_kill_jobs_cb() logic is omitting the last fence popped
> from the dependency array that was waited upon before
> drm_sched_entity_kill() was called (drm_sched_entity::dependency field),
> so we're basically waiting for all dependencies except one.
> 
> In theory, this wait shouldn't be needed because resources should have
> their users registered to the dma_resv object, thus guaranteeing that
> future jobs wanting to access these resources wait on all the previous
> users (depending on the access type, of course). But we want to keep
> these explicit waits in the kill entity path just in case.
> 
> Let's make sure we keep all dependencies in the array in
> drm_sched_job_dependency(), so we can iterate over the array and wait
> in drm_sched_entity_kill_jobs_cb().
> 
> We also make sure we wait on drm_sched_fence::finished if we were
> originally asked to wait on drm_sched_fence::scheduled. In that case,
> we assume the intent was to delegate the wait to the firmware/GPU or
> rely on the pipelining done at the entity/scheduler level, but when
> killing jobs, we really want to wait for completion not just scheduling.
> 
> v6:
> - Back to v4 implementation
> - Add Christian's R-b
> 
> v5:
> - Flag deps on which we should only wait for the scheduled event
>   at insertion time
> 
> v4:
> - Fix commit message
> - Fix a use-after-free bug
> 
> v3:
> - Always wait for drm_sched_fence::finished fences in
>   drm_sched_entity_kill_jobs_cb() when we see a sched_fence
> 
> v2:
> - Don't evict deps in drm_sched_job_dependency()

Hmm, why is this in reverse chronological order?
It's very confusing.

> 
> Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> Suggested-by: "Christian König" <christian.koenig@amd.com>
> Reviewed-by: "Christian König" <christian.koenig@amd.com>

These three lines would usually come after the CCs.

Regards,
Luben

> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Sarah Walker <sarah.walker@imgtec.com>
> Cc: Donald Robson <donald.robson@imgtec.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: "Christian König" <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 41 +++++++++++++++++++-----
>  1 file changed, 33 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 68e807ae136a..ec41d82d0141 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -176,16 +176,32 @@ static void drm_sched_entity_kill_jobs_cb(struct dma_fence *f,
>  {
>  	struct drm_sched_job *job = container_of(cb, struct drm_sched_job,
>  						 finish_cb);
> -	int r;
> +	unsigned long index;
>  
>  	dma_fence_put(f);
>  
>  	/* Wait for all dependencies to avoid data corruptions */
> -	while (!xa_empty(&job->dependencies)) {
> -		f = xa_erase(&job->dependencies, job->last_dependency++);
> -		r = dma_fence_add_callback(f, &job->finish_cb,
> -					   drm_sched_entity_kill_jobs_cb);
> -		if (!r)
> +	xa_for_each(&job->dependencies, index, f) {
> +		struct drm_sched_fence *s_fence = to_drm_sched_fence(f);
> +
> +		if (s_fence && f == &s_fence->scheduled) {
> +			/* The dependencies array had a reference on the scheduled
> +			 * fence, and the finished fence refcount might have
> +			 * dropped to zero. Use dma_fence_get_rcu() so we get
> +			 * a NULL fence in that case.
> +			 */
> +			f = dma_fence_get_rcu(&s_fence->finished);
> +
> +			/* Now that we have a reference on the finished fence,
> +			 * we can release the reference the dependencies array
> +			 * had on the scheduled fence.
> +			 */
> +			dma_fence_put(&s_fence->scheduled);
> +		}
> +
> +		xa_erase(&job->dependencies, index);
> +		if (f && !dma_fence_add_callback(f, &job->finish_cb,
> +						 drm_sched_entity_kill_jobs_cb))
>  			return;
>  
>  		dma_fence_put(f);
> @@ -415,8 +431,17 @@ static struct dma_fence *
>  drm_sched_job_dependency(struct drm_sched_job *job,
>  			 struct drm_sched_entity *entity)
>  {
> -	if (!xa_empty(&job->dependencies))
> -		return xa_erase(&job->dependencies, job->last_dependency++);
> +	struct dma_fence *f;
> +
> +	/* We keep the fence around, so we can iterate over all dependencies
> +	 * in drm_sched_entity_kill_jobs_cb() to ensure all deps are signaled
> +	 * before killing the job.
> +	 */
> +	f = xa_load(&job->dependencies, job->last_dependency);
> +	if (f) {
> +		job->last_dependency++;
> +		return dma_fence_get(f);
> +	}
>  
>  	if (job->sched->ops->prepare_job)
>  		return job->sched->ops->prepare_job(job, entity);

