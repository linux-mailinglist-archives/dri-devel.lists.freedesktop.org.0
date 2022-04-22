Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5954650B9D9
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 16:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 198BE10EB58;
	Fri, 22 Apr 2022 14:16:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3377B10EB58
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 14:16:21 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id j8so11119230pll.11
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 07:16:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=mhiX9pOS55YaO3CdrDwpUy6BkzPbq10Xj73NWvQBwAg=;
 b=vRUi3XTt6AzV9QlheY6fezduSTcEh/sZN3k+dAddNZiw8rhhyhbGXtJLNYs3J/UwD5
 bRx0NNWnHM1TYIelLSIgCtSpmnbMKDgukzfetN9iXKdtLRwPXB54SYzt6H400lsd3P4D
 ++PGiqJSRNedibPs1CaxKSPMQyTwkUYyruCII4+3lOh3uWSvP8+idLkPjw5BBA8QJsEi
 kvO8DlCiTkUMJj9c+3Kb4kPubeS7hxUdkzPshkGtiJXpeZOSSMzbk6sHBs+4HmVJPMRp
 e9Uz5m7trgk2XIsiSCfl29aZ0LqcmQ7ZWTP8PJh4RgMon1aGFHXpRKjuAUHuYVAvcCcH
 noKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mhiX9pOS55YaO3CdrDwpUy6BkzPbq10Xj73NWvQBwAg=;
 b=fpp7LAyiZFLd3Hc/a1NAJ0VRuWwZJdIIPXuzeiqz1X7VMb6mCd90T4hpJTB4EFHvUF
 s/4RAX2TbiwO3kRu4wey1/d5RN7jfuO5vL18K/CVgAsA+WXbN6gox9mTYJC9m8HOXnJx
 dksnr1CSCPMmV+oQ6YB/BWTGHoTx+UPggVtPZ8g+iP/0PI9gqsxSA2ITN8JI8pmfJQ+T
 9Zj/3nAQjn+YvO66DW0gJKXsg5ec9nvoFBlwjJMIudZotIqdEv9egU7WNIDShe/u9goT
 zdkizzR1kSYzR4adiUFqZ2MsEF0zBOXDQfCrJZ6ItfYwjT0FkyAOSO8ojm6wSqVLRWi/
 qitw==
X-Gm-Message-State: AOAM533DPaQEGA5+aIgWh4uTMVD/tLPmpfOBZOFxD6tEHhR4IrfCWdAV
 1L7EhoPxP04NJ1XKemVX5fcckeody8Xj7Sd1f0KJFA==
X-Google-Smtp-Source: ABdhPJz8CXOzCAMrumvED5/FUzZpCHykjU/HdiKEagzluI2x9YcnPtdeO8E7Knfq/KSP3T5vLQuff5phq8eDfMmbJXk=
X-Received: by 2002:a17:903:2352:b0:159:3fa:261 with SMTP id
 c18-20020a170903235200b0015903fa0261mr4632628plh.21.1650636980753; Fri, 22
 Apr 2022 07:16:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220419010852.452169-1-victor.liu@nxp.com>
 <20220419010852.452169-2-victor.liu@nxp.com>
In-Reply-To: <20220419010852.452169-2-victor.liu@nxp.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Fri, 22 Apr 2022 16:16:09 +0200
Message-ID: <CAG3jFyvAjzHaA_BUJYj18Y-FbY5ROd3iXetAJ+BJaoEjZd6vsQ@mail.gmail.com>
Subject: Re: [PATCH resend v8 1/5] drm/bridge: nwl-dsi: Set PHY mode in
 nwl_dsi_mode_set()
To: Liu Ying <victor.liu@nxp.com>
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
Cc: narmstrong@baylibre.com, airlied@linux.ie, agx@sigxcpu.org,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 andrzej.hajda@intel.com, linux-phy@lists.infradead.org,
 martin.kepplinger@puri.sm, jernej.skrabec@gmail.com, kishon@ti.com,
 linux-imx@nxp.com, robert.chiras@nxp.com, devicetree@vger.kernel.org,
 kernel@pengutronix.de, jonas@kwiboo.se, s.hauer@pengutronix.de,
 robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, vkoul@kernel.org, krzk+dt@kernel.org,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 19 Apr 2022 at 03:07, Liu Ying <victor.liu@nxp.com> wrote:
>
> The Northwest Logic MIPI DSI host controller embedded in i.MX8qxp
> works with a Mixel MIPI DPHY + LVDS PHY combo to support either
> a MIPI DSI display or a LVDS display.  So, this patch calls
> phy_set_mode() from nwl_dsi_mode_set() to set PHY mode to MIPI DPHY
> explicitly.
>
> Cc: Guido G=C3=BCnther <agx@sigxcpu.org>
> Cc: Robert Chiras <robert.chiras@nxp.com>
> Cc: Martin Kepplinger <martin.kepplinger@puri.sm>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: NXP Linux Team <linux-imx@nxp.com>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7->v8:
> * Resend with Andrzej's and Jernej's mail addressed updated.
>
> v6->v7:
> * No change.
>
> v5->v6:
> * Rebase the series upon v5.17-rc1.
> * Set PHY mode in ->mode_set() instead of ->pre_enable() in the nwl-dsi
>   bridge driver due to the rebase.
> * Drop Guido's R-b tag due to the rebase.
>
> v4->v5:
> * No change.
>
> v3->v4:
> * No change.
>
> v2->v3:
> * No change.
>
> v1->v2:
> * Add Guido's R-b tag.
>
>  drivers/gpu/drm/bridge/nwl-dsi.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/nwl-dsi.c b/drivers/gpu/drm/bridge/nw=
l-dsi.c
> index d5945501a5ee..85bab7372af1 100644
> --- a/drivers/gpu/drm/bridge/nwl-dsi.c
> +++ b/drivers/gpu/drm/bridge/nwl-dsi.c
> @@ -666,6 +666,12 @@ static int nwl_dsi_mode_set(struct nwl_dsi *dsi)
>                 return ret;
>         }
>
> +       ret =3D phy_set_mode(dsi->phy, PHY_MODE_MIPI_DPHY);
> +       if (ret < 0) {
> +               DRM_DEV_ERROR(dev, "Failed to set DSI phy mode: %d\n", re=
t);
> +               goto uninit_phy;
> +       }
> +
>         ret =3D phy_configure(dsi->phy, phy_cfg);
>         if (ret < 0) {
>                 DRM_DEV_ERROR(dev, "Failed to configure DSI phy: %d\n", r=
et);
> --
> 2.25.1
>

Acked-by: Robert Foss <robert.foss@linaro.org>
