Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D93E782F38
	for <lists+dri-devel@lfdr.de>; Mon, 21 Aug 2023 19:12:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B6E10E28E;
	Mon, 21 Aug 2023 17:12:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD2EF10E28E
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Aug 2023 17:12:48 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 176C06401E;
 Mon, 21 Aug 2023 17:12:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A083C433C8;
 Mon, 21 Aug 2023 17:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692637967;
 bh=pecT+7jt2WFbXfJOVTRSd9o3RBK/Imr4a3p3S+M/2x4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F4U/ZhLydZ7TzaxBv+r0Ch2NVqY7bI4P84YF474cteSwc/8gpGPpXXr5iKbPPHc3Q
 CzWJg3qW2J9WktqjWOKHZMOyvto9vQNEyWcCPjCyx+aABrFoaPcO2pKsZgSRoHtgwU
 tM/Suhol2ESmfpub9Jiypc7ok56BnzExf039SiXVTigfExNTHbOz6eTegmmcB7l5md
 GTazQjsnarYCoQhfjMcbJ2AWtOlatA5JowGK6WkDc9qJQOEyZmCaurB2g2guXabLBL
 cgpRxS98pCfScD2RFFQMLIrcqxuy5FdfaCiDpwk/FYlBJDZcBNqQgdXE2mbfNieLeX
 IJqlKMF+abvIw==
Received: (nullmailer pid 1975482 invoked by uid 1000);
 Mon, 21 Aug 2023 17:12:44 -0000
Date: Mon, 21 Aug 2023 12:12:44 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Subject: Re: [PATCH 3/6] dt-bindings: display: imx: hdmi: Allow 'reg' and
 'interrupts'
Message-ID: <20230821171244.GA1963855-robh@kernel.org>
References: <20230810144451.1459985-1-alexander.stein@ew.tq-group.com>
 <20230810144451.1459985-4-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230810144451.1459985-4-alexander.stein@ew.tq-group.com>
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
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Amit Kucheria <amitk@kernel.org>,
 dri-devel@lists.freedesktop.org, Eric Dumazet <edumazet@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, NXP Linux Team <linux-imx@nxp.com>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Paolo Abeni <pabeni@redhat.com>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-pm@vger.kernel.org,
 Sascha Hauer <s.hauer@pengutronix.de>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>, "David S . Miller" <davem@davemloft.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 10, 2023 at 04:44:48PM +0200, Alexander Stein wrote:
> Although defined in synopsys,dw-hdmi.yaml, they need to explicitly allowed
> in fsl,imx6-hdmi.yaml. Fixes the warning:
> arch/arm/boot/dts/nxp/imx/imx6q-mba6a.dtb: hdmi@120000: 'interrupts',
>  'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
>  From schema: Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> 
> Fixes: b935c3a2e07b ("dt-bindings: display: imx: hdmi: Convert binding to YAML")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  .../devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> index af7fe9c4d196..d6af28e86ab4 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx6-hdmi.yaml
> @@ -22,6 +22,9 @@ properties:
>        - fsl,imx6dl-hdmi
>        - fsl,imx6q-hdmi
>  
> +  reg: true
> +  interrupts: true
> +

You should change additionalProperties to unevaluatedProperties instead.

Rob
