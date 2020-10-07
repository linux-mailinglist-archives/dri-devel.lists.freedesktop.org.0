Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4727328603E
	for <lists+dri-devel@lfdr.de>; Wed,  7 Oct 2020 15:35:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E2316E8EA;
	Wed,  7 Oct 2020 13:35:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DDF26E8EC
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:35:03 +0000 (UTC)
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id AED8921531
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Oct 2020 13:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602077702;
 bh=k3jDeIb4SJVh8cScB6rh5BNGF/U3Unj3MSy6ypjB80M=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=awCbVYMW8L1HBmxIpnVWcT9tZ1zm7paca6pp+OHhMDb8Q8p53Vktud7lb19RNCu7W
 COQfdTvSTssr1onGWHdsOdKMGd3D2JGE86VgFdWPsAwH68hU6oSov2JP/adzXkr/BW
 zL7Q/M6TbIir+z9I3+/e9TB/8kpAVPBndXntt0uM=
Received: by mail-oi1-f179.google.com with SMTP id q136so1244872oic.8
 for <dri-devel@lists.freedesktop.org>; Wed, 07 Oct 2020 06:35:02 -0700 (PDT)
X-Gm-Message-State: AOAM530fT5R6xUSw8sGoCgujLqgDE0VZ5MO6TAfNEA7/KVbTJJ9Na7/P
 q47ropiK3ntBpz024bNMkpHKKnjnkHE2fdiP4Q==
X-Google-Smtp-Source: ABdhPJx8s8hwOZ/vx9dlfBGi+PCzM8mhw1wJIAzJFZipebsmrlDdLvzOqXSflk977FMmtahmYY7QWpctUbun4FJB2HE=
X-Received: by 2002:aca:4c52:: with SMTP id z79mr2049377oia.147.1602077701913; 
 Wed, 07 Oct 2020 06:35:01 -0700 (PDT)
MIME-Version: 1.0
References: <1601691662-12954-1-git-send-email-anitha.chrisanthus@intel.com>
 <20201006210813.GA2829155@bogus>
 <BY5PR11MB41827DE07436DD0454E24E6E8C0A0@BY5PR11MB4182.namprd11.prod.outlook.com>
In-Reply-To: <BY5PR11MB41827DE07436DD0454E24E6E8C0A0@BY5PR11MB4182.namprd11.prod.outlook.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 7 Oct 2020 08:34:50 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKK0p9w2X-ke2hEjUiJzuKAOBaygkXQ=Ca_kwvZfijtsA@mail.gmail.com>
Message-ID: <CAL_JsqKK0p9w2X-ke2hEjUiJzuKAOBaygkXQ=Ca_kwvZfijtsA@mail.gmail.com>
Subject: Re: [PATCH v1] dt-bindings: display: Add support for Intel KeemBay
 Display
To: "Chrisanthus, Anitha" <anitha.chrisanthus@intel.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "narmstrong@baylibre.com" <narmstrong@baylibre.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "sam@ravnborg.org" <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 6, 2020 at 8:00 PM Chrisanthus, Anitha
<anitha.chrisanthus@intel.com> wrote:
>
> Hi Rob,
> Thanks for the your prompt review. Please see my comments/questions inline.
> For everything else, I can incorporate the changes in v2.
> Anitha
>
> > -----Original Message-----
> > From: Rob Herring <robh@kernel.org>
> > Sent: Tuesday, October 6, 2020 2:08 PM
> > To: Chrisanthus, Anitha <anitha.chrisanthus@intel.com>
> > Cc: devicetree@vger.kernel.org; Paauwe, Bob J <bob.j.paauwe@intel.com>;
> > Dea, Edmund J <edmund.j.dea@intel.com>; sam@ravnborg.org;
> > narmstrong@baylibre.com
> > Subject: Re: [PATCH v1] dt-bindings: display: Add support for Intel KeemBay
> > Display
> >
> > On Fri, Oct 02, 2020 at 07:21:02PM -0700, Anitha Chrisanthus wrote:
> > > This patch adds bindings for Intel KeemBay Display
> > >
> > > Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > ---
> > >  .../bindings/display/intel,kmb_display.yaml        | 106
> > +++++++++++++++++++++
> > >  1 file changed, 106 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> > >
> > > diff --git
> > a/Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> > b/Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> > > new file mode 100644
> > > index 0000000..65835cb
> > > --- /dev/null
> > > +++
> > b/Documentation/devicetree/bindings/display/intel,kmb_display.yaml
> > > @@ -0,0 +1,106 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only
> >
> > check checkpatch.pl
> >
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/intel,kmb_display.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Devicetree bindings for Intel Keem Bay display controller
> > > +
> > > +maintainers:
> > > +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > > +  - Edmond J Dea <edmund.j.dea@intel.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: intel,kmb_display
> >
> > 'keembay' was used elsewhere. Please be consistent.
> >
> > Don't use '_' either.
> Please note that I cannot change the name at this point as there is a dependency on the u-boot firmware which loads the device tree. I can change the name to kmb-drm or keembay-display when updated firmware becomes available.

That's unfortunate that you used bindings without a definition, but it
doesn't matter. If that was fine, then we should just stop documenting
bindings.

> > > +  reg:
> > > +    maxItems: 3
> >
> > Can drop, implied.
> >
> > > +    items:
> > > +      - description: Lcd registers range
> > > +      - description: Mipi registers range
> > > +      - description: Msscam registers range
> >
> > Is this really 1 h/w block? Don't really seem like it given addresses
> > aren't adjacent, separate clocks, and MIPI blocks are often licensed IP.
> Yes, these are part of the camera subsystem block of Intel Movidius Keembay SOC.

Then where's the camera parts? The DT should reflect the h/w, not
what's a convenient split for your drivers.

> Please see  https://lwn.net/Articles/833540/

This should be part of that series.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
