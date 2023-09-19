Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D82C7A6923
	for <lists+dri-devel@lfdr.de>; Tue, 19 Sep 2023 18:46:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E39410E1A9;
	Tue, 19 Sep 2023 16:46:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D342210E144
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Sep 2023 16:46:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id D0FF2CE135F;
 Tue, 19 Sep 2023 16:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E16DC433C7;
 Tue, 19 Sep 2023 16:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1695141982;
 bh=oQBTHZEBTOvXdSVkdIA/zgv1qFEEOofNEvBKr5+eM1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rZd3z/e6yMneQVmt+zvjNYwc+UJ8MIJ4tDk8BYAe9zSSN9LBCTuj7Rf3LNE1AHqJk
 Ur3cXcNEEqb/+izOs428MAfFoL3gK9Q1+4bQxiJpgRFpHUdl18Bol8Qj9J8o1BCG0J
 eQSIZFntIb+E4JaknXOSCkpB6FR4vFAaNpLc0uBgw+kiRSZsFlkt/n0sP4vXY0kivJ
 5BcO22Uy5kuOBURNDs5dbe77F+vCPPGLN7Nya9z/bWJi8DCxt8YVk2f8+/1AVtaP2L
 F9GOzuKEH18NvdhkJQVs9JY+WvDIDztVjrl6Fglok1E8k+GSn9DfGtWXFJZPAuFNrD
 PlBoDcpNrD4kQ==
Received: (nullmailer pid 4078623 invoked by uid 1000);
 Tue, 19 Sep 2023 16:46:14 -0000
Date: Tue, 19 Sep 2023 11:46:14 -0500
From: Rob Herring <robh@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Subject: Re: [PATCH 01/15] dt-bindings: mailbox: Add property for CMDQ secure
 driver
Message-ID: <20230919164614.GA4059766-robh@kernel.org>
References: <20230918192204.32263-1-jason-jh.lin@mediatek.com>
 <20230918192204.32263-2-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230918192204.32263-2-jason-jh.lin@mediatek.com>
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
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Elvis Wang <Elvis.Wang@mediatek.com>, Shawn Sung <shawn.sung@mediatek.com>,
 devicetree@vger.kernel.org, Singo Chang <singo.chang@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Sep 19, 2023 at 03:21:50AM +0800, Jason-JH.Lin wrote:
> Add mboxes to define a GCE loopping thread as a secure irq handler.
> Add mediatek,event to define a GCE software event siganl as a secure
> irq.
> 
> These 2 properties are required for CMDQ secure driver.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> ---
>  .../mailbox/mediatek,gce-mailbox.yaml         | 30 +++++++++++++++----
>  1 file changed, 24 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> index cef9d7601398..5c9aebe83d2d 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -49,6 +49,21 @@ properties:
>      items:
>        - const: gce
>  
> +  mboxes:
> +    description:
> +      A mailbox channel used as a secure irq handler in normal world.
> +      Using mailbox to communicate with GCE to setup looping thread,
> +      it should have this property and a phandle, mailbox specifiers.

All cases of 'mboxes' have a phandle and specifiers. No need to repeat 
that here.

> +    $ref: /schemas/types.yaml#/definitions/phandle-array

Already has a type definition too. You need to define how many entries 
and what each entry is if more than one. IOW, the same thing as clocks, 
resets, interrupts, etc.

> +
> +  mediatek,gce-events:

This is used all over. It really needs a single definition which is then 
referenced by the users.

> +    description:
> +      The event id which is mapping to a software event signal to gce.
> +      It is used as a secure irq for every secure gce threads.
> +      The event id is defined in the gce header
> +      include/dt-bindings/mailbox/mediatek,<chip>-gce.h of each chips.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
>  required:
>    - compatible
>    - "#mbox-cells"
> @@ -71,20 +86,23 @@ additionalProperties: false
>  
>  examples:
>    - |
> -    #include <dt-bindings/clock/mt8173-clk.h>
> +    #include <dt-bindings/clock/mediatek,mt8188-clk.h>
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/mailbox/mediatek,mt8188-gce.h>
>  
>      soc {
>          #address-cells = <2>;
>          #size-cells = <2>;
>  
> -        gce: mailbox@10212000 {
> -            compatible = "mediatek,mt8173-gce";
> -            reg = <0 0x10212000 0 0x1000>;
> -            interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_LOW>;
> +        gce0: mailbox@10320000 {
> +            compatible = "mediatek,mt8188-gce";

Are these new properties only for mt8188? If so, then you need a schema 
saying that. If not, then this is an unnecessary change to the example.

> +            reg = <0 0x10320000 0 0x4000>;
> +            interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH 0>;
>              #mbox-cells = <2>;
> -            clocks = <&infracfg CLK_INFRA_GCE>;
> +            clocks = <&infracfg_ao CLK_INFRA_AO_GCE>;
>              clock-names = "gce";
> +            mboxes = <&gce0 15 CMDQ_THR_PRIO_1>;

The provider is also a consumer?

> +            mediatek,gce-events = <CMDQ_SYNC_TOKEN_SECURE_THR_EOF>;
>          };
>      };
> -- 
> 2.18.0
> 
