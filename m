Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 036A93DB10D
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 04:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC39C6F399;
	Fri, 30 Jul 2021 02:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com
 [IPv6:2607:f8b0:4864:20::c2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C7116F393;
 Fri, 30 Jul 2021 02:16:34 +0000 (UTC)
Received: by mail-oo1-xc2d.google.com with SMTP id
 o17-20020a4a64110000b0290263e1ba7ff9so2079349ooc.2; 
 Thu, 29 Jul 2021 19:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r3u8PQUkpqyAfITTKMU/qJ2G/2EJpG3EEGinj//3Afs=;
 b=tg5rQwQiK8zzkJUED/kD6JpYtTsT9SrvcD6xRdoa2757QjF63ev5y2N+XJ5qlgG8+p
 sss83n+F15YNmV2diB4LthkheWIIBOZvIC1NdxYNcjMRle0GPT3vL1TkzVdNwR8lG6i6
 wYafo0prBA65/w4zZ9kSL8AsExt6QgoD98oMveQEmyy9tDKB3eqoqyanp+E5Wc6QHYO9
 t8+VPFeg+r/hnUKvsZJg/X2MQWwGZvbYrMG68PNegaxsj0gAcnHF1lRoU3L6jcTXdzfz
 BZh8hM6PNr1yENv+3cYBG/Myap5cAakangVQGzCx3ZCW1GYiyItqT/7SAy+9TQecE35Z
 H1bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r3u8PQUkpqyAfITTKMU/qJ2G/2EJpG3EEGinj//3Afs=;
 b=CdbZ978SmxK+VZy2P1ckXpW91ug21u4cMUw//fUSwl/XoCQpZ//qvpZdYQmWue4yIm
 LyguiuEJPoFH5zqSe6sxy9E3tvIm5XThrK2i9aKj6mj/piOk1ZWFH1TztF22osWh4djb
 Pxvh/7kno7Pm/xQf0l18SJmSROkmv35rA3O4g7bs8UqX7mwXFFsrYW0XbBKELjMeTB4A
 FPtug6XG34xyCD25Q51WUfl8DEH0UvuvNfJIN+8vmSnCBWqZLq91KGZnLdPRn/hAMJdv
 qstX3MEXGfgiBMKbH38aKJtJ+xbzpSxmcBueumFzM/p1NY5EyB62BtEJxmq22XDl7RzJ
 EqwQ==
X-Gm-Message-State: AOAM530Cs47dlQ7vsCBgHjSHfQ+zU6tGkj4WhAaibvRQ4ZjIhokVW0Bj
 pM8lgVMHzeEm1Iekp1e2NgJJZeNMbLwu5FaEssU=
X-Google-Smtp-Source: ABdhPJzjHgsc3QEyOEGHs5oyuvmj8Levmp/MtXMPdKgDbjYeEbKZJ0MB0pdXtf1m2Eupyo6303rtDbWAE1q8yZWJznM=
X-Received: by 2002:a4a:e3cb:: with SMTP id m11mr149850oov.72.1627611393386;
 Thu, 29 Jul 2021 19:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210729081814.1738-1-caihuoqing@baidu.com>
In-Reply-To: <20210729081814.1738-1-caihuoqing@baidu.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Thu, 29 Jul 2021 22:16:22 -0400
Message-ID: <CADnq5_Np+uyy2EHvXaGiv_AFiTZ=2WtwbAuFYz6hoVzz5JAkXA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix typo in comments
To: Cai Huoqing <caihuoqing@baidu.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jul 29, 2021 at 4:18 AM Cai Huoqing <caihuoqing@baidu.com> wrote:
>
> Remove the repeated word 'the' from comments
>
> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>

Applied.  Thanks!

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc_resource.c             | 2 +-
>  .../gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c | 2 +-
>  .../drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c   | 2 +-
>  .../gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c | 2 +-
>  .../gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c | 2 +-
>  .../gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c | 4 ++--
>  7 files changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> index 1596f6b7fed7..7f12ca902f7d 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc_resource.c
> @@ -1030,7 +1030,7 @@ bool resource_build_scaling_params(struct pipe_ctx *pipe_ctx)
>
>         /* Timing borders are part of vactive that we are also supposed to skip in addition
>          * to any stream dst offset. Since dm logic assumes dst is in addressable
> -        * space we need to add the the left and top borders to dst offsets temporarily.
> +        * space we need to add the left and top borders to dst offsets temporarily.
>          * TODO: fix in DM, stream dst is supposed to be in vactive
>          */
>         pipe_ctx->stream->dst.x += timing->h_border_left;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
> index 799bae229e67..2091dd8c252d 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20.c
> @@ -488,7 +488,7 @@ static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
>         log2_meta_req_bytes = 6; // meta request is 64b and is 8x8byte meta element
>
>         // each 64b meta request for dcn is 8x8 meta elements and
> -       // a meta element covers one 256b block of the the data surface.
> +       // a meta element covers one 256b block of the data surface.
>         log2_meta_req_height = log2_blk256_height + 3; // meta req is 8x8 byte, each byte represent 1 blk256
>         log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element
>                         - log2_meta_req_height;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
> index 6a6d5970d1d5..1a0c14e465fa 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn20/display_rq_dlg_calc_20v2.c
> @@ -488,7 +488,7 @@ static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
>         log2_meta_req_bytes = 6; // meta request is 64b and is 8x8byte meta element
>
>         // each 64b meta request for dcn is 8x8 meta elements and
> -       // a meta element covers one 256b block of the the data surface.
> +       // a meta element covers one 256b block of the data surface.
>         log2_meta_req_height = log2_blk256_height + 3; // meta req is 8x8 byte, each byte represent 1 blk256
>         log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element
>                         - log2_meta_req_height;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
> index dc1c81a6e377..287e31052b30 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn21/display_rq_dlg_calc_21.c
> @@ -482,7 +482,7 @@ static void get_meta_and_pte_attr(
>         log2_meta_req_bytes = 6; // meta request is 64b and is 8x8byte meta element
>
>         // each 64b meta request for dcn is 8x8 meta elements and
> -       // a meta element covers one 256b block of the the data surface.
> +       // a meta element covers one 256b block of the data surface.
>         log2_meta_req_height = log2_blk256_height + 3; // meta req is 8x8 byte, each byte represent 1 blk256
>         log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element
>                         - log2_meta_req_height;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
> index 04601a767a8f..0d934fae1c3a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn30/display_rq_dlg_calc_30.c
> @@ -549,7 +549,7 @@ static void get_meta_and_pte_attr(struct display_mode_lib *mode_lib,
>         log2_meta_req_bytes = 6; // meta request is 64b and is 8x8byte meta element
>
>                                  // each 64b meta request for dcn is 8x8 meta elements and
> -                                // a meta element covers one 256b block of the the data surface.
> +                                // a meta element covers one 256b block of the data surface.
>         log2_meta_req_height = log2_blk256_height + 3; // meta req is 8x8 byte, each byte represent 1 blk256
>         log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element
>                 - log2_meta_req_height;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> index 3def093ef88e..c23905bc733a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dcn31/display_rq_dlg_calc_31.c
> @@ -563,7 +563,7 @@ static void get_meta_and_pte_attr(
>         log2_meta_req_bytes = 6;        // meta request is 64b and is 8x8byte meta element
>
>         // each 64b meta request for dcn is 8x8 meta elements and
> -       // a meta element covers one 256b block of the the data surface.
> +       // a meta element covers one 256b block of the data surface.
>         log2_meta_req_height = log2_blk256_height + 3;  // meta req is 8x8 byte, each byte represent 1 blk256
>         log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element - log2_meta_req_height;
>         meta_req_width = 1 << log2_meta_req_width;
> diff --git a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
> index 414da64f5734..8f2b1684c231 100644
> --- a/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dml/dml1_display_rq_dlg_calc.c
> @@ -456,7 +456,7 @@ static void dml1_rq_dlg_get_row_heights(
>         log2_meta_req_bytes = 6; /* meta request is 64b and is 8x8byte meta element */
>
>         /* each 64b meta request for dcn is 8x8 meta elements and
> -        * a meta element covers one 256b block of the the data surface.
> +        * a meta element covers one 256b block of the data surface.
>          */
>         log2_meta_req_height = log2_blk256_height + 3; /* meta req is 8x8 */
>         log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element
> @@ -718,7 +718,7 @@ static void get_surf_rq_param(
>         log2_meta_req_bytes = 6; /* meta request is 64b and is 8x8byte meta element */
>
>         /* each 64b meta request for dcn is 8x8 meta elements and
> -        * a meta element covers one 256b block of the the data surface.
> +        * a meta element covers one 256b block of the data surface.
>          */
>         log2_meta_req_height = log2_blk256_height + 3; /* meta req is 8x8 byte, each byte represent 1 blk256 */
>         log2_meta_req_width = log2_meta_req_bytes + 8 - log2_bytes_per_element
> --
> 2.25.1
>
