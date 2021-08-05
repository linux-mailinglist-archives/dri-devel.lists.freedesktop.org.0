Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 703623E1704
	for <lists+dri-devel@lfdr.de>; Thu,  5 Aug 2021 16:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B646E82E;
	Thu,  5 Aug 2021 14:32:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 496686E82E
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Aug 2021 14:32:29 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 b1-20020a17090a8001b029017700de3903so9062491pjn.1
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Aug 2021 07:32:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Hxir+KJT92ne4sjUq07glKFb4339EmPmh/a5GVlr1ko=;
 b=k3719/z8eUSedQ6lU1Ji4Phj9b5Y8l0i6R93Er8eQtkwn8oV31S9CxSR/eMF8GtlH1
 xjWqTZwBxPmQfL0Fm2rHuHHJMLShvWbTxr8VBc2YiKbAHxEuCChtZvgmN3DTD0imxKK1
 oS6rtUVkpsmk2kEb9R0U4Csl2IWbJRtZsVqSOL202172DyPqWAoK0xb58hAC+b2bk0e9
 JPaySdp1odFbAvM3gJRsak/89lSYGKrBbDzA9kH+zTUYhV0ir3IlKnGeeARonQYLnqUJ
 mRH09CtOCUWg6lmFaIZdQKUR7lM5V4gSzK5N96JNSgwEQ48WmP5e+YtBxE/j4IRuEFNi
 xYxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hxir+KJT92ne4sjUq07glKFb4339EmPmh/a5GVlr1ko=;
 b=mlmm1zh4rs5uwRuWjGrZkMi9SK9e6vvcyBeLhSGda3EO443hr1XfOVXNH33+1l00n2
 iRdQrIcRkl+1LpEGGoGZwDNDstSgBgxjULvu9pEAplWwHmlMfyM67sXZ3LT8iUioFOGP
 8xVlC2tebOiCcHbmBK8RiRIpzOffj9FUmkIN/zjNVxqLUwv5Iv1nejnGle6J0K0hFtFP
 0v0vqmvdbPCMFuadovl1NbjD6Rg88Rt0Xt0CWapH/qZ2hp8Gw0q/STpfCooyN8ueXq6+
 XpzpL68yYjYC2OaPSqSN5uc98DOdOB4k3NE7ayWq++E0Vl/pTnNNJ1NelWHQ4G2KDhUr
 sl4Q==
X-Gm-Message-State: AOAM5329XQQE5/smi1bLGfwx2IZGhKeLnVAHLmL9EtiGFuYe7z6UuUQZ
 8z9LBr0UvIuNQghxg8bjobLQTlWF/60HD6r1I0go8Q==
X-Google-Smtp-Source: ABdhPJzmKvsuXnbAiJTCr2Ie3c70evLDQtBHyeupRXjhU286jch5hsPG3GMDBTl8uNZmPk7w39U7rdBJi7Zo+CSGIZw=
X-Received: by 2002:a17:90a:604b:: with SMTP id
 h11mr4973185pjm.220.1628173948924; 
 Thu, 05 Aug 2021 07:32:28 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1628172477.git.hns@goldelico.com>
 <15187eccabf39561de226acd8be40b93503cac49.1628172477.git.hns@goldelico.com>
In-Reply-To: <15187eccabf39561de226acd8be40b93503cac49.1628172477.git.hns@goldelico.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 5 Aug 2021 16:32:17 +0200
Message-ID: <CAG3jFyu50h2oLW0U6hJSpxiKp3Hb5Ow8Ujvg2qdKRuy+uhaahw@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] drm/bridge: synopsis: Add mode_fixup and bridge
 timings support
To: "H. Nikolaus Schaller" <hns@goldelico.com>
Cc: Paul Cercueil <paul@crapouillou.net>, Rob Herring <robh+dt@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Kees Cook <keescook@chromium.org>,
 "Eric W. Biederman" <ebiederm@xmission.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Ezequiel Garcia <ezequiel@collabora.com>, 
 Harry Wentland <harry.wentland@amd.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maxime Ripard <maxime@cerno.tech>, Hans Verkuil <hverkuil-cisco@xs4all.nl>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-mips@vger.kernel.org, 
 linux-kernel <linux-kernel@vger.kernel.org>, letux-kernel@openphoenux.org, 
 Paul Boddie <paul@boddie.org.uk>, Jonas Karlman <jonas@kwiboo.se>, 
 dri-devel <dri-devel@lists.freedesktop.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Nikolaus,

Thanks for submitting this series.

On Thu, 5 Aug 2021 at 16:08, H. Nikolaus Schaller <hns@goldelico.com> wrote:
>
> From: Paul Boddie <paul@boddie.org.uk>
>
> The platform-specific configuration structure is augmented with
> mode_fixup and timings members so that specialisations of the
> Synopsys driver can introduce mode flags and bus flags.
>
> Signed-off-by: Paul Boddie <paul@boddie.org.uk>
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 16 ++++++++++++++++
>  include/drm/bridge/dw_hdmi.h              |  5 +++++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> index e7c7c9b9c646f..e8499eb11328c 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
> @@ -2810,6 +2810,19 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
>         return mode_status;
>  }
>
> +static bool
> +dw_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
> +                         const struct drm_display_mode *mode,
> +                         struct drm_display_mode *adjusted_mode)
> +{
> +       struct dw_hdmi *hdmi = bridge->driver_private;
> +
> +       if (hdmi->plat_data->mode_fixup)
> +               return hdmi->plat_data->mode_fixup(bridge, mode, adjusted_mode);
> +
> +       return true;
> +}
> +
>  static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
>                                     const struct drm_display_mode *orig_mode,
>                                     const struct drm_display_mode *mode)
> @@ -2883,6 +2896,7 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
>         .atomic_disable = dw_hdmi_bridge_atomic_disable,
>         .mode_set = dw_hdmi_bridge_mode_set,
>         .mode_valid = dw_hdmi_bridge_mode_valid,
> +       .mode_fixup = dw_hdmi_bridge_mode_fixup,

mode_fixup() has been deprecated[1] in favor of atomic_check(), care
has to be taken when switching to atomic_check() as it has access to
the full atomic commit.

Looking at this driver, it's using mode_set as well, which should be fixed.

[1] https://lore.kernel.org/dri-devel/20210722062246.2512666-8-sam@ravnborg.org/

>         .detect = dw_hdmi_bridge_detect,
>         .get_edid = dw_hdmi_bridge_get_edid,
>  };
> @@ -3364,6 +3378,8 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
>  #ifdef CONFIG_OF
>         hdmi->bridge.of_node = pdev->dev.of_node;
>  #endif
> +       if (plat_data->timings)
> +               hdmi->bridge.timings = plat_data->timings;
>
>         memset(&pdevinfo, 0, sizeof(pdevinfo));
>         pdevinfo.parent = dev;
> diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
> index 6a5716655619b..677137445d534 100644
> --- a/include/drm/bridge/dw_hdmi.h
> +++ b/include/drm/bridge/dw_hdmi.h
> @@ -8,6 +8,7 @@
>
>  #include <sound/hdmi-codec.h>
>
> +struct drm_bridge;
>  struct drm_display_info;
>  struct drm_display_mode;
>  struct drm_encoder;
> @@ -140,6 +141,10 @@ struct dw_hdmi_plat_data {
>         enum drm_mode_status (*mode_valid)(struct dw_hdmi *hdmi, void *data,
>                                            const struct drm_display_info *info,
>                                            const struct drm_display_mode *mode);
> +       bool (*mode_fixup)(struct drm_bridge *bridge,
> +                          const struct drm_display_mode *mode,
> +                          struct drm_display_mode *adjusted_mode);
> +       const struct drm_bridge_timings *timings;
>
>         /* Vendor PHY support */
>         const struct dw_hdmi_phy_ops *phy_ops;
> --
> 2.31.1
>
