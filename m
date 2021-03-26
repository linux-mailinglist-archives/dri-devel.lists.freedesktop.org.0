Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A33FA34AF85
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 20:48:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1D276E063;
	Fri, 26 Mar 2021 19:48:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B676B6E063
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 19:48:28 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id A83DE61A02
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 19:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616788107;
 bh=wxPwrL8Elyilt/be8avUhCyHnKSPWdv5vjts2YM7GNk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=hxUv3wwbObI8kiZEEQZV18IkUZ78uC14N/u7raPhRVQu/Jg5dAuuQVvt7aGdizPMu
 YANg5luT1vEZH4/bbF5TI1C0At7XY/IM9KlTIGT1b8JCPtihfoX8tJlZL3OPPHkSr6
 +o96gpV54A3HXckbZ4y2bVhKASm9ZAxP3N6Rg+UUuH3yyydaW+NkUH+mRab2umSM5c
 tPM8bqGeklPDfYJn0E0IXVuAyrUnQGBD0WqbgS/soDjmC/GNVuR+WLv0AqQ4fxV1wY
 /kVBpv0i5qcIClgEQpd1cHNtZgJis+mKdIHoxh2MT+AwBiErwk+lh8PFaYuepkSJwu
 xv91nHcQDfnCg==
Received: by mail-ed1-f41.google.com with SMTP id y6so7636757eds.1
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 12:48:26 -0700 (PDT)
X-Gm-Message-State: AOAM533EZcDFSJH2jw3jkTTfpLYsy/khczQNYQAegFRq2oo5YvjUrWEH
 iYtTeJ3exs6z/qeGg5zlqM2nNl5kXUBzpSFq6Q==
X-Google-Smtp-Source: ABdhPJy7G4s2ud2zHYauRuSzY80o/0qOtPPIRaErAfbkRf+ylRkj+kKnhZfJ/AZpQBGAvYabfLNPy7gyORsBpyobNw0=
X-Received: by 2002:a05:6402:2d0:: with SMTP id
 b16mr17353897edx.194.1616788104975; 
 Fri, 26 Mar 2021 12:48:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com>
 <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
 <YF3V8d4wB6i81fLN@orome.fritz.box>
 <CAF6AEGvS6Pnd-m-boqPEZdDY+VCkV5M8Ob9n6UiYWs_DxrPopQ@mail.gmail.com>
 <CAF6AEGvPN90RGP8hYXtAksJpGc4Sf5tRpNwNnV6=sxKei0Ms6A@mail.gmail.com>
In-Reply-To: <CAF6AEGvPN90RGP8hYXtAksJpGc4Sf5tRpNwNnV6=sxKei0Ms6A@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Mar 2021 13:48:13 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKk+c83GMRzpc11Naj7QDYSfHdrg-8ZnxRBBM4phemQxg@mail.gmail.com>
Message-ID: <CAL_JsqKk+c83GMRzpc11Naj7QDYSfHdrg-8ZnxRBBM4phemQxg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
To: Rob Clark <robdclark@gmail.com>
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
 <devicetree@vger.kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, Andy Gross <agross@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Matthias Kaehlcke <mka@chromium.org>, Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 9:20 AM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Mar 26, 2021 at 8:18 AM Rob Clark <robdclark@gmail.com> wrote:
> >
> > On Fri, Mar 26, 2021 at 5:38 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > >
> > > On Wed, Mar 17, 2021 at 06:53:04PM -0700, Rob Clark wrote:
> > > > On Wed, Mar 17, 2021 at 4:27 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > >
> > > > > On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > > > > > The sc7180-trogdor-pompom board might be attached to any number of a
> > > > > > pile of eDP panels. At the moment I'm told that the list might include:
> > > > > > - KD KD116N21-30NV-A010
> > > > > > - KD KD116N09-30NH-A016
> > > > > > - Starry 2081116HHD028001-51D
> > > > > > - Sharp LQ116M1JW10
> > > > > >
> > > > > > It should be noted that while the EDID programmed in the first 3
> > > > > > panels indicates that they should run with exactly the same timing (to
> > > > > > keep things simple), the 4th panel not only needs different timing but
> > > > > > has a different resolution.
> > > > > >
> > > > > > As is true in general with eDP panels, we can figure out which panel
> > > > > > we have and all the info needed to drive its pixel clock by reading
> > > > > > the EDID. However, we can do this only after we've powered the panel
> > > > > > on. Powering on the panels requires following the timing diagram in
> > > > > > each panel's datasheet which specifies delays between certain
> > > > > > actions. This means that, while we can be quite dynamic about handling
> > > > > > things we can't just totally skip out on describing the panel like we
> > > > > > could do if it was connected to an external-facing DP port.
> > > > > >
> > > > > > While the different panels have slightly different delays, it's
> > > > > > possible to come up with a set of unified delays that will work on all
> > > > > > the panels. From reading the datasheets:
> > > > > > * KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
> > > > > >   - HPD absent delay: 200 ms
> > > > > >   - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
> > > > > > * Starry 2081116HHD028001-51D
> > > > > >   - HPD absent delay: 100 ms
> > > > > >   - Enable delay: (link training done till enable BL): 200 ms
> > > > > >   - Unprepare delay: 500 ms
> > > > > > * Sharp LQ116M1JW10
> > > > > >   - HPD absent delay: 200 ms
> > > > > >   - Unprepare delay: 500 ms
> > > > > >   - Prepare to enable delay (power on till backlight): 100 ms
> > > > > >
> > > > > > Unified:
> > > > > > - HPD absent delay: 200 ms
> > > > > > - Unprepare delay: 500 ms
> > > > > > - Enable delay: 200 ms
> > > > > >
> > > > > > NOTE: in theory the only thing that we _really_ need unity on is the
> > > > > > "HPD absent delay" since once the panel asserts HPD we can read the
> > > > > > EDID and could make per-panel decisions if we wanted.
> > > > > >
> > > > > > Let's create a definition of "a panel that can be attached to pompom"
> > > > > > as a panel that provides a valid EDID and can work with the standard
> > > > > > pompom power sequencing. If more panels are later attached to pompom
> > > > > > then it's fine as long as they work in a compatible way.
> > > > > >
> > > > > > One might ask why we can't just use a generic string here and provide
> > > > > > the timings directly in the device tree file. As I understand it,
> > > > > > trying to describe generic power sequencing in the device tree is
> > > > > > frowned upon and the one instance (SD/MMC) is regarded as a mistake
> > > > > > that shouldn't be repeated. Specifying a power sequence per board (or
> > > > > > per board class) feels like a reasonable compromise. We're not trying
> > > > > > to define fully generic power sequence bindings but we can also take
> > > > > > advantage of the semi-probable properties of the attached device.
> > > > > >
> > > > > > NOTE: I believe that past instances of supporting this type of thing
> > > > > > have used the "white lie" approach. One representative panel was
> > > > > > listed in the device tree. The power sequencings of this
> > > > > > representative panel were OK to use across all panels that might be
> > > > > > attached and other differences were handled by EDID. This patch
> > > > > > attempts to set a new precedent and avoid the need for the white lie.
> > > > > >
> > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > ---
> > > > >
> > > > > Sounds reasonable to me if DT maintainers can live with this abstract
> > > > > hardware definition. It's clearer than the 'white lie' approach.
> > > >
> > > > Yeah, it is a weird grey area between "discoverable" and "not
> > > > discoverable".. but I favor DT reflecting reality as much as
> > > > possible/feasible, so I think this is definity cleaner than "white
> > > > lies"
> > >
> > > This is practically no different than the "white lie". I suppose you
> > > could perhaps call it "more honest", if you want.
> > >
> > > The point remains that unless we describe exactly which panel we're
> > > dealing with, we ultimately have no way of properly quirking anything if
> > > we ever have to. Also, once we allow this kind of wildcard we can
> > > suddenly get into a situation where people might want to reuse this on
> > > something that's not at all a google-pompom board because the same
> > > particular power sequence happens to work on on some other board.
> > >
> > > Similarly I can imagine a situation where we could now have the same
> > > panel supported by multiple different wildcard compatible strings. How
> > > is that supposed to be any cleaner than what we have now?
> > >
> > > And I still keep wondering why bootloaders can't be taught about these
> > > kinds of things. We have in the past discussed various solutions where
> > > the bootloader could detect the type of panel connected and set the
> > > proper compatible string.
> >
> > The bootloader cannot detect the panel without powering up the panel,
> > which it normally does not do if you are not in dev-mode (it would add
> > a significant amount of time to bootup, which is why we can't do this)
>
> what if we had a sort of multi-choice panel node:
>
>    panel: panel {
>      compatible = "panel,one-of";
>      compatible-one-of = "vendor1,panel-a", "vendor2,panel-b",
> "vendor3,panel-c";
>   };
>
> The kernel could construct power sequence timings that are the
> superset of all the possible panels.  That seems about as explicit as
> we could get in this sort of case.

If we were to go this route, I'm inclined to say just shove all the
possible panel compatibles into 'compatible'. That kind of breaks the
notion of most specific to least specific. OTOH, it is saying the set
of panels are somehow 'compatible' with each other.

If there's not some level of compatibility between the panels, then
it's still the bootloader's problem.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
