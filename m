Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FBA57A0C6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Jul 2022 16:10:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CC772A3DB;
	Tue, 19 Jul 2022 14:09:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88E522A57F
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 14:09:56 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id sz17so27384889ejc.9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Jul 2022 07:09:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vJMDPQ6JxZqQ5e3bQhZhMXmqqZrhAcVL6XK53qf+yZo=;
 b=dF2CF31GTyulq3yHsXUA1vHe2kfxBlnZD2GJKEsvd21wdJODJxisNWK5q2qqnE8jRu
 dVdbJZgJTdqzovcJwW3t3CbaOdfS7JC++7wFa1cueWGgZqoHtEShGi3yiRc+wcJrYe4R
 1LFTz0mj3OE37GgsKHiR2JRreETgNkWJL5b224HFw8FerDiKE6dZ30/Pr4BcZoTpNWO6
 LjMlrr9ctQA+eOUZrwmG9DpU0IgSFYaJsGs4ivXnZeU0dsPshkBt2jV5QpyyshaVtwXy
 CjnkN3P/7C7EvzeYPIrklHPAh3suJ7JUpSe25X3FMsfE1SytE7IEz7Itd2ae7s+4mmvN
 HKNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vJMDPQ6JxZqQ5e3bQhZhMXmqqZrhAcVL6XK53qf+yZo=;
 b=Wx+D4XSgZkwpKQG22jFrjXLPqN0ChSGvhmoCr2ijceSjy1BrypHpvZoNHhxLdhyVcO
 OAsw90M4uXQc6gnA/SyE05mwTUOSblkTfajcuIR3GzBxDLbnIZsmnbFHKvgg40M3sP+P
 2MyME2Z4wrvWbpo/aK79Eijn5s6TXnv8McYC1MxRNpnUbeI5+SNEMR26BvIN2muHRItr
 7Msch2odzzcGS+aa7Wc4NmKz6/Og7D27qQ0ACID3NQPGB6+A1Xp4D7KzPhd7jNM+T1Rz
 LgrpifYwuCA2toTj0Ntt7+xSTt+wViSyPdjJzp2GfJJywrIpG+kNdGjcfaC2DNMSX5RU
 oUIQ==
X-Gm-Message-State: AJIora+qqAo+AkOJ6JOiMzZfA/mtHg1iix7m0HS4DI6s0BSvt25rUJ/B
 avHOKiNGX/CRgoSxGFKFBIXMjdUwEI/PPe+VVzqPXQ==
X-Google-Smtp-Source: AGRyM1vIvrL+ynTCXW9jozSCwBKEDF7zOHgYSDXBTQzuGSuKy/E6HIdmsx6PziOBLoPRrbpWd3BC/TOOutSHeTbYer0=
X-Received: by 2002:a17:907:97c2:b0:72b:9ec4:9a60 with SMTP id
 js2-20020a17090797c200b0072b9ec49a60mr29861218ejc.154.1658239795128; Tue, 19
 Jul 2022 07:09:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220717174454.46616-1-sam@ravnborg.org>
 <20220717175801.78668-1-sam@ravnborg.org>
In-Reply-To: <20220717175801.78668-1-sam@ravnborg.org>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 19 Jul 2022 15:09:38 +0100
Message-ID: <CAPY8ntBVhdixytMMMxAZcnCYf=zCB14RGucgD+hsTrD5RFP_fw@mail.gmail.com>
Subject: Re: [PATCH v1 08/12] drm/mediatek: Drop mtk_hdmi_bridge_mode_fixup
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Guenter Roeck <groeck@chromium.org>,
 chrome-platform@lists.linux.dev, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Jonas Karlman <jonas@kwiboo.se>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philip Chen <philipchen@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 17 Jul 2022 at 18:58, Sam Ravnborg <sam@ravnborg.org> wrote:
>
> The implementation of drm_bridge_funcs.mode_fixup is optional
> so there is no need to provide an empty implementation.
> Drop mtk_hdmi_bridge_mode_fixup() so the driver no longer uses the
> deprecated drm_bridge_funcs.mode_fixup() operation.
>
> Signed-off-by: Sam Ravnborg <sam@ravnborg.org>

Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-arm-kernel@lists.infradead.org
> ---
>  drivers/gpu/drm/mediatek/mtk_hdmi.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> index a63b76055f81..7321aa1ee6f0 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
> @@ -1293,13 +1293,6 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
>         return 0;
>  }
>
> -static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> -                                      const struct drm_display_mode *mode,
> -                                      struct drm_display_mode *adjusted_mode)
> -{
> -       return true;
> -}
> -
>  static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
>                                            struct drm_bridge_state *old_bridge_state)
>  {
> @@ -1399,7 +1392,6 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
>         .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>         .atomic_reset = drm_atomic_helper_bridge_reset,
>         .attach = mtk_hdmi_bridge_attach,
> -       .mode_fixup = mtk_hdmi_bridge_mode_fixup,
>         .atomic_disable = mtk_hdmi_bridge_atomic_disable,
>         .atomic_post_disable = mtk_hdmi_bridge_atomic_post_disable,
>         .mode_set = mtk_hdmi_bridge_mode_set,
> --
> 2.34.1
>
