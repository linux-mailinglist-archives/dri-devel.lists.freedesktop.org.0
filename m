Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 995FFACAB7A
	for <lists+dri-devel@lfdr.de>; Mon,  2 Jun 2025 11:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 029CD10E4DE;
	Mon,  2 Jun 2025 09:34:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="dzuVkQPG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09F710E4D8;
 Mon,  2 Jun 2025 09:34:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/QGNQ0M7JKXU87bamlcCASAmNmkwaRuX75JE5c3F9Ng=; b=dzuVkQPGkk/FR2UKQWNmxDKB4E
 r0iatD1eF6q2/L6sexll3FA7Ba9iCttz9WvZ0MKLNLwb9D7Iot15vqCFmTDNQXY3x2HxqHKW1HPz+
 LCd9EKTvkWIz59UYYAzNLp2Q81/IC7iho4zK86a+S/UN6JX17v1bZVJCRV9JAv6jQKbZKVsMj/LRn
 Rhk6WOakjhp6Dkv5ygCk8vt0UQnQerHdNh5c+AqxU8edcmikYQpNkvEEPh5LNRsxBkJ25SQsUOV/m
 9jys1fLgsIs4VTFzg6HTMFjP5awrk366+jt3E9AIjcqhfTU6PHmqRWJ2EzBdDE082/lMhJNu59P8A
 nZjR4HHg==;
Received: from [81.79.92.254] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uM1Yh-00GE3I-PR; Mon, 02 Jun 2025 11:34:19 +0200
Message-ID: <ebf3d2f9-3358-439d-9a18-a37c328ebe57@igalia.com>
Date: Mon, 2 Jun 2025 10:34:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/8] drm/sched: Add new test for
 DRM_GPU_SCHED_STAT_NO_HANG
To: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 Philipp Stanner <phasta@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Melissa Wen <mwen@igalia.com>, Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 etnaviv@lists.freedesktop.org, intel-xe@lists.freedesktop.org
References: <20250530-sched-skip-reset-v2-0-c40a8d2d8daa@igalia.com>
 <20250530-sched-skip-reset-v2-4-c40a8d2d8daa@igalia.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250530-sched-skip-reset-v2-4-c40a8d2d8daa@igalia.com>
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


On 30/05/2025 15:01, Maíra Canal wrote:
> Add a test to submit a single job against a scheduler with the timeout
> configured and verify that if the job is still running, the timeout
> handler will skip the reset and allow the job to complete.
> 
> Signed-off-by: Maíra Canal <mcanal@igalia.com>
> ---
>   drivers/gpu/drm/scheduler/tests/mock_scheduler.c |  5 +++
>   drivers/gpu/drm/scheduler/tests/sched_tests.h    |  1 +
>   drivers/gpu/drm/scheduler/tests/tests_basic.c    | 43 ++++++++++++++++++++++++
>   3 files changed, 49 insertions(+)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> index fdf5f34b39e02c8a8648d8bea566a27fd3251516..39429f5cd19ee3c23816f257d566b47d3daa4baa 100644
> --- a/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> +++ b/drivers/gpu/drm/scheduler/tests/mock_scheduler.c
> @@ -208,6 +208,11 @@ mock_sched_timedout_job(struct drm_sched_job *sched_job)
>   
>   	job->flags |= DRM_MOCK_SCHED_JOB_TIMEDOUT;
>   
> +	if (job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET) {
> +		job->flags &= ~DRM_MOCK_SCHED_JOB_DONT_RESET;

If it isn't important to clear the flag I would consider omitting it.

> +		return DRM_GPU_SCHED_STAT_NO_HANG;
> +	}
> +
>   	return DRM_GPU_SCHED_STAT_RESET;
>   }
>   
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 27caf8285fb74b9f3c9ce2daa1c44d4a0c967e92..5259f181e55387c41efbcd3f6addc9465331d787 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -98,6 +98,7 @@ struct drm_mock_sched_job {
>   
>   #define DRM_MOCK_SCHED_JOB_DONE		0x1
>   #define DRM_MOCK_SCHED_JOB_TIMEDOUT	0x2
> +#define DRM_MOCK_SCHED_JOB_DONT_RESET	0x4
>   	unsigned long		flags;
>   
>   	struct list_head	link;
> diff --git a/drivers/gpu/drm/scheduler/tests/tests_basic.c b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> index 41c648782f4548e202bd8711b45d28eead9bd0b2..2ba2d1b0c3cad9626ab9d89cfae05244c670a826 100644
> --- a/drivers/gpu/drm/scheduler/tests/tests_basic.c
> +++ b/drivers/gpu/drm/scheduler/tests/tests_basic.c
> @@ -246,8 +246,51 @@ static void drm_sched_basic_timeout(struct kunit *test)
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
> +	job->flags = DRM_MOCK_SCHED_JOB_DONT_RESET;
> +
> +	drm_mock_sched_job_set_duration_us(job, jiffies_to_usecs(2 * MOCK_TIMEOUT));

Might be easier to not set the duration but advance the job manually 
after the timeout assert. One time based interaction less.

> +	drm_mock_sched_job_submit(job);
> +
> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
> +	KUNIT_ASSERT_FALSE(test, done);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_TIMEDOUT,
> +			DRM_MOCK_SCHED_JOB_TIMEDOUT);
> +
> +	KUNIT_ASSERT_EQ(test,
> +			job->flags & DRM_MOCK_SCHED_JOB_DONT_RESET,
> +			0);


Wait_finished for 200ms is equal to the configured job timeout so could 
this be a bit racy? Safer to wait for 2 * MOCK_TIMEOUT I think.

(I also wonder whether I should have made the flags bit operations 
atomic so the visibility between CPU cores running different threads is 
guaranteed. I might follow up with that tweak.)

> +
> +	KUNIT_ASSERT_FALSE(test, list_empty(&sched->job_list));

Going back to my first comment - if you remove the set_duration and 
instead of this assert have do KUNIT_ASSERT_EQ(drm_mock_sched_advance(), 
1) I think that should be good enough and simpler.

Regards,

Tvrtko

> +
> +	done = drm_mock_sched_job_wait_finished(job, MOCK_TIMEOUT);
> +	KUNIT_ASSERT_TRUE(test, done);
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

