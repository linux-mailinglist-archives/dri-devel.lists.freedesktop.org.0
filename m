Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A87B65AD623
	for <lists+dri-devel@lfdr.de>; Mon,  5 Sep 2022 17:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 072AB10E428;
	Mon,  5 Sep 2022 15:21:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3650710EA39
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Sep 2022 15:21:10 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id cu2so17857382ejb.0
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Sep 2022 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=KBtkxhGJK7CyNF6xfmTW48XibhBbnytd5RaveyvFGdo=;
 b=Q2iqgZjMVxCOqPOP0fpSKpQdx4CyNMxhh3pX6HD7ITBOxWspt2RFETKOaz5h3YFPDm
 xXz8vJYybdm+73YxSEWTmtqi/94ewzka7WNM3OnkwLFR95yrwcNFa/LF4pW3LQmtui2C
 rzbp4ddibLfxH3s0i7pz3yXbV1p3CGzgqUKkHDMmFKcULss2VCYKDWl3NMkV8FPl3r0n
 S08ShuRCLwkSXf+O04kPRc5r0zE/4D3+LxOScJ9Pn8idshSIKRUK5wn/yzCtF6wOK3XP
 f/UA/k07Ro2CtHQrmIKdEjMDTFM5SNstqDYZtgz7MiHlpcmOCuRbBIE0eY+XZmc8rA1Y
 Q0cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=KBtkxhGJK7CyNF6xfmTW48XibhBbnytd5RaveyvFGdo=;
 b=tohn75tFaxUO0MTQBm/akuF15ohYKbYG/0q0oUxBMnt+MUvuM/AIUrDgf77jQyR2v3
 Nk5CAtzPE62zp8OYe8dbdbM3y+ltrVQm4ANnSoDf0MrWSZsUomevkRIMuErYGP3TY/7L
 ww7F4JC7e6h8rjwfyhf4vir4CtxlZPeBxFVWzjFzHnCyFSMySt//JUml22FaxU7/UFp5
 zgpRwALc7YLtP0C/k3q7cBT5flm1Xey57PIURNZrSpnc91PiPR4MedLxzdE4ovINYAjV
 a4JrSSNS3kRP/tMcS3MPwik9hzcOUiAh9sglyvk7kxtYz+euIheopRcX6RRghGYcuWOo
 87xg==
X-Gm-Message-State: ACgBeo2K25Tf6+c9X2xeHv5hG9S2CdP+RZa8d1NcN09UCh8vrpHgDSfg
 C4CjeBz009MJ0HGpdBBYpfIy2SHTircjsfRhtg09iQ==
X-Google-Smtp-Source: AA6agR5Rrox9qKkk144516ElYfGthOF8W3ZWFx6D0B+Bj9kfBYUY99eTp8W4Fw5cgraESd2pxD14qp0JQAWsMQSykBw=
X-Received: by 2002:a17:906:d550:b0:733:8e1a:f7 with SMTP id
 cr16-20020a170906d55000b007338e1a00f7mr36873318ejc.580.1662391268656; Mon, 05
 Sep 2022 08:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220902153906.31000-1-macroalpha82@gmail.com>
 <20220902153906.31000-2-macroalpha82@gmail.com>
 <YxKdE7ZQ97NsuqZk@pendragon.ideasonboard.com>
In-Reply-To: <YxKdE7ZQ97NsuqZk@pendragon.ideasonboard.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Mon, 5 Sep 2022 17:20:57 +0200
Message-ID: <CAG3jFyu5_ZOn48=y=5u=NyALefczQUxiwVJnJW=irvE5sK4tKw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] dt-bindings: Add byteswap order to chrontel ch7033
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
Cc: krzysztof.kozlowski+dt@linaro.org, jonas@kwiboo.se, airlied@linux.ie,
 narmstrong@baylibre.com, Chris Morgan <macromorgan@hotmail.com>,
 dri-devel@lists.freedesktop.org, Chris Morgan <macroalpha82@gmail.com>,
 lkundrak@v3.sk, andrzej.hajda@intel.com, robh+dt@kernel.org,
 jernej.skrabec@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thanks Laurent,

On Sat, 3 Sept 2022 at 02:17, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>
> Hi Chris,
>
> Thank you for the patch.
>
> On Fri, Sep 02, 2022 at 10:39:05AM -0500, Chris Morgan wrote:
> > From: Chris Morgan <macromorgan@hotmail.com>
> >
> > Update dt-binding documentation to add support for setting byteswap of
> > chrontel ch7033.
> >
> > New property name of chrontel,byteswap added to set the byteswap order.
> > This property is optional.
> >
> > Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
> > Reviewed-by: Robert Foss <robert.foss@linaro.org>
> > ---
> >  .../bindings/display/bridge/chrontel,ch7033.yaml    | 13 +++++++++++++
> >  1 file changed, 13 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> > index bb6289c7d375..984b90893583 100644
> > --- a/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> > +++ b/Documentation/devicetree/bindings/display/bridge/chrontel,ch7033.yaml
> > @@ -14,6 +14,19 @@ properties:
> >    compatible:
> >      const: chrontel,ch7033
> >
> > +  chrontel,byteswap:
> > +    $ref: /schemas/types.yaml#/definitions/uint8
> > +    enum:
> > +      - 0  # BYTE_SWAP_RGB
> > +      - 1  # BYTE_SWAP_RBG
> > +      - 2  # BYTE_SWAP_GRB
> > +      - 3  # BYTE_SWAP_GBR
> > +      - 4  # BYTE_SWAP_BRG
> > +      - 5  # BYTE_SWAP_BGR
> > +    description: |
> > +      Set the byteswap value of the bridge. This is optional and if not
> > +      set value of BYTE_SWAP_BGR is used.
>
> I don't think this belongs to the device tree. The source of data
> connected to the CH7033 input could use different formats. This
> shouldn't be hardcoded, but queried at runtime, using the input and
> output media bus formats infrastructure that the DRM bridge framework
> includes.

Chris, will you have a look at submitting a fix for this during the coming days?

If not, we can revert this series and apply a fixed version later.

>
> > +
> >    reg:
> >      maxItems: 1
> >      description: I2C address of the device
>
> --
> Regards,
>
> Laurent Pinchart
