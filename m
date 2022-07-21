Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEC0D57CB01
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jul 2022 14:58:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37C618AAAF;
	Thu, 21 Jul 2022 12:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD0218A031
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 12:58:48 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id w12so2016090edd.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jul 2022 05:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vs5216bnPRITFVUEHSBpgNTMvEmD8ySziKkwTP0pTug=;
 b=cQBJm+GNJplkWePRRrQaqzrZdQPM/RDpPM8iFQiiB3CSnqaIBO98skb+PwGw6YA+ZB
 RvE+9wPttM7dA22B551BUjb6Z2EjmsOvyAfg9BEaa+SI/mWwiU0gOHs1JKfByQtFW8Os
 qyNK8O8BlSuN3sfTeJqj5kIPjyfnRCIz22XappWREhRcpWYNG2qNxYhTl2FLiJP2MXoh
 0TmnMOQm+81V+g/1FXuEhnseXg5zK6Nt+tMhze8XbnTGkF4Yd9suC/AJp15DRvx5Ij8f
 js8wvgkS44zYCJp6P0bUFQiMbm2vheOHSAJsbnAz68G6Qyi8PbLLmCvi4H5SGfzrwmc0
 wR3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vs5216bnPRITFVUEHSBpgNTMvEmD8ySziKkwTP0pTug=;
 b=PvO+OIIrnbJnFy5hnBvhT4RUgATR5hoHDulYG1zP4lzz1kDvaqdUFFgm5q5Bi48ZB3
 zWHJG8qNEFbNsB14liC3rvwcScJrqj0oHN56+yiR9whrBK2lcckmnGwS6Y7pajz6PtoA
 J1Xeq/olcx08QV03pAdRe+jPjl9DhTSImnVCFH2ZJ8el0pyG5fkZs4GIxlaOmVW+dg8T
 gyWVYfIg70wA4XTLeBaT6nXFVgzSxTJD7WG/l+npOEfIJjRj6ugOjqqCCf914YYD2YSZ
 jEr5LV2zBS2wRSLOFDqzL9azdWjAE+g3P4Mq+V4Nq/DLPgZefZUw5PHELdYm7Qc1YxOc
 WJOA==
X-Gm-Message-State: AJIora+0aFN82AA0cB0ESRZ8hgayrXz7ST8oqmETy+jk9AGIWy0TgPdG
 AzpDxL1CCG14L23kzsWLp59dE2NkYsREJmIy/91wUw==
X-Google-Smtp-Source: AGRyM1sxRLoTV6HN9Losb78fIaAU0JCIcyyB96+tqbi+n8Fh7smtJfMBbmonL2Gsq6VmzS9W3kKqPkbCtpIXTAeMZAw=
X-Received: by 2002:a05:6402:5245:b0:43a:a024:82cc with SMTP id
 t5-20020a056402524500b0043aa02482ccmr56949726edd.56.1658408327260; Thu, 21
 Jul 2022 05:58:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220721092258.3397461-1-wenst@chromium.org>
 <2b41ef82-1d9f-bead-fc6b-45da200b0838@baylibre.com>
In-Reply-To: <2b41ef82-1d9f-bead-fc6b-45da200b0838@baylibre.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 21 Jul 2022 14:58:36 +0200
Message-ID: <CAG3jFyuDxQ=boE2RbZXYcO+gFpKSWf5FWaQ+eL9kpYj1a2OYog@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: parade-ps8640: Fix regulator supply order
To: Neil Armstrong <narmstrong@baylibre.com>
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
Cc: Jonas Karlman <jonas@kwiboo.se>, dri-devel@lists.freedesktop.org,
 hsinyi@chromium.org, Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 21 Jul 2022 at 13:18, Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 21/07/2022 11:22, Chen-Yu Tsai wrote:
> > The datasheet says that VDD12 must be enabled and at full voltage before
> > VDD33 is enabled.
> >
> > Reorder the bulk regulator supply names so that VDD12 is enabled before
> > VDD33. Any enable ramp delays should be handled by setting proper
> > constraints on the regulators.
> >
> > Fixes: bc1aee7fc8f0 ("drm/bridge: Add I2C based driver for ps8640 bridge")
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> >   drivers/gpu/drm/bridge/parade-ps8640.c | 4 ++--
> >   1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
> > index 31e88cb39f8a..49107a6cdac1 100644
> > --- a/drivers/gpu/drm/bridge/parade-ps8640.c
> > +++ b/drivers/gpu/drm/bridge/parade-ps8640.c
> > @@ -631,8 +631,8 @@ static int ps8640_probe(struct i2c_client *client)
> >       if (!ps_bridge)
> >               return -ENOMEM;
> >
> > -     ps_bridge->supplies[0].supply = "vdd33";
> > -     ps_bridge->supplies[1].supply = "vdd12";
> > +     ps_bridge->supplies[0].supply = "vdd12";
> > +     ps_bridge->supplies[1].supply = "vdd33";
> >       ret = devm_regulator_bulk_get(dev, ARRAY_SIZE(ps_bridge->supplies),
> >                                     ps_bridge->supplies);
> >       if (ret)
>
> Reviewed-by: Neil Armstrong <narmstrong@baylibre.com>

Applied to drm-misc-next.
