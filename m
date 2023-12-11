Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FA2B80C3CF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 10:00:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A61910E36B;
	Mon, 11 Dec 2023 09:00:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fd01.gateway.ufhost.com (fd01.gateway.ufhost.com
 [61.152.239.71])
 by gabe.freedesktop.org (Postfix) with ESMTP id AA8E310E36B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Dec 2023 09:00:09 +0000 (UTC)
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id 38D71808F;
 Mon, 11 Dec 2023 17:00:05 +0800 (CST)
Received: from EXMBX061.cuchost.com (172.16.6.61) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 17:00:04 +0800
Received: from [192.168.1.115] (180.164.60.184) by EXMBX061.cuchost.com
 (172.16.6.61) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 11 Dec
 2023 17:00:04 +0800
Message-ID: <5e10fbd8-2299-4fdd-b9ac-5ca71af07012@starfivetech.com>
Date: Mon, 11 Dec 2023 17:00:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v3 3/6] drm/vs: Register DRM device
To: Philipp Zabel <p.zabel@pengutronix.de>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>
References: <20231204123315.28456-1-keith.zhao@starfivetech.com>
 <20231204123315.28456-4-keith.zhao@starfivetech.com>
 <12c6097a723b9208f6da89207867b32102237fbc.camel@pengutronix.de>
Content-Language: en-US
From: Keith Zhao <keith.zhao@starfivetech.com>
In-Reply-To: <12c6097a723b9208f6da89207867b32102237fbc.camel@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [180.164.60.184]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX061.cuchost.com
 (172.16.6.61)
X-YovoleRuleAgent: yovoleflag
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
Cc: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
 "suijingfeng@loongson.cn" <suijingfeng@loongson.cn>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>,
 "mripard@kernel.org" <mripard@kernel.org>,
 Xingyu Wu <xingyu.wu@starfivetech.com>, Jack Zhu <jack.zhu@starfivetech.com>,
 "palmer@dabbelt.com" <palmer@dabbelt.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 William Qiu <william.qiu@starfivetech.com>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Changhuang Liang <changhuang.liang@starfivetech.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

hi Philipp:

On 2023/12/4 21:30, Philipp Zabel wrote:
> Hi Keith,
> 
> On Mo, 2023-12-04 at 20:33 +0800, Keith Zhao wrote:
>> Implement drm device registration interface
>> 
>> Signed-off-by: Keith Zhao <keith.zhao@starfivetech.com>
>> ---
> [...]
>> diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
>> new file mode 100644
>> index 000000000000..e10fa97635aa
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/Kconfig
>> @@ -0,0 +1,13 @@
>> +# SPDX-License-Identifier: GPL-2.0
>> +config DRM_VERISILICON
>> +	tristate "DRM Support for VeriSilicon"
>> +	depends on DRM
>> +	select DRM_KMS_HELPER
>> +	select DRM_GEM_DMA_HELPER
>> +	select CMA
>> +	select DMA_CMA
>> +	help
>> +	  Choose this option if you have a VeriSilicon soc chipset.
> 
> This seems a bit generic. Doesn't the VeriSilicon display controller IP
> used on JH7110 have a product name?
yes , there is a product name "dc8200", I will match it.
> 
> [...]
>> diff --git a/drivers/gpu/drm/verisilicon/vs_drv.c b/drivers/gpu/drm/verisilicon/vs_drv.c
>> new file mode 100644
>> index 000000000000..4fb1f29ef84b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/verisilicon/vs_drv.c
>> @@ -0,0 +1,316 @@
>> +// SPDX-License-Identifier: GPL-2.0
> [...]
>> +static void vs_drm_device_release_clocks(void *res)
>> +{
>> +	struct vs_drm_device *priv = res;
>> +	unsigned int i;
>> +
>> +	reset_control_bulk_assert(priv->nrsts, priv->rst_vout);
>> +
>> +	for (i = 0; i < priv->clk_count; ++i) {
>> +		if (priv->clks[i]) {
>> +			clk_disable_unprepare(priv->clks[i]);
>> +			clk_put(priv->clks[i]);
>> +		}
>> +	}
> 
> Why not use the bulk API for clk as well?
ok , will do it next version
> 
> [...]
>> +static int vs_drm_device_init_clocks(struct vs_drm_device *priv)
>> +{
>> +	struct drm_device *dev = &priv->base;
>> +	struct platform_device *pdev = to_platform_device(dev->dev);
>> +	struct device_node *of_node = pdev->dev.of_node;
>> +	struct clk *clock;
>> +	unsigned int i;
>> +	int ret;
>> +
>> +	if (dev_get_platdata(&pdev->dev) || !of_node)
>> +		return 0;
>> +
>> +	priv->nrsts = ARRAY_SIZE(priv->rst_vout);
>> +	for (int i = 0; i < priv->nrsts; ++i)
>> +		priv->rst_vout[i].id = vout_resets[i];
>> +	ret = devm_reset_control_bulk_get_shared(dev->dev, priv->nrsts,
>> +						 priv->rst_vout);
> 
> I would request resets and clocks in _probe().

> 
> If component_bind_all() returns -EPROBE_DEFER because of a still
> missing DSI panel backlight or similar, this doesn't have to be done
> multiple times.
I got what you mean. component_bind_all should be done multiple times
 to prevent the dsi panel driver from lagging load.

in my drm subsystem , there are 2 pipeline 

          +------------------------------+
          |                              |
          |                              |
  +----+  |   +-------------------+      |   +-------+   +------+   +------+
  |    +----->+  dc controller 0  +--->----->+HDMICtl| ->+ PHY  +-->+PANEL0+
  |AXI |  |   +-------------------+      |   +-------+   +------+   +------+
  |    |  |                              |
  |    |  |                              |
  |    |  |                              |
  |    |  |                              |
  |APB |  |   +-------------------+         +---------+    +------+  +-------+
  |    +----->+  dc controller 1  +--->---->+ dsiTx   +--->+DPHY  +->+ PANEL1+
  |    |  |   +-------------------+         +---------+    +------+  +-------+
  +----+  |                              |
          +------------------------------+


component_bind_all will bind the hdmi encoder and dsi encoder .
binding the hdmi encoder will always return ok .

binging the dsi encoder has a question :
I used the panel-raspberrypi-touchscreen.c as panel driver , 
this driver is a i2c device and it use a i2c command to read reg ID
if read success , it will do drm_panel_add. 

if I disconnect the panel ,it will not do drm_panel_add.
dsiTx will fail to find panel , The consequence is that the inputbridge cannot be created , 
also outputbridge cannot be created.
for encoder bind , it will fail to find the input bridge of dsi.
Under this premise, although returning -EPROBE_DEFER allows bind to be executed multiple times, 
the final result is that the entire bind fails.

returning -EPROBE_DEFER can solve panel driver from lagging load , 
but for no panel case , it will destory all pipeline (include hdmi and dsi).

I did two things:
late_initcall_sync(vs_drm_init); to make sure the panel drive has been probed;
dsi encoder bind always return ok to make sure hdmi pipeline ok at lease.
component_bind_all do once . 




> 
>> +	if (ret) {
>> +		drm_err(dev, "Failed to get reset controls\n");
>> +		return ret;
>> +	}
>> +
>> +	priv->clk_count = of_clk_get_parent_count(of_node);
>> +	if (!priv->clk_count)
>> +		return 0;
>> +
>> +	priv->clks = drmm_kzalloc(dev, priv->clk_count * sizeof(priv->clks[0]),
>> +				  GFP_KERNEL);
>> +	if (!priv->clks)
>> +		return -ENOMEM;
>> +
>> +	for (i = 0; i < priv->clk_count; ++i) {
>> +		clock = of_clk_get(of_node, i);
>> +		if (IS_ERR(clock)) {
>> +			ret = PTR_ERR(clock);
>> +			if (ret == -EPROBE_DEFER)
>> +				goto err;
>> +			drm_err(dev, "clock %u not found: %d\n", i, ret);
>> +			continue;
>> +		}
>> +		ret = clk_prepare_enable(clock);
>> +		if (ret) {
>> +			drm_err(dev, "failed to enable clock %u: %d\n",
>> +				i, ret);
>> +			clk_put(clock);
>> +			continue;
>> +		}
>> +		priv->clks[i] = clock;
>> +	}
>> +
>> +	ret = reset_control_bulk_deassert(priv->nrsts, priv->rst_vout);
>> +	if (ret)
>> +		return ret;
> 
> This should goto err, otherwise clocks are left enabled.
> 
>> +
>> +	return devm_add_action_or_reset(&pdev->dev,
>> +					vs_drm_device_release_clocks,
>> +					priv);
>> +
>> +err:
>> +	while (i) {
>> +		--i;
>> +		if (priv->clks[i]) {
>> +			clk_disable_unprepare(priv->clks[i]);
>> +			clk_put(priv->clks[i]);
>> +		}
>> +	}
>> +	return ret;
>> +}
>> +
>> +static int vs_drm_bind(struct device *dev)
>> +{
>> +	struct platform_device *pdev = to_platform_device(dev);
>> +	struct vs_drm_device *priv;
>> +	int ret;
>> +	struct drm_device *drm_dev;
>> +
>> +	/* Remove existing drivers that may own the framebuffer memory. */
>> +	ret = drm_aperture_remove_framebuffers(&vs_drm_driver);
>> +	if (ret)
>> +		return ret;
>> +
>> +	priv = devm_drm_dev_alloc(dev, &vs_drm_driver, struct vs_drm_device, base);
>> +	if (IS_ERR(priv))
>> +		return PTR_ERR(priv);
>> +
>> +	priv->pitch_alignment = 64;
> 
> Why is this a variable instead of a constant?
the dc controllers of VeriSilicon have different series, like dc8200 , dc9200...
Their pitch values may vary from series to series, like 64 , 128

> 
>> +	ret = dma_set_coherent_mask(priv->base.dev, DMA_BIT_MASK(40));
>> +	if (ret)
>> +		return ret;
>> +
>> +	drm_dev = &priv->base;
>> +	platform_set_drvdata(pdev, drm_dev);
>> +
>> +	ret = vs_drm_device_init_clocks(priv);
>> +	if (ret)
>> +		return ret;
>> +
>> +	vs_mode_config_init(drm_dev);
>> +
>> +	/* Now try and bind all our sub-components */
>> +	ret = component_bind_all(dev, drm_dev);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = drm_vblank_init(drm_dev, drm_dev->mode_config.num_crtc);
>> +	if (ret)
>> +		return ret;
> 
> Missing component_unbind_all(), see below.
> 
>> +
>> +	drm_mode_config_reset(drm_dev);
>> +
>> +	drm_kms_helper_poll_init(drm_dev);
>> +
>> +	ret = drm_dev_register(drm_dev, 0);
>> +	if (ret)
>> +		return ret;
> 
> Missing drm_kms_helper_poll_fini(), see below.
> 
>> +
>> +	drm_fbdev_generic_setup(drm_dev, 32);
>> +
>> +	return 0;
> 
> Here I'd expect an error path calling drm_kms_helper_poll_fini() and
> component_unbind_all() as appropriate.
> 
ok

> 
> regards
> Philipp
