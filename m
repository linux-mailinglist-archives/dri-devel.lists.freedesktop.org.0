Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4752A37991F
	for <lists+dri-devel@lfdr.de>; Mon, 10 May 2021 23:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC9056E8FA;
	Mon, 10 May 2021 21:25:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 500C36E8FA;
 Mon, 10 May 2021 21:25:32 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 g15-20020a9d128f0000b02902a7d7a7bb6eso15738764otg.9; 
 Mon, 10 May 2021 14:25:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PmIcFjCOLdEWcB0iasc1r1ubIgYBVj/xcDy7SSueH0M=;
 b=pHhFn9RWth0M5tN+ctGmZzX+k/1Q2B1Pu630myzcOTEXqLk9Yj/IKO+KpcJCHtKmb0
 H58+TpSMtJ9PjYdnnp8lnnsWpzcQNRcLXSTni1wWs0AXOxgTAYHUgkBMQq1d/UBokXfP
 HciGLMDgGUZ1beYLvw4ZSD7eNAUNu51g2A3gl4LllI05hevLqG9/PU7cIt945Wqjc+Su
 c9WB/TBWsuZk+gjQoW25W7BbHXCjNSrnTvntAURO/b8e+jZiCkZcaopt9yK8qO4KsgC9
 DGQMy68JVt6khLR/vql0yUQEL97ilNxsGhX3WC206yyatTeC8Gr1NBeMELbITO4TyEpB
 WDWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PmIcFjCOLdEWcB0iasc1r1ubIgYBVj/xcDy7SSueH0M=;
 b=LdFqSn7u1aFSIlXA00RPl50c37ZaMbvE4mWxoaabTdGzSmCcrXNlXl76nsw67NO3Ep
 6I2qTxHjV2I73pdbs/zJ6EzGjkw0Ubt8vgfksZxaJWJKc/2epXkTGtJ9kd0d/rin3z8M
 xPJRYM/GBAioL0IGB91bkXAWa7KqVxNIs4dk7vP2tHLVo77EZzOOG3EmrAs9PzO56uAO
 f+38irHkHicO766Q/xnLTw4bYfjLpFwIdV3JDcxV6ZWiuKeDrgBU0rnCBETkcBAWDNYA
 dx7VoUTvQrT01wMVA1PQL9oSSXUcpOtUZiQtIv2LohGKwYiZW6AsKeelf5fsOlOj2W0t
 ktGw==
X-Gm-Message-State: AOAM531BYL4VXoGMxdIL45s9bQMbC91LqVSMltobhFuzNEvhdW9LGiDo
 9yTXGmaP64p7LNmegIZLp1r80vJ+zVqZ0gvoGR0=
X-Google-Smtp-Source: ABdhPJxLh/YcUfrssoXBAmdBXcPhLwzuFm9s4MQHVRdQJV8NLTCEviSvSgMJB5TSC6Pq8HNBYnnshUWtY3PkXnqLixU=
X-Received: by 2002:a9d:57cd:: with SMTP id q13mr20725900oti.23.1620681931714; 
 Mon, 10 May 2021 14:25:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210510121621.3692-1-thunder.leizhen@huawei.com>
In-Reply-To: <20210510121621.3692-1-thunder.leizhen@huawei.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 10 May 2021 17:25:20 -0400
Message-ID: <CADnq5_PWW+rHBDjtC-NX6M9WtnZr9L9fCfHSaazFwhQ8aXQiwg@mail.gmail.com>
Subject: Re: [PATCH 1/1] drm/amd/display: Delete several unneeded bool
 conversions
To: Zhen Lei <thunder.leizhen@huawei.com>
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
Cc: Leo Li <sunpeng.li@amd.com>, amd-gfx <amd-gfx@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied.  Thanks!

Alex

On Mon, May 10, 2021 at 8:16 AM Zhen Lei <thunder.leizhen@huawei.com> wrote:
>
> The result of an expression consisting of a single relational operator is
> already of the bool type and does not need to be evaluated explicitly.
>
> No functional change.
>
> Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
> ---
>  drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c | 4 ++--
>  drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
> index 8dc3d1f7398422e..2feb051a200294a 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn20/dcn20_dpp_cm.c
> @@ -482,7 +482,7 @@ bool dpp20_program_blnd_lut(
>                 next_mode = LUT_RAM_A;
>
>         dpp20_power_on_blnd_lut(dpp_base, true);
> -       dpp20_configure_blnd_lut(dpp_base, next_mode == LUT_RAM_A ? true:false);
> +       dpp20_configure_blnd_lut(dpp_base, next_mode == LUT_RAM_A);
>
>         if (next_mode == LUT_RAM_A)
>                 dpp20_program_blnd_luta_settings(dpp_base, params);
> @@ -893,7 +893,7 @@ bool dpp20_program_shaper(
>         else
>                 next_mode = LUT_RAM_A;
>
> -       dpp20_configure_shaper_lut(dpp_base, next_mode == LUT_RAM_A ? true:false);
> +       dpp20_configure_shaper_lut(dpp_base, next_mode == LUT_RAM_A);
>
>         if (next_mode == LUT_RAM_A)
>                 dpp20_program_shaper_luta_settings(dpp_base, params);
> diff --git a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> index 910c17fd4278932..950c9bfd53de516 100644
> --- a/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> +++ b/drivers/gpu/drm/amd/display/dc/dcn30/dcn30_mpc.c
> @@ -874,7 +874,7 @@ bool mpc3_program_shaper(
>         else
>                 next_mode = LUT_RAM_A;
>
> -       mpc3_configure_shaper_lut(mpc, next_mode == LUT_RAM_A ? true:false, rmu_idx);
> +       mpc3_configure_shaper_lut(mpc, next_mode == LUT_RAM_A, rmu_idx);
>
>         if (next_mode == LUT_RAM_A)
>                 mpc3_program_shaper_luta_settings(mpc, params, rmu_idx);
> --
> 2.26.0.106.g9fadedd
>
>
