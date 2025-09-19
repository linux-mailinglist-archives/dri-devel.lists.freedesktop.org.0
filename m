Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59CE9B882AD
	for <lists+dri-devel@lfdr.de>; Fri, 19 Sep 2025 09:33:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CD3A10E943;
	Fri, 19 Sep 2025 07:33:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="B6nB/pXd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B33210E943
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Sep 2025 07:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=U91o9Zqc2PJ90qyrV5arZCIif0SuJMRWy4xQnzTZJBk=; b=B6nB/pXdvivQCTb2VWrlgDdWOr
 eK3tGN1CEn5pQOeMazMIf1lcro9ETZT43ZiswQmrCveEl4DcTg71ZX9vUUZRxoGnbqVcfejzUiQrt
 Ffb1LNnixJZOhBjw3j8K/Azf8j92g+FHUXZFfXn0qHgiVMPXW8R82qqzs3R6QNco7b7mNnqceoSKe
 49hT6gQHwleSnd0VSxnWTSXbgix3zN8zUfUtOhaBy6gE1OdT9SWX7bzOKGOL1PHXDlEu9t3Q/OixI
 B9HWz3B1NBsEqvzQRo/pqtoyTV8j1xHu3paNrMDlm0NgsWQ6lGaGX+3DQ9WICoOJPs+bGyI3/L3Ar
 PJeB1vXQ==;
Received: from [84.66.36.92] (helo=[192.168.0.101])
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
 id 1uzVcV-00Dzey-JN; Fri, 19 Sep 2025 09:33:27 +0200
Message-ID: <ad1359c3-86ae-4ed1-ac60-902daa2331a7@igalia.com>
Date: Fri, 19 Sep 2025 08:33:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched/tests: Remove relict of done_list
To: Philipp Stanner <phasta@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250919064450.147176-2-phasta@kernel.org>
Content-Language: en-GB
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
In-Reply-To: <20250919064450.147176-2-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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


On 19/09/2025 07:44, Philipp Stanner wrote:
> A rework of the scheduler unit tests removed the done_list. That list is
> still mentioned in the mock test header.
> 
> Remove that relict.
> 
> Fixes: 4576de9b7977 ("drm/sched/tests: Implement cancel_job() callback")
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>   drivers/gpu/drm/scheduler/tests/sched_tests.h | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/tests/sched_tests.h b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> index 7f31d35780cc..553d45abd057 100644
> --- a/drivers/gpu/drm/scheduler/tests/sched_tests.h
> +++ b/drivers/gpu/drm/scheduler/tests/sched_tests.h
> @@ -31,9 +31,8 @@
>    *
>    * @base: DRM scheduler base class
>    * @test: Backpointer to owning the kunit test case
> - * @lock: Lock to protect the simulated @hw_timeline, @job_list and @done_list
> + * @lock: Lock to protect the simulated @hw_timeline and @job_list
>    * @job_list: List of jobs submitted to the mock GPU
> - * @done_list: List of jobs completed by the mock GPU
>    * @hw_timeline: Simulated hardware timeline has a @context, @next_seqno and
>    *		 @cur_seqno for implementing a struct dma_fence signaling the
>    *		 simulated job completion.

Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

Regards,

Tvrtko

