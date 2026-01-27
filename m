Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wFg/B3vfeGkGtwEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:53:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2CDC9724D
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jan 2026 16:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B40310E596;
	Tue, 27 Jan 2026 15:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="MVfiQz6C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816C810E593;
 Tue, 27 Jan 2026 15:53:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 7C6F460132;
 Tue, 27 Jan 2026 15:53:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977EFC116C6;
 Tue, 27 Jan 2026 15:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1769529206;
 bh=C3gromy2eb16W2gWD5WJsKh1zrKRXY062g+k/w1mXxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MVfiQz6CBax7gqQIZxr7fEty1JrtQDbm28ZBkAjyTU+MlEwhQMUCTZarNP6XI7IU9
 MqKJukvU9AhPg+iwzJNAHgxFJcBOeG1cBjcclmpePUXSPMxhG08Aa7C/me/2tJWtn7
 2Hx8iLibQXZWCtDYaBojyhLdO7hQDYkEgR4Nyh92yXHXSVqtGuEmsjiZZc1fBH1osU
 6Iusk+Uu6DJXDrM1m9phJ/xheLy2c3qQrJc4Bvdek3tjOdD4IWk9JWKksqf0lLySbJ
 JUl/oEPdDYUQ9okzzQIuDi2+uAaCIMkqg/kPTTHfOd51V9a2kK4zofeStJXvT9G58X
 hCPgOc43ZEdwg==
Date: Tue, 27 Jan 2026 21:23:14 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Bartosz Golaszewski <brgl@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, 
 linux-usb@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v2 2/7] pci: pwrctrl: add PCI pwrctrl driver for the
 UPD720201/UPD720202 USB 3.0 xHCI Host Controller
Message-ID: <llbnkm72mgcsrucnp7pdkwbgyzenvhe4kudxkdixplgaoirdem@3q3me34o5drf>
References: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-0-c55ec1b5d8bf@linaro.org>
 <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260127-topic-sm8650-ayaneo-pocket-s2-base-v2-2-c55ec1b5d8bf@linaro.org>
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
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[kernel.org,oss.qualcomm.com,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,linuxfoundation.org,glider.be,google.com,vger.kernel.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[mani@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt,renesas];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C2CDC9724D
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 10:57:29AM +0100, Neil Armstrong wrote:
> Add support fo the Renesas UPD720201/UPD720202 USB 3.0 xHCI Host Controller
> power control which connects over PCIe and requires specific power supplies
> to start up.
> 

This driver only handles the supplies. So why can't you use the existing
pwrctrl-slot driver as a fallback?

- Mani

> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  drivers/pci/pwrctrl/Kconfig                 | 10 ++++
>  drivers/pci/pwrctrl/Makefile                |  2 +
>  drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c | 88 +++++++++++++++++++++++++++++
>  3 files changed, 100 insertions(+)
> 
> diff --git a/drivers/pci/pwrctrl/Kconfig b/drivers/pci/pwrctrl/Kconfig
> index e0f999f299bb..5a94e60d0d3e 100644
> --- a/drivers/pci/pwrctrl/Kconfig
> +++ b/drivers/pci/pwrctrl/Kconfig
> @@ -11,6 +11,16 @@ config PCI_PWRCTRL_PWRSEQ
>  	select POWER_SEQUENCING
>  	select PCI_PWRCTRL
>  
> +config PCI_PWRCTRL_UPD720201
> +	tristate "PCI Power Control driver for the UPD720201 USB3 Host Controller"
> +	select PCI_PWRCTRL
> +	help
> +	  Say Y here to enable the PCI Power Control driver of the UPD720201
> +	  USB3 Host Controller.
> +
> +	  The voltage regulators powering the rails of the PCI slots
> +	  are expected to be defined in the devicetree node of the PCI device.
> +
>  config PCI_PWRCTRL_SLOT
>  	tristate "PCI Power Control driver for PCI slots"
>  	select PCI_PWRCTRL
> diff --git a/drivers/pci/pwrctrl/Makefile b/drivers/pci/pwrctrl/Makefile
> index 13b02282106c..a99f85de8a3d 100644
> --- a/drivers/pci/pwrctrl/Makefile
> +++ b/drivers/pci/pwrctrl/Makefile
> @@ -5,6 +5,8 @@ pci-pwrctrl-core-y			:= core.o
>  
>  obj-$(CONFIG_PCI_PWRCTRL_PWRSEQ)	+= pci-pwrctrl-pwrseq.o
>  
> +obj-$(CONFIG_PCI_PWRCTRL_UPD720201)	+= pci-pwrctrl-upd720201.o
> +
>  obj-$(CONFIG_PCI_PWRCTRL_SLOT)		+= pci-pwrctrl-slot.o
>  pci-pwrctrl-slot-y			:= slot.o
>  
> diff --git a/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
> new file mode 100644
> index 000000000000..db96bbb69c21
> --- /dev/null
> +++ b/drivers/pci/pwrctrl/pci-pwrctrl-upd720201.c
> @@ -0,0 +1,88 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Based on upd720201.c:
> + * Copyright (C) 2024 Linaro Ltd.
> + * Author: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> + */
> +
> +#include <linux/device.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/pci-pwrctrl.h>
> +#include <linux/platform_device.h>
> +#include <linux/regulator/consumer.h>
> +#include <linux/slab.h>
> +
> +struct pci_pwrctrl_upd720201_data {
> +	struct pci_pwrctrl ctx;
> +	struct regulator_bulk_data *supplies;
> +	int num_supplies;
> +};
> +
> +static void devm_pci_pwrctrl_upd720201_power_off(void *data)
> +{
> +	struct pci_pwrctrl_upd720201_data *upd720201 = data;
> +
> +	regulator_bulk_disable(upd720201->num_supplies, upd720201->supplies);
> +	regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
> +}
> +
> +static int pci_pwrctrl_upd720201_probe(struct platform_device *pdev)
> +{
> +	struct pci_pwrctrl_upd720201_data *upd720201;
> +	struct device *dev = &pdev->dev;
> +	int ret;
> +
> +	upd720201 = devm_kzalloc(dev, sizeof(*upd720201), GFP_KERNEL);
> +	if (!upd720201)
> +		return -ENOMEM;
> +
> +	ret = of_regulator_bulk_get_all(dev, dev_of_node(dev),
> +					&upd720201->supplies);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to get upd720201 regulators\n");
> +		return ret;
> +	}
> +
> +	upd720201->num_supplies = ret;
> +	ret = regulator_bulk_enable(upd720201->num_supplies, upd720201->supplies);
> +	if (ret < 0) {
> +		dev_err_probe(dev, ret, "Failed to enable upd720201 regulators\n");
> +		regulator_bulk_free(upd720201->num_supplies, upd720201->supplies);
> +		return ret;
> +	}
> +
> +	ret = devm_add_action_or_reset(dev, devm_pci_pwrctrl_upd720201_power_off,
> +				       upd720201);
> +	if (ret)
> +		return ret;
> +
> +	pci_pwrctrl_init(&upd720201->ctx, dev);
> +
> +	ret = devm_pci_pwrctrl_device_set_ready(dev, &upd720201->ctx);
> +	if (ret)
> +		return dev_err_probe(dev, ret, "Failed to register pwrctrl driver\n");
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id pci_pwrctrl_upd720201_of_match[] = {
> +	{
> +		.compatible = "pci1912,0014",
> +	},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, pci_pwrctrl_upd720201_of_match);
> +
> +static struct platform_driver pci_pwrctrl_upd720201_driver = {
> +	.driver = {
> +		.name = "pci-pwrctrl-upd720201",
> +		.of_match_table = pci_pwrctrl_upd720201_of_match,
> +	},
> +	.probe = pci_pwrctrl_upd720201_probe,
> +};
> +module_platform_driver(pci_pwrctrl_upd720201_driver);
> +
> +MODULE_AUTHOR("Neil Armstrong <neil.armstrong@linaro.org>");
> +MODULE_DESCRIPTION("PCI Power Control driver for UPD720201 USB3 Host Controller");
> +MODULE_LICENSE("GPL");
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்
