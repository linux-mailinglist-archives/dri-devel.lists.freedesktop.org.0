Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DF4F45D404
	for <lists+dri-devel@lfdr.de>; Thu, 25 Nov 2021 06:03:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C68AF6E0C8;
	Thu, 25 Nov 2021 05:03:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0F96E0C8
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Nov 2021 05:03:20 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id e3so20184682edu.4
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Nov 2021 21:03:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ln2UAiZHSVyc5OYXLHIAkU5QHzDETS+mKR2UXZSBbeo=;
 b=c4Fb++MCVhmMgY6zqDDNHF7R0IiAifjq8CiTHc4HD0mbRFLkWJInRR22JLG/zHFMrQ
 OoKOyAuPHZOK0NSxZQd3TRhJSFHEYegaftjsBRUnzsmXuAeqGsrf3iknIEC/UJR7TJ+R
 aoVqo9tGQ/n2szl8udTpEG49La79zbsXbdxeI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ln2UAiZHSVyc5OYXLHIAkU5QHzDETS+mKR2UXZSBbeo=;
 b=dOIODxtGVHzVE1V5JbPp4gXdrMb6euCwu+9A51l507jneITZd3nfygRh+9ekVkFOHD
 uKufd2vSv4vqjkzjL9af/8e8VSaa5f2GGgJL9yODLhVa3xUt7lYFDUQ2v6BZxefSjY5M
 xxkXS2EAMk8eSERkts2DaA/nMtrVld8PrvTkBU1xVrHUWkX66QGx8PYc3MD5K9V6Y67H
 WELpSknI7EUby/SVV+j/spSGmrBV0wD4REotTRJ4q+98jxaIAOv3M50bqpmQIGact0Q0
 2eWvJSkVh5eX7DVA9G5lDJtVZchY9JFs2SF5wYiHPw728Ds9Xcx44mTUizCVZcwjhg7u
 sf8w==
X-Gm-Message-State: AOAM533se86dD1oP8ygEZH0ZS3eJ20PoDf4COcJpDr+Q1lAK+f2wetjL
 B+j/I0aO6OvduS8geL+uKwhbh8q410DJ6l2lIEx8Ew==
X-Google-Smtp-Source: ABdhPJzCY+lNVauG0lb3gQ3Tlm/4OVnsElNji6S+5wZZ7b9i1TOyhg38LKEo+D/hBm3DMhpXKVPQeIDIn/zB182VPII=
X-Received: by 2002:a05:6402:5110:: with SMTP id
 m16mr34989210edd.15.1637816598877; 
 Wed, 24 Nov 2021 21:03:18 -0800 (PST)
MIME-Version: 1.0
References: <20211124172553.519309-1-jagan@amarulasolutions.com>
 <YZ67Pm2vbSyWMIam@pendragon.ideasonboard.com>
In-Reply-To: <YZ67Pm2vbSyWMIam@pendragon.ideasonboard.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Thu, 25 Nov 2021 10:33:07 +0530
Message-ID: <CAMty3ZBGtk2RKCHk10fjnC8hST4SmT7yWyLnOz6WPqn+X=bXRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: bridge: Add TI DLPC3433 bindings
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
Cc: devicetree@vger.kernel.org, Christopher Vollo <chris@renewoutreach.org>,
 Neil Armstrong <narmstrong@baylibre.com>, linux-amarula@amarulasolutions.com,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Laurent,

On Thu, Nov 25, 2021 at 3:53 AM Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Jagan,
>
> Thank you for the patch.
>
> On Wed, Nov 24, 2021 at 10:55:52PM +0530, Jagan Teki wrote:
> > TI DLPC3433 is a MIPI DSI based display controller bridge
> > for processing high resolution DMD based projectors.
> >
> > It has a flexible configuration of MIPI DSI signal input
> > produces RGB565, RGB666, RGB888 output format with maximum
> > of 720p resolution in 60 and 120 Hz refresh rates.
> >
> > Add dt-bingings for it.
> >
> > Signed-off-by: Christopher Vollo <chris@renewoutreach.org>
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > ---
> >  .../bindings/display/bridge/ti,dlpc3433.yaml  | 112 ++++++++++++++++++
> >  MAINTAINERS                                   |   6 +
> >  2 files changed, 118 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml b/Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
> > new file mode 100644
> > index 000000000000..3ade3a575c3e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/ti,dlpc3433.yaml
> > @@ -0,0 +1,112 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/ti,dlpc3433.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI DLPC3433 Display Controller
> > +
> > +maintainers:
> > +  - Jagan Teki <jagan@amarulasolutions.com>
> > +  - Christopher Vollo <chris@renewoutreach.org>
> > +
> > +description: |
> > +  The DLPC3433 or DLPC3438 controllers provide a convenient,
> > +  multi-functional interface between system electronics and
> > +  the DMD, enabling small form factor, low power, and high
> > +  resolution HD displays.
>
> You may want to mention in the title and/or description that this is a
> DSI to DMD bridge. Actually, the device also supports a DPI input, which
> should be modelled in the DT bindings.

How can we model DPI since it is a DSI bridge bindings? Does it mean
we can add another node example to have DPI instead of DSI?

>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - ti,dlpc3433
>
> Or just
>
>   compatible:
>     const: ti,dlpc3433
>
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: virtual channel number of a DSI peripheral
>
> I don't think this is right, the reg is the I2C address. You can drop
> the description.
>
> > +
> > +  enable-gpios:
> > +    description: PROJ_EN pin, chip powers up PROJ_EN is high.
>
> It's called PROJ_ON, not PROJ_EN, in the datasheet.
>
> > +
> > +  vcc_intf-supply:
> > +    description: A 1.8V/3.3V supply that power the Host I/O.
> > +
> > +  vcc_flsh-supply:
> > +    description: A 1.8V/3.3V supply that power the Flash I/O.
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > +        unevaluatedProperties: false
> > +        description: Video port for MIPI DSI input.
> > +
> > +        properties:
> > +          endpoint:
> > +            $ref: /schemas/media/video-interfaces.yaml#
> > +            unevaluatedProperties: false
> > +
> > +            properties:
> > +              data-lanes:
> > +                description: array of physical DSI data lane indexes.
> > +                minItems: 1
> > +                items:
> > +                  - const: 1
> > +                  - const: 2
> > +                  - const: 3
> > +                  - const: 4
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Video port for DPI output (DMD Projector).
>
> The output isn't DPI, but DMD.
>
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - enable-gpios
>
> Can the chip be used with the PROJ_ON input hardwired to a high logic
> state, or does it need to be controlled ?

PROJ_ON require an explicit enablement via driver in order to have
device out-of-reset.

Thanks,
Jagan.
