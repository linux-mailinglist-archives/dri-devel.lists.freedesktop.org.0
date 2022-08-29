Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EAF05A4EA5
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 15:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AC3410F1BA;
	Mon, 29 Aug 2022 13:56:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A268B10EE16
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 13:56:43 +0000 (UTC)
Received: by mail-ej1-x635.google.com with SMTP id y3so15891225ejc.1
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=UUksF+3n6Z6Vv7as77dwd1d0dIdOzku40fVIFRcpS7c=;
 b=JLJrEW14rZu3r0yKDTDdvyLTSmBNqOHlW7ZywpZIP1o0qAEyH5F9NQr7NFwTlgc22t
 VmWmnFwSyaLF3H53dnP824wq4kmM0miMR1kIVGcPeoCWh0e+X2leRLa+w3rqY7vbd+Sq
 49t0I7NOUMoHJusEbcoVvIa7Z34nTIutqNEPB3GGFmdT/RKmBKXJPHjpbuAd14fseYLf
 yH00hqz0aoIJkKVG6fmEDWvrg158TwSG3dFofmIN7b1jS44kdASevUngYMhtx+qrudU1
 l4YpLgE5HLrVjLcBy9JXvz9ZimkdehoWkkW5QGR+OS86gcqn16vIkFW+a8gJLhorMbet
 qU/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=UUksF+3n6Z6Vv7as77dwd1d0dIdOzku40fVIFRcpS7c=;
 b=pZOwzBa/8WUk0fSB8H1S9aB4LirSlb2txfSfM5MH7rPjBgZIctbeOy159RRwXVnlY7
 ZHemNu4Da66ClV+UKfTQxpI4p0qm7Cm0cTUovehOvXf3fmdwRCVATDDNnGoORlXrqqZt
 3geCxSn4opsO6UzqXO6Qylw/pGf6PTIaJkv92pg1NcI+juGF49Iq3ANkPvWTaiQjWBu7
 mWoUCvsf4nintBST/30Cdv0ebmZQp1ix+xYS4Ss+DvbLDiz6pvvhyFY5n90oREDCW41h
 zsWvZnU9gauKbbcjJQVifhvYTccyQNAB3CUsro7JLdv2rQnuDJGAei3SsWYafW76ANtO
 EmWA==
X-Gm-Message-State: ACgBeo0L8ALlfFBBv7mBVVI98CyPASbQWo4hjnRVgaItjUzL1HtPYF/R
 KmWiyLlhM/JLDXcAoQocOeRJ3WMIrRTuRr0YVY+yUg==
X-Google-Smtp-Source: AA6agR4R1TOlwHtkdeW/5iqUgtHZjFsmMRQANoBtf5XmwzZYZOxbOMJMZJtWqslHrHmGX2eE1rwBmGuWncmdK1uZE3M=
X-Received: by 2002:a17:907:7d91:b0:731:7ecb:1e5b with SMTP id
 oz17-20020a1709077d9100b007317ecb1e5bmr13718953ejc.78.1661781402126; Mon, 29
 Aug 2022 06:56:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220726033058.403715-1-xji@analogixsemi.com>
 <9385f8642e6ad5491a036360c644dc21b9a3f009.camel@mediatek.com>
 <CAJMQK-injwWcNVC-niYTgbFQ3R6yOMGkSX+vAuwWAEiMhhft3Q@mail.gmail.com>
In-Reply-To: <CAJMQK-injwWcNVC-niYTgbFQ3R6yOMGkSX+vAuwWAEiMhhft3Q@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 29 Aug 2022 15:56:31 +0200
Message-ID: <CAG3jFysrLDQjc8d=LX4hon029to2xJOqwEyXzNOE9J3z+TJk8w@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Support HDMI_I2S audio format
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
Cc: dri-devel@lists.freedesktop.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 qwen@analogixsemi.com, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Aug 2022 at 10:58, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
>
> On Tue, Jul 26, 2022 at 5:16 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
> >
> > On Tue, 2022-07-26 at 11:30 +0800, Xin Ji wrote:
> > > 1. Support HDMI_I2S audio format.
> > > 2. Return 0 if there is no sink connection in .hw_param callback.
> > >
> > > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 23 +++++++++++++++++--
> > > ----
> > >  1 file changed, 17 insertions(+), 6 deletions(-)
> > >
> > Acked-by: Jiaxin Yu<jiaxin.yu@mediatek.com>
> Acked-by: Hsin-Yi Wang <hsinyi@chromium.org>
>
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 79fc7a50b497..c74b5df4cade 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -1797,8 +1797,13 @@ static int anx7625_audio_hw_params(struct
> > > device *dev, void *data,
> > >       int wl, ch, rate;
> > >       int ret = 0;
> > >
> > > -     if (fmt->fmt != HDMI_DSP_A) {
> > > -             DRM_DEV_ERROR(dev, "only supports DSP_A\n");
> > > +     if (anx7625_sink_detect(ctx) == connector_status_disconnected)
> > > {
> > > +             DRM_DEV_DEBUG_DRIVER(dev, "DP not connected\n");
> > > +             return 0;
> > > +     }
> > > +
> > > +     if (fmt->fmt != HDMI_DSP_A && fmt->fmt != HDMI_I2S) {
> > > +             DRM_DEV_ERROR(dev, "only supports DSP_A & I2S\n");
> > >               return -EINVAL;
> > >       }
> > >
> > > @@ -1806,10 +1811,16 @@ static int anx7625_audio_hw_params(struct
> > > device *dev, void *data,
> > >                            params->sample_rate, params->sample_width,
> > >                            params->cea.channels);
> > >
> > > -     ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > > -                                 AUDIO_CHANNEL_STATUS_6,
> > > -                                 ~I2S_SLAVE_MODE,
> > > -                                 TDM_SLAVE_MODE);
> > > +     if (fmt->fmt == HDMI_DSP_A)
> > > +             ret = anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > > +                                        AUDIO_CHANNEL_STATUS_6,
> > > +                                        ~I2S_SLAVE_MODE,
> > > +                                        TDM_SLAVE_MODE);
> > > +     else
> > > +             ret = anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > > +                                        AUDIO_CHANNEL_STATUS_6,
> > > +                                        ~TDM_SLAVE_MODE,
> > > +                                        I2S_SLAVE_MODE);
> > >
> > >       /* Word length */
> > >       switch (params->sample_width) {
> >

Applied to drm-misc-next.
