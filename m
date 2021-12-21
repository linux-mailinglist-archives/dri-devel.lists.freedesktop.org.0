Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 962E347C720
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 19:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 62A57112C89;
	Tue, 21 Dec 2021 18:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9AC111A29B
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Dec 2021 18:58:32 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 0dbe1d61-6290-11ec-ac19-0050568cd888;
 Tue, 21 Dec 2021 18:58:58 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id DD480194B59;
 Tue, 21 Dec 2021 19:58:31 +0100 (CET)
Date: Tue, 21 Dec 2021 19:58:26 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: display: novatek,nt36672a: Fix unevaluated
 properties warning
Message-ID: <YcIj0hxGC4Lb3SEp@ravnborg.org>
References: <20211221125125.1194554-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211221125125.1194554-1-robh@kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thierry Reding <thierry.reding@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Dec 21, 2021 at 08:51:26AM -0400, Rob Herring wrote:
> With 'unevaluatedProperties' support enabled, the novatek,nt36672a
> binding has a new warning:
> 
> Documentation/devicetree/bindings/display/panel/novatek,nt36672a.example.dt.yaml: panel@0: Unevaluated properties are not allowed ('vddi0-supply', '#address-cells', '#size-cells' were unexpected)
> 
> Based on dts files, 'vddi0-supply' does appear to be the correct name.
> Drop '#address-cells' and '#size-cells' which aren't needed.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  .../devicetree/bindings/display/panel/novatek,nt36672a.yaml   | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> index ef4c0a24512d..563766d283f6 100644
> --- a/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> +++ b/Documentation/devicetree/bindings/display/panel/novatek,nt36672a.yaml
> @@ -34,7 +34,7 @@ properties:
>      description: phandle of gpio for reset line - This should be 8mA, gpio
>        can be configured using mux, pinctrl, pinctrl-names (active high)
>  
> -  vddio-supply:
> +  vddi0-supply:
>      description: phandle of the regulator that provides the supply voltage
>        Power IC supply
>  
> @@ -75,8 +75,6 @@ examples:
>  
>              reset-gpios = <&tlmm 6 GPIO_ACTIVE_HIGH>;
>  
> -            #address-cells = <1>;
> -            #size-cells = <0>;
>              port {
>                  tianma_nt36672a_in_0: endpoint {
>                      remote-endpoint = <&dsi0_out>;
> -- 
> 2.32.0
