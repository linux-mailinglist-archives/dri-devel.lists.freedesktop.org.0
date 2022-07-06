Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D31CF56885B
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B87811AB8F;
	Wed,  6 Jul 2022 12:31:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7732311AB84
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:31:33 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id w83so19783306oiw.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RcutWXTnA/WDhwPlx9qo4wsri5JOk1i2qD2fd6gm+Uo=;
 b=TQtAz7IJdH/RcgD2JhDeWupI3HpDRhSsuMv93XWEktBxg2cUnb7N6Z5TXgViCOwSNQ
 qduuM1jEM8RgHppmsUYSiMqSyP1mdaql/xEpkAdml3SJJyTp0WZ6AhON3jlOG+8xCuVz
 HRXyVUW5G9o4GUjIgLLCf5Z0OocWhVV5A8UISGzlBn6/c0dXz9MqBUYr4zr4x765O1uY
 p0eWt808Z0CAzZCyAC+XxZyLqBfXOc909/5dF55CsM4lAqsGqh9LjLt2gkXxH40JTMpA
 PfnVGOzaUEqrWd9S5oGXoMtMd99Z23/0XHDjD3JmKlPlwUptGqlnzJeExz374yecRz8o
 eyjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RcutWXTnA/WDhwPlx9qo4wsri5JOk1i2qD2fd6gm+Uo=;
 b=Mr49fP0hxcx87kxcLa3YXR8d2IEgNkLkf20wE9PKCbq3AAZ6IgQW5FYufJWwowP2N0
 3TbnXoAFMg03pf+AL2A4vEAC/P/pCFvLP7bpqeRUXrDfJBOBJtGfgTavykIvfc4gI2Q5
 u33giPcsofqfTnZ22536sFnGfBuDMMwpjaL/WGVBjiuVcHmmR1k7sS/TTBHLzn78ktM2
 RkSvA/sVzRThgtLXxRy8dVKJqGH573JMvK5cmz9uILuWu9CT+Ij24nG2ZGJ6oLqWzJ7F
 Fs2SHB0PYnhAlv6hn43TEwJjbRyuktOrB8H6hNYLQe0A4bk7EQ1GJ84RlBKbMKcRyEcG
 H3ig==
X-Gm-Message-State: AJIora/J+uFjLxgJh9VDXIKCY2hi0klPgaY54ci3HWp+eFdcfu8thuux
 dSjQHdSVy6FAitPKUnn64bSBwD2Xor6uryXg7d9l5w==
X-Google-Smtp-Source: AGRyM1tAz1H7e2uwc6cDOZT4xcEqNzp8sUNzevKJ456/ix3zpbw31abTY4nAoXKBmsfvR38p8cMuI5uKZ4Jrf3aXY6A=
X-Received: by 2002:a05:6808:14ca:b0:335:b401:9054 with SMTP id
 f10-20020a05680814ca00b00335b4019054mr20168504oiw.241.1657110692604; Wed, 06
 Jul 2022 05:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <20220629160550.433980-1-hsinyi@chromium.org>
 <20220629160550.433980-2-hsinyi@chromium.org>
 <20220706022926.GA2357796@anxtwsw-Precision-3640-Tower>
In-Reply-To: <20220706022926.GA2357796@anxtwsw-Precision-3640-Tower>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Jul 2022 14:31:21 +0200
Message-ID: <CAG3jFyu2KObuc5CiFFK=NzkE1LOTSFVoA3mNyY6r1aKs2SU3ow@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: anx7625: Convert to
 devm_i2c_new_dummy_device()
To: Xin Ji <xji@analogixsemi.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Neil Armstrong <narmstrong@baylibre.com>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hey Hsin-Yi,

On Wed, 6 Jul 2022 at 04:29, Xin Ji <xji@analogixsemi.com> wrote:
>
> Hi Hsin-Yi, thanks for your patch, looks good to me.
>
> Reviewed-by: Xin Ji <xji@analogixsemi.com>
>
> On Thu, Jun 30, 2022 at 12:05:47AM +0800, Hsin-Yi Wang wrote:
> > Simplify the resource management.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 96 +++++++----------------
> >  1 file changed, 27 insertions(+), 69 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 3710fa9ee0acd..f89e8151475f7 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -2436,82 +2436,44 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
> >  static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
> >                                             struct i2c_client *client)
> >  {
> > -     int err = 0;
> > +     struct device *dev = &ctx->client->dev;
> >
> > -     ctx->i2c.tx_p0_client = i2c_new_dummy_device(client->adapter,
> > -                                                  TX_P0_ADDR >> 1);
> > +     ctx->i2c.tx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > +                                             TX_P0_ADDR >> 1);
> >       if (IS_ERR(ctx->i2c.tx_p0_client))
> >               return PTR_ERR(ctx->i2c.tx_p0_client);
> >
> > -     ctx->i2c.tx_p1_client = i2c_new_dummy_device(client->adapter,
> > -                                                  TX_P1_ADDR >> 1);
> > -     if (IS_ERR(ctx->i2c.tx_p1_client)) {
> > -             err = PTR_ERR(ctx->i2c.tx_p1_client);
> > -             goto free_tx_p0;
> > -     }
> > +     ctx->i2c.tx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > +                                             TX_P1_ADDR >> 1);
> > +     if (IS_ERR(ctx->i2c.tx_p1_client))
> > +             return PTR_ERR(ctx->i2c.tx_p1_client);
> >
> > -     ctx->i2c.tx_p2_client = i2c_new_dummy_device(client->adapter,
> > -                                                  TX_P2_ADDR >> 1);
> > -     if (IS_ERR(ctx->i2c.tx_p2_client)) {
> > -             err = PTR_ERR(ctx->i2c.tx_p2_client);
> > -             goto free_tx_p1;
> > -     }
> > +     ctx->i2c.tx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > +                                             TX_P2_ADDR >> 1);
> > +     if (IS_ERR(ctx->i2c.tx_p2_client))
> > +             return PTR_ERR(ctx->i2c.tx_p2_client);
> >
> > -     ctx->i2c.rx_p0_client = i2c_new_dummy_device(client->adapter,
> > -                                                  RX_P0_ADDR >> 1);
> > -     if (IS_ERR(ctx->i2c.rx_p0_client)) {
> > -             err = PTR_ERR(ctx->i2c.rx_p0_client);
> > -             goto free_tx_p2;
> > -     }
> > +     ctx->i2c.rx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > +                                             RX_P0_ADDR >> 1);
> > +     if (IS_ERR(ctx->i2c.rx_p0_client))
> > +             return PTR_ERR(ctx->i2c.rx_p0_client);
> >
> > -     ctx->i2c.rx_p1_client = i2c_new_dummy_device(client->adapter,
> > -                                                  RX_P1_ADDR >> 1);
> > -     if (IS_ERR(ctx->i2c.rx_p1_client)) {
> > -             err = PTR_ERR(ctx->i2c.rx_p1_client);
> > -             goto free_rx_p0;
> > -     }
> > +     ctx->i2c.rx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > +                                             RX_P1_ADDR >> 1);
> > +     if (IS_ERR(ctx->i2c.rx_p1_client))
> > +             return PTR_ERR(ctx->i2c.rx_p1_client);
> >
> > -     ctx->i2c.rx_p2_client = i2c_new_dummy_device(client->adapter,
> > -                                                  RX_P2_ADDR >> 1);
> > -     if (IS_ERR(ctx->i2c.rx_p2_client)) {
> > -             err = PTR_ERR(ctx->i2c.rx_p2_client);
> > -             goto free_rx_p1;
> > -     }
> > +     ctx->i2c.rx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > +                                             RX_P2_ADDR >> 1);
> > +     if (IS_ERR(ctx->i2c.rx_p2_client))
> > +             return PTR_ERR(ctx->i2c.rx_p2_client);
> >
> > -     ctx->i2c.tcpc_client = i2c_new_dummy_device(client->adapter,
> > -                                                 TCPC_INTERFACE_ADDR >> 1);
> > -     if (IS_ERR(ctx->i2c.tcpc_client)) {
> > -             err = PTR_ERR(ctx->i2c.tcpc_client);
> > -             goto free_rx_p2;
> > -     }
> > +     ctx->i2c.tcpc_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > +                                             TCPC_INTERFACE_ADDR >> 1);
> > +     if (IS_ERR(ctx->i2c.tcpc_client))
> > +             return PTR_ERR(ctx->i2c.tcpc_client);
> >
> >       return 0;
> > -
> > -free_rx_p2:
> > -     i2c_unregister_device(ctx->i2c.rx_p2_client);
> > -free_rx_p1:
> > -     i2c_unregister_device(ctx->i2c.rx_p1_client);
> > -free_rx_p0:
> > -     i2c_unregister_device(ctx->i2c.rx_p0_client);
> > -free_tx_p2:
> > -     i2c_unregister_device(ctx->i2c.tx_p2_client);
> > -free_tx_p1:
> > -     i2c_unregister_device(ctx->i2c.tx_p1_client);
> > -free_tx_p0:
> > -     i2c_unregister_device(ctx->i2c.tx_p0_client);
> > -
> > -     return err;
> > -}
> > -
> > -static void anx7625_unregister_i2c_dummy_clients(struct anx7625_data *ctx)
> > -{
> > -     i2c_unregister_device(ctx->i2c.tx_p0_client);
> > -     i2c_unregister_device(ctx->i2c.tx_p1_client);
> > -     i2c_unregister_device(ctx->i2c.tx_p2_client);
> > -     i2c_unregister_device(ctx->i2c.rx_p0_client);
> > -     i2c_unregister_device(ctx->i2c.rx_p1_client);
> > -     i2c_unregister_device(ctx->i2c.rx_p2_client);
> > -     i2c_unregister_device(ctx->i2c.tcpc_client);
> >  }
> >
> >  static int __maybe_unused anx7625_runtime_pm_suspend(struct device *dev)
> > @@ -2723,8 +2685,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >       if (!platform->pdata.low_power_mode)
> >               pm_runtime_put_sync_suspend(&client->dev);
> >
> > -     anx7625_unregister_i2c_dummy_clients(platform);
> > -
> >  free_wq:
> >       if (platform->workqueue)
> >               destroy_workqueue(platform->workqueue);
> > @@ -2754,8 +2714,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
> >       if (!platform->pdata.low_power_mode)
> >               pm_runtime_put_sync_suspend(&client->dev);
> >
> > -     anx7625_unregister_i2c_dummy_clients(platform);
> > -
> >       if (platform->pdata.audio_en)
> >               anx7625_unregister_audio(platform);
> >
> > --
> > 2.37.0.rc0.161.g10f37bed90-goog

Can you fix the checkpatch --strict warnings and formatting issues in
this series?
