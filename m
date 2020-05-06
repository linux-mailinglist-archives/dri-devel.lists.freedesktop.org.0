Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4361C7B01
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 22:13:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16BF26E8D7;
	Wed,  6 May 2020 20:13:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 315D46E8D6;
 Wed,  6 May 2020 20:13:04 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id r26so4201649wmh.0;
 Wed, 06 May 2020 13:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CQXu6qiBdsMbiwQs775wLdxHmIoYyYCw2HkkXI8iCiM=;
 b=oAASn2fhX1d3fS49Xxknj9yfTPO8EnNtsxycBdCmDaz2giaGlhBUl+TEQ+eLSHsRfI
 SJkK96frJS5FeUw4N92TIkhpAsJ4oqkP05mQFjWKvgaliut6re99sRdYevKEnwoy0mpQ
 wCTSLcWCrVx5rdu9TQB178NxpHnDZNpKXoFMoT27QAAYzMvf7cX5RZQzF5t7w7csCaa/
 LtczzmVONdcX62q2D4DLg3vfvndOpdnH249U9yAVawxFQFhj7/ImXr0fsOP4OPtG/JDx
 Tgh849qZ0dwHSczdxxLL7XnBwTFS3wCaOBHlYfm/RmjLMsQu13RyvdhgBn6AfazZDNbY
 2OLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CQXu6qiBdsMbiwQs775wLdxHmIoYyYCw2HkkXI8iCiM=;
 b=TgYbsiBCnsV3WSQ97mcWaeHshNSuzBytNG7sggzRy1FEfOTla5q4DrGFMuI0HmktvS
 nqrlEPShcSzx3YESpQf4KJ/EqqlAZ8Vep0HpxlJ/o0AGwcQTuFrGCUY8mL622sta/4QE
 TKGYB2kwf7mEomdM/C9hMuHrMjXdhPHMdTJiFpoA0EB9XBZubkdceqtvlFUFTWj2PIJK
 dmfHI2XdcdRzJ6G1a9A7Y4mhR/gGs3ndLUflu2zYmURASAZlKpT37XvKTEIbKtNuPwEE
 LL55RiQ0pJ9cVyl0GcXTSu/MpacZnsu8k7j3gbLBJ0dKi9rm/ZkH/7tuzwL6s7NI6+PD
 vptQ==
X-Gm-Message-State: AGi0PuYkg9Hvt/HafTmi8mjOi/EKF7Tp86vWYvM53EAIXwmwxDM/MQLd
 K+NwrXjiK6pUajHDBMT+VoX4r4GAJjGoJjA5r5k=
X-Google-Smtp-Source: APiQypKRQKO3Q2/p/FaxM8K5gRA/oIF6pQM3VKqfrTZiKjtlPwJ6lWke1sLNT//hyz8pZpScmcU3O3TUJH3cHKy4kUk=
X-Received: by 2002:a05:600c:243:: with SMTP id 3mr2490507wmj.73.1588795982735; 
 Wed, 06 May 2020 13:13:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200506051113.223327-1-chentao107@huawei.com>
In-Reply-To: <20200506051113.223327-1-chentao107@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 6 May 2020 16:12:51 -0400
Message-ID: <CADnq5_Nz4LjOwfgA6---RSQmMjXOPjii4M-3qYmXW7ECbjdcwg@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amdgpu/navi10: fix unsigned comparison with 0
To: ChenTao <chentao107@huawei.com>
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 6, 2020 at 3:03 AM ChenTao <chentao107@huawei.com> wrote:
>
> Fixes warning because size is uint32_t and can never be negtative
>
> drivers/gpu/drm/amd/amdgpu/../powerplay/navi10_ppt.c:1296:12: warning:
> comparison of unsigned expression < 0 is always false [-Wtype-limits]
>    if (size < 0)
>
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: ChenTao <chentao107@huawei.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/powerplay/navi10_ppt.c | 2 --
>  1 file changed, 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> index 2184d247a9f7..0c9be864d072 100644
> --- a/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> +++ b/drivers/gpu/drm/amd/powerplay/navi10_ppt.c
> @@ -1293,8 +1293,6 @@ static int navi10_set_power_profile_mode(struct smu_context *smu, long *input, u
>         }
>
>         if (smu->power_profile_mode == PP_SMC_POWER_PROFILE_CUSTOM) {
> -               if (size < 0)
> -                       return -EINVAL;
>
>                 ret = smu_update_table(smu,
>                                        SMU_TABLE_ACTIVITY_MONITOR_COEFF, WORKLOAD_PPLIB_CUSTOM_BIT,
> --
> 2.22.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
