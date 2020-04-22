Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E72D81B49C3
	for <lists+dri-devel@lfdr.de>; Wed, 22 Apr 2020 18:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 017BC6EA28;
	Wed, 22 Apr 2020 16:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-x944.google.com (mail-ua1-x944.google.com
 [IPv6:2607:f8b0:4864:20::944])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5357D6EA28
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 16:09:32 +0000 (UTC)
Received: by mail-ua1-x944.google.com with SMTP id g10so2223175uae.5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=T7WB2HoF0WdrIBv4ktK6B9A0gQgQTPn58z8FyVNp2Jo=;
 b=YUweHA8CPztpA/loYxHMeUD6/w6PlfE/ulWxFTAqTelrd/PSlWYfc59LLKgL0oup6K
 Wzp8tzuL9Y46ob+y6q3r39I+vyASikO8AKSyHcHHm+6yF1JC7x79QyduJb7BeQXAdP36
 +G9cFYFIEVSpCrwxqE2aTcNw0iAIiuBDIQHVU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=T7WB2HoF0WdrIBv4ktK6B9A0gQgQTPn58z8FyVNp2Jo=;
 b=RD0ExAFyLqhTI7de6C9GILMnRgflvhRBK8sZZH/AqZ9aS1DAofnu2NFWer8nyRLtNp
 xMZxPPM5AU0bLhRX2719jbRtS5qAngCv5RbYtFDtA6ZuRiYAC4892KG7pOWAMta2tBZ4
 lvhvc8XCZi7aqNaAbthFzsVB8Bv2ozIe5KNmeyu6ytAbpwNYD9tzFOj2NdzrodgF2NdS
 fPsCjCB8bUIXL/vykB65RIt0D3fSj8MtYLnjw7iyy49Mh1o6gPb++UUQMKf9+0mNnkZm
 PNzcxObGQf/NaLNMbRPibMnYXvVVompDIf9ekhbxarethM5nd0wn9PL5uGQP5SOxDkwu
 qiWw==
X-Gm-Message-State: AGi0PuZeyuYK05CEvvW35kJ/IHpqyGa69e+y/gPtFq1fkEeRY5P6UC3k
 acJoTNn3jT/a7QbtgFqHc1EXjVrvL/8=
X-Google-Smtp-Source: APiQypL7qZRFS1VNgowiKN6GiSn32wNrkcbu970TmaFUhOy47Ky92tLKHowMQae+ZYoXVd+IH6gseg==
X-Received: by 2002:a67:edd8:: with SMTP id e24mr5086439vsp.46.1587571770656; 
 Wed, 22 Apr 2020 09:09:30 -0700 (PDT)
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com.
 [209.85.222.43])
 by smtp.gmail.com with ESMTPSA id s9sm1709915vkl.21.2020.04.22.09.09.29
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Apr 2020 09:09:30 -0700 (PDT)
Received: by mail-ua1-f43.google.com with SMTP id a6so2234789uao.2
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 09:09:29 -0700 (PDT)
X-Received: by 2002:ab0:375a:: with SMTP id i26mr16701248uat.120.1587571768922; 
 Wed, 22 Apr 2020 09:09:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200421050622.8113-1-dianders@chromium.org>
 <20200420220458.v2.1.Ia50267a5549392af8b37e67092ca653a59c95886@changeid>
 <158755100643.159702.17904334834962681759@swboyd.mtv.corp.google.com>
In-Reply-To: <158755100643.159702.17904334834962681759@swboyd.mtv.corp.google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Apr 2020 09:09:17 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WJONhm4ukwZa2vGtozrz_SmLuTCLxVimnGba7wRPPzgQ@mail.gmail.com>
Message-ID: <CAD=FV=WJONhm4ukwZa2vGtozrz_SmLuTCLxVimnGba7wRPPzgQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] drm/bridge: ti-sn65dsi86: Export bridge GPIOs to
 Linux
To: Stephen Boyd <swboyd@chromium.org>
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
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
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
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Wed, Apr 22, 2020 at 3:23 AM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Douglas Anderson (2020-04-20 22:06:17)
> > The ti-sn65dsi86 MIPI DSI to eDP bridge chip has 4 pins on it that can
> > be used as GPIOs in a system.  Each pin can be configured as input,
> > output, or a special function for the bridge chip.  These are:
> > - GPIO1: SUSPEND Input
> > - GPIO2: DSIA VSYNC
> > - GPIO3: DSIA HSYNC or VSYNC
> > - GPIO4: PWM
> >
> > Let's expose these pins as GPIOs.  A few notes:
> > - Access to ti-sn65dsi86 is via i2c so we set "can_sleep".
> > - These pins can't be configured for IRQ.
> > - There are no programmable pulls or other fancy features.
> > - Keeping the bridge chip powered might be expensive.  The driver is
> >   setup such that if all used GPIOs are only inputs we'll power the
> >   bridge chip on just long enough to read the GPIO and then power it
> >   off again.  Setting a GPIO as output will keep the bridge powered.
> > - If someone releases a GPIO we'll implicitly switch it to an input so
> >   we no longer need to keep the bridge powered for it.
> >
> > Becaue of all of the above limitations we just need to implement a
>
> Because
>
> > bare-bones GPIO driver.  The device tree bindings already account for
> > this device being a GPIO controller so we only need the driver changes
> > for it.
> >
> > NOTE: Despite the fact that these pins are nominally muxable I don't
> > believe it makes sense to expose them through the pinctrl interface as
> > well as the GPIO interface.  The special functions are things that the
> > bridge chip driver itself would care about and it can just configure
> > the pins as needed.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > Cc: Linus Walleij <linus.walleij@linaro.org>
> > Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> > ---
> >
>
> Cool patch.
>
> > Changes in v2:
> > - ("Export...GPIOs") is 1/2 of replacement for ("Allow...bridge GPIOs")
> >
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 165 ++++++++++++++++++++++++++
> >  1 file changed, 165 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index 6ad688b320ae..d04c2b83d699 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -874,6 +886,153 @@ static int ti_sn_bridge_parse_dsi_host(struct ti_sn_bridge *pdata)
> >         return 0;
> >  }
> >
> > +static struct ti_sn_bridge *gchip_to_pdata(struct gpio_chip *chip)
> > +{
> > +       return container_of(chip, struct ti_sn_bridge, gchip);
> > +}
> > +
> > +static int ti_sn_bridge_gpio_get_direction(struct gpio_chip *chip,
> > +                                          unsigned int offset)
> > +{
> > +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> > +
> > +       return (atomic_read(&pdata->gchip_output) & BIT(offset)) ?
>
> Any reason this isn't a bitmap?

Don't bitmaps need an external lock to protect against concurrent
access?  When I looked I wasn't convinced that the GPIO subsystem
prevented two callers from changing two GPIOs at the same time.  See
below for a bigger discussion.


> > +               GPIOF_DIR_OUT : GPIOF_DIR_IN;
>
> And why can't we read the hardware to figure out if it's in output or
> input mode?

A few reasons:

1. If nobody else had the bridge powered on this would be a slow
operation involving powering the bridge on, querying via i2c, and then
powering the bridge off.  Not only would it be slow but you'd be
powering the chip up for no really good reason.  You didn't need to
know anything that only the chip could tell you.

2. If nobody else had the bridge powered on then the bridge loses
state and resets to defaults (everything resets to "input").  Yes, we
could still power the bridge up and confirm this, but...

3. This bitmap does double-duty of not only knowing whether a pin is
input or output but also whether we've incremented the "pm_runtime"
refcount in order to keep the output driven.  Knowing whether we've
already incremented the "pm_runtime" refcount can simplify a bit of
the code because we know whether it's powered without having to power
it on and query.  If we didn't have a cache, then when we changed a
pin to input we'd do:

pm_runtime_get() // Make sure we can access
if dir_was_output:
  pm_runtime_put() // Not driving anymore
set_to_input();
pm_runtime_put()  // Done with access

...basically in some cases we'd do pm_runtime_put() twice in the same
function.  It'd work, but feels like a worse solution than the one in
my patch.

4. When I bootup I see that this call gets made once per GPIO in
gpiochip_add_data_with_key().  There's no reason to go through all the
slowness when we know these pins are inputs.


In the next version of the patch I'll plan to add a kerneldoc comment
to "struct ti_sn_bridge" and add a summary of the above for
"gchip_output".


> > +}
> > +
> [...]
> > +static int ti_sn_bridge_gpio_direction_output(struct gpio_chip *chip,
> > +                                             unsigned int offset, int val)
> > +{
> > +       struct ti_sn_bridge *pdata = gchip_to_pdata(chip);
> > +       int shift = offset * 2;
> > +       int old_gchip_output;
> > +       int ret;
> > +
> > +       old_gchip_output = atomic_fetch_or(BIT(offset), &pdata->gchip_output);
>
> I presume gpiolib is already preventing a gpio from being modified twice
> at the same time. So is this atomic stuff really necessary?

Right.  I've assumed that we're not running two of these functions at
the same time for the same GPIO.  I'm not convinced that the GPIO core
enforces this but it seems like it'd be undefined behavior for a
client to be, for instance, setting and changing direction for the
same GPIO in two threads at the same time.  Where simple I've tried to
make it so it wouldn't horribly break if someone did some amount of
concurrent access of the same pin but not every corner case is
handled.  Mostly I focused on making sure that I could never mess up
keeping track of whether I incremented the "pm_runtime" refcount for a
pin.  One thing specifically I didn't handle: if we were midway
through ti_sn_bridge_gpio_set(), we context switched out and someone
changed us to an input, then we'd possibly do an unpowered
regmap_update_bits() and timeout.

What I do think is a sensible case to handle, though, is someone
working with two different GPIOs exported by this controller at the
same time.  IIUC atomic_t allows me to only spend 1 bit per pin, have
no lock, and still make sure these different consumers don't stomp on
each other.

NOTE: I did a quick trace for the call chain when using the "gpioget"
command-line tool.  I saw:

- ti_sn_bridge_gpio_get()
- gpio_chip_get_multiple()
- gpiod_get_array_value_complex()
- linehandle_ioctl()

None of these appear to do any locking.  There's sorta an implicit
lock in that only one client can "request" a given GPIO at the same
time so the assumption that we're somewhat protected against two
concurrent accesses of the exact same GPIO is a bit justified.  ...but
nothing appears to protect us from concurrent accesses of different
GPIOs.

I also notice that other GPIO drivers seem to grab their own locks.
If it makes the patch more palatable, I can get rid of all the atomic
stuff and put in a big mutex?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
