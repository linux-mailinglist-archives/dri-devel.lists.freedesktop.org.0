Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B50E134AB3C
	for <lists+dri-devel@lfdr.de>; Fri, 26 Mar 2021 16:15:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F1C6E207;
	Fri, 26 Mar 2021 15:15:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326666E207
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 15:15:45 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 z6-20020a1c4c060000b029010f13694ba2so3172679wmf.5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Mar 2021 08:15:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KScxmgxFwx2I+/azyTh9C5L+i3XfAXAGJimkh3N2UIA=;
 b=ky8Y/83S5OtVFwOg13NDgbqFF9wc1DJJzH+e2KwPnNq/2RJXVQKOfUtOhTBo+AOn0J
 DzqKvyMZDDFoVOO0RX9n28uDPTWBjtVd26Cl+/A6zAhHTnL+TaE/exJnmuMvcIttk3RL
 hkOsy8AwkX9n/GIqmXrjnSNa0u/ccYYH1MSv71CK4eg/hqjCTO6yb9HWX/xY5EDedyQ8
 1aTOBjYP9OKMXmZT22rIFSl+IQsFlahyCWrpn7d937nLFdhDeGzA0JPFmFRjvKpOEAFq
 b2vnpfZd1+g+h+URAvc7abpRoxLVYLFQKrpBDMG4sXwVkebNLo1A21ZCz0+zCtBMy1ik
 688A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KScxmgxFwx2I+/azyTh9C5L+i3XfAXAGJimkh3N2UIA=;
 b=mq7c+ThL77NnjSmgWif56w9KDsfSp0IveklviCCHywqBSKErLHv2AQV49Eu7U3/uiC
 4JA9Pv6ppJYtyZfTbDPSFcSkuB2ukdssOjyTyHQEa07snNmVFO150Sp9JD/2ZbOzdmvt
 +URBet9cK43OULuHuaw09YVAL3MflH/HxAHYPxTtbV83PRu29dtciaaodZLIS5PdQOIe
 lWPeCMRXmIP5tJ63yN0PzS0BE9obUS8vHla1Ya03FtdSAUlOt7xtehO3xk5I9u9jHFK4
 1/xWE1eeOLIfVJaSjaqT6vWvA/AX/r6sxHJt3HaPO7LuOkxoAy1OE9sX6zaHfWfu1f7C
 Vwvg==
X-Gm-Message-State: AOAM533DXiOAoTGZMvGsYyQhgJeMuhlOuk0W293RjaPeuK4urccoWsj3
 Z//2UmFJNLkmmso3F30KLKnB8+QkZ25eIhFb+o0=
X-Google-Smtp-Source: ABdhPJynseqJpqbn4loBqepQPEihPGeHiofRkPlyhCWqa/PiQjbuPwCX4FC8Kp3N7rMDF5ABR9P0UUTe6ZjseKrMuS8=
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr13521538wmq.123.1616771743836; 
 Fri, 26 Mar 2021 08:15:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com>
 <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
 <YF3V8d4wB6i81fLN@orome.fritz.box>
In-Reply-To: <YF3V8d4wB6i81fLN@orome.fritz.box>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 26 Mar 2021 08:18:57 -0700
Message-ID: <CAF6AEGvS6Pnd-m-boqPEZdDY+VCkV5M8Ob9n6UiYWs_DxrPopQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
To: Thierry Reding <thierry.reding@gmail.com>
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
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Matthias Kaehlcke <mka@chromium.org>, Andy Gross <agross@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Steev Klimaszewski <steev@kali.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 26, 2021 at 5:38 AM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> On Wed, Mar 17, 2021 at 06:53:04PM -0700, Rob Clark wrote:
> > On Wed, Mar 17, 2021 at 4:27 PM Matthias Kaehlcke <mka@chromium.org> wrote:
> > >
> > > On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > > > The sc7180-trogdor-pompom board might be attached to any number of a
> > > > pile of eDP panels. At the moment I'm told that the list might include:
> > > > - KD KD116N21-30NV-A010
> > > > - KD KD116N09-30NH-A016
> > > > - Starry 2081116HHD028001-51D
> > > > - Sharp LQ116M1JW10
> > > >
> > > > It should be noted that while the EDID programmed in the first 3
> > > > panels indicates that they should run with exactly the same timing (to
> > > > keep things simple), the 4th panel not only needs different timing but
> > > > has a different resolution.
> > > >
> > > > As is true in general with eDP panels, we can figure out which panel
> > > > we have and all the info needed to drive its pixel clock by reading
> > > > the EDID. However, we can do this only after we've powered the panel
> > > > on. Powering on the panels requires following the timing diagram in
> > > > each panel's datasheet which specifies delays between certain
> > > > actions. This means that, while we can be quite dynamic about handling
> > > > things we can't just totally skip out on describing the panel like we
> > > > could do if it was connected to an external-facing DP port.
> > > >
> > > > While the different panels have slightly different delays, it's
> > > > possible to come up with a set of unified delays that will work on all
> > > > the panels. From reading the datasheets:
> > > > * KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
> > > >   - HPD absent delay: 200 ms
> > > >   - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
> > > > * Starry 2081116HHD028001-51D
> > > >   - HPD absent delay: 100 ms
> > > >   - Enable delay: (link training done till enable BL): 200 ms
> > > >   - Unprepare delay: 500 ms
> > > > * Sharp LQ116M1JW10
> > > >   - HPD absent delay: 200 ms
> > > >   - Unprepare delay: 500 ms
> > > >   - Prepare to enable delay (power on till backlight): 100 ms
> > > >
> > > > Unified:
> > > > - HPD absent delay: 200 ms
> > > > - Unprepare delay: 500 ms
> > > > - Enable delay: 200 ms
> > > >
> > > > NOTE: in theory the only thing that we _really_ need unity on is the
> > > > "HPD absent delay" since once the panel asserts HPD we can read the
> > > > EDID and could make per-panel decisions if we wanted.
> > > >
> > > > Let's create a definition of "a panel that can be attached to pompom"
> > > > as a panel that provides a valid EDID and can work with the standard
> > > > pompom power sequencing. If more panels are later attached to pompom
> > > > then it's fine as long as they work in a compatible way.
> > > >
> > > > One might ask why we can't just use a generic string here and provide
> > > > the timings directly in the device tree file. As I understand it,
> > > > trying to describe generic power sequencing in the device tree is
> > > > frowned upon and the one instance (SD/MMC) is regarded as a mistake
> > > > that shouldn't be repeated. Specifying a power sequence per board (or
> > > > per board class) feels like a reasonable compromise. We're not trying
> > > > to define fully generic power sequence bindings but we can also take
> > > > advantage of the semi-probable properties of the attached device.
> > > >
> > > > NOTE: I believe that past instances of supporting this type of thing
> > > > have used the "white lie" approach. One representative panel was
> > > > listed in the device tree. The power sequencings of this
> > > > representative panel were OK to use across all panels that might be
> > > > attached and other differences were handled by EDID. This patch
> > > > attempts to set a new precedent and avoid the need for the white lie.
> > > >
> > > > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > > > ---
> > >
> > > Sounds reasonable to me if DT maintainers can live with this abstract
> > > hardware definition. It's clearer than the 'white lie' approach.
> >
> > Yeah, it is a weird grey area between "discoverable" and "not
> > discoverable".. but I favor DT reflecting reality as much as
> > possible/feasible, so I think this is definity cleaner than "white
> > lies"
>
> This is practically no different than the "white lie". I suppose you
> could perhaps call it "more honest", if you want.
>
> The point remains that unless we describe exactly which panel we're
> dealing with, we ultimately have no way of properly quirking anything if
> we ever have to. Also, once we allow this kind of wildcard we can
> suddenly get into a situation where people might want to reuse this on
> something that's not at all a google-pompom board because the same
> particular power sequence happens to work on on some other board.
>
> Similarly I can imagine a situation where we could now have the same
> panel supported by multiple different wildcard compatible strings. How
> is that supposed to be any cleaner than what we have now?
>
> And I still keep wondering why bootloaders can't be taught about these
> kinds of things. We have in the past discussed various solutions where
> the bootloader could detect the type of panel connected and set the
> proper compatible string.

The bootloader cannot detect the panel without powering up the panel,
which it normally does not do if you are not in dev-mode (it would add
a significant amount of time to bootup, which is why we can't do this)

BR,
-R

> If that's too complicated and these really are standardized interfaces
> that work across a wide range of devices with perhaps a couple of
> standard parameter, then introducing a standard connector type like
> Rob Herring is suggesting makes more sense because that more properly
> describes where exactly the standardization is going on (i.e. at the
> interface level rather than the panel level).
>
> Thierry
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
