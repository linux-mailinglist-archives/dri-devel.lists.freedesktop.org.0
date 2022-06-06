Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A582553E571
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 17:26:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EDFF112498;
	Mon,  6 Jun 2022 15:26:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6492D112498
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 15:26:27 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id u12so29663256eja.8
 for <dri-devel@lists.freedesktop.org>; Mon, 06 Jun 2022 08:26:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=g0CfqZDZnQGiX6/HBvu3FZf3i9OJ+2C0+13cUpQYRZM=;
 b=fLRQ3/QA1wNcb4MXDUqS4aU+HWo7LVK33bo5FNY/J5Vg95iJWBLdAyFukFxriEzpwA
 jjcSJ6rwdgTWTIyuUdKJrao/n19sdCT5gry7LauyyQwURqAJr2MEeE+aJDVRB1g8mNuJ
 gLH9M5JMHkqEzr4X3juuMpuGvpbhqKX7daMNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=g0CfqZDZnQGiX6/HBvu3FZf3i9OJ+2C0+13cUpQYRZM=;
 b=dmOnqVGIKwb5CfjRFwMYlSfGSzlentbWhpZJ923R21cm7C8r/aArOXG05ams555M2g
 MRJ8PJhYSa2EQM1n43Qy3Cj/hFv275T10HuZjjHvUSCLLoZz2X6JGcu+b8MMmuBKQMo2
 uNvaAyV+kfC59u86qGKwkb6yse8lH//AJ7dxxCQ7DHzRD9vk0i28lWn61XvAIY1XtT97
 1wLbjVeP0Yi6NjNzZ3zFUE8ZhQo3vbn8Scja+Axu7AQf6pLa0hVDuQ0wk4+VwT1dKWZ7
 LXsUVhyUQtb660cWQ7fBi9Wxgc3XNtguQCxZUXCcNRABRpZwWGC0OFuQ7NRgj3NMmTCd
 bP7Q==
X-Gm-Message-State: AOAM533kzxhm/eMJPH5lrZDBxwxbyfrLsHy9EpA4qIeqPM4j89AT2koI
 gcXNsFbrdhZI95/SDLTE0/exKPXqrYmcJaqQh0vpSQ==
X-Google-Smtp-Source: ABdhPJwoDpT6S3WSY8htZrD/zFlYO0O4+g2JDXZf4OQeXUukmweb7201Svj1Dc8HJysdoeWK939TEdsLvzykBknOAiY=
X-Received: by 2002:a17:906:9b46:b0:711:1f7e:36f8 with SMTP id
 ep6-20020a1709069b4600b007111f7e36f8mr10222093ejc.746.1654529183491; Mon, 06
 Jun 2022 08:26:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220606044720.945964-1-hsinyi@chromium.org>
 <20220606044720.945964-2-hsinyi@chromium.org>
 <CAD=FV=V7FmkJyyXr4C6jy9-hOhnzgoo=g5tx_3z3rnCCC40Exg@mail.gmail.com>
In-Reply-To: <CAD=FV=V7FmkJyyXr4C6jy9-hOhnzgoo=g5tx_3z3rnCCC40Exg@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 6 Jun 2022 23:25:57 +0800
Message-ID: <CAJMQK-ic2fGfyEaJp5By1dNRJYy7Qwes4gQWADD5Sf=Z5zgafg@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
To: Doug Anderson <dianders@chromium.org>
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

On Mon, Jun 6, 2022 at 10:21 PM Doug Anderson <dianders@chromium.org> wrote:
>
> Hi,
>
> On Sun, Jun 5, 2022 at 9:47 PM Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Panels usually call drm_connector_set_panel_orientation(), which is
> > later than drm/kms driver calling drm_dev_register(). This leads to a
> > WARN().
> >
> > The orientation property is known earlier. For example, some panels
> > parse the property through device tree during probe.
> >
> > Add an API to return the property from panel to drm/kms driver, so the
> > drivers are able to call drm_connector_set_panel_orientation() before
> > drm_dev_register().
> >
> > Suggested-by: Hans de Goede <hdegoede@redhat.com>
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> > ---
> > v2->v3: no change
> > ---
> >  drivers/gpu/drm/drm_panel.c |  8 ++++++++
> >  include/drm/drm_panel.h     | 10 ++++++++++
> >  2 files changed, 18 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index f634371c717a..4a512ca80673 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -223,6 +223,14 @@ int drm_panel_get_modes(struct drm_panel *panel,
> >  }
> >  EXPORT_SYMBOL(drm_panel_get_modes);
> >
> > +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
> > +{
> > +       if (panel && panel->funcs && panel->funcs->get_orientation)
> > +               return panel->funcs->get_orientation(panel);
> > +
> > +       return DRM_MODE_PANEL_ORIENTATION_UNKNOWN;
> > +}
> > +EXPORT_SYMBOL(drm_panel_get_orientation);
> >  #ifdef CONFIG_OF
>
> nit: there used to be a blank line before the #ifdef but there no
> longer is after your patch.
>
Added in v4.
> Other than that...
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
