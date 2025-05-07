Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C117DAAE3F6
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 17:10:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443C510E824;
	Wed,  7 May 2025 15:10:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Gp/FByOw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com
 [209.85.216.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0995D10E829;
 Wed,  7 May 2025 15:10:45 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id
 98e67ed59e1d1-30ab2041731so1000a91.2; 
 Wed, 07 May 2025 08:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1746630644; x=1747235444; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Rr7SlBb+Mxic3W0vjBKAoi3hgA/5VfbFQVNl/yBWl2M=;
 b=Gp/FByOw5lTnUSH6O94DLce2+RaUCnwnD/kGNxit2lFajHV8cHg+NBYGlOCklyGl94
 9lhGC3AtuC4Gimneg5IHT6M59PF/iVYy/AHYSZETjIYUBVixQz8mc296cMjS4yiBagKs
 gCPW6qlbL1wRqdye9JCq+h+IfHDquTgSgYBZh/Dt3vb+zkgT0mSnewFKqIntMAKrPVyH
 xiPJDiElHj94QGhPnPCJZmz28PefupgbysCST9JTAHtArr1gHUZLXQMkZVdKwXMHBGNi
 FgpPWhf59vZZMk+A8cHvOb7M2vd+lLFDOM8KkAa9ngoLQPjGMEuG+XQyZ2wHPDCCiH2S
 dyuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746630644; x=1747235444;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Rr7SlBb+Mxic3W0vjBKAoi3hgA/5VfbFQVNl/yBWl2M=;
 b=o0GDIUhNY5jpG6c/V80NlvcPLc4+vzxFQVuBW9UNsUomKorQ4LhuPVM0PLbWxPdiG+
 TPBDIHUlv4+bXVboU3LOyDNZXFNYhvXo4D1iuYH3IbpP2RBiTdpEU7TXcO+pGxu9WlU2
 qOE+Lk7kG1fKzXzzyrWLNOpfigVQX6Vd5m6KHFm1uIjlfsYw3fSF6dA41I7cJSaUIyGe
 MLWaZBJIN3CbLt0lofeleNQAyBjbzao0yTPI//thAt21EHUrLFutq36HNjG9OgR5dvrY
 1XHz0afb9WXXPgmWtsBGtEFnScVLMu+8UmxRBC6GXWLp1TqPFXz6dNHq3x5hifxrId1J
 aK6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBm6EQvj15f/7zYhJ2mSLjRa7EB6AH/8FwwP9efKwXlIHzymyZy4PRWQ9nWfcvtN2PX/KKnfXy@lists.freedesktop.org,
 AJvYcCX/TidrIu0eClTAJHMQPijrtfwQRf6Z51TKe8dVkNaPZQMvfT2SBz+aw/uDjC8q/+tsJjrt1noLaDQu@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFWhGTC9X/FJ859yuEDZpjBmylz+orexurREU/hUUE9pgRQjzq
 eDFzggHMJkUSdVVLxlp0PSxVALFjU2gg6CKQft0/bv/Y+g/jJPK6KwlFcJGo0rO6nHiOFlqSj9t
 lkanuwOZCD7r/D1BHksY2hJnCsQk=
X-Gm-Gg: ASbGncuWvBPaU2CFU7rxQT9QdnQEnH26ORcN/Vq8tkQuMpI9rYaHHTOYA44W1J5/Dtk
 5B6bJoU7tSxMmGLlpX5jc+pyJI/vQ6z45BIWL/KacHTU7obXHVPfLew10Xx1G9+pgDsnQGtgEvv
 Emr9KJcp3GfdQPxhrXkLorHg==
X-Google-Smtp-Source: AGHT+IHs751kgovWTS/yqPwWIwj5rYGwaenWwA5o/tymdJxAfSymJ3o5v+LKLXXv/sRdy8BfgThzhohaNXNRvPfXyxM=
X-Received: by 2002:a17:90b:3882:b0:30a:a51c:5f48 with SMTP id
 98e67ed59e1d1-30aac26b85fmr2036308a91.8.1746630644306; Wed, 07 May 2025
 08:10:44 -0700 (PDT)
MIME-Version: 1.0
References: <20250507002425.93421-1-linux@treblig.org>
 <20250507002425.93421-4-linux@treblig.org>
In-Reply-To: <20250507002425.93421-4-linux@treblig.org>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 7 May 2025 11:10:32 -0400
X-Gm-Features: ATxdqUE3O2iczVjE8Eax_qzR85S_kXa9idjGqD3mrYnEK2wwEG3f3vkjlSdNm00
Message-ID: <CADnq5_PPpDSY8o6Ru7nrE1q=xaboKJDjG7WiUhDdX8G9Kz00eQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/amd/pm/smu13: Remove unused smu_v3 functions
To: linux@treblig.org
Cc: alexander.deucher@amd.com, kenneth.feng@amd.com, christian.koenig@amd.com, 
 airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Applied the series.  Thanks!

Alex

On Tue, May 6, 2025 at 8:33=E2=80=AFPM <linux@treblig.org> wrote:
>
> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>
> smu_v13_0_display_clock_voltage_request() and
> smu_v13_0_set_min_deep_sleep_dcefclk() were added in 2020 by
> commit c05d1c401572 ("drm/amd/swsmu: add aldebaran smu13 ip support (v3)"=
)
> but have remained unused.
>
> Remove them.
>
> smu_v13_0_display_clock_voltage_request() was the only user
> of smu_v13_0_set_hard_freq_limited_range().  Remove it.
>
> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h  |  12 ---
>  .../gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c    | 101 ------------------
>  2 files changed, 113 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h b/drivers/gpu/d=
rm/amd/pm/swsmu/inc/smu_v13_0.h
> index cd03caffe317..6f74783472e5 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/inc/smu_v13_0.h
> @@ -183,13 +183,6 @@ int smu_v13_0_disable_thermal_alert(struct smu_conte=
xt *smu);
>
>  int smu_v13_0_get_gfx_vdd(struct smu_context *smu, uint32_t *value);
>
> -int smu_v13_0_set_min_deep_sleep_dcefclk(struct smu_context *smu, uint32=
_t clk);
> -
> -int
> -smu_v13_0_display_clock_voltage_request(struct smu_context *smu,
> -                                       struct pp_display_clock_request
> -                                       *clock_req);
> -
>  uint32_t
>  smu_v13_0_get_fan_control_mode(struct smu_context *smu);
>
> @@ -226,11 +219,6 @@ int smu_v13_0_get_dpm_ultimate_freq(struct smu_conte=
xt *smu, enum smu_clk_type c
>  int smu_v13_0_set_soft_freq_limited_range(struct smu_context *smu, enum =
smu_clk_type clk_type,
>                                           uint32_t min, uint32_t max, boo=
l automatic);
>
> -int smu_v13_0_set_hard_freq_limited_range(struct smu_context *smu,
> -                                         enum smu_clk_type clk_type,
> -                                         uint32_t min,
> -                                         uint32_t max);
> -
>  int smu_v13_0_set_performance_level(struct smu_context *smu,
>                                     enum amd_dpm_forced_level level);
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c b/drivers/gpu=
/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> index ba5a9012dbd5..03242f65e262 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu13/smu_v13_0.c
> @@ -709,18 +709,6 @@ int smu_v13_0_notify_memory_pool_location(struct smu=
_context *smu)
>         return ret;
>  }
>
> -int smu_v13_0_set_min_deep_sleep_dcefclk(struct smu_context *smu, uint32=
_t clk)
> -{
> -       int ret;
> -
> -       ret =3D smu_cmn_send_smc_msg_with_param(smu,
> -                                             SMU_MSG_SetMinDeepSleepDcef=
clk, clk, NULL);
> -       if (ret)
> -               dev_err(smu->adev->dev, "SMU13 attempt to set divider for=
 DCEFCLK Failed!");
> -
> -       return ret;
> -}
> -
>  int smu_v13_0_set_driver_table_location(struct smu_context *smu)
>  {
>         struct smu_table *driver_table =3D &smu->smu_table.driver_table;
> @@ -1073,56 +1061,6 @@ int smu_v13_0_get_gfx_vdd(struct smu_context *smu,=
 uint32_t *value)
>
>  }
>
> -int
> -smu_v13_0_display_clock_voltage_request(struct smu_context *smu,
> -                                       struct pp_display_clock_request
> -                                       *clock_req)
> -{
> -       enum amd_pp_clock_type clk_type =3D clock_req->clock_type;
> -       int ret =3D 0;
> -       enum smu_clk_type clk_select =3D 0;
> -       uint32_t clk_freq =3D clock_req->clock_freq_in_khz / 1000;
> -
> -       if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_DCEFCLK_BIT) =
||
> -           smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_UCLK_BIT)) {
> -               switch (clk_type) {
> -               case amd_pp_dcef_clock:
> -                       clk_select =3D SMU_DCEFCLK;
> -                       break;
> -               case amd_pp_disp_clock:
> -                       clk_select =3D SMU_DISPCLK;
> -                       break;
> -               case amd_pp_pixel_clock:
> -                       clk_select =3D SMU_PIXCLK;
> -                       break;
> -               case amd_pp_phy_clock:
> -                       clk_select =3D SMU_PHYCLK;
> -                       break;
> -               case amd_pp_mem_clock:
> -                       clk_select =3D SMU_UCLK;
> -                       break;
> -               default:
> -                       dev_info(smu->adev->dev, "[%s] Invalid Clock Type=
!", __func__);
> -                       ret =3D -EINVAL;
> -                       break;
> -               }
> -
> -               if (ret)
> -                       goto failed;
> -
> -               if (clk_select =3D=3D SMU_UCLK && smu->disable_uclk_switc=
h)
> -                       return 0;
> -
> -               ret =3D smu_v13_0_set_hard_freq_limited_range(smu, clk_se=
lect, clk_freq, 0);
> -
> -               if (clk_select =3D=3D SMU_UCLK)
> -                       smu->hard_min_uclk_req_from_dal =3D clk_freq;
> -       }
> -
> -failed:
> -       return ret;
> -}
> -
>  uint32_t smu_v13_0_get_fan_control_mode(struct smu_context *smu)
>  {
>         if (!smu_cmn_feature_is_enabled(smu, SMU_FEATURE_FAN_CONTROL_BIT)=
)
> @@ -1647,45 +1585,6 @@ int smu_v13_0_set_soft_freq_limited_range(struct s=
mu_context *smu,
>         return ret;
>  }
>
> -int smu_v13_0_set_hard_freq_limited_range(struct smu_context *smu,
> -                                         enum smu_clk_type clk_type,
> -                                         uint32_t min,
> -                                         uint32_t max)
> -{
> -       int ret =3D 0, clk_id =3D 0;
> -       uint32_t param;
> -
> -       if (min <=3D 0 && max <=3D 0)
> -               return -EINVAL;
> -
> -       if (!smu_cmn_clk_dpm_is_enabled(smu, clk_type))
> -               return 0;
> -
> -       clk_id =3D smu_cmn_to_asic_specific_index(smu,
> -                                               CMN2ASIC_MAPPING_CLK,
> -                                               clk_type);
> -       if (clk_id < 0)
> -               return clk_id;
> -
> -       if (max > 0) {
> -               param =3D (uint32_t)((clk_id << 16) | (max & 0xffff));
> -               ret =3D smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetH=
ardMaxByFreq,
> -                                                     param, NULL);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       if (min > 0) {
> -               param =3D (uint32_t)((clk_id << 16) | (min & 0xffff));
> -               ret =3D smu_cmn_send_smc_msg_with_param(smu, SMU_MSG_SetH=
ardMinByFreq,
> -                                                     param, NULL);
> -               if (ret)
> -                       return ret;
> -       }
> -
> -       return ret;
> -}
> -
>  int smu_v13_0_set_performance_level(struct smu_context *smu,
>                                     enum amd_dpm_forced_level level)
>  {
> --
> 2.49.0
>
