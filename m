Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D9AC55F5B2
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 07:34:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90AC8113096;
	Wed, 29 Jun 2022 05:34:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ste-pvt-msa1.bahnhof.se (ste-pvt-msa1.bahnhof.se
 [213.80.101.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42A2F112F70;
 Wed, 29 Jun 2022 05:34:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTP id 38BEB40D31;
 Wed, 29 Jun 2022 07:34:33 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bahnhof.se
X-Spam-Flag: NO
X-Spam-Score: -2.11
X-Spam-Level: 
X-Spam-Status: No, score=-2.11 tagged_above=-999 required=6.31
 tests=[BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01, URIBL_BLOCKED=0.001]
 autolearn=ham autolearn_force=no
Authentication-Results: ste-pvt-msa1.bahnhof.se (amavisd-new);
 dkim=pass (1024-bit key) header.d=shipmail.org
Received: from ste-pvt-msa1.bahnhof.se ([127.0.0.1])
 by localhost (ste-pvt-msa1.bahnhof.se [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dHvBiPj_ZNU2; Wed, 29 Jun 2022 07:34:32 +0200 (CEST)
Received: by ste-pvt-msa1.bahnhof.se (Postfix) with ESMTPA id 5970C40D2E;
 Wed, 29 Jun 2022 07:34:29 +0200 (CEST)
Received: from [192.168.0.209] (h-155-4-205-35.A357.priv.bahnhof.se
 [155.4.205.35])
 by mail1.shipmail.org (Postfix) with ESMTPSA id E5B4B360156;
 Wed, 29 Jun 2022 07:34:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=shipmail.org; s=mail;
 t=1656480869; bh=Q4NBmXKQNd4S9R0Q0tluaMDDBb+gkO5M4n/nZzST2s8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cD0Al4nZPkkWhtkupV6UMY9WzNjwA4yOn4lSWUJV5mx3+9fY+LQ+34BxCdZyjAxZD
 8cBZugucs8JUVP2M1t+Qi6I3gaIZTfu6u0retUCaeaek0f0L9TzSSQ8LHH8r4BxhQL
 gReaCzntbjj25n5ZtYikQDB0OQPymOnTyZQyk6lk=
Message-ID: <0971d84e-e8a9-6fda-5620-3eb3f90f3ecb@shipmail.org>
Date: Wed, 29 Jun 2022 07:34:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [Linaro-mm-sig] [PATCH] drm/i915: Remove __dma_fence_is_chain()
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20220628233512.439555-1-robdclark@gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m_=28Intel=29?= <thomas_os@shipmail.org>
In-Reply-To: <20220628233512.439555-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 Matthew Auld <matthew.auld@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/29/22 01:35, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
>
> drive-by cleanup
>
> Signed-off-by: Rob Clark <robdclark@chromium.org>

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>


> ---
>   drivers/gpu/drm/i915/gem/i915_gem_wait.c | 7 +------
>   1 file changed, 1 insertion(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> index 319936f91ac5..667841780514 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
> @@ -73,11 +73,6 @@ static void fence_set_priority(struct dma_fence *fence,
>   	rcu_read_unlock();
>   }
>   
> -static inline bool __dma_fence_is_chain(const struct dma_fence *fence)
> -{
> -	return fence->ops == &dma_fence_chain_ops;
> -}
> -
>   void i915_gem_fence_wait_priority(struct dma_fence *fence,
>   				  const struct i915_sched_attr *attr)
>   {
> @@ -93,7 +88,7 @@ void i915_gem_fence_wait_priority(struct dma_fence *fence,
>   
>   		for (i = 0; i < array->num_fences; i++)
>   			fence_set_priority(array->fences[i], attr);
> -	} else if (__dma_fence_is_chain(fence)) {
> +	} else if (dma_fence_is_chain(fence)) {
>   		struct dma_fence *iter;
>   
>   		/* The chain is ordered; if we boost the last, we boost all */
