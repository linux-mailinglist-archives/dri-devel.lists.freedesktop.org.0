Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BA1B2A327F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Nov 2020 19:04:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 288786E2DE;
	Mon,  2 Nov 2020 18:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 986776E117
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Nov 2020 18:04:12 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id F370320043;
 Mon,  2 Nov 2020 19:04:07 +0100 (CET)
Date: Mon, 2 Nov 2020 19:04:06 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Neil Armstrong <narmstrong@baylibre.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: display: Add support for Intel
 KeemBay Display
Message-ID: <20201102180406.GA1404335@ravnborg.org>
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
 <20201029222046.GA904738@ravnborg.org>
 <b30439f7-b77e-9ca8-57e9-16cf417da0cf@baylibre.com>
 <20201030211539.GB1003403@ravnborg.org>
 <CAL_JsqKFXDP921nGrO9o+RjMLnYLBiyagQmUUZFb10QJgu8kZQ@mail.gmail.com>
 <bcca48b9-5baa-2842-a6f0-23a2b668272a@baylibre.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bcca48b9-5baa-2842-a6f0-23a2b668272a@baylibre.com>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=VbvZwmh9 c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=gEfo2CItAAAA:8 a=QyXUC8HyAAAA:8 a=VwQbUJbxAAAA:8
 a=UqCG9HQmAAAA:8 a=1lay9BswDN2A2IW1Pi0A:9 a=CjuIK1q_8ugA:10
 a=sptkURWiP4Gy88Gu7hUp:22 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Anitha Chrisanthus <anitha.chrisanthus@intel.com>, "Dea,
 Edmund J" <edmund.j.dea@intel.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Neil.

> >>>>> ---
> >>>>>  .../bindings/display/intel,keembay-display.yaml    | 75 ++++++++++++++++++++++
> >>>>>  1 file changed, 75 insertions(+)
> >>>>>  create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> >>>>>
> >>>>> diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> >>>>> new file mode 100644
> >>>>> index 0000000..8a8effe
> >>>>> --- /dev/null
> >>>>> +++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> >>>>> @@ -0,0 +1,75 @@
> >>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>>>> +%YAML 1.2
> >>>>> +---
> >>>>> +$id: http://devicetree.org/schemas/display/intel,keembay-display.yaml#
> >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>>>> +
> >>>>> +title: Devicetree bindings for Intel Keem Bay display controller
> >>>>> +
> >>>>> +maintainers:
> >>>>> +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> >>>>> +  - Edmond J Dea <edmund.j.dea@intel.com>
> >>>>> +
> >>>>> +properties:
> >>>>> +  compatible:
> >>>>> +    const: intel,keembay-display
> >>>>> +
> >>>>> +  reg:
> >>>>> +    items:
> >>>>> +      - description: LCD registers range
> >>>>> +      - description: Msscam registers range
> >>>>> +
> >>>
> >>> Indeed the split is much better, but as you replied on http://lore.kernel.org/r/BY5PR11MB41827DE07436DD0454E24E6E8C0A0@BY5PR11MB4182.namprd11.prod.outlook.com
> >>> the msscam seems to be shared with the camera subsystem block, if this is the case it should be handled.
> >>>
> >>> If it's a shared register block, it could be defined as a "syscon" used by both subsystems.
> >>
> >> I think I got it now.
> >>
> >> msscam is used to enable clocks both for the display driver and the
> >> mipi-dsi part.
> > 
> > If just clocks, then the msscam should be a clock provider possibly.
> > If not, then the below looks right.

I am feeling a little clueless here - sorry.

Can you help with any example that does this?

Everything I looked up in bindings/clock/ had a "#clock-cells" which is
not relevant for msscam - or so I think at least.


	Sam
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
