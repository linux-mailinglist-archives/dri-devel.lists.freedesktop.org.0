Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8593F6ACE44
	for <lists+dri-devel@lfdr.de>; Mon,  6 Mar 2023 20:40:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C1D10E43A;
	Mon,  6 Mar 2023 19:40:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C472010E43A;
 Mon,  6 Mar 2023 19:40:33 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id bi17so7961112oib.3;
 Mon, 06 Mar 2023 11:40:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678131633;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vHIUBTY2u5AopsB38CE9K2a5ev5PDlYW/oMVV00Krx8=;
 b=Sj/n8sYF7PCPUd+xoPtqD1wSRWj6/ZcKsrN1rO953xhSu5S3RrB+y6PrX+vbPF3LCD
 PgZkX2TPBzjiuH2nQfOu0w0po6q1yQtLwrE0ZBiV+PceN/fOuS6tQRfBzcS726vZR03G
 ojXgnEWSgw0IusPhtESGWl6F5GtQhqk7jD6fGP4sYvven0QEieYf26XYIsdnz0tdUC9D
 5u9USWr5cqUD79/2dXcTPSux2QmF0Xw3d42iMYYl0mLrcM+PXWzxcvOuxFEyvJGl/8dv
 +SmwrE5M/DJo9B7ms4r6Wvh5o1irgfGRtmwkvu5tyo1JWIwegAaIAfR/ga+YmV00//Q+
 WuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678131633;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vHIUBTY2u5AopsB38CE9K2a5ev5PDlYW/oMVV00Krx8=;
 b=c+eCBJLUx17H5gYdtnnbrVv2boD/ATeyuipc4ujC4CXFymAr+s0V1EZgnkv/ALiLOz
 wyPRsVBRkU8dEeWA3O5wD8jfjeF++cCs2ORgwoMpRwM/YP5s1M6NxH1hjf/Puj0O2pK9
 OLeRZ1mhah6CrddTL8w7s1N8Oe0JU4Vp63TiOYMQ4G8pfnpROgPtcpYTMkZeBefOWI/z
 Fdq9+JKNah/rrj756PJxUqVO93USsFupepXNZFjag5qkw67WD0dvV51F/WNAPyfVufg3
 OUVXKUwVQqfDJ/NccPGanXUTzOC1WL0sOZ6bxSpONolmQgpTz161kuCf17z2bSB8ASDq
 IKJg==
X-Gm-Message-State: AO0yUKVwJi3gKfxYco54e0RjmIg+LgW9AoN7TP+URXQoDtBtyOy9wspx
 YryAj62Kr9/Mkj9go/Brmk24iJZhEMe6j9FpJUg=
X-Google-Smtp-Source: AK7set9uNVotF5Jq+iMVHYtnefIcJeP/VGZw/wrTLwcIWeeBDm3qoQGPbjIzsh9JvWG2ySXzlbCxfrabvyKoAuPIC8U=
X-Received: by 2002:a54:400e:0:b0:384:2018:571c with SMTP id
 x14-20020a54400e000000b003842018571cmr3774286oie.8.1678131632969; Mon, 06 Mar
 2023 11:40:32 -0800 (PST)
MIME-Version: 1.0
References: <20230304162213.1939515-1-trix@redhat.com>
In-Reply-To: <20230304162213.1939515-1-trix@redhat.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 6 Mar 2023 14:40:21 -0500
Message-ID: <CADnq5_P6hD8o+fHTjy3mRkSV1b6rGQcOkz_7YkNqmOt_zudvTA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: change several dcn20 variables
 storage-class-specifier to static
To: Tom Rix <trix@redhat.com>
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
Cc: wenjing.liu@amd.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, hamza.mahfooz@amd.com, Jun.Lei@amd.com,
 Josip.Pavic@amd.com, jiapeng.chong@linux.alibaba.com, Rodrigo.Siqueira@amd.com,
 javierm@redhat.com, amd-gfx@lists.freedesktop.org, eric.bernstein@amd.com,
 alvin.lee2@amd.com, praful.swarnakar@amd.com, Charlene.Liu@amd.com,
 sunpeng.li@amd.com, Pavle.Kotarac@amd.com, hansen.dsouza@amd.com,
 chiahsuan.chung@amd.com, Xinhui.Pan@amd.com, roman.li@amd.com,
 tzimmermann@suse.de, alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Sat, Mar 4, 2023 at 11:22 AM Tom Rix <trix@redhat.com> wrote:
>
> smatch reports these similar problems in dcn20
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dsc.c:53:24:
>   warning: symbol 'dcn20_dsc_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_dwb.c:304:25:
>   warning: symbol 'dcn20_dwbc_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mmhubbub.c:300:28:
>   warning: symbol 'dcn20_mmhubbub_funcs' was not declared. Should it be static?
> drivers/gpu/drm/amd/amdgpu/../display/dc/dcn20/dcn20_mpc.c:545:24:
>   warning: symbol 'dcn20_mpc_funcs' was not declared. Should it be static?
>
> All of these are only used in their definition file, so they should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c      | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c      | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c | 2 +-
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c      | 2 +-
>  4 files changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
> index 42344aec60d6..5bd698cd6d20 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dsc.c
> @@ -50,7 +50,7 @@ static void dsc2_enable(struct display_stream_compressor *dsc, int opp_pipe);
>  static void dsc2_disable(struct display_stream_compressor *dsc);
>  static void dsc2_disconnect(struct display_stream_compressor *dsc);
>
> -const struct dsc_funcs dcn20_dsc_funcs = {
> +static const struct dsc_funcs dcn20_dsc_funcs = {
>         .dsc_get_enc_caps = dsc2_get_enc_caps,
>         .dsc_read_state = dsc2_read_state,
>         .dsc_validate_stream = dsc2_validate_stream,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c
> index f1490e97b6ce..f8667be57046 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dwb.c
> @@ -301,7 +301,7 @@ void dwb2_set_scaler(struct dwbc *dwbc, struct dc_dwb_params *params)
>
>  }
>
> -const struct dwbc_funcs dcn20_dwbc_funcs = {
> +static const struct dwbc_funcs dcn20_dwbc_funcs = {
>         .get_caps               = dwb2_get_caps,
>         .enable                 = dwb2_enable,
>         .disable                = dwb2_disable,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c
> index ccd91792991b..259a98e4ee2c 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mmhubbub.c
> @@ -297,7 +297,7 @@ void mcifwb2_dump_frame(struct mcif_wb *mcif_wb,
>         dump_info->size         = dest_height * (mcif_params->luma_pitch + mcif_params->chroma_pitch);
>  }
>
> -const struct mcif_wb_funcs dcn20_mmhubbub_funcs = {
> +static const struct mcif_wb_funcs dcn20_mmhubbub_funcs = {
>         .enable_mcif            = mmhubbub2_enable_mcif,
>         .disable_mcif           = mmhubbub2_disable_mcif,
>         .config_mcif_buf        = mmhubbub2_config_mcif_buf,
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
> index 116f67a0b989..5da6e44f284a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_mpc.c
> @@ -542,7 +542,7 @@ static struct mpcc *mpc2_get_mpcc_for_dpp(struct mpc_tree *tree, int dpp_id)
>         return NULL;
>  }
>
> -const struct mpc_funcs dcn20_mpc_funcs = {
> +static const struct mpc_funcs dcn20_mpc_funcs = {
>         .read_mpcc_state = mpc1_read_mpcc_state,
>         .insert_plane = mpc1_insert_plane,
>         .remove_mpcc = mpc1_remove_mpcc,
> --
> 2.27.0
>
