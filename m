Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C896B567266
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 17:22:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C25B48BEDC;
	Tue,  5 Jul 2022 15:22:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C7BE8BECC;
 Tue,  5 Jul 2022 15:22:21 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id u12so22199375eja.8;
 Tue, 05 Jul 2022 08:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=e3kw5vLPMONRD7S5nAa5Acr9enRSFx2J1QfhaJiVIgE=;
 b=TIROAxwTY1iB5sL609Gl6MrUwmy3R8AXy0J1bpxcm9zICOP9DFZSzru39IUqURPuEK
 iTt90s3LIu9Xgk0P/KBSwYjx4cBdABieWvDEvSRK/u6OjlV8VHVvP+m8a1NxFluaZsrQ
 zXK4PS71s/Oc/OxkLMDh10TSMt3XGjw89fe9q85QNxdNW5OusF7mEU16kWjfoVEuPNTF
 LxIZA0e1sBao40mVDNpfLaQEXB9gduQJ5BduLdZavTm18whHvQ6Ht0O7KVJ5mjRVRL7C
 E1zSuyZ0S0YzPd/bx0IVszHwNLycOcZVwjEoOZfZl47tNYdJ0BhChaOy5K+ENK/byQsx
 Z9zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=e3kw5vLPMONRD7S5nAa5Acr9enRSFx2J1QfhaJiVIgE=;
 b=aPuCNPp7eTpC1erx7tfghkhiQtaVZi6xqeioM4tGiPIkSkGm+ZgmdO7hl+hEtYOHPZ
 T+i/m9O4IqbeyqJiCRjfdCf1OKgvCSWQiwqa4rRHqTlrfcADI/DPU+HhUHLCAlAuS8C5
 cOBWYI5fY9oBjgOznlqVjrocTkDPoIn6C6rXrDy1+MW98qmn/w7GgXTh0BmC7lJ1ywae
 PMI8bUjhQMlO6T1xet5j34vJN5ep87GoLZZ/2Gjdn1J2cfagUsI4fOCmUUkNdjMwvyUy
 p0Ukj5LvG1Xm2B/M/u3bPxSk4BXG+DPl+CMQ+2prsLqUy/vMdz/1RCkNJV/88sBFpUjo
 sq3g==
X-Gm-Message-State: AJIora/ZeDe+5TVuHhInn65zknv6+2gqZf84PM/d/pIBfm1tdBHaoBTo
 xf3GxbERhiA89mA/r0wvjNYHIFZkqXL17DsOjJqitqW4
X-Google-Smtp-Source: AGRyM1v4gB0anp60LYGJSv3NCpT4PwXU9pjtzc5CtQCfQqYHslGRV+JPypMsQXcndoEZi7DwxQ830AffeKk8osvxygM=
X-Received: by 2002:a17:907:2706:b0:72a:3216:96bd with SMTP id
 w6-20020a170907270600b0072a321696bdmr33656915ejk.658.1657034539799; Tue, 05
 Jul 2022 08:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220701091914.66476-1-yang.lee@linux.alibaba.com>
In-Reply-To: <20220701091914.66476-1-yang.lee@linux.alibaba.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 5 Jul 2022 11:22:06 -0400
Message-ID: <CADnq5_PXiddTKAPs_0H83sOcr1UqxSkcA9E=gNAZsm4izXE=Bw@mail.gmail.com>
Subject: Re: [PATCH -next] drm/amd/display: clean up some inconsistent
 indenting
To: Yang Li <yang.lee@linux.alibaba.com>
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
Cc: "Leo \(Sunpeng\) Li" <sunpeng.li@amd.com>, xinhui pan <Xinhui.Pan@amd.com>,
 "Siqueira, Rodrigo" <Rodrigo.Siqueira@amd.com>,
 LKML <linux-kernel@vger.kernel.org>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>, Dave Airlie <airlied@linux.ie>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>, "Deucher,
 Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Fri, Jul 1, 2022 at 5:24 AM Yang Li <yang.lee@linux.alibaba.com> wrote:
>
> Eliminate the follow smatch warning:
> drivers/gpu/drm/amd/amdgpu/../display/dc/core/dc.c:3151 commit_planes_for_stream() warn: inconsistent indenting
>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 146fd4b864b2..d31da9c0256a 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -3148,15 +3148,15 @@ static void commit_planes_for_stream(struct dc *dc,
>                 else
>                         dc->hwss.pipe_control_lock(dc, top_pipe_to_program, false);
>
> -       if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
> -               if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
> -                       top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
> +               if ((update_type != UPDATE_TYPE_FAST) && stream->update_flags.bits.dsc_changed)
> +                       if (top_pipe_to_program->stream_res.tg->funcs->lock_doublebuffer_enable) {
> +                               top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
>                                         top_pipe_to_program->stream_res.tg,
>                                         CRTC_STATE_VACTIVE);
> -                       top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
> +                               top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
>                                         top_pipe_to_program->stream_res.tg,
>                                         CRTC_STATE_VBLANK);
> -                       top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
> +                               top_pipe_to_program->stream_res.tg->funcs->wait_for_state(
>                                         top_pipe_to_program->stream_res.tg,
>                                         CRTC_STATE_VACTIVE);
>
> --
> 2.20.1.7.g153144c
>
