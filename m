Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C87E706608
	for <lists+dri-devel@lfdr.de>; Wed, 17 May 2023 13:05:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6580810E02B;
	Wed, 17 May 2023 11:05:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976C310E02B
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 11:05:07 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-ba76528fe31so8477462276.1
 for <dri-devel@lists.freedesktop.org>; Wed, 17 May 2023 04:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1684321506; x=1686913506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=f/0gQgYqRuMuJwK1HCJXl/1oAzn1fx03WmCmc25oohc=;
 b=oq02hkTKUnnixI4jNHxsj43M3DOYL4409vzTHJlBnC5dOtuu9q+AuDtRkncdBb30ML
 E6rD+KaA3bdTaTWMu7MH1oUydS4CuRCCPxNvfmF/22eTcCnAAGcyOS8/wa2KORttgl6e
 4JvfdX+yriGtnzCQSttuNuLF1JnyqjTpWFNvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684321506; x=1686913506;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=f/0gQgYqRuMuJwK1HCJXl/1oAzn1fx03WmCmc25oohc=;
 b=HJl8YVLvvCsEmzIuwCfcTwnOdLp7vklStDbSLCjVcZC/0LmPZAfyAl8yZg2xTpP/RU
 OlHEo69Cd0Wz2eiRU4O9npp6J31w3l9iYdNkzrbR9y/YZVPGqlq8fFpjxwIkyDrIcW2+
 uoz2vk1plFHET6jK2MIeBjzoblHiwQG5D/Jg8fB+B0NCYnx1DPUtTe9wS9mmHQZjD/sp
 dARkG5ZJ8iSlq8W1dMEH5Qd8S1Ldz3rwWPNBvaNeGhL64EsgPtpKgfJlat8pmY/zvUxc
 LmwiKvLtmdQ8r5fooekyyOVEHXVyRRXcJdSYC0r64MdHPqWJbFA5S0vrRMVDABTng6gA
 UnJQ==
X-Gm-Message-State: AC+VfDzUhq7dP6rmpSvp4LIyEnVCtj1iw3CO4QCqckFZN609VKpRebp6
 U+jTHpKSgawStDBi5mqB70awfXeZT+ot7r5sJoh7bA==
X-Google-Smtp-Source: ACHHUZ5WzbcltoYcBGwDo35dpjPWGwvHa0MuRLE3dPu6YZ22z9zqTPIAYUi4zrb5SdoB93c/+P4gzQ0EWN1h0Eo2OfY=
X-Received: by 2002:a25:324a:0:b0:b9e:67ab:4f36 with SMTP id
 y71-20020a25324a000000b00b9e67ab4f36mr1299048yby.10.1684321506246; Wed, 17
 May 2023 04:05:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230515235713.232939-1-aford173@gmail.com>
 <20230515235713.232939-5-aford173@gmail.com>
In-Reply-To: <20230515235713.232939-5-aford173@gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 17 May 2023 16:34:54 +0530
Message-ID: <CAMty3ZAU3NG8yk1dFB4Y3QtCZ7j7XUTqKHkJVKhhOduc4V5XpQ@mail.gmail.com>
Subject: Re: [PATCH V6 4/6] drm: bridge: samsung-dsim: Select
 GENERIC_PHY_MIPI_DPHY
To: Adam Ford <aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Adam,

On Tue, May 16, 2023 at 5:27=E2=80=AFAM Adam Ford <aford173@gmail.com> wrot=
e:
>
> In order to support variable DPHY timings, it's necessary
> to enable GENERIC_PHY_MIPI_DPHY so phy_mipi_dphy_get_default_config
> can be used to determine the nominal values for a given resolution
> and refresh rate.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>
> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/gpu/drm/bridge/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kcon=
fig
> index f076a09afac0..82c68b042444 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -227,6 +227,7 @@ config DRM_SAMSUNG_DSIM
>         select DRM_KMS_HELPER
>         select DRM_MIPI_DSI
>         select DRM_PANEL_BRIDGE
> +       select GENERIC_PHY_MIPI_DPHY

Is it really required? phy is optional as it is not required for
imx8mm/n/p as of now. May be we can add it while supporting it.

Thanks,
Jagan.
