Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0680249EC5A
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jan 2022 21:17:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74CEC10E854;
	Thu, 27 Jan 2022 20:17:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7340010E850;
 Thu, 27 Jan 2022 20:17:02 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso3669411otr.6; 
 Thu, 27 Jan 2022 12:17:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=S9nhsDmOcZy3e7k+eV9ednENX32ChQNKTBKlc41Zhe0=;
 b=kr8dlhmEUis7JV/3W40XxogMFWgURfYVZ6PtKuEt2bVDe2fhzo+IfZ4GdfCh2QnGpH
 EUqVMSUZvSt62ur0geqwsV0HRP05IHSXBYIUc1WgIZBILDDyTWi1AyL81wxhXw8icPj1
 ucILHCEkJe8eUpT172hiytFZabGRgvpDTWaRYdj+YlG4wpGufvcY2Cy1DpO4qrSbJDIV
 sxWSxHOxjtVmXsgWBesCgx+I12NVQ0NuZEdwDUCawmumUQL+q9MMh0kwiQeWB2aPH1eX
 dqpzldsOWYQPQv9QS2YsajUKVm2yLj2dMOU8sFzvdfhsEZeigpuzxXl6HtLcgZQzr7nu
 IB8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=S9nhsDmOcZy3e7k+eV9ednENX32ChQNKTBKlc41Zhe0=;
 b=PWoWMZJh35euhoUazfZWmCBOHLL/p50qzAXf+6TAVCrSAXhSJWpJwD/Oj4Jas3+0lp
 nzFYd3Su7Fs7Qz0nvA4jdQcBK19VTAlhXEse15bCnbamBR8jT2jT4hxx/4FE9ZYlEtOk
 TDW9qo9rbNvfrWXuBfbTqVc59aCB/L670rRf8iFr8xP4MnPH/79MmbqvemDvpIslVgW6
 6zoOZB2CM75Q46Eo7iRqCGpvxscMjNq4M47x4lg9qbhTiKUgxv73BtDMkHQnr6VuhyE8
 Qjp2XwTQWjE4q0TOks/sffMeLt2oy2Zp9SOKR/wTolZVsXa6xMQ7y30GRcxtzTCO0Kdc
 IjMQ==
X-Gm-Message-State: AOAM530CXmFGyZaNMHPN/oaWOaK4XRGPI8HOKsvblxkWyS+qVwdjEEG6
 7YaJ925nlhDhwMF/p3kvL/tIG2b07Kt0y1HA6f4=
X-Google-Smtp-Source: ABdhPJynZsd7uV+C04xwLfNo9ix6iZk4Ifaq05n6r9hKhHX/upZlFUtrfygJJ0gV6h1fLwgfTX38sR9ST76NHj8Ijyc=
X-Received: by 2002:a9d:e94:: with SMTP id 20mr3015234otj.200.1643314621797;
 Thu, 27 Jan 2022 12:17:01 -0800 (PST)
MIME-Version: 1.0
References: <20220126091602.1647-1-jinsdb@126.com>
In-Reply-To: <20220126091602.1647-1-jinsdb@126.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 27 Jan 2022 15:16:50 -0500
Message-ID: <CADnq5_PUmz=G2LbCQEF9==K4GLRNbRWAMp+4V3N_ZpgV1DCB3A@mail.gmail.com>
Subject: Re: [PATCH] drm/amdgpu: Wrong order for config and counter_id
 parameters
To: Qu Huang <jinsdb@126.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Dave Airlie <airlied@linux.ie>, xinhui pan <Xinhui.Pan@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Wed, Jan 26, 2022 at 4:48 AM <jinsdb@126.com> wrote:
>
> From: huangqu <jinsdb@126.com>
>
> Wrong order for config and counter_id parameters was passed, when calling df_v3_6_pmc_set_deferred and df_v3_6_pmc_is_deferred functions.
>
> Signed-off-by: huangqu <jinsdb@126.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/df_v3_6.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> index 43c5e3ec9..f4dfca013 100644
> --- a/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> +++ b/drivers/gpu/drm/amd/amdgpu/df_v3_6.c
> @@ -458,7 +458,7 @@ static int df_v3_6_pmc_add_cntr(struct amdgpu_device *adev,
>
>  #define DEFERRED_ARM_MASK      (1 << 31)
>  static int df_v3_6_pmc_set_deferred(struct amdgpu_device *adev,
> -                                   int counter_idx, uint64_t config,
> +                                   uint64_t config, int counter_idx,
>                                     bool is_deferred)
>  {
>
> @@ -476,8 +476,8 @@ static int df_v3_6_pmc_set_deferred(struct amdgpu_device *adev,
>  }
>
>  static bool df_v3_6_pmc_is_deferred(struct amdgpu_device *adev,
> -                                   int counter_idx,
> -                                   uint64_t config)
> +                                   uint64_t config,
> +                                   int counter_idx)
>  {
>         return  (df_v3_6_pmc_has_counter(adev, config, counter_idx) &&
>                         (adev->df_perfmon_config_assign_mask[counter_idx]
> --
> 2.31.1
>
