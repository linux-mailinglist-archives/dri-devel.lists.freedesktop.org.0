Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0964905A7
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 11:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6916310E1E0;
	Mon, 17 Jan 2022 10:05:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A98110E1E0
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 10:05:21 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id h23so20747058iol.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 02:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=u6gDfYz5XK3BoOih3zuPlIJCbUaQgDeict/aTqmu/uM=;
 b=iSOe/tpAkwoCHPr7fqp3jd6szzLu83DiXOeN9DKlmNtzauUj0iVLlJ1T3qwaenz+pI
 ymL2xsF44k9NC5Yds8oqf5vBHUcLF5hHnw+jHM0CnV6QZih6a6rNVoYdnSLApaVADng9
 l75A0igiz9pk0tzYQEYjMlaydyWtcb19HYCxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=u6gDfYz5XK3BoOih3zuPlIJCbUaQgDeict/aTqmu/uM=;
 b=7MQ3gCiU8z4b9UGfGOglR+y9tLpjTqgEy8TN0FBRTIGVls2tU2rP9tG7F3hcY0ChX5
 aRnpoHTSYa+AtKzAZQcMr/SHeLbsbnd3306L4tJR2VpMXf2+t0KLPof9YrHhcvBb751X
 5YAsr/aGVl1drGHcDpROeQJZcJyLIRWNmxbzwglamJxR98i7el+HWZhc1JGehAxhBMkF
 7DvgHVcAKn+9U5LpTSiVhvs/YRZ+bmP3OUVJRbNpmWGsCoYC23wPSnBYlQxG9he/aAL0
 rVzqu4tGOqgdE8q5gHoM+1xTKQ9ZBbblehuRJ48dkTC4tSejguT4DUWJfpO+vTOKUfhJ
 OPhA==
X-Gm-Message-State: AOAM530MDWWt6FT+uk1T9S2Zfryl5AFJxEEKwEahIUF8Sp7i315Obx3S
 UQDdyofdRrJ01ISGHRnG7XinT0LMuotPbZaoXp9y+g==
X-Google-Smtp-Source: ABdhPJySbmSFcO/QHU4TTkKLetNVnNodmMnSpMBqDkpCFOLtn3BKxvUR7j8t3VwVAQpMLQm3SmlY/s9PU6KUjRhj2+0=
X-Received: by 2002:a05:6602:490:: with SMTP id
 y16mr9860884iov.162.1642413920295; 
 Mon, 17 Jan 2022 02:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20220113082918.2279347-1-hsinyi@chromium.org>
 <CAG3jFytu8VpopWYHvGiSYRW2bcX-wHSoYgQ42u84WBQKGrnfZQ@mail.gmail.com>
In-Reply-To: <CAG3jFytu8VpopWYHvGiSYRW2bcX-wHSoYgQ42u84WBQKGrnfZQ@mail.gmail.com>
From: Hsin-Yi Wang <hsinyi@chromium.org>
Date: Mon, 17 Jan 2022 18:04:54 +0800
Message-ID: <CAJMQK-gOMeK+_-6COEsaTdMq3GUejVRuH-HfdvBFS+Q-wKaGkA@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] drm/bridge: anx7625: Convert to use devm_kzalloc
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
Cc: devicetree@vger.kernel.org, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Andrzej Hajda <a.hajda@samsung.com>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Xin Ji <xji@analogixsemi.com>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Robert,

The second patch depends on "drm/bridge: anx7625: send DPCD command to
downstream" (https://patchwork.kernel.org/project/dri-devel/patch/1f36f8bf0a48fb2bba17bacec23700e58c1d407d.1641891874.git.xji@analogixsemi.com/).
But I'm waiting for Xin Ji's response for that patch.

Thanks

On Mon, Jan 17, 2022 at 5:40 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Hey Hsin-Yi,
>
>
> On Thu, 13 Jan 2022 at 09:29, Hsin-Yi Wang <hsinyi@chromium.org> wrote:
> >
> > Use devm_kzalloc instead of kzalloc and drop kfree(). Let the memory
> > handled by driver detach.
> >
> > Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
> > Reviewed-by: Xin Ji <xji@analogixsemi.com>
> > ---
> > v2->v3: remove kfree() in anx7625_i2c_remove().
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 10 +++-------
> >  1 file changed, 3 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 0b858c78abe8b6..d3661c78770a8f 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -2515,7 +2515,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >                 return -ENODEV;
> >         }
> >
> > -       platform = kzalloc(sizeof(*platform), GFP_KERNEL);
> > +       platform = devm_kzalloc(dev, sizeof(*platform), GFP_KERNEL);
> >         if (!platform) {
> >                 DRM_DEV_ERROR(dev, "fail to allocate driver data\n");
> >                 return -ENOMEM;
> > @@ -2527,7 +2527,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >         if (ret) {
> >                 if (ret != -EPROBE_DEFER)
> >                         DRM_DEV_ERROR(dev, "fail to parse DT : %d\n", ret);
> > -               goto free_platform;
> > +               return ret;
> >         }
> >
> >         platform->client = client;
> > @@ -2552,7 +2552,7 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >         if (!platform->hdcp_workqueue) {
> >                 dev_err(dev, "fail to create work queue\n");
> >                 ret = -ENOMEM;
> > -               goto free_platform;
> > +               return ret;
> >         }
> >
> >         platform->pdata.intp_irq = client->irq;
> > @@ -2637,9 +2637,6 @@ static int anx7625_i2c_probe(struct i2c_client *client,
> >         if (platform->hdcp_workqueue)
> >                 destroy_workqueue(platform->hdcp_workqueue);
> >
> > -free_platform:
> > -       kfree(platform);
> > -
> >         return ret;
> >  }
> >
> > @@ -2666,7 +2663,6 @@ static int anx7625_i2c_remove(struct i2c_client *client)
> >         if (platform->pdata.audio_en)
> >                 anx7625_unregister_audio(platform);
> >
> > -       kfree(platform);
> >         return 0;
> >  }
> >
>
> I just had a look at applying this series, but it fails to apply on
> drm-misc-next today.
>
> Could you send a v4 that applies cleanly, and I'll try to be quick
> about applying it.
>
>
> Rob.
