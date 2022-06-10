Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA1546619
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jun 2022 13:53:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C8CD10EC41;
	Fri, 10 Jun 2022 11:53:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 09C3110EC41
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 11:53:18 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9A76112FC
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 04:53:17 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 48A293F766
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jun 2022 04:53:17 -0700 (PDT)
Date: Fri, 10 Jun 2022 12:53:11 +0100
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH] dt-bindings: display: arm,malidp: remove bogus RQOS
 property
Message-ID: <YqMwp/9AKYeqt34D@e110455-lin.cambridge.arm.com>
References: <20220609162729.1441760-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220609162729.1441760-1-andre.przywara@arm.com>
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
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jun 09, 2022 at 05:27:29PM +0100, Andre Przywara wrote:
> As Liviu pointed out, the arm,malidp-arqos-high-level property
> mentioned in the original .txt binding was a mistake, and
> arm,malidp-arqos-value needs to take its place.
> 
> The binding commit ce6eb0253cba ("dt/bindings: display: Add optional
> property node define for Mali DP500") mentions the right name in the
> commit message, but has the wrong name in the diff.
> Commit d298e6a27a81 ("drm/arm/mali-dp: Add display QoS interface
> configuration for Mali DP500") uses the property in the driver, but uses
> the shorter name.
> 
> Remove the wrong property from the binding, and use the proper name in
> the example. The actual property was already documented properly.
> 
> Fixes: 2c8b082a3ab1 ("dt-bindings: display: convert Arm Mali-DP to DT schema")
> Link: https://lore.kernel.org/linux-arm-kernel/YnumGEilUblhBx8E@e110455-lin.cambridge.arm.com/
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> Reported-by: Liviu Dudau <liviu.dudau@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Thanks for cleaning this up!

Best regards,
Liviu

> ---
>  Documentation/devicetree/bindings/display/arm,malidp.yaml | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/display/arm,malidp.yaml b/Documentation/devicetree/bindings/display/arm,malidp.yaml
> index 795a08ac9f128..2a17ec6fc97c0 100644
> --- a/Documentation/devicetree/bindings/display/arm,malidp.yaml
> +++ b/Documentation/devicetree/bindings/display/arm,malidp.yaml
> @@ -71,11 +71,6 @@ properties:
>        - description: number of output lines for the green channel (G)
>        - description: number of output lines for the blue channel (B)
>  
> -  arm,malidp-arqos-high-level:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> -    description:
> -      integer describing the ARQoS levels of DP500's QoS signaling
> -
>    arm,malidp-arqos-value:
>      $ref: /schemas/types.yaml#/definitions/uint32
>      description:
> @@ -113,7 +108,7 @@ examples:
>          clocks = <&oscclk2>, <&fpgaosc0>, <&fpgaosc1>, <&fpgaosc1>;
>          clock-names = "pxlclk", "mclk", "aclk", "pclk";
>          arm,malidp-output-port-lines = /bits/ 8 <8 8 8>;
> -        arm,malidp-arqos-high-level = <0xd000d000>;
> +        arm,malidp-arqos-value = <0xd000d000>;
>  
>          port {
>              dp0_output: endpoint {
> -- 
> 2.25.1
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
