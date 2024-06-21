Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8261191230F
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 13:10:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C16310F157;
	Fri, 21 Jun 2024 11:10:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="soV1PSi7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com
 [209.85.128.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33B910F159
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 11:10:31 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-62cddff7f20so18072197b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 04:10:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718968231; x=1719573031; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=+E1WxQueOjtD6kE6cKZDHDBQDZbZc1l4ovt0rekH1Kw=;
 b=soV1PSi7/zWNL9jL5FMh2meB8fjyicf1UuafZfEQtOPcgxmpCMwCZVqPcrSNul4G7+
 rQf5N/pjvpRDIcKAU1qDY7/zgOsa5jmPhUKDrcjHptHasTQZjErdIUYBmXQ2ScbqcCq/
 UIWQCbIJI9DbYiwGuRKjZfWsNXlo8/I3ZySs7pm1SC8kvifMkb8VyKjTknMXCLOVqcJ7
 GRmFX63KGgFx8PCbqmLDT594SPPG9XKnBvWy2nlTT/Ff+0KFQTpIJChCigNsTZccR74/
 OMizUESwXkz0lTrtHuDV7yW5pzXt/7V0HqHdQaz56zQHdw2EdtBxrSEvhEOcYGUFcW9Y
 NwJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718968231; x=1719573031;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+E1WxQueOjtD6kE6cKZDHDBQDZbZc1l4ovt0rekH1Kw=;
 b=PNcjMmNQOfrT2HRD/tYGqsvjyrZVJRKVmCWpuzKFBTqUVW8Vy+jPySbHtj25IrR1zv
 cyD2H8sOg2XI6peVqMW8Xqdmfdd7Ggc+8jYePNzWGqEJ8oOMmC/UbXPumEL66sB6o/UT
 USfd56ZIg4d3s4OgNgj32WA3RlMKfhy49T4QrzQsQ4yXNH/dBKi3gBBWanOJB/z7ctG5
 zBVh8fZ1YiXjRO9GeMudncCmasKmsYzZH6JdrovwTPj1rbyRdtxAaSL1z4EggBmoebsr
 MTndVWMxidtUtou+3l4x4zqjYeM8NJlMAqEXElWLrrKd6u2fcwr62xf/IJdbt96K6g8G
 aUyQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBfpVpZBkQdMcKvr59TRyOhKI2VrhoA1/+J7O4JANSSvYdLJtAyvTtmlFTMW8GFUjxZ9v/L+oqo9CAOiTBBaqa9I/66Hb6o+aKhkaUmscA
X-Gm-Message-State: AOJu0YyAAho/NMXBa/Fg0XD9Ft8OL/m2Az+5jf7e6uduj5XRBUgzbXcV
 CjOEKW8Cd+/I7A1EOYJPp8kcZpr+UW+aPI9lT66kDSh46CwhpNtMMUSDpk2nc6F7nbiZxBon80x
 hQw8jimMcgSu9+yx2gsWpMMpO1XahvG5oakVzxA==
X-Google-Smtp-Source: AGHT+IEXBAmA+PTZy09VnQ1dqNH8zl9QK3W3FwghMXSXtL+Qdc/ocbqK9PhCE4rLdN/ODpaYb6SHS4FV15K0wd/rI4s=
X-Received: by 2002:a81:87c6:0:b0:622:c964:7e24 with SMTP id
 00721157ae682-63a8e89bed9mr75983307b3.27.1718968230585; Fri, 21 Jun 2024
 04:10:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240615-drm-bridge-hdmi-connector-v1-0-d59fc7865ab2@linaro.org>
 <20240615-drm-bridge-hdmi-connector-v1-4-d59fc7865ab2@linaro.org>
 <20240621-polite-ruby-hyrax-c4020e@houat>
In-Reply-To: <20240621-polite-ruby-hyrax-c4020e@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 21 Jun 2024 14:10:22 +0300
Message-ID: <CAA8EJppryh=LR40_5cBH5+0LZdRP5bsZ9iyqHDBFdBqu_H=1=A@mail.gmail.com>
Subject: Re: [PATCH RFC 4/5] drm/bridge: connector: add support for HDMI codec
 framework
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org
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

On Fri, 21 Jun 2024 at 12:30, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sat, Jun 15, 2024 at 08:53:33PM GMT, Dmitry Baryshkov wrote:
> > Add necessary glue code to be able to use new HDMI codec framework from
> > the DRM bridge drivers. The drm_bridge implements a limited set of the
> > hdmi_codec_ops interface, with the functions accepting both
> > drm_connector and drm_bridge instead of just a generic void pointer.
> >
> > This framework is integrated with the DRM HDMI Connector framework, but
> > can also be used for DisplayPort connectors.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/drm_bridge_connector.c | 130 ++++++++++++++++++++++++++++++++-
> >  include/drm/drm_bridge.h               |  46 ++++++++++++
> >  2 files changed, 174 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> > index 0869b663f17e..71d6fdc2391f 100644
> > --- a/drivers/gpu/drm/drm_bridge_connector.c
> > +++ b/drivers/gpu/drm/drm_bridge_connector.c
> > @@ -20,6 +20,8 @@
> >  #include <drm/drm_probe_helper.h>
> >  #include <drm/display/drm_hdmi_state_helper.h>
> >
> > +#include <sound/hdmi-codec.h>
> > +
> >  /**
> >   * DOC: overview
> >   *
> > @@ -95,6 +97,14 @@ struct drm_bridge_connector {
> >        * HDMI connector infrastructure, if any (see &DRM_BRIDGE_OP_HDMI).
> >        */
> >       struct drm_bridge *bridge_hdmi;
> > +     /**
> > +      * @bridge_hdmi_codec:
> > +      *
> > +      * The bridge in the chain that implements necessary support for the
> > +      * HDMI Audio Codec infrastructure, if any (see
> > +      * &DRM_BRIDGE_OP_HDMI_CODEC).
> > +      */
> > +     struct drm_bridge *bridge_hdmi_codec;
>
> Can we have a setup where one bridge would support the video stream and
> another one the audio?
>
> I think for now I'd rather make them both provided by the same bridge,
> and we can always change that later on if we need to.

The same point here (and for your second comment): DisplayPort audio support.

-- 
With best wishes
Dmitry
