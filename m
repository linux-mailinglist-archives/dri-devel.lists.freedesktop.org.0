Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 663191FFD76
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jun 2020 23:36:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF4586E46F;
	Thu, 18 Jun 2020 21:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9950A6E46F
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 21:36:17 +0000 (UTC)
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 486E0208D5
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 21:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592516177;
 bh=FdXArNlOB0a4SDD87jaMCdex3U6cqGK9MVm02lJxTSE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=beeDmxTP1FFdQ3fvaOLfntCXvqSjM3gB0ixl7YhxxFGB/mfix17N8JFG/UjJrYG3g
 6lvMLng2x6l2hVHi2tl35XW4q49P4rxa2+1KBsca738X6+70/pLG9iaaG1wZ1qRCjB
 pE40dTIfIrnvWuKQ4u6tseDX82wTkRlK6KDebxAc=
Received: by mail-ot1-f48.google.com with SMTP id g7so5712483oti.13
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jun 2020 14:36:17 -0700 (PDT)
X-Gm-Message-State: AOAM533e44RUckgy3gpzn9pHkDr7Tp8YEn46Fi6whF/qd4xCFW1tXzzY
 tIP1//NF0VVw1EoqZ2NR19aOXCf7QR4616/WOA==
X-Google-Smtp-Source: ABdhPJyK9lNDKrCs4w4FjkehZE7UEcLoAPbiczZmKhA3RVLvDbYsghyBlmLbtquEkOgGmeQG/6IBs3D5jEV5pBdXu0Y=
X-Received: by 2002:a05:6830:3104:: with SMTP id
 b4mr681576ots.192.1592516176577; 
 Thu, 18 Jun 2020 14:36:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200618202447.872851-1-robh@kernel.org>
 <20200618205922.GA89738@ravnborg.org>
In-Reply-To: <20200618205922.GA89738@ravnborg.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 18 Jun 2020 15:36:05 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+dm-YRtTkQNbNh2JSD_qhf0Do9jP74wKp32=BYgOVRYQ@mail.gmail.com>
Message-ID: <CAL_Jsq+dm-YRtTkQNbNh2JSD_qhf0Do9jP74wKp32=BYgOVRYQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: display: Convert connectors to DT schema
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
Cc: devicetree@vger.kernel.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 18, 2020 at 2:59 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Rob.
>
> On Thu, Jun 18, 2020 at 02:24:47PM -0600, Rob Herring wrote:
> > Convert the analog TV, DVI, HDMI, and VGA connector bindings to DT schema
> > format.
> >
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Maxime Ripard <mripard@kernel.org>
> > Signed-off-by: Rob Herring <robh@kernel.org>
> > ---
> > I put myself as maintainer, but would be happy if someone else was like
> > one of the Cc'ed people.
> I nominate Laurent for this....
>
> See some comments in the following.
> Mostly related to required - I may have missed something.
>
>         Sam
> >
> >  .../display/connector/analog-tv-connector.txt | 31 --------
> >  .../connector/analog-tv-connector.yaml        | 47 ++++++++++++
> >  .../display/connector/dvi-connector.txt       | 36 ---------
> >  .../display/connector/dvi-connector.yaml      | 75 +++++++++++++++++++
> >  .../display/connector/hdmi-connector.txt      | 31 --------
> >  .../display/connector/hdmi-connector.yaml     | 63 ++++++++++++++++
> >  .../display/connector/vga-connector.txt       | 36 ---------
> >  .../display/connector/vga-connector.yaml      | 42 +++++++++++
> >  8 files changed, 227 insertions(+), 134 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/connector/dvi-connector.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/connector/hdmi-connector.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/connector/hdmi-connector.yaml
> >  delete mode 100644 Documentation/devicetree/bindings/display/connector/vga-connector.txt
> >  create mode 100644 Documentation/devicetree/bindings/display/connector/vga-connector.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > deleted file mode 100644
> > index 883bcb2604c7..000000000000
> > --- a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.txt
> > +++ /dev/null
> > @@ -1,31 +0,0 @@
> > -Analog TV Connector
> > -===================
> > -
> > -Required properties:
> > -- compatible: "composite-video-connector" or "svideo-connector"
> > -
> > -Optional properties:
> > -- label: a symbolic name for the connector
> > -- sdtv-standards: limit the supported TV standards on a connector to the given
> > -                  ones. If not specified all TV standards are allowed.
> > -                  Possible TV standards are defined in
> > -                  include/dt-bindings/display/sdtv-standards.h.
> > -
> > -Required nodes:
> > -- Video port for TV input
> > -
> > -Example
> > --------
> > -#include <dt-bindings/display/sdtv-standards.h>
> > -
> > -tv: connector {
> > -     compatible = "composite-video-connector";
> > -     label = "tv";
> > -     sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
> > -
> > -     port {
> > -             tv_connector_in: endpoint {
> > -                     remote-endpoint = <&venc_out>;
> > -             };
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
> > new file mode 100644
> > index 000000000000..d9ac42cb7e04
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/connector/analog-tv-connector.yaml
> > @@ -0,0 +1,47 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/connector/analog-tv-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog TV Connector
> > +
> > +maintainers:
> > +  - Rob Herring <robh@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - composite-video-connector
> > +      - svideo-connector
> > +
> > +  label: true
> > +
> > +  sdtv-standards:
> > +    description: Limit the supported TV standards on a connector to the given
> > +      ones. If not specified all TV standards are allowed. Possible TV
> > +      standards are defined in include/dt-bindings/display/sdtv-standards.h.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +
> > +  port:
> > +    description: Connection to controller providing analog TV signals
> required:
>   - compatible
>   - port
>
> ??

compatible is implicitly required as that has to be there to match on.
So if it was the only thing, I just omitted it. Maybe better to just
list it.

I was thinking port is optional on all these as it could just be the
parent node.

>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/display/sdtv-standards.h>
> > +
> > +    connector {
> > +      compatible = "composite-video-connector";
> > +      label = "tv";
> > +      sdtv-standards = <(SDTV_STD_PAL | SDTV_STD_NTSC)>;
> > +
> > +      port {
> > +        tv_connector_in: endpoint {
> > +          remote-endpoint = <&venc_out>;
> > +        };
> > +      };
> > +    };
> My personal preference is 4 space indent.
> Easier to read for me.

Sure.

> But we discussed this before - would be good
> with a recommendation so we know what to expect.

I don't really care until we have a way to automatically check it.
Then it will be the Law.

>
> Oh, and example-schema uses 6 spaces :-(

Humm...

> > +
> > +...
> > diff --git a/Documentation/devicetree/bindings/display/connector/dvi-connector.txt b/Documentation/devicetree/bindings/display/connector/dvi-connector.txt
> > deleted file mode 100644
> > index 207e42e9eba0..000000000000
> > --- a/Documentation/devicetree/bindings/display/connector/dvi-connector.txt
> > +++ /dev/null
> > @@ -1,36 +0,0 @@
> > -DVI Connector
> > -==============
> > -
> > -Required properties:
> > -- compatible: "dvi-connector"
> > -
> > -Optional properties:
> > -- label: a symbolic name for the connector
> > -- ddc-i2c-bus: phandle to the i2c bus that is connected to DVI DDC
> > -- analog: the connector has DVI analog pins
> > -- digital: the connector has DVI digital pins
> > -- dual-link: the connector has pins for DVI dual-link
> > -- hpd-gpios: HPD GPIO number
> > -
> > -Required nodes:
> > -- Video port for DVI input
> > -
> > -Note: One (or both) of 'analog' or 'digital' must be set.
> > -
> > -Example
> > --------
> > -
> > -dvi0: connector@0 {
> > -     compatible = "dvi-connector";
> > -     label = "dvi";
> > -
> > -     digital;
> > -
> > -     ddc-i2c-bus = <&i2c3>;
> > -
> > -     port {
> > -             dvi_connector_in: endpoint {
> > -                     remote-endpoint = <&tfp410_out>;
> > -             };
> > -     };
> > -};
> > diff --git a/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
> > new file mode 100644
> > index 000000000000..aaf61bce64ca
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/connector/dvi-connector.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: GPL-2.0-only
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/connector/dvi-connector.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: DVI Connector
> > +
> > +maintainers:
> > +  - Rob Herring <robh@kernel.org>
> > +
> > +properties:
> > +  compatible:
> > +    const: dvi-connector
> > +
> > +  type:
> > +    description: The HDMI connector type
> > +    enum:
> > +      - a   # Standard full size
> > +      - b   # Never deployed?
> > +      - c   # Mini
> > +      - d   # Micro
> > +      - e   # automotive
> type looks like something that was copied from another binding.
> It is not part of the .txt binding.

Err, copy-n-paste from hdmi...

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
