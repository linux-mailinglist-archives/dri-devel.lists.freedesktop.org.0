Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3176E3879C4
	for <lists+dri-devel@lfdr.de>; Tue, 18 May 2021 15:21:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 387026EB6F;
	Tue, 18 May 2021 13:21:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C995B6EB6F
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 13:21:23 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id w127so5902943oig.12
 for <dri-devel@lists.freedesktop.org>; Tue, 18 May 2021 06:21:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=u+wN1H4CiOq/deGj0uJD8MCy7BhsRO561PN/y6kBixo=;
 b=BnPR+HukcrSuBYN5lKRrlUluLa9qo9OJNRDRr0ISYE+NRVVpqYcM1uR+RyJuFAA1SZ
 aDWaeKrNh79P1gYjR9ejTuebmTKM56Jc8+NRTp1upLZSaL9i53W8U52YaCB7G8/poLo8
 ge2D+DXwBXXq6mcCIbhVG7Ru6c+TVch+7sX9d28keuyG6185+3+05UmhERwl2AGztX56
 GmZgdOGHRiBRmOdCwIiR2JFT2Q+U8BMSsYLH/tfd9LRJk7qaxom+GMphO7bKmzMMOfab
 VP0tU+x/SDL1H9dACXpEq2I1W0qfNKC5smzDLdxbgIV9zNdHy+og9bYh4w9zzkRogfIW
 76fw==
X-Gm-Message-State: AOAM532vBk5v0BOH3jHwMrhsFPpaGAWS/oUUKAJr5D0HBVCDUIgn6NFG
 EHwcIEVXJwznBaYe/q5S4Q==
X-Google-Smtp-Source: ABdhPJzfBHQ7VoQgiEFOmE1+YMwi0t+QqNadLu2n4/RcHyI1SltKiBCKlWZ2rzE8A8SXpn01ZUuu2w==
X-Received: by 2002:a05:6808:8cd:: with SMTP id
 k13mr3997317oij.156.1621344081680; 
 Tue, 18 May 2021 06:21:21 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id d185sm3413682oib.25.2021.05.18.06.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 May 2021 06:21:21 -0700 (PDT)
Received: (nullmailer pid 526193 invoked by uid 1000);
 Tue, 18 May 2021 13:21:19 -0000
Date: Tue, 18 May 2021 08:21:19 -0500
From: Rob Herring <robh@kernel.org>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH V4 1/2] dt-bindings: display: bridge: lvds-codec:
 Document pixel data sampling edge select
Message-ID: <20210518132119.GA492897@robh.at.kernel.org>
References: <20210515204317.366967-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210515204317.366967-1-marex@denx.de>
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
Cc: devicetree@vger.kernel.org, Benjamin Gaignard <benjamin.gaignard@st.com>,
 Antonio Borneo <antonio.borneo@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Philippe Cornu <philippe.cornu@st.com>, dri-devel@lists.freedesktop.org,
 Yannick Fertre <yannick.fertre@st.com>, Andrzej Hajda <a.hajda@samsung.com>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Biju Das <biju.das.jz@bp.renesas.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org,
 ch@denx.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 15, 2021 at 10:43:15PM +0200, Marek Vasut wrote:
> The OnSemi FIN3385 Parallel-to-LVDS encoder has a dedicated input line to
> select input pixel data sampling edge. Add DT property "pclk-sample", not
> the same as the one used by display timings but rather the same as used by
> media, to define the pixel data sampling edge.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexandre Torgue <alexandre.torgue@st.com>
> Cc: Andrzej Hajda <a.hajda@samsung.com>
> Cc: Antonio Borneo <antonio.borneo@st.com>
> Cc: Benjamin Gaignard <benjamin.gaignard@st.com>
> Cc: Biju Das <biju.das.jz@bp.renesas.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Maxime Coquelin <mcoquelin.stm32@gmail.com>
> Cc: Philippe Cornu <philippe.cornu@st.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> Cc: Yannick Fertre <yannick.fertre@st.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-stm32@st-md-mailman.stormreply.com
> To: dri-devel@lists.freedesktop.org
> ---
> V4: New patch split from combined V3
> ---
>  .../bindings/display/bridge/lvds-codec.yaml    | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> index 304a1367faaa..f4dd16bd69d2 100644
> --- a/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/lvds-codec.yaml
> @@ -64,6 +64,14 @@ properties:
>        - port@0
>        - port@1
>  
> +  pclk-sample:
> +    description:
> +      Data sampling on rising or falling edge.
> +    enum:
> +      - 0  # Falling edge
> +      - 1  # Rising edge
> +    default: 0

This is already defined in video-interfaces.yaml, why are you redefining 
it here?

It's also defined to be an endpoint property, so move it there and 
reference video-interfaces.yaml.

> +
>    powerdown-gpios:
>      description:
>        The GPIO used to control the power down line of this device.
> @@ -71,6 +79,16 @@ properties:
>  
>    power-supply: true
>  
> +if:
> +  not:
> +    properties:
> +      compatible:
> +        contains:
> +          const: lvds-encoder
> +then:
> +  properties:
> +    pclk-sample: false

This constraint would be difficult to express with the property in an 
endpoint. I'd just drop it.

Rob
