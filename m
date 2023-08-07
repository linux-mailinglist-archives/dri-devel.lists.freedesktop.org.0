Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B14D772A87
	for <lists+dri-devel@lfdr.de>; Mon,  7 Aug 2023 18:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96FCE10E2AB;
	Mon,  7 Aug 2023 16:23:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63E5C10E2AA;
 Mon,  7 Aug 2023 16:23:07 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1bba7717d3bso3488688fac.1; 
 Mon, 07 Aug 2023 09:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691425386; x=1692030186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=L7MLgX//c9aErISuUZEec4pqzAsW+rw0jQNMnk+tMag=;
 b=YTfBQIIP3baZBzHLZfZAMXXo1vU4qQaj4/9FJAZ5yCXXUFTOmBSm5XOSFICbcXZN34
 cr4MqOZpTff4/J6LFvhwCPmHLfyAC/y3y9pB3W1oUiWI3YTqzj/zezcF/tDCrrGdxAsX
 QbLxFWWYIWY9uqW4feTfYHsMF8/iWFW+Ujq7V08hj974ZQWAk9xMlzEO8CaSbm139ZHK
 0hHba4i4DViLEzTdrUQpKuaoAAw0HilZqSTPJ/lc2gVUk6B0cJTENI7FomaHjao9vs5h
 7YrsUvOXPQepjT6wKL/PgoViCoa7EmoIVXlgnX56+SFK9nMsecw44IMBrg39+2nhMUJJ
 rTyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425386; x=1692030186;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=L7MLgX//c9aErISuUZEec4pqzAsW+rw0jQNMnk+tMag=;
 b=GgoRiateOFEY2BAivpIs19OniVn4OX+dp64IkrqozIfuIg86+dnhN3af9TRrm+4xK5
 p4O87t/B9hFBmKQqBWqSUqAQYOnpsmvz01YpcVqChIeSqWK4RsqRt2Pp6OJzb6kFtovW
 lMNTReSaEAyu2dG/+ahT9VSKe/0WqkrrmHoKCbSLHq1MJJi8qCfqOLwnn63q8HHEcaFm
 oismeoooBZ81xxKqmDg3yqcm8LHunQQg8lIjMOIHrzxp/B/dqvnjay5pndzlGKlVFBc3
 HqKv5wm0Vk6HP/pp9OeX9YD9Kn7USob/CtfdWwmkuJqKQ94o5YD2hSW9BNUKXAft2a9E
 xQBQ==
X-Gm-Message-State: AOJu0YwSzekFCLbxkSuNHgnm7gXdKXOyAZOuMSEp0d3Oxm9TiGfFfFe6
 xFcVOkyGQRLlcWzJGxgiInCvQrVKVlLIFt0mJKpPBohZ
X-Google-Smtp-Source: AGHT+IFPbosy3FdWE+KBz+V5wTA/k7xCp/jTZ0S6fFWDwY+GhxsenpyI5P9bf18tADOmQWbNFhp2w+gBiVrjFRBItqQ=
X-Received: by 2002:a05:6870:d611:b0:1bf:7b3:5116 with SMTP id
 a17-20020a056870d61100b001bf07b35116mr12624311oaq.47.1691425386563; Mon, 07
 Aug 2023 09:23:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230801021129.4458-1-sunran001@208suo.com>
In-Reply-To: <20230801021129.4458-1-sunran001@208suo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 7 Aug 2023 12:22:55 -0400
Message-ID: <CADnq5_NZLtJjmRPo=GXhftc1_g=8OsJBawb6j1sCAKs1788JEQ@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Clean up errors in smu_v13_0_5_ppt.c
To: Ran Sun <sunran001@208suo.com>
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
Cc: linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

On Mon, Jul 31, 2023 at 10:11=E2=80=AFPM Ran Sun <sunran001@208suo.com> wro=
te:
>
> Fix the following errors reported by checkpatch:
>
> ERROR: space prohibited before that ',' (ctx:WxW)
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>  drivers/gpu/drm/amd/pm/swsmu/smu_internal.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h b/drivers/gpu/dr=
m/amd/pm/swsmu/smu_internal.h
> index ceb13c838067..bcc42abfc768 100644
> --- a/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu_internal.h
> @@ -61,14 +61,14 @@
>  #define smu_feature_get_enabled_mask(smu, mask)                         =
       smu_ppt_funcs(get_enabled_mask, -EOPNOTSUPP, smu, mask)
>  #define smu_feature_is_enabled(smu, mask)                              s=
mu_ppt_funcs(feature_is_enabled, 0, smu, mask)
>  #define smu_disable_all_features_with_exception(smu, mask)             s=
mu_ppt_funcs(disable_all_features_with_exception, 0, smu, mask)
> -#define smu_is_dpm_running(smu)                                         =
       smu_ppt_funcs(is_dpm_running, 0 , smu)
> +#define smu_is_dpm_running(smu)                                         =
       smu_ppt_funcs(is_dpm_running, 0, smu)
>  #define smu_notify_display_change(smu)                                 s=
mu_ppt_funcs(notify_display_change, 0, smu)
>  #define smu_populate_umd_state_clk(smu)                                 =
       smu_ppt_funcs(populate_umd_state_clk, 0, smu)
>  #define smu_enable_thermal_alert(smu)                                  s=
mu_ppt_funcs(enable_thermal_alert, 0, smu)
>  #define smu_disable_thermal_alert(smu)                                 s=
mu_ppt_funcs(disable_thermal_alert, 0, smu)
>  #define smu_smc_read_sensor(smu, sensor, data, size)                   s=
mu_ppt_funcs(read_sensor, -EINVAL, smu, sensor, data, size)
>  #define smu_pre_display_config_changed(smu)                            s=
mu_ppt_funcs(pre_display_config_changed, 0, smu)
> -#define smu_display_config_changed(smu)                                 =
       smu_ppt_funcs(display_config_changed, 0 , smu)
> +#define smu_display_config_changed(smu)                                 =
       smu_ppt_funcs(display_config_changed, 0, smu)
>  #define smu_apply_clocks_adjust_rules(smu)                             s=
mu_ppt_funcs(apply_clocks_adjust_rules, 0, smu)
>  #define smu_notify_smc_display_config(smu)                             s=
mu_ppt_funcs(notify_smc_display_config, 0, smu)
>  #define smu_run_btc(smu)                                               s=
mu_ppt_funcs(run_btc, 0, smu)
> --
> 2.17.1
>
