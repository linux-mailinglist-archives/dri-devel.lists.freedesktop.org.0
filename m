Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 41F8142403E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 16:38:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03EE76E520;
	Wed,  6 Oct 2021 14:38:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3FD86E520
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 14:38:08 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id x8so1771695plv.8
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 07:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=toLyWHJoJkqQuDAZVFULHYbRpC2a7rc7kGdAA2+Ap/s=;
 b=mVPihte4nNC4HRWd0T8Meut0fAjfGNtNA7RausOda4tccFPymGrBrrbTD3CVEXT+/v
 0W4rLwA3e+2oyjIicx2PNnb6OFI0hCeMzhmb7Mh4SvkLltLrR19eCPHkjxM7QsHGrrgp
 X/LWbHc15suenyx/NWkH5SKkPkOTvEIQdk61eZyxoHlW+H7ARUa6AsGEdl3NxHSv+kc+
 NgHzIPG00DIqFpkcdRlj3fGqPm/sNwF2vbtx+n9HpGXGpgwl1YCk87S7Yp1RibMvvv0/
 W2zT3lQNYK8xIBAb4zzTXcvKho/RqHy5BduZs1jUg+9wn+fGuyeU5GmNgOfS22LXRZ2+
 4IxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=toLyWHJoJkqQuDAZVFULHYbRpC2a7rc7kGdAA2+Ap/s=;
 b=F54mx6DA/09RKxj8FRMglNhrsx/VMnRSyQCML2KH0VCXLOP6AI3uagfnep8KYMmEY6
 u7+XOEtb+lKNhlK4LZ6Tztfe6iG3oETlWpgKMtGlrO81TTIxEwKp3UcaLbOO6zg4eKj/
 lzmVxQ5zK0t6q9aCrOh8u+bMme+E6/PyrmGJbWHY4RMc5OYGkMEo46vmP3lNGYmwf8z0
 eI0HCqQoC1WL0U7zKW5PIblA/Hs6UjZNYix1jjav7iFQBqlVAEIQ1F85WvC+St620oyX
 JDhdSjAFlIHu6ZJrGRJgbxWayOR+9GG9P735iuycoTH3/VSLeBL9wb/0OWAK2pyxVlUt
 aVaw==
X-Gm-Message-State: AOAM532Mbz8kQ63d97Ni+S6cRkdQRgHzmSsRBeHONPWFJYj/YxKbBe1Z
 JQxd6ItaaAzrY/Msy7ujTVUooOXwJD/2X5AwRT4yfA==
X-Google-Smtp-Source: ABdhPJx8mP/OwNbvhWWP4VGkIO5MMyQ5lT9Ik+rPv2z3iR4KzszFq2vst4ng5UxZBSxFiBEyYWOnoN0tfDi5SmlYqOw=
X-Received: by 2002:a17:90b:4c0d:: with SMTP id
 na13mr11553703pjb.232.1633531088484; 
 Wed, 06 Oct 2021 07:38:08 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1632828477.git.agx@sigxcpu.org>
 <0c214b69fba08f40372b2add044892fcb0ed9c35.1632828477.git.agx@sigxcpu.org>
In-Reply-To: <0c214b69fba08f40372b2add044892fcb0ed9c35.1632828477.git.agx@sigxcpu.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Oct 2021 16:37:57 +0200
Message-ID: <CAG3jFyteqcPNZqrFsggCrnpDfsGGQvibfHBezW+1Hcf3-z91QQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/5] drm: mxsfb: Print failed bus format in hex
To: =?UTF-8?Q?Guido_G=C3=BCnther?= <agx@sigxcpu.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Marek Vasut <marex@denx.de>,
 Stefan Agner <stefan@agner.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, 
 NXP Linux Team <linux-imx@nxp.com>, Thierry Reding <thierry.reding@gmail.com>, 
 Sam Ravnborg <sam@ravnborg.org>, Ondrej Jirman <megous@megous.com>, 
 Lucas Stach <l.stach@pengutronix.de>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 28 Sept 2021 at 14:16, Guido G=C3=BCnther <agx@sigxcpu.org> wrote:
>
> media-bus-formats.h has them in hexadecimal as well so matching with
> that file saves one conversion when debugging.
>
> Signed-off-by: Guido G=C3=BCnther <agx@sigxcpu.org>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mx=
sfb_kms.c
> index af6c620adf6e..d6abd2077114 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -89,7 +89,7 @@ static void mxsfb_set_formats(struct mxsfb_drm_private =
*mxsfb,
>                 ctrl |=3D CTRL_BUS_WIDTH_24;
>                 break;
>         default:
> -               dev_err(drm->dev, "Unknown media bus format %d\n", bus_fo=
rmat);
> +               dev_err(drm->dev, "Unknown media bus format 0x%x\n", bus_=
format);
>                 break;
>         }

Reviewed-by: Robert Foss <robert.foss@linaro.org>
