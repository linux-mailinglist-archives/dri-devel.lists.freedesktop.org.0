Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E6CD4CCFFA
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 09:33:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB26110F8C8;
	Fri,  4 Mar 2022 08:33:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F6E10F8C6;
 Fri,  4 Mar 2022 08:33:16 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id hw13so15859033ejc.9;
 Fri, 04 Mar 2022 00:33:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lDiOxjq8VtEYhY51PjP5Jo5kppkOrtHrp1SH5d1zTiw=;
 b=WuzmpDWLP6LMICAashm3BAp+W+G+CXDZ0Ze5FwHyE/ne8/NbWnRv/j56zqPbw6x7uz
 Lq+c4jQcI+ZO1HEdL9UJGlJj2gric65ba+nXc8h71lkbAJuQfA/8qwTgy+df7P8S7WkB
 jHl9dzLeWEPfgWMaFDZ+d/avAzvoBi6G5x8MyPoe6JUszHKpZy5quMBjfjRBQ0maOtLe
 KbD7MYrbUKxBoG/DJqdBx9URft6RDbS9WTAgL+N+8lMpycwCNTLQSHxGgNryK2JaN1Cs
 9/Mn1yBJfDOkuiT0ddxq7P3nHchd+2SC+dTe6rIVwP9uExVDCjTlJM7Ywk63S8lyijP3
 J6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lDiOxjq8VtEYhY51PjP5Jo5kppkOrtHrp1SH5d1zTiw=;
 b=XsmjYA0mbpmWxVGlIkjYSZNuTVkHhg/jYxiumJXsNL1n5HgBF0o9zvvNEODI4G0+h9
 LINbR9stW2aapOvBfyPgOenrR+ZSFrLMn5vtaA/UwOdMMeiDqz7fRBfUi8IBDQJArYCy
 u5Mpx5diL19VILpTjmi9TeAa7SwPZFxpMFW0gtX4sKbJD/TScffjmPisroXp7ZW/gSJk
 bcRmhieFrMVJ3a2KDUr61Rc75E81rFtpQ5f0ERzk9XoO1AJTKm5ov+IpQ7VgX/bKy7Yf
 FCXNqh4Hr9EbqSys7JQZVcC2bGFmmtxKxR4V1N7vIaAiR/7EAaRbWx4JOSPsq5sLYe9H
 AcAQ==
X-Gm-Message-State: AOAM530PWI8DDGgQc68OFMoz8W9vUuCVIWT77XsauMccR0BhIo9urSyJ
 U/NwqU7uNZixZoluWxeFtcw=
X-Google-Smtp-Source: ABdhPJwjHXO6A5HxJWJqm04oZvcDeq/6Wsc6jK18km2ZhgGx4zFjItWl9NDMD/krZKlyA20vpb0n4Q==
X-Received: by 2002:a17:907:e8c:b0:6d7:1289:278b with SMTP id
 ho12-20020a1709070e8c00b006d71289278bmr12324307ejc.355.1646382795122; 
 Fri, 04 Mar 2022 00:33:15 -0800 (PST)
Received: from [192.168.178.21] (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 q15-20020a1709060e4f00b006cdf4535cf2sm1518361eji.67.2022.03.04.00.33.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 00:33:14 -0800 (PST)
Message-ID: <4b1cf649-5f0a-33cb-032d-aefb616ce877@gmail.com>
Date: Fri, 4 Mar 2022 09:33:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm/selftests: fix a shift-out-of-bounds bug
Content-Language: en-US
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220303201602.2365-1-Arunpravin.PaneerSelvam@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <20220303201602.2365-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, oliver.sang@intel.com, matthew.auld@intel.com,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 03.03.22 um 21:16 schrieb Arunpravin:
> pass the correct size value computed using the max_order.
>
> <log snip>
>
> [ 68.124177][ T1] UBSAN: shift-out-of-bounds in include/linux/log2.h:67:13
> [ 68.125333][ T1] shift exponent 4294967295 is too large for 32-bit type 'long
> unsigned int'
> [ 68.126563][ T1] CPU: 0 PID: 1 Comm: swapper Not tainted
> 5.17.0-rc2-00311-g39ec47bbfd5d #2
> [ 68.127758][ T1] Call Trace:
> [ 68.128187][ T1] dump_stack_lvl (lib/dump_stack.c:108)
> [ 68.128793][ T1] dump_stack (lib/dump_stack.c:114)
> [ 68.129331][ T1] ubsan_epilogue (lib/ubsan.c:152)
> [ 68.129958][ T1] __ubsan_handle_shift_out_of_bounds.cold (arch/x86/include/asm/smap.h:85)
>
> [ 68.130791][ T1] ? drm_block_alloc+0x28/0x80
> [ 68.131582][ T1] ? rcu_read_lock_sched_held (kernel/rcu/update.c:125)
> [ 68.132215][ T1] ? kmem_cache_alloc (include/trace/events/kmem.h:54 mm/slab.c:3501)
> [ 68.132878][ T1] ? mark_free+0x2e/0x80
> [ 68.133524][ T1] drm_buddy_init.cold (include/linux/log2.h:67
> drivers/gpu/drm/drm_buddy.c:131)
> [ 68.134145][ T1] ? test_drm_cmdline_init (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
>
> [ 68.134770][ T1] igt_buddy_alloc_limit (drivers/gpu/drm/selftests/test-drm_buddy.c:30)
> [ 68.135472][ T1] ? vprintk_default (kernel/printk/printk.c:2257)
> [ 68.136057][ T1] ? test_drm_cmdline_init (drivers/gpu/drm/selftests/test-drm_buddy.c:87)
>
> [ 68.136812][ T1] test_drm_buddy_init (drivers/gpu/drm/selftests/drm_selftest.c:77
> drivers/gpu/drm/selftests/test-drm_buddy.c:95)
> [ 68.137475][ T1] do_one_initcall (init/main.c:1300)
> [ 68.138111][ T1] ? parse_args (kernel/params.c:609 kernel/params.c:146
> kernel/params.c:188)
> [ 68.138717][ T1] do_basic_setup (init/main.c:1372 init/main.c:1389 init/main.c:1408)
> [ 68.139366][ T1] kernel_init_freeable (init/main.c:1617)
> [ 68.140040][ T1] ? rest_init (init/main.c:1494)
> [ 68.140634][ T1] kernel_init (init/main.c:1504)
> [ 68.141155][ T1] ret_from_fork (arch/x86/entry/entry_32.S:772)
> [ 68.141607][ T1]
> ================================================================================
> [ 68.146730][ T1] ------------[ cut here ]------------
> [ 68.147460][ T1] kernel BUG at drivers/gpu/drm/drm_buddy.c:140!
> [ 68.148280][ T1] invalid opcode: 0000 [#1]
> [ 68.148895][ T1] CPU: 0 PID: 1 Comm: swapper Not tainted
> 5.17.0-rc2-00311-g39ec47bbfd5d #2
> [ 68.149896][ T1] EIP: drm_buddy_init (drivers/gpu/drm/drm_buddy.c:140 (discriminator 1))
>
> For more details: https://lists.01.org/hyperkitty/list/lkp@lists.01.org/thread/FDIF3HCILZNN5UQAZMOR7E3MQSMHHKWU/
>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> Reported-by: kernel test robot <oliver.sang@intel.com>

Acked-by: Christian König <christian.koenig@amd.com>

> ---
>   drivers/gpu/drm/selftests/test-drm_buddy.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
> index fa997f89522b..913cbd7eae04 100644
> --- a/drivers/gpu/drm/selftests/test-drm_buddy.c
> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
> @@ -902,14 +902,13 @@ static int igt_buddy_alloc_range(void *arg)
>   
>   static int igt_buddy_alloc_limit(void *arg)
>   {
> -	u64 end, size = U64_MAX, start = 0;
> +	u64 size = U64_MAX, start = 0;
>   	struct drm_buddy_block *block;
>   	unsigned long flags = 0;
>   	LIST_HEAD(allocated);
>   	struct drm_buddy mm;
>   	int err;
>   
> -	size = end = round_down(size, 4096);
>   	err = drm_buddy_init(&mm, size, PAGE_SIZE);
>   	if (err)
>   		return err;
> @@ -921,7 +920,8 @@ static int igt_buddy_alloc_limit(void *arg)
>   		goto out_fini;
>   	}
>   
> -	err = drm_buddy_alloc_blocks(&mm, start, end, size,
> +	size = mm.chunk_size << mm.max_order;
> +	err = drm_buddy_alloc_blocks(&mm, start, size, size,
>   				     PAGE_SIZE, &allocated, flags);
>   
>   	if (unlikely(err))
>
> base-commit: 6be340ee8f5beae574dae6f5e17a22e67beeff3e

