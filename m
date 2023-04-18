Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37A286E6DFA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Apr 2023 23:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A64CA10E1CE;
	Tue, 18 Apr 2023 21:21:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com
 [209.85.167.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EE7610E1CE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 21:21:01 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id
 5614622812f47-38e04d1b2b4so552050b6e.3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Apr 2023 14:21:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681852860; x=1684444860;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WgwKd7P9qrzMTpu2fy50tBPL0/0q3LqzdG1B04wyE0o=;
 b=DGxN2rIN6OZExxGYIPdLhzv4A3jnmcRjaWGJ6wOrJGKhM6r2fS3ra93m+aix97aQrA
 g0moyH0XBMbFEwqJauBk/qh8WIaGhp1q4GsKkYYFyDtoILCxDGmmKx+qp47nud3nBd8s
 Q4GHB9C0NC+w9CSHRQQA/naXHIXJ2/GMody74hPWKssuZKzOWUFcT8T88KXuJmw4H4IS
 MFn6PiK8CGPA4mDe2w3POUbwY/kjrxUnVuKxtJ8uzAFltkIPhljycLF3iFuLgh/9JVX4
 Gq6+S/Gy3Zg4yoZT6rCelzK3w/4vrKvMcpWDjhvZYdlJ7u4ctPfYGR9WxBavdizZf6P5
 Im5Q==
X-Gm-Message-State: AAQBX9f0IXXGpgELldhYvMStr0ruR9o3Eq89TJq6TpuuT66AMnKcgm97
 1HY7B6kvzoqGeg5ofBAzCQ==
X-Google-Smtp-Source: AKy350a7SEgsQ2r6iAUhm0CDPasiv1xJKKONwc7jtSSrwcfYr146T+Oa94O7gZPoSAEMLOgZsuQczQ==
X-Received: by 2002:a05:6808:302c:b0:38c:570f:8c83 with SMTP id
 ay44-20020a056808302c00b0038c570f8c83mr1710779oib.15.1681852859983; 
 Tue, 18 Apr 2023 14:20:59 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k206-20020acabad7000000b0038934c5b400sm6279161oif.25.2023.04.18.14.20.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Apr 2023 14:20:59 -0700 (PDT)
Received: (nullmailer pid 2356240 invoked by uid 1000);
 Tue, 18 Apr 2023 21:20:58 -0000
Date: Tue, 18 Apr 2023 16:20:58 -0500
From: Rob Herring <robh@kernel.org>
To: Johannes Zink <j.zink@pengutronix.de>
Subject: Re: [PATCH 1/2] dt-bindings: display: simple: support non-default
 data-mapping
Message-ID: <20230418212058.GA2351633-robh@kernel.org>
References: <20230414161116.3673911-1-j.zink@pengutronix.de>
 <20230414161116.3673911-2-j.zink@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230414161116.3673911-2-j.zink@pengutronix.de>
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
Cc: devicetree@vger.kernel.org, sam@ravnborg.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, thierry.reding@gmail.com,
 krzysztof.kozlowski+dt@linaro.org, kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 14, 2023 at 06:11:15PM +0200, Johannes Zink wrote:
> Some Displays support more than just a single default lvds data mapping,
> which can be used to run displays on only 3 LVDS lanes in the jeida-18
> data-mapping mode.
> 
> Add an optional data-mapping property, analogously to panel-lvds, to
> allow overriding the default data mapping.
> 
> Signed-off-by: Johannes Zink <j.zink@pengutronix.de>
> ---
>  .../bindings/display/panel/panel-simple.yaml  | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> index 18241f4051d2..6e219f67dd67 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
> @@ -349,6 +349,57 @@ properties:
>    power-supply: true
>    no-hpd: true
>    hpd-gpios: true
> +  data-mapping:
> +    enum:
> +      - jeida-18
> +      - jeida-24
> +      - vesa-24
> +    description: |
> +      The color signals mapping order.
> +
> +      LVDS data mappings are defined as follows.
> +
> +      - "jeida-18" - 18-bit data mapping compatible with the [JEIDA], [LDI] and
> +        [VESA] specifications. Data are transferred as follows on 3 LVDS lanes.
> +
> +      Slot          0       1       2       3       4       5       6
> +                ________________                         _________________
> +      Clock                     \_______________________/
> +                  ______  ______  ______  ______  ______  ______  ______
> +      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
> +      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
> +      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
> +
> +      - "jeida-24" - 24-bit data mapping compatible with the [DSIM] and [LDI]
> +        specifications. Data are transferred as follows on 4 LVDS lanes.
> +
> +      Slot          0       1       2       3       4       5       6
> +                ________________                         _________________
> +      Clock                     \_______________________/
> +                  ______  ______  ______  ______  ______  ______  ______
> +      DATA0     ><__G2__><__R7__><__R6__><__R5__><__R4__><__R3__><__R2__><
> +      DATA1     ><__B3__><__B2__><__G7__><__G6__><__G5__><__G4__><__G3__><
> +      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B7__><__B6__><__B5__><__B4__><
> +      DATA3     ><_CTL3_><__B1__><__B0__><__G1__><__G0__><__R1__><__R0__><
> +
> +      - "vesa-24" - 24-bit data mapping compatible with the [VESA] specification.
> +        Data are transferred as follows on 4 LVDS lanes.
> +
> +      Slot          0       1       2       3       4       5       6
> +                ________________                         _________________
> +      Clock                     \_______________________/
> +                  ______  ______  ______  ______  ______  ______  ______
> +      DATA0     ><__G0__><__R5__><__R4__><__R3__><__R2__><__R1__><__R0__><
> +      DATA1     ><__B1__><__B0__><__G5__><__G4__><__G3__><__G2__><__G1__><
> +      DATA2     ><_CTL2_><_CTL1_><_CTL0_><__B5__><__B4__><__B3__><__B2__><
> +      DATA3     ><_CTL3_><__B7__><__B6__><__G7__><__G6__><__R7__><__R6__><
> +
> +      Control signals are mapped as follows.
> +
> +      CTL0: HSync
> +      CTL1: VSync
> +      CTL2: Data Enable
> +      CTL3: 0

Why do you duplicate what's in display/lvds.yaml?

This also just made 'data-mapping' valid on non-LVDS panels.

Rob
