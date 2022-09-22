Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AF0F5E6ADA
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 20:26:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C0F10E27A;
	Thu, 22 Sep 2022 18:26:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com
 [IPv6:2607:f8b0:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E29AD10E27A
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 18:26:05 +0000 (UTC)
Received: by mail-pf1-x429.google.com with SMTP id c198so10086335pfc.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:26:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=x/KOEzvs5/HZ3ITyDMwqUGxQmeTcr0AR1wyo8XABotg=;
 b=oAxyP8tCqeYuU1oeTTDzPYwAqW0TWMjBk4MNm/Q9k1jDviJ2qcMy7OceSjh3XrlXt+
 WrJ+yOR5ex/qDj8dt7tlnl2XGCAvoZO8td+AMezzfYRVUPdslh8eBR95OmSePwMdsY5w
 3xtyQTxmWE5Q4RNdohSNfkLFDqoCcD6ufLevaPyBO+DVdoEXzu0mo/PRJJWJFqFvcSwK
 sGOo1/zyIuhLmTPgLaKUvqllYvtcrC4IFp5CsofhcgxRVcvSocTW/e6ptYefbqGssPoJ
 jRCb4UK8zF68zyaR3bjkUAx621UjF9YuaXrpLkf2noW4zTj6hS6l28jZypsbhXvdHYQg
 ZfJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=x/KOEzvs5/HZ3ITyDMwqUGxQmeTcr0AR1wyo8XABotg=;
 b=h1Cyp/Ppc8DGVPsL4CbXCNgHyq3uJyaZmUs7KDsViAxiw9VNVjsOapck6VtKT5MgA5
 LL0CaTFJMooNCialTTXBr6DgxXckRZMXrtSqbLMWx5iQP3EmEQI/80dPX0fYb/YKX9ui
 Tk+ADfHMazv55LsQ3Bq6k8DF9UMjTS00NslYsj9V31RtigYzgicXRhQmU+2K58dhlmK2
 R+TZ0MdkJ1QM8PjSgoT+1uAeDunczVbpPBLBazg7JfyWT5idc3JyA6e3zmdn15qsMM9U
 iNz6tiJT8sd/kYGF3sk1o8CAIS9NgMEDzYDdg/u66N/rCkboVU8mTjpU9onSDO0TmzAj
 ja4Q==
X-Gm-Message-State: ACrzQf3WXBrRp/U20mJ9QMiUMiVsxwWztjoigB7JMkBt9aGG4R34q7eM
 tM0oxMGP8Gy4ct53VTCRGzlzKImsKS27jTmGDDA=
X-Google-Smtp-Source: AMsMyM7SjLqOheQS7Tgisez4lt6X6IFltXK5bMjjFxT+e/IvOiU4nqQZoLfrUtCqjnkJetnfbLjFO+igd7zFPPgDyZs=
X-Received: by 2002:a63:1f49:0:b0:43b:a2df:857 with SMTP id
 q9-20020a631f49000000b0043ba2df0857mr4244126pgm.137.1663871165524; Thu, 22
 Sep 2022 11:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124306.34729-1-dev@pschenker.ch>
 <20220922124306.34729-3-dev@pschenker.ch>
In-Reply-To: <20220922124306.34729-3-dev@pschenker.ch>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Thu, 22 Sep 2022 20:25:54 +0200
Message-ID: <CABkfQAFLAMtj2yV3tCrjcVN70K2F4y4R31mHqm49oeoPcs3KHQ@mail.gmail.com>
Subject: Re: [PATCH 2/4] drm/bridge: lt8912b: set hdmi or dvi mode
To: Philippe Schenker <dev@pschenker.ch>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le jeu. 22 sept. 2022 =C3=A0 14:43, Philippe Schenker <dev@pschenker.ch> a =
=C3=A9crit :
>
> From: Philippe Schenker <philippe.schenker@toradex.com>
>
> The Lontium LT8912 does have a setting for DVI or HDMI. This patch reads
> from EDID what the display needs and sets it accordingly.
>
> Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Acked-by: Adrien Grassein <adrien.grassein@gmail.com>
> ---
>
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 0fd3472e767c..6a4bb7422176 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -323,6 +323,8 @@ static int lt8912_video_setup(struct lt8912 *lt)
>                                   vsync_activehigh ? BIT(0) : 0);
>         ret |=3D regmap_update_bits(lt->regmap[I2C_MAIN], 0xab, BIT(1),
>                                   hsync_activehigh ? BIT(1) : 0);
> +       ret |=3D regmap_update_bits(lt->regmap[I2C_MAIN], 0xb2, BIT(0),
> +                                 lt->connector.display_info.is_hdmi ? BI=
T(0) : 0);
>
>         return ret;
>  }
> --
> 2.37.3
>
