Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F5D36833D4
	for <lists+dri-devel@lfdr.de>; Tue, 31 Jan 2023 18:26:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F83610E2A2;
	Tue, 31 Jan 2023 17:26:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com
 [IPv6:2001:4860:4864:20::36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79C4210E2A2;
 Tue, 31 Jan 2023 17:26:12 +0000 (UTC)
Received: by mail-oa1-x36.google.com with SMTP id
 586e51a60fabf-15f97c478a8so20208960fac.13; 
 Tue, 31 Jan 2023 09:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=19XlM6vQlrRG/tAO+RG0hvy7NP8GgPSV7Vc5xXhEV9g=;
 b=WlVQJ/K8loZAXH45yqntKGX0H/5aW1suoUWAzz33YUNuwsZRRwllZNwYXs2QZshQ3f
 AZQTD+yNnnWgH2VnsR1nMYh4UnNKBDNHu5sfN8lw5xb4W0uZzfRPki+cLEReYAxEgXc+
 UsG0Q0TrdKq/9I33XqT0p5mp9rtjHY0Ky4dO6pN/2GT2xoDKmqwJnmj5kj7OWaYVbAP1
 PTmOjlJ9O2NsIBv1JGDzMYZvY5oPACEEjHg89q+EKGn1ju4I5AdcmQQWJdGBA4h7gpcs
 ky0B4uIyDjbujarXub9m8nlSck+AFK13sgE798asnD8nnfDYl9kHYvq2StJHNVAxAFVQ
 3SqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=19XlM6vQlrRG/tAO+RG0hvy7NP8GgPSV7Vc5xXhEV9g=;
 b=oGtrudCU4Cz3AKXdf4YTgqfkhHlyQIhidQ5S6EHznCL701Fmmlq9GYkdhI1ped57Av
 SMC068MiND6DHs+3jA+xll751ADGcbPVQSI8PPlDNfmVyP/kjs7YNTA1kaE4cBYDkyjn
 rMTrjpCHPQGX0TSCz739vVpNxekd70hqltX/IDf3QLPiHh5iKRMwrGgIz1UN4pUZcrNz
 esQmu74tJj+aJsBk9tTsK6+nrdWJDXYBj5V+LkPoRGgGtqpggHfblER6eJiNePq4jHyI
 RVF0MmuA6CwADV+uCt1LlksADqsAYZhbs5OqccxcQPacFtDvMctsxghrgP68FcZCYLi9
 zO6w==
X-Gm-Message-State: AO0yUKUEDEVWz6CoOAl/sVuZfBYo91X8kpG6uqjg6WChh1clWQX9Ldut
 ajsT1DotxwY/Elxga5U0DslqWh/CiOs0HarHv1U=
X-Google-Smtp-Source: AK7set8JFgznhBzrsVyvK5RG+2JrP4SehOv2Igw4EY1huJelCOaC//bda/AzEdvN+H9EmpQxjFRWouMcU/OE3UXHAhY=
X-Received: by 2002:a05:6870:580e:b0:163:a303:fe2f with SMTP id
 r14-20020a056870580e00b00163a303fe2fmr967125oap.96.1675185971638; Tue, 31 Jan
 2023 09:26:11 -0800 (PST)
MIME-Version: 1.0
References: <20230130195607.1297694-1-gpiccoli@igalia.com>
 <ffbb892d-e374-d706-ebb6-f8367f300c7b@amd.com>
In-Reply-To: <ffbb892d-e374-d706-ebb6-f8367f300c7b@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 31 Jan 2023 12:25:59 -0500
Message-ID: <CADnq5_N+dSp19FQcYn0ZXfo2CgMmZM+YFMNd-+74jEZskRLdaA@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Trivial swizzle-related code clean-ups
To: Harry Wentland <harry.wentland@amd.com>
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
Cc: Xinhui.Pan@amd.com, Aurabindo Pillai <aurabindo.pillai@amd.com>,
 Swapnil Patel <Swapnil.Patel@amd.com>, Leo Li <sunpeng.li@amd.com>,
 kernel@gpiccoli.net, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Daniel Wheeler <daniel.wheeler@amd.com>, amd-gfx@lists.freedesktop.org,
 Melissa Wen <mwen@igalia.com>, "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Fangzhi Zuo <Jerry.Zuo@amd.com>, Mark Broadworth <mark.broadworth@amd.com>,
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 alexander.deucher@amd.com, christian.koenig@amd.com,
 Sung Joon Kim <Sungjoon.Kim@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Tue, Jan 31, 2023 at 9:40 AM Harry Wentland <harry.wentland@amd.com> wrote:
>
> On 1/30/23 14:56, Guilherme G. Piccoli wrote:
> > This is a very trivial code clean-up related to commit 5468c36d6285
> > ("drm/amd/display: Filter Invalid 420 Modes for HDMI TMDS"). This commit
> > added a validation on driver probe to prevent invalid TMDS modes, but one
> > of the fake properties (swizzle) ended-up causing a warning on driver
> > probe; was reported here: https://gitlab.freedesktop.org/drm/amd/-/issues/2264.
> >
> > It was fixed by commit 105a8b8698e2 ("drm/amd/display: patch cases with
> > unknown plane state to prevent warning"), but the validation code had
> > a double variable assignment, which we hereby remove. Also, the fix relies
> > in the dcn2{0,1}patch_unknown_plane_state() callbacks, so while at it we
> > took the opportunity to perform a small code clean-up in such routines.
> >
> > Cc: Aurabindo Pillai <aurabindo.pillai@amd.com>
> > Cc: Daniel Wheeler <daniel.wheeler@amd.com>
> > Cc: Fangzhi Zuo <Jerry.Zuo@amd.com>
> > Cc: Harry Wentland <harry.wentland@amd.com>
> > Cc: Leo Li <sunpeng.li@amd.com>
> > Cc: Mark Broadworth <mark.broadworth@amd.com>
> > Cc: Melissa Wen <mwen@igalia.com>
> > Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> > Cc: Sung Joon Kim <Sungjoon.Kim@amd.com>
> > Cc: Swapnil Patel <Swapnil.Patel@amd.com>
> > Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
>
> Reviewed-by: Harry Wentland <harry.wentland@amd.com>
>
> Harry
>
> > ---
> >  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c     | 1 -
> >  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c | 8 ++------
> >  drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c | 6 ++----
> >  3 files changed, 4 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > index 86a2f7f58550..e71e94663d14 100644
> > --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> > @@ -6336,7 +6336,6 @@ static enum dc_status dm_validate_stream_and_context(struct dc *dc,
> >       dc_plane_state->plane_size.surface_size.width  = stream->src.width;
> >       dc_plane_state->plane_size.chroma_size.height  = stream->src.height;
> >       dc_plane_state->plane_size.chroma_size.width   = stream->src.width;
> > -     dc_plane_state->tiling_info.gfx9.swizzle =  DC_SW_UNKNOWN;
> >       dc_plane_state->format = SURFACE_PIXEL_FORMAT_GRPH_ARGB8888;
> >       dc_plane_state->tiling_info.gfx9.swizzle = DC_SW_UNKNOWN;
> >       dc_plane_state->rotation = ROTATION_ANGLE_0;
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > index 531f405d2554..3af24ef9cb2d 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_resource.c
> > @@ -2225,14 +2225,10 @@ enum dc_status dcn20_patch_unknown_plane_state(struct dc_plane_state *plane_stat
> >       enum surface_pixel_format surf_pix_format = plane_state->format;
> >       unsigned int bpp = resource_pixel_format_to_bpp(surf_pix_format);
> >
> > -     enum swizzle_mode_values swizzle = DC_SW_LINEAR;
> > -
> > +     plane_state->tiling_info.gfx9.swizzle = DC_SW_64KB_S;
> >       if (bpp == 64)
> > -             swizzle = DC_SW_64KB_D;
> > -     else
> > -             swizzle = DC_SW_64KB_S;
> > +             plane_state->tiling_info.gfx9.swizzle = DC_SW_64KB_D;
> >
> > -     plane_state->tiling_info.gfx9.swizzle = swizzle;
> >       return DC_OK;
> >  }
> >
> > diff --git a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> > index fbcf0afeae0d..8f9244fe5c86 100644
> > --- a/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> > +++ b/drivers/gpu/drm/amd/display/dc/dcn21/dcn21_resource.c
> > @@ -1393,15 +1393,13 @@ static uint32_t read_pipe_fuses(struct dc_context *ctx)
> >
> >  static enum dc_status dcn21_patch_unknown_plane_state(struct dc_plane_state *plane_state)
> >  {
> > -     enum dc_status result = DC_OK;
> > -
> >       if (plane_state->ctx->dc->debug.disable_dcc == DCC_ENABLE) {
> >               plane_state->dcc.enable = 1;
> >               /* align to our worst case block width */
> >               plane_state->dcc.meta_pitch = ((plane_state->src_rect.width + 1023) / 1024) * 1024;
> >       }
> > -     result = dcn20_patch_unknown_plane_state(plane_state);
> > -     return result;
> > +
> > +     return dcn20_patch_unknown_plane_state(plane_state);
> >  }
> >
> >  static const struct resource_funcs dcn21_res_pool_funcs = {
>
