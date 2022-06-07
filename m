Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC59E53F4BB
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 05:53:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5257410E535;
	Tue,  7 Jun 2022 03:53:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23850112409
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 03:53:33 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id x62so21252660ede.10
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 20:53:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=h9MYKKs/mJS+dU49Ti3eZNlPXCXQtAudLKZ8OLFcffA=;
 b=e9VbSeOCyEGjSQuSXdWov23lcUaa1hJW/SEIpwIOXE6fNVSX8c/Qt6bwyFkCeYPj9f
 uZW1lHKHA7fAtkOVLd1mMLlNa3MmsEZ/OPZJAB+swfy/rxucVBgV0XYauth+RpKvfaIb
 ropuFGAd3HkulfYd5v05AsPc/dwrCVLv4B6ec=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=h9MYKKs/mJS+dU49Ti3eZNlPXCXQtAudLKZ8OLFcffA=;
 b=nB9X92vcCR003vOtlbChqGWQLk3R3cVwhrgrJP2tmRF/ReTZ45Fe2WWcX9YggivsvT
 Gs/4Rf4o9ydNtlRbgm5YYncuq2NSw2FCajzTbFBjpXi/2fWDrcJaemyqonJPxZH04DNN
 22yQXjswItu4Xm0f+0iQhqvgjv7d6r5tFwG0GZEN2DHpvY80Pe07fy1KVG+1/Hd6pm65
 nAZvh2EP9Mx0wCMWBuJCeNwF0sDXlSdIpGocDojLQ1iR6lzSt717k3EofveKDy88KX0T
 46r5gzPONft5MeO9YwlJHtGGakeZI+EqpQs9lw/WzaUb//AL7s/GLwhx8b6Lk0gBvB0q
 WGlw==
X-Gm-Message-State: AOAM532tWXtke1t9G5UY8tG+0MNYdUKiVtAgKIph/WElpoWhbZcm8KV9
 joJeUTscvlEDlKnJTAw3BY9Sfz5KLs7X3+IYIexjhw==
X-Google-Smtp-Source: ABdhPJwMJmYgnaR1jsEKX6HTo0Z7AD7f403tUj53vA5Pnco+78VKLJxJeaCB3D1cQJzbQS+707mem4Du4cc4ZrC/TJM=
X-Received: by 2002:a05:6402:149:b0:431:7dde:9b59 with SMTP id
 s9-20020a056402014900b004317dde9b59mr3404884edu.339.1654574011578; Mon, 06
 Jun 2022 20:53:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-9-hsinyi@chromium.org>
 <Yp5WFA2H52nHVP3d@ravnborg.org>
In-Reply-To: <Yp5WFA2H52nHVP3d@ravnborg.org>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 7 Jun 2022 11:53:04 +0800
Message-ID: <CAJMQK-gZDR5QmJD4hbn2waB7ej7tmShObrhLMaHii6BSDcozrA@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/mediatek: Config orientation property if panel
 provides it
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
Cc: Rob Clark <robdclark@chromium.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, Hans de Goede <hdegoede@redhat.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 7, 2022 at 3:31 AM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Hsin-Yi,
>
> On Mon, Jun 06, 2022 at 11:24:31PM +0800, Hsin-Yi Wang wrote:
> > Panel orientation property should be set before drm_dev_register().
> > Mediatek drm driver calls drm_dev_register() in .bind(). However, most
> > panels sets orientation property relatively late, mostly in .get_modes()
> > callback, since this is when they are able to get the connector and
> > binds the orientation property to it, though the value should be known
> > when the panel is probed.
> >
> > Let the drm driver check if the remote end point is a panel and if it
> > contains the orientation property. If it does, set it before
> > drm_dev_register() is called.
>
> I do not know the best way to do what you need to do here.
> But it seems wrong to introduce a deprecated function
> (drm_of_find_panel_or_bridge), to set the rotation property early.
>
How about of_drm_find_panel()?

> I think you need to find a way to do this utilising the panel_bridge or
> something.
>
>         Sam
>
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 10 ++++++++++
> >  1 file changed, 10 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index d9f10a33e6fa..c56282412bfa 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -185,6 +185,7 @@ struct mtk_dsi {
> >       struct drm_encoder encoder;
> >       struct drm_bridge bridge;
> >       struct drm_bridge *next_bridge;
> > +     struct drm_panel *panel;
> >       struct drm_connector *connector;
> >       struct phy *phy;
> >
> > @@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >               ret = PTR_ERR(dsi->connector);
> >               goto err_cleanup_encoder;
> >       }
> > +
> > +     /* Read panel orientation */
> > +     if (dsi->panel)
> > +             drm_connector_set_panel_orientation(dsi->connector,
> > +                             drm_panel_get_orientation(dsi->panel));
> > +
> >       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> >       return 0;
> > @@ -837,6 +844,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
> >       struct drm_device *drm = data;
> >       struct mtk_dsi *dsi = dev_get_drvdata(dev);
> >
> > +     /* Get panel if existed */
> > +     drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
> > +
> >       ret = mtk_dsi_encoder_init(drm, dsi);
> >       if (ret)
> >               return ret;
> > --
> > 2.36.1.255.ge46751e96f-goog
