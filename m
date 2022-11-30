Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0701F63D8A0
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:58:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F063510E486;
	Wed, 30 Nov 2022 14:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CAFF10E478
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:58:22 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id td2so27860733ejc.5
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 06:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=iUf7tHbOiTNFxm9NG1RAoNmYcPKyh2MOWhQXpw+Jkiw=;
 b=A8aEOTll3/YjbHk0UTM1xHykcTPnT60aMQD4cX4BswRSwu55TFbnZ2y7phFBPvFEgR
 ad+ilkzGeMWMJ7yH5g0KEF5FaAq+zAM/qCpNs3tPjD/7spSo9QMLEMzlMZfYi4DNaVlz
 5zujILxnGiBtxNbxGsUyWoM6YSqVtP1TwDUA4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iUf7tHbOiTNFxm9NG1RAoNmYcPKyh2MOWhQXpw+Jkiw=;
 b=5NFo9UADgaGRgeTX9eoV0fGCBb7CxgCtRTcQGEyAkdX++BJJuzqiPPux7Od1FHUr39
 XjAOKzkRd44s+hdCyy5baweATze7PbxR62G64eyzCfuyPpl93+YaqzjhTNFPsqLHZF/1
 EYOBYd0cyYniqfFyUtvqmIBOxTfY72jI/dRqPbd/iFHolLpEK1q3CA7Jd3eN1wgwjlG8
 LDaErgM5ilnC8minye2s5usLRTTQEan280EL1qscYvYd2C1lFT/+1iyvLfm+Dz6WPpT5
 0fxw7Ckd62Zghlz/0mq5byiOVO4DrfTw+PwJRlGwd8vgyRa9aGUYGg8ju5jsHgiEdo6H
 aQiQ==
X-Gm-Message-State: ANoB5pnOunD1qE0iIK2B+Q+3R7eYEff8MYDzh33CjCFWaHqPZ8bvK4bk
 auPJXWujhaBkdqUS5kqrEaHMWyAAZ1moOlqP
X-Google-Smtp-Source: AA0mqf75j/HY9f3Nf2gH156QgrLb185/YVZyRradaNGOVAdjardL/Lg/9oUT0eYanngKHd5BtlprPw==
X-Received: by 2002:a17:906:3982:b0:7ad:8bc6:46e7 with SMTP id
 h2-20020a170906398200b007ad8bc646e7mr55046113eje.28.1669820300668; 
 Wed, 30 Nov 2022 06:58:20 -0800 (PST)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 l2-20020a1709063d2200b0073c8d4c9f38sm724791ejf.177.2022.11.30.06.58.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 06:58:19 -0800 (PST)
Received: by mail-wr1-f49.google.com with SMTP id z4so27537511wrr.3
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 06:58:19 -0800 (PST)
X-Received: by 2002:a5d:6409:0:b0:241:f7ae:b1dd with SMTP id
 z9-20020a5d6409000000b00241f7aeb1ddmr21393491wru.138.1669820299103; Wed, 30
 Nov 2022 06:58:19 -0800 (PST)
MIME-Version: 1.0
References: <34c2e9c8-9e3d-129c-8295-18ff440f1f84@ideasonboard.com>
 <20221130054551.112944-1-eddy.zhang@rock-chips.com>
In-Reply-To: <20221130054551.112944-1-eddy.zhang@rock-chips.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 30 Nov 2022 06:58:06 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WRbg=VyNHfteBBuijC-uhx5Oyc2TX40BEQ2SHv6s=puQ@mail.gmail.com>
Message-ID: <CAD=FV=WRbg=VyNHfteBBuijC-uhx5Oyc2TX40BEQ2SHv6s=puQ@mail.gmail.com>
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
Cc: neil.armstrong@linaro.org, jernej.skrabec@gmail.com,
 andrzej.hajda@intel.com, jonas@kwiboo.se, tomi.valkeinen@ideasonboard.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Laurent.pinchart@ideasonboard.com, robert.foss@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Nov 29, 2022 at 9:46 PM Qiqi Zhang <eddy.zhang@rock-chips.com> wrote:
>
> Hi,
>
> on Nov. 29, 2022, 11:45 a.m. Tomi wrote:
> >On 29/11/2022 03:13, Doug Anderson wrote:
> >> Hi,
> >>
> >> On Fri, Nov 25, 2022 at 2:54 AM Qiqi Zhang <eddy.zhang@rock-chips.com> wrote:
> >>>
> >>> According to the description in ti-sn65dsi86's datasheet:
> >>>
> >>> CHA_HSYNC_POLARITY:
> >>> 0 = Active High Pulse. Synchronization signal is high for the sync
> >>> pulse width. (default)
> >>> 1 = Active Low Pulse. Synchronization signal is low for the sync
> >>> pulse width.
> >>>
> >>> CHA_VSYNC_POLARITY:
> >>> 0 = Active High Pulse. Synchronization signal is high for the sync
> >>> pulse width. (Default)
> >>> 1 = Active Low Pulse. Synchronization signal is low for the sync
> >>> pulse width.
> >>>
> >>> We should only set these bits when the polarity is negative.
> >>> Signed-off-by: Qiqi Zhang <eddy.zhang@rock-chips.com>
> >>> ---
> >>>   drivers/gpu/drm/bridge/ti-sn65dsi86.c | 4 ++--
> >>>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >>> index 3c3561942eb6..eb24322df721 100644
> >>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> >>> @@ -931,9 +931,9 @@ static void ti_sn_bridge_set_video_timings(struct ti_sn65dsi86 *pdata)
> >>>                  &pdata->bridge.encoder->crtc->state->adjusted_mode;
> >>>          u8 hsync_polarity = 0, vsync_polarity = 0;
> >>>
> >>> -       if (mode->flags & DRM_MODE_FLAG_PHSYNC)
> >>> +       if (mode->flags & DRM_MODE_FLAG_NHSYNC)
> >>>                  hsync_polarity = CHA_HSYNC_POLARITY;
> >>> -       if (mode->flags & DRM_MODE_FLAG_PVSYNC)
> >>> +       if (mode->flags & DRM_MODE_FLAG_NVSYNC)
> >>>                  vsync_polarity = CHA_VSYNC_POLARITY;
> >>
> >> Looks right to me.
> >>
> >> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> >>
> >> I've never seen the polarity matter for any eDP panels I've worked
> >> with, which presumably explains why this was wrong for so long. As far
> >
> >Afaik, DP doesn't have sync polarity as such (neither does DSI), and the
> >sync polarity is just "metadata". So if you're in full-DP domain, I
> >don't see why it would matter. I guess it becomes relevant when you
> >convert from DP to some other bus format.
>
> Just like Tomi said, the wrong polarity worked fine on my eDP panel(LP079QX1)
> and standard DP monitor, I didn't notice the polarity configuration problem
> here until my customer used the following solution and got a abnormal display:
> GPU->mipi->eDP->DP->lvds->panel.

Wow, that's convoluted, but makes sense. I think this fully explains
why this is a problem for you but wasn't in the past.


> >> as I can tell, it's been wrong since the start. Probably you should
> >> have:
> >>
> >> Fixes: a095f15c00e2 ("drm/bridge: add support for sn65dsi86 bridge driver")
>
> Doug you mean I need to update my commit message? It's my first time using
> kernel list and I'm a little confused about this.

Nah, I'll add it in and land it. OK, pushed to drm-misc-fixes:

8c115864501f drm/bridge: ti-sn65dsi86: Fix output polarity setting bug
