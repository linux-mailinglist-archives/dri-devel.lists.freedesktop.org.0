Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3AB8523267
	for <lists+dri-devel@lfdr.de>; Wed, 11 May 2022 14:03:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 998CB10E631;
	Wed, 11 May 2022 12:03:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 9DEAD10E1E5
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 12:03:43 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 169DC106F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:03:43 -0700 (PDT)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C55EB3F66F
 for <dri-devel@lists.freedesktop.org>; Wed, 11 May 2022 05:03:42 -0700 (PDT)
Date: Wed, 11 May 2022 13:03:36 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Andre Przywara <andre.przywara@arm.com>
Subject: Re: [PATCH v2 10/11] dt-bindings: display: convert Arm Mali-DP to DT
 schema
Message-ID: <YnumGEilUblhBx8E@e110455-lin.cambridge.arm.com>
References: <20220506140533.3566431-1-andre.przywara@arm.com>
 <20220506140533.3566431-11-andre.przywara@arm.com>
 <1651876793.707852.2407424.nullmailer@robh.at.kernel.org>
 <20220509144901.26707a1d@donnerap.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220509144901.26707a1d@donnerap.cambridge.arm.com>
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
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 09, 2022 at 02:49:01PM +0100, Andre Przywara wrote:
> On Fri, 06 May 2022 17:39:53 -0500
> Rob Herring <robh@kernel.org> wrote:
> 
> > On Fri, 06 May 2022 15:05:32 +0100, Andre Przywara wrote:
> > > The Arm Mali Display Processor (DP) 5xx/6xx is a series of IP that scans
> > > out a framebuffer and hands the pixels over to a digital signal encoder.
> > > It supports multiple layers, scaling and rotation.
> > > 
> > > Convert the existing DT binding to DT schema.
> > > 
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> > >  .../bindings/display/arm,malidp.txt           |  68 ----------
> > >  .../bindings/display/arm,malidp.yaml          | 116 ++++++++++++++++++
> > >  2 files changed, 116 insertions(+), 68 deletions(-)
> > >  delete mode 100644 Documentation/devicetree/bindings/display/arm,malidp.txt
> > >  create mode 100644 Documentation/devicetree/bindings/display/arm,malidp.yaml
> > >   
> > 
> > Running 'make dtbs_check' with the schema in this patch gives the
> > following warnings. Consider if they are expected or the schema is
> > incorrect. These may not be new warnings.
> > 
> > Note that it is not yet a requirement to have 0 warnings for dtbs_check.
> > This will change in the future.
> > 
> > Full log is available here: https://patchwork.ozlabs.org/patch/
> > 
> > 
> > display@f080000: 'arm,malidp-arqos-value' does not match any of the regexes: 'pinctrl-[0-9]+'
> > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-kbox-a-230-ls.dtb
> > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28.dtb
> > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var1.dtb
> > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var2.dtb
> > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var3-ads2.dtb
> > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-kontron-sl28-var4.dtb
> > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-qds.dtb
> > 	arch/arm64/boot/dts/freescale/fsl-ls1028a-rdb.dtb
> 
> Ah, good point, I missed that directory when testing. I came up with the
> following change on top:
> 
> ==============================
> diff --git a/Documentation/devicetree/bindings/display/arm,malidp.yaml b/Documentation/devicetree/bindings/display/arm,malidp.yaml
> index ea7b7100548bf..bc0d3f3ab2b75 100644
> --- a/Documentation/devicetree/bindings/display/arm,malidp.yaml
> +++ b/Documentation/devicetree/bindings/display/arm,malidp.yaml
> @@ -76,6 +76,14 @@ properties:
>      description:
>        integer describing the ARQoS levels of DP500's QoS signaling
>  
> +  arm,malidp-arqos-value:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Quality-of-Service value for the display engine FIFOs, to write
> +      into the RQOS register of the DP500.
> +      See the ARM Mali-DP500 TRM for details on the encoding.
> +      If omitted, the RQOS register will not be changed.
> +

Actually, this needs to replace 'arm,malidp-arqos-high-level'. Commit ce6eb0253cba
("dt/bindings: display: Add optional property node define for Mali DP500") is
introducing the wrong property (it mentions 'arm,malidp-arqos-value' in the commit
message). There is no user of 'arm,malidp-arqos-high-level' in the kernel.

Appologies for signing off on the wrong patch content at that time.

Best regards,
Liviu

>    port:
>      $ref: /schemas/graph.yaml#/properties/port
>      unevaluatedProperties: false
> ==============================
> 
> Cheers,
> Andre

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
