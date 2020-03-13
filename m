Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8179318520B
	for <lists+dri-devel@lfdr.de>; Sat, 14 Mar 2020 00:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A17246EC79;
	Fri, 13 Mar 2020 23:05:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18A9A6EC79
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 23:05:27 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 4408C20029;
 Sat, 14 Mar 2020 00:05:23 +0100 (CET)
Date: Sat, 14 Mar 2020 00:05:21 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2] dt-bindings: display: ti: Fix dtc unit-address
 warnings in examples
Message-ID: <20200313230521.GA8476@ravnborg.org>
References: <20200313180727.23044-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313180727.23044-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=sozttTNsAAAA:8
 a=VwQbUJbxAAAA:8 a=7gkXJVJtAAAA:8 a=k4r3PqWcPq6Qy1X7_v8A:9
 a=rbD8nFOAu45xlIuL:21 a=UehPyaCQOHXEbEJC:21 a=CjuIK1q_8ugA:10
 a=aeg5Gbbo78KNqacMgKqU:22 a=AjGcO6oz07-iQ99wixmX:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: devicetree@vger.kernel.org, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jyri Sarha <jsarha@ti.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 13, 2020 at 01:07:27PM -0500, Rob Herring wrote:
> Extra dtc warnings (roughly what W=1 enables) are now enabled by default
> when building the binding examples. These were fixed treewide in
> 5.6-rc5, but some new display bindings have been added with new
> warnings:
> 
> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.example.dts:21.27-49.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
> Documentation/devicetree/bindings/display/ti/ti,j721e-dss.example.dts:21.27-72.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
> Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dts:20.27-42.11: Warning (unit_address_format): /example-0/dss@02540000: unit name should not have leading 0s
> 
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
> v2:
>  - Drop panel fixes as there's another patch fixing the 3 panels plus
>    others.
Will revisit the panel/ fixes patch and apply tomorrow.

	Sam

> ---
>  Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 2 +-
>  Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml | 2 +-
>  Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml   | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> index cac61a998203..aa5543a64526 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml
> @@ -121,7 +121,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
>  
> -    dss: dss@04a00000 {
> +    dss: dss@4a00000 {
>              compatible = "ti,am65x-dss";
>              reg =   <0x0 0x04a00000 0x0 0x1000>, /* common */
>                      <0x0 0x04a02000 0x0 0x1000>, /* vidl1 */
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> index ade9b2f513f5..6d47cd7206c2 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml
> @@ -154,7 +154,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/irq.h>
>      #include <dt-bindings/soc/ti,sci_pm_domain.h>
>  
> -    dss: dss@04a00000 {
> +    dss: dss@4a00000 {
>              compatible = "ti,j721e-dss";
>              reg =   <0x00 0x04a00000 0x00 0x10000>, /* common_m */
>                      <0x00 0x04a10000 0x00 0x10000>, /* common_s0*/
> diff --git a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> index 385bd060ccf9..7cb37053e95b 100644
> --- a/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> +++ b/Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml
> @@ -81,7 +81,7 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
>  
> -    dss: dss@02540000 {
> +    dss: dss@2540000 {
>              compatible = "ti,k2g-dss";
>              reg =   <0x02540000 0x400>,
>                      <0x02550000 0x1000>,
> -- 
> 2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
