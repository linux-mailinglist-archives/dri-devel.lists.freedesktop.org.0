Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD618C4792
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 21:35:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FB2B10E939;
	Mon, 13 May 2024 19:35:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EBioGh+4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D21510E512
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 19:35:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 3652760DBF;
 Mon, 13 May 2024 19:35:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0BEAC113CC;
 Mon, 13 May 2024 19:35:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1715628906;
 bh=KNTg+2wS+o1DKHL98I7FqXY+zNv3Twt4zrowVfZvpN8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EBioGh+4tTPxzt3D8JlYW0wLp/e4N7nSOtfQvKZpS1tWCbeyRNVLPKf2CTRnGiLkZ
 XnrYs7H+aavjBKzCMDhf9ujP19Xb9X2vyDqvLIA+IJfSkG42wPHUrbPa+aTArklx+t
 4JTqqpj9+ETx1la2tnaFqYVzQILAr13BPdfANys4zkTQJ7WFLD18UoEdI3WF52ZxAi
 xJUPt8hBZk03JNe8tb8GcVvKRV0lQMmi/pLt4Hf/5E3dsRg0CVu+BEZkRQMR6gHQuu
 695SrPiR9KAdmFLZhCsjrGFTDfk2jghgkl0xaApzWH0Dg81rckYoqs4Gl+dXFFPtV2
 dWy3ZAZdUaFgg==
Date: Mon, 13 May 2024 14:35:04 -0500
From: Rob Herring <robh@kernel.org>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Praneeth Bajjuri <praneeth@ti.com>, Udit Kumar <u-kumar1@ti.com>,
 Francesco Dolcini <francesco@dolcini.it>,
 Alexander Sverdlin <alexander.sverdlin@siemens.com>,
 Randolph Sapp <rs@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jayesh Choudhary <j-choudhary@ti.com>, Jai Luthra <j-luthra@ti.com>
Subject: Re: [PATCH 3/4] dt-bindings: display: ti,am65x-dss: Add OLDI
 properties for AM625 DSS
Message-ID: <20240513193504.GA3000298-robh@kernel.org>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
 <20240511193055.1686149-4-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240511193055.1686149-4-a-bhatia1@ti.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, May 12, 2024 at 01:00:54AM +0530, Aradhya Bhatia wrote:
> The DSS in AM625 SoC has 2 OLDI TXes. Refer the OLDI schema to add the
> properties.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>
> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 136 +++++++++++++++++-
>  1 file changed, 135 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 399d68986326..4aa2de59b32b 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -85,12 +85,30 @@ properties:
>  
>      properties:
>        port@0:
> -        $ref: /schemas/graph.yaml#/properties/port
> +        $ref: /schemas/graph.yaml#/$defs/port-base

You don't need this change. You aren't adding any extra properties.

>          description:
>            For AM65x DSS, the OLDI output port node from video port 1.
>            For AM625 DSS, the internal DPI output port node from video
>            port 1.
>            For AM62A7 DSS, the port is tied off inside the SoC.
> +        properties:
> +          endpoint@0:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description:
> +              For AM625 DSS, VP Connection to OLDI0.
> +              For AM65X DSS, OLDI output from the SoC.
> +
> +          endpoint@1:
> +            $ref: /schemas/graph.yaml#/properties/endpoint
> +            description:
> +              For AM625 DSS, VP Connection to OLDI1.
> +
> +        anyOf:
> +          - required:
> +              - endpoint
> +          - required:
> +              - endpoint@0
> +              - endpoint@1
>  
>        port@1:
>          $ref: /schemas/graph.yaml#/properties/port
> @@ -112,6 +130,22 @@ properties:
>        Input memory (from main memory to dispc) bandwidth limit in
>        bytes per second
>  
> +  oldi-txes:
> +    type: object
> +    properties:
> +      "#address-cells":
> +        const: 1
> +
> +      "#size-cells":
> +        const: 0
> +
> +    patternProperties:
> +      '^oldi_tx@[0-1]$':
> +        type: object
> +        $ref: ti,am625-oldi.yaml#
> +        unevaluatedProperties: false
> +        description: OLDI transmitters connected to the DSS VPs

Connected to is not part of the DSS. I don't think these nodes belong 
here as mentioned in the other patch.

Rob
