Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oMq6Av6xqGlMwgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:28:14 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A74FC2088C2
	for <lists+dri-devel@lfdr.de>; Wed, 04 Mar 2026 23:28:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA6CD10EACC;
	Wed,  4 Mar 2026 22:28:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KBk482hy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D9710EACC;
 Wed,  4 Mar 2026 22:28:10 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 4E08140583;
 Wed,  4 Mar 2026 22:28:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02BB7C4CEF7;
 Wed,  4 Mar 2026 22:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772663290;
 bh=C0ZGtBuBp1fvpx0er+3GXSEkD2dQthdr27MzlEOeBDM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=KBk482hyhP65Ms7Kyp34pncPCtnpwpROK6t1T7wDtjWfFlIGz9vt4q3X6S7MFa1A7
 wcjwal0jOUWce4q88axOO7EX5dsUza2y0hpQ3OSPjvRNGOZAWtk6cyUycEBmQII48p
 8r7fmT9gmJ8sn3uTxHpgYaS8dVG9BYVxJemEfMboYGLr8qOY1tFbD8AWpdzP8nSanP
 QCDIsj+2wXtvKUT7Lo7pG7NNxINCMq+PLig+X88cTO+8EA16ySJ5UmubNoO3zEY73O
 smY7QQQ/n6SMpYfxWuw9Db0SKtabs5DPA4zlR87/ueXy11RVne0Xqb0iq29gIc0fGN
 UFmAfkKyD28Jg==
Date: Wed, 4 Mar 2026 16:28:08 -0600
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
 Vignesh Raghavendra <vigneshr@ti.com>,
 Siddharth Vadapalli <s-vadapalli@ti.com>
Subject: Re: [PATCH phy-next 08/22] PCI: remove device links to PHY
Message-ID: <20260304222808.GA41083@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304175735.2660419-9-vladimir.oltean@nxp.com>
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
X-Rspamd-Queue-Id: A74FC2088C2
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[31];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[helgaas@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[dri-devel];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,nxp.com:email]
X-Rspamd-Action: no action

Update subject line to:

  PCI: Remove redundant device links to PHY

On Wed, Mar 04, 2026 at 07:57:21PM +0200, Vladimir Oltean wrote:
> This is practically a full revert of commit
> 7a4db656a635 ("PCI: dra7xx: Create functional dependency between PCIe and PHY")
> and a partial revert of the device link pieces from commits
> dfb80534692d ("PCI: cadence: Add generic PHY support to host and EP drivers")
> 49229238ab47 ("PCI: keystone: Cleanup PHY handling")
> 
> The trouble with these commits is that they dereference fields inside
> struct phy from a consumer driver, which will become no longer possible.
> 
> Since commit 987351e1ea77 ("phy: core: Add consumer device link
> support") from 2019, the PHY core also adds a device link to order PHY
> provider and consumer suspend/resume operations. All reverted commits
> are from 2017-2018, and what they do should actually be redundant now.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

With subject line update:

Acked-by: Bjorn Helgaas <bhelgaas@google.com>

Thanks for doing this; it's great to get rid of all that code.

> ---
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: "Krzysztof Wilczyński" <kwilczynski@kernel.org>
> Cc: Manivannan Sadhasivam <mani@kernel.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Bjorn Helgaas <bhelgaas@google.com>
> Cc: Vignesh Raghavendra <vigneshr@ti.com>
> Cc: Siddharth Vadapalli <s-vadapalli@ti.com>
> ---
>  drivers/pci/controller/cadence/pcie-cadence.c | 16 +---------
>  drivers/pci/controller/dwc/pci-dra7xx.c       | 16 ----------
>  drivers/pci/controller/dwc/pci-keystone.c     | 31 +++----------------
>  3 files changed, 5 insertions(+), 58 deletions(-)
> 
> diff --git a/drivers/pci/controller/cadence/pcie-cadence.c b/drivers/pci/controller/cadence/pcie-cadence.c
> index a1eada56edba..0ac980249941 100644
> --- a/drivers/pci/controller/cadence/pcie-cadence.c
> +++ b/drivers/pci/controller/cadence/pcie-cadence.c
> @@ -222,7 +222,6 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
>  	struct device_node *np = dev->of_node;
>  	int phy_count;
>  	struct phy **phy;
> -	struct device_link **link;
>  	int i;
>  	int ret;
>  	const char *name;
> @@ -238,10 +237,6 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
>  	if (!phy)
>  		return -ENOMEM;
>  
> -	link = devm_kcalloc(dev, phy_count, sizeof(*link), GFP_KERNEL);
> -	if (!link)
> -		return -ENOMEM;
> -
>  	for (i = 0; i < phy_count; i++) {
>  		of_property_read_string_index(np, "phy-names", i, &name);
>  		phy[i] = devm_phy_get(dev, name);
> @@ -249,17 +244,10 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
>  			ret = PTR_ERR(phy[i]);
>  			goto err_phy;
>  		}
> -		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
> -		if (!link[i]) {
> -			devm_phy_put(dev, phy[i]);
> -			ret = -EINVAL;
> -			goto err_phy;
> -		}
>  	}
>  
>  	pcie->phy_count = phy_count;
>  	pcie->phy = phy;
> -	pcie->link = link;
>  
>  	ret =  cdns_pcie_enable_phy(pcie);
>  	if (ret)
> @@ -268,10 +256,8 @@ int cdns_pcie_init_phy(struct device *dev, struct cdns_pcie *pcie)
>  	return 0;
>  
>  err_phy:
> -	while (--i >= 0) {
> -		device_link_del(link[i]);
> +	while (--i >= 0)
>  		devm_phy_put(dev, phy[i]);
> -	}
>  
>  	return ret;
>  }
> diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
> index d5d26229063f..b91ab37845c9 100644
> --- a/drivers/pci/controller/dwc/pci-dra7xx.c
> +++ b/drivers/pci/controller/dwc/pci-dra7xx.c
> @@ -9,7 +9,6 @@
>  
>  #include <linux/clk.h>
>  #include <linux/delay.h>
> -#include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/interrupt.h>
>  #include <linux/irq.h>
> @@ -683,7 +682,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
>  	int i;
>  	int phy_count;
>  	struct phy **phy;
> -	struct device_link **link;
>  	void __iomem *base;
>  	struct dw_pcie *pci;
>  	struct dra7xx_pcie *dra7xx;
> @@ -731,10 +729,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
>  	if (!phy)
>  		return -ENOMEM;
>  
> -	link = devm_kcalloc(dev, phy_count, sizeof(*link), GFP_KERNEL);
> -	if (!link)
> -		return -ENOMEM;
> -
>  	dra7xx->clk = devm_clk_get_optional(dev, NULL);
>  	if (IS_ERR(dra7xx->clk))
>  		return dev_err_probe(dev, PTR_ERR(dra7xx->clk),
> @@ -749,12 +743,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
>  		phy[i] = devm_phy_get(dev, name);
>  		if (IS_ERR(phy[i]))
>  			return PTR_ERR(phy[i]);
> -
> -		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
> -		if (!link[i]) {
> -			ret = -EINVAL;
> -			goto err_link;
> -		}
>  	}
>  
>  	dra7xx->base = base;
> @@ -856,10 +844,6 @@ static int dra7xx_pcie_probe(struct platform_device *pdev)
>  	pm_runtime_disable(dev);
>  	dra7xx_pcie_disable_phy(dra7xx);
>  
> -err_link:
> -	while (--i >= 0)
> -		device_link_del(link[i]);
> -
>  	return ret;
>  }
>  
> diff --git a/drivers/pci/controller/dwc/pci-keystone.c b/drivers/pci/controller/dwc/pci-keystone.c
> index 642e4c45eefc..07698c645e02 100644
> --- a/drivers/pci/controller/dwc/pci-keystone.c
> +++ b/drivers/pci/controller/dwc/pci-keystone.c
> @@ -130,7 +130,6 @@ struct keystone_pcie {
>  	int			num_lanes;
>  	u32			num_viewport;
>  	struct phy		**phy;
> -	struct device_link	**link;
>  	struct			device_node *msi_intc_np;
>  	struct irq_domain	*intx_irq_domain;
>  	struct device_node	*np;
> @@ -1118,7 +1117,6 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  	enum dw_pcie_device_mode mode;
>  	struct dw_pcie *pci;
>  	struct keystone_pcie *ks_pcie;
> -	struct device_link **link;
>  	struct gpio_desc *gpiod;
>  	struct resource *res;
>  	void __iomem *base;
> @@ -1189,31 +1187,17 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  	if (!phy)
>  		return -ENOMEM;
>  
> -	link = devm_kcalloc(dev, num_lanes, sizeof(*link), GFP_KERNEL);
> -	if (!link)
> -		return -ENOMEM;
> -
>  	for (i = 0; i < num_lanes; i++) {
>  		snprintf(name, sizeof(name), "pcie-phy%d", i);
>  		phy[i] = devm_phy_optional_get(dev, name);
>  		if (IS_ERR(phy[i])) {
>  			ret = PTR_ERR(phy[i]);
> -			goto err_link;
> -		}
> -
> -		if (!phy[i])
> -			continue;
> -
> -		link[i] = device_link_add(dev, &phy[i]->dev, DL_FLAG_STATELESS);
> -		if (!link[i]) {
> -			ret = -EINVAL;
> -			goto err_link;
> +			goto err;
>  		}
>  	}
>  
>  	ks_pcie->np = np;
>  	ks_pcie->pci = pci;
> -	ks_pcie->link = link;
>  	ks_pcie->num_lanes = num_lanes;
>  	ks_pcie->phy = phy;
>  
> @@ -1223,7 +1207,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  		ret = PTR_ERR(gpiod);
>  		if (ret != -EPROBE_DEFER)
>  			dev_err(dev, "Failed to get reset GPIO\n");
> -		goto err_link;
> +		goto err;
>  	}
>  
>  	/* Obtain references to the PHYs */
> @@ -1238,7 +1222,7 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  
>  	if (ret) {
>  		dev_err(dev, "failed to enable phy\n");
> -		goto err_link;
> +		goto err;
>  	}
>  
>  	platform_set_drvdata(pdev, ks_pcie);
> @@ -1325,25 +1309,18 @@ static int ks_pcie_probe(struct platform_device *pdev)
>  	pm_runtime_disable(dev);
>  	ks_pcie_disable_phy(ks_pcie);
>  
> -err_link:
> -	while (--i >= 0 && link[i])
> -		device_link_del(link[i]);
> -
> +err:
>  	return ret;
>  }
>  
>  static void ks_pcie_remove(struct platform_device *pdev)
>  {
>  	struct keystone_pcie *ks_pcie = platform_get_drvdata(pdev);
> -	struct device_link **link = ks_pcie->link;
> -	int num_lanes = ks_pcie->num_lanes;
>  	struct device *dev = &pdev->dev;
>  
>  	pm_runtime_put(dev);
>  	pm_runtime_disable(dev);
>  	ks_pcie_disable_phy(ks_pcie);
> -	while (num_lanes--)
> -		device_link_del(link[num_lanes]);
>  }
>  
>  static struct platform_driver ks_pcie_driver = {
> -- 
> 2.43.0
> 
