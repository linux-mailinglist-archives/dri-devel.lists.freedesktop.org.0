Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 908D32A3A2C
	for <lists+dri-devel@lfdr.de>; Tue,  3 Nov 2020 03:02:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 877186E828;
	Tue,  3 Nov 2020 02:02:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D8F66E828
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 02:02:53 +0000 (UTC)
Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com
 [209.85.167.182])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9CE1422265
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Nov 2020 02:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604368972;
 bh=+F4bcu2ma0uIH8myoz9fZotFSPcFeqlYh/iy5l2SZPo=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ecn/AGxIIVBcaVO0szSDzw5b0SDs4Nu2ULU03Unos/u28yAQ/V0Ps9YE8cZZ+eW2L
 efNy4ErSdrdeMlVM+jlSniXUsc6Kd1KSI5u8Ny1/sT97PxMl/TKfz3ytBAFEpi6fK2
 c/Cy12QqVSQRbpMm5uoFk1Uwl/cyefH2nOYgyw0E=
Received: by mail-oi1-f182.google.com with SMTP id d9so10852493oib.3
 for <dri-devel@lists.freedesktop.org>; Mon, 02 Nov 2020 18:02:52 -0800 (PST)
X-Gm-Message-State: AOAM531uudvPuZoLanJaqJeGOYmDt8OwMWMWlByi/RhmWLgAswFlraKb
 WpeZXhjkFZVJVJvtgE9I41ponfqHK5Yj8dDkQQ==
X-Google-Smtp-Source: ABdhPJz5nkoWWcCX16/xbru9maXhObMg9vG0+E3u7KVkkBxjRdbGefundG7D2VCZHokr4fzksPLd/m7y5EoSO68wuRo=
X-Received: by 2002:a54:4588:: with SMTP id z8mr652430oib.147.1604368971964;
 Mon, 02 Nov 2020 18:02:51 -0800 (PST)
MIME-Version: 1.0
References: <1604006877-20092-1-git-send-email-anitha.chrisanthus@intel.com>
 <1604006877-20092-2-git-send-email-anitha.chrisanthus@intel.com>
 <20201029222046.GA904738@ravnborg.org>
 <b30439f7-b77e-9ca8-57e9-16cf417da0cf@baylibre.com>
 <20201030211539.GB1003403@ravnborg.org>
 <CAL_JsqKFXDP921nGrO9o+RjMLnYLBiyagQmUUZFb10QJgu8kZQ@mail.gmail.com>
 <bcca48b9-5baa-2842-a6f0-23a2b668272a@baylibre.com>
In-Reply-To: <bcca48b9-5baa-2842-a6f0-23a2b668272a@baylibre.com>
From: Rob Herring <robh@kernel.org>
Date: Mon, 2 Nov 2020 20:02:41 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKek2WtQfBMhiX5qFTQJEVpYEXW7pHA3TZM-yjb550VqQ@mail.gmail.com>
Message-ID: <CAL_JsqKek2WtQfBMhiX5qFTQJEVpYEXW7pHA3TZM-yjb550VqQ@mail.gmail.com>
Subject: Re: [PATCH v10 1/6] dt-bindings: display: Add support for Intel
 KeemBay Display
To: Neil Armstrong <narmstrong@baylibre.com>
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
 Edmund J" <edmund.j.dea@intel.com>, Sam Ravnborg <sam@ravnborg.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 2, 2020 at 10:38 AM Neil Armstrong <narmstrong@baylibre.com> wrote:
>
> On 02/11/2020 16:16, Rob Herring wrote:
> > On Fri, Oct 30, 2020 at 4:15 PM Sam Ravnborg <sam@ravnborg.org> wrote:
> >>
> >> Hi Neil.
> >>
> >> On Fri, Oct 30, 2020 at 09:31:36AM +0100, Neil Armstrong wrote:
> >>> Hi,
> >>>
> >>> On 29/10/2020 23:20, Sam Ravnborg wrote:
> >>>> Hi Anitha.
> >>>>
> >>>> On Thu, Oct 29, 2020 at 02:27:52PM -0700, Anitha Chrisanthus wrote:
> >>>>> This patch adds bindings for Intel KeemBay Display
> >>>>>
> >>>>> v2: review changes from Rob Herring
> >>>>> v3: review changes from Sam Ravnborg (removed mipi dsi entries, and
> >>>>>     encoder entry, connect port to dsi)
> >>>>>     MSSCAM is part of the display submodule and its used to reset LCD
> >>>>>     and MIPI DSI clocks, so its best to be on this device tree.
> >>>>>
> >>>>> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> >>>>> Cc: Sam Ravnborg <sam@ravnborg.org>
> >>>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >>>>> Cc: Daniel Vetter <daniel@ffwll.ch>
> >>>>
> >>>> Looks good - and the split betwwen the display and the mipi<->dsi parts
> >>>> matches the understanding of the HW I have developed.
> >>>>
> >>>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> >>>>
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
>
> I agree
>
> >
> >>
> >> So it should be pulled in to a dedicated node - for example like this:
> >>
> >> mssscam: msscam@20910000 {
> >>         compatible = "intel,keembay-msscam", "syscon";
> >>         reg = <0x20910000, 0x30>;
> >>         reg-io-width = <4>;
> >> };
> >>
> >> And ofc we need a binding file for that.
> >>
> >>
> >> And then we could have code like this in the display driver:
> >>         regmap *msscam = syscon_regmap_lookup_by_compatible("intel,keembay-msscam");
> >>         if (IS_ERR(msscam))
> >>                 tell-and goto-out;
>
> It's better to use a phandle in the display node, instead of looking for compatible nodes.

No, you don't need it in DT unless there's more than one instance or
other parameters needed like register offsets/masks. The above is
actually faster too walking a list rather than a phandle look up
(though the phandle cache now may make it faster).

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
