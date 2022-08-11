Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A0C1D590370
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 18:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D2432B56C;
	Thu, 11 Aug 2022 16:27:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A28D8930C;
 Thu, 11 Aug 2022 16:26:53 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-f2a4c51c45so22054837fac.9; 
 Thu, 11 Aug 2022 09:26:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=5J2eH8J3KSl2i4YDEioQLvvMu1VvonnCUhWQOwBSDRw=;
 b=g5NLb4S5XMMgc+h6eG+K38NaBHb92GcTAzTX77Jua8RvMjEfTYydyLtADeo/smWoT9
 5THR+29CZPyFptA0p63FWuVu2HLssx5ppjo+jarmSd9O0s5QS6V9yX28IulVq6uJbUVx
 whwcctoxwZeSdZW9PrsJFgC9mN9xCUNP5qkEnKTjubG6xCHvdvKl0d48LbDXOq/mq/ui
 vMsNvLcrbw6Cr/CCCvVcMkfq3+bc+eIhFA2fvjdnuxlXMWhF9QAaZLyZT9JTVnEL7Snk
 GJS2tz0QlJiRXNB8FkE+aEa/hrR2mZvVEt8crfWb1lAUSJlWQgwkZmFjcrinNLp5vWbJ
 qZjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=5J2eH8J3KSl2i4YDEioQLvvMu1VvonnCUhWQOwBSDRw=;
 b=opa7lj60AQUFgv5cjoeYBZNcUV6P2coHzKHpvJIn4pipu2uRLhDKLqAz1fdcHBDwAB
 WRewmvWWPBXT7kGwGmFP/CqIXZAcqL51YyiSvzZ21CxqB6cR9re26UER9hwNmP/+q7Z8
 9mm5XPPiL3hMHgJg8JlF8pkUiEMCf8k1OOIk5om5htX1v5WGRMA4JmNT7swHWfUhgvwm
 LsVOVvhLdIVHhe9Isa6z6UaDp0U0Tvxy4jwVE0kHfGsWPTxSOO/lsnMB2yVnERFRlA/o
 HT5MGMgedKWuawSzoz+h+td4H6Q5KvSIXwC0JmxCBi3woxnYg3YlD9PZQwM4MpT7RdpX
 8baQ==
X-Gm-Message-State: ACgBeo2BfK957lHLGwt0QIVDtJ3IIqdf8HYIVEBUsv3YHAoEbRHj+3W2
 QmyZpvKK0ojbgAssmAOThlmMNkQa2R6O4722J0A=
X-Google-Smtp-Source: AA6agR6gwmUJ5JYVJhxblwMwPCs6Fab74OrRJm7YlWzO6etz4AwDRdeZ4nBqzVap0+TZfCco+KRx0oX0DaxKDa6r5DM=
X-Received: by 2002:a05:6870:3398:b0:113:7f43:d0e9 with SMTP id
 w24-20020a056870339800b001137f43d0e9mr3826646oae.33.1660235212490; Thu, 11
 Aug 2022 09:26:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220811162307.1384962-1-hamza.mahfooz@amd.com>
In-Reply-To: <20220811162307.1384962-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 11 Aug 2022 12:26:41 -0400
Message-ID: <CADnq5_MiH6_n5nnq5KW+LMxMyHtm0Mwmb7e5pi=Pr2S8Hjjiog@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix DSC related non-x86/PPC64
 compilation issue
To: Hamza Mahfooz <hamza.mahfooz@amd.com>
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
Cc: Anders Roxell <anders.roxell@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Leo Li <sunpeng.li@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Roman Li <Roman.Li@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 12:24 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>
> Need to protect DSC code with CONFIG_DRM_AMD_DC_DCN.
> Fixes the following build errors on arm64:
> ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>
> Fixes: 0087990a9f57 ("drm/amd/display: consider DSC pass-through during mode validation")
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Acked-by: Alex Deucher <alexander.deucher@amd.com>

> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c    | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index ef6c94cd852b..0c52c0867211 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -1387,8 +1387,6 @@ bool pre_validate_dsc(struct drm_atomic_state *state,
>         return (ret == 0);
>  }
>
> -#endif
> -
>  static unsigned int kbps_from_pbn(unsigned int pbn)
>  {
>         unsigned int kbps = pbn;
> @@ -1416,6 +1414,7 @@ static bool is_dsc_common_config_possible(struct dc_stream_state *stream,
>
>         return bw_range->max_target_bpp_x16 && bw_range->min_target_bpp_x16;
>  }
> +#endif /* CONFIG_DRM_AMD_DC_DCN */
>
>  enum dc_status dm_dp_mst_is_port_support_mode(
>         struct amdgpu_dm_connector *aconnector,
> @@ -1428,6 +1427,7 @@ enum dc_status dm_dp_mst_is_port_support_mode(
>         struct dc_dsc_bw_range bw_range = {0};
>         int bpp, pbn, branch_max_throughput_mps = 0;
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>         /*
>          * check if the mode could be supported if DSC pass-through is supported
>          * AND check if there enough bandwidth available to support the mode
> @@ -1461,13 +1461,16 @@ enum dc_status dm_dp_mst_is_port_support_mode(
>                         return DC_FAIL_BANDWIDTH_VALIDATE;
>                 }
>         } else {
> +#endif
>                 /* check if mode could be supported within full_pbn */
>                 bpp = convert_dc_color_depth_into_bpc(stream->timing.display_color_depth) * 3;
>                 pbn = drm_dp_calc_pbn_mode(stream->timing.pix_clk_100hz / 10, bpp, false);
>
>                 if (pbn > aconnector->port->full_pbn)
>                         return DC_FAIL_BANDWIDTH_VALIDATE;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>         }
> +#endif
>
>         /* check is mst dsc output bandwidth branch_overall_throughput_0_mps */
>         switch (stream->timing.pixel_encoding) {
> --
> 2.37.1
>
