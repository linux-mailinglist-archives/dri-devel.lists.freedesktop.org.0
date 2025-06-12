Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B864EAD7B24
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jun 2025 21:39:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22C6710E168;
	Thu, 12 Jun 2025 19:39:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EY67E14r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717A610E168
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jun 2025 19:39:02 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6D6AE6111C;
 Thu, 12 Jun 2025 19:39:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF5CAC4CEEA;
 Thu, 12 Jun 2025 19:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1749757141;
 bh=8ZQANtvZ4WwIhNchdMuhJm0al1ZNSWYW9HenxnbYz3E=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=EY67E14r6Hcxp9KxQSXXlt1cs3CQHAYC7RagnOxytC637a0G762PrHu3ay+9eNweG
 nj6XFWiEKXj85/wWlEp1x9KlQhVcjMDrAnnV80aXqxlWI+Dg5Q9Oao52WD+oQ8Rqs0
 C38d7eg8jadm3cQwesFEsIh3tqKM6gDnUlCPrF21XsblFVy3N2KvAroIlWUQbCcTXR
 rMnhOxpYFGc2x27BMLO+v92DQ6W8OjNlgDTahcq3tmeLhThFOmXeOIjZ3BC42m19Cj
 2f8Xs86ikWwGXwke6oHaNdDnMAoFHMv73ti2rI+bEzeDe8OMATUUB4d9EDVKO8WmVb
 /OefydnCg0wOQ==
Date: Thu, 12 Jun 2025 14:38:59 -0500
From: Bjorn Helgaas <helgaas@kernel.org>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Yury Norov <yury.norov@gmail.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Jaehoon Chung <jh80.chung@samsung.com>,
 Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Shreeya Patel <shreeya.patel@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Nicolas Frattaroli <frattaroli.nicolas@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Chanwoo Choi <cw00.choi@samsung.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>, Qin Jian <qinjian@cqplus1.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-phy@lists.infradead.org,
 linux-sound@vger.kernel.org, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-pci@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-clk@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH 17/20] PCI: dw-rockchip: switch to HWORD_UPDATE macro
Message-ID: <20250612193859.GA924246@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612-byeword-update-v1-17-f4afb8f6313f@collabora.com>
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

On Thu, Jun 12, 2025 at 08:56:19PM +0200, Nicolas Frattaroli wrote:
> The era of hand-rolled HIWORD_UPDATE macros is over.
> 
> Like many other Rockchip drivers, pcie-dw-rockchip brings with it its
> very own flavour of HIWORD_UPDATE. It's occasionally used without a
> constant mask, which complicates matters. HIWORD_UPDATE_BIT is a
> confusingly named addition, as it doesn't update the bit, it actually
> sets all bits in the value to 1. HIWORD_DISABLE_BIT is similarly
> confusing; it disables several bits at once by using the value as a mask
> and the inverse of value as the value, and the "disabling only these"
> effect comes from the hardware actually using the mask. The more obvious
> approach would've been HIWORD_UPDATE(val, 0) in my opinion.
> 
> This is part of the motivation why this patch uses bitfield.h's
> HWORD_UPDATE instead, where possible. HWORD_UPDATE requires a constant
> bit mask, which isn't possible where the irq number is used to generate
> a bit mask. For that purpose, we replace it with a more robust macro
> than what was there but that should also bring close to zero runtime
> overhead: we actually mask the IRQ number to make sure we're not writing
> garbage.
> 
> For the remaining bits, there also are some caveats. For starters, the
> PCIE_CLIENT_ENABLE_LTSSM and PCIE_CLIENT_DISABLE_LTSSM were named in a
> manner that isn't quite truthful to what they do. Their modification
> actually spans not just the LTSSM bit but also another bit, flipping
> only the LTSSM one, but keeping the other (which according to the TRM
> has a reset value of 0) always enabled. This other bit is reserved as of
> the IP version RK3588 uses at least, and I have my doubts as to whether
> it was meant to be set, and whether it was meant to be set in that code
> path. Either way, it's confusing.
> 
> Replace it with just writing either 1 or 0 to the LTSSM bit, using the
> new HWORD_UPDATE macro from bitfield.h, which grants us the benefit of
> better compile-time error checking.
> 
> The change of no longer setting the reserved bit doesn't appear to
> change the behaviour on RK3568 in RC mode, where it's not marked as
> reserved.
> 
> PCIE_CLIENT_RC_MODE/PCIE_CLIENT_EP_MODE was another field that wasn't
> super clear on what the bit field modification actually is. As far as I
> can tell, switching to RC mode doesn't actually write the correct value
> to the field if any of its bits have been set previously, as it only
> updates one bit of a 4 bit field.
> 
> Replace it by actually writing the full values to the field, using the
> new HWORD_UPDATE macro, which grants us the benefit of better
> compile-time error checking.
> 
> This patch was tested on RK3588 (PCIe3 x4 controller), RK3576 (PCIe2 x1
> controller) and RK3568 (PCIe x2 controller), all in RC mode.
> 
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

  PCI: dw-rockchip: Switch to HWORD_UPDATE macro

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 39 ++++++++++++++++-----------
>  1 file changed, 24 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 93171a3928794915ad1e8c03c017ce0afc1f9169..29363346f2cd9774d8d2e06cd76f7f82e6a7fecf 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -29,18 +29,19 @@
>   * The upper 16 bits of PCIE_CLIENT_CONFIG are a write
>   * mask for the lower 16 bits.
>   */
> -#define HIWORD_UPDATE(mask, val) (((mask) << 16) | (val))
> -#define HIWORD_UPDATE_BIT(val)	HIWORD_UPDATE(val, val)
> -#define HIWORD_DISABLE_BIT(val)	HIWORD_UPDATE(val, ~val)
>  
>  #define to_rockchip_pcie(x) dev_get_drvdata((x)->dev)
>  
>  /* General Control Register */
>  #define PCIE_CLIENT_GENERAL_CON		0x0
> -#define  PCIE_CLIENT_RC_MODE		HIWORD_UPDATE_BIT(0x40)
> -#define  PCIE_CLIENT_EP_MODE		HIWORD_UPDATE(0xf0, 0x0)
> -#define  PCIE_CLIENT_ENABLE_LTSSM	HIWORD_UPDATE_BIT(0xc)
> -#define  PCIE_CLIENT_DISABLE_LTSSM	HIWORD_UPDATE(0x0c, 0x8)
> +#define  PCIE_CLIENT_MODE_MASK		GENMASK(7, 4)
> +#define  PCIE_CLIENT_MODE_EP		0x0U
> +#define  PCIE_CLIENT_MODE_LEGACY	0x1U
> +#define  PCIE_CLIENT_MODE_RC		0x4U
> +#define  PCIE_CLIENT_SET_MODE(x)	HWORD_UPDATE(PCIE_CLIENT_MODE_MASK, (x))
> +#define  PCIE_CLIENT_LD_RQ_RST_GRT	HWORD_UPDATE(BIT(3), 1)
> +#define  PCIE_CLIENT_ENABLE_LTSSM	HWORD_UPDATE(BIT(2), 1)
> +#define  PCIE_CLIENT_DISABLE_LTSSM	HWORD_UPDATE(BIT(2), 0)
>  
>  /* Interrupt Status Register Related to Legacy Interrupt */
>  #define PCIE_CLIENT_INTR_STATUS_LEGACY	0x8
> @@ -52,6 +53,11 @@
>  
>  /* Interrupt Mask Register Related to Legacy Interrupt */
>  #define PCIE_CLIENT_INTR_MASK_LEGACY	0x1c
> +#define  PCIE_INTR_MASK			GENMASK(7, 0)
> +#define  PCIE_INTR_CLAMP(_x)		((BIT((_x)) & PCIE_INTR_MASK))
> +#define  PCIE_INTR_LEGACY_MASK(x)	(PCIE_INTR_CLAMP((x)) | \
> +					 (PCIE_INTR_CLAMP((x)) << 16))
> +#define  PCIE_INTR_LEGACY_UNMASK(x)	(PCIE_INTR_CLAMP((x)) << 16)
>  
>  /* Interrupt Mask Register Related to Miscellaneous Operation */
>  #define PCIE_CLIENT_INTR_MASK_MISC	0x24
> @@ -114,14 +120,14 @@ static void rockchip_pcie_intx_handler(struct irq_desc *desc)
>  static void rockchip_intx_mask(struct irq_data *data)
>  {
>  	rockchip_pcie_writel_apb(irq_data_get_irq_chip_data(data),
> -				 HIWORD_UPDATE_BIT(BIT(data->hwirq)),
> +				 PCIE_INTR_LEGACY_MASK(data->hwirq),
>  				 PCIE_CLIENT_INTR_MASK_LEGACY);
>  };
>  
>  static void rockchip_intx_unmask(struct irq_data *data)
>  {
>  	rockchip_pcie_writel_apb(irq_data_get_irq_chip_data(data),
> -				 HIWORD_DISABLE_BIT(BIT(data->hwirq)),
> +				 PCIE_INTR_LEGACY_UNMASK(data->hwirq),
>  				 PCIE_CLIENT_INTR_MASK_LEGACY);
>  };
>  
> @@ -521,10 +527,11 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>  	}
>  
>  	/* LTSSM enable control mode */
> -	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE);
> +	val = HWORD_UPDATE(PCIE_LTSSM_ENABLE_ENHANCE, 1);
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>  
> -	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_RC_MODE,
> +	rockchip_pcie_writel_apb(rockchip,
> +				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_RC),
>  				 PCIE_CLIENT_GENERAL_CON);
>  
>  	pp = &rockchip->pci.pp;
> @@ -538,7 +545,7 @@ static int rockchip_pcie_configure_rc(struct platform_device *pdev,
>  	}
>  
>  	/* unmask DLL up/down indicator */
> -	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED, 0);
> +	val = HWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED, 0);
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
>  
>  	return ret;
> @@ -567,10 +574,11 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>  	}
>  
>  	/* LTSSM enable control mode */
> -	val = HIWORD_UPDATE_BIT(PCIE_LTSSM_ENABLE_ENHANCE);
> +	val = HWORD_UPDATE(PCIE_LTSSM_ENABLE_ENHANCE, 1);
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_HOT_RESET_CTRL);
>  
> -	rockchip_pcie_writel_apb(rockchip, PCIE_CLIENT_EP_MODE,
> +	rockchip_pcie_writel_apb(rockchip,
> +				 PCIE_CLIENT_SET_MODE(PCIE_CLIENT_MODE_EP),
>  				 PCIE_CLIENT_GENERAL_CON);
>  
>  	rockchip->pci.ep.ops = &rockchip_pcie_ep_ops;
> @@ -594,7 +602,8 @@ static int rockchip_pcie_configure_ep(struct platform_device *pdev,
>  	pci_epc_init_notify(rockchip->pci.ep.epc);
>  
>  	/* unmask DLL up/down indicator and hot reset/link-down reset */
> -	val = HIWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED | PCIE_LINK_REQ_RST_NOT_INT, 0);
> +	val = HWORD_UPDATE(PCIE_RDLH_LINK_UP_CHGED, 0) |
> +	      HWORD_UPDATE(PCIE_LINK_REQ_RST_NOT_INT, 0);
>  	rockchip_pcie_writel_apb(rockchip, val, PCIE_CLIENT_INTR_MASK_MISC);
>  
>  	return ret;
> 
> -- 
> 2.49.0
> 
