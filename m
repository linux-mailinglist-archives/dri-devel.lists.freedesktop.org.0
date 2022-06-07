Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78C1653F49C
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 05:38:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C8311B273;
	Tue,  7 Jun 2022 03:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B27A889B5F
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 03:38:30 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id fu3so31088957ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 20:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lJ9t0JsMzf9+b8G+NsrCGuGZ2WHm7yJdraWRSfiKGkA=;
 b=luqlEGHcZ3EsuUaCVY6GMNpFf/WWxyuViWZVeRqUEErf9I9VtVM1lds0X9kadOzOJN
 cszTD9YoVUoRI7Y7blXJ11oo9McRcIKLzrEKA7N554p76iZLgY8Rd3ITfDBweQcSXSEp
 ZvIHkSGHIxEHuVqKNxRubd5d5H8shRx58lWHE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lJ9t0JsMzf9+b8G+NsrCGuGZ2WHm7yJdraWRSfiKGkA=;
 b=E6LrDL2Pqparugw6KdUNiNfSjQK2hqs6cJhSxVvT+X4f8IXnnANTcqXO277KgXMS8+
 wqVG+qYTxqNKQw4Fo635Ov+1ZDOrnGkqiM6Jwxha8op9YNzKOorKNYtJ1AF7NTos7gXp
 VFOBUq9TKv8JCm7dG7YaCDzsNQq2Bbc0ZFPbgduXCZW7TGzHpbHmlPRMcWfT2BojhAp4
 dlbd75RiBvGSkSK0Gt8f+37csHa2OIAqbLTn/n7z4PUv1ZtXoxP61QBbnB8aWq0eKrtc
 B3UvHezO63B7uaUZqzQw+Vj/HBsiCm+6/NNNRaDyYq/yJitDz4HdGuJ7deJu69wGQLD/
 67Eg==
X-Gm-Message-State: AOAM533bmTkJDO1W9MEQZt6YaN1IqTknTluLuqLj4gwm7kKeLSWqkUGS
 oQde3oZVPcgHYiaI8b1q8NA+WAbv/uu5P8jTYVZ9yg==
X-Google-Smtp-Source: ABdhPJxvmyTN4ySZ5rqR9pOFJ1zEcnVcYm+SktOdEe+JR5rDOKDREJpcaAfPg15x/AOi9cNPiXshMUiWFFvhktMChtw=
X-Received: by 2002:a17:907:868f:b0:702:f865:55de with SMTP id
 qa15-20020a170907868f00b00702f86555demr24650686ejc.24.1654573109183; Mon, 06
 Jun 2022 20:38:29 -0700 (PDT)
MIME-Version: 1.0
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-9-hsinyi@chromium.org>
 <CAE-0n51Lq381dQW6zw3D0fibdj=Jm4r3uAYG59ySo4CXbx+EpA@mail.gmail.com>
In-Reply-To: <CAE-0n51Lq381dQW6zw3D0fibdj=Jm4r3uAYG59ySo4CXbx+EpA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 7 Jun 2022 11:46:24 +0800
Message-ID: <CAJMQK-hoKB+W4AY8trW-ni145oxde4ot1_z+d6sbxGrbQ6aMig@mail.gmail.com>
Subject: Re: [PATCH v4 8/8] drm/mediatek: Config orientation property if panel
 provides it
To: Stephen Boyd <swboyd@chromium.org>
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
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jun 7, 2022 at 3:16 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Hsin-Yi Wang (2022-06-06 08:24:31)
> > diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > index d9f10a33e6fa..c56282412bfa 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> > @@ -822,6 +823,12 @@ static int mtk_dsi_encoder_init(struct drm_device *drm, struct mtk_dsi *dsi)
> >                 ret = PTR_ERR(dsi->connector);
> >                 goto err_cleanup_encoder;
> >         }
> > +
> > +       /* Read panel orientation */
> > +       if (dsi->panel)
> > +               drm_connector_set_panel_orientation(dsi->connector,
> > +                               drm_panel_get_orientation(dsi->panel));
> > +
>
> It could be simplified like so?
>
>         drm_connector_set_orientation_from_panel(dsi->connector, dsi->panel);
>
> Then the API could get the orientation if the panel pointer is valid.
> Does any code need to use/modify the orientation value besides
> drm_connector_set_panel_orientation()?
>

We can add another function to call
drm_connector_set_orientation_from_panel(), which will be like

void drm_connector_set_orientation_from_panel(connector, panel)
{
     if (panel)
          drm_connector_set_panel_orientation(connector,drm_panel_get_orientation(panel));
}

Though it's very should but I can add this if this can make the caller
more convenient.

> >         drm_connector_attach_encoder(dsi->connector, &dsi->encoder);
> >
> >         return 0;
