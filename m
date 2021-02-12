Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37735319B59
	for <lists+dri-devel@lfdr.de>; Fri, 12 Feb 2021 09:44:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 002D46E039;
	Fri, 12 Feb 2021 08:43:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C34E86E039
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 08:43:57 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id v30so11668879lfq.6
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Feb 2021 00:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FP964N0yXOJ4rpUgA4bEM56g6XPhYoLW1BtZkV2A35A=;
 b=AJmM+kRRL94sEedEiMs2DaQ3D5/OyiiMsVU4chwMF4/tXJwPqStJkXMpxFbfnMV0Ob
 c74RYuXJUsteSGW2vCA9Qe/d8p1Q43bSRUsM+WHmw7nILVNFw/APai5KvZCDb3Z2Qh7A
 BHLdprWS1az3WKjh4P5foJhhy+SNfCuvs2SEdIWTr4Tf1GUUi21vh9G18Y4Wo323OH9A
 cemVjXzpECoA1zy0tARny66kgqklweTSQ9R5B9VolSQyRtZ8ltUXZdMJV3Poh5PgqorI
 eH/dA1lRPgRUChoxBpvYVSqMXBBXmwtIAcYdpomCVDHGolsgXH3/2s7VWvmLXT03dfWV
 F2bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FP964N0yXOJ4rpUgA4bEM56g6XPhYoLW1BtZkV2A35A=;
 b=QnLQop0X4x0JKJm7HWKJXPiJXFbOzv7bacawYn1IrXHXAfDcdk30ba4JEt2TgewltY
 RSCnr6siR9zekkzEvsZgwClANSH02JYtJu5IiY6d71hiz8v7nqXz2kY3owyyHDA/IZQB
 bnAX3aHmT75bolKW1BLFewFaCijezvvF8/W9gIObd1Pe2lVO8VXZPJBs26c/IKTpdjxz
 /E9JZ8u161mIIIL/8rN/FyNvrpFsMva+lw35nwqL9n3WzjNt1NL6mrh2f7yj5fqXiVwz
 cmne5OnTkHnqVR17WlSKWOwtwn5FjwPSXWhvQ7wIbc4sWzQCUwqQdwEFnqkqAI5bK08k
 pKHA==
X-Gm-Message-State: AOAM530EW9LkHrPfIVlIVxKk47pLQJC7OyRe/QzGi9KzElPkeVpu9bFo
 PF1r7QfAhjKDhpxJPDSGYe5eeko1oeqznFCvo0c/6A==
X-Google-Smtp-Source: ABdhPJzukrfZH58S7ratEGjXOfQO/XDteY0OwdbL9rhaSfxGiyMOQSjbe1ZcELRa3GVUBP5SjIc/5vc+L7YkfnLXS8s=
X-Received: by 2002:a05:6512:519:: with SMTP id
 o25mr1056543lfb.529.1613119436187; 
 Fri, 12 Feb 2021 00:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20210130181014.161457-1-marex@denx.de>
 <20210130181014.161457-2-marex@denx.de>
 <CAD=FV=WzW1L=nwcnhagCXfX5SStE0jr0bqRrEOi-46g4huD4Sw@mail.gmail.com>
 <49db7ef3-fa53-a274-7c69-c2d840b13058@denx.de>
 <CAD=FV=Ve3hj8YOSRnJn7kzULPaPqyWCT9_qDHU+LZi=C+69+Xw@mail.gmail.com>
 <754e1868-9a5f-39ab-ac14-0e84492e145b@denx.de>
In-Reply-To: <754e1868-9a5f-39ab-ac14-0e84492e145b@denx.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Fri, 12 Feb 2021 09:43:45 +0100
Message-ID: <CACRpkdb+Rc40sbVh64wuNiH4bvgwAz8DAP4j34Y4aDywbGx9CQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/bridge: ti-sn65dsi83: Add TI SN65DSI83 driver
To: Marek Vasut <marex@denx.de>
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
Cc: Doug Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Philippe Schenker <philippe.schenker@toradex.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Valentin Raevsky <valentin@compulab.co.il>, Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Feb 4, 2021 at 11:05 PM Marek Vasut <marex@denx.de> wrote:
> On 2/4/21 10:10 PM, Doug Anderson wrote:

> >>>> +       /*
> >>>> +        * Reset the chip, pull EN line low for t_reset=10ms,
> >>>> +        * then high for t_en=1ms.
> >>>> +        */
> >>>> +       gpiod_set_value(ctx->enable_gpio, 0);
> >>>
> >>> Why not use the "cansleep" version to give some flexibility?
> >>
> >> Does that make a difference in non-interrupt context ?
> >
> > As I understand it:
> >
> > * If a client calls gpiod_set_value() then the underlying GPIO can
> > only be one that doesn't sleep.
> >
> > * If a client calls gpiod_set_value_cansleep() then the underlying
> > GPIO can be either one that does or doesn't sleep.
> >
> > * A client is only allowed to call gpiod_set_value_cansleep() if it's
> > not in interrupt context.
> >
> > You are definitely not in an interrupt context (right?), so calling
> > the "cansleep" version has no downsides but allows board designers to
> > hook up an enable that can sleep.
>
> Linus, can you please confirm this ? I find this hard to believe, since
> there are plenty of places in the kernel which use gpiod_set_value()
> without the _cansleep, are those problematic then ?

The function looks like so:

void gpiod_set_value(struct gpio_desc *desc, int value)
{
        VALIDATE_DESC_VOID(desc);
        /* Should be using gpiod_set_value_cansleep() */
        WARN_ON(desc->gdev->chip->can_sleep);
        gpiod_set_value_nocheck(desc, value);
}

So if the chip has set ->can_sleep (i,e, this GPIO is on something
like an I2C bus) then a warning will appear.

The warning only really appear if you have a driver that was
previously only used on a gpiochip with "fast" (write a register)
GPIOs and somebody start to use the same driver with a
GPIO on e.g. an I2C bus, which will define ->can_sleep.

The simple solution to the warning is to switch to the
_cansleep() variant but really it is a sign to check that
this is not being called in atomic context and just check
that the driver overall will survive sleeping context
here.

In a way _cansleep() is just syntactic sugar.

In this driver, you can use _cansleep() if you like but not
using it mostly works too, if used with SoC-type GPIOs.
Whoever uses the driver with a GPIO on an I2C chip
or similar gets to fix it.

Yours,
Linus Walleij
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
