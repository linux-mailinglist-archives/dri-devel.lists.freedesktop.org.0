Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52DC341F443
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 20:02:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A0B76EEA5;
	Fri,  1 Oct 2021 18:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0B116EEA5
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 18:02:04 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id k13so11415405ilo.7
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 11:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=SGWtQ8weImqQpPz3//oFTgRTO/g29HsvOa/9MfOVgZs=;
 b=dvH7fniNsvzTWgdm7rBSCJ2hGBhYLqkOJuwZpogrL2WwQjldz2SM84+KJPm9IGDaKC
 /fvGIgKYkZfK9mwMVG9MxIVdMEMPQiXkGWgSEFKgbYjrjiQa3pBFhqtIJD2H/wynGrr2
 qAQ6k9PAMebL4+moFHi/AnEUTMy1BQOCG1g1s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SGWtQ8weImqQpPz3//oFTgRTO/g29HsvOa/9MfOVgZs=;
 b=Smy2hGGs1J4Isr9U74L2uGwiPeJFM31pRkntAst6TDTVkfu3DK8LivZUPf6jC3LBbV
 WmHtpMfNQdTJAICIjGPLytuE2TdwFHEM36iZkxOpy2+4TIDIO6EP738d57P9GnPlgRiZ
 0cas6k16yVzfGgdyCzuBWgpDkbXMQ+71FctQQbeqnLvGS5CiYqqq5vjYS4nm1KxK2P/M
 OJhbMlkWDqWFxAs6bbrbnyei9n0gJD07CCrykTcF8Py2VRJbYPnZzVDfP2sPQ8Eh7ady
 8TlsHPkZzNvyNqv1yVZznUx8IgMOtQ/dWeL5Y5Qe92SNNRJ4kfLTGALBNAKahUXiJps4
 /6GQ==
X-Gm-Message-State: AOAM531d3WkW7g4eN0Lf/iYkjamaPgcmzH9LgWLjoRlWSvYBcg3P6O+W
 rox5y9shT8Ao8mmsx7k1PDT4PNs+BZ6Z+A==
X-Google-Smtp-Source: ABdhPJyDMTIkMx7z2AFQQltBPnKDbxrH2HqA5JMHlENU7knaaDACs1IFt1LSa59JOXDfnYzL2VUtbA==
X-Received: by 2002:a05:6e02:190a:: with SMTP id
 w10mr8435685ilu.2.1633111323410; 
 Fri, 01 Oct 2021 11:02:03 -0700 (PDT)
Received: from mail-io1-f47.google.com (mail-io1-f47.google.com.
 [209.85.166.47])
 by smtp.gmail.com with ESMTPSA id b6sm3642829iod.55.2021.10.01.11.02.02
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 01 Oct 2021 11:02:02 -0700 (PDT)
Received: by mail-io1-f47.google.com with SMTP id 5so108470iov.9
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 11:02:02 -0700 (PDT)
X-Received: by 2002:a02:c7d2:: with SMTP id s18mr2939004jao.68.1633111321643; 
 Fri, 01 Oct 2021 11:02:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210920225801.227211-1-robdclark@gmail.com>
 <20210920225801.227211-3-robdclark@gmail.com>
 <YUvKwsNS0LQf9PfO@pendragon.ideasonboard.com>
In-Reply-To: <YUvKwsNS0LQf9PfO@pendragon.ideasonboard.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 1 Oct 2021 11:01:50 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VwORJ65v_JgXqXkUKg+Kbb-q6mrbnuEL3VG8v552SRzQ@mail.gmail.com>
Message-ID: <CAD=FV=VwORJ65v_JgXqXkUKg+Kbb-q6mrbnuEL3VG8v552SRzQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: ti-sn65dsi86: Implement
 bridge->mode_valid()
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Rob Clark <robdclark@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, Rob Clark <robdclark@chromium.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Neil Armstrong <narmstrong@baylibre.com>, 
 Robert Foss <robert.foss@linaro.org>, Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
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

Hi,

On Wed, Sep 22, 2021 at 5:31 PM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Rob,
>
> Thank you for the patch.
>
> On Mon, Sep 20, 2021 at 03:57:59PM -0700, Rob Clark wrote:
> > From: Rob Clark <robdclark@chromium.org>
> >
> > For the brave new world of bridges not creating their own connectors, we
> > need to implement the max clock limitation via bridge->mode_valid()
> > instead of connector->mode_valid().
> >
> > v2: Drop unneeded connector->mode_valid()
> >
> > Signed-off-by: Rob Clark <robdclark@chromium.org>
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 25 +++++++++++++------------
> >  1 file changed, 13 insertions(+), 12 deletions(-)

There's no reason to wait on this patch. Landed to drm-misc-next.

77d40e0176a5 drm/bridge: ti-sn65dsi86: Implement bridge->mode_valid()

-Doug
