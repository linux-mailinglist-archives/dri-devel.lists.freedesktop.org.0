Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 690B45BBBEF
	for <lists+dri-devel@lfdr.de>; Sun, 18 Sep 2022 06:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C78210E49F;
	Sun, 18 Sep 2022 04:47:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B0D10E49F
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 04:47:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A1985612A0
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 04:47:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0383BC433D6
 for <dri-devel@lists.freedesktop.org>; Sun, 18 Sep 2022 04:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1663476423;
 bh=CSkbwKqFDwoTcrIkATvHljbT5brjkYB/RNCXPtLGAlY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gFaXETrEdzfokQVVyjJPra8q/RUwpky72FUJxQHKPjh8IEL5Z45PdareAz1uL7Va7
 dDFU9TzZbTRZXTyLTje2Q01FoPEPYPKUx1HMCCDsrqDkIj4ivZ7pKPO0mbFiB/3oNa
 8LxpafnPRLvnZJrj6gVSg/wAVfyC39uiyQ94EoI5vUap3VklxCVSWE68ztm13zpvWt
 vfrh9QokKUBp67VkByoYz5Sud0XrQhm/ez+Otuy0OsKvrsNfl+kgeglWAbitxUl7cW
 u+Up5nvp1l9P0R1Y8iIk+JgxmKVVgGBpXoofSEgKV0T9m0IfrBkbVlPIQKeeDQgGwy
 WLT/J0ZwAuPzg==
Received: by mail-oi1-f178.google.com with SMTP id n124so10863699oih.7
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Sep 2022 21:47:02 -0700 (PDT)
X-Gm-Message-State: ACgBeo1FXEHPXz06hgp2SNdENuQN0gcgf3NaDMRNK+YOsLYJjvp2vzkp
 pqNVV8lzyl9eOJ4ODMONKkXv8MiR3gC9dgyrUQ==
X-Google-Smtp-Source: AA6agR5PsQsy27uH4rlZzSjoJwft/wU0ylxMmtvPMOZnQQjqgSNaP0ueHlVHW/PTiamnloKRSL2Qs0zcv2VSLa8lGYk=
X-Received: by 2002:a05:6808:148a:b0:34f:973c:5838 with SMTP id
 e10-20020a056808148a00b0034f973c5838mr9282007oiw.69.1663476422185; Sat, 17
 Sep 2022 21:47:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 18 Sep 2022 12:46:51 +0800
X-Gmail-Original-Message-ID: <CAAOTY_8uQ+z9+-Ei5sCFV__AYBzzghgEFBrV4aAZQu7pWcRtUw@mail.gmail.com>
Message-ID: <CAAOTY_8uQ+z9+-Ei5sCFV__AYBzzghgEFBrV4aAZQu7pWcRtUw@mail.gmail.com>
Subject: Re: [PATCH v1 08/12] drm/mediatek: Drop mtk_hdmi_bridge_mode_fixup
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Philip Chen <philipchen@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Sam:

Sam Ravnborg <sam@ravnborg.org> =E6=96=BC 2022=E5=B9=B47=E6=9C=8818=E6=97=
=A5 =E9=80=B1=E4=B8=80 =E5=87=8C=E6=99=A81:58=E5=AF=AB=E9=81=93=EF=BC=9A
>
> The implementation of drm_bridge_funcs.mode_fixup is optional
> so there is no need to provide an empty implementation.
> Drop mtk_hdmi_bridge_mode_fixup() so the driver no longer uses the
> deprecated drm_bridge_funcs.mode_fixup() operation.

Acked-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediat=
ek/mtk_hdmi.c
> index a63b76055f81..7321aa1ee6f0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1293,13 +1293,6 @@ static int mtk_hdmi_bridge_attach(struct drm_bridg=
e *bridge,
>         return 0;
>  }
>
> -static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                      const struct drm_display_mode *mod=
e,
> -                                      struct drm_display_mode *adjusted_=
mode)
> -{
> -       return true;
> -}
> -
>  static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>                                            struct drm_bridge_state *old_b=
ridge_state)
>  {
> @@ -1399,7 +1392,6 @@ static const struct drm_bridge_funcs mtk_hdmi_bridg=
e_funcs =3D {
>         .atomic_destroy_state =3D drm_atomic_helper_bridge_destroy_state,
>         .atomic_reset =3D drm_atomic_helper_bridge_reset,
>         .attach =3D mtk_hdmi_bridge_attach,
> -       .mode_fixup =3D mtk_hdmi_bridge_mode_fixup,
>         .atomic_disable =3D mtk_hdmi_bridge_atomic_disable,
>         .atomic_post_disable =3D mtk_hdmi_bridge_atomic_post_disable,
>         .mode_set =3D mtk_hdmi_bridge_mode_set,
> --
> 2.34.1
>
