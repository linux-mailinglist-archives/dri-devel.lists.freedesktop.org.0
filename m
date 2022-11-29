Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BD2563B6EC
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 02:14:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74E9F898A4;
	Tue, 29 Nov 2022 01:14:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CE28984C
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 01:14:09 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id fy37so30159399ejc.11
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 17:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DGaZ8OVtGKgX/mLPb9bYbnNCU4GtJ5ZaE5Va30mZJao=;
 b=ELTV3dgIgDmcf8n+nhp3+EKzarX3RK5zG2X2Wj1L32uLqyj40nfyvEwXi1rdM+K6N5
 2hubboKg8Rv6AiOgSqoaKJ/blr/UIDCSePyTPKtMKEKulQKmEfLPTI8ocUkX+jqDNkGm
 4AE88T0j+84vh8oSq1xNrZK2YtsYqNB1E5H6k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DGaZ8OVtGKgX/mLPb9bYbnNCU4GtJ5ZaE5Va30mZJao=;
 b=doENmo+xwPBYA0r1tBpxWMW1Vu+sg8m8lKwVnbDTmD1aLj3CbfhIvvZSqRtVHSJLIq
 rHWunD0nj5Bs6sComla3DFWUr0JsR2KKexgUCVPoEKfzFDTC7QGdDwF54RbqDM7rZ32g
 eD+rWCO4ALhVt4nLESYjv6JTzzMihfhwWKWxb+fBa9cKOGh8PWBW23WMjIQaE1lFyRiO
 xWhXF8IMq0RtN940ixPkOREzFk93DKMwNHLeuMigUzm3ZjoCWhU5sqgKx/od6PZuSIkZ
 anJymMSvMg1WAwYd3n8KCOLcl6BcExeXTFZT4XQCLhFOfJ23N+PML1jjXBZh052u6jJT
 PxtA==
X-Gm-Message-State: ANoB5plr9pl0uKojjy5ltdbgvDZ3dkfa6opD8Q4jxQy97joRKmaYQJqh
 9wgoBPagl3pcmHrUEHhyei5zjrXpoeTLqwEJ
X-Google-Smtp-Source: AA0mqf6ThZtHt7F4P2hFbEuuvcpvxjo5KR16mPOHJ9RhyvP6dxnVLZDWd+TYhwyNYt9driumaGRJxw==
X-Received: by 2002:a17:906:810:b0:7ba:5b85:994f with SMTP id
 e16-20020a170906081000b007ba5b85994fmr23078474ejd.510.1669684446178; 
 Mon, 28 Nov 2022 17:14:06 -0800 (PST)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com.
 [209.85.221.53]) by smtp.gmail.com with ESMTPSA id
 d2-20020a1709063ce200b0077f324979absm5517014ejh.67.2022.11.28.17.14.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Nov 2022 17:14:03 -0800 (PST)
Received: by mail-wr1-f53.google.com with SMTP id d1so19768125wrs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Nov 2022 17:14:02 -0800 (PST)
X-Received: by 2002:adf:fb4c:0:b0:236:5270:735e with SMTP id
 c12-20020adffb4c000000b002365270735emr22142643wrs.659.1669684442306; Mon, 28
 Nov 2022 17:14:02 -0800 (PST)
MIME-Version: 1.0
References: <20221125104558.84616-1-eddy.zhang@rock-chips.com>
In-Reply-To: <20221125104558.84616-1-eddy.zhang@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 28 Nov 2022 17:13:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XAU8qQ1tFV9_4FF9Rd7ouT5ORzt6JUnQ4KqJgRsEXqHw@mail.gmail.com>
Message-ID: <CAD=FV=XAU8qQ1tFV9_4FF9Rd7ouT5ORzt6JUnQ4KqJgRsEXqHw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: Fix output polarity setting bug
To: Qiqi Zhang <eddy.zhang@rock-chips.com>
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
Cc: neil.armstrong@linaro.org, jonas@kwiboo.se,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 jernej.skrabec@gmail.com, robert.foss@linaro.org, andrzej.hajda@intel.com,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Nov 25, 2022 at 2:54 AM Qiqi Zhang <eddy.zhang@rock-chips.com> wrote:
>
> According to the description in ti-sn65dsi86's datasheet:
>
> CHA_HSYNC_POLARITY:
> 0 = Active High Pulse. Synchronization signal is high for the sync
> pulse width. (default)
> 1 = Active Low Pulse. Synchronization signal is low for the sync
> pulse width.
>
> CHA_VSYNC_POLARITY:
> 0 = Active High Pulse. Synchronization signal is high for the sync
> pulse width. (Default)
> 1 = Active Low Pulse. Synchronization signal is low for the sync
> pulse width.
>
> We should only set these bits when the polarity is negative.
> Signed-off-by: Qiqi Zhang <eddy.zhang@rock-chips.com>
> ---
>  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> index 3c3561942eb6..eb24322df721 100644
> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> @@ -931,9 +931,9 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
>                 &pdata->bridge.encoder->crtc->state->adjusted_mode;
>         u8 hsync_polarity = 0, vsync_polarity = 0;
>
> -       if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> +       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
>                 hsync_polarity = CHA_HSYNC_POLARITY;
> -       if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> +       if (mode->flags & DRM_MODE_FLAG_NVSYNC)
>                 vsync_polarity = CHA_VSYNC_POLARITY;

Looks right to me.

Reviewed-by: Douglas Anderson <dianders@chromium.org>

I've never seen the polarity matter for any eDP panels I've worked
with, which presumably explains why this was wrong for so long. As far
as I can tell, it's been wrong since the start. Probably you should
have:

Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")

I put this on a sc7180-trogdor-lazor device and it didn't make
anything worse. Since the sync polarity never mattered to begin with,
I guess this isn't a surprise. ...so I guess that's a weak tested-by:

Tested-by: Douglas Anderson <dianders@chromium.org>

I'm happy to land this patch, but sounds like we're hoping to get
extra testing so I'll hold off for now.

-Doug
