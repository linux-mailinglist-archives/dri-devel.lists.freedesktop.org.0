Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73AC8C8C396
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 23:33:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 749DC10E6ED;
	Wed, 26 Nov 2025 22:33:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="qWMB7gch";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E84689CC1;
 Wed, 26 Nov 2025 22:33:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3880C42E51;
 Wed, 26 Nov 2025 22:33:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C744C4CEF7;
 Wed, 26 Nov 2025 22:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764196383;
 bh=7Ct7uOMrWpgwBo1dfjc42myZkFavQ4K32rkkdeRtH/Y=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qWMB7gchRkVrfZlY3QMDFMcCwjsnsT5KZqFcH6rU2RBTslXL4YsP6k0UHAz5YQ+/6
 0LoiU3bntvAzH+hoXy+lO+iAUIqRsd/rp/93MvHWOLyZrGtC1AEGal8TIDrembNF+g
 HXLb7rQEfaTJ9zLGYpAjo2FXf6Jno1jg/l2/EKixIuBf2psqyaq8iTcQJ6dpiZs8bh
 8rryo1aRtjk75e9KLDvWfUikXnyyVsTNBaFmrj9GKvZfUXydwQosPOWjTVKrNJ8FSs
 QpNNQ2B2w2M3t96i1VIEUanvJacH1jHmX0kSlma0v3Ksjbb0wp4F/x0YnzNhEh1iLB
 d1trTdgooJbjQ==
Date: Wed, 26 Nov 2025 23:32:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Gustavo Padovan <gustavo@padovan.org>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, 
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Subject: Re: [PATCH 1/6] dma-buf/dma-fence: Add dma_fence_test_signaled_flag()
Message-ID: <3b7b26uc566c3j4elnnkii5wvxvgqgnjsvwxpihz2cifupfnwa@cokmciv5umcg>
References: <20251126131914.149445-2-phasta@kernel.org>
 <20251126131914.149445-3-phasta@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126131914.149445-3-phasta@kernel.org>
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

Hi Philipp,

> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 39e6f93dc310..25117a906846 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -372,8 +372,7 @@ int dma_fence_signal_timestamp_locked(struct dma_fence *fence,
>  
>  	lockdep_assert_held(fence->lock);
>  
> -	if (unlikely(test_and_set_bit(DMA_FENCE_FLAG_SIGNALED_BIT,
> -				      &fence->flags)))
> +	if (unlikely(dma_fence_test_signaled_flag(fence)))
>  		return -EINVAL;

Please, drop this change.

Andi
