Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EDE45183E8
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 14:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878DF10E8FA;
	Tue,  3 May 2022 12:03:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7D6710F8C7
 for <dri-devel@lists.freedesktop.org>; Tue,  3 May 2022 12:03:18 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id x18so3583482plg.6
 for <dri-devel@lists.freedesktop.org>; Tue, 03 May 2022 05:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=FAu8c+I73fg5KenFJ98NzZ9OicDW8bebn+wllxjCG1E=;
 b=upghBDfCvCfS7iYO8pSvu7t8unu4twKivp1ctTkclyq+JT6/1Nn4M2ScumgWd2bGdi
 meBP8abuc0ekEDKvWtCsV7M8MtKQxcJuEy9ZroKBJTLuxP97Yr9aMNhPMJmGWHJXm/vT
 clShmVmUxaQvNlWovgxcqQe0PszQRNjMSMCaQ0jrG9ea/Trcs2u/WJiyzzStZ1TusfrH
 uiq0qpE0y4UCT7HXCSd+MCQEx5+TSjrRV0ioiScjB51ePh5PQwx6jXb5kLa+cJC8QVZ2
 fg5icgWxI4ZjA7AjriR/0zKllleaiP93L517b+YEaGJj9FaRoLONytk4XMK7nW7IcEfu
 Ptkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=FAu8c+I73fg5KenFJ98NzZ9OicDW8bebn+wllxjCG1E=;
 b=02xXy0LR+LzdcKX4ieI9e89fM/KVg7SdcbrB0HIEQ+ZctDVA1I4mW48+BrIv9v/NN6
 QFuK0Wr7FBF0swciF/ia1+pRaza8//TK2uiViFAFmJ4f4CCc9m3a0BRpznDtdlY/BscJ
 HnySmTHCvqEIWAAlmQZ2kp5X4tn+OSzewENmyX1lMAVOELjcZcyVx8hiPvY62uKDgMvV
 /zNNvlkqB9yF8L1m4Vf3iOPqbKEDRU1q46TuiSbedERkmyZultzPNNLGnsBEotr15q1S
 pyKy0vgx53A6nMQKSEcQnZgoWz38iYdjek3MgEUruXEOhA5MEku2zw6YJKVSr3F6K27t
 h7uA==
X-Gm-Message-State: AOAM531ArN9ohjrVtCvLsTQUKAIJeqML3Wld8fsmc0wccVZQq8kndIcX
 MDLnc6gCEemLQwaqEfTQYbVcri+m6hW0Kp7C++vN3Q==
X-Google-Smtp-Source: ABdhPJxWhn5VZCO/TgaV9CqU4sqOiFVkFLLPiXSUlkgroHlMnIYcuwG3brGIqnFnP/BqK7l4dbv9U1Fj7YYZ/fuYEOU=
X-Received: by 2002:a17:902:bb8d:b0:156:51a1:3f5a with SMTP id
 m13-20020a170902bb8d00b0015651a13f5amr16302454pls.65.1651579398176; Tue, 03
 May 2022 05:03:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220426193645.244792-1-marex@denx.de>
 <YnB3008DXAVoUK7j@robh.at.kernel.org>
In-Reply-To: <YnB3008DXAVoUK7j@robh.at.kernel.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 3 May 2022 14:03:07 +0200
Message-ID: <CAG3jFyte+ePjD6aYoFCW-+3sBW37ROcL8cYNuBGq31YpOUbGcA@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: bridge: ldb: Implement
 simple Freescale i.MX8MP LDB bridge
To: Rob Herring <robh@kernel.org>
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
Cc: Marek Vasut <marex@denx.de>, devicetree@vger.kernel.org,
 Peng Fan <peng.fan@nxp.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 May 2022 at 02:31, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Apr 26, 2022 at 09:36:44PM +0200, Marek Vasut wrote:
> > The i.MX8MP contains two syscon registers which are responsible
> > for configuring the on-SoC DPI-to-LVDS serializer. Add DT binding
> > which represents this serializer as a bridge.
> >
> > Acked-by: Sam Ravnborg <sam@ravnborg.org>
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Peng Fan <peng.fan@nxp.com>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Robby Cai <robby.cai@nxp.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Thomas Zimmermann <tzimmermann@suse.de>
> > Cc: devicetree@vger.kernel.org
> > To: dri-devel@lists.freedesktop.org
> > ---
> > V2: - Consistently use fsl,imx8mp-ldb as compatible
> >     - Drop items: from compatible:
> >     - Replace minItems with maxItems in clocks:
> >     - Drop quotes from clock-names const: ldb
> >     - Rename syscon to fsl,syscon
> >     - Use generic name of ldb-lvds in example
> > V3: - Add AB from Sam
> >     - Consistently use MX8MP
> > V4: - Rename to fsl-ldb all over the place
> >     - Put the LDB node under media block controller in the example
> > ---
> >  .../bindings/display/bridge/fsl,ldb.yaml      | 92 +++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
>
> A little quick on the applying...

Darnit, you're right.

Marek: Can you supply a new patch with all of the relevant changes?

>
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> > new file mode 100644
> > index 000000000000..77f174eee424
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/display/bridge/fsl,ldb.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/display/bridge/fsl,ldb.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Freescale i.MX8MP DPI to LVDS bridge chip
> > +
> > +maintainers:
> > +  - Marek Vasut <marex@denx.de>
> > +
> > +description: |
> > +  The i.MX8MP mediamix contains two registers which are responsible
> > +  for configuring the on-SoC DPI-to-LVDS serializer. This describes
> > +  those registers as bridge within the DT.
>
> This is a subblock of the mediamix? Please add 'reg' for the 2 registers
> even if you use a regmap.
>
> I didn't find a binding for mediamix. You really need the containing
> block binding before a child node.
>
> Rob
