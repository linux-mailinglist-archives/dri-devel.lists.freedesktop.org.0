Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30D6E9D9D1C
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 19:06:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EDD010E1D2;
	Tue, 26 Nov 2024 18:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="hY8r6hJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BAC710E1D2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 18:06:47 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6eee6874ef8so43547237b3.2
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Nov 2024 10:06:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732644406; x=1733249206; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DjBf84QDRrpP6XOQhJWb7/a4g/3YhkHiEQHw91g4NPE=;
 b=hY8r6hJ9h19kFrqrqsAhhLtJCbKIJX0xVTXnaaaZg0fMrpfWz4cgZHNQxA6hLkMXmc
 AqDyuSoMGqeIX14bTZpxKGOwPTJPzNg91sMbFeiX3d7+grmmAOUDnNOG2AQer8VdyHtV
 gEBmT0FuRud5hS5kg0NgZagrKDAkGXDUsvguD3IX8KsNyrOCf5D2NYwynWqUdqwLerrW
 8wt6IGBhKNZsHaCkZtT02aPNLppK0kXPwtAXEEcj8uZuqCFu3vu/ZVgkGezeLCLBexeL
 4ExekUlA6YRhL5VyKqR9CL7V+xe9Z3IM/U051UPXr/eg1R18A078DkrsE7sJtCjKBqUN
 eSMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732644406; x=1733249206;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DjBf84QDRrpP6XOQhJWb7/a4g/3YhkHiEQHw91g4NPE=;
 b=vywliUNiUI+aoyxvaKMf9Hx29T5dTqxZb7rsfdY/cdI9ldMt2FcEUHgdM7JO1KUYa3
 Ax9Ea8K1I8lSgiwdgyK+AagQw7qPgcSQsD4ItSe+rzZYTGvIaa6wTa4BGnw6dWeqKJ/5
 m2TjsmQsURFke+/H30CWnKVdgHLUdy+8MJXATqz78LrfJnphldxS3nSoxHDN9FQni1zF
 QIBJwc7EkPAARs4c4IpMy+Gj0sqUUY+NaZHe9+NOzYA45+zuqqgbK4vsoKu536DcThV/
 1MaSzdUggHlbUgec8Ck3D040Aambe9vR4DZK2pOzjktmqcljzbMA4Y9wq9S94F3zpytO
 g8TQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrAKBU/gTdmO0UCyxRCTcu4jGbxglMoTV8UMu6gtiAW6K4R9kXE2MR3Tj7L/bBLF8zy7yV2vw8J+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwxYsHyaX2ulXRJlVsVcVhIhoIJqH/2OiiNDO1f3xzZa9mch4Ms
 6qAd8s5RuNIQbhvTJdCa3psMZinWygluH+UAx0/l9FSEMQ/oCtzUzxbk7nBC8Woe/j3GOJYEXaJ
 1AeAFKtDPY9HqPUwwL9oEt4Lt9OHmZ5sjLx1rtw==
X-Gm-Gg: ASbGnctqwqIbsUBiGhw1h3F8WCg0GjoNPwat2uZyPEwDc6Z44uEpdDklwWceE3veW/9
 ryFAxtkxsUGFo47UtGnF5vytQS8fw7s2jdL+Ily6oPLeofQ==
X-Google-Smtp-Source: AGHT+IEYjpR1e8Z6RRxWWAo1Gav3FUQktVpbelAPGogPRSWhtrIFb9YjFun+UhxclEqXICw+cQngcsX7zi4cNtE244U=
X-Received: by 2002:a05:690c:690c:b0:6ef:3602:b553 with SMTP id
 00721157ae682-6ef371ebc2fmr1392507b3.1.1732644405966; Tue, 26 Nov 2024
 10:06:45 -0800 (PST)
MIME-Version: 1.0
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
 <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
 <20241125-nondescript-grouse-of-joy-c22dbf@houat>
 <CAA8EJpqGV-Me8_wwj7nd6g3vRMxwmObNT94nMBvktYV5sxgr-Q@mail.gmail.com>
 <20241126-malachite-sunfish-of-whirlwind-c1a9cd@houat>
In-Reply-To: <20241126-malachite-sunfish-of-whirlwind-c1a9cd@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Nov 2024 20:06:35 +0200
Message-ID: <CAA8EJppWL2RbPQ5dQT+GUGnp3k=cj84zLKs4jL6+Wfp6hX9uWA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] drm/bridge: tc358767: Improve DPI output pixel
 clock accuracy
To: Maxime Ripard <mripard@kernel.org>
Cc: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
 Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 26 Nov 2024 at 18:00, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Tue, Nov 26, 2024 at 12:07:10AM +0200, Dmitry Baryshkov wrote:
> > On Mon, 25 Nov 2024 at 15:17, Maxime Ripard <mripard@kernel.org> wrote:
> > >
> > > On Fri, Nov 22, 2024 at 03:32:57PM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
> > > > > The Pixel PLL is not very capable and may come up with wildly inaccurate
> > > > > clock. Since DPI panels are often tolerant to slightly higher pixel clock
> > > > > without being operated outside of specification, calculate two Pixel PLL
> > > > > from either mode clock or display_timing .pixelclock.max , whichever is
> > > > > higher. Since the Pixel PLL output clock frequency calculation always
> > > > > returns lower frequency than the requested clock frequency, passing in
> > > > > the higher clock frequency should result in output clock frequency which
> > > > > is closer to the expected pixel clock.
> > > > >
> > > > > For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
> > > > > without this patch is 65 MHz which is out of the panel specification of
> > > > > 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well within
> > > > > the specification and far more accurate.
> > > >
> > > > Granted that most of the panel drivers do not implement get_timings()
> > > > and granted that there are no current users of that interface, I think
> > > > we should move away from it (and maybe even drop it completely from
> > > > drm_panel).
> > >
> > > I think we should do the opposite :)
> > >
> > > Panels usually have a pretty large operating window, and the current
> > > construct only works because nobody really uses the same panels (or
> > > we're hiding that behind different compatibles) across SoCs or
> > > generation. Or we're working around it.
> > >
> > > It's kind of a mess, and it gets messy in encoders too: some will filter
> > > out panel modes, some won't. Some will adjust timings to fit their
> > > clocks, some won't. etc.
> >
> > Well... I think it's messy because we have so many different
> > interfaces. Some encoders can poke directly into the panel, some
> > drivers use bridge chains and panel bridge. Some do even a messier
> > thing and try both at the same time.
> > I think that in the long-term nobody should be using the drm_panel
> > interface directly.
>
> There's a few corner cases that are doable with the panel API that
> aren't possible with the bridge API still. Being able to get the pixel
> clock you're going to get from the encoder and adjust the timings to
> match the panel tolerance is one for example, and we have a couple of
> drivers doing that.

My initial point was that only panel-simple (and panel-edp) implement
the get_timings().
And for the existing encoder drivers I think we should be migrating to
using bridge API instead of panel API.

>
> > > Going forward, switching everyone to a timing-like interface and
> > > providing a set of helpers to adjust timings within possible boundaries
> > > to fit a clock rate is doable and should be done imo.
> >
> > ... and then it might help with the command-mode DSI panels with DSC...
>
> How so?

We had troubles with CMD panels, because we need to get the mode
timings based on FPS and compression ratio (so it can  not be
pregrorammed, like we usually do for most of the panels).

>
> > >
> > > > What about achieving the same via slightly different approach: register
> > > > a non-preferred mode with the clock equal to the max clock allowed. The
> > > > bridge driver can then use the default and the "max" mode to select PLL
> > > > clock.
> > > >
> > > > I understand that this suggestion doesn't follow the DPI panel
> > > > specifics, which are closer to the continuous timings rather than fixed
> > > > set of modes, however I really don't think that it's worth keeping the
> > > > interface for the sake of a single driver. Original commit 2938931f3732
> > > > ("drm/panel: Add display timing support") from 2014 mentions using those
> > > > timings for .mode_fixup(), but I couldn't find a trace of the
> > > > corresponding implementation.
> > > >
> > > > Another possible option might be to impletent adjusting modes in
> > > > .atomic_check() / .mode_fixup().
> > >
> > > It's unused because we don't have an easy API for encoders to use it. We
> > > should fix *that*.
> >
> > Sounds good to me too.
> > I'm not sure what it should look like though. We barely scratched our
> > heads when looking at the DSC / CMD stuff, but nothing came out of it.
> >
> > Ideally... there should be some kind of get_timings being available
> > through the full bridge chain, so that the encoders can use it. But
> > I'm not sure how that should work, because some bridges would like to
> > manipulate those timings. And some bridges will completely drop
> > get_timings() and produce raw modes even after consuming the timings
> > set.
>
> the drm_display_mode -> timings conversion is fairly easy to do: just
> use the same values for min, typ and max.

-- 
With best wishes
Dmitry
