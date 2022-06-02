Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D053B4C5
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 10:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A73112B50;
	Thu,  2 Jun 2022 08:07:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F694112B4E
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 08:07:42 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id n28so5227980edb.9
 for <dri-devel@lists.freedesktop.org>; Thu, 02 Jun 2022 01:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6vMm0s7j0BfbtfCeMoENN6g/p67B/T0t3t4wSxuqZsM=;
 b=DI8Qpx5MUleXyJ2zO6eq3/ipbnYwVyicYJxvtCHB4bW/NNet9TE+jNgXo7Te/Aq2I2
 c22ngnKAO/z05MJNo7ip81+yZNAoAljWGXdJ/0HnFmQKM8d79/N/jHiXev8FO/bOcD2s
 I+T6C2nlL6+p975fZBs+A8JYFVY5lgarzQQr8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6vMm0s7j0BfbtfCeMoENN6g/p67B/T0t3t4wSxuqZsM=;
 b=Awt7VarEbSyU34O8tt1lPpw4LBhYwPfT9AnxfudfSrfELqTPyOQgC6pEO2T3itJqht
 s2DgiuYcELo8l+9G6YIqeE5jzDWv3a8Tbi81xxs8qgUmvN+Zgcb6PHKRttoNikWWyF32
 AyBXq0VcGZENicXaU28rOl9DHht+DhS9u+dJ/IfQkfx0glBDoSHyYR67uFtPwbvT4hgo
 tbfxF2fEmPonV3n62ERb78+5eJAQuDrYyYUBdM1dd3G52nmqJPqYO1F7W32L9IGBzLfo
 BfRngKdzfG8IKFfv2AtRpCIcB/vcH6KGPKwBrwZOFqY0osqoksIsXfi7aks6x8ReFP2y
 ZDnQ==
X-Gm-Message-State: AOAM5321PWKr1rhOBWyVvLDh1es57NgJ2V3TfweLpUsKE4u2hmIVQz9x
 iZlWF8UWLh3lKIxCIX/E38EfE+N1oMjyToUdYpFgDA==
X-Google-Smtp-Source: ABdhPJwYzmq6Zn5Gn969SIbPrVPQEWs30Q+k4IKGlmSfcZd8DLQuZbom06x50wb0uWfPTopTH5Z9bOVJGvu44uXetIM=
X-Received: by 2002:a05:6402:1d50:b0:42b:6da9:ed34 with SMTP id
 dz16-20020a0564021d5000b0042b6da9ed34mr3934330edb.333.1654157260875; Thu, 02
 Jun 2022 01:07:40 -0700 (PDT)
MIME-Version: 1.0
References: <20220601094637.1200634-1-hsinyi@chromium.org>
 <044158674aab0b40d8edcac920855a37fca58cf0.camel@mediatek.com>
In-Reply-To: <044158674aab0b40d8edcac920855a37fca58cf0.camel@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Thu, 2 Jun 2022 16:07:14 +0800
Message-ID: <CAJMQK-gyJbNBgot3NqSQP5xEb5LtFrk5A9mPQOcntEvxncsmRg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Add a panel API to return panel orientation
To: CK Hu <ck.hu@mediatek.com>
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
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 2, 2022 at 4:03 PM CK Hu <ck.hu@mediatek.com> wrote:
>
> Hi, Hsin-Yi:
>
> I'm curious that panel driver setting orientation in get_modes() would
> work or not. It it works, why not just set orientation in get_modes()?
> I find that exynos dsi driver has implement the get_modes() [1] but
> Mediatek dsi does not implement. Would you try this?

It's explained in the cover letter:
```
Panels usually call drm_connector_set_panel_orientation(), which is
later than drm/kms driver calling drm_dev_register(). This leads to a
WARN()[1].
```
If the get_modes() in dsi is still being called later than bind(),
then the same issue still appears.
The purpose is to set the property before drm_dev_register().



>
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/gpu/drm/exynos/exynos_drm_dsi.c?h=v5.18#n1483
>
> Regards,
> CK
>
> On Wed, 2022-06-01 at 17:46 +0800, Hsin-Yi Wang wrote:
> > Panels usually call drm_connector_set_panel_orientation(), which is
> > later than drm/kms driver calling drm_dev_register(). This leads to a
> > WARN()[1].
> >
> > The orientation property is known earlier. For example, some panels
> > parse the property through device tree during probe.
> >
> > The series add a panel API drm_panel_get_orientation() for drm/kms
> > drivers. The drivers can use the API to get panel's orientation, so
> > they
> > can call drm_connector_set_panel_orientation() before
> > drm_dev_register().
> >
> > Panel needs to implement .get_orientation callback to return the
> > property.
> >
> > [1]
> > https://urldefense.com/v3/__https://patchwork.kernel.org/project/linux-mediatek/patch/20220530081910.3947168-2-hsinyi@chromium.org/__;!!CTRNKA9wMg0ARbw!0ytf4wPxKANnYbw_fgq-eqQARnAXIHv4jwu04ZW6X6dAxZDFsJ0CltY_PvCBAQ$
> >
> >
> > Hsin-Yi Wang (8):
> >   drm/panel: Add an API drm_panel_get_orientation() to return panel
> >     orientation
> >   drm/panel: boe-tv101wum-nl6: Implement .get_orientation callback
> >   drm/panel: panel-edp: Implement .get_orientation callback
> >   drm/panel: lvds: Implement .get_orientation callback
> >   drm/panel: panel-simple: Implement .get_orientation callback
> >   drm/panel: ili9881c: Implement .get_orientation callback
> >   drm/panel: elida-kd35t133: Implement .get_orientation callback
> >   drm/mediatek: Config orientation property if panel provides it
> >
> >  drivers/gpu/drm/drm_panel.c                    |  8 ++++++++
> >  drivers/gpu/drm/mediatek/mtk_dsi.c             | 10 ++++++++++
> >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-edp.c              |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-elida-kd35t133.c   |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-ilitek-ili9881c.c  |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-lvds.c             |  8 ++++++++
> >  drivers/gpu/drm/panel/panel-simple.c           |  9 +++++++++
> >  include/drm/drm_panel.h                        | 10 ++++++++++
> >  9 files changed, 77 insertions(+)
> >
>
