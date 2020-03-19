Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B0CA18AAFA
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 04:11:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6546E97F;
	Thu, 19 Mar 2020 03:11:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9595E6E97F;
 Thu, 19 Mar 2020 03:10:59 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id f3so900816wrw.7;
 Wed, 18 Mar 2020 20:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0PbEVnPMN2MJETRJ/beHdjai+kDkd1vOhYugO2rPEs8=;
 b=bvjcInVk0w5Aga/UGdqj1hEY4Ynhx9oV7IpR4MXUvBalcxgYkpZnSbw3iRV1p9w1OR
 WCQqQbekNyhfkdLKdvCEeTgHK3SOR7ohpnNqJevCFxKOeUbPmxMC310ChfJagsqfybEx
 +ZjRAmDrVsFinrPklnymNG+vOTsNMSyKoV2YdgURGil2t32W0UJGjq1/1VePrcMYEmqg
 Fy1R0IahA7qoJWnBY0LFkzgqqwITnl2fkMeZyKYtHtoz89WunQfe0VR9x5t6WJL89LPP
 z90qJILdBU20Af1HdxivAv7enIyOg+s1edXbwCE/I5okp0tp62kG/yI2VPUG80OydD5v
 VtnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0PbEVnPMN2MJETRJ/beHdjai+kDkd1vOhYugO2rPEs8=;
 b=PcHXWwuesFe0xrzYjV/QCGUFgKNC/VS0awQt7ymIGW0tCwJbYKg20D47y+XTnFJcWj
 Nl0CnmaXe+amSEioyS9Qpt/c1Lq8/lIyn/eP/I+wR0AojVcNOuI5sN3Fr0upzaDDKa8F
 lIsEHdIe6yWBbHWRBEXRbsD3hiJvaNZedyW9tprZoh6dEU6rPRvtW7atzO9ipH9cIi6I
 mjuqoYR4ocF+LEr+cFD9a+kZmow0MMsuu+FhQJCPqlEVVh2BHHZ0cMBlclEsrSnWK/m3
 +wLDknMimo76tYc8iiQETPKp+uG4ppNXJ+c/WdUEayOODehVu5RIf4vFsCyb0+SCRobo
 G8OQ==
X-Gm-Message-State: ANhLgQ3cZ70AaFAliyqc1O1liKlgR/waQGwvmp5dVt5ir1rZXBTuCZaZ
 g7940LSQYgdvHZXnbzKwXWYI/DBTnHc06Cn67DM=
X-Google-Smtp-Source: ADFU+vugH3dqSBl+xKkWc8E05RpY1YdIeD+1zAQpVyPrfmmrhyEY5oVhwEWdnhf3FHZ/BEBiDfkzNF2Fo8uU0Bx4shk=
X-Received: by 2002:adf:e447:: with SMTP id t7mr1239757wrm.374.1584587458151; 
 Wed, 18 Mar 2020 20:10:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200317114748.388420-1-colin.king@canonical.com>
In-Reply-To: <20200317114748.388420-1-colin.king@canonical.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 18 Mar 2020 23:10:47 -0400
Message-ID: <CADnq5_NbdBhz+TQ0Ldng8fLjnRmDiuKDhTrqsC0WDt8-0Vq41g@mail.gmail.com>
Subject: Re: [PATCH][next] drm: amd: fix spelling mistake "shoudn't" ->
 "shouldn't"
To: Colin King <colin.king@canonical.com>
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
Cc: David Airlie <airlied@linux.ie>, Felix Kuehling <Felix.Kuehling@amd.com>,
 kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 7:47 AM Colin King <colin.king@canonical.com> wrote:
>
> From: Colin Ian King <colin.king@canonical.com>
>
> There are spelling mistakes in pr_err messages and a comment. Fix these.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

The relevant code was recently dropped so no longer applies.

Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c       | 2 +-
>  drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c        | 2 +-
>  drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> index d1cdcb404f7c..4bdf425ca6d8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v10_0.c
> @@ -246,7 +246,7 @@ static void gfx_v10_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
>         grbm_idx = adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] + mmGRBM_GFX_INDEX;
>
>         if (amdgpu_sriov_runtime(adev)) {
> -               pr_err("shoudn't call rlcg write register during runtime\n");
> +               pr_err("shouldn't call rlcg write register during runtime\n");
>                 return;
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> index 7bc2486167e7..2dd40f23ce83 100644
> --- a/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> +++ b/drivers/gpu/drm/amd/amdgpu/gfx_v9_0.c
> @@ -747,7 +747,7 @@ void gfx_v9_0_rlcg_wreg(struct amdgpu_device *adev, u32 offset, u32 v)
>         grbm_idx = adev->reg_offset[GC_HWIP][0][mmGRBM_GFX_INDEX_BASE_IDX] + mmGRBM_GFX_INDEX;
>
>         if (amdgpu_sriov_runtime(adev)) {
> -               pr_err("shoudn't call rlcg write register during runtime\n");
> +               pr_err("shouldn't call rlcg write register during runtime\n");
>                 return;
>         }
>
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
> index bb77b8890e77..78714f9a8b11 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
> @@ -316,7 +316,7 @@ static void kfd_init_apertures_vi(struct kfd_process_device *pdd, uint8_t id)
>  {
>         /*
>          * node id couldn't be 0 - the three MSB bits of
> -        * aperture shoudn't be 0
> +        * aperture shouldn't be 0
>          */
>         pdd->lds_base = MAKE_LDS_APP_BASE_VI();
>         pdd->lds_limit = MAKE_LDS_APP_LIMIT(pdd->lds_base);
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
