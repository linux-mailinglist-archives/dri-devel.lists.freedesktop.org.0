Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A17597C87E6
	for <lists+dri-devel@lfdr.de>; Fri, 13 Oct 2023 16:33:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B966F10E107;
	Fri, 13 Oct 2023 14:33:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1AF010E107
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 14:33:40 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-d8a000f6a51so2354570276.3
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Oct 2023 07:33:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1697207619; x=1697812419;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Z3oXaouEHmr+WTYhzt/7QpBoxGJiT+pK6mrKYEvkBIs=;
 b=pN6Nx9BhTe6uiVKUNIH0w/y3heZX4BUHiP41FSRcNRQGCIzFnYoy1lm2kUX17W+rxZ
 96ssUKpdWoU5oGT28Ex0y3FZ3+V/y1Aw5zznfI193B4/lHBQYVbXUYn3EJWQox8ritGj
 auTJVIxE7A/Bu3U476Q+dgoQ9SH88R/5Aj0ITdfY3jbw/37n4vczC4hbAeoxAYu20Jff
 Ua4fDT2SASn9bGQad3ad3K04U78bjSlHZ+Y+goQE7EQ6P4whxYvYHsNKQTGWRYI14Fq4
 eUMtH5rO6Q7ixdnnL1fXoYhzZYeABBRrU7lb04QeFGqPiAGVcYWuL9OCR2ajXXKED/Ti
 HzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697207619; x=1697812419;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Z3oXaouEHmr+WTYhzt/7QpBoxGJiT+pK6mrKYEvkBIs=;
 b=g4Gh/xAruU/GUdou/nGltTaLveMkUWle+/rrNmjzBVLKy9z5X6t6keZIi5WLlma2jK
 Cd9dzVBi6D7lcTlvF+D0QtBu3vp03sokMlLGPBt2PHvJHVLm1DMni20/qsg5261H1/xX
 AvsMRaYKqBAJBESiosJLMjWbCT8LkJxpjF8OjXLP7K8xTrmlnnKgPLBs+pKHxZlp4bQt
 mhoqy8RULfLfV274wBuvjVnPobIqFY/THAkx2Bul5HYjxRxtYdvwBx5N03/PySIeq9iP
 UjTM+9J1P3d/7kwZxo+NmsVoVYR0crqxlJ7lUCkjqR5VLv9IPRNVHd13MiaTfQygdYUB
 aoww==
X-Gm-Message-State: AOJu0YzCQe9I9PvdEXy6aw33/IYetesrUuM8kevYKmduDnIs3wSIEiTk
 m209je8kDpYqYEzQ69ZKDgATTq53GVQV1F4eTzlSfw==
X-Google-Smtp-Source: AGHT+IHtqtQspOz8AHnlOeLvgsa/5+0UggoJt8F503MopGvgal84493gvpcLAi8oz0PV27sAiGZSziFoeNjCzg2Zo0w=
X-Received: by 2002:a25:d493:0:b0:d9a:ef4e:547b with SMTP id
 m141-20020a25d493000000b00d9aef4e547bmr3508342ybf.41.1697207619513; Fri, 13
 Oct 2023 07:33:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAPY8ntCFbHff-Ac1DjFJhj4ghZ1wjemnc6PoT_n7zbjoWG3+aA@mail.gmail.com>
 <60a006cd-cf2e-4e72-9c77-369f3476c81d@suse.de>
In-Reply-To: <60a006cd-cf2e-4e72-9c77-369f3476c81d@suse.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 13 Oct 2023 15:33:23 +0100
Message-ID: <CAPY8ntAFFv-Zvt7DGz2hprXz9CrO61Wu2ow_rzioMKsKFwu-PQ@mail.gmail.com>
Subject: Re: DRM FB emulation initialisation leaving the display disabled
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: DRI Development <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas

Thanks for the response.

On Thu, 12 Oct 2023 at 08:03, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi Dave
>
> Am 11.10.23 um 17:52 schrieb Dave Stevenson:
> > Hi Thomas (and everyone else)
> >
> > Maxime has suggested you're the person for DRM framebuffer emulation.
> >
> > I'm getting some unexpected behaviour when there are multiple DRM
> > drivers in play. In this case it happens to be vc4 and the tiny
> > hx8357d SPI display driver, but this affects most of the tiny DRM
> > drivers and also the DSI and DPI outputs on the Pi5.
> > We get different behaviour depending on whether vc4 or hx8357d
> > initialises first.
> >
> > If hx8357d loads first and registers as /dev/fb0 through the fb
> > emulation, then we get fbcon enabling the display and putting the
> > emulated framebuffer on it. vc4 then loads, registers /dev/fb1, and
> > through the hotplug handler it enables the display
> > (drm_fb_helper_hotplug_event calls, drm_fb_helper_set_par, which calls
> > __drm_fb_helper_restore_fbdev_mode_unlocked).
> >
> > If vc4 loads first and claims /dev/fb0, fbcon initalises and enables
> > the display. hx8357d then loads and registers as /dev/fb1. fbcon is
> > not configured for that fb, and there is no subsequent hotplug event
> > (SPI displays aren't hotpluggable), so we have a fully configured
> > framebuffer exposed to userspace but the display itself isn't enabled
> > so we don't see anything :-(
> > Open and close /dev/dri/card1 and the lastclose hook calls
> > drm_fb_helper_restore_fbdev_mode_unlocked and we get the display
> > enabled.
>
> What you're describing sounds like the recent bug report at
>
>    https://gitlab.freedesktop.org/drm/amd/-/issues/2649
>
> which had similar symptoms with amdgpu. IIRC the console didn't
> initialize if the DRM hotplugging event happened before fbdev emulation
> was ready. DRM's fbdev code would then not see the hotplugged connector.
>
> Do you have commit 27655b9bb9f0 ("drm/client: Send hotplug event after
> registering a client") in your tree? (It's been ported into various
> stable branches as well.)

I was about to switch from my 6.1.55 build to the latest just to
ensure it hadn't been fixed, but that commit hit the 6.1 stable branch
in 6.1.43, so I do have it.

Other priorities have overtaken my investigation of this, but at least
knowing that it should enable the outputs (and nominally through the
hotplug hook) I can have another look at what is actually going on.

Thanks again
  Dave

> Best regard
> Thomas
>
> >
> > Is it intentional that we're left in this limbo state with the display
> > not enabled if fbcon isn't enabled on a framebuffer?
> >
> > We're trying to get people to transition from the fbdev drivers to DRM
> > equivalents, but this seems to be a backwards step if there is an
> > extra step required to get the display enabled. Many users are still
> > just using the framebuffer.
> >
> > Any input is much appreciated.
> >
> > Thanks,
> >    Dave
>
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
