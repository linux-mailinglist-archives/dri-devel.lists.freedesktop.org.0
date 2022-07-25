Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 740A3580804
	for <lists+dri-devel@lfdr.de>; Tue, 26 Jul 2022 01:11:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E22510E376;
	Mon, 25 Jul 2022 23:11:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f49.google.com (mail-oo1-f49.google.com
 [209.85.161.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A194E10E2CE
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 23:11:21 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 r193-20020a4a37ca000000b0043578138958so2429836oor.4
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Jul 2022 16:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=VNdXVWht5zzjHjVhQhSusKUMhE8ELd1CfgAT3RGumig=;
 b=LYgFcAmuavFrFofsbS+uA7222R/VOonaq8YhT/wB+H2L3h3Wqg6aCq1P9xiddLx+OK
 kcOqmrOY8ASAeLAAwCSuFDgDdEVrdOTdQdHaNxukG0sRzaWux0xnBElWuhw/pdNjRY+E
 VB0ZCa+kmJHTQpsONI6gdysSYZVfL/2/idQ/IFoJssuaNq/sQ+kqT5HCwwd6w4kTVVW3
 8aAeStl8NqjubyiaAiUd1nQf09Zl0l/6KAjsKU/GOJ47rcerYO8wgmR4koFny9B7RPAz
 UEbcxMARUBLttgI85VdTDtXWgBMfS0K2fNhitH0VXEAbwgffu0AiePk47OsmfJb6KJo1
 C9wQ==
X-Gm-Message-State: AJIora9W7gUAvpTDebe29HAJxPSx+NNQEVnW1TWPJDLlwq3dwEqiwX39
 8JAYSnSwmy8+ZELXp1mtLg==
X-Google-Smtp-Source: AGRyM1t/aV8rKVmSzFYaQ2SEStr6U2W+xOIy+oVghT1U75c1dg0LahG8eURVPT/HXUpAh5ssvQ3zgQ==
X-Received: by 2002:a4a:6550:0:b0:435:f3e8:8d3e with SMTP id
 z16-20020a4a6550000000b00435f3e88d3emr926118oog.13.1658790680687; 
 Mon, 25 Jul 2022 16:11:20 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 f97-20020a9d2c6a000000b0061c87262540sm5419037otb.65.2022.07.25.16.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 16:11:20 -0700 (PDT)
Received: (nullmailer pid 2927686 invoked by uid 1000);
 Mon, 25 Jul 2022 23:11:18 -0000
Date: Mon, 25 Jul 2022 17:11:18 -0600
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: display: Document Renesas RZ/G2L DU
 bindings
Message-ID: <20220725231118.GA2927653-robh@kernel.org>
References: <20220722191353.544516-1-biju.das.jz@bp.renesas.com>
 <20220722191353.544516-2-biju.das.jz@bp.renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220722191353.544516-2-biju.das.jz@bp.renesas.com>
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
Cc: devicetree@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>, David Airlie <airlied@linux.ie>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 dri-devel@lists.freedesktop.org, Biju Das <biju.das@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 22 Jul 2022 20:13:52 +0100, Biju Das wrote:
> The RZ/G2L LCD controller is composed of Frame Compression Processor
> (FCPVD), Video Signal Processor (VSPD), and Display Unit (DU).
> 
> The DU module supports the following hardware features
> − Display Parallel Interface (DPI) and MIPI LINK Video Interface
> − Display timing master
> − Generates video timings
> − Selecting the polarity of output DCLK, HSYNC, VSYNC, and DE
> − Supports Progressive
> − Input data format (from VSPD): RGB888, RGB666
> − Output data format: same as Input data format
> − Supporting Full HD (1920 pixels x 1080 lines) for MIPI-DSI Output
> − Supporting WXGA (1280 pixels x 800 lines) for Parallel Output
> 
> This patch document DU module found on RZ/G2L LCDC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> v3->v4:
>  * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
>  * started using same compatible for RZ/G2{L,LC}
> v3: New patch
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
