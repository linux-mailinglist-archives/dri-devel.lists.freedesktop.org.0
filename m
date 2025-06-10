Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BECA3AD2C4C
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 05:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAE7110E222;
	Tue, 10 Jun 2025 03:50:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; secure) header.d=kapsi.fi header.i=@kapsi.fi header.b="1MKtmw0s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1350 seconds by postgrey-1.36 at gabe;
 Tue, 10 Jun 2025 03:50:31 UTC
Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FA5E10E222
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Jun 2025 03:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
 s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=affox4Kq1bjPy2ctrshBc/luTilar3kM1+7WxMRnXhk=; b=1MKtmw0stbFdFaEP07QMflhn5v
 6OzXDVRpnyoJFWyaRE5BuY04kss9NGiP7nSQm3uVJXcfddytQaiUeWv8mwC4bPM3XBT3yzJqgiPiT
 BFy5gBGEBbn3tvx0yGbwaUsJH6Tz9Fg5IPx7PIFcBVfY+VI50hMDO3WUK5MdErdFpFDSurf1q+Ej3
 EGjryscY+F9vGMcfXvECefEVwYz3hIEq5cry6bUn7zuyzsrzplU14AsJlLb+1w7kPDYfNas7yGuUM
 ozghhO/5e75yqV6LNpPvB1hldZ20HfnTMu8QdZCHuYjnjcYXxLxQFm4CrzHjBl/dL0YHNwodR1hvS
 GhEY2/cg==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
 by mail.kapsi.fi with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.96)
 (envelope-from <cyndis@kapsi.fi>) id 1uOpe1-0077Zu-0r;
 Tue, 10 Jun 2025 06:27:25 +0300
Message-ID: <811ad406-4afb-45c5-9783-683779f874cc@kapsi.fi>
Date: Tue, 10 Jun 2025 12:26:07 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] drm/tegra: Add NVJPG driver
To: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <20250606-diogo-nvjpg-v1-1-5f2c36feeb39@tecnico.ulisboa.pt>
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <20250606-diogo-nvjpg-v1-1-5f2c36feeb39@tecnico.ulisboa.pt>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
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

On 6/6/25 7:45 PM, Diogo Ivo wrote:
> Add support for booting and using NVJPG on Tegra210 to the Host1x
> and TegraDRM drivers. This driver only supports the new TegraDRM uAPI.

Hello Diogo -- I'm happy to see this driver!

> 
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>   drivers/gpu/drm/tegra/Makefile |   1 +
>   drivers/gpu/drm/tegra/drm.c    |   2 +
>   drivers/gpu/drm/tegra/drm.h    |   1 +
>   drivers/gpu/drm/tegra/nvjpg.c  | 379 +++++++++++++++++++++++++++++++++++++++++
>   4 files changed, 383 insertions(+)
> ...
> +
> +static __maybe_unused int nvjpg_runtime_resume(struct device *dev)
> +{
> +	struct nvjpg *nvjpg = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = clk_prepare_enable(nvjpg->clk);
> +	if (err < 0)
> +		return err;
> +
> +	usleep_range(20, 30);
> +
> +	if (nvjpg->rst) {
> +		err = reset_control_acquire(nvjpg->rst);
> +		if (err < 0) {
> +			dev_err(dev, "failed to acquire reset: %d\n", err);
> +			goto disable_clk;
> +		}
> +
> +		err = reset_control_deassert(nvjpg->rst);
> +		if (err < 0) {
> +			dev_err(dev, "failed to deassert reset: %d\n", err);
> +			goto release_reset;
> +		}
> +
> +		usleep_range(20, 30);
> +	}

Do we need this manual reset handling? NVJPG is only on T210+ where the 
power domain code handles the reset as well. Did you run into any issues 
with it?

(As a note, the reset_control_* functions are no-ops on a NULL reset. So 
the 'if' here is unnecessary.)

> +
> +	err = nvjpg_load_falcon_firmware(nvjpg);
> +	if (err < 0)
> +		goto assert_reset;
> +
> +	err = falcon_boot(&nvjpg->falcon);
> +	if (err < 0)
> +		goto assert_reset;
> +
> +	return 0;
> +
> +assert_reset:
> +	reset_control_assert(nvjpg->rst);
> +release_reset:
> +	reset_control_release(nvjpg->rst);
> +disable_clk:
> +	clk_disable_unprepare(nvjpg->clk);
> +	return err;
> +}
> ...
> +
> +static int nvjpg_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct nvjpg *nvjpg;
> +	int err;
> +
> +	/* inherit DMA mask from host1x parent */
> +	err = dma_coerce_mask_and_coherent(dev, *dev->parent->dma_mask);
> +	if (err < 0) {
> +		dev_err(&pdev->dev, "failed to set DMA mask: %d\n", err);
> +		return err;
> +	}
> +
> +	nvjpg = devm_kzalloc(dev, sizeof(*nvjpg), GFP_KERNEL);
> +	if (!nvjpg)
> +		return -ENOMEM;
> +
> +	nvjpg->config = of_device_get_match_data(dev);
> +
> +	nvjpg->regs = devm_platform_get_and_ioremap_resource(pdev, 0, NULL);

This can be devm_platform_ioremap_resource -- slightly simpler.

> +	if (IS_ERR(nvjpg->regs))
> +		return PTR_ERR(nvjpg->regs);
> +
> +	nvjpg->rst = devm_reset_control_get_exclusive_released(&pdev->dev, "nvjpg");
> +	if (IS_ERR(nvjpg->rst)) {
> +		err = PTR_ERR(nvjpg->rst);
> +
> +		if (err != -EBUSY || WARN_ON(!pdev->dev.pm_domain)) {
> +			dev_err(&pdev->dev, "failed to get reset control: %d\n",
> +				err);
> +			return err;
> +		}
> +
> +		/*
> +		 * At this point, the reset control is most likely being used
> +		 * by the generic power domain implementation. With any luck
> +		 * the power domain will have taken care of resetting the SOR
> +		 * and we don't have to do anything.
> +		 */
> +		nvjpg->rst = NULL;
> +	}

I see you've taken this from sor.c, but I think it should be 
unnecessary. I imagine the code in sor.c is overcomplicated as well, 
maybe because we used not to have the power domain implementation.

> +
> +	nvjpg->clk = devm_clk_get(dev, "nvjpg");
> +	if (IS_ERR(nvjpg->clk)) {
> +		dev_err(&pdev->dev, "failed to get clock\n");
> +		return PTR_ERR(nvjpg->clk);
> +	}

Probably a good idea to set the clock rate to max (see vic.c).

> +
> +	nvjpg->falcon.dev = dev;
> +	nvjpg->falcon.regs = nvjpg->regs;
> +
> +	err = falcon_init(&nvjpg->falcon);
> +	if (err < 0)
> +		return err;
> +
> +	platform_set_drvdata(pdev, nvjpg);
> +
> +	INIT_LIST_HEAD(&nvjpg->client.base.list);
> +	nvjpg->client.base.ops = &nvjpg_client_ops;
> +	nvjpg->client.base.dev = dev;
> +	nvjpg->client.base.class = HOST1X_CLASS_NVJPG;
> +	nvjpg->dev = dev;
> +
> +	INIT_LIST_HEAD(&nvjpg->client.list);
> +	nvjpg->client.version = nvjpg->config->version;
> +	nvjpg->client.ops = &nvjpg_ops;
> +
> +	err = host1x_client_register(&nvjpg->client.base);
> +	if (err < 0) {
> +		dev_err(dev, "failed to register host1x client: %d\n", err);
> +		goto exit_falcon;
> +	}
> +
> +	pm_runtime_use_autosuspend(dev);
> +	pm_runtime_set_autosuspend_delay(dev, 500);
> +	devm_pm_runtime_enable(dev);
> +
> +	return 0;
> +
> +exit_falcon:
> +	falcon_exit(&nvjpg->falcon);
> +
> +	return err;
> +}
> +
> +static void nvjpg_remove(struct platform_device *pdev)
> +{
> +	struct nvjpg *nvjpg = platform_get_drvdata(pdev);
> +
> +	host1x_client_unregister(&nvjpg->client.base);
> +	falcon_exit(&nvjpg->falcon);
> +}
> +
> +static const struct dev_pm_ops nvjpg_pm_ops = {
> +	SET_RUNTIME_PM_OPS(nvjpg_runtime_suspend, nvjpg_runtime_resume, NULL)
> +	SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> +				pm_runtime_force_resume)
> +};

There are modern, improved variants with no SET_ prefix.

Thanks,
Mikko

> +
> +struct platform_driver tegra_nvjpg_driver = {
> +	.driver = {
> +		.name = "tegra-nvjpg",
> +		.of_match_table = tegra_nvjpg_of_match,
> +		.pm = &nvjpg_pm_ops
> +	},
> +	.probe = nvjpg_probe,
> +	.remove = nvjpg_remove,
> +};
> +
> +#if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
> +MODULE_FIRMWARE(NVIDIA_TEGRA_210_NVJPG_FIRMWARE);
> +#endif
> 

