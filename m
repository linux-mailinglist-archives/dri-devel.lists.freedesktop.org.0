Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3F84EDC0B
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:48:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A7BE10F1C4;
	Thu, 31 Mar 2022 14:48:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com
 [IPv6:2607:f8b0:4864:20::102b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4802A10F1C7
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 14:48:20 +0000 (UTC)
Received: by mail-pj1-x102b.google.com with SMTP id
 bx24-20020a17090af49800b001c6872a9e4eso3834437pjb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 07:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c4xxm0qNOPOdgTRGpawZSVDAaUINKa/Fa4+C6wrVXik=;
 b=tTkVnQEqds7XMVQaX+/qmVvq8H8la+2aA08jH9UstbBYARwv2qW2ln3p7kQeJ2F5Wb
 aBClkiMreh3OrBYnkGvrE5bOyHPx7JLntHg2ve2wYxC8vc+sAwRhHtFZTwHKlQPL0wiZ
 4yi/guWNhIVo6V6YLVQHU8CPAOfmwrv2lVDf826TCg+doiwA4GFbVE7AMOKM93ZMAX35
 scktUAz7/p0ol5eT4QuIJTMxB3MfWTCh+guyfcc+cWlkjRkinT2G86NGOfd8cA0DbNUW
 GE8yv831bjRGe4hJI2gkOInKklvRM0GB9gUB+BNQBxw+JTdUMhwUJmgERtcLOsFNnqRQ
 IJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c4xxm0qNOPOdgTRGpawZSVDAaUINKa/Fa4+C6wrVXik=;
 b=6paZ9Om8/fXp2mGPIXFtyDwgxkryllatExers9Ps35jUiul/ygjC1HPc3xw3z/NzFD
 QWfglJo4AH889yDTVwgp7KrMbBNZJiAZ6N/1Y0UUMdruKz8HryR+5mMRhqgGBxsTjqq2
 ikLTlrjopPsNWMwGjs5NG9oJFJco2CaLQuYEkpk+Ul64+x2+oQQDzlU4ziwvbBrCyhr9
 YryzsPGAy8Uqv45UFaqdwlMxhKE4Td0gYPOChNztQzh016VPt3CJbZAVKzG6IMs1aD6q
 cDcPymImtRhxcyST7TbQC+yWE6qwIFT6VIH1Cvh7uh/zgaRWSvaZNiUOTJUJxSzgA6M+
 j5NQ==
X-Gm-Message-State: AOAM532UI2FThq4zk4Nhn3iTs0DUotSD8hkgfB6CbwKO3kRG7hY0fkIc
 dzNWb42oifw0UQxdGh/8nsMXQx4WbDzHCF325CTyx7zNEBc=
X-Google-Smtp-Source: ABdhPJyfuiUx5Dlhh6U4cazKR1L1VViE9E/bN+WNOcl513NmaPS66XLaS3tcUyp0OYe3e9+jooKdXdOXy3lUkdy3W8Y=
X-Received: by 2002:a17:90b:124c:b0:1bc:369b:7db5 with SMTP id
 gx12-20020a17090b124c00b001bc369b7db5mr6493543pjb.179.1648738099799; Thu, 31
 Mar 2022 07:48:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220318184755.113152-1-marex@denx.de>
 <CAG3jFyt1S3Rwx1t9BRvzy9zoPAwRr98_O-ovjHWHH+nN6b97qw@mail.gmail.com>
 <0e684035-50ad-fedd-bd4b-682b7716b5fe@denx.de>
In-Reply-To: <0e684035-50ad-fedd-bd4b-682b7716b5fe@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 31 Mar 2022 16:48:08 +0200
Message-ID: <CAG3jFyvbqhyo=VtY+bHLM_5uNBOXHGhxL32nG9zjFaMy9TSfCw@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] drm: bridge: icn6211: Fix hard-coded panel
 settings and add I2C support
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset="UTF-8"
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Jagan Teki <jagan@amarulasolutions.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 31 Mar 2022 at 15:42, Marek Vasut <marex@denx.de> wrote:
>
> On 3/31/22 14:02, Robert Foss wrote:
> > Hey Marek,
>
> Hi,
>
> > On Fri, 18 Mar 2022 at 19:48, Marek Vasut <marex@denx.de> wrote:
> >>
> >> This series fixes multiple problems with the ICN6211 driver and adds
> >> support for configuration of the chip via I2C bus.
> >>
> >> First, in the current state, the ICN6211 driver hard-codes DPI timing
> >> and clock settings specific to some unknown panel. The settings provided
> >> by panel driver are ignored. Using any other panel than the one for which
> >> this driver is currently hard-coded can lead to permanent damage of the
> >> panel (per display supplier warning, and it sure did in my case. The
> >> damage looks like multiple rows of dead pixels at the bottom of the
> >> panel, and this is not going away even after long power off time).
> >>
> >> Much of this series thus fixes incorrect register layout, DPI timing
> >> programming, clock generation by adding actual PLL configuration code.
> >> This series no longer adds lane count decoding and retains current
> >> hard-coded lane count 4 due to disagreement over lane count parsing
> >> from DT. The lane count support will come later. The series also fills
> >> in a couple of registers with likely correct default values.
> >>
> >> Second, this series adds support for I2C configuration of the ICN6211.
> >> The device can be configured either via DSI command mode or via I2C,
> >> the register layout is the same in both cases.
> >>
> >> Since the datasheet for this device is very hard to come by, a lot of
> >> information has been salvaged from [1] and [2].
> >>
> >> [1] https://github.com/rockchip-linux/kernel/blob/develop-4.19/drivers/gpu/drm/bridge/icn6211.c
> >> [2] https://github.com/tdjastrzebski/ICN6211-Configurator
> >>
> >> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >> Cc: Maxime Ripard <maxime@cerno.tech>
> >> Cc: Robert Foss <robert.foss@linaro.org>
> >> Cc: Sam Ravnborg <sam@ravnborg.org>
> >> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> >> To: dri-devel@lists.freedesktop.org
> >>
> >> Marek Vasut (11):
> >>    drm: bridge: icn6211: Fix register layout
> >>    drm: bridge: icn6211: Fix HFP_HSW_HBP_HI and HFP_MIN handling
> >>    drm: bridge: icn6211: Add HS/VS/DE polarity handling
> >>    drm: bridge: icn6211: Add generic DSI-to-DPI PLL configuration
> >>    drm: bridge: icn6211: Use DSI burst mode without EoT and with LP
> >>      command mode
> >>    drm: bridge: icn6211: Disable DPI color swap
> >>    drm: bridge: icn6211: Set SYS_CTRL_1 to value used in examples
> >>    drm: bridge: icn6211: Implement atomic_get_input_bus_fmts
> >>    drm: bridge: icn6211: Add I2C configuration support
> >>    drm: bridge: icn6211: Rework ICN6211_DSI to chipone_writeb()
> >>    drm: bridge: icn6211: Read and validate chip IDs before configuration
> >>
> >>   drivers/gpu/drm/bridge/chipone-icn6211.c | 486 ++++++++++++++++++++---
> >>   1 file changed, 434 insertions(+), 52 deletions(-)
> >>
> >> --
> >> 2.35.1
> >>
> >
> > This series looks ready to be merged
>
> I was waiting for 5.18-rc1 to be out and MW closed before picking it
> into drm-misc-next . Maybe I can pick it up now already ?
>
> > , could you fix the remaining
> > 'checkpatch --strict' warnings that are applicable?
>
> There are only these left, which I think is OK:
> WARNING: Possible unwrapped commit description (prefer a maximum 75
> chars per line)
>
> And then this one strict CHECK, but if I change that the formatting
> looks even uglier:
> 0010-drm-bridge-icn6211-Rework-ICN6211_DSI-to-chipone_wri.patch
>
> CHECK: Alignment should match open parenthesis
> #68: FILE: drivers/gpu/drm/bridge/chipone-icn6211.c:238:
> +       chipone_writeb(icn, PLL_REF_DIV,
>                      (best_p ? PLL_REF_DIV_Pe : 0) | /* Prefer /2
> pre-divider */
>
> CHECK: Alignment should match open parenthesis
> #97: FILE: drivers/gpu/drm/bridge/chipone-icn6211.c:272:
> +       chipone_writeb(icn, VACTIVE_HACTIVE_HI,
>                      ((mode->hdisplay >> 8) & 0xf) |
>
> CHECK: Alignment should match open parenthesis
> #113: FILE: drivers/gpu/drm/bridge/chipone-icn6211.c:284:
> +       chipone_writeb(icn, HFP_HSW_HBP_HI,
>                      HFP_HSW_HBP_HI_HFP(hfp) |
>

I'd like to at least strive for uniformity, so checkpatch is king, and
whatever formatting it preferes is what should be used.

> > Ideally the line
> > removal suggested by Maxime would be included too.
>
> This line removal comment has nothing to do with changes in this series,
> it is about the following patch, which is no longer part of this series
> because there is ongoing disagreement about that part and OF graph, so
> that patch will be resubmitted separately later:

Ack, thanks for explaining.

>
> [PATCH v4 05/13] drm: bridge: icn6211: Add DSI lane count DT property
> parsing
>
> The continuation of that discussion is already in:
>
> [PATCH] dt-bindings: display: bridge: Drop requirement on input port for
> DSI devices
>
> So this series itself has no outstanding changes pending, unless you
> really want the uglier formatting above.

Yes, please resend with this fixed, and I'll merge it.
