Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBA7E53A05E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 11:30:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4635310E29D;
	Wed,  1 Jun 2022 09:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA41910E29D
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 09:30:25 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id me5so1974001ejb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Jun 2022 02:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RTq2qApdr0XDjYdhICkGJiEtvpG4jeHig+budTOXpzw=;
 b=N5bZXB4HEnh1aE629ihk0RNtGOggnXdOo8MhyhV/pnh0CS3sIL/F0HjMn6dkeMJhys
 uvLvUCgQ22KIadzabZUoW8aH9DgEKYOj0O7xEDoueNU6mwjz5rjcJ9pvqB5Ab7qEQqf2
 RzK5un4TdNweT81vZseW8sNyrkZ8icMt397oM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RTq2qApdr0XDjYdhICkGJiEtvpG4jeHig+budTOXpzw=;
 b=UkSRdwebUZnePmZMr3gKDyXoPWHnorEgEzD9UYMURMgGaYettzdGvUmppUQ5dm7Qqb
 Fm94NeXsJJENlpC61h9gzSTYu8PaKAjKVObow6Fue5ElMN1EluOrLhKXZko+2rpW8qg6
 GOyBqu3CjmR+6DvyYJZi0Ro/sX4mpdQVTSQqxnnWOVkgQ+8o/PPjT5TL8il0BwznHncu
 lKN9ykOEHSTyjrgvDDZhdEWpe2+pZ374ful0DpMBjjePR1Uo1JAWUKVbqmBitDPUihCn
 l69HG0T03WnOCl3WE3ehEZ45K/UNav++m43nQq9BKQ3rR/RwOf/MndefFp44on7gIKc+
 pI0g==
X-Gm-Message-State: AOAM5321lN5KYldHzqwRKK5lTORTawtteEGjuwIspp8BXMiD/3Nmcnq4
 k9/tq7qFRq3XOcTdjO9j8NnSwgvzV8DxXFJVX0bTaQ==
X-Google-Smtp-Source: ABdhPJxO4OEEAdvJqMndbTEvHBclpdxbIJVkiSSJC2U5lu+FvyjTBUCrzqDl4iM+Hnoyelw7MdIsxnbVinBAcMcjCA0=
X-Received: by 2002:a17:907:160c:b0:6fe:c56f:751 with SMTP id
 hb12-20020a170907160c00b006fec56f0751mr46232867ejc.746.1654075824444; Wed, 01
 Jun 2022 02:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20220601081823.1038797-1-hsinyi@chromium.org>
 <20220601081823.1038797-9-hsinyi@chromium.org>
 <c890efc4-dfda-cab1-8a46-527e3e02168a@redhat.com>
In-Reply-To: <c890efc4-dfda-cab1-8a46-527e3e02168a@redhat.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 1 Jun 2022 17:29:58 +0800
Message-ID: <CAJMQK-iNFyScoh5pZkWA9cPmdmz+YNhuDH-v0fveSfCT0udZFA@mail.gmail.com>
Subject: Re: [PATCH 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Hans de Goede <hdegoede@redhat.com>
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
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 1, 2022 at 4:57 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 6/1/22 10:18, Hsin-Yi Wang wrote:
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
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> > The concept is the same as the previous version.
> > https://patchwork.kernel.org/project/linux-mediatek/patch/20220530113033.124072-1-hsinyi@chromium.org/
> > The only difference is, it now uses the panel API instead of parsing
> > orientation from the driver.
> > ---
> >  drivers/gpu/drm/mediatek/mtk_dsi.c | 14 ++++++++++++++
> >  1 file changed, 14 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index bd3f5b485085..12836a697f56 100644
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
> > @@ -822,6 +823,16 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >               ret = PTR_ERR(dsi->connector);
> >               goto err_cleanup_encoder;
> >       }
> > +
> > +     /* Read panel orientation */
> > +     if (dsi->panel) {
> > +             enum drm_panel_orientation orientation;
> > +
> > +             orientation = drm_panel_get_orientation(dsi->panel);
> > +             if (orientation != DRM_MODE_PANEL_ORIENTATION_UNKNOWN)
> > +                     drm_connector_set_panel_orientation(dsi->connector, orientation);
> > +     }
> > +
> >       drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> >       return 0;
>
> drm_connector_set_panel_orientation() is a no-op when called with
> DRM_MODE_PANEL_ORIENTATION_UNKNOWN, so the check for this is not
> necessary. This allows this to be simplified to:
>
>         /* Read panel orientation */
>         if (dsi->panel)
>                 drm_connector_set_panel_orientation(dsi->connector,
>                                                     drm_panel_get_orientation(dsi->panel));
>
>
> Note since drm_panel_get_orientation() checks for a NULL panel, you could even
> drop the "if (dsi->panel)", but I think the meaning of the code is more
> clear with that present.
>
Will update this
>
>
>
>
>
> > @@ -837,6 +848,9 @@ static int mtk_dsi_bind(struct device *dev, struct device *master, void *data)
> >       struct drm_device *drm = data;
> >       struct mtk_dsi *dsi = dev_get_drvdata(dev);
> >
> > +     /* Get panel if existed */
> > +     ret = drm_of_find_panel_or_bridge(dev->of_node, 0, 0, &dsi->panel, NULL);
> > +
>
> Check ret? or maybe not assign to ret ?    I understand some errors are expected
> so maybe something like:
>
>         if (ret && ret != -ENODEV)
>                 return ret;
>
I will choose not to assign ret. In some cases that the end point is a
bridge (not panel), since we assign NULL to the bridge, we will get
EPROBE_DEFER.

If the panel fails at this stage,
drm_connector_set_panel_orientation() is just a no-op. Let dsi still
be able to be binded.


> ?
>
> Note -ENODEV is probably not the right error the check for!
>
> Regards,
>
> Hans
>
>
>
> >       ret = mtk_dsi_encoder_init(drm, dsi);
> >       if (ret)
> >               return ret;
>
