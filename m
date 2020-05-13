Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A68501D1B4B
	for <lists+dri-devel@lfdr.de>; Wed, 13 May 2020 18:41:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4970B89E33;
	Wed, 13 May 2020 16:41:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62F8089E33
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 16:41:03 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id p12so297426qtn.13
 for <dri-devel@lists.freedesktop.org>; Wed, 13 May 2020 09:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Of6DuVfllLEJKZni4Ai4vipcUdfNzlQ6+FZgLgcsMF8=;
 b=ehOQ0f61ejewm2g+6SEOb8DS6voX1jKlEAKsoRPlJRIIFmbPMjaaoPGNrQLjj3ZK4w
 hepeE8/r99wWaPmbogTTG7Ujhx8Di0mHpuuPhQE2unfc1UhiQiu6Q3QrZIpmOMuv6E97
 F+xMDkcQOEEjl0OQOqReOKAB2mWDFPN2LEFmfLNwdfXI4RA8iuoL+aBebyrP0d7h1tvs
 XpEa5UoXed4Q8b2c1IDNtjFndFuYyMQZzCznKxs5pofbHgpMmu3aOmTehGln+XUVUmN0
 jOaeqf/ZGDI+PVcrkjgJC0H0KMdQX3JTkTYYECXWD+Mdugahf5Jz5tZpneOUtIIEWU8a
 BcAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Of6DuVfllLEJKZni4Ai4vipcUdfNzlQ6+FZgLgcsMF8=;
 b=tUS3SSEAGdfqg8/3AkTSg3YTOd9WBoP+mspVcZaOFvZJw2oYPbKyLB2RQ5b5VFQO/c
 APop0CjMgI3NrLSPa25AVL6rZ8KQy7YktCwE+CUtkTFxo2gVen22DxMP+oEiEE+1KZd8
 gntK4/aJGlKQ4Duku7rLEXksHE79vYR+7ty/qJcf5fyHVXWTHN78s/sFTGZYdCHtnkDO
 ppZFX76o3Mca02V+MszJcJ6xt1g9GSJLFh7QWL5JtB6OeMTUAhiYgnFXwyltop5Jp5nf
 NXuGhrI8k/PolnADTocFaPb19k5+37lBU4vdq7aejC6k3881i9oNmHf0Jg9gh6uYEWRn
 EKFw==
X-Gm-Message-State: AGi0PuZQ5/Hn5ZvjpEno1qX4GNRcJU6NOdXttdhoL8uD2JvH2p6Tvlqn
 9JkUbSBiP/71iRgFCMF+M31B/tAEhTEXBzvg+cU=
X-Google-Smtp-Source: APiQypKQF8wuPkIB/Ht0f9sQIUQaXRfVgczFyL9sDMRdp1ebZgYPB8wvKrKrbVS6PA73SGgLiaV98lH5IaSqDqzX4fc=
X-Received: by 2002:ac8:739a:: with SMTP id t26mr27687484qtp.311.1589388061575; 
 Wed, 13 May 2020 09:41:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200501152335.1805790-1-enric.balletbo@collabora.com>
 <20200501152335.1805790-8-enric.balletbo@collabora.com>
In-Reply-To: <20200501152335.1805790-8-enric.balletbo@collabora.com>
From: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Wed, 13 May 2020 18:40:50 +0200
Message-ID: <CAFqH_53h=3OXzwLnw1XT3rHYkMPOPNFBdQdPeFmNubN9qq_Twg@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/mediatek: mtk_dsi: Create connector for bridges
To: Enric Balletbo i Serra <enric.balletbo@collabora.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Collabora Kernel ML <kernel@collabora.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Chun-Kuang,

Missatge de Enric Balletbo i Serra <enric.balletbo@collabora.com> del
dia dv., 1 de maig 2020 a les 17:25:
>
> Use the drm_bridge_connector helper to create a connector for pipelines
> that use drm_bridge. This allows splitting connector operations across
> multiple bridges when necessary, instead of having the last bridge in
> the chain creating the connector and handling all connector operations
> internally.
>
> Signed-off-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

A gentle ping on this, I think that this one is the only one that
still needs a review in the series.

Thanks,
 Enric

> ---
>
> Changes in v4: None
> Changes in v3:
> - Move the bridge.type line to the patch that adds drm_bridge support. (Laurent Pinchart)
>
> Changes in v2: None
>
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index 4f3bd095c1ee..471fcafdf348 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -17,6 +17,7 @@
>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_bridge.h>
> +#include <drm/drm_bridge_connector.h>
>  #include <drm/drm_mipi_dsi.h>
>  #include <drm/drm_of.h>
>  #include <drm/drm_panel.h>
> @@ -183,6 +184,7 @@ struct mtk_dsi {
>         struct drm_encoder encoder;
>         struct drm_bridge bridge;
>         struct drm_bridge *next_bridge;
> +       struct drm_connector *connector;
>         struct phy *phy;
>
>         void __iomem *regs;
> @@ -977,10 +979,19 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>          */
>         dsi->encoder.possible_crtcs = 1;
>
> -       ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL, 0);
> +       ret = drm_bridge_attach(&dsi->encoder, &dsi->bridge, NULL,
> +                               DRM_BRIDGE_ATTACH_NO_CONNECTOR);
>         if (ret)
>                 goto err_cleanup_encoder;
>
> +       dsi->connector = drm_bridge_connector_init(drm, &dsi->encoder);
> +       if (IS_ERR(dsi->connector)) {
> +               DRM_ERROR("Unable to create bridge connector\n");
> +               ret = PTR_ERR(dsi->connector);
> +               goto err_cleanup_encoder;
> +       }
> +       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> +
>         return 0;
>
>  err_cleanup_encoder:
> --
> 2.26.2
>
>
> _______________________________________________
> Linux-mediatek mailing list
> Linux-mediatek@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-mediatek
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
