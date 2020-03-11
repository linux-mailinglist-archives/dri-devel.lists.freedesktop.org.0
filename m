Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A62C8182403
	for <lists+dri-devel@lfdr.de>; Wed, 11 Mar 2020 22:40:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB4446E4D4;
	Wed, 11 Mar 2020 21:40:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A02126E4D4
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Mar 2020 21:40:33 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id 575BA20031;
 Wed, 11 Mar 2020 22:40:30 +0100 (CET)
Date: Wed, 11 Mar 2020 22:40:28 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: Fix dtc unit-address warnings in
 examples
Message-ID: <20200311214028.GA21800@ravnborg.org>
References: <20200311210001.5102-1-robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200311210001.5102-1-robh@kernel.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=pGLkceISAAAA:8
 a=7gkXJVJtAAAA:8 a=sozttTNsAAAA:8 a=VwQbUJbxAAAA:8 a=Hs3obBPvDEpcAaRkq7IA:9
 a=KgW6Z8YwRCCCCE-m:21 a=khJvjRUq4pdLXzPm:21 a=CjuIK1q_8ugA:10
 a=E9Po1WZjFZOl8hwRPBS3:22 a=aeg5Gbbo78KNqacMgKqU:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Mar 11, 2020 at 04:00:01PM -0500, Rob Herring wrote:
> Extra dtc warnings (roughly what W=1 enables) are now enabled by default
> when building the binding examples. These were fixed treewide in
> 5.6-rc5, but some new display bindings have been added with new
> warnings:
> 
> Documentation/devicetree/bindings/display/panel/raydium,rm68200.example.dts:17.7-27.11: Warning (unit_address_vs_reg): /example-0/dsi@0: node has a unit name, but no reg property
> Documentation/devicetree/bindings/display/panel/panel-simple-dsi.example.dts:17.19-31.11: Warning (unit_address_vs_reg): /example-0/mdss_dsi@fd922800: node has a unit name, but no reg property
> Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.example.dts:17.7-26.11: Warning (unit_address_vs_reg): /example-0/dsi@0: node has a unit name, but no reg property
> Documentation/devicetree/bindings/display/ti/ti,am65x-dss.example.dts:21.27-49.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
> Documentation/devicetree/bindings/display/ti/ti,j721e-dss.example.dts:21.27-72.11: Warning (unit_address_format): /example-0/dss@04a00000: unit name should not have leading 0s
> Documentation/devicetree/bindings/display/ti/ti,k2g-dss.example.dts:20.27-42.11: Warning (unit_address_format): /example-0/dss@02540000: unit name should not have leading 0s
> 
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Jyri Sarha <jsarha@ti.com>
> Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
> Signed-off-by: Rob Herring <robh@kernel.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

And I can drop my patch that only fixed the panel/ parts - good.

	Sam

> ---
>  .../devicetree/bindings/display/panel/orisetech,otm8009a.yaml  | 3 +--
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml    | 2 +-
>  .../devicetree/bindings/display/panel/raydium,rm68200.yaml     | 2 +-
>  Documentation/devicetree/bindings/display/ti/ti,am65x-dss.yaml | 2 +-
>  Documentation/devicetree/bindings/display/ti/ti,j721e-dss.yaml | 2 +-
>  Documentation/devicetree/bindings/display/ti/ti,k2g-dss.yaml   | 2 +-
>  6 files changed, 6 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> index 6e6ac995c27b..2e7c65b093d7 100644
> --- a/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/orisetech,otm8009a.yaml
> @@ -39,7 +39,7 @@ required:
>  
>  examples:
>    - |
> -    dsi@0 {
> +    dsi {
>        #address-cells = <1>;
>        #size-cells = <0>;
>        panel@0 {
> @@ -50,4 +50,3 @@ examples:
>        };
>      };
>  ...
> -
> diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> index 8b60368a2425..b2e8742fd6af 100644
> --- a/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/panel-simple-dsi.yaml
> @@ -50,7 +50,7 @@ required:
>  
>  examples:
>    - |
> -    mdss_dsi@fd922800 {
> +    dsi {
>        #address-cells = <1>;
>        #size-cells = <0>;
>        panel@0 {
> diff --git a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> index 09149f140d5f..a35ba16fc000 100644
> --- a/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/raydium,rm68200.yaml
> @@ -42,7 +42,7 @@ required:
>  
>  examples:
>    - |
> -    dsi@0 {
> +    dsi {
>        #address-cells = <1>;
>        #size-cells = <0>;
>        panel@0 {
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
