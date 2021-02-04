Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A85C30F339
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 13:34:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DB086EAD0;
	Thu,  4 Feb 2021 12:34:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD2D16EAD0
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 12:34:45 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id k9so1658533vsr.3
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 04:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=cJd9FKa1a551Lyef6CfNIDn2oz8BtNjwZF6tWhdERIY=;
 b=Xzw+OgQoMx4trTdOG7xobK372anzs7OyIMUdScK7DPaq+0hgLQQ1NFI4Qx2Tuok4J6
 hAkqvhjsZh+LCLA0a0er2430U3EVnT7T5bdWQvCtekJ53Lhoac45JBKPCr8zLXCyqnY7
 xlXP068fErj3w2dS0S9kwb6OCNpntevlsAVnk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=cJd9FKa1a551Lyef6CfNIDn2oz8BtNjwZF6tWhdERIY=;
 b=ZCLTVgt126pQcLAunqv4btyMlG+IH+lBkfcVG3CzJEem2QbU0iXzoAVPkyqyH+K1FI
 JxgTJMc3ILLLmXkfUUBqxSwkdiR1aTb1aMi8Z+G7O1sDjXeKEuY1BtSf/it4oB6ej1Fw
 xRQQqtX95lq18vA2wSu/wrSNpcTnNdl2G7WOuqW7titTO6+tumLfQR4dGR6QHsvQyq5t
 ENIYXpmdUzcOL9o1cAN6ru1AQEPKQS+cOG8HEU3n0AoEBmoYMvRvr+vbjzOqrG3BLgze
 rMSNEacWjm/CkoODevTWGsriELcl1LiReBSQNKuoIXVT151m1uwqH6r7Xmk6kywaNog3
 qm9g==
X-Gm-Message-State: AOAM533VCrr7sdBaflTOj7JktwwUW1vmWEp7T5S+5DHhflK923M0uQx5
 wSAH4z8WmvFHKzjaP+PxbJkF2LH1nRUnSRibg80zAA==
X-Google-Smtp-Source: ABdhPJzGdlYykvQ6K2WLJtushykS2XRoEspc46YEBzHBjnOeFCMTRStUy8XPadrULy6Vqn8znu7NjaabkXzJbd3THdE=
X-Received: by 2002:a67:8945:: with SMTP id l66mr4678569vsd.48.1612442084863; 
 Thu, 04 Feb 2021 04:34:44 -0800 (PST)
MIME-Version: 1.0
References: <20210128111549.GA8174@zhaomy-pc>
 <CAG3jFysU4epjS3A85ZojrJn3TAC78O_jx5p_4SWsCdRBrQ5GXQ@mail.gmail.com>
In-Reply-To: <CAG3jFysU4epjS3A85ZojrJn3TAC78O_jx5p_4SWsCdRBrQ5GXQ@mail.gmail.com>
From: Nicolas Boichat <drinkcat@chromium.org>
Date: Thu, 4 Feb 2021 20:34:33 +0800
Message-ID: <CANMq1KAuUTqgM2mDR5WN6Ad+cATFXLPE+5rstyhfNE9Lc716+g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: anx7625: enable DSI EOTP
To: Robert Foss <robert.foss@linaro.org>
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
Cc: devel@driverdev.osuosl.org, Nicolas Boichat <drinkcat@google.com>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Vasily Khoruzhick <anarsoul@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Xin Ji <xji@analogixsemi.com>, Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 8:07 PM Robert Foss <robert.foss@linaro.org> wrote:
>
> Hi Xin,
>
> Thanks for the patch.
>
> On Thu, 28 Jan 2021 at 12:17, Xin Ji <xji@analogixsemi.com> wrote:
> >
> > Enable DSI EOTP feature for fixing some panel screen constance
> > shift issue.
> > Removing MIPI flag MIPI_DSI_MODE_EOT_PACKET to enable DSI EOTP.
>
> I don't think I quite understand how removing the
> MIPI_DSI_MODE_EOT_PACKET flag will cause DSI EOTP to be enabled. Could
> you extrapolate on this in the commit message?

That confused me as well, but it turns out that's how the flag is defined:
```
/* disable EoT packets in HS mode */
#define MIPI_DSI_MODE_EOT_PACKET BIT(9)
```
(https://elixir.bootlin.com/linux/latest/source/include/drm/drm_mipi_dsi.h#L129)

I'm almost tempted to put together a mass patch to rename all of these flags...

>
> >
> > Signed-off-by: Xin Ji <xji@analogixsemi.com>
> > ---
> >  drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > index 65cc059..e31eeb1b 100644
> > --- a/drivers/gpu/drm/bridge/analogix/anx7625.c
> > +++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
> > @@ -1334,7 +1334,6 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
> >         dsi->format = MIPI_DSI_FMT_RGB888;
> >         dsi->mode_flags = MIPI_DSI_MODE_VIDEO   |
> >                 MIPI_DSI_MODE_VIDEO_SYNC_PULSE  |
> > -               MIPI_DSI_MODE_EOT_PACKET        |
> >                 MIPI_DSI_MODE_VIDEO_HSE;
> >
> >         if (mipi_dsi_attach(dsi) < 0) {
> > --
> > 2.7.4
> >
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
