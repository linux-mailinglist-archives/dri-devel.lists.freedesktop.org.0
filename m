Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5656534D5E6
	for <lists+dri-devel@lfdr.de>; Mon, 29 Mar 2021 19:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E88146E457;
	Mon, 29 Mar 2021 17:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com
 [IPv6:2607:f8b0:4864:20::c29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 741D46E457;
 Mon, 29 Mar 2021 17:17:56 +0000 (UTC)
Received: by mail-oo1-xc29.google.com with SMTP id
 j10-20020a4ad18a0000b02901b677a0ba98so3141922oor.1; 
 Mon, 29 Mar 2021 10:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=21iR4YsIMqr0GJilRg5APx1zgMQO9nbylZqGVp4FhgQ=;
 b=G62xhjcd8O7u1LvlgBxy6yH1+Hf/COQ05QMGWpusToI5ltmuRZ82DJYQ36s/9jJy+R
 y350WAuxaFigQJ5h65ShC/myVMsa5x7as7FUuWTNFPzcUEgQkhuKJP/2ONUt74yUW9id
 TxauZMRy7BTibjqXc606L7OeT6e4/P/QYtLNOCau4QHUxhuyt0u69JV1E/25ZJNnJ2SQ
 qFz0Jzmq9LS8EEiQwlO8flvoB1e2OTv4yDXtNqiB+07JDBJEVqAcGcaHiBC7X+T02Ggi
 399eRSnkcec3FBynLEQE5QmwuNSSFhFHMR5qX76CPuM7BH39ohEGBR7OaznKT2dwA8jo
 QVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=21iR4YsIMqr0GJilRg5APx1zgMQO9nbylZqGVp4FhgQ=;
 b=H5eEa3Q1cCP3MdYPMWtAD8A0Q8dmiI9S/eWV8WySzx23mItlL8xfKRSX4itxXXCTZm
 b+XGrHzrDvzqjR/KVRVf0UdFDgH11IPfFQ8xkJ0FHbNe1WygGRuqgJlKTWULSH1bVBgp
 p1HI7egihMu+lm4Kv1I1n/EzgJ98VlP6occsaSwT3WBiTwh7tnQPHjhHffi9XxlB86NW
 Fcs6g9Vs91QwDCPuKHmHnjSk1N4ornON5055ORwMFYrl/lvaHtFXyvYVqH09elHKQp0z
 0V8XqaI4dFK+PpBUzZCIZGsZlYlvlX66H2o0UHlVOQp9kqWZ5yzDNFUvLzwxc0yyO5am
 b9VQ==
X-Gm-Message-State: AOAM532WgYKt2G6mnRdxQOWqwD/zcTkfjhSXhggXCO+6sEMUAoHa1pcs
 WaSSaKbM4ZhvTKMpCi7WANV1UXDyOgn3eX5A1sw=
X-Google-Smtp-Source: ABdhPJz31x+IdZoMp9o42AxozLWzh9nLHiQ08ST/eyJ5NMSXmjVZL40w9dma34cMez1jrfhkMtr5jGnNVYBdLIa3Gk0=
X-Received: by 2002:a4a:8845:: with SMTP id e5mr22025923ooi.90.1617038275723; 
 Mon, 29 Mar 2021 10:17:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210327072807.1486517-1-wanjiabing@vivo.com>
In-Reply-To: <20210327072807.1486517-1-wanjiabing@vivo.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 29 Mar 2021 13:17:44 -0400
Message-ID: <CADnq5_PSnvFAcUt7T9q=L8v6sFGnLM72cot=Lq_+cs8cNHK5sg@mail.gmail.com>
Subject: Re: [PATCH] amd: display: dc: struct dc_state is declared twice
To: Wan Jiabing <wanjiabing@vivo.com>
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
Cc: Krunoslav Kovac <Krunoslav.Kovac@amd.com>, Jacky Liao <ziyu.liao@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Bhawanpreet Lakha <Bhawanpreet.Lakha@amd.com>,
 Qingqing Zhuo <qingqing.zhuo@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
 David Airlie <airlied@linux.ie>, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>, Wenjing Liu <wenjing.liu@amd.com>,
 kael_w@yeah.net, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Mar 27, 2021 at 3:28 AM Wan Jiabing <wanjiabing@vivo.com> wrote:
>
> struct dc_state has been declared at 273rd line.
> Remove the duplicate.
> Delete duplicate blank lines.

Can you split these into separate patches?

Alex

>
> Signed-off-by: Wan Jiabing <wanjiabing@vivo.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dc.h | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dc.h b/drivers/gpu/drm/amd/display/dc/dc.h
> index 18ed0d3f247e..dc667298ab5b 100644
> --- a/drivers/gpu/drm/amd/display/dc/dc.h
> +++ b/drivers/gpu/drm/amd/display/dc/dc.h
> @@ -234,7 +234,6 @@ struct dc_static_screen_params {
>         unsigned int num_frames;
>  };
>
> -
>  /* Surface update type is used by dc_update_surfaces_and_stream
>   * The update type is determined at the very beginning of the function based
>   * on parameters passed in and decides how much programming (or updating) is
> @@ -272,7 +271,6 @@ struct dc;
>  struct dc_plane_state;
>  struct dc_state;
>
> -
>  struct dc_cap_funcs {
>         bool (*get_dcc_compression_cap)(const struct dc *dc,
>                         const struct dc_dcc_surface_param *input,
> @@ -281,7 +279,6 @@ struct dc_cap_funcs {
>
>  struct link_training_settings;
>
> -
>  /* Structure to hold configuration flags set by dm at dc creation. */
>  struct dc_config {
>         bool gpu_vm_support;
> @@ -581,7 +578,6 @@ struct dc_bounding_box_overrides {
>         int min_dcfclk_mhz;
>  };
>
> -struct dc_state;
>  struct resource_pool;
>  struct dce_hwseq;
>  struct gpu_info_soc_bounding_box_v1_0;
> @@ -757,7 +753,6 @@ enum dc_transfer_func_predefined {
>         TRANSFER_FUNCTION_GAMMA26
>  };
>
> -
>  struct dc_transfer_func {
>         struct kref refcount;
>         enum dc_transfer_func_type type;
> @@ -770,7 +765,6 @@ struct dc_transfer_func {
>         };
>  };
>
> -
>  union dc_3dlut_state {
>         struct {
>                 uint32_t initialized:1;         /*if 3dlut is went through color module for initialization */
> @@ -784,7 +778,6 @@ union dc_3dlut_state {
>         uint32_t raw;
>  };
>
> -
>  struct dc_3dlut {
>         struct kref refcount;
>         struct tetrahedral_params lut_3d;
> @@ -1014,7 +1007,6 @@ enum dc_status dc_validate_global_state(
>                 struct dc_state *new_ctx,
>                 bool fast_validate);
>
> -
>  void dc_resource_state_construct(
>                 const struct dc *dc,
>                 struct dc_state *dst_ctx);
> @@ -1167,7 +1159,6 @@ struct dc_container_id {
>         unsigned short productCode;
>  };
>
> -
>  struct dc_sink_dsc_caps {
>         // 'true' if these are virtual DPCD's DSC caps (immediately upstream of sink in MST topology),
>         // 'false' if they are sink's DSC caps
> @@ -1229,7 +1220,6 @@ struct dc_cursor {
>         struct dc_cursor_attributes attributes;
>  };
>
> -
>  /*******************************************************************************
>   * Interrupt interfaces
>   ******************************************************************************/
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
