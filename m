Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67F3590645
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 20:34:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FE2B14B171;
	Thu, 11 Aug 2022 18:34:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x333.google.com (mail-ot1-x333.google.com
 [IPv6:2607:f8b0:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 554CB18A55C;
 Thu, 11 Aug 2022 18:34:37 +0000 (UTC)
Received: by mail-ot1-x333.google.com with SMTP id
 a14-20020a0568300b8e00b0061c4e3eb52aso13267300otv.3; 
 Thu, 11 Aug 2022 11:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ypfUihgknhSkUuVKlo5q79CX2DsZsxGfKokpDPBIzrw=;
 b=KLbwFXT6NwkEad4tNRu8k7mE7isrRNrDVY9/jmfCgfyTN0s/eTzvNo4/W4HYHXO28o
 ojwDtL2hAoacO4OsPltVzR5sjrqjeXFu0kXdaAcg06WsOX+jrhgIPP7gi2LtPG+2o3mg
 +lPmFF1mkDojrKGqSPZ4b4p+isAcC3bWsqPVdFj0i5mAM9xn7WmTXWcq0527n3m+SC0E
 p4OYt1XebYnlmK6cIP3XLiKCSFgbFFiV9xKAq3q23t2ND2vZeIT/R0qNJw6DPTScOu4+
 Kt+yQJGSXXCvFZxpWAHw+ZGCnt0gepeMbEZmXTJl6/8iUAgGck/m9H8bCF1tU0OrWTc3
 vwVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ypfUihgknhSkUuVKlo5q79CX2DsZsxGfKokpDPBIzrw=;
 b=a3i3l4xnPG8NZHJXie4hOyKclQlVS0r8Qxbbwz6fA0FNfURacHhemLkGIfXJd47lyp
 W/oHGFrD/0lDKa0euaFSvhRkAsU3FAx5TzEgaGVoOwMe2fWv4SUHaHgELzYmjXUyWzun
 XxD8f/k/gJjiOxLvfBXInTni70T9es1SQh++OI4HD1Zs0mEL1ojh3VNq01NrpUyodIXM
 LFs91LUt9IebUz8hxzceACeS+ENTQHoJ2JlAld2ugvLutLMBq9LP6bP+qvg10n0vd5N6
 kuZUrPBon/R1snhxNClbTmClVivCssJLTOZVLUkAqgKVNkoOFP5z+opo+H0AZ0wVYoa1
 u3Pw==
X-Gm-Message-State: ACgBeo0JOQ+2hqJOoSsXROMo0pU0t/PpKaA5x+36izGtdRO95ukuUMVs
 I64tV1ejN8nt//a3f6DbYhpJrr03XUZGpXWX83w=
X-Google-Smtp-Source: AA6agR6p1C2CpLXaH+oFcV7hJzLsaq0ZAz8LZ0QxQhsosGR7BFUV+mabGRAt20oIuIlSoD2OA9B+MuRl2mzR7FT2EPw=
X-Received: by 2002:a05:6830:25c4:b0:637:2a66:1dfd with SMTP id
 d4-20020a05683025c400b006372a661dfdmr127055otu.383.1660242876510; Thu, 11 Aug
 2022 11:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <CADVatmN_TzJKdfM40BQPW=cRm5VxX=qAKxq2yW4P_xDN6=VoOA@mail.gmail.com>
 <20220811175759.1518840-1-hamza.mahfooz@amd.com>
In-Reply-To: <20220811175759.1518840-1-hamza.mahfooz@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 11 Aug 2022 14:34:25 -0400
Message-ID: <CADnq5_Oo2RBdk5gXq3NKtwTui3+4mZuSXk2+DSYoNMfk2JQCng@mail.gmail.com>
Subject: Re: [PATCH v2] drm/amd/display: fix DSC related non-x86/PPC64
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
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Roman Li <Roman.Li@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, Wayne Lin <Wayne.Lin@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 11, 2022 at 2:00 PM Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>
> Need to protect DSC code with CONFIG_DRM_AMD_DC_DCN.
> Fixes the following build errors on arm64:
> ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>
> Fixes: 0087990a9f57 ("drm/amd/display: consider DSC pass-through during mode validation")
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Reviewed-by: Alex Deucher <alexander.deucher@amd.com>

> ---
> v2: Fix WERROR build failure by guarding unused variables
> ---
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c  | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index ef6c94cd852b..ce6929224a6e 100644
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
> @@ -1416,17 +1414,19 @@ static bool is_dsc_common_config_possible(struct dc_stream_state *stream,
>
>         return bw_range->max_target_bpp_x16 && bw_range->min_target_bpp_x16;
>  }
> +#endif /* CONFIG_DRM_AMD_DC_DCN */
>
>  enum dc_status dm_dp_mst_is_port_support_mode(
>         struct amdgpu_dm_connector *aconnector,
>         struct dc_stream_state *stream)
>  {
> +       int bpp, pbn, branch_max_throughput_mps = 0;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
>         struct dc_link_settings cur_link_settings;
>         unsigned int end_to_end_bw_in_kbps = 0;
>         unsigned int upper_link_bw_in_kbps = 0, down_link_bw_in_kbps = 0;
>         unsigned int max_compressed_bw_in_kbps = 0;
>         struct dc_dsc_bw_range bw_range = {0};
> -       int bpp, pbn, branch_max_throughput_mps = 0;
>
>         /*
>          * check if the mode could be supported if DSC pass-through is supported
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
