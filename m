Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A8EB435433
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128346E39B;
	Wed, 20 Oct 2021 19:56:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 060726E39B;
 Wed, 20 Oct 2021 19:56:05 +0000 (UTC)
Received: by mail-oo1-xc2e.google.com with SMTP id
 k11-20020a4aa5cb000000b002b73749f3cdso2333912oom.4; 
 Wed, 20 Oct 2021 12:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DtmemVQCVHDBf8jIJh9Nv8W04+vAEsgcaDaUTri5z5c=;
 b=Ay5iVAonI5edsD1O010bblCH9ZdF27HQD3TxFkRg8qawXgNEsHcunJ7R5sg2aIH0CO
 PCigb0meIYyUSs3Sz9cEbYkw2PGIAYpO7ZH3Yass7T4ihZ7znDwhyoLGm1aQByXBfMlp
 fzWHc5V6NdlBv20UAbsmV+rri2oG23ytDGGONKLdWrVjUihF+D1THcNIRw8jL/9WUg20
 hy81YjOhAiaHfcSaZOLJ+1nZOp+KTTKAQDtey84Rr64t1YL/j1vQeMn31YfW7JaFvGsh
 FlpdFxc/QeTavBxNulNJOApMiil2AEIiUEhLpfkh53kkgwM0U6Z5Qz994sleHJwAwLrq
 Ts6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DtmemVQCVHDBf8jIJh9Nv8W04+vAEsgcaDaUTri5z5c=;
 b=YcbNJG1Nv8Zl3NQ4/bZIZjrRIvwK4EGzxz7Nnh0/bijymrMdNHwpdEGQiShAADwIt4
 d8sbFaJcsp2DnrDCg5WyMqh3CLvx2PhWyonOsYMZBvTdLDMkcRpNuCsIsRFXAVnsQX4M
 T2E9R9sqT07qUHBNmequ9nP1G7HLndkzRTPNljeISA4hiptUTYFqV4o4aG7vfBwRTKYM
 TKWqtam7LvlGm27wYRhmtWCMB5/z/t3kaqA+8+x63FzONN9vv1P8WRIGMa76Mr5Fzvxr
 QEP3Q+C0T29kDdoirgvqIv6FEjCGs92a6Xou//FSkWjC0VbT2qM3x+p15mDDWOOgBev3
 LBRg==
X-Gm-Message-State: AOAM530U7ZqxXvyj+9wkBaik0WOzDiCN+X9dKP7p2xIeZq43bjABHBvt
 Q5y1GN3ryNQHHbbNGSgkgu3hy40lJuubqfwXGmw=
X-Google-Smtp-Source: ABdhPJykbW+UIpMhH1WA8zEGjYLRRxvaQajnOgr+xPuCTA1gFpbN2Fs4CVXnjWHMQ8BFPMS+7mUu1l+aKf4PEmHRxUI=
X-Received: by 2002:a4a:b881:: with SMTP id z1mr1016366ooo.68.1634759765068;
 Wed, 20 Oct 2021 12:56:05 -0700 (PDT)
MIME-Version: 1.0
References: <20211020194715.1107972-1-Bhawanpreet.Lakha@amd.com>
 <20211020194715.1107972-3-Bhawanpreet.Lakha@amd.com>
In-Reply-To: <20211020194715.1107972-3-Bhawanpreet.Lakha@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Wed, 20 Oct 2021 15:55:54 -0400
Message-ID: <CADnq5_OrdZUUmrCmPfZLqGqPGvob6WUzvCwzJnBFv7=j3RzimA@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/amd/display: Add DP 2.0 MST DC Support
To: Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>
Cc: Jerry Zuo <Jerry.Zuo@amd.com>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Lyude <lyude@redhat.com>, 
 "Wentland, Harry" <Harry.Wentland@amd.com>, Wayne Lin <Wayne.Lin@amd.com>, 
 "Kazlauskas, Nicholas" <Nicholas.Kazlauskas@amd.com>, "Lipski,
 Mikita" <Mikita.Lipski@amd.com>, 
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Oct 20, 2021 at 3:50 PM Bhawanpreet Lakha
<Bhawanpreet.Lakha@amd.com> wrote:
>
> From: Fangzhi Zuo <Jerry.Zuo@amd.com>

Please include a patch description.

Alex

>
> Signed-off-by: Fangzhi Zuo <Jerry.Zuo@amd.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c      |  14 +
>  drivers/gpu/drm/amd/display/dc/core/dc_link.c | 280 ++++++++++++++++++
>  .../gpu/drm/amd/display/dc/core/dc_link_dp.c  |  19 ++
>  drivers/gpu/drm/amd/display/dc/dc_link.h      |   7 +
>  drivers/gpu/drm/amd/display/dc/dc_stream.h    |  13 +
>  5 files changed, 333 insertions(+)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 8be04be19124..935a50d6e933 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -2354,6 +2354,11 @@ static enum surface_update_type check_update_surfaces_for_stream(
>                 if (stream_update->dsc_config)
>                         su_flags->bits.dsc_changed = 1;
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +               if (stream_update->mst_bw_update)
> +                       su_flags->bits.mst_bw = 1;
> +#endif
> +
>                 if (su_flags->raw != 0)
>                         overall_type = UPDATE_TYPE_FULL;
>
> @@ -2731,6 +2736,15 @@ static void commit_planes_do_stream_update(struct dc *dc,
>                         if (stream_update->dsc_config)
>                                 dp_update_dsc_config(pipe_ctx);
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +                       if (stream_update->mst_bw_update) {
> +                               if (stream_update->mst_bw_update->is_increase)
> +                                       dc_link_increase_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
> +                               else
> +                                       dc_link_reduce_mst_payload(pipe_ctx, stream_update->mst_bw_update->mst_stream_bw);
> +                       }
> +#endif
> +
>                         if (stream_update->pending_test_pattern) {
>                                 dc_link_dp_set_test_pattern(stream->link,
>                                         stream->test_pattern.type,
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link.c b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> index e5d6cbd7ea78..b23972b6a27c 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link.c
> @@ -3232,6 +3232,9 @@ static struct fixed31_32 get_pbn_from_timing(struct pipe_ctx *pipe_ctx)
>  static void update_mst_stream_alloc_table(
>         struct dc_link *link,
>         struct stream_encoder *stream_enc,
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       struct hpo_dp_stream_encoder *hpo_dp_stream_enc, // TODO: Rename stream_enc to dio_stream_enc?
> +#endif
>         const struct dp_mst_stream_allocation_table *proposed_table)
>  {
>         struct link_mst_stream_allocation work_table[MAX_CONTROLLER_NUM] = { 0 };
> @@ -3267,6 +3270,9 @@ static void update_mst_stream_alloc_table(
>                         work_table[i].slot_count =
>                                 proposed_table->stream_allocations[i].slot_count;
>                         work_table[i].stream_enc = stream_enc;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +                       work_table[i].hpo_dp_stream_enc = hpo_dp_stream_enc;
> +#endif
>                 }
>         }
>
> @@ -3389,6 +3395,10 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
>         struct dc_link *link = stream->link;
>         struct link_encoder *link_encoder = NULL;
>         struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       struct hpo_dp_link_encoder *hpo_dp_link_encoder = link->hpo_dp_link_enc;
> +       struct hpo_dp_stream_encoder *hpo_dp_stream_encoder = pipe_ctx->stream_res.hpo_dp_stream_enc;
> +#endif
>         struct dp_mst_stream_allocation_table proposed_table = {0};
>         struct fixed31_32 avg_time_slots_per_mtp;
>         struct fixed31_32 pbn;
> @@ -3416,7 +3426,14 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
>                 &proposed_table,
>                 true)) {
>                 update_mst_stream_alloc_table(
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +                                       link,
> +                                       pipe_ctx->stream_res.stream_enc,
> +                                       pipe_ctx->stream_res.hpo_dp_stream_enc,
> +                                       &proposed_table);
> +#else
>                                         link, pipe_ctx->stream_res.stream_enc, &proposed_table);
> +#endif
>         }
>         else
>                 DC_LOG_WARNING("Failed to update"
> @@ -3430,6 +3447,20 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
>                         link->mst_stream_alloc_table.stream_count);
>
>         for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +               DC_LOG_MST("stream_enc[%d]: %p      "
> +               "stream[%d].hpo_dp_stream_enc: %p      "
> +               "stream[%d].vcp_id: %d      "
> +               "stream[%d].slot_count: %d\n",
> +               i,
> +               (void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
> +               i,
> +               (void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
> +               i,
> +               link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
> +               i,
> +               link->mst_stream_alloc_table.stream_allocations[i].slot_count);
> +#else
>                 DC_LOG_MST("stream_enc[%d]: %p      "
>                 "stream[%d].vcp_id: %d      "
>                 "stream[%d].slot_count: %d\n",
> @@ -3439,14 +3470,30 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
>                 link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
>                 i,
>                 link->mst_stream_alloc_table.stream_allocations[i].slot_count);
> +#endif
>         }
>
>         ASSERT(proposed_table.stream_count > 0);
>
>         /* program DP source TX for payload */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
> +       case DP_8b_10b_ENCODING:
> +               link_encoder->funcs->update_mst_stream_allocation_table(
> +                       link_encoder,
> +                       &link->mst_stream_alloc_table);
> +               break;
> +       case DP_128b_132b_ENCODING:
> +               hpo_dp_link_encoder->funcs->update_stream_allocation_table(
> +                               hpo_dp_link_encoder,
> +                               &link->mst_stream_alloc_table);
> +               break;
> +       }
> +#else
>         link_encoder->funcs->update_mst_stream_allocation_table(
>                 link_encoder,
>                 &link->mst_stream_alloc_table);
> +#endif
>
>         /* send down message */
>         ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> @@ -3469,13 +3516,188 @@ enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx)
>         pbn = get_pbn_from_timing(pipe_ctx);
>         avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
> +       case DP_8b_10b_ENCODING:
> +               stream_encoder->funcs->set_throttled_vcp_size(
> +                       stream_encoder,
> +                       avg_time_slots_per_mtp);
> +               break;
> +       case DP_128b_132b_ENCODING:
> +               hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
> +                               hpo_dp_link_encoder,
> +                               hpo_dp_stream_encoder->inst,
> +                               avg_time_slots_per_mtp);
> +               break;
> +       }
> +#else
>         stream_encoder->funcs->set_throttled_vcp_size(
>                 stream_encoder,
>                 avg_time_slots_per_mtp);
> +#endif
> +
> +       return DC_OK;
> +
> +}
> +
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
> +{
> +       struct dc_stream_state *stream = pipe_ctx->stream;
> +       struct dc_link *link = stream->link;
> +       struct fixed31_32 avg_time_slots_per_mtp;
> +       struct fixed31_32 pbn;
> +       struct fixed31_32 pbn_per_slot;
> +       struct link_encoder *link_encoder = link->link_enc;
> +       struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
> +       struct dp_mst_stream_allocation_table proposed_table = {0};
> +       uint8_t i;
> +       enum act_return_status ret;
> +       DC_LOGGER_INIT(link->ctx->logger);
> +
> +       /* decrease throttled vcp size */
> +       pbn_per_slot = get_pbn_per_slot(stream);
> +       pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
> +       avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
> +
> +       stream_encoder->funcs->set_throttled_vcp_size(
> +                               stream_encoder,
> +                               avg_time_slots_per_mtp);
> +
> +       /* send ALLOCATE_PAYLOAD sideband message with updated pbn */
> +       dm_helpers_dp_mst_send_payload_allocation(
> +                       stream->ctx,
> +                       stream,
> +                       true);
> +
> +       /* notify immediate branch device table update */
> +       if (dm_helpers_dp_mst_write_payload_allocation_table(
> +                       stream->ctx,
> +                       stream,
> +                       &proposed_table,
> +                       true)) {
> +               /* update mst stream allocation table software state */
> +               update_mst_stream_alloc_table(
> +                               link,
> +                               pipe_ctx->stream_res.stream_enc,
> +                               pipe_ctx->stream_res.hpo_dp_stream_enc,
> +                               &proposed_table);
> +       } else {
> +               DC_LOG_WARNING("Failed to update"
> +                               "MST allocation table for"
> +                               "pipe idx:%d\n",
> +                               pipe_ctx->pipe_idx);
> +       }
> +
> +       DC_LOG_MST("%s  "
> +                       "stream_count: %d: \n ",
> +                       __func__,
> +                       link->mst_stream_alloc_table.stream_count);
> +
> +       for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
> +               DC_LOG_MST("stream_enc[%d]: %p      "
> +                               "stream[%d].vcp_id: %d      "
> +                               "stream[%d].slot_count: %d\n",
> +                               i,
> +                               (void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
> +                               i,
> +                               link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
> +                               i,
> +                               link->mst_stream_alloc_table.stream_allocations[i].slot_count);
> +       }
> +
> +       ASSERT(proposed_table.stream_count > 0);
> +
> +       /* update mst stream allocation table hardware state */
> +       link_encoder->funcs->update_mst_stream_allocation_table(
> +                       link_encoder,
> +                       &link->mst_stream_alloc_table);
> +
> +       /* poll for immediate branch device ACT handled */
> +       ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> +                       stream->ctx,
> +                       stream);
>
>         return DC_OK;
> +}
> +
> +enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t bw_in_kbps)
> +{
> +       struct dc_stream_state *stream = pipe_ctx->stream;
> +       struct dc_link *link = stream->link;
> +       struct fixed31_32 avg_time_slots_per_mtp;
> +       struct fixed31_32 pbn;
> +       struct fixed31_32 pbn_per_slot;
> +       struct link_encoder *link_encoder = link->link_enc;
> +       struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
> +       struct dp_mst_stream_allocation_table proposed_table = {0};
> +       uint8_t i;
> +       enum act_return_status ret;
> +       DC_LOGGER_INIT(link->ctx->logger);
> +
> +       /* notify immediate branch device table update */
> +       if (dm_helpers_dp_mst_write_payload_allocation_table(
> +                               stream->ctx,
> +                               stream,
> +                               &proposed_table,
> +                               true)) {
> +               /* update mst stream allocation table software state */
> +               update_mst_stream_alloc_table(
> +                               link,
> +                               pipe_ctx->stream_res.stream_enc,
> +                               pipe_ctx->stream_res.hpo_dp_stream_enc,
> +                               &proposed_table);
> +       }
> +
> +       DC_LOG_MST("%s  "
> +                       "stream_count: %d: \n ",
> +                       __func__,
> +                       link->mst_stream_alloc_table.stream_count);
> +
> +       for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
> +               DC_LOG_MST("stream_enc[%d]: %p      "
> +                               "stream[%d].vcp_id: %d      "
> +                               "stream[%d].slot_count: %d\n",
> +                               i,
> +                               (void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
> +                               i,
> +                               link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
> +                               i,
> +                               link->mst_stream_alloc_table.stream_allocations[i].slot_count);
> +       }
> +
> +       ASSERT(proposed_table.stream_count > 0);
> +
> +       /* update mst stream allocation table hardware state */
> +       link_encoder->funcs->update_mst_stream_allocation_table(
> +                       link_encoder,
> +                       &link->mst_stream_alloc_table);
> +
> +       /* poll for immediate branch device ACT handled */
> +       ret = dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> +                       stream->ctx,
> +                       stream);
> +
> +       if (ret != ACT_LINK_LOST) {
> +               /* send ALLOCATE_PAYLOAD sideband message with updated pbn */
> +               dm_helpers_dp_mst_send_payload_allocation(
> +                               stream->ctx,
> +                               stream,
> +                               true);
> +       }
> +
> +       /* increase throttled vcp size */
> +       pbn = get_pbn_from_bw_in_kbps(bw_in_kbps);
> +       pbn_per_slot = get_pbn_per_slot(stream);
> +       avg_time_slots_per_mtp = dc_fixpt_div(pbn, pbn_per_slot);
> +
> +       stream_encoder->funcs->set_throttled_vcp_size(
> +                               stream_encoder,
> +                               avg_time_slots_per_mtp);
>
> +       return DC_OK;
>  }
> +#endif
>
>  static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
>  {
> @@ -3483,6 +3705,10 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
>         struct dc_link *link = stream->link;
>         struct link_encoder *link_encoder = NULL;
>         struct stream_encoder *stream_encoder = pipe_ctx->stream_res.stream_enc;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       struct hpo_dp_link_encoder *hpo_dp_link_encoder = link->hpo_dp_link_enc;
> +       struct hpo_dp_stream_encoder *hpo_dp_stream_encoder = pipe_ctx->stream_res.hpo_dp_stream_enc;
> +#endif
>         struct dp_mst_stream_allocation_table proposed_table = {0};
>         struct fixed31_32 avg_time_slots_per_mtp = dc_fixpt_from_int(0);
>         int i;
> @@ -3504,9 +3730,25 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
>          */
>
>         /* slot X.Y */
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
> +       case DP_8b_10b_ENCODING:
> +               stream_encoder->funcs->set_throttled_vcp_size(
> +                       stream_encoder,
> +                       avg_time_slots_per_mtp);
> +               break;
> +       case DP_128b_132b_ENCODING:
> +               hpo_dp_link_encoder->funcs->set_throttled_vcp_size(
> +                               hpo_dp_link_encoder,
> +                               hpo_dp_stream_encoder->inst,
> +                               avg_time_slots_per_mtp);
> +               break;
> +       }
> +#else
>         stream_encoder->funcs->set_throttled_vcp_size(
>                 stream_encoder,
>                 avg_time_slots_per_mtp);
> +#endif
>
>         /* TODO: which component is responsible for remove payload table? */
>         if (mst_mode) {
> @@ -3516,8 +3758,16 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
>                                 &proposed_table,
>                                 false)) {
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +                       update_mst_stream_alloc_table(
> +                                               link,
> +                                               pipe_ctx->stream_res.stream_enc,
> +                                               pipe_ctx->stream_res.hpo_dp_stream_enc,
> +                                               &proposed_table);
> +#else
>                         update_mst_stream_alloc_table(
>                                 link, pipe_ctx->stream_res.stream_enc, &proposed_table);
> +#endif
>                 }
>                 else {
>                                 DC_LOG_WARNING("Failed to update"
> @@ -3533,6 +3783,20 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
>                         link->mst_stream_alloc_table.stream_count);
>
>         for (i = 0; i < MAX_CONTROLLER_NUM; i++) {
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +               DC_LOG_MST("stream_enc[%d]: %p      "
> +               "stream[%d].hpo_dp_stream_enc: %p      "
> +               "stream[%d].vcp_id: %d      "
> +               "stream[%d].slot_count: %d\n",
> +               i,
> +               (void *) link->mst_stream_alloc_table.stream_allocations[i].stream_enc,
> +               i,
> +               (void *) link->mst_stream_alloc_table.stream_allocations[i].hpo_dp_stream_enc,
> +               i,
> +               link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
> +               i,
> +               link->mst_stream_alloc_table.stream_allocations[i].slot_count);
> +#else
>                 DC_LOG_MST("stream_enc[%d]: %p      "
>                 "stream[%d].vcp_id: %d      "
>                 "stream[%d].slot_count: %d\n",
> @@ -3542,11 +3806,27 @@ static enum dc_status deallocate_mst_payload(struct pipe_ctx *pipe_ctx)
>                 link->mst_stream_alloc_table.stream_allocations[i].vcp_id,
>                 i,
>                 link->mst_stream_alloc_table.stream_allocations[i].slot_count);
> +#endif
>         }
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       switch (dp_get_link_encoding_format(&link->cur_link_settings)) {
> +       case DP_8b_10b_ENCODING:
> +               link_encoder->funcs->update_mst_stream_allocation_table(
> +                       link_encoder,
> +                       &link->mst_stream_alloc_table);
> +               break;
> +       case DP_128b_132b_ENCODING:
> +               hpo_dp_link_encoder->funcs->update_stream_allocation_table(
> +                               hpo_dp_link_encoder,
> +                               &link->mst_stream_alloc_table);
> +               break;
> +       }
> +#else
>         link_encoder->funcs->update_mst_stream_allocation_table(
>                 link_encoder,
>                 &link->mst_stream_alloc_table);
> +#endif
>
>         if (mst_mode) {
>                 dm_helpers_dp_mst_poll_for_allocation_change_trigger(
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> index 296b0defcd1c..bb96e4e9ccfc 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_link_dp.c
> @@ -5993,6 +5993,25 @@ enum dp_link_encoding dp_get_link_encoding_format(const struct dc_link_settings
>  }
>
>  #if defined(CONFIG_DRM_AMD_DC_DCN)
> +enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link)
> +{
> +       struct dc_link_settings link_settings = {0};
> +
> +       if (!dc_is_dp_signal(link->connector_signal))
> +               return DP_UNKNOWN_ENCODING;
> +
> +       if (link->preferred_link_setting.lane_count !=
> +                       LANE_COUNT_UNKNOWN &&
> +                       link->preferred_link_setting.link_rate !=
> +                                       LINK_RATE_UNKNOWN) {
> +               link_settings = link->preferred_link_setting;
> +       } else {
> +               decide_mst_link_settings(link, &link_settings);
> +       }
> +
> +       return dp_get_link_encoding_format(&link_settings);
> +}
> +
>  // TODO - DP2.0 Link: Fix get_lane_status to handle LTTPR offset (SST and MST)
>  static void get_lane_status(
>         struct dc_link *link,
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_link.h b/drivers/gpu/drm/amd/display/dc/dc_link.h
> index a73d64b1fd33..08815310d85b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_link.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_link.h
> @@ -295,6 +295,10 @@ enum dc_detect_reason {
>  bool dc_link_detect(struct dc_link *dc_link, enum dc_detect_reason reason);
>  bool dc_link_get_hpd_state(struct dc_link *dc_link);
>  enum dc_status dc_link_allocate_mst_payload(struct pipe_ctx *pipe_ctx);
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +enum dc_status dc_link_reduce_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
> +enum dc_status dc_link_increase_mst_payload(struct pipe_ctx *pipe_ctx, uint32_t req_pbn);
> +#endif
>
>  /* Notify DC about DP RX Interrupt (aka Short Pulse Interrupt).
>   * Return:
> @@ -424,4 +428,7 @@ uint32_t dc_bandwidth_in_kbps_from_timing(
>  bool dc_link_is_fec_supported(const struct dc_link *link);
>  bool dc_link_should_enable_fec(const struct dc_link *link);
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +enum dp_link_encoding dc_link_dp_mst_decide_link_encoding_format(const struct dc_link *link);
> +#endif
>  #endif /* DC_LINK_H_ */
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
> index b8ebc1f09538..e37c4a10bfd5 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
> @@ -115,6 +115,13 @@ struct periodic_interrupt_config {
>         int lines_offset;
>  };
>
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +struct dc_mst_stream_bw_update {
> +       bool is_increase; // is bandwidth reduced or increased
> +       uint32_t mst_stream_bw; // new mst bandwidth in kbps
> +};
> +#endif
> +
>  union stream_update_flags {
>         struct {
>                 uint32_t scaling:1;
> @@ -125,6 +132,9 @@ union stream_update_flags {
>                 uint32_t gamut_remap:1;
>                 uint32_t wb_update:1;
>                 uint32_t dsc_changed : 1;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +               uint32_t mst_bw : 1;
> +#endif
>         } bits;
>
>         uint32_t raw;
> @@ -278,6 +288,9 @@ struct dc_stream_update {
>
>         struct dc_writeback_update *wb_update;
>         struct dc_dsc_config *dsc_config;
> +#if defined(CONFIG_DRM_AMD_DC_DCN)
> +       struct dc_mst_stream_bw_update *mst_bw_update;
> +#endif
>         struct dc_transfer_func *func_shaper;
>         struct dc_3dlut *lut3d_func;
>
> --
> 2.25.1
>
