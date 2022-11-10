Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 873C0624CB9
	for <lists+dri-devel@lfdr.de>; Thu, 10 Nov 2022 22:14:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B24BA10E8BB;
	Thu, 10 Nov 2022 21:14:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56B7510E8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 21:14:20 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id b2so2257899iof.12
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:14:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uil9plJP9Dnr6dnTwH9f7lNtwClTBHMqVkSdIzaqKlc=;
 b=AKd0LH+WS7kEa/YEwAZYDnDp3WXdZduDiw3Phr/ihPD7HAgl+hxcBCqg+vaBQ0WQTb
 DOWVhtqnQVdl++ZvD03DAHyedXWwMCGV462/zvFHP4BvXIUBZtLXLl4vo8vhn4luflwT
 676k/RTExfcmWxsxzxWurI5e9A0W5lCgTk9/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uil9plJP9Dnr6dnTwH9f7lNtwClTBHMqVkSdIzaqKlc=;
 b=DkTThLvyJ2SXKosiEzxpUXbCBlZQIa1JfiKrjbsPrA87cwhbPzZ94xnof/Tk/uDzoJ
 IKkGL/2LLa6qM/BYwBDY+oDMw2F9kvJe4O/5uD/88xdqIsAoH1gL4oUkJwslizOnLysV
 2jPSmDsIQqKOzRbTWOEKD09WZWpIWWpjrz2bcRAFOrBKvm3TEjBTzBaIwgIfC1Fh5N9t
 ysgxR/Lvpiwqp41sANWsuNjBUWIvoNhbY3sF63Lh6MutPYM9xMZM2yVx/D1QHUurz50Y
 NoYEx5Ibe981YojifVOr614KuXFLHBuBBFKvfqJ60/J39TVf1hPD1UZP4cTKDIMIOKVX
 dOrA==
X-Gm-Message-State: ACrzQf2QtBljhu+Y1pouNO7Zs495jwnTQ+WDPQK1R+BiPGY1nAWzIdgF
 gssHKh1O1tLo9ugFBAlQ7E2h0wauZ/0Xew==
X-Google-Smtp-Source: AMsMyM7GQqX9CWnOjIEtIz5Nmi5j9ToVD1uyC/82ozxX2W7G7xuOELS1atMN1OB3i5PUPaWepeaecg==
X-Received: by 2002:a05:6638:86:b0:374:fbbc:6164 with SMTP id
 v6-20020a056638008600b00374fbbc6164mr3817138jao.11.1668114858868; 
 Thu, 10 Nov 2022 13:14:18 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com.
 [209.85.166.41]) by smtp.gmail.com with ESMTPSA id
 m9-20020a6b3f09000000b006bc48537658sm105929ioa.0.2022.11.10.13.14.17
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Nov 2022 13:14:17 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id n191so2261248iod.13
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Nov 2022 13:14:17 -0800 (PST)
X-Received: by 2002:a6b:6e02:0:b0:6bd:2e10:96cf with SMTP id
 d2-20020a6b6e02000000b006bd2e1096cfmr3362371ioh.24.1668114856597; Thu, 10 Nov
 2022 13:14:16 -0800 (PST)
MIME-Version: 1.0
References: <20221110184852.1848917-1-gildekel@chromium.org>
In-Reply-To: <20221110184852.1848917-1-gildekel@chromium.org>
From: Sean Paul <seanpaul@chromium.org>
Date: Thu, 10 Nov 2022 16:13:39 -0500
X-Gmail-Original-Message-ID: <CAOw6vbLRWMVeLch_i6WVxUHO_PptMcshdk-LQXr=+e6-kJc+XQ@mail.gmail.com>
Message-ID: <CAOw6vbLRWMVeLch_i6WVxUHO_PptMcshdk-LQXr=+e6-kJc+XQ@mail.gmail.com>
Subject: Re: [PATCH v2] drm/mediatek: make eDP panel as the first connected
 connector
To: Gil Dekel <gildekel@chromium.org>
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
Cc: chunkuang.hu@kernel.org, airlied@linux.ie, jason-jh.lin@mediatek.com,
 justin.yeh@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Nov 10, 2022 at 1:49 PM Gil Dekel <gildekel@chromium.org> wrote:
>
> [Why]
> Some userspaces assume that the first connected connector is the "main"
> display, which supposed to display, for example, the login screen.
> For laptops, this should be the internal connector.
>
> [How]
> This patch calls drm_helper_move_panel_connectors_to_head() right before
> crtc creation to ensure internal connectors are at the top of the
> connector list.
>
> Tested by ensuring the internal panels are at the top of the connector
> list via modetest -c.
>
> This patch does to mediatek what the following patch
> https://www.spinics.net/lists/stable/msg590605.html
> did for qualcomm.
>

Reviewed-by: Sean Paul <seanpaul@chromium.org>

> Signed-off-by: Gil Dekel <gildekel@chromium.org>
> Tested-by: Gil Dekel <gildekel@chromium.org>
> ---
> v2: Fix copy-paste errors in commit message so it's relevant for this
>     patch and the mediatek driver.
> ---
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> index 91f58db5915f..76daaf6a0945 100644
> --- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> +++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
> @@ -386,6 +386,12 @@ static int mtk_drm_kms_init(struct drm_device *drm)
>         if (ret)
>                 goto put_mutex_dev;
>
> +       /*
> +        * Ensure internal panels are at the top of the connector list before
> +        * crtc creation.
> +        */
> +       drm_helper_move_panel_connectors_to_head(drm);
> +
>         /*
>          * We currently support two fixed data streams, each optional,
>          * and each statically assigned to a crtc:
> --
> Gil Dekel, Software Engineer, Google / ChromeOS Display and Graphics
