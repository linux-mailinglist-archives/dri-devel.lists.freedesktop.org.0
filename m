Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 398CB48C204
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jan 2022 11:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 532481139A8;
	Wed, 12 Jan 2022 10:13:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E59D1139A6
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 10:13:00 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id n11so1490509plf.4
 for <dri-devel@lists.freedesktop.org>; Wed, 12 Jan 2022 02:13:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=gho4bZRXwzstDim7tvB8633o2cQh2tPe5cDHWYcQ7ZY=;
 b=tf8IXD1UjMrvEWVwsyUwDTa0KTg3Loi3AKbnfKUQVLRn3N7He5a75LY3PcSbVDAg/s
 9kEbNcGW1QW4rgO8Z875V9B4KqDLGnMcGP3ihH62QmGSFpccTdgmfzHTT8P/65hjwqQJ
 z+/svHY1BZU55eTUro7pWBQm2gPz7EdPEsakW+h7o9+jl9e2kIYNqJbmcU2Mx/3tlwOC
 lJdmDfUkHErD0dG6bi+g5Ymbekny9K16ZiNRNjR8gDrshcZrEkekZu8BMYSyxtIZ4DL/
 Zumqf8tasv+78nfyDufJLRWvjpnqN89RqlhV+UYhccZqgfOl+SpcSWfqzy6SMRVhTBhg
 mfUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gho4bZRXwzstDim7tvB8633o2cQh2tPe5cDHWYcQ7ZY=;
 b=DL101VaMYR36UGtVUanxp6Lc1z1PAF8mUrk41OWhNBrElPrDKatX0e7jFEiZRPoBA5
 2IVuFJ699757ZOz9hSXbBLCJnHZe7a/DPnZvbUcQNX5Sj75gr8bqgsYggZvpfs1yE4Iu
 YJ5DrytRBbz0pw2K5yNrSaDlnaHUUk3/4avu8wCfLw5a++OiHZLdx3L0pXC/AGGopyCv
 pxH/8Awm5koH1QhwuS0vG+2i7bNTwtdVdrtWYG3cPwWGUXHPNcsGjC2ORZJ+aYGH3nf7
 9h98mrKME1qKsy1YImdAoNNeEFlDuLCdwCDYmiiVvK2AuDQXQEqUJMEiKL6P3lLwRMmR
 iCUA==
X-Gm-Message-State: AOAM532ZtKoDqAi9fsnbXfRqRp50MZjBk67sx8hHPGKmLLGJ5atBLXOH
 6VI0bwNF7at9xX4zWVL7XInpWj9AsrDci+JB2PcyMg==
X-Google-Smtp-Source: ABdhPJywdR6yR67P9i8hdZ5DwWebo31m9ALuZA+Wpx2s7mM+oP0ycWqGRqjMjqbqw/MFpjizscam6XKJZd+4opbwiU0=
X-Received: by 2002:a05:6a00:1a0b:b0:4bb:171e:f3d0 with SMTP id
 g11-20020a056a001a0b00b004bb171ef3d0mr8682175pfv.0.1641982379911; Wed, 12 Jan
 2022 02:12:59 -0800 (PST)
MIME-Version: 1.0
References: <20220110172533.66614-1-jagan@amarulasolutions.com>
In-Reply-To: <20220110172533.66614-1-jagan@amarulasolutions.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 12 Jan 2022 11:12:49 +0100
Message-ID: <CAG3jFysyz3RTnsgiV8j5VxF59xqur=CiKoqpUDOn98dMcy4T9Q@mail.gmail.com>
Subject: Re: [PATCH v2] drm: bridge: nwl-dsi: Drop panel_bridge from nwl_dsi
To: Jagan Teki <jagan@amarulasolutions.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>,
 linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 10 Jan 2022 at 18:25, Jagan Teki <jagan@amarulasolutions.com> wrote=
:
>
> panel_bridge pointer never used anywhere except the one it
> looked up at nwl_dsi_bridge_attach.
>
> Drop it from the nwl_dsi structure.
>
> Reviewed-by: Guido G=C3=BCnther <agx@sigxcpu.org>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
> Changes for v2:
> - collect Guido r-b
>
> Note: This is patch is part of switching of devm_drm_of_get_bridge
> serious however the child node support of devm_drm_of_get_bridge is
> still under-review. So send it separatly as it not related to that
> API switch.
> https://patchwork.kernel.org/project/dri-devel/patch/20211210174819.22501=
78-1-jagan@amarulasolutions.com/
>
>  drivers/gpu/drm/bridge/nwl-dsi.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nw=
l-dsi.c
> index fc3ad9fab867..9282e61dfbf0 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -65,7 +65,6 @@ struct nwl_dsi_transfer {
>  struct nwl_dsi {
>         struct drm_bridge bridge;
>         struct mipi_dsi_host dsi_host;
> -       struct drm_bridge *panel_bridge;
>         struct device *dev;
>         struct phy *phy;
>         union phy_configure_opts phy_cfg;
> @@ -924,13 +923,11 @@ static int nwl_dsi_bridge_attach(struct drm_bridge =
*bridge,
>                 if (IS_ERR(panel_bridge))
>                         return PTR_ERR(panel_bridge);
>         }
> -       dsi->panel_bridge =3D panel_bridge;
>
> -       if (!dsi->panel_bridge)
> +       if (!panel_bridge)
>                 return -EPROBE_DEFER;
>
> -       return drm_bridge_attach(bridge->encoder, dsi->panel_bridge, brid=
ge,
> -                                flags);
> +       return drm_bridge_attach(bridge->encoder, panel_bridge, bridge, f=
lags);
>  }
>
>  static void nwl_dsi_bridge_detach(struct drm_bridge *bridge)

Applied to drm-misc-next.
