Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF6D58E92F
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 10:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F02D9AFB1A;
	Wed, 10 Aug 2022 08:58:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com
 [IPv6:2607:f8b0:4864:20::b29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBBBAFC43
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 08:58:45 +0000 (UTC)
Received: by mail-yb1-xb29.google.com with SMTP id 7so22303234ybw.0
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Aug 2022 01:58:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=2PmnQy9U1/lt+p+l2hFrCjWUU3aQ4y+M/PEcXE/12/M=;
 b=hVE1t++rCxMZhMYt1GawIULran/IylUDFqwBk5nwsKqUWql6L/107UrX2s/XV8Pc2C
 vw1FUcNtVohHQvJCzGpzIv+buAz/wncXboJPMlqZU4tVdYhtpjNl0SCDNkxPB8FMSxAy
 HNYbwUDS682oyFo6612DPRKU3JaUm1s+pmxjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=2PmnQy9U1/lt+p+l2hFrCjWUU3aQ4y+M/PEcXE/12/M=;
 b=HfvEYlRyKJRmfF5lFZ/nkLoFqyfNuSnH8mRC+Jzi1xpD9HdZvkPAhfQfa64rUUlzSy
 sauC8D7+VO5XJHNfNRU7rfbH6VuPdimZ45T6ceQ0CUplF4OgAIljCiMMTEsmGzCC/4oK
 7VMFfMzhku7VUMMvyzuYb+WrkTDAMkU+T9eD+yhse+VvVUH7D+7lm/4xIY49oZH6pAy8
 H3A2pv11uqvshDBoalFmsCzA4qPyIM7rIRpskcWW+CmO/4sAG00eZhhORRyWtg+YSoAi
 VGS4mDvB15bdNa46Uxs2lrpnlp0i09YoOR4GImO26NRnq6HFEraRaNDiBoL+3mQPmMVB
 cZhg==
X-Gm-Message-State: ACgBeo2e3a0LbmnPagfH30WnF2TrwBZMECLeXncKRimpmM9ADyNQD2C5
 pKhkCHOGRgfItGzUuYUuQ/8aKNDVvIydBtEcYJRmjg==
X-Google-Smtp-Source: AA6agR4MsGGUtyoBj/+yfnuqG/nZkrPYAXn5jSRB3Z0SE44kHwOP2tZOVpF2oR9/x9/29h2lTYjFz3mqg67VAFwVp4Y=
X-Received: by 2002:a25:cec6:0:b0:671:72cf:f585 with SMTP id
 x189-20020a25cec6000000b0067172cff585mr24617848ybe.201.1660121924228; Wed, 10
 Aug 2022 01:58:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220726033058.403715-1-xji@analogixsemi.com>
 <9385f8642e6ad5491a036360c644dc21b9a3f009.camel@mediatek.com>
In-Reply-To: <9385f8642e6ad5491a036360c644dc21b9a3f009.camel@mediatek.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 10 Aug 2022 16:58:18 +0800
Message-ID: <CAJMQK-injwWcNVC-niYTgbFQ3R6yOMGkSX+vAuwWAEiMhhft3Q@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: Support HDMI_I2S audio format
To: Jiaxin Yu <jiaxin.yu@mediatek.com>
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
 linux-kernel@vger.kernel.org, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, bliang@analogixsemi.com,
 Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Jul 26, 2022 at 5:16 PM Jiaxin Yu <jiaxin.yu@mediatek.com> wrote:
>
> On Tue, 2022-07-26 at 11:30 +0800, Xin Ji wrote:
> > 1. Support HDMI_I2S audio format.
> > 2. Return 0 if there is no sink connection in .hw_param callback.
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 23 +++++++++++++++++--
> > ----
> >  1 file changed, 17 insertions(+), 6 deletions(-)
> >
> Acked-by: Jiaxin Yu<jiaxin.yu@mediatek.com>
Acked-by: Hsin-Yi Wang <hsinyi@chromium.org>

> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 79fc7a50b497..c74b5df4cade 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1797,8 +1797,13 @@ static int anx7625_audio_hw_params(struct
> > device *dev, void *data,
> >       int wl, ch, rate;
> >       int ret = 0;
> >
> > -     if (fmt->fmt != HDMI_DSP_A) {
> > -             DRM_DEV_ERROR(dev, "only supports DSP_A\n");
> > +     if (anx7625_sink_detect(ctx) == connector_status_disconnected)
> > {
> > +             DRM_DEV_DEBUG_DRIVER(dev, "DP not connected\n");
> > +             return 0;
> > +     }
> > +
> > +     if (fmt->fmt != HDMI_DSP_A && fmt->fmt != HDMI_I2S) {
> > +             DRM_DEV_ERROR(dev, "only supports DSP_A & I2S\n");
> >               return -EINVAL;
> >       }
> >
> > @@ -1806,10 +1811,16 @@ static int anx7625_audio_hw_params(struct
> > device *dev, void *data,
> >                            params->sample_rate, params->sample_width,
> >                            params->cea.channels);
> >
> > -     ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > -                                 AUDIO_CHANNEL_STATUS_6,
> > -                                 ~I2S_SLAVE_MODE,
> > -                                 TDM_SLAVE_MODE);
> > +     if (fmt->fmt == HDMI_DSP_A)
> > +             ret = anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > +                                        AUDIO_CHANNEL_STATUS_6,
> > +                                        ~I2S_SLAVE_MODE,
> > +                                        TDM_SLAVE_MODE);
> > +     else
> > +             ret = anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
> > +                                        AUDIO_CHANNEL_STATUS_6,
> > +                                        ~TDM_SLAVE_MODE,
> > +                                        I2S_SLAVE_MODE);
> >
> >       /* Word length */
> >       switch (params->sample_width) {
>
