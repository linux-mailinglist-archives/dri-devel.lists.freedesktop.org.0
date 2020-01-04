Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45FE12FF64
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jan 2020 01:09:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E4D36E37C;
	Sat,  4 Jan 2020 00:09:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA9C86E37C
 for <dri-devel@lists.freedesktop.org>; Sat,  4 Jan 2020 00:08:58 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id z22so40580540ljg.1
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Jan 2020 16:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yb2J3Cip7iuc6hM10iqStpjtiyPptdWBNQbgShe00mA=;
 b=ckB6a2/CZSKt2HPa91HMLEnivkFJd9oobT/VLs1rK7t7+q36M0ZgPyh8cNh4lBUIlf
 QdxWLXsZ2zxvGpaL3rmB3WKRppNliHHWvo2svPRe2zqyTNsQlrWLJoBwKJP/N197c1/2
 vZn1PZ6LQft7vNyj3yW8wC+tlf5WDiuBnYJDu8j/0sdB72gXbJhfthapeTwpEopIVR/M
 P5hGYV2Mv5BmTp02iIlaxdEtYEOgOgX/kb9KO74i2XZkkG8Gr6tywT0YjzQNZk1NjnTM
 jbMjp7U69Cr1O/Ob2QejDoW59p/QqVqadTnQQdsKbp2rr6KITb4AlB4MGZcqjCLAeYNJ
 K9qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yb2J3Cip7iuc6hM10iqStpjtiyPptdWBNQbgShe00mA=;
 b=qdE2HUN+uZw43c9ulm0ewNhJVlm05ZMnl5HokiSJXuWO92TUH7Kfc8hFFAalvFVlLp
 wx4uEJ2TiQ8CmlwFHFO1KdPWzjeDukf12EUcDfcmrV7wuFirPYeY2JgGZGd8B9PySvYK
 A0MAy9Tgvhy+DLzqJkEYwZ4+bQJb557LSjRfvShR3CgMm6PkiJ6BOvtUY8lXwU57RjqZ
 RR7XIiGsh/QosvATmoOf4tSJgG3Fqglzymu3pAlknTOENCEFhCCwMpL0gAKMuUFuQvF2
 AipWSAMw5bo3rVU5Fvn1SVlDe43vO3bS/g1FKW+WUoS58IeRJpBlZjyLsQrYKKLFQG8a
 vbyQ==
X-Gm-Message-State: APjAAAWgtP5vLb4Gc8qAv2SK+QAcE6iVfDAld/N2t6j0ERna3G8mhkiD
 5JRiADu/wqT1u7VRzEeN6F2NR3bi3JBQM3oFtr8uwF/cZfw=
X-Google-Smtp-Source: APXvYqz25sJv61iVrBa0v5Ep3qlMvsvNzQyFhlubU/3P3n9q3/oaRBPcG9yJTiCBo/smBn3oh6eIFQU5CWhNz08ec+I=
X-Received: by 2002:a2e:a0cd:: with SMTP id f13mr16548077ljm.251.1578096537000; 
 Fri, 03 Jan 2020 16:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20191114131525.3988-1-linus.walleij@linaro.org>
 <20191114131525.3988-2-linus.walleij@linaro.org>
 <20191120115247.GA52650@gerhold.net>
In-Reply-To: <20191120115247.GA52650@gerhold.net>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Sat, 4 Jan 2020 01:08:46 +0100
Message-ID: <CACRpkdZOhWVCfn5Wp9FiahnMdWvBEqT2OFxHPCk03HpYk791eQ@mail.gmail.com>
Subject: Re: [PATCH 2/2 v6] drm/panel: Add driver for Sony ACX424AKP panel
To: Stephan Gerhold <stephan@gerhold.net>
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
Cc: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Nov 20, 2019 at 12:53 PM Stephan Gerhold <stephan@gerhold.net> wrote:
> On Thu, Nov 14, 2019 at 02:15:25PM +0100, Linus Walleij wrote:

> > +     /* Calculate the PWM duty cycle in n/256's */
> > +     pwm_ratio = max(((duty_ns * 256) / period_ns) - 1, 1);
> > +     pwm_div = max(1,
> > +                   ((FOSC * period_ns) / 256) /
> > +                   SCALE_FACTOR_NS_DIV_MHZ);
>
> Does this handle the case where brightness = 0 (usually display off)?

Yeah for brightness = 0 it will get duty_ns = 0 and the max()
clause will set the duty cycle to 1.

> I have also often seen code like
>
>         if (bl->props.power != FB_BLANK_UNBLANK ||
>             bl->props.fb_blank != FB_BLANK_UNBLANK ||
>             bl->props.state & (BL_CORE_SUSPENDED | BL_CORE_FBBLANK))
>                 brightness = 0;
>
> to handle the blanking states. Not sure.

It makes sense to wind down the brightness to minimum when blanking
to save power, but that code seems a bit hairy, so not sure what
is the right thing to do here :/

I guess I could just implement enable/disable for the backlight and
wind it down to 0 in disable and back to whatever brightness is in
enable. But I don't know if that is a good idea since I don't really
enable/disable the backlight (it cannot be disable without shutting
down the display).

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
