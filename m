Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AD02E9BDB
	for <lists+dri-devel@lfdr.de>; Mon,  4 Jan 2021 18:19:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEC6C6E040;
	Mon,  4 Jan 2021 17:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [IPv6:2607:f8b0:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86F0D6E02F;
 Mon,  4 Jan 2021 17:19:36 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id d20so26728087otl.3;
 Mon, 04 Jan 2021 09:19:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=eUFGsNqtupRESQ2qco7sAkbPRghZqYBxJ2SVYT46+bk=;
 b=uBQwp3+VllAF1kOh/5rXIJHFB8MmRRuuCEpIrWx9HGeV41X0hMXMnXLgttvnLYDX+o
 raoeSNXlefBa3X4tBR4K+zgmy8RQjBkHKEDFSeNa+V1IZ9J7SogX+45JfNoEgyrru+zA
 VtbTdRaBw8e39771nlD0ZMrZGfXQlOVZ4KjdkU66AcT347pRLBV1IhoXSoH2YRiqsgMQ
 umE7Yw7xiuY7s3z54j6jwNPRj/zFuC0q5SlDNh5c3o3H3scZjAJSLX4SrHNH1tACk3Uw
 T01EexboAraIOkXMo5tNmXHhEgFx/hepEdkX/n7cvsKvSnep9Xxs93Ln0w7azyAgui2B
 n8sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=eUFGsNqtupRESQ2qco7sAkbPRghZqYBxJ2SVYT46+bk=;
 b=gm8VJSVJ2glcv9DeBpWo25cLEv9yz5Q6k03CSevH6thlteuwNpw03l8RfvzPZMB5eT
 PnooImExdQnYAMUBmFqHnf4houiSWNbvIa3/Uec9+TpW/wLeN1sqOnpK80qt6WOx7ftS
 +HYGPkvaoFT7+v9VVI20crMo3Y+T4vPAXYe56lhbv7xU4l2gSLo+dSp7JbNBxlLGHTwU
 KtXEf86k9MfajSRslLQ2E34BH2L50q2zrehVmyJGJ8lZUTdpljTW77Qc77Ty0sLkd1Bj
 K168x9SddBNzFbQu3OhPilrik9tQXQIPiwUvJj05yQsW5GxXq3PvWfl4J/+YRscPvBr0
 DCWw==
X-Gm-Message-State: AOAM532IBtsh0wRNFBbeeEDn4R+Jh6tqkIm/1O1DYix5laqv8yNWnEup
 UUnVCSGB3+CDxthheCI3nNPV4yKoHR8RdrqLKy4=
X-Google-Smtp-Source: ABdhPJzZelHdcFp2irRqSdV6JoidaETHC2vMKKmSRgl6LnZDu6WAE4/IQk8lu7LjmvJ5t+nRF8VVa1eJTVm7s+1Rgx8=
X-Received: by 2002:a05:6830:1b7b:: with SMTP id
 d27mr54874901ote.132.1609780775907; 
 Mon, 04 Jan 2021 09:19:35 -0800 (PST)
MIME-Version: 1.0
References: <1609210547-16776-1-git-send-email-tiantao6@hisilicon.com>
In-Reply-To: <1609210547-16776-1-git-send-email-tiantao6@hisilicon.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 4 Jan 2021 12:19:25 -0500
Message-ID: <CADnq5_OarN0dN7A=6fStpv44OTba1hYUP6_C=yvrGFPgbKHH8g@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: fix comparison pointer to bool warning
 in dc.c
To: Tian Tao <tiantao6@hisilicon.com>
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
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Dave Airlie <airlied@linux.ie>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 "Deucher, Alexander" <alexander.deucher@amd.com>,
 Christian Koenig <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 29, 2020 at 4:42 AM Tian Tao <tiantao6@hisilicon.com> wrote:
>
> Fixes coccicheck warning:
> drivers/gpu/drm/amd/display/dc/core/dc.c:1543:12-19: WARNING: Comparison
> to bool
> drivers/gpu/drm/amd/display/dc/core/dc.c:1496:14-42: WARNING: Comparison
> to bool
> drivers/gpu/drm/amd/display/dc/core/dc.c:971:15-48: WARNING: Comparison
> to bool
> drivers/gpu/drm/amd/display/dc/core/dc.c:976:15-44: WARNING: Comparison
> to bool
>
> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>

Applied.  Thanks!

Alex

> ---
>  drivers/gpu/drm/amd/display/dc/core/dc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/core/dc.c b/drivers/gpu/drm/amd/display/dc/core/dc.c
> index 58eb0d6..ea28b75 100644
> --- a/drivers/gpu/drm/amd/display/dc/core/dc.c
> +++ b/drivers/gpu/drm/amd/display/dc/core/dc.c
> @@ -968,12 +968,12 @@ struct dc *dc_create(const struct dc_init_data *init_params)
>                 goto alloc_fail;
>
>         if (init_params->dce_environment == DCE_ENV_VIRTUAL_HW) {
> -               if (false == dc_construct_ctx(dc, init_params)) {
> +               if (!dc_construct_ctx(dc, init_params)) {
>                         dc_destruct(dc);
>                         goto construct_fail;
>                 }
>         } else {
> -               if (false == dc_construct(dc, init_params)) {
> +               if (!dc_construct(dc, init_params)) {
>                         dc_destruct(dc);
>                         goto construct_fail;
>                 }
> @@ -1493,7 +1493,7 @@ bool dc_commit_state(struct dc *dc, struct dc_state *context)
>         enum dc_status result = DC_ERROR_UNEXPECTED;
>         int i;
>
> -       if (false == context_changed(dc, context))
> +       if (!context_changed(dc, context))
>                 return DC_OK;
>
>         DC_LOG_DC("%s: %d streams\n",
> @@ -1540,7 +1540,7 @@ bool dc_acquire_release_mpc_3dlut(
>                 if (found_pipe_idx) {
>                         if (acquire && pool->funcs->acquire_post_bldn_3dlut)
>                                 ret = pool->funcs->acquire_post_bldn_3dlut(res_ctx, pool, mpcc_id, lut, shaper);
> -                       else if (acquire == false && pool->funcs->release_post_bldn_3dlut)
> +                       else if (!acquire && pool->funcs->release_post_bldn_3dlut)
>                                 ret = pool->funcs->release_post_bldn_3dlut(res_ctx, pool, lut, shaper);
>                 }
>         }
> --
> 2.7.4
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
