Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC94F52EF85
	for <lists+dri-devel@lfdr.de>; Fri, 20 May 2022 17:45:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2377210E55E;
	Fri, 20 May 2022 15:45:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8286910E55E
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 15:45:30 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id p26so11307103eds.5
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 08:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8QFFkfheRDcRMZUEeXPnmBkN/+sAvzTmwN5XHFZ6Mh4=;
 b=k8MHYHNChdziwHOExhML5lxcgSGSD9/hlw8O2m1yktYbuXa8gUhYDCOX4RvyLfzunq
 /aAKeZZuLTsajP3X+vG03Ss0A7Nxo1WtNc1cC/anRUyFi+vMz7cm1qIEAQsQvtYo7m8v
 pePkt63pjEEwttcJmM8rZfdV9Fxd9ADpAU6jg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8QFFkfheRDcRMZUEeXPnmBkN/+sAvzTmwN5XHFZ6Mh4=;
 b=2qTkryJhObT6VTWqWjEoGJTdBanFPEPbZ9x3tgxSDBZ1x65rme4hX2WHyK25GFdC4n
 s2s1xe+b2OtX9sfQa8RQDj4iaZuy+BwS9rYQP0FQf1u1fomWMXOaU28eTaFMHUq15QmG
 yhytL+1tmJ+BnABfAvSsIqFUlV4eSqqbvYW+6aomnhOjzfl2P/AkSpuNziSuJjb6JEay
 c0byx5E3Pm3PFBHzBahZZgloAD8MWAU+VWwDGTz2T3pwQ16zplhAIsKV2UkWaj9/L6Xf
 FuLEp23kY8ASZ9knRPQIqhRJJtnaWR2YQ2iDrBIlQGGzNdkHe5Lf55G8N1oPV7H1hZ73
 IpYg==
X-Gm-Message-State: AOAM5316WlsULeG0RuU0kPB46dl9M+KKOjdfSKN8XCR4Ehl2hneQ2XnG
 3WQL8n2ue7jt16582Nh1rUOMdDH5bRhBQBhoXFc=
X-Google-Smtp-Source: ABdhPJyiMvGkhcF30HWBI6/JuComDlrsyiURAn/NGTSBTrQvf8B0PKL0751SrXQhT+q3kB43zA7Abw==
X-Received: by 2002:a05:6402:288f:b0:42a:ad43:a39b with SMTP id
 eg15-20020a056402288f00b0042aad43a39bmr11344081edb.342.1653061528740; 
 Fri, 20 May 2022 08:45:28 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com.
 [209.85.221.48]) by smtp.gmail.com with ESMTPSA id
 ay5-20020a170907900500b006f3ef214dccsm3189215ejc.50.2022.05.20.08.45.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 May 2022 08:45:27 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id w4so11987089wrg.12
 for <dri-devel@lists.freedesktop.org>; Fri, 20 May 2022 08:45:27 -0700 (PDT)
X-Received: by 2002:a05:6000:2c1:b0:20c:5e37:3ed1 with SMTP id
 o1-20020a05600002c100b0020c5e373ed1mr8813527wry.342.1653061526420; Fri, 20
 May 2022 08:45:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220418171757.2282651-1-dianders@chromium.org>
 <20220418101725.v3.1.Icf57bb12233a47727013c6ab69eebf803e22ebc1@changeid>
 <CAE-0n51iNXN4oOP-wAqrm9U6qC84fQ+qMUBu0BODXjsCDk+H=w@mail.gmail.com>
 <CAD=FV=W6Z1TG4vQcDDeNsGkjZVAR8=A1L1pDfo1rDFCh84H4Rg@mail.gmail.com>
 <CAE-0n50RXmaUsu5F9syJT-ZXzX8WacpJDFnhb1xQaou1Pxizng@mail.gmail.com>
In-Reply-To: <CAE-0n50RXmaUsu5F9syJT-ZXzX8WacpJDFnhb1xQaou1Pxizng@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 20 May 2022 08:45:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WG+_EzG4RvBwTswu4djGtJ00-2TRQaC3y4bGaf4SxLLg@mail.gmail.com>
Message-ID: <CAD=FV=WG+_EzG4RvBwTswu4djGtJ00-2TRQaC3y4bGaf4SxLLg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] drm/dp: Add wait_hpd_asserted() callback to struct
 drm_dp_aux
To: Stephen Boyd <swboyd@chromium.org>
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
Cc: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Philip Chen <philipchen@chromium.org>, Kees Cook <keescook@chromium.org>,
 David Airlie <airlied@linux.ie>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Robert Foss <robert.foss@linaro.org>, LKML <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, May 19, 2022 at 5:34 PM Stephen Boyd <swboyd@chromium.org> wrote:
>
> Quoting Doug Anderson (2022-05-12 16:24:13)
> > On Wed, May 11, 2022 at 6:58 PM Stephen Boyd <swboyd@chromium.org> wrote:
> > > Quoting Douglas Anderson (2022-04-18 10:17:54)
> > > > diff --git a/include/drm/dp/drm_dp_helper.h b/include/drm/dp/drm_dp_helper.h
> > > > index 53d1e722f4de..0940c415db8c 100644
> > > > --- a/include/drm/dp/drm_dp_helper.h
> > > > +++ b/include/drm/dp/drm_dp_helper.h
> > > > @@ -2035,6 +2035,32 @@ struct drm_dp_aux {
> > > >         ssize_t (*transfer)(struct drm_dp_aux *aux,
> > > >                             struct drm_dp_aux_msg *msg);
> > > >
> > > > +       /**
> > > > +        * @wait_hpd_asserted: wait for HPD to be asserted
> > > > +        *
> > > > +        * This is mainly useful for eDP panels drivers to wait for an eDP
> > > > +        * panel to finish powering on. This is an optional function.
> > >
> > > Is there any use for the opposite direction? For example, does anything
> > > care that HPD is deasserted?
> >
> > Not that I'm aware of. Originally I was planning to have it so that a
> > timeout of "0" meant to just poll without sleeping at all, but it
> > ended up making the code a lot more complicated because everywhere
> > else we had the "readx" semantics where 0 meant wait forever. It
> > didn't seem worth it. I can go back to that behavior if need be.
> >
>
> Got it.
>
> >
> > > > +        *
> > > > +        * This function will efficiently wait for up to `wait_us` microseconds
> > > > +        * for HPD to be asserted and might sleep.
> > > > +        *
> > > > +        * This function returns 0 if HPD was asserted or -ETIMEDOUT if time
> > > > +        * expired and HPD wasn't asserted. This function should not print
> > > > +        * timeout errors to the log.
> > > > +        *
> > > > +        * The semantics of this function are designed to match the
> > > > +        * readx_poll_timeout() function. That means a `wait_us` of 0 means
> > > > +        * to wait forever. If you want to do a quick poll you could pass 1
> > > > +        * for `wait_us`.
> > >
> > > It would also make sense to have a drm_dp_wait_hpd_asserted() API
> > >
> > >   int drm_dp_wait_hpd_asserted(struct drm_dp_aux *aux, unsigned long wait_us);
> > >
> > > and then this aux function could be implemented in various ways. The API
> > > could poll if the aux can only read immediate state of HPD, or it could
> > > sleep (is sleeping allowed? that isn't clear) and wake up the process
> > > once HPD goes high. Or if this op isn't implemented maybe there's a
> > > fixed timeout member that is non-zero which means "sleep this long".
> > > Either way, making each drm_dp_aux implement that logic seems error
> > > prone vs. having the drm_dp_aux implement some function for
> > >
> > >         get_immediate_hpd(struct drm_dp_aux *aux)
> >
> > There's a reason why I changed the API to "wait" from "get". If you
> > can think of a good place to document this, I'm all ears.
> >
> > The basic problem is ps8640 (my nemesis, apparently). On ps8640,
> > because of the black box firmware blob that's on it, we have a crazy
> > long delay in its runtime resume (300ms). So what happens with ps8640
> > is that if we make the API "get_immediate_hpd()" it wasn't so
> > immediate. Even with autosuspend, that first "get" could take 300 ms,
> > which really screwed with everyone else who was waiting with a 200 ms
> > timeout.
> >
> > Now, in theory, one could argue that the fact that ps8640 had a 300 ms
> > sleep would mean that the very first "get" of the panel would already
> > show HPD high. I don't know why that wasn't the case, but ps8640 is an
> > annoying black box.
> >
> > In general, though, the DP controller might need some amount of time
> > to power itself back up and configure itself. Even though the ps8640
> > case is extreme, it wouldn't be totally extreme to assume that an AUX
> > controller might take 20 ms or 50 ms to power up. That could still
> > throw timings off. Implementing the API as a "wait" style API gets
> > around this problem. Now the DP controller can take as long as it
> > needs to power itself up and it can then wait with the requested
> > timeout.
>
> To clarify, are you saying that the 'wait' passed in will be added to
> whatever time it takes for the driver to runtime resume to check HPD
> status? Or is the driver supposed to subtract any time to power up from the
> 'wait' passed in and then poll or wait for an irq about HPD?

So the "wait" time passed in is supposed to be the time from the panel
datasheet that's the maximum it takes for HPD to go high after giving
power to the panel.
In theory, this wait time ought to be able to happen in parallel with
the controller itself starting up. In that sense, going back to a
polling mechanism again ought to work. ...but the polling mechanism
_didn't_ work, so let's think more carefully about what might be going
on.

So it's possible that somehow we're not waiting enough time in the
parade's power on function. Maybe the chip isn't truly powered on and
thus when we first poll it then we're always going to get back "HPD
deasserted". ...or maybe it's powered on but the logic for HPD hasn't
finished starting up yet, if that even makes sense. In that sense, we
could probably go back to the polling mechanism again and just stick
an even bigger hardcoded delay in the powerup.

I guess it's also possible (and probably more likely) that the parade
chip is "debouncing" HPD here. The chip might be powered up OK and HPD
may be asserted, but it's possible that the value we're reading has an
intentional, chip-specific delay in it. The ti-sn65dsi86's builtin HPD
pin did this which is why we didn't use it. See commit c2bfc223882d
("drm/bridge: ti-sn65dsi86: Remove the mystery delay"). If this is the
case then an extra delay in "power on" won't _necessarily_ fix us.

Let's imagine:

1. The parade chip itself is already powered on, so runtime_resume for
the parade chip is a no-op.

2. The parade has a 150 ms debounce on HPD.

3. The panel has a "max" HPD of 200 ms.

4. The panel's HPD actually comes up in 150 ms after the panel is powered.

In the above scenario, if we "poll" and timeout for 200 ms then we'll
incorrectly believe that HPD is low at the end. We'll observe HPD
going high at 300 ms, and I'll argue that in the above case we should
wait until 350 ms before timing out (max HPD + debounce).


> Would it be incorrect to somehow have the pm_runtime_get_sync() call in
> the mythical wrapper API with a ktime_get() before and after and then
> subtract that from the 'wait' time and call "get_immediate_hpd()"?
>
> It would help me understand further if the 'wait' is described as a
> maximum time we're willing to wait or a minimum time we're willing to
> wait for hpd to be asserted. Usually a timeout is the maximum we're
> willing to wait so I think you're saying the wait is the maximum time
> after we know the drm_dp_aux is fully powered up and ready to check the
> state.

So where does that leave us? I'd still argue that the "wait" API gives
us the most flexibility. The DP controller driver has the most
knowledge about exactly how much extra time it might need to tack on.
The amount of duplicated code is really quite minimal, especially with
all of the helper functions. Even if the "debounce" isn't the
explanation for the parade bridge chip, we know for sure that other
bridge chips might not have the ability to read the raw HPD state and
can only read the debounced state.

Aside from leaving the API as "wait", I guess the best thing I can
think of would be to go back to polling and add another API that
indicates the maximum debounce time for the HPD signal. That seems
worse to me, though.

If the above convinces you that the "wait" API is correct, I can spin
the patches and add some extra comments. It's probably a good idea to
add an extra 300 ms to the timeout in the parade driver too. Assuming
my theory about the debounce is correct then my current patches are
relying on the extra delay in the parade bridge powerup to cover the
debounce. It should also be noted that having a longer timeout isn't
really a terrible thing. In a functioning system we should never hit
it.

NOTE: after all the above discussion, it seems like the same arguments
I made about the ti-sn65dsi86 might hold for the parade-ps8640: it
would be better to just have the panel driver do the maximum delay and
forget about trying to read HPD in the parade driver. Unfortunately,
yet again I'm bumping up against the undocumented firmware blob for
the parade chip. I have no idea how to tell the parade chip to ignore
HPD. I'd also note that such a change would require "no-hpd" be added
to existing device trees and thus would make old device trees
incompatible.

-Doug
