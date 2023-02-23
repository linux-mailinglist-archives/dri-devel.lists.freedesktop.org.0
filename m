Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 267806A0BFB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Feb 2023 15:38:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45F3810E4EF;
	Thu, 23 Feb 2023 14:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 634F110E4EF;
 Thu, 23 Feb 2023 14:38:11 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-1720600a5f0so15727313fac.11; 
 Thu, 23 Feb 2023 06:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CsSicO1zPmBU0FIakNf++WMt7oEBKFgPGXwwUeJqiaw=;
 b=fUs6R6s90O/SZNsfREvFOuwZQ9kXdmBCZOhKPt0j6evP1pP6J3OcMZXh74Nb3rHN38
 og2E0DykXoAqhTdm7Zu2+tkzUNNPOpS73Gl1BxQhkOAsIZjhod/F/IT7nd4ZgvhX+V97
 OE+McZcKgbSlFxWpCOJxWocKGTZvnjr91qx8LNUu3+NQcQtYDvP1BXk/VRzK4WXjGrIE
 9yG37DzXzt/kPbL/BdyFnMLKgOQ3PD2eNaNT0Sub0+aV4gHx0Bq9i/sVtkKcFkArNXRG
 h95OPr0i/2PnlV3Mn9k41PMIE3zF0EhB/C/1g8oChnUtuTgah0dXI6PpDfp+/BtIAP8y
 upNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CsSicO1zPmBU0FIakNf++WMt7oEBKFgPGXwwUeJqiaw=;
 b=yLCu87MkpMRn+gTcYcIRk0Uaa3cq88JFaTLneVlWfmeb9mBWy4Ks/mVqePnBY8TLEy
 lbA0o+JhJsESYR4ZcMFZv9cXxLgKZ4NyXq4z3JbAeKJ2Uxxwn+Is4hOhBunOYvpjQa4k
 BZXUPdkLqYHzsKrpSSXq/tVhEQQ6DJLYo9Y8yROB2v14YXcOhb44V0/ICHB8GGFrxlSW
 Z57K6UvLW8ZZ5gj/U3kjRlsjMOQ6XaOHIpmeIdSktdO9rBQTGcR7i2rtjMpH3RMHSFJB
 3SAPv0TNgwbuqSpI8cEA8EmB/dBkDJTQXfAb8pcHtL14Wx/HHRClO4J28eb+WYRaUoJr
 dqRw==
X-Gm-Message-State: AO0yUKXLh6ALxzdNeUgDGZ5sNRT4JsOQJxBdWxZC8lx5IU6izn4tsFVf
 kgNAKPz89BLdS5jVGewUp3vl/RIHdW4BTkU5+18KISfk
X-Google-Smtp-Source: AK7set+rXEMRnqlE2dERDDYfaDarF181L2Wh1w3CqCqtCq1yE9QvrmpnE+R2D44p5g3s0qoxiu0IxYJd6k0i+b3z0H8=
X-Received: by 2002:a05:6871:6a0:b0:172:3bf5:2855 with SMTP id
 l32-20020a05687106a000b001723bf52855mr1127445oao.96.1677163090580; Thu, 23
 Feb 2023 06:38:10 -0800 (PST)
MIME-Version: 1.0
References: <20230217181409.218008-1-arthurgrillo@riseup.net>
 <20230217181409.218008-3-arthurgrillo@riseup.net>
In-Reply-To: <20230217181409.218008-3-arthurgrillo@riseup.net>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 23 Feb 2023 09:37:59 -0500
Message-ID: <CADnq5_NTy8shFO1_cg8hMN_QDy2KVs=1X+X_gQ=pJhOB+XXKVA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/amd/display: Remove unused local variables
To: Arthur Grillo <arthurgrillo@riseup.net>
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
Cc: sunpeng.li@amd.com, tales.aparecida@gmail.com, Xinhui.Pan@amd.com,
 Rodrigo.Siqueira@amd.com, dri-devel@lists.freedesktop.org,
 mairacanal@riseup.net, amd-gfx@lists.freedesktop.org,
 alexander.deucher@amd.com, andrealmeid@riseup.net, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks.

On Fri, Feb 17, 2023 at 1:15 PM Arthur Grillo <arthurgrillo@riseup.net> wrote:
>
> Remove local variables that were just set but were never used. This
> decrease the number of -Wunused-but-set-variable warnings.
>
> Signed-off-by: Arthur Grillo <arthurgrillo@riseup.net>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c  | 3 +--
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c         | 7 -------
>  drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c       | 2 --
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c          | 2 --
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c          | 4 ----
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c         | 3 ---
>  drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c      | 5 +----
>  .../gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c  | 4 ----
>  .../drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c  | 2 --
>  .../drm/amd/display/dc/link/protocols/link_dp_capability.c | 4 ----
>  10 files changed, 2 insertions(+), 34 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
> index c4287147b853..ee08b545aaea 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn10/dcn10_link_encoder.c
> @@ -1219,7 +1219,6 @@ void dcn10_link_encoder_update_mst_stream_allocation_table(
>         const struct link_mst_stream_allocation_table *table)
>  {
>         struct dcn10_link_encoder *enc10 = TO_DCN10_LINK_ENC(enc);
> -       uint32_t value0 = 0;
>         uint32_t value1 = 0;
>         uint32_t value2 = 0;
>         uint32_t slots = 0;
> @@ -1321,7 +1320,7 @@ void dcn10_link_encoder_update_mst_stream_allocation_table(
>         do {
>                 udelay(10);
>
> -               value0 = REG_READ(DP_MSE_SAT_UPDATE);
> +               REG_READ(DP_MSE_SAT_UPDATE);
>
>                 REG_GET(DP_MSE_SAT_UPDATE,
>                                 DP_MSE_SAT_UPDATE, &value1);
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
> index f50ab961bc17..a7268027a472 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_dpp.c
> @@ -185,13 +185,6 @@ static bool dpp201_get_optimal_number_of_taps(
>                 struct scaler_data *scl_data,
>                 const struct scaling_taps *in_taps)
>  {
> -       uint32_t pixel_width;
> -
> -       if (scl_data->viewport.width > scl_data->recout.width)
> -               pixel_width = scl_data->recout.width;
> -       else
> -               pixel_width = scl_data->viewport.width;
> -
>         if (scl_data->viewport.width  != scl_data->h_active &&
>                 scl_data->viewport.height != scl_data->v_active &&
>                 dpp->caps->dscl_data_proc_format == DSCL_DATA_PRCESSING_FIXED_FORMAT &&
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> index 61bcfa03c4e7..1aeb04fbd89d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn201/dcn201_hwseq.c
> @@ -541,8 +541,6 @@ void dcn201_pipe_control_lock(
>         bool lock)
>  {
>         struct dce_hwseq *hws = dc->hwseq;
> -       struct hubp *hubp = NULL;
> -       hubp = dc->res_pool->hubps[pipe->pipe_idx];
>         /* use TG master update lock to lock everything on the TG
>          * therefore only top pipe need to lock
>          */
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
> index 95528e5ef89e..55e388c4c98b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_afmt.c
> @@ -123,7 +123,6 @@ void afmt3_se_audio_setup(
>  {
>         struct dcn30_afmt *afmt3 = DCN30_AFMT_FROM_AFMT(afmt);
>
> -       uint32_t speakers = 0;
>         uint32_t channels = 0;
>
>         ASSERT(audio_info);
> @@ -131,7 +130,6 @@ void afmt3_se_audio_setup(
>         if (audio_info == NULL)
>                 return;
>
> -       speakers = audio_info->flags.info.ALLSPEAKERS;
>         channels = speakers_to_channels(audio_info->flags.speaker_flags).all;
>
>         /* setup the audio stream source select (audio -> dig mapping) */
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
> index dc3e8df706b3..e46bbe7ddcc9 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hubp.c
> @@ -47,13 +47,9 @@ void hubp3_set_vm_system_aperture_settings(struct hubp *hubp,
>  {
>         struct dcn20_hubp *hubp2 = TO_DCN20_HUBP(hubp);
>
> -       PHYSICAL_ADDRESS_LOC mc_vm_apt_default;
>         PHYSICAL_ADDRESS_LOC mc_vm_apt_low;
>         PHYSICAL_ADDRESS_LOC mc_vm_apt_high;
>
> -       // The format of default addr is 48:12 of the 48 bit addr
> -       mc_vm_apt_default.quad_part = apt->sys_default.quad_part >> 12;
> -
>         // The format of high/low are 48:18 of the 48 bit addr
>         mc_vm_apt_low.quad_part = apt->sys_low.quad_part >> 18;
>         mc_vm_apt_high.quad_part = apt->sys_high.quad_part >> 18;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> index 444f9fad3de6..1d848d14508b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_hwseq.c
> @@ -322,13 +322,10 @@ void dcn30_enable_writeback(
>  {
>         struct dwbc *dwb;
>         struct mcif_wb *mcif_wb;
> -       struct timing_generator *optc;
>
>         dwb = dc->res_pool->dwbc[wb_info->dwb_pipe_inst];
>         mcif_wb = dc->res_pool->mcif_wb[wb_info->dwb_pipe_inst];
>
> -       /* set the OPTC source mux */
> -       optc = dc->res_pool->timing_generators[dwb->otg_inst];
>         DC_LOG_DWB("%s dwb_pipe_inst = %d, mpcc_inst = %d",\
>                 __func__, wb_info->dwb_pipe_inst,\
>                 wb_info->mpcc_inst);
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
> index 74e50c09bb62..e997bb98b43d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource.c
> @@ -1611,7 +1611,6 @@ bool dcn32_acquire_post_bldn_3dlut(
>                 struct dc_transfer_func **shaper)
>  {
>         bool ret = false;
> -       union dc_3dlut_state *state;
>
>         ASSERT(*lut == NULL && *shaper == NULL);
>         *lut = NULL;
> @@ -1620,7 +1619,6 @@ bool dcn32_acquire_post_bldn_3dlut(
>         if (!res_ctx->is_mpc_3dlut_acquired[mpcc_id]) {
>                 *lut = pool->mpc_lut[mpcc_id];
>                 *shaper = pool->mpc_shaper[mpcc_id];
> -               state = &pool->mpc_lut[mpcc_id]->state;
>                 res_ctx->is_mpc_3dlut_acquired[mpcc_id] = true;
>                 ret = true;
>         }
> @@ -1913,7 +1911,6 @@ int dcn32_populate_dml_pipes_from_context(
>         struct resource_context *res_ctx = &context->res_ctx;
>         struct pipe_ctx *pipe;
>         bool subvp_in_use = false;
> -       uint8_t is_pipe_split_expected[MAX_PIPES] = {0};
>         struct dc_crtc_timing *timing;
>
>         dcn20_populate_dml_pipes_from_context(dc, context, pipes, fast_validate);
> @@ -2002,7 +1999,7 @@ int dcn32_populate_dml_pipes_from_context(
>                 }
>
>                 DC_FP_START();
> -               is_pipe_split_expected[i] = dcn32_predict_pipe_split(context, &pipes[pipe_cnt]);
> +               dcn32_predict_pipe_split(context, &pipes[pipe_cnt]);
>                 DC_FP_END();
>
>                 pipe_cnt++;
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> index 3a2d7bcc4b6d..a616cf078cf4 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn32/dcn32_resource_helpers.c
> @@ -59,25 +59,21 @@ uint32_t dcn32_helper_calculate_mall_bytes_for_cursor(
>  {
>         struct hubp *hubp = pipe_ctx->plane_res.hubp;
>         uint32_t cursor_size = hubp->curs_attr.pitch * hubp->curs_attr.height;
> -       uint32_t cursor_bpp = 4;
>         uint32_t cursor_mall_size_bytes = 0;
>
>         switch (pipe_ctx->stream->cursor_attributes.color_format) {
>         case CURSOR_MODE_MONO:
>                 cursor_size /= 2;
> -               cursor_bpp = 4;
>                 break;
>         case CURSOR_MODE_COLOR_1BIT_AND:
>         case CURSOR_MODE_COLOR_PRE_MULTIPLIED_ALPHA:
>         case CURSOR_MODE_COLOR_UN_PRE_MULTIPLIED_ALPHA:
>                 cursor_size *= 4;
> -               cursor_bpp = 4;
>                 break;
>
>         case CURSOR_MODE_COLOR_64BIT_FP_PRE_MULTIPLIED:
>         case CURSOR_MODE_COLOR_64BIT_FP_UN_PRE_MULTIPLIED:
>                 cursor_size *= 8;
> -               cursor_bpp = 8;
>                 break;
>         }
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> index 35d10b4d018b..2244e4fb8c96 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> @@ -902,7 +902,6 @@ static void dml_rq_dlg_get_dlg_params(
>         double hratio_c;
>         double vratio_l;
>         double vratio_c;
> -       bool scl_enable;
>
>         unsigned int swath_width_ub_l;
>         unsigned int dpte_groups_per_row_ub_l;
> @@ -1020,7 +1019,6 @@ static void dml_rq_dlg_get_dlg_params(
>         hratio_c = scl->hscl_ratio_c;
>         vratio_l = scl->vscl_ratio;
>         vratio_c = scl->vscl_ratio_c;
> -       scl_enable = scl->scl_enable;
>
>         swath_width_ub_l = rq_dlg_param->rq_l.swath_width_ub;
>         dpte_groups_per_row_ub_l = rq_dlg_param->rq_l.dpte_groups_per_row_ub;
> diff --git a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> index 138e5684c7fd..1c2ce08bdece 100644
> --- a/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> +++ b/drivers/gpu/drm/amd/display/dc/link/protocols/link_dp_capability.c
> @@ -276,7 +276,6 @@ static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
>                 int length)
>  {
>         int retry = 0;
> -       union dp_downstream_port_present ds_port = { 0 };
>
>         if (!link->dpcd_caps.dpcd_rev.raw) {
>                 do {
> @@ -289,9 +288,6 @@ static void dp_wa_power_up_0010FA(struct dc_link *link, uint8_t *dpcd_data,
>                 } while (retry++ < 4 && !link->dpcd_caps.dpcd_rev.raw);
>         }
>
> -       ds_port.byte = dpcd_data[DP_DOWNSTREAMPORT_PRESENT -
> -                                DP_DPCD_REV];
> -
>         if (link->dpcd_caps.dongle_type == DISPLAY_DONGLE_DP_VGA_CONVERTER) {
>                 switch (link->dpcd_caps.branch_dev_id) {
>                 /* 0010FA active dongles (DP-VGA, DP-DLDVI converters) power down
> --
> 2.39.2
>
