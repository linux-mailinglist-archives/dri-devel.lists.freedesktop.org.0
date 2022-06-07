Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FFAA54027C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 17:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DAD10EB32;
	Tue,  7 Jun 2022 15:32:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C90B10EB32
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 15:32:36 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id n28so23500874edb.9
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 08:32:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8mWAcxmdEaXtXEf9bkpBT1dXxrFHE82EQI8/Jd/D+m0=;
 b=GPfz/jg87i8Zik3e8kzVXPFh+GLz9PHfv82fQeGPkCn0GfiS5QUaw/pZFKY3MMdomI
 /LuGFP+pL0A4/djAMIc8djgLEpFxw3hqlfiemCoHbAJraq7EEdYsE7sHKSJQfkCWxDhT
 erwf8YK192cyUffD1u6jI914YqFVstgnWVijI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8mWAcxmdEaXtXEf9bkpBT1dXxrFHE82EQI8/Jd/D+m0=;
 b=3NH0NT52EDGCgm6NDZ6X+yoaSq7+Gr5M5qMVoKS3T7rTNCn4IpO36oKWykF5E6JyaA
 ozL6fKjxKkJYouo0KEL0c9AF4FBpKOSEb7lb3hA7U304BS/WCWeWZz9YfMVyYFxyDUpz
 nynkvqrOy9bOOANi+9ZLRF7MEj27URCUuJJgxsVIdF66H517mUHd4sKv5BGAEeXlnwBb
 8Cnowe3PGAyehAuMFMIasV9689F8Upml1DrmcWyFfQlJI7TZsTuGsiNXbRObYBJM1YCy
 H8o9ge8kL3B00I4JTZt+uNA4aIHOHbXaUZ2J2iLwCGUJfU1Tenwm77r6gXLqsTQcmWjs
 0nLA==
X-Gm-Message-State: AOAM532JhSx1RMrChRM973kOB16BKsKcx05btaa0Od6rLgYKDmga06vl
 54vOV6qZqZgQz62Ms4xKeKiB2ErXnfV4hB0b
X-Google-Smtp-Source: ABdhPJzZFjxtFl0Ic9bmrBihqYM4qrm6cWUmsFSKNmemiKRrsdj5BvSI8ZyxyGtnFbYVTZFcp1uiqg==
X-Received: by 2002:a05:6402:120b:b0:42f:aa44:4d85 with SMTP id
 c11-20020a056402120b00b0042faa444d85mr24741829edw.338.1654615954072; 
 Tue, 07 Jun 2022 08:32:34 -0700 (PDT)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com.
 [209.85.221.49]) by smtp.gmail.com with ESMTPSA id
 c24-20020a056402159800b0042617ba63c2sm10675892edv.76.2022.06.07.08.32.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Jun 2022 08:32:32 -0700 (PDT)
Received: by mail-wr1-f49.google.com with SMTP id q15so16658628wrc.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 08:32:32 -0700 (PDT)
X-Received: by 2002:a5d:608d:0:b0:218:3cfa:afe9 with SMTP id
 w13-20020a5d608d000000b002183cfaafe9mr12177876wrt.422.1654615951748; Tue, 07
 Jun 2022 08:32:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220607090549.2345795-1-hsinyi@chromium.org>
 <20220607090549.2345795-9-hsinyi@chromium.org>
In-Reply-To: <20220607090549.2345795-9-hsinyi@chromium.org>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 7 Jun 2022 08:32:19 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Xe=iEh080QjE+Awgw0Q+Rb=xnrAj6OtO3EXp==XgvD0g@mail.gmail.com>
Message-ID: <CAD=FV=Xe=iEh080QjE+Awgw0Q+Rb=xnrAj6OtO3EXp==XgvD0g@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Hsin-Yi Wang <hsinyi@chromium.org>
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 LKML <linux-kernel@vger.kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Tue, Jun 7, 2022 at 2:06 AM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> Panel orientation property should be set before drm_dev_register().
> Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> panels sets orientation property relatively late, mostly in .get_modes()
> callback, since this is when they are able to get the connector and
> binds the orientation property to it, though the value should be known
> when the panel is probed.
>
> Let the drm driver check if the remote end point is a panel and if it
> contains the orientation property. If it does, set it before
> drm_dev_register() is called.
>
> Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
> v4->v5:
> - use the new function in v5.
> - don't use drm_of_find_panel_or_bridge().
> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> index d9f10a33e6fa..998b1237e193 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -185,6 +185,7 @@ struct mtk_dsi {
>         struct drm_encoder encoder;
>         struct drm_bridge bridge;
>         struct drm_bridge *next_bridge;
> +       struct drm_panel *panel;
>         struct drm_connector *connector;
>         struct phy *phy;
>
> @@ -822,6 +823,10 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
>                 ret = PTR_ERR(dsi->connector);
>                 goto err_cleanup_encoder;
>         }
> +
> +       /* Read panel orientation */
> +       drm_connector_set_orientation_from_panel(dsi->connector, dsi->panel);
> +
>         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
>
>         return 0;
> @@ -836,6 +841,16 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
>         int ret;
>         struct drm_device *drm = data;
>         struct mtk_dsi *dsi = dev_get_drvdata(dev);
> +       struct device_node *panel_node;
> +
> +       /* Get panel if existed */
> +       panel_node = of_graph_get_remote_node(dev->of_node, 0, 0);
> +       if (panel_node) {
> +               dsi->panel = of_drm_find_panel(panel_node);
> +               if (IS_ERR(dsi->panel))
> +                       dsi->panel = NULL;
> +               of_node_put(panel_node);
> +       }

While the above works, it feels like we could do better. What about this?

* We add _some_ way to determine if a bridge is actually a
panel_bridge. If nothing else maybe this could be
drm_bridge_is_panel() and it could just check if bridge.funcs ==
panel_bridge_bridge_funcs

* In drm_bridge_connector_init(), when we're looping through all the
bridges we find the panel_bridge if it's there.

* At the end of drm_bridge_connector_init() if we found a panel_bridge
then we call a function like drm_panel_bridge_set_orientation().


Then you can fully get rid of the mediatek patch, right? The above
will only work if you're using a panel_bridge / bridge_connector, but
that's "the future" anyway and we want to encourage people to
transition to that.

-Doug
