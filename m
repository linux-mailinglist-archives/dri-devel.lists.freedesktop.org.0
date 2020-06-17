Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D30291FD5F2
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jun 2020 22:22:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43E86E18E;
	Wed, 17 Jun 2020 20:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61EF16E18E
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 20:22:07 +0000 (UTC)
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2B97821707
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 20:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1592425327;
 bh=xNE9XSOvhghCOem7BB7ItlRidhpb63R/mvntoncsZiY=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cM/8adJS/CfoBabKgs5smCjZMrm8f4R2wBu/gfpLBZYw+kKE8o3U72M3S583OKTjP
 PCrAgGaKQQvjKKN85m9N2/+zEAPa/OWP+SnRpU8VVUEdGURnzSYRgx2brhjdwglSNO
 GbFlg7PGff1nb9Qr5CibEyTntz1Xma5RKY/dSU2Q=
Received: by mail-oi1-f175.google.com with SMTP id i74so2986580oib.0
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Jun 2020 13:22:07 -0700 (PDT)
X-Gm-Message-State: AOAM530nz0mlSpKlDKW9KdtvncdBu2OlTeTfg6rTzJXG4AxbV92M6ZfW
 oYHftPjIRjxKFOplSa16pdH8Pc9ZN9K1bV3OBQ==
X-Google-Smtp-Source: ABdhPJzi4G/SG7UPJZAtkdxWsR+QkKnM2jLwSEKoazMNV1MrKFH3VVff+tCgS2ag5HdiA3cWgQIOgK9y06+Tn3frHYE=
X-Received: by 2002:aca:1e0b:: with SMTP id m11mr388478oic.147.1592425326440; 
 Wed, 17 Jun 2020 13:22:06 -0700 (PDT)
MIME-Version: 1.0
References: <cover.aaf2100bd7da4609f8bcb8216247d4b4e4379639.1590594512.git-series.maxime@cerno.tech>
 <2dc6384c945c7d35ab4f75464d3a77046dc125b3.1590594512.git-series.maxime@cerno.tech>
In-Reply-To: <2dc6384c945c7d35ab4f75464d3a77046dc125b3.1590594512.git-series.maxime@cerno.tech>
From: Rob Herring <robh+dt@kernel.org>
Date: Wed, 17 Jun 2020 14:21:52 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+pZebUgG_fyQkhhbp2khVc+L-kJ2D2O8BiO6SyjfAK_Q@mail.gmail.com>
Message-ID: <CAL_Jsq+pZebUgG_fyQkhhbp2khVc+L-kJ2D2O8BiO6SyjfAK_Q@mail.gmail.com>
Subject: Re: [PATCH v3 006/105] dt-bindings: display: Convert VC4 bindings to
 schemas
To: Maxime Ripard <maxime@cerno.tech>
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
Cc: devicetree@vger.kernel.org, Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "maintainer:BROADCOM BCM7XXX ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
 Phil Elwell <phil@raspberrypi.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>,
 "moderated list:BROADCOM BCM2835 ARM ARCHITECTURE"
 <linux-rpi-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 27, 2020 at 9:49 AM Maxime Ripard <maxime@cerno.tech> wrote:
>
> The BCM283x SoCs have a display pipeline composed of several controllers
> with device tree bindings that are supported by Linux.
>
> Now that we have the DT validation in place, let's split into separate
> files and convert the device tree bindings for those controllers to
> schemas.
>
> This is just a 1:1 conversion though, and some bindings were incomplete so
> it results in example validation warnings that are going to be addressed in
> the following patches.
>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt              | 174 +------------------------------------------------------------------------
>  Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml         |  66 +++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml        |  73 ++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml        |  75 +++++++++++++++++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml         |  37 +++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml |  40 +++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml         |  37 +++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml         |  42 +++++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml         |  34 ++++++++++++++-
>  Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml         |  44 ++++++++++++++++++-
>  MAINTAINERS                                                             |   2 +-
>  11 files changed, 449 insertions(+), 175 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/brcm,bcm-vc4.txt
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-dsi0.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hdmi.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-hvs.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-pixelvalve0.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-txp.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-v3d.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vc4.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/brcm,bcm2835-vec.yaml

Not sure why my checks didn't catch this, but now linux-next has these warnings:

/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.example.dt.yaml:
panel: compatible: Additional items are not allowed ('simple-panel'
was unexpected)
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.example.dt.yaml:
panel: compatible: ['ontat,yx700wv03', 'simple-panel'] is too long
/builds/robherring/linux-dt-bindings/Documentation/devicetree/bindings/display/brcm,bcm2835-dpi.example.dt.yaml:
panel: 'power-supply' is a required property
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
