Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16AB26A41AF
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 13:28:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42BD210E3F4;
	Mon, 27 Feb 2023 12:28:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084EA10E3F4
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 12:28:16 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-536bbef1c5eso170271197b3.9
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 04:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=WwR6ZSekWbBuT7yj7OTRMClZyQccVnFXtI1dVPMFqqU=;
 b=Emc8xQxFSXMvSrm+i70nSvGeFZesVg4lDXPcqr+1kCyqci31jAiQYw/aHaeWi8Vh8f
 kVjiEWCuWvT2FYubxbZLPn6BSb5MnpuCwwn7cERSb7IActXOShQ0Ge9DBO2IPsFXEyRa
 Ir8VVHVN3q9oSupSQe0W1W4HNo1pKt2k2NHW4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WwR6ZSekWbBuT7yj7OTRMClZyQccVnFXtI1dVPMFqqU=;
 b=P9L+RUeSDUocYLoB9t57gtkfk2WQM5FxjLMvvgr/jA5+arCjIPIaXa5n+wQ8LpgVFO
 EVtIPxfpPzHO9lDAqE8QFmo1MNV6V5pDKhg1Qw3gGZO07WfkkbrMuIm0qp9ZdiaW2Uob
 AalNp/r4b1A2CeNRbIyiVv2YYz/HhCivYiQvREnyIJ6CwMLZ3gUezmfG67xAjAGS8EnR
 UeIlqjJztAd21sosA7j6eIpznRJogDOb4ApXI9qtf7Tz8ufkyDlvyAFD84RoujBGuL67
 ktGPGVfcvBMMbxJllUKWACEPCZRQ+/uSbMM3Wt4mAQhXj59KW27CJpvkJ3EIBZtw9WSo
 +DJg==
X-Gm-Message-State: AO0yUKWV+nK0lVtVwDm8m0eBAHDYs3mmDGYla8E5fOzLHBEdmKqR+eWL
 73fetDaOqEVRFtUStTRUWNPHpZL81aB0y+H4dRY6TQ==
X-Google-Smtp-Source: AK7set/J1/v6xMiecz4aEizWMrNP2r+5Uo6EjVIK1FJeWxI5ysPY4sPzBtm5HepMje66xHgnhJKxP8ZzBK4nloEmtfE=
X-Received: by 2002:a81:ac60:0:b0:52a:92e9:27c1 with SMTP id
 z32-20020a81ac60000000b0052a92e927c1mr10155528ywj.10.1677500895190; Mon, 27
 Feb 2023 04:28:15 -0800 (PST)
MIME-Version: 1.0
References: <20230227113925.875425-1-jagan@amarulasolutions.com>
 <20230227113925.875425-3-jagan@amarulasolutions.com>
 <20230227121149.c3ibajgog3i2s2ek@houat>
In-Reply-To: <20230227121149.c3ibajgog3i2s2ek@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 27 Feb 2023 17:58:03 +0530
Message-ID: <CAMty3ZDt64C0dv2=wVcaCLdZVFU2u6D4EKswuoqEjvByKyMseg@mail.gmail.com>
Subject: Re: [PATCH v13 02/18] drm: bridge: panel: Support nodrm case for
 drmm_panel_bridge_add
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Marek Vasut <marex@denx.de>, linux-samsung-soc@vger.kernel.org,
 Matteo Lisi <matteo.lisi@engicam.com>, dri-devel@lists.freedesktop.org,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, NXP Linux Team <linux-imx@nxp.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Adam Ford <aford173@gmail.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 27, 2023 at 5:41 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Mon, Feb 27, 2023 at 05:09:09PM +0530, Jagan Teki wrote:
> > drmm_panel_bridge_add DRM-managed action helper is useful for the bridge
> > which automatically removes the bridge when drm pointer is cleaned.
> >
> > Supporting the same on non-component bridges like host DSI bridge requires
> > a drm pointer which is indeed available only when a panel-bridge is found.
> >
> > For these use cases, the caller would call the drmm_panel_bridge_add by
> > passing NULL to drm pointer.
> >
> > So, assign the bridge->dev to drm pointer for those cases.
> >
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> > Changes for v13:
> > - new patch
> >
> > Note: use case on
> > "[PATCH v13 04/18] drm: exynos: dsi: Switch to DSI panel or bridge find helper"
> >
> >  drivers/gpu/drm/bridge/panel.c | 7 +++++++
> >  1 file changed, 7 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
> > index d4b112911a99..45a0c6671000 100644
> > --- a/drivers/gpu/drm/bridge/panel.c
> > +++ b/drivers/gpu/drm/bridge/panel.c
> > @@ -402,6 +402,13 @@ struct drm_bridge *drmm_panel_bridge_add(struct drm_device *drm,
> >       if (IS_ERR(bridge))
> >               return bridge;
> >
> > +     /*
> > +      * For non-component bridges, like host DSI bridge the DRM pointer
> > +      * can be available only when a panel-bridge is found.
> > +      */
> > +     if (!drm)
> > +             drm = bridge->dev;
> > +
>
> Why can't the caller use bridge->dev?

The first step of drmm_panel_bridge_add is to find the panel-bridge,
so we can only get bridge->dev after this step. The caller doesn't
know anything about the panel bridge it just sends a panel pointer to
find the panel-bridge and then assigns bridge->dev to drm for DRM
action.

Please check this patch about the caller,
https://patchwork.kernel.org/project/dri-devel/patch/20230227113925.875425-5-jagan@amarulasolutions.com/

>
> Also, where did the devm_drm_of_dsi_get_bridge go? I thought you were
> going to convert it to a drm-managed version?

Look like your suggestion to can't use devm_drm_of_dsi_get_bridge and
call the DRM-action from the driver, that is the reason I have removed
this and done the same as your previous inputs.
https://lore.kernel.org/all/20230203110437.otzl2azscbujigv6@houat/

Jagan.
