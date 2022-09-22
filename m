Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B625E6ADB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Sep 2022 20:26:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0A7510E27D;
	Thu, 22 Sep 2022 18:26:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4037B10E27D
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 18:26:40 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id jm5so8592271plb.13
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Sep 2022 11:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=TBgCkH3JkIc+IniQbGJXoodAUuhOgxlJRYBUPHsWxrI=;
 b=HPMAzRpCXEpObfn/F63fTuscb+vLxR36rz8hUk97RWQnfpREP1bquwZIrUmttoBnot
 fGHtp1cvokVQjHv9zBLi5zT4154UtPQseIPvE9Tq0z+BCMKIkgyKMhCE02OfrMsyoT2n
 /i+vE/a0M0lzPIXgS3xawXCGdPlyTh8Cp0T3W3WNCAGeHg4iR9pZGqLIGVI/3x6Eclhm
 sUHPBDIWchRu1NaNexKsymA46SS1Ko55YLZsxo8LuyCMhthFG4RoQJTZwVYBzabQmKx6
 0iDDZPf9OLiuerOeERMyxHplIp4G4I9VpFpV2R3cMgXWGY692B8D4wKPrlingk7zmSsq
 dZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=TBgCkH3JkIc+IniQbGJXoodAUuhOgxlJRYBUPHsWxrI=;
 b=5V3ugWAhnt9nXf0YjSB/FEx4BlAZ87U4E65nlrCc9ihitZFH6eGN5TIbuiITVA86Y9
 MGPnQL2RGDrKjtO+YFLR+QP15NsaMXjcFZojxsWFzY0HEepjtpaMohTnj2bqCs5pj+Cr
 IL3t4KyvI03rs5+xHfoUOwA0LsWV1vUw9QFBLE+sTDJZ4nEg8yZ16QLiibJGgefTm4SZ
 M4QezYqRzloFC5YAKwyeQ2CUpHOKpAntevFdyLuncwSSDoW1QxrtZwFvl0FuJ8ymds1A
 aYxb+HTUAWODKJawptxoD6qRgyqzeoq2aFjfcRmXCN7ezB60QhkYXfY9Geq8CAdY4Wrb
 P5+A==
X-Gm-Message-State: ACrzQf2xLkWZ8XajAcjAey/MeGpPScQH172ZZkX1gd6MhaHYwz7Xpmbx
 QSvTmSTWuk2TN0rSt01N6ChpdcYUGAfX7Rkak0w=
X-Google-Smtp-Source: AMsMyM4QI3NFuVE7jbBezi07MGbAGIS9C9tKu5xGC7qUD5zpzZDmKPoRQqBKf/+Vgo5GQ82PidRigAnXTNg7EXsNC5c=
X-Received: by 2002:a17:90b:2bd3:b0:203:1a03:6b1b with SMTP id
 ru19-20020a17090b2bd300b002031a036b1bmr5041786pjb.58.1663871199819; Thu, 22
 Sep 2022 11:26:39 -0700 (PDT)
MIME-Version: 1.0
References: <20220922124306.34729-1-dev@pschenker.ch>
 <20220922124306.34729-4-dev@pschenker.ch>
In-Reply-To: <20220922124306.34729-4-dev@pschenker.ch>
From: Adrien Grassein <adrien.grassein@gmail.com>
Date: Thu, 22 Sep 2022 20:26:28 +0200
Message-ID: <CABkfQAG0ADPnJZAPBhq0ks-FCCNDw6qz4o+PBHniuqv+kiwSmg@mail.gmail.com>
Subject: Re: [PATCH 3/4] drm/bridge: lt8912b: fix corrupted image output
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
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Le jeu. 22 sept. 2022 =C3=A0 14:43, Philippe Schenker <dev@pschenker.ch> a =
=C3=A9crit :
>
> From: Francesco Dolcini <francesco.dolcini@toradex.com>
>
> Correct I2C address for the register list in lt8912_write_lvds_config(),
> these registers are on the first I2C address (0x48), the current
> function is just writing garbage to the wrong registers and this creates
> multiple issues (artifacts and output completely corrupted) on some HDMI
> displays.
>
> Correct I2C address comes from Lontium documentation and it is the one
> used on other out-of-tree LT8912B drivers [1].
>
> [1] https://github.com/boundarydevices/linux/blob/boundary-imx_5.10.x_2.0=
.0/drivers/video/lt8912.c#L296
>
> Fixes: 30e2ae943c26 ("drm/bridge: Introduce LT8912B DSI to HDMI bridge")
> Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
> Signed-off-by: Philippe Schenker <philippe.schenker@toradex.com>
Acked-by: Adrien Grassein <adrien.grassein@gmail.com>
> ---
>
>  drivers/gpu/drm/bridge/lontium-lt8912b.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/b=
ridge/lontium-lt8912b.c
> index 6a4bb7422176..5968f4af190b 100644
> --- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
> +++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
> @@ -188,7 +188,7 @@ static int lt8912_write_lvds_config(struct lt8912 *lt=
)
>                 {0x03, 0xff},
>         };
>
> -       return regmap_multi_reg_write(lt->regmap[I2C_CEC_DSI], seq, ARRAY=
_SIZE(seq));
> +       return regmap_multi_reg_write(lt->regmap[I2C_MAIN], seq, ARRAY_SI=
ZE(seq));
>  };
>
>  static inline struct lt8912 *bridge_to_lt8912(struct drm_bridge *b)
> --
> 2.37.3
>
