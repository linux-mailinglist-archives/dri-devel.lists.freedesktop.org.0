Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08EE5370310
	for <lists+dri-devel@lfdr.de>; Fri, 30 Apr 2021 23:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A779E6F5F2;
	Fri, 30 Apr 2021 21:38:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x72b.google.com (mail-qk1-x72b.google.com
 [IPv6:2607:f8b0:4864:20::72b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4C16F5E7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 21:38:45 +0000 (UTC)
Received: by mail-qk1-x72b.google.com with SMTP id u20so40116411qku.10
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:38:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O+NCC185GvVdiBCa7+Pd+oKQFpxMk0PeHhw7on/LJY0=;
 b=EwcYXa4w+hFOwVcOG79Z1xFiI0pBpKJ5X2X980Q7KB/i0nON6cxaQ52synEx6n8OMm
 6eigW5MUkaQK1NfJcoKnLyG6JQBTYIQ2uBFeWDyjhqOnznt1s5ubxm1zdvYB5wO+TvJF
 P1bSP2R62bPtFDeRMklaQWNRq7DdjgKeGkFSg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O+NCC185GvVdiBCa7+Pd+oKQFpxMk0PeHhw7on/LJY0=;
 b=DnyOrtNg2MWpaCUU4+hrwEMMI1iauzXPRURGWRVQljurnk24SLMgT288OoH73q4vQ9
 WCBvmYh2k73KC5E7PwQJ8eV2y7URYYKwwSZ3gwRaE2yScTQZtxWoc33w9jtRc/KMjU04
 kwwpd7fTlBEL3NIfNRDH5amdN3hZ7xdhHijFmUGZAneRsPN9u/10Pr1SOSXto0JhhhPa
 8A55KAlaU4RrACCruL2/z2ZMMQQDp2roeE97GU8GGH4VyvkPyzvhSM7Y5Bj7M+QHBB/p
 KPt8ZWQDAzQ0Mb7DYw/6XvmdtNklN8hOVke8Gi5dFddgzWG0yFlzrnqyUV8meXSNohY0
 Q+1w==
X-Gm-Message-State: AOAM533ekDEfhaFlT2eehDSdJwyRKvNB56RieCNDE7Pi7TO7MacrLw3k
 XYTHsJ5CE0TiORQWCiVc50QFZH0lLRDdTw==
X-Google-Smtp-Source: ABdhPJznfUolQhDykCw+LhLSIQm1K+/3D2PxoyeknXr02NdVkWjX3NTdPy/01Bcxv157d9vQoYLdsw==
X-Received: by 2002:a05:620a:a56:: with SMTP id
 j22mr7506289qka.204.1619818723942; 
 Fri, 30 Apr 2021 14:38:43 -0700 (PDT)
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com.
 [209.85.219.169])
 by smtp.gmail.com with ESMTPSA id y6sm2519039qkd.106.2021.04.30.14.38.41
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 30 Apr 2021 14:38:42 -0700 (PDT)
Received: by mail-yb1-f169.google.com with SMTP id 82so84968070yby.7
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Apr 2021 14:38:41 -0700 (PDT)
X-Received: by 2002:a25:80d4:: with SMTP id c20mr10228081ybm.345.1619818721319; 
 Fri, 30 Apr 2021 14:38:41 -0700 (PDT)
MIME-Version: 1.0
References: <1619416756-3533-1-git-send-email-rajeevny@codeaurora.org>
 <1619416756-3533-2-git-send-email-rajeevny@codeaurora.org>
 <20210429180435.GA1385465@robh.at.kernel.org>
 <CAD=FV=V-kdySH5Pp-Fb-PRYk60Ha_UOTXJHcvMp+uV3P1oo7Uw@mail.gmail.com>
 <78c4bd291bd4a17ae2a1d02d0217de43@codeaurora.org>
In-Reply-To: <78c4bd291bd4a17ae2a1d02d0217de43@codeaurora.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 30 Apr 2021 14:38:29 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XW90L6or8NKA-Rjjp3s3fRno1xSkD+X0PA1rTyeKgpMw@mail.gmail.com>
Message-ID: <CAD=FV=XW90L6or8NKA-Rjjp3s3fRno1xSkD+X0PA1rTyeKgpMw@mail.gmail.com>
Subject: Re: [v3 1/2] dt-bindings: backlight: add DisplayPort aux backlight
To: Rajeev Nandan <rajeevny@codeaurora.org>
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
Cc: mkrishn@codeaurora.org,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "Kristian H. Kristensen" <hoegsberg@chromium.org>,
 freedreno <freedreno@lists.freedesktop.org>, "Lankhorst,
 Maarten" <maarten.lankhorst@intel.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Fri, Apr 30, 2021 at 8:10 AM <rajeevny@codeaurora.org> wrote:
>
> On 30-04-2021 02:33, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Apr 29, 2021 at 11:04 AM Rob Herring <robh@kernel.org> wrote:
> >>
> >> On Mon, Apr 26, 2021 at 11:29:15AM +0530, Rajeev Nandan wrote:
> >> > Add bindings for DisplayPort aux backlight driver.
> >> >
> >> > Changes in v2:
> >> > - New
> >> >
> >> > Signed-off-by: Rajeev Nandan <rajeevny@codeaurora.org>
> >> > ---
> >> >  .../bindings/leds/backlight/dp-aux-backlight.yaml  | 49 ++++++++++++++++++++++
> >> >  1 file changed, 49 insertions(+)
> >> >  create mode 100644 Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> >> >
> >> > diff --git a/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> >> > new file mode 100644
> >> > index 00000000..0fa8bf0
> >> > --- /dev/null
> >> > +++ b/Documentation/devicetree/bindings/leds/backlight/dp-aux-backlight.yaml
> >> > @@ -0,0 +1,49 @@
> >> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> > +%YAML 1.2
> >> > +---
> >> > +$id: http://devicetree.org/schemas/leds/backlight/dp-aux-backlight.yaml#
> >> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> > +
> >> > +title: DisplayPort aux backlight driver bindings
> >> > +
> >> > +maintainers:
> >> > +  - Rajeev Nandan <rajeevny@codeaurora.org>
> >> > +
> >> > +description:
> >> > +  Backlight driver to control the brightness over DisplayPort aux channel.
> >> > +
> >> > +allOf:
> >> > +  - $ref: common.yaml#
> >> > +
> >> > +properties:
> >> > +  compatible:
> >> > +    const: dp-aux-backlight
> >> > +
> >> > +  ddc-i2c-bus:
> >> > +    $ref: /schemas/types.yaml#/definitions/phandle
> >> > +    description:
> >> > +      A phandle to the system I2C controller connected to the DDC bus used
> >> > +      for the DisplayPort AUX channel.
> >> > +
> >> > +  enable-gpios:
> >> > +    maxItems: 1
> >> > +    description: GPIO specifier for backlight enable pin.
> >> > +
> >> > +  max-brightness: true
> >> > +
> >> > +required:
> >> > +  - compatible
> >> > +  - ddc-i2c-bus
> >> > +
> >> > +additionalProperties: false
> >> > +
> >> > +examples:
> >> > +  - |
> >> > +    backlight {
> >> > +        compatible = "dp-aux-backlight";
> >> > +        ddc-i2c-bus = <&sn65dsi86_bridge>;
> >> > +        enable-gpios = <&tlmm 12 GPIO_ACTIVE_HIGH>;
> >>
> >> So the DDC bus is connected to a backlight and also a panel? This
> >> binding is not reflecting the h/w, but rather what you want for some
> >> driver.
> >>
> >> There's only one thing here and that's an eDP panel which supports
> >> backlight control via DP aux channel. You can figure all that out from
> >> the panel's compatible and/or reading the EDID.
> >>
> >> You might also be interested in this thread:
> >>
> >> https://lore.kernel.org/lkml/YIKsDtjcIHGNvW0u@orome.fritz.box/
> >
> > I think Rajeev needs to rework everything anyway as per:
> >
> > https://lore.kernel.org/r/87zgxl5qar.fsf@intel.com
> >
> > ...but you're right that it makes sense not to model the backlight as
> > a separate node in the device tree. The panel driver can handle
> > setting up the backlight.
> >
> > -Doug
>
> It was not a good idea to create a separate backlight driver and use
> ddc-i2c-bus to get access to DP aux. I am working to move the code
> to the panel driver and to utilize the new DRM helper functions
> (drm_edp_backlight_*) Lyude has added [1].
>
> To use these helper functions, the panel driver should have access to
> the
> "struct drm_dp_aux *". The simple-panel has a "ddc-i2c-bus" property
> to give the panel access to the DDC bus and is currently being used to
> get the EDID from the panel. Can I use the same ddc bus i2c_adapter to
> get
> the "struct drm_dp_aux *"?
>
> As per the suggestion [2], I get the "struct drm_dp_aux *" from the
> i2c_adapter of ddc bus (maybe I didn't understand the suggestion
> correctly),
> and, it turned out, the way I have implemented is not the right way [3].
> So, I am afraid to use the same method in the panel driver.
>
>
> [1] https://lore.kernel.org/dri-devel/871rb5bcf9.fsf@intel.com/
> [2] https://www.spinics.net/lists/dri-devel/msg295429.html
> [3]
> https://lore.kernel.org/dri-devel/20210426111116.4lc3ekxjugjr3oho@maple.lan/

So it's definitely up to maintainers, not me. ...but I guess I would
have expected something like a new property called "ddc-aux-bus". Then
you'd have to create a new API call called something like
"of_find_ddc_aux_adapter_by_node()" that would allow you to find it.

I guess an alternate way to solve this (I'm not totally sure whether
it's better or worse) would be to add a function that would walk up
the chain of parent bridges and ask them for a pointer to the aux bus.
I definitely haven't thought it all the way through, but I'd imagine
something like drm_bridge_chain_get_ddc_aux(). This is _probably_
better than adding the "ddc-aux-bus" property but it assumes that the
aux bus is provided by one of our parents. Hrm, looking at this
briefly, though, I'm not sure how to do it. It doesn't seem possible
to get the parent bridges from the panel structure. Even if you assume
that your parent is wrapping you with a panel_bridge it still doesn't
seem possible?

This probably needs more drm-expertise.

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
