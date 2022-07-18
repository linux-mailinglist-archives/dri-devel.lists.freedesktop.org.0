Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B352B578A8F
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 21:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71EAA10FEA8;
	Mon, 18 Jul 2022 19:20:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4F910FEA8;
 Mon, 18 Jul 2022 19:20:11 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id bp15so23134281ejb.6;
 Mon, 18 Jul 2022 12:20:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fDVNBc5XFFotjrwcydHiypKXUfp1J1vJ62G1p2tMV7U=;
 b=EJ/i0KJbHMhLxMbMKiPgUB+Ict+QTFLWIizt2rzN6Mpuseg9ivTpkRHifKSoauZXdr
 K99ieViZW/J8eAIa50eUtNDmKo2UBd+zELvGikiVob3lJTp4CNYzO2tIUyRu6SqWZiy/
 26GrO13LXaJPVpChcY3s0tMFzhdTQ/HLX7q/UpUK+W+BU1UMCFBUsXY6GcxMnrmWieGH
 5b9VAhdgS8GQ+m1WIi0mXyR4LdUgp3WVdLQDTSoffyoWa87ZEdzTdeqTDZRKkbzjyDW6
 ZMQkPm8sK15ubhCHc3hgSW1hftVdya748mT8RXSJdgJEfgh6eazy/9K2MYm3QW0A+BV5
 5VMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fDVNBc5XFFotjrwcydHiypKXUfp1J1vJ62G1p2tMV7U=;
 b=pBQAZNZBO3m+02WgD8iJUkygV8FkxzcUPlrFXu9O7A+EwTiF9RzHuIdRvPUsb0ck7O
 rEWo+CKqCZdZpvjFcmW0nXubHdBK0bUgJlY6gmcWa+Pv88Oar+sYhNDJxtgStUURhuN7
 Feq5lHLR44h2DyCCbTIQuLqY4TaCVoc7smsG6EI+OV3cl+yxJFVWYfQfbsCXKgYcleeT
 AFes+E3ans/v8Vq5g3NL5aVngmPPshxYL4Uywz17/+0UOmcbZU8+QSMma7Dvr3iCgcP6
 XxlCOnCjYFuzC2rXpoIhfPaazSG+BQpKP0Q6IYJswPuFU/u06zLW+lIGSSVhVNkan/j7
 gl1g==
X-Gm-Message-State: AJIora+9A6WXg0J/ep/TH+ZxY6i4kQtzIHzbtEt9ah+vZHpbhMcco9nW
 6qbMny3Ey9fEJ3CtIu7MQFMBZ3j/fdt3cp7iNt8SvrdlYCA=
X-Google-Smtp-Source: AGRyM1ur2bqm5pr5cbh5rgKbT3pVk/P8Dls3bG/jth0KuxuUuRorDatAm+HJDMCix4gcpdnhluhJceIdy1X/+KT1aoM=
X-Received: by 2002:a17:907:1623:b0:72b:64e3:878a with SMTP id
 hb35-20020a170907162300b0072b64e3878amr27869282ejc.185.1658172010375; Mon, 18
 Jul 2022 12:20:10 -0700 (PDT)
MIME-Version: 1.0
References: <20220716195144.342960-1-mwen@igalia.com>
In-Reply-To: <20220716195144.342960-1-mwen@igalia.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 18 Jul 2022 15:19:57 -0400
Message-ID: <CADnq5_PYbVMKwfDhxAU2GEKG_CBB7QHohirX2WkCn33k6cVkug@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: move dcn31_update_soc_for_wm_a func to
 dml fpu folder
To: Melissa Wen <mwen@igalia.com>
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
Cc: kernel-dev@igalia.com, "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 xinhui pan <Xinhui.Pan@amd.com>, "Siqueira,
 Rodrigo" <Rodrigo.Siqueira@amd.com>, LKML <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied with a trivial fix for dcn314_resource.c.

Thanks!

Alex

On Sat, Jul 16, 2022 at 3:52 PM Melissa Wen <mwen@igalia.com> wrote:
>
> Although dcn31_update_soc_for_wm_a() is only called in dml/dcn31/dcn31_fpu by
> dc->res_pool->funcs->update_soc_for_wm_a(dc, context), it's declared in
> dcn31_resource that is not FPU protected. Move this function to dcn31_fpu
> file as part of the work to isolate FPU code.
>
> Signed-off-by: Melissa Wen <mwen@igalia.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c | 9 ---------
>  drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h | 1 -
>  drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c  | 9 +++++++++
>  drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h  | 2 ++
>  4 files changed, 11 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> index 16bbccc69fdc..17c776e88514 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.c
> @@ -1716,15 +1716,6 @@ int dcn31_populate_dml_pipes_from_context(
>         return pipe_cnt;
>  }
>
> -void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
> -{
> -       if (dc->clk_mgr->bw_params->wm_table.entries[WM_A].valid) {
> -               context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].pstate_latency_us;
> -               context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_enter_plus_exit_time_us;
> -               context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_exit_time_us;
> -       }
> -}
> -
>  void dcn31_calculate_wm_and_dlg(
>                 struct dc *dc, struct dc_state *context,
>                 display_e2e_pipe_params_st *pipes,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
> index 393458015d6a..41f8ec99da6b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
> +++ b/drivers/gpu/drm/amd/display/dc/dcn31/dcn31_resource.h
> @@ -59,7 +59,6 @@ dcn31_set_mcif_arb_params(struct dc *dc,
>                           struct dc_state *context,
>                           display_e2e_pipe_params_st *pipes,
>                           int pipe_cnt);
> -void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context);
>
>  struct resource_pool *dcn31_create_resource_pool(
>                 const struct dc_init_data *init_data,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> index 7be3476989ce..facac3daeaca 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.c
> @@ -435,6 +435,15 @@ struct _vcs_dpi_soc_bounding_box_st dcn3_16_soc = {
>         .urgent_latency_adjustment_fabric_clock_reference_mhz = 0,
>  };
>
> +void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context)
> +{
> +       if (dc->clk_mgr->bw_params->wm_table.entries[WM_A].valid) {
> +               context->bw_ctx.dml.soc.dram_clock_change_latency_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].pstate_latency_us;
> +               context->bw_ctx.dml.soc.sr_enter_plus_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_enter_plus_exit_time_us;
> +               context->bw_ctx.dml.soc.sr_exit_time_us = dc->clk_mgr->bw_params->wm_table.entries[WM_A].sr_exit_time_us;
> +       }
> +}
> +
>  void dcn31_calculate_wm_and_dlg_fp(
>                 struct dc *dc, struct dc_state *context,
>                 display_e2e_pipe_params_st *pipes,
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
> index 24ac19c83687..0a10de80c1a4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/dcn31_fpu.h
> @@ -31,6 +31,8 @@
>  #define DCN3_15_MIN_COMPBUF_SIZE_KB 128
>  #define DCN3_16_DEFAULT_DET_SIZE 192
>
> +void dcn31_update_soc_for_wm_a(struct dc *dc, struct dc_state *context);
> +
>  void dcn31_calculate_wm_and_dlg_fp(
>                 struct dc *dc, struct dc_state *context,
>                 display_e2e_pipe_params_st *pipes,
> --
> 2.35.1
>
