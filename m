Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5D111B55CB
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 822CB6E25C;
	Thu, 23 Apr 2020 07:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B79E6E064
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 21:07:16 +0000 (UTC)
Received: by mail-pg1-x541.google.com with SMTP id o10so1721848pgb.6
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 14:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=yYFgm6k+SKz3ejYj+FYyDA7g39gAXfrn+kXnE9ATOmU=;
 b=WnuOsK8R6ZcVNEH9RpDrL19IbsTKzx70PWR1cPT3mt/v2D5lrZ/sZAT7i11g4LxQyM
 tEc5rzj5dmkRNFX0AzYwfg7kBEQt6G5pQJi5LC91dNX2GL6Ytpeohz8de5n0j20nOSbB
 gaq98qoI0gc0RLhzhG+O//dnBphWj6EkcUcdY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=yYFgm6k+SKz3ejYj+FYyDA7g39gAXfrn+kXnE9ATOmU=;
 b=TlAk1rZZiVc9X2T/ycNAZHUq+k6fm6d2Y5vOLLt45RPJYNbAYSLEKxJBYZzPu3XTXh
 iMCFg1zrzgamjENxrP3p84DatptNZw3fG/RH8bSi5fEZMRdxhf4mm5wkleMFea7rVPwh
 8i9mWDHrB9xCeEK17+CfUI9aenX8T7O98rU+f9cf/98WjnTwKGGNSG5am/s7AHLDxTJw
 qZHY12h+CXJIp25nSjSjgu/hAvU2mmE0dSEc/8j0j71eHCB10QXyDZxKL7tCXP7vZTdI
 OXJBdjU9MYQgTbkqhyLBbmQsMpNvyuBvKXOSfFZ6pr1QJWa3wws4m//lLXIbY6h5TUjT
 rIlg==
X-Gm-Message-State: AGi0PuawlaKI1LMket3qskq5PGvNfOg95R1KoZ9AtOZIkgzdLHcUYg3/
 OLFlel8rywtxhXdrMZ3DyMFGhA==
X-Google-Smtp-Source: APiQypLCjp0MO+pB/OKNlDsxnnqLf9QDC9zcE5mnr5BitNxIRpRJvo6QBMrvhjpg03twkwQtwXmq8Q==
X-Received: by 2002:a63:f703:: with SMTP id x3mr920352pgh.11.1587589635649;
 Wed, 22 Apr 2020 14:07:15 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
 by smtp.gmail.com with ESMTPSA id nm22sm144879pjb.38.2020.04.22.14.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Apr 2020 14:07:14 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAD=FV=WJONhm4ukwZa2vGtozrz_SmLuTCLxVimnGba7wRPPzgQ@mail.gmail.com>
References: <20200421050622.8113-1-dianders@chromium.org>
 <20200420220458.v2.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
 <158755100643.159702.17904334834962681759@swboyd.mtv.corp.google.com>
 <CAD=FV=WJONhm4ukwZa2vGtozrz_SmLuTCLxVimnGba7wRPPzgQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
From: Stephen Boyd <swboyd@chromium.org>
To: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Apr 2020 14:07:13 -0700
Message-ID: <158758963395.230545.16210525372433383386@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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
Cc: Rob Clark <robdclark@chromium.org>,
 OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 bgolaszewski@baylibre.com, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jeffrey Hugo <jeffrey.l.hugo@gmail.com>, Sandeep Panda <spanda@codeaurora.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jonas Karlman <jonas@kwiboo.se>,
 Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 GPIO SUBSYSTEM <linux-gpio@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Doug Anderson (2020-04-22 09:09:17)
> Hi,
> 
> On Wed, Apr 22, 2020 at 3:23 AM Stephen Boyd <swboyd@chromium.org> wrote:
> >
> > Quoting Douglas Anderson (2020-04-20 22:06:17)
> >
> > > Changes in v2:
> > > - ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
> > >
> > >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 165 ++++++++++++++++++++++++++
> > >  1 file changed, 165 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index 6ad688b320ae..d04c2b83d699 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -874,6 +886,153 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
> > >         return 0;
> > >  }
> > >
> > > +static struct ti_sn_bridge *gchip_to_pdata(struct gpio_chip *chip)
> > > +{
> > > +       return container_of(chip, struct ti_sn_bridge, gchip);
> > > +}
> > > +
> > > +static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
> > > +                                          unsigned int offset)
> > > +{
> > > +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> > > +
> > > +       return (atomic_read(&pdata->gchip_output) & BIT(offset)) ?
> >
> > Any reason this isn't a bitmap?
> 
> Don't bitmaps need an external lock to protect against concurrent
> access? 

Bitmaps are sometimes atomic. See Documentation/atomic_bitops.txt for
more info. From what I see here it looks like we can have a bitmap for
this and then use set_bit(), test_and_set_bit(), etc. and it will be the
same and easier to read.

> When I looked I wasn't convinced that the GPIO subsystem
> prevented two callers from changing two GPIOs at the same time.  See
> below for a bigger discussion.
> 
> 
> > > +               GPIOF_DIR_OUT : GPIOF_DIR_IN;
> >
> > And why can't we read the hardware to figure out if it's in output or
> > input mode?
> 
[...]
> 
> In the next version of the patch I'll plan to add a kerneldoc comment
> to "struct ti_sn_bridge" and add a summary of the above for
> "gchip_output".

Yeah it deserves a comment in the code indicating why it doesn't read
the hardware.

> 
> 
> > > +}
> > > +
> > [...]
> > > +static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
> > > +                                             unsigned int offset, int val)
> > > +{
> > > +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> > > +       int shift = offset * 2;
> > > +       int old_gchip_output;
> > > +       int ret;
> > > +
> > > +       old_gchip_output = atomic_fetch_or(BIT(offset), &pdata->gchip_output);
> >
> > I presume gpiolib is already preventing a gpio from being modified twice
> > at the same time. So is this atomic stuff really necessary?
[...]
> None of these appear to do any locking.  There's sorta an implicit
> lock in that only one client can "request" a given GPIO at the same
> time so the assumption that we're somewhat protected against two
> concurrent accesses of the exact same GPIO is a bit justified.  ...but
> nothing appears to protect us from concurrent accesses of different
> GPIOs.
> 
> I also notice that other GPIO drivers seem to grab their own locks.
> If it makes the patch more palatable, I can get rid of all the atomic
> stuff and put in a big mutex?

No. I'd rather see the bitmap APIs used instead of a custom bitmap
overlaid on an atomic_t. Otherwise it seems fine to assume a GPIO can't
be touched by two entities at once and thus nothing to worry about for
locking at the driver level for that.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
