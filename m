Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A53A9D8E4D
	for <lists+dri-devel@lfdr.de>; Mon, 25 Nov 2024 23:08:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 096E810E743;
	Mon, 25 Nov 2024 22:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="umjGnLGD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com
 [209.85.128.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659F810E3D8
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 22:07:22 +0000 (UTC)
Received: by mail-yw1-f171.google.com with SMTP id
 00721157ae682-6eeba477fcaso50794177b3.0
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Nov 2024 14:07:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732572441; x=1733177241; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RPi5jrqjhXKSqTS16v5yE8N94Wa7BBdoaQgCXgjWXWE=;
 b=umjGnLGDnXdigV0+aVvrl/Z5v4kW8ihi9B0e+KVt6TlHG20NePeO8LGdjV/+CrLOhs
 naeFbWpKvT0jtLe7PsNJYWvgWSuFtaKi46jbXo1l0i28AIqsPJ3G81O6FvTgVZgVXkjq
 Ja2WzuBN/M4eiOJ8zdsjmPgPAWZ5vT0abE1eH5FuCb2lJY0FXwnUw0aJqXKuvhdleuHu
 1ShAkr+jxAt6nqSgCpJvd2n2pE1XOryAQTMma6/2BHt4o5Ui7R2teAViDAXn0qxMZs8r
 hRRtmv3K/c7g9IYW99QgH+LFKdnvczmvULyc3hBSodhrNrzaDO7wfdgzYH91+NaBpQlQ
 PTXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732572441; x=1733177241;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RPi5jrqjhXKSqTS16v5yE8N94Wa7BBdoaQgCXgjWXWE=;
 b=P/imAW5eUmrHBMTCtpAEYpSmfDFs2mDIqcQzULg31Lfv5ximx7cXmc5Kg1U3ph5pYq
 v6DrQUQfW0f4nOrsJ1P+xEp3R194ykuUhr0pS8rSIpaQPMgS4RdSCl6qUUK14R3LmLjF
 jxKfL4GgHQiww0FuVgtZsmLyAbLZx3VjLejZRMXc8TFMGwj+PdHK+oU/9lc6XHynJ0nx
 Qw7ChfaRaH1kzSfQjZe6ZJg1fwy68Q8DoeGxQN6BJGGFjIMUms+8kOLkgW24/kRb3j8F
 SkpMN0w0W6iENc/V7pX5o+42IgM1y04K6QL3xFVBHVa+4j0yYj8bO6831bqEBSioehhV
 Cp0w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRjsEnhOPsXbWfDss9tVV5pUuzwVCnV2HvE/5V1ftoH38UEfR3miiSMNJD/KGPQJQJvpbB20Db2Q4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyKkxKMrYQEvy0d7GC/XFn18k95m9yQ5+4vV35D029ypsBgWAyR
 K/VIQ9oRfCdb/ZEAAIHbqtv80lhKn9viRCDmFME39hGYmeOUqAsrSJ9TylWFiykEJ8oJUdFWEMY
 FgTwhktSYEx/3n/F051u3d2GJLBZy/21lHJxLxg==
X-Gm-Gg: ASbGncu9phFxU8Nifuc+YpLO4Dtbq9hifOaX/Eg5nGevPkoqQgE+lLkwc749hU3zRwW
 nC9Vubq/tt72pkrW9XWohqg0uIU7Dk81LNq39b7AWj2BqtQ==
X-Google-Smtp-Source: AGHT+IF0LB1oTokSYOVCojNNQj0SHtic5b4JS0/hXk/21P6l6P1uwqUIpMQIbn7r6cI7Lwj6yMh88JqNBMNZRtlpL/I=
X-Received: by 2002:a05:690c:338c:b0:6ec:b74d:a013 with SMTP id
 00721157ae682-6eee08b7ef8mr140646657b3.19.1732572441276; Mon, 25 Nov 2024
 14:07:21 -0800 (PST)
MIME-Version: 1.0
References: <20241112020737.335297-1-marex@denx.de>
 <20241112020737.335297-2-marex@denx.de>
 <bqmcs6dtcidr6lr6r74t5vm72kjantanaq26dfipkqtsiqhacd@ngdoaqim42ck>
 <20241125-nondescript-grouse-of-joy-c22dbf@houat>
In-Reply-To: <20241125-nondescript-grouse-of-joy-c22dbf@houat>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 26 Nov 2024 00:07:10 +0200
Message-ID: <CAA8EJpqGV-Me8_wwj7nd6g3vRMxwmObNT94nMBvktYV5sxgr-Q@mail.gmail.com>
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

On Mon, 25 Nov 2024 at 15:17, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Fri, Nov 22, 2024 at 03:32:57PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Nov 12, 2024 at 03:05:37AM +0100, Marek Vasut wrote:
> > > The Pixel PLL is not very capable and may come up with wildly inaccurate
> > > clock. Since DPI panels are often tolerant to slightly higher pixel clock
> > > without being operated outside of specification, calculate two Pixel PLL
> > > from either mode clock or display_timing .pixelclock.max , whichever is
> > > higher. Since the Pixel PLL output clock frequency calculation always
> > > returns lower frequency than the requested clock frequency, passing in
> > > the higher clock frequency should result in output clock frequency which
> > > is closer to the expected pixel clock.
> > >
> > > For the Chefree CH101 panel with 13 MHz Xtal input clock, the frequency
> > > without this patch is 65 MHz which is out of the panel specification of
> > > 68.9..73.4 MHz, while with this patch it is 71.5 MHz which is well within
> > > the specification and far more accurate.
> >
> > Granted that most of the panel drivers do not implement get_timings()
> > and granted that there are no current users of that interface, I think
> > we should move away from it (and maybe even drop it completely from
> > drm_panel).
>
> I think we should do the opposite :)
>
> Panels usually have a pretty large operating window, and the current
> construct only works because nobody really uses the same panels (or
> we're hiding that behind different compatibles) across SoCs or
> generation. Or we're working around it.
>
> It's kind of a mess, and it gets messy in encoders too: some will filter
> out panel modes, some won't. Some will adjust timings to fit their
> clocks, some won't. etc.

Well... I think it's messy because we have so many different
interfaces. Some encoders can poke directly into the panel, some
drivers use bridge chains and panel bridge. Some do even a messier
thing and try both at the same time.
I think that in the long-term nobody should be using the drm_panel
interface directly.

>
> Going forward, switching everyone to a timing-like interface and
> providing a set of helpers to adjust timings within possible boundaries
> to fit a clock rate is doable and should be done imo.

... and then it might help with the command-mode DSI panels with DSC...

>
> > What about achieving the same via slightly different approach: register
> > a non-preferred mode with the clock equal to the max clock allowed. The
> > bridge driver can then use the default and the "max" mode to select PLL
> > clock.
> >
> > I understand that this suggestion doesn't follow the DPI panel
> > specifics, which are closer to the continuous timings rather than fixed
> > set of modes, however I really don't think that it's worth keeping the
> > interface for the sake of a single driver. Original commit 2938931f3732
> > ("drm/panel: Add display timing support") from 2014 mentions using those
> > timings for .mode_fixup(), but I couldn't find a trace of the
> > corresponding implementation.
> >
> > Another possible option might be to impletent adjusting modes in
> > .atomic_check() / .mode_fixup().
>
> It's unused because we don't have an easy API for encoders to use it. We
> should fix *that*.

Sounds good to me too.
I'm not sure what it should look like though. We barely scratched our
heads when looking at the DSC / CMD stuff, but nothing came out of it.

Ideally... there should be some kind of get_timings being available
through the full bridge chain, so that the encoders can use it. But
I'm not sure how that should work, because some bridges would like to
manipulate those timings. And some bridges will completely drop
get_timings() and produce raw modes even after consuming the timings
set.


-- 
With best wishes
Dmitry
