Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14016686093
	for <lists+dri-devel@lfdr.de>; Wed,  1 Feb 2023 08:28:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 879C910E161;
	Wed,  1 Feb 2023 07:28:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9156810E161;
 Wed,  1 Feb 2023 07:28:46 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id be12so5445017edb.4;
 Tue, 31 Jan 2023 23:28:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KEdukf2kl5dSoPSmuYiDO/g3nAB794T7JbxgFFpeAYE=;
 b=Oyl4vyKT4DZ7K1+kfhSG0HYFGJRPsewjY7vHGxrFc7tVci41b4t2QnUvicIl+vxi6N
 UueFFUZQj/M+zKeTs2QtcqIE2VMKR2CDPKJ2PhfR3uJa7+ZLxayP8XF68sawAhv2JxCD
 247usLEXl03NspHYS3U7BOPYh9aN3s5GvSKOy315AF4mw48rScuSpflLpdAaYib0fTXn
 21ZtJE3JHWv59nWBQhtD6fY4NNEKmdoFaGmvZRN3f1UFMWLZja4qvS+T6+0ewthh1MBs
 NOuv4qvm8jDYxoozv4JOetBY08ITMAvbozu7VfnE0A+TI7FBI2mnPv5POTZJq90UV8be
 7vwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KEdukf2kl5dSoPSmuYiDO/g3nAB794T7JbxgFFpeAYE=;
 b=6CaLVm38MloLMhGwek+xgV1Sq5PWVm4c+DjwMBjvpz8Iw0ExqkiImv2gItBydtHaWl
 dKDw6819SEDfEC2TqTht7wzDcrIQDiKGLQ53KAkw9+DGVu4mQzly/C3g0xrYtvDnD0Jv
 5pL8CL/GTkM6QhDpEuIVfjVh6ztIt/uXYgqCWR7USL6zYvQV3vkU9JTqGwGMJjyW66Ud
 gjakkGSzyEjW7sRcpUrrciVjHUtCrHv3yYzhap/To6st/j+EpI4dQ290Y54/mA5GYCgR
 wBLMPGUabVqVNnYMWM7d4Wh+IBUSGwKoa3AW3jUrNo1+StZ9s64ZnTl56eoQ85khgE3q
 Frhg==
X-Gm-Message-State: AO0yUKUp08BX87VnPBtMd8sLXjUSbtSU3+ymcurCXFnk2p1H/h/ZBSjt
 RieX/tvkPQeJ4W13DVxSq5PeIVUMjXs=
X-Google-Smtp-Source: AK7set//RAgjerJfdEC9lYhVIOULsvoTxufrEFAGP6SLFe6RxPU5X0HrWat+hIXJYDJeOv6dRZe50w==
X-Received: by 2002:a05:6402:31f3:b0:4a2:4a89:22e5 with SMTP id
 dy19-20020a05640231f300b004a24a8922e5mr976370edb.11.1675236525029; 
 Tue, 31 Jan 2023 23:28:45 -0800 (PST)
Received: from ?IPV6:2a02:908:1256:79a0:6ad1:ca73:7539:3ce6?
 ([2a02:908:1256:79a0:6ad1:ca73:7539:3ce6])
 by smtp.gmail.com with ESMTPSA id
 b20-20020aa7d494000000b0049b58744f93sm9341067edr.81.2023.01.31.23.28.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Jan 2023 23:28:44 -0800 (PST)
Message-ID: <fd10ed8e-a853-4aee-f803-eb5d90730d03@gmail.com>
Date: Wed, 1 Feb 2023 08:28:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 1/6] drm/i915/ttm: fix sparse warning
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, intel-gfx@lists.freedesktop.org
References: <20230130101230.25347-1-matthew.auld@intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20230130101230.25347-1-matthew.auld@intel.com>
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
Cc: kernel test robot <lkp@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 30.01.23 um 11:12 schrieb Matthew Auld:
> Sparse complains with:
>
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1066:21: sparse:
> 	expected restricted vm_fault_t [assigned] [usertype] ret
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:1066:21: sparse: got int
>
> Fixes: 516198d317d8 ("drm/i915: audit bo->resource usage v3")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
> Cc: Christian König <ckoenig.leichtzumerken@gmail.com>

Acked-by: Christian König <christian.koenig@amd.com> for the i915 patches.

I'm on vacation this week. going to push this to drm-misc-next when I'm 
back unless someone is faster.

Thanks,
Christian.

> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 5 +++--
>   1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 7420276827a5..4758f21c91e1 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1067,11 +1067,12 @@ static vm_fault_t vm_fault_ttm(struct vm_fault *vmf)
>   			.interruptible = true,
>   			.no_wait_gpu = true, /* should be idle already */
>   		};
> +		int err;
>   
>   		GEM_BUG_ON(!bo->ttm || !(bo->ttm->page_flags & TTM_TT_FLAG_SWAPPED));
>   
> -		ret = ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
> -		if (ret) {
> +		err = ttm_bo_validate(bo, i915_ttm_sys_placement(), &ctx);
> +		if (err) {
>   			dma_resv_unlock(bo->base.resv);
>   			return VM_FAULT_SIGBUS;
>   		}

