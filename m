Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B05688C5
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:56:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CBD811ADF3;
	Wed,  6 Jul 2022 12:56:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com
 [IPv6:2607:f8b0:4864:20::e32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A33D11ADAE
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:56:16 +0000 (UTC)
Received: by mail-vs1-xe32.google.com with SMTP id j6so15015828vsi.0
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:56:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ftHZZjzjHuQ5RstQIIDyF6vKwdb+4jCrB5fE7wJXhXI=;
 b=OYMHe00vhSCdQKounufbbnq7t4ywQ/6Qz1qrQd965AUAXyEOlAWrR9cwKIK/kx6wc9
 dqafYJyTSY+T9AZIcn5RnkMFQ1uVu+SI2QMxoF36hlh4WBXbaOzx1n5OOeBH9ihVB3M4
 caIlT0KaYNUnbxTywtFHT8PYllnBRE0fbPRZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ftHZZjzjHuQ5RstQIIDyF6vKwdb+4jCrB5fE7wJXhXI=;
 b=vNh4PsmS2kdUMSCEkFZVU8dSg1FNzIWVdcNw543qF88gXOaBeaxnbDosfIcPwAm53i
 dz265QXb3fZTfT/KWAuxG/VK2Q/4xvggHf3HRlWI2l6qeBUvnNPE7V9D7vSTdlvSUtba
 huLzLSHmSA/L1M801Rc9mpEVTFyTEq+eb+IweUAoUloD76S1DH/OvMYnLqmV1BjZKUQc
 AUXew/Bn3ZXeuMfX7sI351sfW8bHZee7m81VzgprpaOrlOfM41AWTx/+PHN0jN6+jKdH
 f84lFqnAEQLTSxb1dRRuEO3pgDqu9FtyJEWlFfIJBrMN0KAloLW9dxjTeoSDq0YrZCxV
 ylMw==
X-Gm-Message-State: AJIora/aZIMQgGtj5d0xmXXkaIdUZbngLwqQXNz2YTjaA9hKNj27psD9
 PqhfYuFmR5c0cn0DupInqPySM/6+3X6A186z7iGt/w==
X-Google-Smtp-Source: AGRyM1v8+1lLl6CxRomPKuorDgyLBosxmWFekpHYOOEPWv1JdKZP/TrygR3Ms8/Co+uxT6oA8JlZ8VyKJzwG6s7mGJ0=
X-Received: by 2002:a67:e196:0:b0:356:f35c:a5d with SMTP id
 e22-20020a67e196000000b00356f35c0a5dmr5343260vsl.19.1657112175366; Wed, 06
 Jul 2022 05:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220629160550.433980-1-hsinyi@chromium.org>
 <20220629160550.433980-2-hsinyi@chromium.org>
 <20220706022926.GA2357796@anxtwsw-Precision-3640-Tower>
 <CAG3jFyu2KObuc5CiFFK=NzkE1LOTSFVoA3mNyY6r1aKs2SU3ow@mail.gmail.com>
In-Reply-To: <CAG3jFyu2KObuc5CiFFK=NzkE1LOTSFVoA3mNyY6r1aKs2SU3ow@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Wed, 6 Jul 2022 20:55:49 +0800
Message-ID: <CAJMQK-gaOPJeSSionbG=WXvf9adF6ZFYeWV3duqcu+3TCtfXcA@mail.gmail.com>
Subject: Re: [PATCH 1/4] drm/bridge: anx7625: Convert to
 devm_i2c_new_dummy_device()
To: Robert Foss <robert.foss@linaro.org>
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
 Andrzej Hajda <andrzej.hajda@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 6, 2022 at 8:31 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Hsin-Yi,
>
> On Wed, 6 Jul 2022 at 04:29, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > Hi Hsin-Yi, thanks for your patch, looks good to me.
> >
> > Reviewed-by: Xin Ji <xji@analogixsemi.com>
> >
> > On Thu, Jun 30, 2022 at 12:05:47AM +0800, Hsin-Yi Wang wrote:
> > > Simplify the resource management.
> > >
> > > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > > ---
> > >  drivers/gpu/drm/bridge/analogix/anx7625.c | 96 +++++++----------------
> > >  1 file changed, 27 insertions(+), 69 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > index 3710fa9ee0acd..f89e8151475f7 100644
> > > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > > @@ -2436,82 +2436,44 @@ static const struct drm_bridge_funcs anx7625_bridge_funcs = {
> > >  static int anx7625_register_i2c_dummy_clients(struct anx7625_data *ctx,
> > >                                             struct i2c_client *client)
> > >  {
> > > -     int err = 0;
> > > +     struct device *dev = &ctx->client->dev;
> > >
> > > -     ctx->i2c.tx_p0_client = i2c_new_dummy_device(client->adapter,
> > > -                                                  TX_P0_ADDR >> 1);
> > > +     ctx->i2c.tx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > > +                                             TX_P0_ADDR >> 1);
> > >       if (IS_ERR(ctx->i2c.tx_p0_client))
> > >               return PTR_ERR(ctx->i2c.tx_p0_client);
> > >
> > > -     ctx->i2c.tx_p1_client = i2c_new_dummy_device(client->adapter,
> > > -                                                  TX_P1_ADDR >> 1);
> > > -     if (IS_ERR(ctx->i2c.tx_p1_client)) {
> > > -             err = PTR_ERR(ctx->i2c.tx_p1_client);
> > > -             goto free_tx_p0;
> > > -     }
> > > +     ctx->i2c.tx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > > +                                             TX_P1_ADDR >> 1);
> > > +     if (IS_ERR(ctx->i2c.tx_p1_client))
> > > +             return PTR_ERR(ctx->i2c.tx_p1_client);
> > >
> > > -     ctx->i2c.tx_p2_client = i2c_new_dummy_device(client->adapter,
> > > -                                                  TX_P2_ADDR >> 1);
> > > -     if (IS_ERR(ctx->i2c.tx_p2_client)) {
> > > -             err = PTR_ERR(ctx->i2c.tx_p2_client);
> > > -             goto free_tx_p1;
> > > -     }
> > > +     ctx->i2c.tx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > > +                                             TX_P2_ADDR >> 1);
> > > +     if (IS_ERR(ctx->i2c.tx_p2_client))
> > > +             return PTR_ERR(ctx->i2c.tx_p2_client);
> > >
> > > -     ctx->i2c.rx_p0_client = i2c_new_dummy_device(client->adapter,
> > > -                                                  RX_P0_ADDR >> 1);
> > > -     if (IS_ERR(ctx->i2c.rx_p0_client)) {
> > > -             err = PTR_ERR(ctx->i2c.rx_p0_client);
> > > -             goto free_tx_p2;
> > > -     }
> > > +     ctx->i2c.rx_p0_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > > +                                             RX_P0_ADDR >> 1);
> > > +     if (IS_ERR(ctx->i2c.rx_p0_client))
> > > +             return PTR_ERR(ctx->i2c.rx_p0_client);
> > >
> > > -     ctx->i2c.rx_p1_client = i2c_new_dummy_device(client->adapter,
> > > -                                                  RX_P1_ADDR >> 1);
> > > -     if (IS_ERR(ctx->i2c.rx_p1_client)) {
> > > -             err = PTR_ERR(ctx->i2c.rx_p1_client);
> > > -             goto free_rx_p0;
> > > -     }
> > > +     ctx->i2c.rx_p1_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > > +                                             RX_P1_ADDR >> 1);
> > > +     if (IS_ERR(ctx->i2c.rx_p1_client))
> > > +             return PTR_ERR(ctx->i2c.rx_p1_client);
> > >
> > > -     ctx->i2c.rx_p2_client = i2c_new_dummy_device(client->adapter,
> > > -                                                  RX_P2_ADDR >> 1);
> > > -     if (IS_ERR(ctx->i2c.rx_p2_client)) {
> > > -             err = PTR_ERR(ctx->i2c.rx_p2_client);
> > > -             goto free_rx_p1;
> > > -     }
> > > +     ctx->i2c.rx_p2_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > > +                                             RX_P2_ADDR >> 1);
> > > +     if (IS_ERR(ctx->i2c.rx_p2_client))
> > > +             return PTR_ERR(ctx->i2c.rx_p2_client);
> > >
> > > -     ctx->i2c.tcpc_client = i2c_new_dummy_device(client->adapter,
> > > -                                                 TCPC_INTERFACE_ADDR >> 1);
> > > -     if (IS_ERR(ctx->i2c.tcpc_client)) {
> > > -             err = PTR_ERR(ctx->i2c.tcpc_client);
> > > -             goto free_rx_p2;
> > > -     }
> > > +     ctx->i2c.tcpc_client = devm_i2c_new_dummy_device(dev, client->adapter,
> > > +                                             TCPC_INTERFACE_ADDR >> 1);
> > > +     if (IS_ERR(ctx->i2c.tcpc_client))
> > > +             return PTR_ERR(ctx->i2c.tcpc_client);
> > >
> > >       return 0;
> > > -
> > > -free_rx_p2:
> > > -     i2c_unregister_device(ctx->i2c.rx_p2_client);
> > > -free_rx_p1:
> > > -     i2c_unregister_device(ctx->i2c.rx_p1_client);
> > > -free_rx_p0:
> > > -     i2c_unregister_device(ctx->i2c.rx_p0_client);
> > > -free_tx_p2:
> > > -     i2c_unregister_device(ctx->i2c.tx_p2_client);
> > > -free_tx_p1:
> > > -     i2c_unregister_device(ctx->i2c.tx_p1_client);
> > > -free_tx_p0:
> > > -     i2c_unregister_device(ctx->i2c.tx_p0_client);
> > > -
> > > -     return err;
> > > -}
> > > -
> > > -static void anx7625_unregister_i2c_dummy_clients(struct anx7625_data *ctx)
> > > -{
> > > -     i2c_unregister_device(ctx->i2c.tx_p0_client);
> > > -     i2c_unregister_device(ctx->i2c.tx_p1_client);
> > > -     i2c_unregister_device(ctx->i2c.tx_p2_client);
> > > -     i2c_unregister_device(ctx->i2c.rx_p0_client);
> > > -     i2c_unregister_device(ctx->i2c.rx_p1_client);
> > > -     i2c_unregister_device(ctx->i2c.rx_p2_client);
> > > -     i2c_unregister_device(ctx->i2c.tcpc_client);
> > >  }
> > >
> > >  static int __maybe_unused anx7625_runtime_pm_suspend(struct device *dev)
> > > @@ -2723,8 +2685,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> > >       if (!platform->pdata.low_power_mode)
> > >               pm_runtime_put_sync_suspend(&client->dev);
> > >
> > > -     anx7625_unregister_i2c_dummy_clients(platform);
> > > -
> > >  free_wq:
> > >       if (platform->workqueue)
> > >               destroy_workqueue(platform->workqueue);
> > > @@ -2754,8 +2714,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
> > >       if (!platform->pdata.low_power_mode)
> > >               pm_runtime_put_sync_suspend(&client->dev);
> > >
> > > -     anx7625_unregister_i2c_dummy_clients(platform);
> > > -
> > >       if (platform->pdata.audio_en)
> > >               anx7625_unregister_audio(platform);
> > >
> > > --
> > > 2.37.0.rc0.161.g10f37bed90-goog
>
> Can you fix the checkpatch --strict warnings and formatting issues in
> this series?

Done. Fix them in v2.

Thanks.
