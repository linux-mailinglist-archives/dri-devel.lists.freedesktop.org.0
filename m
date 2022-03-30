Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03DDE4EBD4E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:12:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FB3410F854;
	Wed, 30 Mar 2022 09:12:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 964BE10F854
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 09:12:08 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id a17so23616368edm.9
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Mar 2022 02:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uQZFzNRLtYXyJIFmE3hFaSUWB35Hy1i9lV0aC0h6StY=;
 b=pXjAqSyWKqK2k5d/QniAlE2if3dyDJ/5S6xvBNFpKF3gUpNo76m+/nZb6yflKGHnD8
 HjbLSjIJOPWusXs6Ymi50o9bj/8BCRc5oSA/ozXMc/twWdY86ovFXnqpgplOauHvmZw6
 hhkcUOlGib2+vWM/71oHB/mI94HvT5Bgl+8bY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uQZFzNRLtYXyJIFmE3hFaSUWB35Hy1i9lV0aC0h6StY=;
 b=fsr+gopV6UfqXQU2Ug2oXrJ80Py40wPtYZn+jtvyoj47tMW/MjdTv5QR7Gbvv9wGxd
 zMNnrR/LrC0X0xVQ5zMAmsOmgQeI+9stesQl7Xuq28dkRVvQEf4SBikMa7dM8Nr2bRg6
 /hF0JLso1+Kq9DwNn20wtNJnLw7gIzoJZy/gTlEKF2t5TvJ/ibm0Gex2guJeF02Lsr8R
 Vzk98sBpn2Fmtz91rLfW15zruB4t7I6+fXvTq6MtU+J+LDFrT2JJvwq0fJZjPRSaOP0S
 Kzt3te8dKADVF2QFwIwYVe7x2ocT4LwGbVpX9iIgbQPRH5hlbaDDpIHhCnc5A8RSM1om
 DdQA==
X-Gm-Message-State: AOAM533UZHqsVyGxpURnVL1h1uDSTEJp4XsWUwW3pt4wANu+bEesMEKM
 giwHQcQLhkECZjZqb7I2ayJP/YIkEpRVXRe/sXJhdg==
X-Google-Smtp-Source: ABdhPJyPso3cRHG6FMD1eevpdmupz9c7y7Xwd2kyPaHqnzF1kCB8JtVGlhBA65wttef2CJLWTiZ+Xppw5heLfRIo0xE=
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr9460185edz.13.1648631527090; Wed, 30 Mar
 2022 02:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAMty3ZBT9WEPbkaoS_8t1O153tckBk0pxiP2cF75ASZb54SPUQ@mail.gmail.com>
 <20220330085254.yow3w4frr56wllou@houat>
In-Reply-To: <20220330085254.yow3w4frr56wllou@houat>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 30 Mar 2022 14:41:56 +0530
Message-ID: <CAMty3ZCMZHjKpnV3BSK_7oWJuc-yVjhLXAgZ5xFhdVn+Wa6USQ@mail.gmail.com>
Subject: Re: DRM Master ignoring hotplug event during display switching (QT)
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 30, 2022 at 2:22 PM Maxime Ripard <maxime@cerno.tech> wrote:
>
> On Tue, Mar 29, 2022 at 11:38:32PM +0530, Jagan Teki wrote:
> > Hi all,
> >
> > I have implemented runtime display switching in the MIPI switch design
> > where LVDS and HDMI bridges are selected with the help of runtime
> > GPIO.
> >
> > Initial discussion on the same can be found here,
> > https://www.spinics.net/lists/dri-devel/msg318524.html
> >
> > The implementation has been done by creating each connector at
> > runtime. The default boot will create the LVDS connector and based on
> > the HDMI plug-in the ISR.
> >
> > 1. forcing the LVDS to disconnect
> > 2. call drm_kms_helper_hotplug_event
> > 3. detach the bridge chain
> > 4. attach the new bridge chain (HDMI)
> > 5. call drm_kms_helper_hotplug_event
> >
> > do the reverse when we unplug the HDMI cable.
> >
> > So, the bridge chains are attached and detached based on GPIO
> > Interrupt which is indeed identified based on the physical HDMIA
> > connector.
> >
> > Pipeline for LVDS,
> > mxfsb => nwl-dsi => display-switch => sn65dsi83=> panel-bridge
> >
> > Pipeline for HDMI,
> > mxfsb => nwl-dsi => display-switch => adv7511 => display-connector
> >
> > With this, implementation and I can able switch the displays with
> > default DRM (without specific DRM applications) where the LVDS is ON
> > by default and when HDMI plug-in the LVDS OFF/HDMI ON, and when HDMI
> > unplug the HDMI OFF/LVDS ON.
> >
> > However, with QT5 I can see the DRM Master ignoring hotplug event by
> > returning 0 on drm_master_internal_acquire in
> > drm_fb_helper_hotplug_event. With this the hotplug returned early so
> > it cannot able to disconnect and connect the new switching connector.
> >
> > Any help?
>
> I'm not sure why you started another discussion with pretty much the
> same content, but you can't rely on userspace handling the hotplug
> event. You'll have to deal with the case where it just doesn't.

I've added clear details here - thought that it reaches more people.
Okay, I will continue on the old thread.

Jagan.
