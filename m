Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3F07B53F6
	for <lists+dri-devel@lfdr.de>; Mon,  2 Oct 2023 15:31:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFBE910E032;
	Mon,  2 Oct 2023 13:31:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org
 [IPv6:2604:1380:40e1:4800::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04110E032
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Oct 2023 13:31:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id E500CCE0FF0;
 Mon,  2 Oct 2023 13:31:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40690C433C7;
 Mon,  2 Oct 2023 13:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1696253463;
 bh=kKBI77zp4+YZMVjG9R3aO6yIO3fcESRe+LYfl/ViOAE=;
 h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
 b=KNXHjyCyehVxgxnfP/EJneEpx7BsYFX0ja0vLX5bH6vaOay+QK0lUozoK4taADcZf
 ujjUx3S9/OGtXkS2684jUY0Dksova7zzlpyJDMbcO9/NOV/2h4m7RPp/G7QNdJwiHe
 TkBEl2yBwHANTzFhpYe0eVhyQcgTHR1T5n9psuaqF61HwQ2Eybr9Rpc3LGv5DCUK2O
 E2M4mJKn0sn6vHw3GXkUTHwnjOLm5xSurYbcdyRWVJtvWHoWNtwhcwBGHERylzKnZ2
 Yu0+M3FyDqm7HxPSvLsQfyO0igmUWh88zqO9tP+Y5wbprc0EXjYeH1QfEPKhbeaPzv
 W8XoCyslm2/Gw==
Received: (nullmailer pid 1584324 invoked by uid 1000);
 Mon, 02 Oct 2023 13:31:01 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Biju Das <biju.das.jz@bp.renesas.com>
In-Reply-To: <20231002122740.220177-2-biju.das.jz@bp.renesas.com>
References: <20231002122740.220177-1-biju.das.jz@bp.renesas.com>
 <20231002122740.220177-2-biju.das.jz@bp.renesas.com>
Message-Id: <169625346119.1584308.6712024438150463330.robh@kernel.org>
Subject: Re: [PATCH v11 1/4] dt-bindings: display: Document Renesas RZ/G2L
 DU bindings
Date: Mon, 02 Oct 2023 08:31:01 -0500
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 02 Oct 2023 13:27:37 +0100, Biju Das wrote:
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
> This patch documents the DU module found on RZ/G2L LCDC.
> 
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> ---
> v10->v1:
>  * No change
> v9->v10:
>  * Added Rb tag from Laurent
>  * Updated the commit description.
>  * Updated description of the port by dropping the text "specified in
>    Documentation/devicetree/bindings/graph.txt."
>  * Dropped empty endpoint from example.
> v8->v9:
>  * No change
> v7->v8:
>  * No change
> v6->v7:
>  * No change
> v5->v6:
>  * No change.
> v4->v5:
>  * Added Rb tag from Rob.
> v3->v4:
>  * Changed compatible name from renesas,du-r9a07g044->renesas,r9a07g044-du
>  * started using same compatible for RZ/G2{L,LC}
> v3: New patch
> ---
>  .../bindings/display/renesas,rzg2l-du.yaml    | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/renesas,rzg2l-du.yaml:64:11: [error] string value is redundantly quoted with any quotes (quoted-strings)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231002122740.220177-2-biju.das.jz@bp.renesas.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

