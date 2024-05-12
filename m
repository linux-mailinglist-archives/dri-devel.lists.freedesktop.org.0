Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE0A48C3825
	for <lists+dri-devel@lfdr.de>; Sun, 12 May 2024 21:25:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116B910E00F;
	Sun, 12 May 2024 19:25:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="toxcDMux";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9086D10E00F
 for <dri-devel@lists.freedesktop.org>; Sun, 12 May 2024 19:25:30 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi
 [81.175.209.231])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 130FE524;
 Sun, 12 May 2024 21:25:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1715541922;
 bh=mCXLCoD7lkfHW8+SFvwfQD7CB0s4KCH/rd7zLtP1+kM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=toxcDMuxJDnt3n0vzJQaP5kh41rh6fmRG2M54q8+KC9L3d6MYNj4Dhfv3qA1fPWdF
 y9ljNB9PQKF1DB3GpvSH3PxlJyxCzgKv77PLcVxz54+Qlx06memJYLJD0ToO8Rphhx
 yAYbHKnJnAXrawKfI0rMSsBJjLcUt+Juzudp+iGI=
Date: Sun, 12 May 2024 22:25:18 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Aradhya Bhatia <a-bhatia1@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Jyri Sarha <jyri.sarha@iki.fi>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
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
Subject: Re: [PATCH 1/4] dt-bindings: display: ti,am65x-dss: Minor Cleanup
Message-ID: <20240512192518.GE17158@pendragon.ideasonboard.com>
References: <20240511193055.1686149-1-a-bhatia1@ti.com>
 <20240511193055.1686149-2-a-bhatia1@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240511193055.1686149-2-a-bhatia1@ti.com>
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

Hi Aradhya,

Thank you for the patch.

On Sun, May 12, 2024 at 01:00:52AM +0530, Aradhya Bhatia wrote:
> Reduce tab size from 8 spaces to 4 spaces to make the bindings
> consistent, and easy to expand.
> 
> Signed-off-by: Aradhya Bhatia <a-bhatia1@ti.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  .../bindings/display/ti/ti,am65x-dss.yaml     | 54 +++++++++----------
>  1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index 55e3e490d0e6..399d68986326 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -142,32 +142,32 @@ examples:
>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
>  
>      dss: dss@4a00000 {
> -            compatible = "ti,am65x-dss";
> -            reg =   <0x04a00000 0x1000>, /* common */
> -                    <0x04a02000 0x1000>, /* vidl1 */
> -                    <0x04a06000 0x1000>, /* vid */
> -                    <0x04a07000 0x1000>, /* ovr1 */
> -                    <0x04a08000 0x1000>, /* ovr2 */
> -                    <0x04a0a000 0x1000>, /* vp1 */
> -                    <0x04a0b000 0x1000>, /* vp2 */
> -                    <0x04a01000 0x1000>; /* common1 */
> -            reg-names = "common", "vidl1", "vid",
> -                    "ovr1", "ovr2", "vp1", "vp2", "common1";
> -            ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
> -            power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
> -            clocks =        <&k3_clks 67 1>,
> -                            <&k3_clks 216 1>,
> -                            <&k3_clks 67 2>;
> -            clock-names = "fck", "vp1", "vp2";
> -            interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
> -            ports {
> -                    #address-cells = <1>;
> -                    #size-cells = <0>;
> -                    port@0 {
> -                            reg = <0>;
> -                            oldi_out0: endpoint {
> -                                    remote-endpoint = <&lcd_in0>;
> -                            };
> -                    };
> +        compatible = "ti,am65x-dss";
> +        reg = <0x04a00000 0x1000>, /* common */
> +              <0x04a02000 0x1000>, /* vidl1 */
> +              <0x04a06000 0x1000>, /* vid */
> +              <0x04a07000 0x1000>, /* ovr1 */
> +              <0x04a08000 0x1000>, /* ovr2 */
> +              <0x04a0a000 0x1000>, /* vp1 */
> +              <0x04a0b000 0x1000>, /* vp2 */
> +              <0x04a01000 0x1000>; /* common1 */
> +        reg-names = "common", "vidl1", "vid",
> +                "ovr1", "ovr2", "vp1", "vp2", "common1";
> +        ti,am65x-oldi-io-ctrl = <&dss_oldi_io_ctrl>;
> +        power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
> +        clocks =        <&k3_clks 67 1>,
> +                        <&k3_clks 216 1>,
> +                        <&k3_clks 67 2>;
> +        clock-names = "fck", "vp1", "vp2";
> +        interrupts = <GIC_SPI 166 IRQ_TYPE_EDGE_RISING>;
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            port@0 {
> +                reg = <0>;
> +                oldi_out0: endpoint {
> +                    remote-endpoint = <&lcd_in0>;
> +                };
>              };
> +        };
>      };

-- 
Regards,

Laurent Pinchart
