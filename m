Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE23663BEA3
	for <lists+dri-devel@lfdr.de>; Tue, 29 Nov 2022 12:09:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA93810E3AF;
	Tue, 29 Nov 2022 11:09:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE36A10E3AF
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 11:09:30 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id e205so14737690oif.11
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Nov 2022 03:09:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=cf9n2jaa6cYTVOklMuNk4qObbBfb+M49DmHuLPAMaG8=;
 b=EQGj1OluD1poCYCp847EqljBv2Ad7K/1G88aFPNPKXsuhiJcjMGoVE4O/IpTOi6grs
 DqYZyeMry7IkWAxmOVsObvHrdr/u4CHzPmyaVR8QTymd3X6LWpY0Dsxs/yLDVDP1VhaP
 tp0sWFghX2mKmvsrtbfPRU8FGxdMLOhH/VuekVTXfdKSaPfa9ZuHJakPCobD31IXWdp4
 +BqClWFUs/lL6XEYozaaPgS+KbkB5k3abcZ8TgF8IvK/p2du9FDw8FXQNZaIfLD9s93T
 2FlZyEzDBvaZtz6FcmRkxwdCpMNAMLiNpNr518cQA9GbdBTia3NupXIlr8ygDt2EeL6l
 ITAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cf9n2jaa6cYTVOklMuNk4qObbBfb+M49DmHuLPAMaG8=;
 b=WhioJkFEf3HTB1UIIeIvgafKIJa2acbH/PE3PW8IwEuvgQo1lfTyCb8ZlPFVf2AgYG
 YaCe9el0sz66xbC6ogUEwanBQlFbAAjHw7/eVeoktMq7l24MrltP97huVxhc3qyaBl47
 W4qxTc5rpuaAIeKW5WDsCVzM6tYw3VbMVLt9luVWT6jTe8ujODeETXPzE7Z/GFQ55S/4
 XDY6ZKdEdfB73NB5m0s+IjJPDmg23pehhzx42qHDoDRnwVf1LDzUgLuWsnbCcuaWUlxm
 n2YdYnDhyEMBJCDDxjOncGszajgLpfcpB9e2uFVeHg/F/RjZmhs9fUvG5xOxG/53xTDf
 Anhw==
X-Gm-Message-State: ANoB5plAvJXO3b3SSc4ptlZhNmHssKyjfm/BuU6SGSoRPg2xoN0hasmS
 nByjzWkjvn+9CRVTl2UtLKs4cuhxRnNdp11rxk+cRQ==
X-Google-Smtp-Source: AA0mqf5fbP4ZbObgYQ/PNpZohM7nKX0Xg43wC7ljqPSKkxNSoLuBv0Tby+XmsYnndNx6Rfpcz+xVv2PD+1lW35gFnFY=
X-Received: by 2002:aca:5bc4:0:b0:35a:7056:4f9c with SMTP id
 p187-20020aca5bc4000000b0035a70564f9cmr30858789oib.72.1669720170072; Tue, 29
 Nov 2022 03:09:30 -0800 (PST)
MIME-Version: 1.0
References: <20221116143523.2126-1-the.cheaterman@gmail.com>
In-Reply-To: <20221116143523.2126-1-the.cheaterman@gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 29 Nov 2022 12:09:19 +0100
Message-ID: <CAG3jFytyzmRnpj8pzSUitLhAHQM9b0zhkc2cbfVmgKStfHpwVA@mail.gmail.com>
Subject: Re: [PATCH] drm: bridge: dw_hdmi: fix preference of RGB modes over
 YUV420
To: Guillaume BRUN <the.cheaterman@gmail.com>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Christian Hewitt <christianshewitt@gmail.com>,
 linux-kernel@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, linux-amlogic@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 16 Nov 2022 at 15:35, Guillaume BRUN <the.cheaterman@gmail.com> wrote:
>
> Cheap monitors sometimes advertise YUV modes they don't really have
> (HDMI specification mandates YUV support so even monitors without actual
> support will often wrongfully advertise it) which results in YUV matches
> and user forum complaints of a red tint to light colour display areas in
> common desktop environments.
>
> Moving the default RGB fall-back before YUV selection results in RGB
> mode matching in most cases, reducing complaints.
>
> Fixes: 6c3c719936da ("drm/bridge: synopsys: dw-hdmi: add bus format negociation")
> Signed-off-by: Guillaume BRUN <the.cheaterman@gmail.com>
> Tested-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index 40d8ca37f5bc..aa51c61a78c7 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2720,6 +2720,9 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>          * if supported. In any case the default RGB888 format is added
>          */
>
> +       /* Default 8bit RGB fallback */
> +       output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> +
>         if (max_bpc >= 16 && info->bpc == 16) {
>                 if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>                         output_fmts[i++] = MEDIA_BUS_FMT_YUV16_1X48;
> @@ -2753,9 +2756,6 @@ static u32 *dw_hdmi_bridge_atomic_get_output_bus_fmts(struct drm_bridge *bridge,
>         if (info->color_formats & DRM_COLOR_FORMAT_YCBCR444)
>                 output_fmts[i++] = MEDIA_BUS_FMT_YUV8_1X24;
>
> -       /* Default 8bit RGB fallback */
> -       output_fmts[i++] = MEDIA_BUS_FMT_RGB888_1X24;
> -
>         *num_output_fmts = i;
>
>         return output_fmts;
> --
> 2.37.3
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
