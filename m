Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEvEDA6xqGkzwgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:24:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B6E52087BF
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAF110EAC4;
	Wed,  4 Mar 2026 22:24:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="JT8h8wa9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DB2210EAC4;
 Wed,  4 Mar 2026 22:24:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id C537542B72;
 Wed,  4 Mar 2026 22:24:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78788C4CEF7;
 Wed,  4 Mar 2026 22:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772663049;
 bh=LZ6aRV4NLElGe+XvDNm2H6HYU4en15K91g1Y0+5t5ls=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=JT8h8wa9YGAM78bb/3oWwxOczIdTWP1RLevWv9SASlMV3F23HjV3aS0cAufk5oNIv
 Zbq+dj2V5Q1lrbLpdEf4tkfURlQheh0zpocuRg02jBYOuKwCUWiLX08zynlr3zyeeI
 6w6Tf3erGb8F5L7qg0ORfQYnKFUxrQFLM83fJWOTVoAGPovAII829usbx5s2g7ZftI
 8F0q5T73eVmTAvQiaF4BLlcaiBz/Wo2J+jlfrwYZ9ZRmUbse8mrHowz62l44VtX+79
 VS3gNkNik1DtEJIOtsvBEoQRsmWSal1XE2ICQqhs17+ZVBYOWkmudGUSL2q9myTyT4
 S8ZfZ2xwzNClw==
Date: Wed, 4 Mar 2026 16:24:08 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: linux-phy@lists.infradead.org, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-can@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org,
 netdev@vger.kernel.org, spacemit@lists.linux.dev,
 UNGLinuxDriver@microchip.com, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Heiko Stuebner <heiko@sntech.de>, Shawn Guo <shawn.guo@linaro.org>,
 Yixun Lan <dlan@kernel.org>, Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Shawn Lin <shawn.lin@rock-chips.com>,
 Kevin Xie <kevin.xie@starfivetech.com>
Subject: Re: [PATCH phy-next 02/22] PCI: add missing headers transitively
 included by <linux/phy/phy.h>
Message-ID: <20260304222408.GA40990@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304175735.2660419-3-vladimir.oltean@nxp.com>
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
X-Rspamd-Queue-Id: 8B6E52087BF
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[36];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[lists.infradead.org,kernel.org,linaro.org,lists.freedesktop.org,vger.kernel.org,lists.linux.dev,microchip.com,google.com,sntech.de,gmail.com,nvidia.com,rock-chips.com,starfivetech.com];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nxp.com:email,linaro.org:email]
X-Rspamd-Action: no action

Update subject line to match history:

  PCI: Add missing headers transitively included by <linux/phy/phy.h>

On Wed, Mar 04, 2026 at 07:57:15PM +0200, Vladimir Oltean wrote:
> The tegra as well as a few dwc PCI controller drivers uses PM runtime
> operations without including the required <linux/pm_runtime.h> header.
> 
> Similarly, pcie-rockchip-host, pcie-starfive as well as a few dwc PCI
> controllers use the regulator consumer API without including
> <linux/regulator/consumer.h>.
> 
> It seems these function prototypes were indirectly provided by
> <linux/phy/phy.h>, mostly by mistake (none of the functions it exports
> need it).
> 
> Before the PHY header can drop the unnecessary includes, make sure the
> PCI controller drivers include what they use.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

With the subject line update:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

> ---
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Heiko Stuebner <heiko@sntech.de>
> Cc: Shawn Guo <shawn.guo@linaro.org>
> Cc: Yixun Lan <dlan@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Shawn Lin <shawn.lin@rock-chips.com>
> Cc: Kevin Xie <kevin.xie@starfivetech.com>
> ---
>  drivers/pci/controller/dwc/pci-keystone.c     | 1 +
>  drivers/pci/controller/dwc/pcie-dw-rockchip.c | 1 +
>  drivers/pci/controller/dwc/pcie-histb.c       | 1 +
>  drivers/pci/controller/dwc/pcie-qcom-ep.c     | 1 +
>  drivers/pci/controller/dwc/pcie-spacemit-k1.c | 2 ++
>  drivers/pci/controller/dwc/pcie-tegra194.c    | 1 +
>  drivers/pci/controller/pci-tegra.c            | 1 +
>  drivers/pci/controller/pcie-rockchip-host.c   | 1 +
>  drivers/pci/controller/plda/pcie-starfive.c   | 1 +
>  9 files changed, 10 insertions(+)
> 
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 20fa4dadb82a..642e4c45eefc 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -24,6 +24,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/resource.h>
>  #include <linux/signal.h>
> diff --git a/drivers/pci/controller/dwc/pcie-dw-rockchip.c b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> index 5b17da63151d..e0079ec108ab 100644
> --- a/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> +++ b/drivers/pci/controller/dwc/pcie-dw-rockchip.c
> @@ -21,6 +21,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  
>  #include "../../pci.h"
> diff --git a/drivers/pci/controller/dwc/pcie-histb.c b/drivers/pci/controller/dwc/pcie-histb.c
> index a52071589377..432a54c5bfce 100644
> --- a/drivers/pci/controller/dwc/pcie-histb.c
> +++ b/drivers/pci/controller/dwc/pcie-histb.c
> @@ -18,6 +18,7 @@
>  #include <linux/pci.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/resource.h>
>  #include <linux/reset.h>
>  
> diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> index 18460f01b2c6..e417122da51d 100644
> --- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
> +++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
> @@ -19,6 +19,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
>  #include <linux/reset.h>
>  #include <linux/module.h>
> diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> index be20a520255b..dbec159fd458 100644
> --- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> +++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
> @@ -15,7 +15,9 @@
>  #include <linux/mod_devicetable.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/types.h>
>  
> diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
> index 06571d806ab3..3378a89580ab 100644
> --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> @@ -27,6 +27,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/random.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include <linux/resource.h>
>  #include <linux/types.h>
> diff --git a/drivers/pci/controller/pci-tegra.c b/drivers/pci/controller/pci-tegra.c
> index 512309763d1f..a2c1662b6e81 100644
> --- a/drivers/pci/controller/pci-tegra.c
> +++ b/drivers/pci/controller/pci-tegra.c
> @@ -36,6 +36,7 @@
>  #include <linux/phy/phy.h>
>  #include <linux/pinctrl/consumer.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_runtime.h>
>  #include <linux/reset.h>
>  #include <linux/sizes.h>
>  #include <linux/slab.h>
> diff --git a/drivers/pci/controller/pcie-rockchip-host.c b/drivers/pci/controller/pcie-rockchip-host.c
> index ee1822ca01db..46adb4582fcc 100644
> --- a/drivers/pci/controller/pcie-rockchip-host.c
> +++ b/drivers/pci/controller/pcie-rockchip-host.c
> @@ -24,6 +24,7 @@
>  #include <linux/of_pci.h>
>  #include <linux/phy/phy.h>
>  #include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
>  
>  #include "../pci.h"
>  #include "pcie-rockchip.h"
> diff --git a/drivers/pci/controller/plda/pcie-starfive.c b/drivers/pci/controller/plda/pcie-starfive.c
> index 298036c3e7f9..22344cca167b 100644
> --- a/drivers/pci/controller/plda/pcie-starfive.c
> +++ b/drivers/pci/controller/plda/pcie-starfive.c
> @@ -21,6 +21,7 @@
>  #include <linux/platform_device.h>
>  #include <linux/pm_runtime.h>
>  #include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
>  #include <linux/reset.h>
>  #include "../../pci.h"
>  
> -- 
> 2.43.0
> 
