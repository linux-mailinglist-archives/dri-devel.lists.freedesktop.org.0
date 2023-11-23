Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B82CB7F59A0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Nov 2023 08:54:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D27A310E6D7;
	Thu, 23 Nov 2023 07:54:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 444BE10E6D7
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 07:54:15 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-5cccd2d4c4dso5508297b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Nov 2023 23:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700726054; x=1701330854; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=f5KwFuLZ/LzwMj0Lr7xpRitCKzKd8VxfJ4AdjnQ0KTs=;
 b=twsQpUiuQris48UCyZl43y4JFffFgHt41Ufhw6ma8Q9CFwYw3Is2VgvWEYTTYIA3bn
 VVZvR1UVPtWg6JvzCLp03YISIWA4766owVDOwLUOXdpSUierP9wYh49bkOGdnQZDhPYc
 tdxyDfwHcXv7yFvORD0lka3go9xV6p5ZGhYMSBvhnLjrNWShn3ZuG2LIv3sKx9bBzhFv
 CAQBSXmbfnl1D9GSFWFfNa8Ss7Uy+ESYzZd4HEq2eegHmQN3hlpAI0O2+4ZSRnf+lGjm
 pzBxZ1UAQo39E3CVx3LEnc1EmvId6W+SBVUdD+lajW8w46rbTuJRlrJ50J4dSl78KXMo
 M/xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700726054; x=1701330854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=f5KwFuLZ/LzwMj0Lr7xpRitCKzKd8VxfJ4AdjnQ0KTs=;
 b=Y48bO78sECKJ54TUwJ1iJ7MJ0nOn+MMZtrWsE5enAYTL0fuGF4FDxUuMW+KIAbtLTq
 RJ8xEhTpCzQ7CiXz8hbkmuYbzOX4A9wF2S9vCc0uevPwCmCjglN/1Jm4qaAcy2TjH3My
 hBt+DGUe21p4ki5NUFygNG3sv6BbFLQ+Oz4roVEKeoHoDdMmf4u5L5hftHrfoz9CZ94t
 ukV1AmquQfI6CMla9WoJhvILKlGdd/klJ/xJsJFf7RTAlSEQyIQEQrEAL+VyOf+P9Bea
 biKllBb+FoL1Jh/3mPEWsGga2SUpRQuLDqi3x5cUzfBYrhYhGjJB3sO+krP4m0+YZvd/
 VAYQ==
X-Gm-Message-State: AOJu0YydOZbMJd5Pp411af5wmIYEXfpYXb/YLtXcyDabnKafvCvtJm4m
 1XUeB/LcOpTif86SoSEcT6JFzztgqQxjuuqQpcwujw==
X-Google-Smtp-Source: AGHT+IGfDu/9I47nLk79+G6LbU1Nnht9vmXhErvPc7HbK4Rf5Fw6QGjnMYIJ79g2fougllfxvj/J8H6Lcf5zKmcQmos=
X-Received: by 2002:a81:9a4c:0:b0:5cd:ad4:16dd with SMTP id
 r73-20020a819a4c000000b005cd0ad416ddmr1997505ywg.45.1700726054292; Wed, 22
 Nov 2023 23:54:14 -0800 (PST)
MIME-Version: 1.0
References: <20231114150130.497915-1-sui.jingfeng@linux.dev>
 <20231114150130.497915-5-sui.jingfeng@linux.dev>
 <CAA8EJpp0HY=PsCVFk4S3OERNUcin73c5w6ihnoY6aFg83+NhkA@mail.gmail.com>
 <1ea7e68d-7005-4f5b-92df-d2f7c56a49b2@linux.dev>
In-Reply-To: <1ea7e68d-7005-4f5b-92df-d2f7c56a49b2@linux.dev>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Nov 2023 09:54:03 +0200
Message-ID: <CAA8EJpp=U9x0rjXeT2m8S2PESd0y18h+pOFB-RQWJh83s9UGOQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/bridge: it66121: Add a helper function to get the
 next bridge
To: Sui Jingfeng <sui.jingfeng@linux.dev>
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Sui Jingfeng <suijingfeng@loongson.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Phong LE <ple@baylibre.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 23 Nov 2023 at 07:25, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
>
> Hi,
>
>
> On 2023/11/15 00:05, Dmitry Baryshkov wrote:
> > On Tue, 14 Nov 2023 at 17:09, Sui Jingfeng <sui.jingfeng@linux.dev> wrote:
> >> From: Sui Jingfeng <suijingfeng@loongson.cn>
> >>
> >> Group the code lines(which with the same functional) into one dedicated
> >> function, which reduce the weight of it66121_probe() function. Just trivial
> >> cleanuo, no functional change.
> >>
> >> Signed-off-by: Sui Jingfeng <suijingfeng@loongson.cn>
> >> ---
> >>   drivers/gpu/drm/bridge/ite-it66121.c | 53 ++++++++++++++++++----------
> >>   1 file changed, 34 insertions(+), 19 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
> >> index 0f78737adc83..7e473beefc79 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it66121.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it66121.c
> >> @@ -340,6 +340,37 @@ static int it66121_of_read_bus_width(struct device *dev, u32 *bus_width)
> >>          return 0;
> >>   }
> >>
> >> +static int it66121_of_get_next_bridge(struct device *dev,
> >> +                                     struct drm_bridge **next_bridge)
> > it already exists and it is called drm_of_find_panel_or_bridge(),
> > could you please use it instead?
>
> That function is too fat and tangled, and should be untangled.
> it66121 can not connect with a panel, this is a prior knowledge
> and is known at compile time. So this prior knowledge shouldn't
> be dropped.

This prior knowledge is kept by passing NULL as a panel. We already
have a helper. It covers your use case. There is no need to write your
own boilerplate code for it.

>
> >> +{
> >> +       struct device_node *np;
> >> +       struct drm_bridge *bridge;
> >> +
> >> +       np = of_graph_get_remote_node(dev->of_node, 1, -1);
> >> +       if (!np) {
> >> +               dev_err(dev, "The endpoint is unconnected\n");
> >> +               return -EINVAL;
> >> +       }
> >> +
> >> +       if (!of_device_is_available(np)) {
> >> +               of_node_put(np);
> >> +               dev_err(dev, "The remote device is disabled\n");
> >> +               return -ENODEV;
> >> +       }
> >> +
> >> +       bridge = of_drm_find_bridge(np);
> >> +       of_node_put(np);
> >> +
> >> +       if (!bridge) {
> >> +               dev_dbg(dev, "Next bridge not found, deferring probe\n");
> >> +               return -EPROBE_DEFER;
> >> +       }
> >> +
> >> +       *next_bridge = bridge;
> >> +
> >> +       return 0;
> >> +}
> >> +
> >>   static const struct regmap_range_cfg it66121_regmap_banks[] = {
> >>          {
> >>                  .name = "it66121",
> >> @@ -1531,7 +1562,6 @@ static const char * const it66121_supplies[] = {
> >>   static int it66121_probe(struct i2c_client *client)
> >>   {
> >>          u32 revision_id, vendor_ids[2] = { 0 }, device_ids[2] = { 0 };
> >> -       struct device_node *ep;
> >>          int ret;
> >>          struct it66121_ctx *ctx;
> >>          struct device *dev = &client->dev;
> >> @@ -1553,24 +1583,9 @@ static int it66121_probe(struct i2c_client *client)
> >>          if (ret)
> >>                  return ret;
> >>
> >> -       ep = of_graph_get_remote_node(dev->of_node, 1, -1);
> >> -       if (!ep) {
> >> -               dev_err(dev, "The endpoint is unconnected\n");
> >> -               return -EINVAL;
> >> -       }
> >> -
> >> -       if (!of_device_is_available(ep)) {
> >> -               of_node_put(ep);
> >> -               dev_err(dev, "The remote device is disabled\n");
> >> -               return -ENODEV;
> >> -       }
> >> -
> >> -       ctx->next_bridge = of_drm_find_bridge(ep);
> >> -       of_node_put(ep);
> >> -       if (!ctx->next_bridge) {
> >> -               dev_dbg(dev, "Next bridge not found, deferring probe\n");
> >> -               return -EPROBE_DEFER;
> >> -       }
> >> +       ret = it66121_of_get_next_bridge(dev, &ctx->next_bridge);
> >> +       if (ret)
> >> +               return ret;
> >>
> >>          i2c_set_clientdata(client, ctx);
> >>          mutex_init(&ctx->lock);
> >> --
> >> 2.34.1
> >>
> >



-- 
With best wishes
Dmitry
