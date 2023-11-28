Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3913D7FBE92
	for <lists+dri-devel@lfdr.de>; Tue, 28 Nov 2023 16:52:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F2610E57E;
	Tue, 28 Nov 2023 15:52:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EB9410E57F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 15:52:24 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 46e09a7af769-6ce2fc858feso3137240a34.3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Nov 2023 07:52:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701186744; x=1701791544;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NpwcFU+v81rNX9yOoWEAEytDSoMoPOtVuaO4Q23AamM=;
 b=RNnMGCVWVSdv2Cn9bKpz3G7bCBFwejqawaGDZuQsGsnQvhHzsCxVE9zqOvSLU15SVF
 Jk/euXGFpK/JLJpDmMANX9SxNHq6thE3by/eFK5rMmGarPTzGfUg5b81SPVi3pCCaW7A
 dMcQNZer1kUcXxuqCeD094CfTD1W6hza0euKecHhVtGmY8/NSUi/6UOneJnB/erL3K3C
 Ct09XeTc4zXvjsGjlCJwg1njB00EC+eVsq8i1VqpwcG5z63Ex+4TtNsmcbkNTWvGx+cF
 D7H+X1K0heqYc/EGE+49DM+JQeInr5v5vesWvHSZhJy5Cs7HC9Qu5W0+ln/Xzhe9Cgbc
 uw/A==
X-Gm-Message-State: AOJu0Yw72ywXCjx9WroxBeVFY1/j6oKQ7d6Wmy1QrHCxPujp96TpO6Xf
 6OGnmB84euPpZzw4Zmy7ag==
X-Google-Smtp-Source: AGHT+IGOObQFuIpAGX2qh0tH048w+P8whX0JpMfwqHCw3+gilpnx0P4tozSWhUirRDG3Lyt6B3Q1jA==
X-Received: by 2002:a05:6871:453:b0:1f4:dd99:b07 with SMTP id
 e19-20020a056871045300b001f4dd990b07mr17030773oag.49.1701186744081; 
 Tue, 28 Nov 2023 07:52:24 -0800 (PST)
Received: from herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 js4-20020a056870bac400b001fa3757b80esm1517332oab.5.2023.11.28.07.52.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Nov 2023 07:52:23 -0800 (PST)
Received: (nullmailer pid 3332019 invoked by uid 1000);
 Tue, 28 Nov 2023 15:52:22 -0000
Date: Tue, 28 Nov 2023 09:52:22 -0600
From: Rob Herring <robh@kernel.org>
To: Shengyang Chen <shengyang.chen@starfivetech.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: display: bridge: cdns: Add
 properties to support StarFive JH7110 SoC
Message-ID: <20231128155222.GA3319844-robh@kernel.org>
References: <20231127113436.57361-1-shengyang.chen@starfivetech.com>
 <20231127113436.57361-2-shengyang.chen@starfivetech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231127113436.57361-2-shengyang.chen@starfivetech.com>
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
Cc: andrzej.hajda@intel.com, tomi.valkeinen@ideasonboard.com,
 dri-devel@lists.freedesktop.org, Laurent.pinchart@ideasonboard.com,
 krzysztof.kozlowski+dt@linaro.org, r-ravikumar@ti.com, rfoss@kernel.org,
 jernej.skrabec@gmail.com, u.kleine-koenig@pengutronix.de,
 devicetree@vger.kernel.org, conor+dt@kernel.org, jonas@kwiboo.se,
 mripard@kernel.org, neil.armstrong@linaro.org, keith.zhao@starfivetech.com,
 bbrezillon@kernel.org, rdunlap@infradead.org, linux-kernel@vger.kernel.org,
 jack.zhu@starfivetech.com, tzimmermann@suse.de,
 changhuang.liang@starfivetech.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Nov 27, 2023 at 07:34:35PM +0800, Shengyang Chen wrote:
> From: Keith Zhao <keith.zhao@starfivetech.com>
> 
> Add properties in CDNS DSI yaml file to match with
> CDNS DSI module in StarFive JH7110 SoC.
> 
> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
> ---
>  .../bindings/display/bridge/cdns,dsi.yaml     | 38 ++++++++++++++++++-
>  1 file changed, 36 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> index 23060324d16e..3f02ee383aad 100644
> --- a/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/cdns,dsi.yaml
> @@ -17,6 +17,7 @@ properties:
>      enum:
>        - cdns,dsi
>        - ti,j721e-dsi
> +      - starfive,cdns-dsi
>  
>    reg:
>      minItems: 1
> @@ -27,14 +28,20 @@ properties:
>            Register block for wrapper settings registers in case of TI J7 SoCs.
>  
>    clocks:
> +    minItems: 2
>      items:
>        - description: PSM clock, used by the IP
>        - description: sys clock, used by the IP
> +      - description: apb clock, used by the IP
> +      - description: txesc clock, used by the IP
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: dsi_p_clk
>        - const: dsi_sys_clk
> +      - const: apb
> +      - const: txesc
>  
>    phys:
>      maxItems: 1
> @@ -46,10 +53,21 @@ properties:
>      maxItems: 1
>  
>    resets:
> -    maxItems: 1
> +    minItems: 1
> +    items:
> +      - description: dsi sys reset line
> +      - description: dsi dpi reset line
> +      - description: dsi apb reset line
> +      - description: dsi txesc reset line
> +      - description: dsi txbytehs reset line
>  
>    reset-names:
> -    const: dsi_p_rst
> +    items:
> +      - const: dsi_p_rst
> +      - const: dsi_dpi
> +      - const: dsi_apb
> +      - const: dsi_txesc
> +      - const: dsi_txbytehs

Let's not continue the redundant 'dsi_' prefix. We're stuck with it for 
the first one, but not the new ones.

Rob
