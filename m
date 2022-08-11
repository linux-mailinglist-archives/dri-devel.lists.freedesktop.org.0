Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BD7759063C
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 20:26:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3321418A77A;
	Thu, 11 Aug 2022 18:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE25310FEB4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 18:26:15 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id m2so17633623pls.4
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 11:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=DNRqJUO9qW+nOcXv54/BTKzSqJWHyKLs5RY2LsJLtKw=;
 b=xc0VQ/tXgJI3CNx3hHgICA6Z2jEuWQ/uwjKgyzakD9pvtgaib073alKdtAxe0Exz6L
 bCPUdYQlVzM/Nz34uuK70LSXiBfUUpNlWrLM04+G0Z/lyuj3csGesp6p/8HBaJt/ni7h
 dFQpnrFXf6UysrTohohxCGSYXB0YL5yavCBJVPNucgXlVuXS7kpF34mYcyi5hEgIvFVA
 cagr9VMwdF45mDJH4T6ptGgJj+Kdubuw1TKk4Myhx7t5Enjky8wMVggeTrTv0vs4s7j+
 XsXjpefcMOWDJuiFpemFXUieXEf/r9K3HvRTkfedaBD7pgZoaNs6uXO1W55AL8q5uOSd
 OVGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=DNRqJUO9qW+nOcXv54/BTKzSqJWHyKLs5RY2LsJLtKw=;
 b=bDCL7c9I+LvM8VJAsCymAqaFlQPgRklpuQoivRGngMGLgMGaSn/HfEdwxyH5J36D+h
 vwyaapExZ3ZnP3UD0smZTEYqCmgmcY5s1FoQvrZBSQyDzC6fEqJNLAsP2N1vL5HmM05r
 qqDdHGu01QsIZVb/0ROdzJ/Rh5b0X8+A5nUkyfojh57Gkp9sy2TqP63LvzWrlaQ+rQIh
 xsbNzVdV2Va+bwRX6wJPxVzu6VRWPzfx31zLmoUCzECPoz7QwTTUqoxkfQyqxYnOT3il
 4h4UrEyzVoGOfzV827132ghOGzXMO1wr9NR4sV1v74skSUeXuUSPczdlmdwv8ZdezAS2
 3O7A==
X-Gm-Message-State: ACgBeo2Frubz5NYETR7Nbf/oSD3JhM5Lg2Ne4PdEKdPtM2clPHsBi72S
 +AxDOTdjkEZi675FwOqgcUzP2prC+A8ai2LKaJvseA==
X-Google-Smtp-Source: AA6agR6E7weULEtj7kwVFvfsBwBE4Gop3xNBO3A8utdizicMa/BbTEIuAq5NU9tKxnYE47khriF2jMkXLkNBAs4yiHY=
X-Received: by 2002:a17:903:120d:b0:171:4fa0:7b4a with SMTP id
 l13-20020a170903120d00b001714fa07b4amr381532plh.45.1660242375230; Thu, 11 Aug
 2022 11:26:15 -0700 (PDT)
MIME-Version: 1.0
References: <CADVatmN_TzJKdfM40BQPW=cRm5VxX=qAKxq2yW4P_xDN6=VoOA@mail.gmail.com>
 <20220811175759.1518840-1-hamza.mahfooz@amd.com>
In-Reply-To: <20220811175759.1518840-1-hamza.mahfooz@amd.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Thu, 11 Aug 2022 20:26:04 +0200
Message-ID: <CADYN=9JgX6PVhes_9cbL4qFEjyiYhbpHMXTB-oEdn4j9Rz3tJA@mail.gmail.com>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Leo Li <sunpeng.li@amd.com>,
 dri-devel@lists.freedesktop.org, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@linux.ie>, Fangzhi Zuo <Jerry.Zuo@amd.com>,
 hersen wu <hersenxs.wu@amd.com>, Roman Li <Roman.Li@amd.com>,
 Wayne Lin <Wayne.Lin@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 11 Aug 2022 at 20:00, Hamza Mahfooz <hamza.mahfooz@amd.com> wrote:
>
> Need to protect DSC code with CONFIG_DRM_AMD_DC_DCN.
> Fixes the following build errors on arm64:
> ERROR: modpost: "dc_dsc_get_policy_for_timing" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
> ERROR: modpost: "dc_dsc_compute_bandwidth_range" [drivers/gpu/drm/amd/amdgpu/amdgpu.ko] undefined!
>
> Fixes: 0087990a9f57 ("drm/amd/display: consider DSC pass-through during mode validation")
> Reported-by: Anders Roxell <anders.roxell@linaro.org>
> Signed-off-by: Hamza Mahfooz <hamza.mahfooz@amd.com>

Thank you for the quick fix.

Tested-by: Anders Roxell <anders.roxell@linaro.org>

Cheers,
Anders

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
