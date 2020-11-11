Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B890A2AE520
	for <lists+dri-devel@lfdr.de>; Wed, 11 Nov 2020 01:48:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C5F689E06;
	Wed, 11 Nov 2020 00:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86D2C89E06
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Nov 2020 00:48:29 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id x11so194442vsx.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 16:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DwI3PFSKWVnaqeshY41Xp/YVBg2cD76OjiJIiFh3rNI=;
 b=QfIsIHzjHTjAr/jTdIRSiD+ZkEfLnev1EHOTrRrDDTB7WurSHmLapfGiBTNJvwGtWM
 n0cecZqV6gOBimx3dJHYoejdFvYV+lM1U9yYeRQ2K3KmHrsUZUWvTeK29NnQ/CF3BEKI
 m3e422SOkDPN1XTyRtLgENxmZHEnNWrVPZYPw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DwI3PFSKWVnaqeshY41Xp/YVBg2cD76OjiJIiFh3rNI=;
 b=PGOBDYdD1ysfpQPoRgBeOUM9U47BZaSNqySVkpvoWV4997XywXc/meGJqjzCuINva9
 ZmotBtWQU9SF3y56N5Xokc8Kp+P/IfuP6OGfYMTfVnThcjU0LLWXGA8GeC5wCYUMMO1M
 UcGq9jklwLoGb5h6tkiE574vLTg8tUAGJRy6rjplm+7eGuTSLi6RnaGzl2Lea1Cvzln+
 4KUfui6V2QnkvnYrlTFzjYAIfCUTuZS86hF0NAB2hygXfeQfqkE2LHMt8VBfUmZSNC12
 Qup+c5TYx+ok4ukii16TZO4fDX6ai5sx4yMR8ILlr9XQsM0pbt5YWCayY3jEdhztIOSj
 cAcg==
X-Gm-Message-State: AOAM5327D0yZ69uxkug3dXksWiI6+fgYamLzZZQdqDxoW3EmvAdfaLWg
 tp1b9A/kqc+Xt0vsbw2stOFqi4BYA2plaQ==
X-Google-Smtp-Source: ABdhPJzfEMMAVPVKz3NOJ5EX77peW8MqKYkofSI0p9cjSKK8H1m1bKCiUm1CcZrGPbIw0zOBhGm42w==
X-Received: by 2002:a67:d281:: with SMTP id z1mr9246363vsi.47.1605055708649;
 Tue, 10 Nov 2020 16:48:28 -0800 (PST)
Received: from mail-ua1-f41.google.com (mail-ua1-f41.google.com.
 [209.85.222.41])
 by smtp.gmail.com with ESMTPSA id h7sm54165vke.55.2020.11.10.16.48.28
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Nov 2020 16:48:28 -0800 (PST)
Received: by mail-ua1-f41.google.com with SMTP id a10so185398uan.12
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Nov 2020 16:48:28 -0800 (PST)
X-Received: by 2002:a9f:24eb:: with SMTP id 98mr11624331uar.90.1605055707756; 
 Tue, 10 Nov 2020 16:48:27 -0800 (PST)
MIME-Version: 1.0
References: <20200930223532.77755-1-bjorn.andersson@linaro.org>
 <20200930223532.77755-2-bjorn.andersson@linaro.org>
 <CAD=FV=Unu-PH_RThi3xRF1HUADN2PqcVAOin0O0yo0gcGRWCDQ@mail.gmail.com>
 <20201102170801.GI3151@builder.lan>
In-Reply-To: <20201102170801.GI3151@builder.lan>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 10 Nov 2020 16:48:16 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XEyn5tLhOFnVTP4W-_qQG_UpZ0npveEo-vE0Y=wKqaBg@mail.gmail.com>
Message-ID: <CAD=FV=XEyn5tLhOFnVTP4W-_qQG_UpZ0npveEo-vE0Y=wKqaBg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi86: Replace
 #pwm-cells
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Nov 2, 2020 at 9:08 AM Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Fri 02 Oct 15:42 CDT 2020, Doug Anderson wrote:
>
> > Hi,
> >
> > On Wed, Sep 30, 2020 at 3:40 PM Bjorn Andersson
> > <bjorn.andersson@linaro.org> wrote:
> > >
> > > While the signal on GPIO4 to drive the backlight controller indeed is
> > > pulse width modulated its purpose is specifically to control the
> > > brightness of a backlight.
> >
> > I'm a bit on the fence about this.  I guess you're doing this because
> > it avoids some -EPROBE_DEFER cycles in Linux?  It does seem to have a
> > few downsides, though.
> >
>
> No, the reason for exposing a backlight is that while the thing
> certainly is a PWM signal, the description of it and the registers
> available to control it surely seems "backlight" to me.
>
> In particular No, the reason for exposing a backlight is that while
> while the thing certainly is a PWM signal, the description of it and the
> registers available to control it surely seems "backlight" to me.
>
> > 1. It means a bit of re-inventing the wheel.  It's not a very big
> > wheel, though, I'll give you.  ...but it's still something.
> >
>
> The main problem I saw with exposing this as a PWM was the fact that we
> have both period and frequency to control...
>
> > 2. I'm not sure why you'd want to, but in theory one could use this
> > PWM for some other purposes.  It really is just a generic PWM.  Your
> > change prevents that.
> >
>
> ...and in the even that you use it as a "generic" PWM I'd expect that
> the specified period is related to the frequency of the signal. But the
> period is documented to be related to the number of brightness steps of
> the panel.

I think the key here is that the "number of brightness steps of the
panel" isn't really a thing that's worried about.  At least in my
experience, you can pretty much just use as many steps as you can
represent based on your PWM hardware.  If a panel happens to map some
of those steps to the same brightness then it wouldn't be the end of
the world, but in experience it's not really such a digital thing.  If
you choose 4096 steps then you likely get 4096 different brightness
levels.  If you choose 256 steps then you get 256 different brightness
levels.  Once you have "more than enough" steps then everything's
pretty much fine.

Looking at one random panel (just to get an idea of numbers), I see
that it specifies:
* min PWM Freq: 200 Hz
* max PWM Freq: 10,000 Hz.

...and refclk is something between 12 MHz and 38.4 MHz, right?

The bridge chip datasheet says:

PWM_FREQ = REFCLK_FREQ / (PWM_PRE_DIV * BACKLIGHT_SCALE + 1)

So let's see what we can do.  I'm arguing that we want the client to
be able to specify the PWM frequency and duty cycle and we'll do the
job of picking the number of steps.  We'll try for the most steps we
can get (65535).

I guess we need to solve for PWM_PRE_DIV :

PWM_FREQ * (PWM_PRE_DIV * BACKLIGHT_SCALE + 1) = REFCLK_FREQ
PWM_PRE_DIV * BACKLIGHT_SCALE + 1 = REFCLK_FREQ / PWM_FREQ
PWM_PRE_DIV * BACKLIGHT_SCALE = REFCLK_FREQ / PWM_FREQ - 1
PWM_PRE_DIV = (REFCLK_FREQ / PWM_FREQ - 1) / BACKLIGHT_SCALE

...and solve for BACKLIGHT_SCALE:
BACKLIGHT_SCALE = (REFCLK_FREQ / PWM_FREQ - 1) / PWM_PRE_DIV


With 1000 Hz, 12 MHz refclk:

PWM_PRE_DIV = DIV_ROUND_UP(12000000 / 1000 - 1, 65535)
=> 1
BACKLIGHT_SCALE = (12000000 / 1000 - 1) / 1
=> 11999

With 1000 Hz, 38.4 MHz refclk:
PWM_PRE_DIV = DIV_ROUND_UP(38400000 / 1000 - 1, 65535)
=> 1
BACKLIGHT_SCALE = (38400000 / 1000 - 1) / 1
=> 38399

With 200 Hz, 38.4 MHz refclk:
PWM_PRE_DIV = DIV_ROUND_UP(38400000 / 200 - 1, 65535)
=> 3
BACKLIGHT_SCALE = (38400000 / 200 - 1) / 3
=> 63999

Now that you have BACKLIGHT_SCALE specified, then when someone tries
to give you a duty cycle you just map it to the closest value you can
make.  Obviously you won't be able to perfectly make every exact duty
cycle / period that a client requests, but that's true of all PWMs out
there.

The nice thing here is that (assuming my math is right) we should be
getting nearly exactly the frequency that the client requested and
that (in my mind) is what matters.  You also get as many steps as
possible which means that (with the PWM backlight API) you'll be able
to get as close as possible to whatever a user requests.


> > > Drop the #pwm-cells and instead expose a new property to configure the
> > > granularity of the backlight PWM signal.
> > >
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > > ---
> > >  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml | 9 ++++++---
> > >  1 file changed, 6 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > index f8622bd0f61e..e380218b4646 100644
> > > --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> > > @@ -66,9 +66,12 @@ properties:
> > >        1-based to match the datasheet.  See ../../gpio/gpio.txt for more
> > >        information.
> > >
> > > -  '#pwm-cells':
> > > -    const: 1
> > > -    description: See ../../pwm/pwm.yaml for description of the cell formats.
> > > +  ti,backlight-scale:
> > > +    description:
> > > +      The granularity of brightness for the PWM signal provided on GPIO4, if
> > > +      this property is specified.
> > > +    minimum: 0
> > > +    maximum: 65535
> >
> > A few issues here:
> >
> > 1. Maybe call this "num-steps" instead of backlight-scale.  That's
> > essentially what it is, right?  Saying how many discrete steps you're
> > allowing in your backlight?
> >
>
> That would work, I had it as "max-brightness" for a while as well. But I
> reverted to backlight-scale, because that's the name used in the
> datasheet.
>
> I'm fine with whatever color of the shed though :)
>
> > 2. IMO you need the PWM frequency specified, since it can actually
> > matter.  NOTE: once you have the PWM frequency specified, you could
> > imagine automatically figuring out what "num-steps" was.  Really you'd
> > want it to be the largest possible value you could achieve with your
> > hardware at the specified frequency.  There's no advantage (is there?)
> > of providing fewer steps to the backlight client.
> >
>
> I guess there's no problem in having a "num-steps" that is unrelated to
> the number of brightness steps of the panel - but I did distinguish them
> because the datasheet clearly does so.

I think the datasheet talks about the number of steps that you will be
able to make, but that doesn't mean it has to be what's exposed to
clients of this driver, right?


> > 3. Some backlights are specified inverted.  It looks like this maps
> > nicely to the bridge chip, which has a bit for it.  Probably nice to
> > expose this?
> >
>
> Yes, that should be covered.
>
> > Of course, if we were just exposing the PWM directly to Linux we could
> > just use the PWM backlight driver and it'd all magically work.  ;-)
> >
>
> Please help me figure out how to properly expose this in the PWM api and
> I'll be happy to respin it using this - as you say my wheel does look
> pretty similar...

Hopefully the above seems sane to you?

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
