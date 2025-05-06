Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5845BAAC72B
	for <lists+dri-devel@lfdr.de>; Tue,  6 May 2025 15:59:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49C7910E6A9;
	Tue,  6 May 2025 13:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MLtlE2SU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AD8510E6A4;
 Tue,  6 May 2025 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z7hyYPSG6NFN/+FhtWRZlhW2NmRu1kqj/i7cl7FokWU=; b=MLtlE2SUAlNH6fZv2SU5E18EMh
 Nz3nzwQBbEtMPcCHcgOtfojokiucGhQcD7iVmM3oWt0MEbxGjxsmWu8eLvSSUnj94DoGgqkp5NXnw
 tI8MVKueinqpBrZEDBDH/eHHnzKk5sg1JJjFpWYQYHiuvK/6ICJdoqDZVeB9aGPzxDhBSdp0eDL/B
 hAYgQuY7drSugiLNM4O4/jm08m1h82tiIv0HHJZa6iY1s5+xD2n6O9YeetEVxRdM5GtCVzP14SnAA
 EoO7QwqFAsLEPuWojr79l2Q2FqrF392h3ZtewgJu/xsTF+96gwrWzDqoGq4whu2L9YiGvKsR/4AVe
 Hog9g2YQ==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uCIlB-004EE7-5Y; Tue, 06 May 2025 15:58:36 +0200
Message-ID: <38308f2b-eaf1-4e6e-b772-690585c493c6@igalia.com>
Date: Tue, 6 May 2025 14:58:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/8] drm/sched: Add new test for DRM_GPU_SCHED_STAT_RUNNING
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <mwen@igalia.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250503-sched-skip-reset-v1-0-ed0d6701a3fe@igalia.com>
 <20250503-sched-skip-reset-v1-4-ed0d6701a3fe@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250503-sched-skip-reset-v1-4-ed0d6701a3fe@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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


On 03/05/2025 21:59, Maíra Canal wrote:
> Add a test to submit a single job against a scheduler with the timeout
> configured and verify that if the job is still running, the timeout
> handler will skip the reset and allow the job to complete.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  3 ++
>   drivers/gpu/drm/scheduler/tests/tests_basic.c    | 44 ++++++++++++++++++++++++
>   2 files changed, 47 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index e9af202d84bd55ea5cc048215e39f5407bc84458..9d594cb5bf567be25e018ddbcd28b70a7e994260 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -211,6 +211,9 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
>   
>   	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
>   
> +	if (job->finish_at && ktime_before(ktime_get(), job->finish_at))
> +		return DRM_GPU_SCHED_STAT_RUNNING;

Hmm this would prevent testing timeout handling with mock jobs with 
duration set for any future test. It works, but I am thinking if a more 
explicit way wouldn't be better. For example to add a new job flag like 
DRM_MOCK_SCHED_JOB_DONTRESET or similar?

That way test could use the timing insensitive drm_mock_sched_advance() 
and have explicit control of the execution. If you don't mind I think I 
would prefer that.

Regards,

Tvrtko

> +
>   	drm_sched_stop(&sched->base, &job->base);
>   
>   	usleep_range(200, 500);
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 00c691cb3c306f609684f554f17fcb54ba74cb95..669a211b216ee298544ac237abb866077d856586 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -249,8 +249,52 @@ static void drm_sched_basic_timeout(struct kunit *test)
>   	drm_mock_sched_entity_free(entity);
>   }
>   
> +static void drm_sched_skip_reset(struct kunit *test)
> +{
> +	struct drm_mock_scheduler *sched = test->priv;
> +	struct drm_mock_sched_entity *entity;
> +	struct drm_mock_sched_job *job;
> +	bool done;
> +
> +	/*
> +	 * Submit a single job against a scheduler with the timeout configured
> +	 * and verify that if the job is still running, the timeout handler
> +	 * will skip the reset and allow the job to complete.
> +	 */
> +
> +	entity = drm_mock_sched_entity_new(test,
> +					   DRM_SCHED_PRIORITY_NORMAL,
> +					   sched);
> +	job = drm_mock_sched_job_new(test, entity);
> +
> +	drm_mock_sched_job_set_duration_us(job, jiffies_to_usecs(2 * MOCK_TIMEOUT));
> +	drm_mock_sched_job_submit(job);
> +
> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
> +	KUNIT_ASSERT_FALSE(test, done);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
> +			DRM_MOCK_SCHED_JOB_TIMEDOUT);
> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&sched->job_list));
> +
> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
> +	KUNIT_ASSERT_TRUE(test, done);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
> +			DRM_MOCK_SCHED_JOB_TIMEDOUT);
> +
> +	KUNIT_ASSERT_TRUE(test, list_empty(&sched->job_list));
> +	KUNIT_ASSERT_TRUE(test, list_empty(&sched->done_list));
> +
> +	drm_mock_sched_entity_free(entity);
> +}
> +
>   static struct kunit_case drm_sched_timeout_tests[] = {
>   	KUNIT_CASE(drm_sched_basic_timeout),
> +	KUNIT_CASE(drm_sched_skip_reset),
>   	{}
>   };
>   
> 

