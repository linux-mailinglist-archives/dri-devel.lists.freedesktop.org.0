Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0789833FCE0
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 02:53:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 308526E86C;
	Thu, 18 Mar 2021 01:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9026E86C
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 01:53:17 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id b9so3775949wrt.8
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Mar 2021 18:53:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v1i0KsQ3h/jMhWbwFpzMC40inc+yYjGhis5/F6IuRMg=;
 b=ghXDIHNTetOEFrxwksmP6rkHT/cT6FkMc6GeMKOmmng1mTpWSNSM8idAOizGUMojRL
 loy+GhV/jAIPCFByU00CR1sg1Dj2go35NWVxYJRpc1kBxdxlgn7BI/t1WJ3YlOr06ORu
 DJenjLuf0NTv9UheLiyK9ii/nOOFRBEcBJqZq/r5WcKnQymCdx5aetPOv2KLOOQSyoxV
 R324HpbD472f5qAI74A/frwF84q6MIxjkP6wi/9xcjVU9SQe+YTn/IElPcb3qqdmBZcB
 lWEqBjukB/q7C7hYH65ryR2D413L9VEj4PIH1Jn3xtRkzJqbleF1GU+Mtc0g/H+LtB+F
 o1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v1i0KsQ3h/jMhWbwFpzMC40inc+yYjGhis5/F6IuRMg=;
 b=s5FzQ2w229xHUjNQM8Ag3XZOK9J/f2JfWOdspqgfcq9teNBjWzecOTDyuHOYsq51S4
 lbmE3KwrNQexjwdgZRoS99faMyqM/ZtAFsPsU5mL1RH4GJsKkSfIhsg6Ey75iurunzkB
 0sWbYsdT+Unnrrdlt63FdPuvMTUA7bPSItiJQl04y1Oq31ufYItgCQCyc/bRSo0YGi+k
 eiEgkNyUpBPhceW++loI3VqyQF+fpcl5y41iqAw/ALoFFq57+bAl3W2he0msAJj7eXB3
 1P8D0xrSVypwXhrsnl54vvv1G9oLwRJQr8xPWygtKLR1IhxO6QEIguKZkp3XyDq7dF57
 wwpw==
X-Gm-Message-State: AOAM531tI7NNBfus+GutZvPv1n09Jq4AHHns5UPmFeTCeU1FD4QLbco+
 BPNX86Q8XDLFkTGpsXDIWqqqM1vyblxpvTKlE7c=
X-Google-Smtp-Source: ABdhPJzp1l2ljBrXjRJyXLSIUcbc7uR3HCZrC/smDRvMByEEPcM6+4fdLIhY0qI8M8J0QaQ7PYdClv8p8v+qQDtKNK0=
X-Received: by 2002:adf:f587:: with SMTP id f7mr7047833wro.147.1616032396097; 
 Wed, 17 Mar 2021 18:53:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210316140707.RFC.1.I3a21995726282f1e9fcb70da5eb96f19ed96634f@changeid>
 <YFKQaXOmOwYyeqvM@google.com>
In-Reply-To: <YFKQaXOmOwYyeqvM@google.com>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 17 Mar 2021 18:53:04 -0700
Message-ID: <CAF6AEGtu+GBwYfkH3x=UuPs5Ouj0TxqbVjpjFEtMKKWvd1-Gbg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/3] dt-bindings: display: simple: Add the panel on
 sc7180-trogdor-pompom
To: Matthias Kaehlcke <mka@chromium.org>
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
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Steev Klimaszewski <steev@kali.org>, Stephen Boyd <swboyd@chromium.org>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 17, 2021 at 4:27 PM Matthias Kaehlcke <mka@chromium.org> wrote:
>
> On Tue, Mar 16, 2021 at 02:08:19PM -0700, Douglas Anderson wrote:
> > The sc7180-trogdor-pompom board might be attached to any number of a
> > pile of eDP panels. At the moment I'm told that the list might include:
> > - KD KD116N21-30NV-A010
> > - KD KD116N09-30NH-A016
> > - Starry 2081116HHD028001-51D
> > - Sharp LQ116M1JW10
> >
> > It should be noted that while the EDID programmed in the first 3
> > panels indicates that they should run with exactly the same timing (to
> > keep things simple), the 4th panel not only needs different timing but
> > has a different resolution.
> >
> > As is true in general with eDP panels, we can figure out which panel
> > we have and all the info needed to drive its pixel clock by reading
> > the EDID. However, we can do this only after we've powered the panel
> > on. Powering on the panels requires following the timing diagram in
> > each panel's datasheet which specifies delays between certain
> > actions. This means that, while we can be quite dynamic about handling
> > things we can't just totally skip out on describing the panel like we
> > could do if it was connected to an external-facing DP port.
> >
> > While the different panels have slightly different delays, it's
> > possible to come up with a set of unified delays that will work on all
> > the panels. From reading the datasheets:
> > * KD KD116N21-30NV-A010 and KD KD116N09-30NH-A016
> >   - HPD absent delay: 200 ms
> >   - Unprepare delay: 150 ms (datasheet is confusing, might be 500 ms)
> > * Starry 2081116HHD028001-51D
> >   - HPD absent delay: 100 ms
> >   - Enable delay: (link training done till enable BL): 200 ms
> >   - Unprepare delay: 500 ms
> > * Sharp LQ116M1JW10
> >   - HPD absent delay: 200 ms
> >   - Unprepare delay: 500 ms
> >   - Prepare to enable delay (power on till backlight): 100 ms
> >
> > Unified:
> > - HPD absent delay: 200 ms
> > - Unprepare delay: 500 ms
> > - Enable delay: 200 ms
> >
> > NOTE: in theory the only thing that we _really_ need unity on is the
> > "HPD absent delay" since once the panel asserts HPD we can read the
> > EDID and could make per-panel decisions if we wanted.
> >
> > Let's create a definition of "a panel that can be attached to pompom"
> > as a panel that provides a valid EDID and can work with the standard
> > pompom power sequencing. If more panels are later attached to pompom
> > then it's fine as long as they work in a compatible way.
> >
> > One might ask why we can't just use a generic string here and provide
> > the timings directly in the device tree file. As I understand it,
> > trying to describe generic power sequencing in the device tree is
> > frowned upon and the one instance (SD/MMC) is regarded as a mistake
> > that shouldn't be repeated. Specifying a power sequence per board (or
> > per board class) feels like a reasonable compromise. We're not trying
> > to define fully generic power sequence bindings but we can also take
> > advantage of the semi-probable properties of the attached device.
> >
> > NOTE: I believe that past instances of supporting this type of thing
> > have used the "white lie" approach. One representative panel was
> > listed in the device tree. The power sequencings of this
> > representative panel were OK to use across all panels that might be
> > attached and other differences were handled by EDID. This patch
> > attempts to set a new precedent and avoid the need for the white lie.
> >
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
>
> Sounds reasonable to me if DT maintainers can live with this abstract
> hardware definition. It's clearer than the 'white lie' approach.

Yeah, it is a weird grey area between "discoverable" and "not
discoverable".. but I favor DT reflecting reality as much as
possible/feasible, so I think this is definity cleaner than "white
lies"

Reviewed-by: Rob Clark <robdclark@gmail.com>

> It's then up to the vendor/manufacturer to ensure to only ship devices
> with panels that have compatible timings.
>
> >  .../devicetree/bindings/display/panel/panel-simple.yaml       | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > index 62b0d54d87b7..9807dbc1cceb 100644
> > --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> > @@ -140,6 +140,10 @@ properties:
> >        - giantplus,gpg48273qs5
> >          # GiantPlus GPM940B0 3.0" QVGA TFT LCD panel
> >        - giantplus,gpm940b0
> > +        # A panel connected to a google,pompom board. Panel is guaranteed to
> > +        # confirm to google,pompom-panel power sequencing requirements and then
>
> s/confirm/conform/ ?
>
> > +        # the specific panel will be probed via EDID.
> > +      - google,pompom-panel
> >          # HannStar Display Corp. HSD070PWW1 7.0" WXGA TFT LCD panel
> >        - hannstar,hsd070pww1
> >          # HannStar Display Corp. HSD100PXN1 10.1" XGA LVDS panel
>
> FWIW:
>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
