Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC0F4984E7
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 17:33:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3138A10E302;
	Mon, 24 Jan 2022 16:33:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9975F10E1EC;
 Mon, 24 Jan 2022 16:33:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643042010; x=1674578010;
 h=message-id:subject:from:to:date:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=ILPcAbLBDRtC79SJgsi8iQ2xqJMuxcjkWNiEEEkqLC8=;
 b=dZaebOEkdiNpqKML51kDzWx897DSLIP+/ccBwqvJMdp7NNbBfrSikPD5
 y2GJ4lNR9T3R857Y9oHq8/Tb0/iWP/Z3ROy5iGIeqLYtykSl7pRJn2klL
 nsg8BQw3jaejkQmeamhTD/fIM9za1FXKMS+matMbXrSlyv2onbmgVAIty
 HKTRBEsOUyZ4X+I0lmYxUoag1ckLHS89AhjDMoaGx8gk6by+/N+RDRVh8
 YdVECIPWBc9OH4cdEqiRG14g603Pb1xAsVtHjxtdFo5M3YEnvjPpgPOLI
 mFT5BMKcOCMWX5nf/bCy83HvHUwirTj0IacofNKyCfkRqjwH8GfUrBXrV Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10236"; a="306800893"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="306800893"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 08:33:30 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="520009594"
Received: from olindum-mobl1.ger.corp.intel.com (HELO [10.249.254.70])
 ([10.249.254.70])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 08:33:27 -0800
Message-ID: <e0138a97e91678c0bd8d06071b6398c09d9c4142.camel@linux.intel.com>
Subject: Re: [PATCH 01/11] drm/radeon: use ttm_resource_manager_debug
From: Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
To: Christian =?ISO-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>, 
 sumit.semwal@linaro.org, gustavo@padovan.org, daniel.vetter@ffwll.ch, 
 zackr@vmware.com, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org,  intel-gfx@lists.freedesktop.org
Date: Mon, 24 Jan 2022 17:33:25 +0100
In-Reply-To: <20220124130328.2376-2-christian.koenig@amd.com>
References: <20220124130328.2376-1-christian.koenig@amd.com>
 <20220124130328.2376-2-christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-2.fc34) 
MIME-Version: 1.0
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

On Mon, 2022-01-24 at 14:03 +0100, Christian König wrote:
> Instead of calling the debug operation directly.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> Reviewed-by: Huang Rui <ray.huang@amd.com>

The first two patches seem unrelated to the series. Also is there a
chance of a series cover-letter?

Thanks,
Thomas



> ---
>  drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c
> b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 11b21d605584..0d1283cdc8fb 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -802,7 +802,7 @@ static int radeon_mm_vram_dump_table_show(struct
> seq_file *m, void *unused)
>                                                            
> TTM_PL_VRAM);
>         struct drm_printer p = drm_seq_file_printer(m);
>  
> -       man->func->debug(man, &p);
> +       ttm_resource_manager_debug(man, &p);
>         return 0;
>  }
>  
> @@ -820,7 +820,7 @@ static int radeon_mm_gtt_dump_table_show(struct
> seq_file *m, void *unused)
>                                                            
> TTM_PL_TT);
>         struct drm_printer p = drm_seq_file_printer(m);
>  
> -       man->func->debug(man, &p);
> +       ttm_resource_manager_debug(man, &p);
>         return 0;
>  }
>  


