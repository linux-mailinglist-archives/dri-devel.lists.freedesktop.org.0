Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A8B2A3A34
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 03:06:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D347E6E581;
	Tue,  3 Nov 2020 02:06:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09776E364
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 02:06:00 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 822A022243
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 02:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604369160;
 bh=U09kE3eg/LncgwXocMsU/nUSaCcrLQTgqfcDsBX5QWM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=TGfBaw83eh5eERVBPQAdIl/rLAeddPRzb4/2jG8tLRjQ8qrrH6f/93sskFAyrybRg
 L70FF7HeaiafudeHBCu+xNycMzj8+4UqeChWDZiFLUq4/qZgu/4RVOBmr/uToWRupD
 datVUw+0QN4V1mm3FHT3KTs/oLkNjQDUQjlr3enA=
Received: by mail-oi1-f172.google.com with SMTP id u127so16823756oib.6
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 18:06:00 -0800 (PST)
X-Gm-Message-State: AOAM533OcOFKPcayehJE4z6tA7U3Kgjo98FP1zAZmoryyLIM+YolD22B
 Ioqwf7eNxgO+rclSyZAjloCilBL5l5nA8OhDOQ==
X-Google-Smtp-Source: ABdhPJzcC9V2aSXBlOuuAGoAcDiRhcaG86rTXDTlKp6brtyj2GwU6U+byq2MG9Tw7vO2Vf3ghv8GC9baNKFghuQUHhs=
X-Received: by 2002:a54:4588:: with SMTP id z8mr658837oib.147.1604369159750;
 Mon, 02 Nov 2020 18:05:59 -0800 (PST)
MIME-Version: 1.0
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
 <20201029222046.GA904738@ravnborg.org>
 <b30439f7-b77e-9ca8-57e9-16cf417da0cf@baylibre.com>
 <20201030211539.GB1003403@ravnborg.org>
 <CAL_JsqKFXDP921nGrO9o+RjMLnYLBiyagQmUUZFb10QJgu8kZQ@mail.gmail.com>
 <bcca48b9-5baa-2842-a6f0-23a2b668272a@baylibre.com>
 <20201102180406.GA1404335@ravnborg.org>
In-Reply-To: <20201102180406.GA1404335@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Nov 2020 20:05:48 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKW-t11oRMH6mOyUvQ=FTn8KKqrKMODr0Q37yKtepBxbA@mail.gmail.com>
Message-ID: <CAL_JsqKW-t11oRMH6mOyUvQ=FTn8KKqrKMODr0Q37yKtepBxbA@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: display: Add support for Intel
 KeemBay Display
To: Sam Ravnborg <sam@ravnborg.org>
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
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 12:04 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Neil.
>
> > >>>>> ---
> > >>>>>  .../bindings/display/intel,keembay-display.yaml    | 75 ++++++++++++++++++++++
> > >>>>>  1 file changed, 75 insertions(+)
> > >>>>>  create mode 100644 Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> > >>>>>
> > >>>>> diff --git a/Documentation/devicetree/bindings/display/intel,keembay-display.yaml b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> > >>>>> new file mode 100644
> > >>>>> index 0000000..8a8effe
> > >>>>> --- /dev/null
> > >>>>> +++ b/Documentation/devicetree/bindings/display/intel,keembay-display.yaml
> > >>>>> @@ -0,0 +1,75 @@
> > >>>>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > >>>>> +%YAML 1.2
> > >>>>> +---
> > >>>>> +$id: http://devicetree.org/schemas/display/intel,keembay-display.yaml#
> > >>>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > >>>>> +
> > >>>>> +title: Devicetree bindings for Intel Keem Bay display controller
> > >>>>> +
> > >>>>> +maintainers:
> > >>>>> +  - Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> > >>>>> +  - Edmond J Dea <edmund.j.dea@intel.com>
> > >>>>> +
> > >>>>> +properties:
> > >>>>> +  compatible:
> > >>>>> +    const: intel,keembay-display
> > >>>>> +
> > >>>>> +  reg:
> > >>>>> +    items:
> > >>>>> +      - description: LCD registers range
> > >>>>> +      - description: Msscam registers range
> > >>>>> +
> > >>>
> > >>> Indeed the split is much better, but as you replied on http://lore.kernel.org/r/BY5PR11MB41827DE07436DD0454E24E6E8C0A0@BY5PR11MB4182.namprd11.prod.outlook.com
> > >>> the msscam seems to be shared with the camera subsystem block, if this is the case it should be handled.
> > >>>
> > >>> If it's a shared register block, it could be defined as a "syscon" used by both subsystems.
> > >>
> > >> I think I got it now.
> > >>
> > >> msscam is used to enable clocks both for the display driver and the
> > >> mipi-dsi part.
> > >
> > > If just clocks, then the msscam should be a clock provider possibly.
> > > If not, then the below looks right.
>
> I am feeling a little clueless here - sorry.
>
> Can you help with any example that does this?

I'm pretty sure there's some DSI PHYs where they are also a clock provider.

> Everything I looked up in bindings/clock/ had a "#clock-cells" which is
> not relevant for msscam - or so I think at least.

That is precisely what needs to be added to msscam and then there
would be another 'clocks' entry here.

But it really depends if the register accesses here map to the
controls the clock API provides.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
