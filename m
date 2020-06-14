Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD05B1F8AE3
	for <lists+dri-devel@lfdr.de>; Sun, 14 Jun 2020 23:30:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA6289C69;
	Sun, 14 Jun 2020 21:29:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com
 [IPv6:2a00:1450:4864:20::141])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCBE889C69
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 21:29:55 +0000 (UTC)
Received: by mail-lf1-x141.google.com with SMTP id o4so712569lfi.7
 for <dri-devel@lists.freedesktop.org>; Sun, 14 Jun 2020 14:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZI+s+vuZYVYXENkB5WFtviHjlb9e/YHMnb5XhCBIwjM=;
 b=oBWUcvnFmtipG2SO6XX1tPwwWxr+ngYmgZlLH8MZxCqfubgpmlznK6xGO3cbVmykDa
 5o/3ErFMS57pMiEFxLsPJf3yW1WCUTQLF4JXkQysje1c20lgzMJmzoHHyJnztZztDw25
 +feii/M898tt8KD+nECGla/m/fNBTFt+FwuRLk0z1JD7600ejlZHLpD4+31TqySR0Gik
 QSV1WaR6HskykZH0rfYTTtFLlPd4+ck0T2Mb+D0MiPQCmi/vRivz1YFaG4bZiO8w56QY
 JtpM6gtF1msYuX8RmT2ItPWMgkHCuTLSIArPnfIohlh+e1KwzNXVlcu2oPkNi9JHAupp
 q+pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZI+s+vuZYVYXENkB5WFtviHjlb9e/YHMnb5XhCBIwjM=;
 b=TwnhQjzrfZXj1nD/0QG0V2MZxgDwTMdqEQGARC+HWvjTBa5DlRZiA3lTqzqmy0UhOG
 6nub59oeZl4GiyVS8uSHq+zqlkhof5a9I6aZ44szdZo6jkVyu8fW0n7+XgM1YUS7HzYm
 FhwIpSnTgudIn0+63rnOX70mA0vPdT9fvPycCdoa3O4hC7vfPXnoDKCyw57sIyXBGlUP
 wAPcGxS+uwhRmR8IoJhXCZAymSfBgGFBh/dSRWPjOXYe1pZN72sTBzr2wP0Y8HHbThHt
 owM6cVjV7Uf/bBn8e3jCYB5yxabvXWoxAX2EHdfMuBKs4M+aV0wUyNhqbboFv84l6J9d
 /6Gw==
X-Gm-Message-State: AOAM533ulIGHWPnrMpBmmwv9efUKbYxNd4zDo4vO3NMaO+ZiHs6XneOh
 IMSUcwJ0UDOfKO2qAHs76TQX7Hx5W3zYhkGXFKndGA==
X-Google-Smtp-Source: ABdhPJzsH/JmYg0+a+Uo74Jvzw5AauKcOGKFT3BjOYrXtTsxlwyVSQPhoH7dduxHHtSLcrEKsj4c7RjoIsOoIqRxWdM=
X-Received: by 2002:ac2:482a:: with SMTP id 10mr3700096lft.217.1592170194208; 
 Sun, 14 Jun 2020 14:29:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200613223027.4189309-1-linus.walleij@linaro.org>
 <20200614074441.GA220677@ravnborg.org>
In-Reply-To: <20200614074441.GA220677@ravnborg.org>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sun, 14 Jun 2020 23:29:43 +0200
Message-ID: <CACRpkdZNM7+qzbJqyfJfEDO8P9SqpO4W6+t0-t89CXeFk9tSRw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm: mcde: Fix display initialization problem
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Sean Paul <sean@poorly.run>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, Jun 14, 2020 at 9:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Linus.
>
> On Sun, Jun 14, 2020 at 12:30:26AM +0200, Linus Walleij wrote:
> > The following bug appeared in the MCDE driver/display
> > initialization during the recent merge window.
> >
> > First the place we call drm_fbdev_generic_setup() in the
> > wrong place: this needs to be called AFTER calling
> > drm_dev_register() else we get this splat:
> >
> >  ------------[ cut here ]------------
> > WARNING: CPU: 0 PID: 1 at ../drivers/gpu/drm/drm_fb_helper.c:2198 drm_fbdev_generic_setup+0x164/0x1a8
> > mcde a0350000.mcde: Device has not been registered.
> > Modules linked in:
> > Hardware name: ST-Ericsson Ux5x0 platform (Device Tree Support)
> > [<c010e704>] (unwind_backtrace) from [<c010a86c>] (show_stack+0x10/0x14)
> > [<c010a86c>] (show_stack) from [<c0414f38>] (dump_stack+0x9c/0xb0)
> > [<c0414f38>] (dump_stack) from [<c0121c8c>] (__warn+0xb8/0xd0)
> > [<c0121c8c>] (__warn) from [<c0121d18>] (warn_slowpath_fmt+0x74/0xb8)
> > [<c0121d18>] (warn_slowpath_fmt) from [<c04b154c>] (drm_fbdev_generic_setup+0x164/0x1a8)
> > [<c04b154c>] (drm_fbdev_generic_setup) from [<c04ed278>] (mcde_drm_bind+0xc4/0x160)
> > [<c04ed278>] (mcde_drm_bind) from [<c04f06b8>] (try_to_bring_up_master+0x15c/0x1a4)
> > (...)
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yup, this is the right way to do it.
>
> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

Hm I can't seem to apply these because drm-misc-fixes isn't
rebased to v5.8-rc1 or something (wrong ancestor).

Does anyone know if ther is a special trick for this or do I
need to wait for someone else to rebase that branch?

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
