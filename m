Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8920D5E6ACE
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 20:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AE3110E272;
	Thu, 22 Sep 2022 18:24:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B497610E272
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 18:24:47 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id fv3so10697618pjb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=6ndWWjbbbJbtQHr06Dm1GUglIQIf8G1xTgr/LwYJzos=;
 b=Vt37OBIxIAoP+1nYlOTRHn8ZSBf7oCj94pnn6Q1iKL2/s4Jb08SQV36JYQcoe/kkEs
 3Trd+FHP3ZV7ru81ZK4wjagBY1/FN4BluDoKw/JWW11fZppqTj2gCSDpLbWMUlcXB/5V
 2jEiI4f3jIbIpI0GKWNr2AD094Amfii1FUxIIwL8Qoddf3/Qx/qUaFan6cfLfVr037b8
 UfyKdmHeDLsrO9JgF/j/UP9viZ3ELgCP9CeIsMmXO1AxUyMNEkz3cLEC/oRrQmlSpeom
 MqJWbcaZV9A5HP1KxHy0t/08l4SJHhT9vTceCGGrIN9yKvd76w8O61tjg7XfKxRE4iKL
 EEaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=6ndWWjbbbJbtQHr06Dm1GUglIQIf8G1xTgr/LwYJzos=;
 b=VxPwGhFn227FJYnOzUqvS+xcWlTQlW1w6SHNCA9tZl5MNEYfZPki+FV9JekRulxuvj
 8vQ+5GNPrtqTb7hmrLRP7zo5Z0tjVzWP0OLKUJHE/lzZF4fGskzUTRQzzvZHCu/uP3Pe
 GfaJfIHK7phwsDz16W4J25BpIMeYWqYvs0pJSCCIh+XcBTA3FQcVnk4vj+XgrPhrSHSx
 tcL6cLdx9Z53yo9nyxHrS8gL7Gqdl2hgP/34/KoXJm6XnBDo+G0bTU7KEuxfWmCDUik3
 ukAHgbrrc37YXuCq8WZ11b0GbH7dmwppSoLTJyEkf0ZhgAb7CKhu2DESUUMuu1Tav8KJ
 Qy3A==
X-Gm-Message-State: ACrzQf1dR5mGnQzyLSLHmLAfFXN3vPqdBRboUKvtmq79+7vcZ5eToq3H
 Vl5zG053u/GpzeKzB04Ww6b5vAEYu6CCvizuw1E=
X-Google-Smtp-Source: AMsMyM5A0gbdIv5p/pFowpErC6zyBs0v4TwJ6PjlbF/1s9bKPd9uxN9Xt0n5K4vT9iJ2TyrqS4iMymarA9qzXi+nUXQ=
X-Received: by 2002:a17:902:8346:b0:178:a33f:89cf with SMTP id
 z6-20020a170902834600b00178a33f89cfmr4466192pln.9.1663871087164; Thu, 22 Sep
 2022 11:24:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124306.34729-1-dev@pschenker.ch>
 <20220922124306.34729-2-dev@pschenker.ch>
In-Reply-To: <20220922124306.34729-2-dev@pschenker.ch>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Thu, 22 Sep 2022 20:24:36 +0200
Message-ID: <CABkfQAHcphPs=stWuT8XAFfbZnhx8sp9E_8i0nTgcMxoJp7agQ@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: lt8912b: add vsync hsync
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
> Currently the bridge driver does not take care whether or not the display
> needs positive/negative vertical/horizontal syncs. Pass these two flags
> to the bridge from the EDID that was read out from the display.
>
> Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Acked-by: Adrien Grassein <adrien.grassein@gmail.com>
>
> ---
>
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 28bad30dc4e5..0fd3472e767c 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -268,7 +268,7 @@ static int lt8912_video_setup(struct lt8912 *lt)
>         u32 hactive, h_total, hpw, hfp, hbp;
>         u32 vactive, v_total, vpw, vfp, vbp;
>         u8 settle =3D 0x08;
> -       int ret;
> +       int ret, hsync_activehigh, vsync_activehigh;
>
>         if (!lt)
>                 return -EINVAL;
> @@ -278,12 +278,14 @@ static int lt8912_video_setup(struct lt8912 *lt)
>         hpw =3D lt->mode.hsync_len;
>         hbp =3D lt->mode.hback_porch;
>         h_total =3D hactive + hfp + hpw + hbp;
> +       hsync_activehigh =3D lt->mode.flags & DISPLAY_FLAGS_HSYNC_HIGH;
>
>         vactive =3D lt->mode.vactive;
>         vfp =3D lt->mode.vfront_porch;
>         vpw =3D lt->mode.vsync_len;
>         vbp =3D lt->mode.vback_porch;
>         v_total =3D vactive + vfp + vpw + vbp;
> +       vsync_activehigh =3D lt->mode.flags & DISPLAY_FLAGS_VSYNC_HIGH;
>
>         if (vactive <=3D 600)
>                 settle =3D 0x04;
> @@ -317,6 +319,11 @@ static int lt8912_video_setup(struct lt8912 *lt)
>         ret |=3D regmap_write(lt->regmap[I2C_CEC_DSI], 0x3e, hfp & 0xff);
>         ret |=3D regmap_write(lt->regmap[I2C_CEC_DSI], 0x3f, hfp >> 8);
>
> +       ret |=3D regmap_update_bits(lt->regmap[I2C_MAIN], 0xab, BIT(0),
> +                                 vsync_activehigh ? BIT(0) : 0);
> +       ret |=3D regmap_update_bits(lt->regmap[I2C_MAIN], 0xab, BIT(1),
> +                                 hsync_activehigh ? BIT(1) : 0);
> +
>         return ret;
>  }
>
> --
> 2.37.3
>
