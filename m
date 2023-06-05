Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B619C7228DD
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 16:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1398B10E1CC;
	Mon,  5 Jun 2023 14:33:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B80F010E1CC
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jun 2023 14:33:27 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 98e67ed59e1d1-2562cc85d3dso3965930a91.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jun 2023 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685975607; x=1688567607;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ekP3RhJtUZILk2qnuNRNNeEbC6C5GUUQiR4tbiK5e/o=;
 b=X3va0yxh/FrQ52jqdKXXif81V9LGWorsC1qdWDnfSYKNHlmZGcMdRTyd781ze267V1
 b/sLmA1sflcIDskKH6/XvxBDGnFXsbpfTScg4OIHsWhZ1Y/rUjZQPhJpHqjvOoVLNrXX
 0/lg3XY/B/uYlD4PAvr3KMSLhv7B68p4zBQfxHYN9BG2C8YfsQ/w8TzzWw9zZzr0chy0
 UiggQTvB4R6k9HsLm2yuPS/g0+bKxzQqYRbNb8oI+C1t8VoZYOmsJ1dnv/vQyDWMFiVx
 6cNY3s9Yxis92L+W1ytpVroASmeDo8LswaxjHD94LUUFHKvoj6ta5NdVdRR368gLcAT7
 Xc0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685975607; x=1688567607;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ekP3RhJtUZILk2qnuNRNNeEbC6C5GUUQiR4tbiK5e/o=;
 b=ghIYXCjTIFaGg3ZScEug8SowcucE/GYLEwS7mnO9OYBH5VbQuoSHe0IS6N3bnoVzrn
 HZjrMEU5a+TKRLKqj1Ktgd3LsYkiHQrnSXAoKUm1du1gEl/290ubtHD/U0K103E9wH0U
 hvWrAPGIaVJg0uj+3IiR2WDPrQf41eQHMu9XDSs9ha0rgKbMAL0wYZlXMdH1vjnMyLnR
 Eojd8pzEA3tDtfM1KCRkdreubCr33wvKRNXxotI7gYnj7avTbtXbmFO+7n/xCW/gCS46
 QaWQpkaFeXkP3fn/y3bJGErpDvRoOYTYJT97tLVAIT3vIc9kEHuSRuBFjWpBhwSTRrDD
 7zlg==
X-Gm-Message-State: AC+VfDwVam8MeLhPVU9W/LAvUNoEQbrMffVWl43ceXZ5rS+TZ4chd9WD
 K/lJaPUisDm36MOveL3pEe5feAcX25AlUsgnpk0=
X-Google-Smtp-Source: ACHHUZ65GdG7b2lW9VigsylmFjnc6G6O2l/ottmoAQR9ATxdr1w08mprQ4VyjxXYojieL+qszn4CV6mu7ULBLjOZIaQ=
X-Received: by 2002:a17:90b:ed8:b0:250:2311:1535 with SMTP id
 gz24-20020a17090b0ed800b0025023111535mr6790908pjb.24.1685975606758; Mon, 05
 Jun 2023 07:33:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230519142456.2588145-1-pavacic.p@gmail.com>
 <20230519142456.2588145-2-pavacic.p@gmail.com>
 <20230519-emerald-void-066fad80950a@spud>
In-Reply-To: <20230519-emerald-void-066fad80950a@spud>
From: Paulo Pavacic <pavacic.p@gmail.com>
Date: Mon, 5 Jun 2023 16:33:15 +0200
Message-ID: <CAO9szn2sYRezCUQKFZ_qsVfne0gpWoirZoE-HpWTPS4G1U5fNQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: display: panel: add fannal,c3004
To: Conor Dooley <conor@kernel.org>
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
Cc: neil.armstrong@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
 sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Conor,

pet, 19. svi 2023. u 18:41 Conor Dooley <conor@kernel.org> napisao je:
>
> Hey Paulo,
>
> On Fri, May 19, 2023 at 04:24:55PM +0200, Paulo Pavacic wrote:
> >
> > Added fannal to vendor-prefixes and dt bindings for Fannal C3004.
> > Fannal C3004 is a 480x800 MIPI DSI Panel which requires
> > DCS initialization sequences with certain delays between certain
> > commands.
> >
> > Signed-off-by: Paulo Pavacic <pavacic.p@gmail.com>
> > ---
> > v3 changelog:
> >   - renamed yml file
> >   - refactored yml file to describe fannal,c3004
> >   - added matrix URI to MAINTAINERS
> > v2 changelog:
> >   - revised driver title, now describes purpose
> >   - revised description, now describes hw
> >   - revised maintainers, now has only 1 mail
> >   - removed diacritics from commit/commit author
> >   - properties/compatible is now enum
> >   - compatible using only lowercase
> >   - revised dts example
> >   - modified MAINTAINERS in this commit (instead of driver commit)
> >   - dt_bindings_check checked yml
> >   - checkpatch warning fixed
> > ---
> >  .../bindings/display/panel/fannal,c3004.yaml  | 75 +++++++++++++++++++
> >  .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
> >  MAINTAINERS                                   |  6 ++
> >  3 files changed, 83 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
> > new file mode 100644
> > index 000000000000..a86b5ce02aa2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/panel/fannal,c3004.yaml
> > @@ -0,0 +1,75 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/panel/fannal,c3004.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Fannal C3004 MIPI-DSI
> > +
> > +maintainers:
> > +  - Paulo Pavacic <pavacic.p@gmail.com>
> > +
> > +description: |
> > +  Fannal C3004 is a 480x800 panel which requires DSI DCS
> > +  initialization sequences.
> > +
> > +allOf:
> > +  - $ref: panel-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - const: fannal,c3004
> > +
> > +  reg: true
>
> Are there no restrictions on the number of reg entries?

What do you mean by this? May I have some example if possible?

>
> > +  reset-gpios: true
>
> Can you put a blank line between properties please?
>
> > +
> > +  vdd-supply:
> > +    description: power supply voltage
> > +  vddio-supply:
> > +    description: power supply voltage for IO
> > +
> > +  width-mm:
> > +    description: physical panel width [mm]
> > +  height-mm:
> > +    description: physical panel height [mm]
>
> Here and for the supplies too.
>
> > diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > index 82d39ab0231b..f962750f630a 100644
> > --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> > @@ -462,6 +462,8 @@ patternProperties:
> >      description: Facebook
> >    "^fairphone,.*":
> >      description: Fairphone B.V.
> > +  "^fannal,.*":
> > +    description: Fannal Electronics Co., Ltd
>
> This needs to be split into a commit of its own.
>
> Thanks,
> Conor.
>
> >    "^faraday,.*":
> >      description: Faraday Technology Corporation
> >    "^fastrax,.*":
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 5c22c828ab46..62374c8424b9 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -6427,6 +6427,12 @@ T:     git git://anongit.freedesktop.org/drm/drm-misc
> >  F:   Documentation/devicetree/bindings/display/panel/ebbg,ft8719.yaml
> >  F:   drivers/gpu/drm/panel/panel-ebbg-ft8719.c
> >
> > +DRM DRIVER FOR FANNAL C3004373132019A
> > +M:   Paulo Pavacic <pavacic.p@gmail.com>
> > +S:   Maintained
> > +C:   matrix:r/mipi-dsi-bringup:matrix.org
> > +F:   Documentation/devicetree/bindings/display/panel/panel-fannal,c3004.yaml
> > +
> >  DRM DRIVER FOR FARADAY TVE200 TV ENCODER
> >  M:   Linus Walleij <linus.walleij@linaro.org>
> >  S:   Maintained
> > --
> > 2.40.1
> >

Thanks,
Paulo
