Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29DE31F9046
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jun 2020 09:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 557348933D;
	Mon, 15 Jun 2020 07:48:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41D68933D
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 07:48:16 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jkjqg-0006Gk-PF; Mon, 15 Jun 2020 09:48:06 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1jkjqe-000242-Ti; Mon, 15 Jun 2020 09:48:04 +0200
Message-ID: <c544bcb8ea20dadcea68e22d33c160a713c7fe02.camel@pengutronix.de>
Subject: Re: [PATCH 14/29] dt: Fix broken references to renamed docs
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Linux Doc Mailing
 List <linux-doc@vger.kernel.org>
Date: Mon, 15 Jun 2020 09:48:04 +0200
In-Reply-To: <6866c0d6d10ce36bb151c2d3752a20eb5122c532.1592203542.git.mchehab+huawei@kernel.org>
References: <cover.1592203542.git.mchehab+huawei@kernel.org>
 <6866c0d6d10ce36bb151c2d3752a20eb5122c532.1592203542.git.mchehab+huawei@kernel.org>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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
Cc: devicetree@vger.kernel.org, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Jonathan Corbet <corbet@lwn.net>, David Airlie <airlied@linux.ie>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 NXP Linux Team <linux-imx@nxp.com>, linux-arm-msm@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-spi@vger.kernel.org,
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 2020-06-15 at 08:46 +0200, Mauro Carvalho Chehab wrote:
> Some files got renamed. Those were all fixed automatically by
> 
> 	./scripts/documentation-file-ref-check --fix
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt   | 2 +-
>  Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt | 4 ++--
>  Documentation/devicetree/bindings/display/imx/ldb.txt         | 4 ++--
>  Documentation/devicetree/bindings/spi/qcom,spi-geni-qcom.txt  | 2 +-
>  MAINTAINERS                                                   | 4 ++--
>  5 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index 715047444391..10b8459e49f8 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -47,7 +47,7 @@ Required properties:
>  			  &lsio_mu1 1 2
>  			  &lsio_mu1 1 3
>  			  &lsio_mu1 3 3>;
> -		See Documentation/devicetree/bindings/mailbox/fsl,mu.txt
> +		See Documentation/devicetree/bindings/mailbox/fsl,mu.yaml
>  		for detailed mailbox binding.
>  
>  Note: Each mu which supports general interrupt should have an alias correctly
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> index 5bf77f6dd19d..5a99490c17b9 100644
> --- a/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> +++ b/Documentation/devicetree/bindings/display/imx/fsl-imx-drm.txt
> @@ -68,7 +68,7 @@ Required properties:
>    datasheet
>  - clocks : phandle to the PRE axi clock input, as described
>    in Documentation/devicetree/bindings/clock/clock-bindings.txt and
> -  Documentation/devicetree/bindings/clock/imx6q-clock.txt.
> +  Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
>  - clock-names: should be "axi"
>  - interrupts: should contain the PRE interrupt
>  - fsl,iram: phandle pointing to the mmio-sram device node, that should be
> @@ -94,7 +94,7 @@ Required properties:
>    datasheet
>  - clocks : phandles to the PRG ipg and axi clock inputs, as described
>    in Documentation/devicetree/bindings/clock/clock-bindings.txt and
> -  Documentation/devicetree/bindings/clock/imx6q-clock.txt.
> +  Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
>  - clock-names: should be "ipg" and "axi"
>  - fsl,pres: phandles to the PRE units attached to this PRG, with the fixed
>    PRE as the first entry and the muxable PREs following.
> diff --git a/Documentation/devicetree/bindings/display/imx/ldb.txt b/Documentation/devicetree/bindings/display/imx/ldb.txt
> index 38c637fa39dd..8e6e7d797943 100644
> --- a/Documentation/devicetree/bindings/display/imx/ldb.txt
> +++ b/Documentation/devicetree/bindings/display/imx/ldb.txt
> @@ -30,8 +30,8 @@ Required properties:
>                  "di2_sel" - IPU2 DI0 mux
>                  "di3_sel" - IPU2 DI1 mux
>          The needed clock numbers for each are documented in
> -        Documentation/devicetree/bindings/clock/imx5-clock.txt, and in
> -        Documentation/devicetree/bindings/clock/imx6q-clock.txt.
> +        Documentation/devicetree/bindings/clock/imx5-clock.yaml, and in
> +        Documentation/devicetree/bindings/clock/imx6q-clock.yaml.
>  
>  Optional properties:
>   - pinctrl-names : should be "default" on i.MX53, not used on i.MX6q

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
