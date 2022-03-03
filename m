Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988624CC54C
	for <lists+dri-devel@lfdr.de>; Thu,  3 Mar 2022 19:37:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F0910EEFE;
	Thu,  3 Mar 2022 18:37:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 257A510EEFE
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Mar 2022 18:37:29 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id r10so9211209wrp.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 10:37:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=iSOufd9ic1803HCWAH+W7ntFYx5gsFQTYNvfwFP0ik4=;
 b=YiMadP6uZKPzcyP76Q2KxDNwFs/Z8YSwtb1uMBid1e3j1lR2+sV5UNA7ySTsPlEPa6
 C1aMxdOsTHW7fsKa+gvtloWlRQZJaF4jbRB6Kc7PtbgpWcSEVHIgCF3a8LQCkAIFI+fb
 3LSXip7RPOdTSFkorFptD2us/lq9wOO1a6i0dJiTsGaWi8MAUreLKqbuyX43wMVfBqSj
 M4Zj7YJ9LzJeog/2z+BY0dP1C5mr5bBzu9nITUwgJLIfaNQUzgCZUAkB/poGI4c/OtHI
 Yh5wzTmcdjwkeo311rnQ6qitGUsjab9UJDixlaMS3HkYku+msrhPOtHGRlKsER0y2uzh
 96KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=iSOufd9ic1803HCWAH+W7ntFYx5gsFQTYNvfwFP0ik4=;
 b=vH8jBzITRpUe19+JAn84e8c2ys1wHZ6ZytHQ2zEIbUnoKu5lAa45YmsFUf+3BbeLvq
 NFam/0sl5n+Bntjng//GF/eiuJHehXFtJw6Xn7e7/9VPxeBJqslVo37SVbHTfj98hh4c
 rMhCtLsAaCeP52rCZP6N/eVWNgT/aohBWlupbm1sQGeFeNUUh0goDG3wPTb4ghEgdzg6
 9FJRr3QjErWPqRjpJSp/eRFELmq5AVdK6yI/d9p88fYtoNrkxaf/bqxQ79zz2Oq+6RX6
 p9y8nZDlQCVP18R8QT2Zt/+BpgCad2RUxexIXA9ix53UjkhhBKff5JzCHeUCOVoURw4C
 ZEKg==
X-Gm-Message-State: AOAM5305znql5Wkq5l6FGbUXfkQFb1K+VY9tYcGYcyAm01OAqm4K0YOD
 k52P2Eg2Ha+69ye4+YGC3Yo=
X-Google-Smtp-Source: ABdhPJxJmuSgwDYVvAuBt2EhvnNE5kA/TFpFNW4rcxri3y3JhzZ7POFeroEiibl2R+FTZ9mNhfi1Gg==
X-Received: by 2002:a5d:64a5:0:b0:1f0:6041:159 with SMTP id
 m5-20020a5d64a5000000b001f060410159mr2527698wrp.703.1646332647523; 
 Thu, 03 Mar 2022 10:37:27 -0800 (PST)
Received: from elementary ([94.73.33.246]) by smtp.gmail.com with ESMTPSA id
 b9-20020a5d45c9000000b001ef9200b856sm2533507wrs.115.2022.03.03.10.37.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 10:37:27 -0800 (PST)
Date: Thu, 3 Mar 2022 19:37:20 +0100
From: =?iso-8859-1?Q?Jos=E9_Exp=F3sito?= <jose.exposito89@gmail.com>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi86: switch to devm_drm_of_get_bridge
Message-ID: <20220303183720.GA334969@elementary>
References: <20220228183955.25508-1-jose.exposito89@gmail.com>
 <164609067646.2361501.15747139249939190799@Monstersaurus>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <164609067646.2361501.15747139249939190799@Monstersaurus>
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
Cc: linux-pwm@vger.kernel.org, jernej.skrabec@gmail.com, maxime@cerno.tech,
 jonas@kwiboo.se, airlied@linux.ie, narmstrong@baylibre.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 thierry.reding@gmail.com, robert.foss@linaro.org, andrzej.hajda@intel.com,
 u.kleine-koenig@pengutronix.de, lee.jones@linaro.org,
 Laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 28, 2022 at 11:24:36PM +0000, Kieran Bingham wrote:
> Hi José
> 
> Quoting José Expósito (2022-02-28 18:39:54)
> > The function "drm_of_find_panel_or_bridge" has been deprecated in
> > favor of "devm_drm_of_get_bridge".
> > 
> > Switch to the new function and reduce boilerplate.
> > 
> > Signed-off-by: José Expósito <jose.exposito89@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 +-------
> >  1 file changed, 1 insertion(+), 7 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index dab8f76618f3..fb8e16ed7e90 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -1232,15 +1232,9 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
> >  {
> >         struct ti_sn65dsi86 *pdata = dev_get_drvdata(adev->dev.parent);
> >         struct device_node *np = pdata->dev->of_node;
> > -       struct drm_panel *panel;
> >         int ret;
> >  
> > -       ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
> > -       if (ret)
> > -               return dev_err_probe(&adev->dev, ret,
> > -                                    "could not find any panel node\n");
> > -
> > -       pdata->next_bridge = devm_drm_panel_bridge_add(pdata->dev, panel);
> > +       pdata->next_bridge = devm_drm_of_get_bridge(pdata->dev, np, 1, 0);
> 
> Yikes, I was about to rely on this panel variable to determine if the
> device is a panel or a display port connector. (Well, I am relying on
> it, and patches are hoping to be reposted this week).
> 
> Is there expected to be another way to identify if the next connection
> is a panel or a bridge?
> 
> Regards

Hi Kieran,

I'm getting started in the DRM subsystem. I couldn't tell if there is a
good way to access the panel pointer... I didn't manage to find it, but
hopefully someone with more experience can point us to a solution.

Since you mentioned display port, I'm not sure if in your case checking
"pdata->next_bridge->type" could be good enough.

Anyway, if this patch causes you problems, please go ahead and ignore it.
I'm sure the series you are working on are more important than removing
a deprecated function :)

Best wishes,
Jose
