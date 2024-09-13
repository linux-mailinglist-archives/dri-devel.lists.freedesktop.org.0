Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F44978514
	for <lists+dri-devel@lfdr.de>; Fri, 13 Sep 2024 17:46:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67BC410ED2B;
	Fri, 13 Sep 2024 15:46:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="npIhw3Eu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F9EC10ED2B;
 Fri, 13 Sep 2024 15:46:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 67FEF5C54DA;
 Fri, 13 Sep 2024 15:45:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D6CC4CEC0;
 Fri, 13 Sep 2024 15:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726242362;
 bh=CoOuK7krvKIeQUu+iqlSYlfh3CNg7MNe6jTVkIfT7x8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=npIhw3EuXXWC6iFHR2cjhe9ush3VPlf84CDuPd6IaZnIlFOA2rPREJHHtogvfNcZu
 w3sBMSUHYTUuQjVh3/GNmK1/20AHIj4NoEUV3ipGNEQXqmh3Q50PeYl/PKfMebiYDZ
 AE1aJq+2i62jKE8qz+SuyDz0y6T94fA2C6F7zLeLLDmkIp8Ryxt/X+vsTA+7e+Niig
 Pytvi3kDAvKjnRYX5wUO22Z8McUvvX0NgEA4VEu7NOjIhK1YUPTI3RJnz4SYGdV/Iy
 5gKO5+WkXLkxq7qzbnrBKDSekamM4QKfcPgNv/EyYoSuNXsNaqRnFIZQcSj3OEGpbt
 +se8f3VXVy4Tg==
Date: Fri, 13 Sep 2024 17:45:58 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Zhang He <zhanghe9702@163.com>
Cc: andi.shyti@linux.intel.com, intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, trivial@kernel.org
Subject: Re: [PATCH] drm/i915/gt: Fixed an typo
Message-ID: <pqfaborarj4ox3q6bhvjohycxlyzkqbs2yrqqjh6qadlve7zai@xekrpdovhuzy>
References: <20240913140721.31165-1-zhanghe9702@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240913140721.31165-1-zhanghe9702@163.com>
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

Hi Zhang,

On Fri, Sep 13, 2024 at 10:07:21PM GMT, Zhang He wrote:
> column header should be GPU, not CPU
> 
> Signed-off-by: Zhang He <zhanghe9702@163.com>

Thanks for having fixed the issues I pointed out. Said that, for
the next patches:

1. Add a versioning. This is version number 2, so that yo uneed
   to do "git format patch -v 2...."
2. Add the changelog: you need to list the differences between
   the two versions, so that people are aware of what changes to
   look for. You can do it after the "---' section in this patch.
   For this patch the difference would be the use of your correct
   name as Author and as Signer.
3. Add the tags that you collected in the previous version of the
   patch. I did review your change, so that you should have added
   my:

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

For now it's OK, your patch is accepted, I will merge it and then
I will notify you.

Thanks for having sent your change and for following up on the
review,
Andi

> ---
>  drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> index 8d08b38874ef..b635aa2820d9 100644
> --- a/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> +++ b/drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c
> @@ -431,7 +431,7 @@ static int llc_show(struct seq_file *m, void *data)
>  		max_gpu_freq /= GEN9_FREQ_SCALER;
>  	}
>  
> -	seq_puts(m, "GPU freq (MHz)\tEffective CPU freq (MHz)\tEffective Ring freq (MHz)\n");
> +	seq_puts(m, "GPU freq (MHz)\tEffective GPU freq (MHz)\tEffective Ring freq (MHz)\n");
>  
>  	wakeref = intel_runtime_pm_get(gt->uncore->rpm);
>  	for (gpu_freq = min_gpu_freq; gpu_freq <= max_gpu_freq; gpu_freq++) {
> -- 
> 2.34.1
> 
