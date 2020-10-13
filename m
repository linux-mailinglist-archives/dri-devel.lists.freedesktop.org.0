Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AAB28CEF5
	for <lists+dri-devel@lfdr.de>; Tue, 13 Oct 2020 15:11:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0AC36E8F1;
	Tue, 13 Oct 2020 13:11:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 573F36E8F8;
 Tue, 13 Oct 2020 13:11:49 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id n18so23995058wrs.5;
 Tue, 13 Oct 2020 06:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hP4I1TSE0iiKe4uFVvPyKh5ZjOZU39ztMJs9eGzKphE=;
 b=d7rK4C8mM7F7Mme2iU2+7ZjVgizAOHZSsRSZe5ZPmBkFa7mDw5CR4Z/BftFM5EMzSn
 5A6rRSaYV9xFqjcsRSWKas27xMHogPcTggZkiLuwP96It/VGrrLF1KBgyKV6OtGNlsFK
 VjmRlV5FgTBf2LYV1MEXXTqpR3rIaiD4xgM7gPLQ/TfEOrpUnXicpnFfbXQKoJ0Gu4WM
 aNy/qZKePQWr+spaE7cwccOBkp/F/ZqsRO2UVEvDk6iM5m2hF1DQC98fPByh9Xacd5Vd
 FJJgWhfTHkZgWBM9ZjStW/z3oGUQIRDoSpoBHi8avv2MHVIomMrvaxvknNf15MYnqnXD
 GtSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hP4I1TSE0iiKe4uFVvPyKh5ZjOZU39ztMJs9eGzKphE=;
 b=CP0ya0+gz8VYN5mUl3xOsXSClCv9ZinS82R5uE0kjM4pvW1fc0ThsnSZBxqE6pNbmL
 tN8QGtviCZJz//pc2L4ZS70WBXZjrFhqGBYcG/a287rf/KeQD9C5s7pJEPeEK+BawGIn
 vR9YTxaq1KWGm3vfMp5KuJfxUHWWmmT3e9yGpMg4CVvBfRDqRU4NAqpLHeE4waHaU9GT
 3SJnI9XmcyoKo6fXHlGP8N2KTglapSg1++fYytbCqLjA0kPiuGCX16dkH5Jt1Xzg0Jik
 5HzxF4bsRC2zcsFD0LrkFw7dn0Q08g3JnwTxzHJQ9SLQbF+mXUieoGWx1pHRRVp4GMxB
 Uudg==
X-Gm-Message-State: AOAM533jn56LUYNRSU1+jmMm6ws08iYrVXHCTsiDrQuts6ZF524+k2Jj
 ikVS0QUugmWgkaPTWDgP0xAA7eY31C76/ZKqy/w=
X-Google-Smtp-Source: ABdhPJwCH8a1D0+3oh4RSFSUGPQPJdoPQvQkpSD/avgAkn1KFZidf8NIXW/31BQm3MiFaQm16TPeo37b3nLk2KIkeY4=
X-Received: by 2002:adf:f246:: with SMTP id b6mr29643949wrp.111.1602594707982; 
 Tue, 13 Oct 2020 06:11:47 -0700 (PDT)
MIME-Version: 1.0
References: <20201012114623.8583-1-bernard@vivo.com>
In-Reply-To: <20201012114623.8583-1-bernard@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 13 Oct 2020 09:11:36 -0400
Message-ID: <CADnq5_MH2EYWuumqtZ+UPF-5TAW_+91F6mHFEu3MScTGQOQ0Dg@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: remove no need return value
To: Bernard Zhao <bernard@vivo.com>
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
Cc: David Airlie <airlied@linux.ie>, Samson Tam <Samson.Tam@amd.com>,
 Reza Amini <Reza.Amini@amd.com>, Wyatt Wood <wyatt.wood@amd.com>,
 Jun Lei <jun.lei@amd.com>, Anthony Koo <Anthony.Koo@amd.com>,
 Charlene Liu <Charlene.Liu@amd.com>, Krunoslav Kovac <Krunoslav.Kovac@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, opensource.kernel@vivo.com,
 Leo Li <sunpeng.li@amd.com>, Brandon Syu <Brandon.Syu@amd.com>,
 linux-mediatek@lists.infradead.org,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Yongqiang Sun <yongqiang.sun@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, Oct 12, 2020 at 9:44 AM Bernard Zhao <bernard@vivo.com> wrote:
>
> Functions (disable_all_writeback_pipes_for_stream &
> dc_enable_stereo & dc_post_update_surfaces_to_stream)
> always return true, there is no need to keep the return value.
> This change is to make the code a bit more readable.
>
> Signed-off-by: Bernard Zhao <bernard@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c   | 17 +++++------------
>  drivers/gpu/drm/amd/display/dc/dc.h        |  2 +-
>  drivers/gpu/drm/amd/display/dc/dc_stream.h |  2 +-
>  3 files changed, 7 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 92eb1ca1634f..8dc598a632b5 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -761,7 +761,7 @@ static bool dc_construct(struct dc *dc,
>         return false;
>  }
>
> -static bool disable_all_writeback_pipes_for_stream(
> +static void disable_all_writeback_pipes_for_stream(
>                 const struct dc *dc,
>                 struct dc_stream_state *stream,
>                 struct dc_state *context)
> @@ -770,8 +770,6 @@ static bool disable_all_writeback_pipes_for_stream(
>
>         for (i = 0; i < stream->num_wb_info; i++)
>                 stream->writeback_info[i].wb_enabled = false;
> -
> -       return true;
>  }
>
>  void apply_ctx_interdependent_lock(struct dc *dc, struct dc_state *context, struct dc_stream_state *stream, bool lock)
> @@ -1213,13 +1211,12 @@ bool dc_validate_seamless_boot_timing(const struct dc *dc,
>         return true;
>  }
>
> -bool dc_enable_stereo(
> +void dc_enable_stereo(
>         struct dc *dc,
>         struct dc_state *context,
>         struct dc_stream_state *streams[],
>         uint8_t stream_count)
>  {
> -       bool ret = true;
>         int i, j;
>         struct pipe_ctx *pipe;
>
> @@ -1234,8 +1231,6 @@ bool dc_enable_stereo(
>                                 dc->hwss.setup_stereo(pipe, dc);
>                 }
>         }
> -
> -       return ret;
>  }
>
>  /*
> @@ -1448,18 +1443,18 @@ static bool is_flip_pending_in_pipes(struct dc *dc, struct dc_state *context)
>         return false;
>  }
>
> -bool dc_post_update_surfaces_to_stream(struct dc *dc)
> +void dc_post_update_surfaces_to_stream(struct dc *dc)
>  {
>         int i;
>         struct dc_state *context = dc->current_state;
>
>         if ((!dc->optimized_required) || dc->optimize_seamless_boot_streams > 0)
> -               return true;
> +               return;
>
>         post_surface_trace(dc);
>
>         if (is_flip_pending_in_pipes(dc, context))
> -               return true;
> +               return;
>
>         for (i = 0; i < dc->res_pool->pipe_count; i++)
>                 if (context->res_ctx.pipe_ctx[i].stream == NULL ||
> @@ -1472,8 +1467,6 @@ bool dc_post_update_surfaces_to_stream(struct dc *dc)
>
>         dc->optimized_required = false;
>         dc->wm_optimized_required = false;
> -
> -       return true;
>  }
>
>  struct dc_state *dc_create_state(struct dc *dc)
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index f50ef4255020..f79a3c318757 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -962,7 +962,7 @@ struct dc_flip_addrs {
>         bool triplebuffer_flips;
>  };
>
> -bool dc_post_update_surfaces_to_stream(
> +void dc_post_update_surfaces_to_stream(
>                 struct dc *dc);
>
>  #include "dc_stream.h"
> diff --git a/drivers/gpu/drm/amd/display/dc/dc_stream.h b/drivers/gpu/drm/amd/display/dc/dc_stream.h
> index d9888f316da6..0047ab33f88e 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc_stream.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc_stream.h
> @@ -391,7 +391,7 @@ enum dc_status dc_validate_stream(struct dc *dc, struct dc_stream_state *stream)
>   * Enable stereo when commit_streams is not required,
>   * for example, frame alternate.
>   */
> -bool dc_enable_stereo(
> +void dc_enable_stereo(
>         struct dc *dc,
>         struct dc_state *context,
>         struct dc_stream_state *streams[],
> --
> 2.28.0
>
> _______________________________________________
> amd-gfx mailing list
> amd-gfx@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/amd-gfx
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
