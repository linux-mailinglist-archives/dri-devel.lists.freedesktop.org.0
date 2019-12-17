Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE049122FFA
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 16:19:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88EC36E12F;
	Tue, 17 Dec 2019 15:19:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9D136E12F
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 15:19:27 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id 9so7222639lfq.10
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2019 07:19:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jqAk5G8jwtCY6zzCDAChWWjv196ibOKKiTk0nTN3tV8=;
 b=H1PhmPd1aE/4LXPJTl4QVaxWRUGh1i8w30IXjOqvv0vCPjEn0OCJzOGVLrWEB8vyCB
 B9xCvIuerI/hd1Qfq0HS6X6klMLZ+aE6z02SeGQXfyFOzu4WdYXCjiJ6pIf/ltOUSRmh
 /Gi7r6bvEdKTtYEvc7nPFeusDSzuMPBZr43yIjDAO1MSRtg7jXMV35dHMQS2gW4UouNW
 4ThZ7/6b6HPN31Am+EDqBkUiOzbYSV5G76WTSunvr2vzd+2PEJ+DUOvQs+J9vPFnTvhL
 5l2o4sbBOLF1xaaP6jyLRCAopef1a/HoH0BhjCL3HE4NVorkRuo2ZC0sQwaesL59gZ0E
 P96A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jqAk5G8jwtCY6zzCDAChWWjv196ibOKKiTk0nTN3tV8=;
 b=BbUi2QwDBK4dUlo/ojVBP7I85FXopoxwdwBWs6WTmunV4FSdxgtv03dALfVL5sU+Fo
 6F7AK50kjZGr50gsVSyK5L2uW84l2ozYJSDs4REDTHrCKtBSiXGRACmXST8x+giRTGR5
 GT4aB+Y/yz1euUCyOZW3zpN4b3hUSZBkoUOuI88cLcuWdik/kl8gXPIECNc9vYMw0STp
 5Ak2nVauHz4ealjpCy59yp62vwBJ78tCuFDRGaQvIEe+dv5sQDIV4vDfai3G4ypZEIP3
 o26QuTLB9orjLi7JOECQ31NVFbLqnyja5E2Vvt82QVRHLTfN3USrfn3i0ds/CJfoVTfu
 wlxQ==
X-Gm-Message-State: APjAAAVJ4YCU52Y981fKgXu/X8e5ZMAaOpA3XAFEtlMh0RELlZ+GGCFk
 0kjVbvghcotflgCF1zni3jmF450QSqO+FqSXkZXOFXFpPSthow==
X-Google-Smtp-Source: APXvYqwdqEz/0Smh9SwFvjSIZZ7eEgv3NgCuWT2gpuZ78nzMRjNcBE3CIk6O3+gUww78wgD0oeMDSNDVlaGlhTg45/8=
X-Received: by 2002:a19:8a41:: with SMTP id m62mr3067701lfd.5.1576595966293;
 Tue, 17 Dec 2019 07:19:26 -0800 (PST)
MIME-Version: 1.0
References: <20191203123143.118487-1-linus.walleij@linaro.org>
 <20191216162729.GR2369@dell>
In-Reply-To: <20191216162729.GR2369@dell>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 17 Dec 2019 16:19:13 +0100
Message-ID: <CACRpkdZARO4wtDEapAKhKkVinrG-suXOCk2DR3xD9OwaUVXrAA@mail.gmail.com>
Subject: Re: [PATCH] backlight: corgi: Convert to use GPIO descriptors
To: Lee Jones <lee.jones@linaro.org>
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
Cc: Jingoo Han <jingoohan1@gmail.com>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Andrea Adami <andrea.adami@gmail.com>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Robert Jarzmik <robert.jarzmik@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 16, 2019 at 5:27 PM Lee Jones <lee.jones@linaro.org> wrote:
> On Tue, 03 Dec 2019, Linus Walleij wrote:
>
> > The code in the Corgi backlight driver can be considerably
> > simplified by moving to GPIO descriptors and lookup tables
> > from the board files instead of passing GPIO numbers using
> > the old API.
> >
> > Make sure to encode inversion semantics for the Akita and
> > Spitz platforms inside the GPIO lookup table and drop the
> > custom inversion semantics from the driver.
> >
> > All in-tree users are converted in this patch.
> >
> > Cc: Andrea Adami <andrea.adami@gmail.com>
> > Cc: Robert Jarzmik <robert.jarzmik@free.fr>
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> >  arch/arm/mach-pxa/corgi.c           | 12 ++++-
> >  arch/arm/mach-pxa/spitz.c           | 34 +++++++++++----
>
> Does this have an Arm Ack yet?

Yes Robert Jarzmik is the maintainer of arch/arm/mach-pxa,
or do you mean I should ask for the ARM SoC maintainers'
ACK explicitly (then I'd just resend, NP).

> >  drivers/video/backlight/corgi_lcd.c | 68 ++++++++---------------------
> >  include/linux/spi/corgi_lcd.h       |  3 --
>
> What about SPI?

That include file should technically be in the backlight
include path or platform_data (yeah someone should
fix...) but let's ask Mark explicitly if this is OK.

Mark: the hunk hitting the include/linux/spi/corgi_lcd.h
file looks like this:

@@ -11,9 +11,6 @@ struct corgi_lcd_platform_data {
        int     default_intensity;
        int     limit_mask;

-       int     gpio_backlight_on;      /* -1 if n/a */
-       int     gpio_backlight_cont;    /* -1 if n/a */
-
        void (*notify)(int intensity);
        void (*kick_battery)(void);
 };

OK with you? If you want I can resend the whole patch
as well so you can have a look.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
