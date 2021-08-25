Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26ADF3F7EEC
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 01:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC5BE6E431;
	Wed, 25 Aug 2021 23:11:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22b.google.com (mail-oi1-x22b.google.com
 [IPv6:2607:f8b0:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 199CF6E431
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 23:11:52 +0000 (UTC)
Received: by mail-oi1-x22b.google.com with SMTP id v2so1704932oie.6
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 16:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QtXruHF4bnU6OyDGPGjhakaBMSfcI7KwDzUGtKN2MR0=;
 b=LSQ+Qs6HQ2tLgxADlDiknTiMlunVRVb2oTaqttGBCOLAy9cTuB2yKsogtfZ8PG903O
 h5M4uHZCfTCPEuGn7ae6aRomz+teFyOfwAahWuOVl0gm1XPoAx+WvuUlkgUfrzsn0Id7
 CFrxc8Q0QMTEBu528ANT70QfY/opiUACSIL1COUemir8eKja0ZTWsAzP7Oa07wR0hm1a
 nLkMWdmsttzoVcCUK3Qb8RLDR6lRWrUQ0Zj9YaiEgYAJ7ztDcSfp5MR4FZhS1DY6ygcR
 WA5rYjmlAuOugXKoPtKAfIFNkysDmGpBisdF8/Fayee8kQNXGIRAvBgw9C1nOlVy0aO6
 +GZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QtXruHF4bnU6OyDGPGjhakaBMSfcI7KwDzUGtKN2MR0=;
 b=ZPxW2AZwfYgjeNIzHkm9yeN2/AJNF0kr548s/EeLA03YTMKdTEzPGwNlpOnR6UyWhP
 VZ0OLcgoG4gbOg4PHTdsqM9Mdm7O918f8/5io6X/UR7MNqbLmZkAVch9ry7LGgXSGKbK
 HSob8Hly/WZ4yYzyhWfDi7G90ilBPvR1OEcghaj4TxaStTOsriEhvI+Xrh8A73CXa3H/
 y1+T3IcIucSNuNZQHf9aU0JSvxEdK4hMOzWtEUUpGbi4L13G10xm+KuZZ9bI0lX8BXdl
 sMnx7KhGFz0hG7Zz33IbaffyB6VbL81/MHbhHzqXF933UO7SuVKu/slc/3gmYOgMEQx7
 npjw==
X-Gm-Message-State: AOAM531i64YIQGfM1mTSLnFEJlEdMntDDlqAy6WSP+dtGzeNeyrQosx1
 /kfC2HpQJuCzc1S/QobCspkGaA==
X-Google-Smtp-Source: ABdhPJwWtrUIdXOLEe63DVJX0W3pVBZSObgJ/P3jgP1myOd0+jMUDpnSf5bYJKY/guCKP8rvzghCnA==
X-Received: by 2002:a05:6808:21a5:: with SMTP id
 be37mr326536oib.172.1629933111367; 
 Wed, 25 Aug 2021 16:11:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l67sm265529otl.3.2021.08.25.16.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:11:50 -0700 (PDT)
Date: Wed, 25 Aug 2021 18:11:48 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: sbillaka@codeaurora.org
Cc: Stephen Boyd <swboyd@chromium.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 seanpaul@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org,
 khsieh@codeaurora.org, mkrishn@codeaurora.org
Subject: Re: [PATCH v1 1/2] drm/msm/dp: Add support for SC7280 eDP
Message-ID: <YSbONPNITH6dIECr@builder.lan>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-2-git-send-email-sbillaka@codeaurora.org>
 <CAE-0n52=mR0Zt8UZ3vOM-nt0UJszcFhi-eYfzDtD0bt3zhNA_Q@mail.gmail.com>
 <0b2aa426c8f511a29143f2a1117fe9a2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b2aa426c8f511a29143f2a1117fe9a2@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 12 Aug 19:28 CDT 2021, sbillaka@codeaurora.org wrote:

> On 2021-08-12 06:11, Stephen Boyd wrote:
> > Quoting Sankeerth Billakanti (2021-08-11 17:08:01)
[..]
> > > +static int dp_parser_gpio(struct dp_parser *parser)
> > > +{
> > > +       struct device *dev = &parser->pdev->dev;
> > > +       int ret;
> > > +
> > > +       parser->panel_bklt_gpio = devm_gpiod_get(dev, "panel-bklt",
> > > +                       GPIOD_OUT_HIGH);
> > > +       if (IS_ERR(parser->panel_bklt_gpio)) {
> > > +               ret = PTR_ERR(parser->panel_bklt_gpio);
> > > +               parser->panel_bklt_gpio = NULL;
> > > +               DRM_ERROR("%s: cannot get panel-bklt gpio, %d\n",
> > > __func__, ret);
> > > +               goto fail;
> > > +       }
> > > +
> > > +       parser->panel_pwm_gpio = devm_gpiod_get(dev, "panel-pwm",
> > > GPIOD_OUT_HIGH);
> > > +       if (IS_ERR(parser->panel_pwm_gpio)) {
> > > +               ret = PTR_ERR(parser->panel_pwm_gpio);
> > > +               parser->panel_pwm_gpio = NULL;
> > > +               DRM_ERROR("%s: cannot get panel-pwm gpio, %d\n",
> > > __func__, ret);
> > > +               goto fail;
> > > +       }
> > > +
> > > +       DRM_INFO("gpio on");
> > > +fail:
> > > +       return 0;
> > > +}
> > 
> > Don't we have pwm backlight drivers like
> > drivers/video/backlight/pwm_bl.c to support this? This sort of thing
> > doesn't belong in the dp driver.
> 
> Okay. I will explore it.
> 

I proposed that we attach a drm_panel and allow that to control the
(pwm-)backlight. Here's the link for the DP patch:

https://lore.kernel.org/linux-arm-msm/20210726231351.655302-1-bjorn.andersson@linaro.org/

Regards,
Bjorn
