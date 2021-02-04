Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C8730FBA6
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 19:38:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD176EB70;
	Thu,  4 Feb 2021 18:38:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com
 [IPv6:2607:f8b0:4864:20::732])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8370F6EB1E
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 18:38:17 +0000 (UTC)
Received: by mail-qk1-x732.google.com with SMTP id t126so1784213qke.11
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 10:38:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vM6c4mtiu+LcT3H9ps3TkfNorQ1K5y7l85dLt2I5M6Q=;
 b=Ze0bx47qaeuBXm5pMT+CPVIsiB1V+6LwNw+vcXQgzJa/TrIPWlB8/HJ4HCT4I0Bz77
 Khy0A7sDlzPtvryW/DcUc37ruVM9ZBmE+bsQlzOoWMtZ8qPwZ5rtJ7ybttgczuNOHgXD
 2537Cqdungy6XSiNhRVUH3aSZlYLHofusKZUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vM6c4mtiu+LcT3H9ps3TkfNorQ1K5y7l85dLt2I5M6Q=;
 b=iJEe6H/EyI4/DOq6UETdUvFgD2DsXLCs4sm4a6m24hV199pWi7FJm+8LwPDM/JeTHy
 7wF5uylYaoUNEILc5E/eq8oF3OKFWtePC5Q6BRZ1+1ZDwLEwJ69xLnhLR0iFIEqokvmC
 pFtQuVPbDhsPYJ0y1rKhC2YgHX/p7vsupcglEPjvkST5Mun3OD0kVD3w4zb1dyCUv1Ob
 mVTvXYfdp2jLA6mJsWIbSHbasz+bfDrd74NAil9T9pjGqQbx2dfgMuyFSH4vHncm6woz
 GUXfFjJuWiFba5fhhqvXrtLJKI56GfPHR1nxWaUZD+qRLLdawxUWJNsgklzcMXuAo9WP
 Ty8w==
X-Gm-Message-State: AOAM530p5W7RmmgcyzaE3hLD21ZzKzytCL0oBupeOfL35zuVkXoH31NW
 6JFCstZ/GRKoK9ysYL5VeI+dSKryS/PX0Q==
X-Google-Smtp-Source: ABdhPJwQAdmrDLP9ucQDwAK4mZww9LxDTvZNSEfHdQU/89IvTlH4+mShVG7AHStXRFS+6EM9NAfzCA==
X-Received: by 2002:a37:7cc5:: with SMTP id x188mr517982qkc.130.1612463896124; 
 Thu, 04 Feb 2021 10:38:16 -0800 (PST)
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com.
 [209.85.219.170])
 by smtp.gmail.com with ESMTPSA id t62sm5103635qtd.11.2021.02.04.10.38.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 10:38:15 -0800 (PST)
Received: by mail-yb1-f170.google.com with SMTP id s61so4200614ybi.4
 for <dri-devel@lists.freedesktop.org>; Thu, 04 Feb 2021 10:38:15 -0800 (PST)
X-Received: by 2002:a25:da53:: with SMTP id n80mr726868ybf.79.1612463894697;
 Thu, 04 Feb 2021 10:38:14 -0800 (PST)
MIME-Version: 1.0
References: <20210130181014.161457-1-marex@denx.de>
 <CAD=FV=UzkP8Rp6BDNVr1FmOK4GY9_dSeT6fCjQLMatHftyj9iA@mail.gmail.com>
 <c7df0302-c2c1-6ccb-7f7f-8b781d9e3d9b@denx.de>
In-Reply-To: <c7df0302-c2c1-6ccb-7f7f-8b781d9e3d9b@denx.de>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Feb 2021 10:38:01 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U1xN5SPxGzCLMbTT1bL7W4wpXfOt0KeJ3=84TCHfJ8UA@mail.gmail.com>
Message-ID: <CAD=FV=U1xN5SPxGzCLMbTT1bL7W4wpXfOt0KeJ3=84TCHfJ8UA@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: drm/bridge: ti-sn65dsi83: Add TI
 SN65DSI83 bindings
To: Marek Vasut <marex@denx.de>
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Thu, Feb 4, 2021 at 10:09 AM Marek Vasut <marex@denx.de> wrote:
>
> On 2/4/21 6:15 PM, Doug Anderson wrote:
>
> Hi,
>
> [...]
>
> >> +properties:
> >> +  compatible:
> >> +    const: ti,sn65dsi83
> >> +
> >> +  reg:
> >> +    const: 0x2d
> >> +
> >> +  enable-gpios:
> >> +    maxItems: 1
> >> +    description: GPIO specifier for bridge_en pin (active high).
> >
> > I see two regulators: vcc and vcore.  Shouldn't those be listed?
>
> Those are not implemented and not tested, so if someone needs them later
> on, they can be added then.

Sure.  I guess it can go either way.  For the regulator it'd the kind
of thing that's super easy to add support for and hard to mess up.


> >> +          endpoint:
> >> +            type: object
> >> +            additionalProperties: false
> >> +            properties:
> >> +              remote-endpoint: true
> >> +              data-lanes:
> >> +                description: array of physical DSI data lane indexes.
> >
> > The chip doesn't allow for arbitrary remapping here, right?  So you're
> > just using this as the official way to specify the number of lanes?  I
> > guess the only valid values are:
> >
> > <0>
> > <0 1>
> > <0 1 2>
> > <0 1 2 3>
>
> Shouldn't that be <1 2 3 4> ?

The data manual refers to the channels starting at 0, so if it's
arbitrary that seems a better way to go?


> > In sn65dsi86 we attempted to enforce that a valid option was selected
> > for the output lanes.  Could you do something similar?  If nothing
> > else adding a description of the valid options would be good.
>
> I saw the binding, but I was under the impressions the DSI86 can do lane
> reordering, isn't that the case ? Maybe I misunderstood it.

DSI86 can reorder the output lanes quite flexibly.  It can't reorder
the input lanes, though.


> But yes, if you have a suggestion how to make a non-cryptic list of
> those four lane mapping options, please do share this info.

I doubt I can write this correctly without a whole lot of futzing /
messing, but maybe something like:

data-lanes:
  oneOf:
    - items:
        - 0
    - items:
        - 0
        - 1
    - items:
        - 0
        - 1
        - 2
    - items:
        - 0
        - 1
        - 2
        - 3
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
