Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A77423AA7
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 11:36:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B422D6F632;
	Wed,  6 Oct 2021 09:36:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 995246F632
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Oct 2021 09:36:33 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id r2so1951415pgl.10
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Oct 2021 02:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ivmiliHmVECNs+tD9udvPPT9X7ypsbwVELS3/VdaCXA=;
 b=LfUpHYEvt7VV6Mdx7h4bj9pOel5YkPzUldKd/bm8n18wrDpNkEvVC9MFoYYMznrQX9
 q70igHA+HOTbMl46LZYxeKqyYPK/ylQiw6Z9/kA/ll78Oip4iU7MKTwckaodArsV4ucm
 u/sWpOpJ5HdZb19oYyH3ZBuV8wwoINrgwkBXGD8ih1+X+N7Bdp/RkMw9UEq8pQhikMV7
 1leJV2Rv2B/1tRv5kklho3zxOW+rcftV8ToWMJmZcyZLSphNgL6YiX6vR/+vLVWQL8ls
 r0Nv3ETJQgcmSaq9LzYfgUMhD/UR1KWzshjGRioZfEq2/dnGgSyxaQo6PhAGcqvNBOJt
 jGTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ivmiliHmVECNs+tD9udvPPT9X7ypsbwVELS3/VdaCXA=;
 b=poBKfihICwoKZLkPNlbVkWk4e+R+gKRy8zC7LkKl3sT28VnWVyBvrhW/IAzZmVwgcA
 h2hTeH10LQfgemQn9x7ZWW02XWk1bQZyzXu5VBS+Lx75HQbEjBhePPa/a3im8shLoQg3
 vrDABS8smOfm5q1YAZ/gclk7ZAS4RT6HSmjFYjSMAWfBD4E0DTlVwxi/+0yq6Q6UIqiv
 yVTWN1Hw/dOKFM3P3XV+Ihj4M3sHJwPi3NsPsvELLOjWup9/E2GjCcUUHe24P25nC1Jd
 q7JkCCZ3pnjLWicHnAMWxuJwmmEF8lUX3ErJVvdEw1Mqa2qUCpXG4Sn6hucfBfXHnyVP
 jOMQ==
X-Gm-Message-State: AOAM531XxtbSbSyvq8zrWe923/H0sfkoC4UVH303clL0WoXRektiSaq8
 J3UKEpiP3JAYlXk8PK2ub0/rNv+KdRZRZrBpKmqK5Q==
X-Google-Smtp-Source: ABdhPJyJHFp7PxiNzFM0uNAU6r9bpQS9fJ2YelL4yw+Op2yk3u/S0zWg7QK4dZ1PlLtBS6v0H7mi0oh0Axno0UHAcFw=
X-Received: by 2002:a65:4345:: with SMTP id k5mr19758632pgq.410.1633512993175; 
 Wed, 06 Oct 2021 02:36:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210922125909.215-1-caihuoqing@baidu.com>
 <YUu6AukldZ482TDf@pendragon.ideasonboard.com>
In-Reply-To: <YUu6AukldZ482TDf@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Wed, 6 Oct 2021 11:36:21 +0200
Message-ID: <CAG3jFyvy6G15-aA=OPEfHzycpXMjEXAfYs_n4yFmUUAjwe5LRw@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: dw-hdmi-cec: Make use of the helper function
 devm_add_action_or_reset()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Cai Huoqing <caihuoqing@baidu.com>, Andrzej Hajda <a.hajda@samsung.com>, 
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel <dri-devel@lists.freedesktop.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Applied to drm-misc-next

On Thu, 23 Sept 2021 at 01:19, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Cai,
>
> Thank you for the patch.
>
> On Wed, Sep 22, 2021 at 08:59:08PM +0800, Cai Huoqing wrote:
> > The helper function devm_add_action_or_reset() will internally
> > call devm_add_action(), and if devm_add_action() fails then it will
> > execute the action mentioned and return the error code. So
> > use devm_add_action_or_reset() instead of devm_add_action()
> > to simplify the error handling, reduce the code.
> >
> > Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c | 6 ++----
> >  1 file changed, 2 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> > index 70ab4fbdc23e..c8f44bcb298a 100644
> > --- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> > +++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-cec.c
> > @@ -265,11 +265,9 @@ static int dw_hdmi_cec_probe(struct platform_device *pdev)
> >       /* override the module pointer */
> >       cec->adap->owner = THIS_MODULE;
> >
> > -     ret = devm_add_action(&pdev->dev, dw_hdmi_cec_del, cec);
> > -     if (ret) {
> > -             cec_delete_adapter(cec->adap);
> > +     ret = devm_add_action_or_reset(&pdev->dev, dw_hdmi_cec_del, cec);
> > +     if (ret)
> >               return ret;
> > -     }
> >
> >       ret = devm_request_threaded_irq(&pdev->dev, cec->irq,
> >                                       dw_hdmi_cec_hardirq,
>
> --
> Regards,
>
> Laurent Pinchart
