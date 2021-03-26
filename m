Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E234B31E
	for <lists+dri-devel@lfdr.de>; Sat, 27 Mar 2021 00:48:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 007C76F3E7;
	Fri, 26 Mar 2021 23:48:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4136D6F3E7
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 23:48:26 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4DA9561A3F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 23:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616802504;
 bh=HL4n+BnM9gvNqp6e7ow2lvqRI0UoGPH0Nc8z3H9uRKc=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=onFYtCyVx5sjJRmYNlhDjmuAWyrV+iGtpQi0yAkmlhfdFPSGH3gbHLp698ay2lRAx
 UX0m3n5oyaKtQjLBZxC8S2Cp6y8AEKs57DuWkyiBCRLcfp+dZrwYMP4DdJU5Ur6ziK
 JqAizNpNIAFhsogRH20cMDrKwziiL70TMc3x1mcgZ9txXIjQO6pQLq+mmdHvyhdynu
 qsRH7a3uLanOAeVFHHc5HaWXcgkhUB/hMaQyzBj6tWmySJiwHKFxjx6z7m5kKNPo3B
 dwEHRmd3MgwJ8W7L/azUXk6GEaFV4E4CeS/vuZDCYQ+bUUNQDJznwalzpVyWO8qnde
 bN3+ueoqk1j8Q==
Received: by mail-qv1-f48.google.com with SMTP id x27so3830348qvd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 16:48:24 -0700 (PDT)
X-Gm-Message-State: AOAM533b8XA/ublBTwiWWt7madDMbXqjMkleBY74cRXae9oSNnmAIqip
 fw/Ma+sJwqja39V+DwqOk4N8a1V9ZPyS9b6bIQ==
X-Google-Smtp-Source: ABdhPJwPA91Wgu9ZppNHRVxLIydVSrnnQLMemG+MYtkt3Dog7P3BRksjYKdC3c5anvIWgV+BUx0fhKZVzquKDg4BJXg=
X-Received: by 2002:a0c:a5a5:: with SMTP id z34mr16052242qvz.4.1616802503249; 
 Fri, 26 Mar 2021 16:48:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com>
 <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
 <YF3V8d4wB6i81fLN@orome.fritz.box>
 <CAF6AEGvS6Pnd-m-boqPEZdDY+VCkV5M8Ob9n6UiYWs_DxrPopQ@mail.gmail.com>
 <CAF6AEGvPN90RGP8hYXtAksJpGc4Sf5tRpNwNnV6=sxKei0Ms6A@mail.gmail.com>
 <CAL_JsqKk+c83GMRzpc11Naj7QDYSfHdrg-8ZnxRBBM4phemQxg@mail.gmail.com>
 <CAF6AEGt3MuQPROfOn6-M1ysD_QKwShb_t3mjUJ4QDBBT_3cwRg@mail.gmail.com>
In-Reply-To: <CAF6AEGt3MuQPROfOn6-M1ysD_QKwShb_t3mjUJ4QDBBT_3cwRg@mail.gmail.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 26 Mar 2021 17:48:11 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+0rDkzRjedKwgBg7W-gvC3s2eWZozrvtHkou-8+X=+fA@mail.gmail.com>
Message-ID: <CAL_Jsq+0rDkzRjedKwgBg7W-gvC3s2eWZozrvtHkou-8+X=+fA@mail.gmail.com>
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

On Fri, Mar 26, 2021 at 4:13 PM Rob Clark <robdclark@gmail.com> wrote:
>
> On Fri, Mar 26, 2021 at 12:48 PM Rob Herring <robh+dt@kernel.org> wrote:
> >
> > On Fri, Mar 26, 2021 at 9:20 AM Rob Clark <robdclark@gmail.com> wrote:
> > >
> > > On Fri, Mar 26, 2021 at 8:18 AM Rob Clark <robdclark@gmail.com> wrote:
> > > >
> > > > On Fri, Mar 26, 2021 at 5:38 AM Thierry Reding <thierry.reding@gmail.com> wrote:
> > > > >
> > > > > On Wed, Mar 17, 2021 at 06:53:04PM -0700, Rob Clark wrote:
> > > > > > On Wed, Mar 17, 2021 at 4:27 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > > > > > >
> > > > > > > On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > > > > > > > The sc7180-trogdor-pompom board might be attached to any number of a
> > > > > > > > pile of eDP panels. At the moment I'm told that the list might include:
> > > > > > > > - KD KD116N21-30NV-A010
> > > > > > > > - KD KD116N09-30NH-A016
> > > > > > > > - Starry 2081116HHD028001-51D
> > > > > > > > - Sharp LQ116M1JW10
> > > > > > > >
> > > > > > > > It should be noted that while the EDID programmed in the first 3
> > > > > > > > panels indicates that they should run with exactly the same timing (to
> > > > > > > > keep things simple), the 4th panel not only needs different timing but
> > > > > > > > has a different resolution.
> > > > > > > >
> > > > > > > > As is true in general with eDP panels, we can figure out which panel
> > > > > > > > we have and all the info needed to drive its pixel clock by reading
> > > > > > > > the EDID. However, we can do this only after we've powered the panel
> > > > > > > > on. Powering on the panels requires following the timing diagram in
> > > > > > > > each panel's datasheet which specifies delays between certain
> > > > > > > > actions. This means that, while we can be quite dynamic about handling
> > > > > > > > things we can't just totally skip out on describing the panel like we
> > > > > > > > could do if it was connected to an external-facing DP port.
> > > > > > > >
> > > > > > > > While the different panels have slightly different delays, it's
> > > > > > > > possible to come up with a set of unified delays that will work on all
> > > > > > > > the panels. From reading the datasheets:
> > > > > > > > * KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
> > > > > > > >   - HPD absent delay: 200 ms
> > > > > > > >   - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
> > > > > > > > * Starry 2081116HHD028001-51D
> > > > > > > >   - HPD absent delay: 100 ms
> > > > > > > >   - Enable delay: (link training done till enable BL): 200 ms
> > > > > > > >   - Unprepare delay: 500 ms
> > > > > > > > * Sharp LQ116M1JW10
> > > > > > > >   - HPD absent delay: 200 ms
> > > > > > > >   - Unprepare delay: 500 ms
> > > > > > > >   - Prepare to enable delay (power on till backlight): 100 ms
> > > > > > > >
> > > > > > > > Unified:
> > > > > > > > - HPD absent delay: 200 ms
> > > > > > > > - Unprepare delay: 500 ms
> > > > > > > > - Enable delay: 200 ms
> > > > > > > >
> > > > > > > > NOTE: in theory the only thing that we _really_ need unity on is the
> > > > > > > > "HPD absent delay" since once the panel asserts HPD we can read the
> > > > > > > > EDID and could make per-panel decisions if we wanted.
> > > > > > > >
> > > > > > > > Let's create a definition of "a panel that can be attached to pompom"
> > > > > > > > as a panel that provides a valid EDID and can work with the standard
> > > > > > > > pompom power sequencing. If more panels are later attached to pompom
> > > > > > > > then it's fine as long as they work in a compatible way.
> > > > > > > >
> > > > > > > > One might ask why we can't just use a generic string here and provide
> > > > > > > > the timings directly in the device tree file. As I understand it,
> > > > > > > > trying to describe generic power sequencing in the device tree is
> > > > > > > > frowned upon and the one instance (SD/MMC) is regarded as a mistake
> > > > > > > > that shouldn't be repeated. Specifying a power sequence per board (or
> > > > > > > > per board class) feels like a reasonable compromise. We're not trying
> > > > > > > > to define fully generic power sequence bindings but we can also take
> > > > > > > > advantage of the semi-probable properties of the attached device.
> > > > > > > >
> > > > > > > > NOTE: I believe that past instances of supporting this type of thing
> > > > > > > > have used the "white lie" approach. One representative panel was
> > > > > > > > listed in the device tree. The power sequencings of this
> > > > > > > > representative panel were OK to use across all panels that might be
> > > > > > > > attached and other differences were handled by EDID. This patch
> > > > > > > > attempts to set a new precedent and avoid the need for the white lie.
> > > > > > > >
> > > > > > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > > > > > ---
> > > > > > >
> > > > > > > Sounds reasonable to me if DT maintainers can live with this abstract
> > > > > > > hardware definition. It's clearer than the 'white lie' approach.
> > > > > >
> > > > > > Yeah, it is a weird grey area between "discoverable" and "not
> > > > > > discoverable".. but I favor DT reflecting reality as much as
> > > > > > possible/feasible, so I think this is definity cleaner than "white
> > > > > > lies"
> > > > >
> > > > > This is practically no different than the "white lie". I suppose you
> > > > > could perhaps call it "more honest", if you want.
> > > > >
> > > > > The point remains that unless we describe exactly which panel we're
> > > > > dealing with, we ultimately have no way of properly quirking anything if
> > > > > we ever have to. Also, once we allow this kind of wildcard we can
> > > > > suddenly get into a situation where people might want to reuse this on
> > > > > something that's not at all a google-pompom board because the same
> > > > > particular power sequence happens to work on on some other board.
> > > > >
> > > > > Similarly I can imagine a situation where we could now have the same
> > > > > panel supported by multiple different wildcard compatible strings. How
> > > > > is that supposed to be any cleaner than what we have now?
> > > > >
> > > > > And I still keep wondering why bootloaders can't be taught about these
> > > > > kinds of things. We have in the past discussed various solutions where
> > > > > the bootloader could detect the type of panel connected and set the
> > > > > proper compatible string.
> > > >
> > > > The bootloader cannot detect the panel without powering up the panel,
> > > > which it normally does not do if you are not in dev-mode (it would add
> > > > a significant amount of time to bootup, which is why we can't do this)
> > >
> > > what if we had a sort of multi-choice panel node:
> > >
> > >    panel: panel {
> > >      compatible = "panel,one-of";
> > >      compatible-one-of = "vendor1,panel-a", "vendor2,panel-b",
> > > "vendor3,panel-c";
> > >   };
> > >
> > > The kernel could construct power sequence timings that are the
> > > superset of all the possible panels.  That seems about as explicit as
> > > we could get in this sort of case.
> >
> > If we were to go this route, I'm inclined to say just shove all the
> > possible panel compatibles into 'compatible'. That kind of breaks the
> > notion of most specific to least specific. OTOH, it is saying the set
> > of panels are somehow 'compatible' with each other.
> >
> > If there's not some level of compatibility between the panels, then
> > it's still the bootloader's problem.
> >
>
> I'm not sure about this.. since there could be slight differences in
> various delay params between the possible panels.  I'd prefer that in
> panel-simple.c, we listed exact delay params "vendorFoo,panelBar", but
> it could mean that for a device that had three possible panels the
> worst case (max of all possible delays) could be higher than any
> individual choice.. and I don't think we should encourage the "white
> lie" approach (which will be the obvious outcome of not handling this
> directly in dt IME, based on prior art).  OTOH pushing it to the
> bootloader, when the bootloader actually has to power up the panel
> (and abide by the necessary delays) to figure out what choice we have
> isn't a viable option either.

I was only saying if the panels are different enough and there's not a
worse case setting, then it's back to a bootloader problem. If we have
multiple distinct compatibles, then it means the kernel should be able
to figure out settings that work on all the possible panels listed.

> It is better to be explicit about what we know and at the same time
> about what we don't know.

Can you be explicit about what we know and don't know here? With what
you proposed and my alternative, at the end of the day we just have a
list of compatibles. The only implicit part is the expectation that
the set is somehow compatible with each other.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
