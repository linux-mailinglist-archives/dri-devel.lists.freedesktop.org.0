Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DA232F55D
	for <lists+dri-devel@lfdr.de>; Fri,  5 Mar 2021 22:40:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E14D6EC69;
	Fri,  5 Mar 2021 21:40:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com
 [209.85.210.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2ADC6EC69
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Mar 2021 21:40:10 +0000 (UTC)
Received: by mail-ot1-f42.google.com with SMTP id h10so3256837otm.1
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Mar 2021 13:40:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=mYxHptw1KTbed+zvBUFMPUGWjJ8e/M/IJSiaMc6FiG0=;
 b=m81mjEqIEu8JwldgJ1P7j3Gkbn6LYm+Ki49HTLNRF0ptGPJvET5a3wuxvtxutDTMSL
 mIaQbdH+rqAi3OQEl2feqa4CsRkkTQM3tuPzSGuZRXRXrFUAwpXOyH9homs5mHvxxmx/
 vQCSVOuGtFAsGjn+bkbYshvZ08A6AORBgurYG5dYLIc1RHR2vkobVJfXP3QkOHlctY1P
 5c8pma+KXT5vvXQE0ugHRKfnFlS7Dw59LrHbSKWFvQu1XZP0gqQLvjZPqMf3nSMztEi9
 XDzlPrND4dwkqhiGDxfa3at9XB9YMXL7NS/4ygQffkd3W2GfRgZ3F6oNL4kUoC/jKLt/
 SEMg==
X-Gm-Message-State: AOAM533OqvOxXoGdJru/EWIGoocXTgXcGjDHb5+50sBjLqHeHnippSzM
 cxuOB0gxlzA7NvbcjBj8Dg==
X-Google-Smtp-Source: ABdhPJxJWs82v6UCi7T+ocmuMtvRYdjiCAavf9R0ZHLXHuKCB44oFhGx5YWQhccXCvwnp1clVl/37g==
X-Received: by 2002:a9d:7e85:: with SMTP id m5mr9561336otp.11.1614980410021;
 Fri, 05 Mar 2021 13:40:10 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id w15sm843978otp.29.2021.03.05.13.40.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Mar 2021 13:40:09 -0800 (PST)
Received: (nullmailer pid 692471 invoked by uid 1000);
 Fri, 05 Mar 2021 21:40:08 -0000
Date: Fri, 5 Mar 2021 15:40:08 -0600
From: Rob Herring <robh@kernel.org>
To: Jagan Teki <jagan@amarulasolutions.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: display: bridge: Add bindings for
 Chipone ICN6211
Message-ID: <20210305214008.GA688115@robh.at.kernel.org>
References: <20210214175211.105107-1-jagan@amarulasolutions.com>
 <CAG3jFysAq0rSVRgjDSu6gF4kHcqOGAZt+b0Rz_reHgQr3Scy6A@mail.gmail.com>
 <CAMty3ZAk0W8KbFPo3fo3NavEvveRfptovOeaWA_hh0rXVYhDnw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMty3ZAk0W8KbFPo3fo3NavEvveRfptovOeaWA_hh0rXVYhDnw@mail.gmail.com>
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
 <devicetree@vger.kernel.org>, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 15, 2021 at 05:38:16PM +0530, Jagan Teki wrote:
> On Mon, Feb 15, 2021 at 5:28 PM Robert Foss <robert.foss@linaro.org> wrote:
> >
> > Hey Jagan,
> >
> > Thanks for submitting this.
> >
> > checkpatch.pl threw some typ-o warnings, and I listed them below. I
> > think either spelling is correct, but 'spelling.txt' does list this as
> > a typ-o explicitly, so I would suggest conforming to that just to
> > silence the checkpatch warning.
> >
> > This patch also passes 'dt_binding_check' and 'dtbs_check', but I
> > think I'd like to defer to Rob Herring for an actual r-b.
> >
> > On Sun, 14 Feb 2021 at 18:55, Jagan Teki <jagan@amarulasolutions.com> wrote:
> > >
> > > ICN6211 is MIPI-DSI to RGB Convertor bridge from Chipone.
> > >
> > > It has a flexible configuration of MIPI DSI signal input and
> > > produce RGB565, RGB666, RGB888 output format.
> > >
> > > Add dt-bingings for it.
> > >
> > > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > > ---
> > > Changes for v3:
> > > - updated to new dt-bindings style
> > >
> > >  .../display/bridge/chipone,icn6211.yaml       | 90 +++++++++++++++++++
> > >  1 file changed, 90 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > new file mode 100644
> > > index 000000000000..13764f13fe46
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/bridge/chipone,icn6211.yaml
> > > @@ -0,0 +1,90 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/bridge/chipone,icn6211.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Chipone ICN6211 MIPI-DSI to RGB Converter bridge
> >
> > $ scripts/checkpatch.pl --git HEAD~0
> > WARNING: 'Convertor' may be misspelled - perhaps 'Converter'?
> 
> Thanks for pointing it.
> 
> I was aware of it before sending it and need to understand whether we
> need to use vendor naming conversion or not. Chipone call these
> devices are Convertor [1], So I have used the vendor notation for
> better understanding.
> 
> Any comments are this would be welcome?

Fix their spelling. If you need to propagate spelling/grammar errors, 
there's a defined way to do so.

Rob

> 
> [1] http://en.chiponeic.com/content/details45_123.html
> 
> Jagan.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
