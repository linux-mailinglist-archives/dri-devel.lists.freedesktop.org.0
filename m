Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09EA516C333
	for <lists+dri-devel@lfdr.de>; Tue, 25 Feb 2020 15:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1951F6EADE;
	Tue, 25 Feb 2020 14:03:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF726EADE
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 14:03:08 +0000 (UTC)
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com
 [209.85.160.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3423E2465D
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 14:03:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582639388;
 bh=4qn639jYpkdf96gHfdgJKSoL+lKpXNE16GpYcCHFXTM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=sqaAjA+1J37y6usfnHDwA4/OPvt8xEEcMGoo7tGxh/P0Vae37EDc4g8FeFQ734fso
 ujnVJrGDk7kz88ouzyl4RZj7pyWvILr85MF/rZsmxEpQDWYfMHPagkvnTe4Bvmfi6c
 +ZMYg64fbo2gpCPpTf/D5pugasetDk/eo77dBmBM=
Received: by mail-qt1-f177.google.com with SMTP id i23so9085778qtr.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 06:03:08 -0800 (PST)
X-Gm-Message-State: APjAAAXLu1Uw6EApZkiN2ThrAr6V7vDo5SpTt2LSzZIlXGenuKt3vOe6
 AT9MsgzlqjBQiiZdw3rQroZJKO2xA4wBn2E0zg==
X-Google-Smtp-Source: APXvYqyY0f8YCsY0KVybyegDUL7R6z4tio3DOIbnu6bhfP9ELYYo0gmY/zYUsN5JJ1tibdP6DSvSpwzCZG6i3yyhwsE=
X-Received: by 2002:ac8:59:: with SMTP id i25mr54944784qtg.110.1582639387281; 
 Tue, 25 Feb 2020 06:03:07 -0800 (PST)
MIME-Version: 1.0
References: <cover.6c896ace9a5a7840e9cec008b553cbb004ca1f91.1582533919.git-series.maxime@cerno.tech>
 <bf8aa2deea50cc3599caeb9ed1a07556353415df.1582533919.git-series.maxime@cerno.tech>
 <20200224184107.GA4189@bogus> <20200225115447.yntzkh3vfnw67ial@gilmour.lan>
In-Reply-To: <20200225115447.yntzkh3vfnw67ial@gilmour.lan>
From: Rob Herring <robh@kernel.org>
Date: Tue, 25 Feb 2020 08:02:55 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+kBNkTApDoyQ55gwW2WpHo7ywJ-UJ=-vGmWYsvshRijw@mail.gmail.com>
Message-ID: <CAL_Jsq+kBNkTApDoyQ55gwW2WpHo7ywJ-UJ=-vGmWYsvshRijw@mail.gmail.com>
Subject: Re: [PATCH 29/89] dt-bindings: display: Convert VC4 bindings to
 schemas
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 25, 2020 at 5:54 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> Hi Rob,
>
> On Mon, Feb 24, 2020 at 12:41:07PM -0600, Rob Herring wrote:
> > On Mon, 24 Feb 2020 10:06:31 +0100, Maxime Ripard wrote:
> > > The BCM283x SoCs have a display pipeline composed of several controllers
> > > with device tree bindings that are supported by Linux.
> > >
> > > Now that we have the DT validation in place, let's split into separate
> > > files and convert the device tree bindings for those controllers to
> > > schemas.
> > >
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: devicetree@vger.kernel.org
> > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > ---
> > >  Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt              | 174 +------------------------------------------------------------------------
> > >  Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml         |  66 +++++++++++++++++++++++++++-
> > >  Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml        |  73 ++++++++++++++++++++++++++++++-
> > >  Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml        |  75 +++++++++++++++++++++++++++++++-
> > >  Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml         |  37 +++++++++++++++-
> > >  Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml |  40 +++++++++++++++++-
> > >  Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml         |  37 +++++++++++++++-
> > >  Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml         |  42 +++++++++++++++++-
> > >  Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml         |  34 ++++++++++++++-
> > >  Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml         |  44 ++++++++++++++++++-
> > >  MAINTAINERS                                                             |   2 +-
> > >  11 files changed, 449 insertions(+), 175 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
> > >  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml
> > >
> >
> > My bot found errors running 'make dt_binding_check' on your patch:
> >
> > warning: no schema found in file: Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml: ignoring, error in schema: properties
> > Documentation/devicetree/bindings/display/simple-framebuffer.example.dts:21.16-37.11: Warning (chosen_node_is_root): /example-0/chosen: chosen node must be at root node
> > /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml: properties: '#clock-cells' is a dependency of 'clock-output-names'
> > Documentation/devicetree/bindings/Makefile:12: recipe for target 'Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.example.dts' failed
> > make[1]: *** [Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.example.dts] Error 1
> > Makefile:1263: recipe for target 'dt_binding_check' failed
> > make: *** [dt_binding_check] Error 2
> >
> > See https://patchwork.ozlabs.org/patch/1242907
> > Please check and re-submit.
>
> Yeah, that was fixed in patch 31 ("dt-bindings: display: vc4: dsi: Add
> missing clock properties"). I'm not quite sure what the preferred
> approach here would be: I did a conversion as is of the binding, and
> then fixed it, or do you prefer having it all in the same patch?

A note in this patch should be enough. I do review these before
sending them. I was puzzled having one from you fail.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
