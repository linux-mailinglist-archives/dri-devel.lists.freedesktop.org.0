Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E061E53F7AE
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 09:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9D010E3F5;
	Tue,  7 Jun 2022 07:53:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4786310E3F5
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 07:53:59 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id w27so21812801edl.7
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jun 2022 00:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bTcKUvKBFqx0lJtGawmW30NCfuDMQMt7XlkJoMiwP40=;
 b=BRcrqvdcJ8xhPPgG0bBbVBAiVx5+b1kxVRYTF+auAqOwaNxiSEJIGoWo2Vw1NSQv+g
 m+QFnkk9OCc0qPYzLEDDAl6JIeZKI2nmJ3WKE52P77RWJopLhG0nlii3OGBErGC4aljv
 V5z+8qwkVzCJGQbsGoFZmWoLE7owrtk67FYI4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bTcKUvKBFqx0lJtGawmW30NCfuDMQMt7XlkJoMiwP40=;
 b=F0STDKe/k1AwjJcTSNG+FzMyM5pxrJK+dfvLOhPzscYRmfvSgbNbd4tqgWo9x0q6/B
 l9QLQSpkWJfMB5bkWMbV08W1062aosKRh4DjnemkYrfAzHeuKaoUvQg5j2GfgeqnNTF9
 ZG2L+KfvDTcoJtVBAWfhcxcKmKf+WTlU2LnLqm3N2zsnLFMDT7u4HToBPxPn6LQkV456
 7+TEJgX8991bRr3YBoaFq8Doq4W77eeHc3hjFTp7ZOb9XnncLVF4lkzdBbcUsKdMq/Ul
 dfPZapqZQx3gJy4idYOQ51Fj6ZQcMd1KdsAbz9U7lnKV6Q1hg4WbTAara5HF3BsrjUtA
 QW6w==
X-Gm-Message-State: AOAM533xxuOfXfbcYbiCBDxx8UMgcLP3wekmcXJ8x5/0qO0Wy8C1oTxo
 AyxoxcChmkw3ltwquzxbNCQi4e2pQ1kAKTQQB2kudg==
X-Google-Smtp-Source: ABdhPJxwDZlNTB+YxaMW6ZNNbb9evKtxWWCIjvCP63mUZOd90Ckf8Jn8me1MaQylI36w6ArAMzXiudnaT/5dtDqKCfQ=
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id
 f1-20020a056402194100b004132b5f9074mr32019311edz.414.1654588437586; Tue, 07
 Jun 2022 00:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220606152431.1889185-1-hsinyi@chromium.org>
 <20220606152431.1889185-2-hsinyi@chromium.org>
 <CAE-0n52mzczUdtwUgfdNOC_V7kBGhzFWHRT=QHDoH4kN+yCMGA@mail.gmail.com>
In-Reply-To: <CAE-0n52mzczUdtwUgfdNOC_V7kBGhzFWHRT=QHDoH4kN+yCMGA@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Tue, 7 Jun 2022 15:53:31 +0800
Message-ID: <CAJMQK-joqHaJeTNurzecmXcZ_eiK+24Tc0ok2zcFdUNXz3TQmQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/8] drm/panel: Add an API drm_panel_get_orientation()
 to return panel orientation
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

On Tue, Jun 7, 2022 at 3:06 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Hsin-Yi Wang (2022-06-06 08:24:24)
> > diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
> > index f634371c717a..e12056cfeca8 100644
> > --- a/drivers/gpu/drm/drm_panel.c
> > +++ b/drivers/gpu/drm/drm_panel.c
> > @@ -223,6 +223,15 @@ int drm_panel_get_modes(struct drm_panel *panel,
> >  }
> >  EXPORT_SYMBOL(drm_panel_get_modes);
> >
> > +enum drm_panel_orientation drm_panel_get_orientation(struct drm_panel *panel)
>
> Should 'panel' be marked const to indicate that it can't be modified?
>

But .get_orientation() will need to call to_XXX_panel, eg.
static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)

==> .get_modes(panel) <-- can't be const.
==> drm_panel_get_orientation(panel) <-- can't be const.

We can definitely cast it in the functions, or make to_XXX_panel()
accept const, but I think this will lose the meaning of using const
anyway.

> > +{
> > +       if (panel && panel->funcs && panel->funcs->get_orientation)
> > +               return panel->funcs->get_orientation(panel);
