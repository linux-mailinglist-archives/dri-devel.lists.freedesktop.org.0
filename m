Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A4D530C5C
	for <lists+dri-devel@lfdr.de>; Mon, 23 May 2022 11:41:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9632E10E33E;
	Mon, 23 May 2022 09:41:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4382710E33E
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 09:41:08 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id b5so5553342plx.10
 for <dri-devel@lists.freedesktop.org>; Mon, 23 May 2022 02:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yYolsJ5oVKuApmspQDDWJ/7AsXpcVAezVXNeJ7W061k=;
 b=lR6vDxpLv/U3lp1N+zKrSpIhyxGxdKu+dLWyCzD2HDONwkINi39Vr6452qTxh6faas
 6q8O5xsl0iivWs9sAzk44BjzZZVJMwbwtRYM7cGYz9BcRc1n8a/JT114UcQ0yzFGy0+L
 uM6/xpd4JTHy72Q/okdwIo42Vu7rD5Bdgm+QfW87feMxYoRcpkhNhXC8Zd7G14hotx+6
 pndVMV+0fvPr9NLnfkQG8NH30NiM3gqYpHZb9VTpafB7UeCGn6KDW07gwyBg4X95fsHQ
 cyp3rBSKojDR2N/dhAnmvVe0GbfNqLJ2JTIqbrcC838yiZzVdptgqIPl3ph0OBSc/Bu4
 yT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yYolsJ5oVKuApmspQDDWJ/7AsXpcVAezVXNeJ7W061k=;
 b=bwYexnNh7240MWBOGuK/yum+G6Z2RM+/rNXFGa9y6GI2zeOqC6f1wTcXFiFqhUwFBx
 A0JKd2WdasTooGC6dvglg8ecKMpV64sMn3Abnnv5SIPL69foaOVkeOTr1Q6uhcd1x+y5
 EqTVwekP+hesrbVK9k+MSCDoom/GLbD3dOMdSteIrwz9G5xBELHVES3lSioyjseB1sId
 31Z1XIYQgZJAcS4cIm6NIgci0FaJBf1KsWTd6BmXjNGaC7rXHUR34ccCuaOvsZwDeLt0
 nNnndUZiZSOhyyCpmQ7GNqr43nYOIgtgqGtmDJHmr+74ZquZgG0ieGiPq6jagrmYH8rd
 Rh1g==
X-Gm-Message-State: AOAM533gZLJujGQRMf3eTx8LlmirgXqyR98wHMuD7FjbE90lsRKoPh5w
 PG8tLNGC/iB2XH8wDLuecXL77irvHqXgBlweBWibQw==
X-Google-Smtp-Source: ABdhPJwmPN55aqrTF+HRSWgVKsXpLdTKDcc5ZPoTVFOFT5jstZysKZlF7J+DmO6om+h3bvgEuhsQbcIVi6m3dYjKBYc=
X-Received: by 2002:a17:90b:380f:b0:1e0:aa6:9e24 with SMTP id
 mq15-20020a17090b380f00b001e00aa69e24mr14378829pjb.232.1653298867753; Mon, 23
 May 2022 02:41:07 -0700 (PDT)
MIME-Version: 1.0
References: <20220518233844.248504-1-marex@denx.de>
 <5ff1a7f051c72891c820bb4c9a9062c7c0591840.camel@pengutronix.de>
In-Reply-To: <5ff1a7f051c72891c820bb4c9a9062c7c0591840.camel@pengutronix.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 23 May 2022 11:40:56 +0200
Message-ID: <CAG3jFyvm+gVESUX9LM0Mh48SsC+MZnTpOwrtbi+rRv8PtRWWTQ@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Handle dsi_lanes == 0 as invalid
To: Lucas Stach <l.stach@pengutronix.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 19 May 2022 at 09:57, Lucas Stach <l.stach@pengutronix.de> wrote:
>
> Am Donnerstag, dem 19.05.2022 um 01:38 +0200 schrieb Marek Vasut:
> > Handle empty data-lanes = < >; property, which translates to
> > dsi_lanes = 0 as invalid.
> >
> > Fixes: ceb515ba29ba6 ("drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 and SN65DSI84 driver")
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
>
> Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi83.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > index d64d4385188dd..dc65f424e7f3c 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> > @@ -585,7 +585,7 @@ static int sn65dsi83_parse_dt(struct sn65dsi83 *ctx, enum sn65dsi83_model model)
> >       ctx->host_node = of_graph_get_remote_port_parent(endpoint);
> >       of_node_put(endpoint);
> >
> > -     if (ctx->dsi_lanes < 0 || ctx->dsi_lanes > 4) {
> > +     if (ctx->dsi_lanes <= 0 || ctx->dsi_lanes > 4) {
> >               ret = -EINVAL;
> >               goto err_put_node;
> >       }
>
>

Applied to drm-misc-next.
