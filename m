Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F478487D9
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 18:12:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C65810F6C8;
	Sat,  3 Feb 2024 17:12:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="kCMx8q0m";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-20.smtpout.orange.fr
 [80.12.242.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ED7410F6C8
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 17:12:41 +0000 (UTC)
Received: from [192.168.1.18] ([92.140.202.140]) by smtp.orange.fr with ESMTPA
 id WJZ5r8EMLWeJzWJZ5r3AWG; Sat, 03 Feb 2024 18:12:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1706980356;
 bh=ay6OCUA7f665DqUoUex+m2wntbywTqOyj8cITOvN8KA=;
 h=Date:Subject:References:From:To:Cc:In-Reply-To;
 b=kCMx8q0mDjuLPqDx/7+dWEIEE7lW8OT9Y5QLRj4N5/t8G2hNphXtndT49IBqx1acW
 XB+W2IBQY0HrTHcD5EhobF1wPMfpI5ZKbl4vBUo4wTeyUQRjEtIXheQezSoNeuvpSO
 TucK/VPKWZh8z6kE3lYW6uOMQSo8EdGvDWV7TsRtlKAXEkK92cZBTO1sXJ8zqrEEoA
 AKDsDrT4e3NBeKtrkkJb84bS1sX98TV3yEQIqZ4LrYqX+lA+jn4JKbV+oYgH37wx7V
 dweJuDy+gPkmydNUCqD4D0C8h/lnLBT14lniu84QJVTfnHOVnNZbswo3O9rC4SpFOc
 LI1vxqSTSFK+Q==
X-ME-Helo: [192.168.1.18]
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Sat, 03 Feb 2024 18:12:36 +0100
X-ME-IP: 92.140.202.140
Message-ID: <9dd39fe9-9e9d-4093-b914-13006ac99792@wanadoo.fr>
Date: Sat, 3 Feb 2024 18:12:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V8 02/12] phy: freescale: add Samsung HDMI PHY
Content-Language: en-MW
References: <20240203165307.7806-1-aford173@gmail.com>
 <20240203165307.7806-3-aford173@gmail.com>
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: aford173@gmail.com
Cc: Laurent.pinchart@ideasonboard.com, airlied@gmail.com,
 alexander.stein@ew.tq-group.com, andrzej.hajda@intel.com,
 catalin.marinas@arm.com, conor+dt@kernel.org, daniel@ffwll.ch,
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
 festevam@gmail.com, frieder.schrempf@kontron.de, jernej.skrabec@gmail.com,
 jonas@kwiboo.se, kernel@pengutronix.de, kishon@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, l.stach@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org, maarten.lankhorst@linux.intel.com, marex@denx.de,
 mripard@kernel.org, neil.armstrong@linaro.org, p.zabel@pengutronix.de,
 rfoss@kernel.org, robh+dt@kernel.org, s.hauer@pengutronix.de,
 shawnguo@kernel.org, tzimmermann@suse.de, ulf.hansson@linaro.org,
 victor.liu@nxp.com, vkoul@kernel.org, will@kernel.org
In-Reply-To: <20240203165307.7806-3-aford173@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

Le 03/02/2024 à 17:52, Adam Ford a écrit :
> From: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> 
> This adds the driver for the Samsung HDMI PHY found on the
> i.MX8MP SoC.
> 
> Signed-off-by: Lucas Stach <l.stach-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
> Signed-off-by: Adam Ford <aford173-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Tested-by: Alexander Stein <alexander.stein-W3o+9BuWjQaZox4op4iWzw@public.gmane.org>
> ---

...

> +static int fsl_samsung_hdmi_phy_probe(struct platform_device *pdev)
> +{
> +	struct fsl_samsung_hdmi_phy *phy;
> +	int ret;
> +
> +	phy = devm_kzalloc(&pdev->dev, sizeof(*phy), GFP_KERNEL);
> +	if (!phy)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, phy);
> +	phy->dev = &pdev->dev;
> +
> +	phy->regs = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(phy->regs))
> +		return PTR_ERR(phy->regs);
> +
> +	phy->apbclk = devm_clk_get(phy->dev, "apb");
> +	if (IS_ERR(phy->apbclk))
> +		return dev_err_probe(phy->dev, PTR_ERR(phy->apbclk),
> +				     "failed to get apb clk\n");
> +
> +	phy->refclk = devm_clk_get(phy->dev, "ref");
> +	if (IS_ERR(phy->refclk))
> +		return dev_err_probe(phy->dev, PTR_ERR(phy->refclk),
> +				     "failed to get ref clk\n");
> +
> +	ret = clk_prepare_enable(phy->apbclk);
> +	if (ret) {
> +		dev_err(phy->dev, "failed to enable apbclk\n");
> +		return ret;
> +	}
> +
> +	pm_runtime_get_noresume(phy->dev);
> +	pm_runtime_set_active(phy->dev);
> +	pm_runtime_enable(phy->dev);
> +
> +	ret = phy_clk_register(phy);
> +	if (ret) {
> +		dev_err(&pdev->dev, "register clk failed\n");
> +		goto register_clk_failed;
> +	}
> +
> +	pm_runtime_put(phy->dev);
> +
> +	return 0;
> +
> +register_clk_failed:
> +	clk_disable_unprepare(phy->apbclk);
> +
> +	return ret;
> +}
> +
> +static int fsl_samsung_hdmi_phy_remove(struct platform_device *pdev)
> +{
> +	of_clk_del_provider(pdev->dev.of_node);

A clk_disable_unprepare(phy->apbclk) call seems to be missing here.
Or maybe devm_clk_get_enabled() should be used for 'apbclk'?

CJ

> +
> +	return 0;
> +}

...
