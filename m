Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8307C6C8F
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 13:40:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB6EE10E4AF;
	Thu, 12 Oct 2023 11:40:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0175310E4AF
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 11:40:36 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
 by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 39CBeEJx047419;
 Thu, 12 Oct 2023 06:40:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
 s=ti-com-17Q1; t=1697110814;
 bh=86JNobGYVcRaYcmgXkBHX9h9OSB9+MmhNELVhZ1N55c=;
 h=Date:Subject:To:CC:References:From:In-Reply-To;
 b=QrKhQrHVHdJpgFelBS5ZwMX2uZ+J2hqVUqoFeMhJEcJdWQXldYAihm3Rn11skZ/XB
 sBKyicCXZQ3MV+M8UOK2pnDE4mDAaN5++po8p93ejEPeVjp7woagJpxzZKeTjPhWo5
 C1QrreZ8Llhe3/Mv2E6lyZoWpY3JJInhh41jbL+A=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
 by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 39CBeEoG009100
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
 Thu, 12 Oct 2023 06:40:14 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 12
 Oct 2023 06:40:14 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 12 Oct 2023 06:40:13 -0500
Received: from [10.249.129.148] (ileaxei01-snat.itg.ti.com [10.180.69.5])
 by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 39CBe7nP017559;
 Thu, 12 Oct 2023 06:40:08 -0500
Message-ID: <c9f17f9e-b9b5-9685-30ca-6a7d041dd8aa@ti.com>
Date: Thu, 12 Oct 2023 17:10:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH] drm/tidss: Power up attached PM domains on probe
Content-Language: en-US
To: <jyri.sarha@iki.fi>, <tomi.valkeinen@ideasonboard.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>,
 <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20231009075018.2836020-1-devarsht@ti.com>
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20231009075018.2836020-1-devarsht@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
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
Cc: nm@ti.com, j-choudhary@ti.com, j-luthra@ti.com, vigneshr@ti.com,
 a-bhatia1@ti.com, praneeth@ti.com, r-ravikumar@ti.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 09/10/23 13:20, Devarsh Thakkar wrote:
> Some SoC's such as AM62P have dedicated power domains
> for OLDI which need to be powered on separetely along
> with display controller.
> 
> So during driver probe, power up all attached PM domains
> enumerated in devicetree node for DSS.
> 
> This also prepares base to add display support for AM62P.
> 

NAK, for this patch, as discussed with team there are already plans
to have separate OLDI bridge driver which should eventually handle
the additional power domains.

Sorry for the noise.

Regards
Devarsh
> Signed-off-by: Devarsh Thakkar <devarsht@ti.com> > ---
>   drivers/gpu/drm/tidss/tidss_drv.c | 76 +++++++++++++++++++++++++++++++
>   drivers/gpu/drm/tidss/tidss_drv.h |  5 ++
>   2 files changed, 81 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.c b/drivers/gpu/drm/tidss/tidss_drv.c
> index 4d063eb9cd0b..a703a27d17bf 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.c
> +++ b/drivers/gpu/drm/tidss/tidss_drv.c
> @@ -8,6 +8,7 @@
>   #include <linux/of.h>
>   #include <linux/module.h>
>   #include <linux/pm_runtime.h>
> +#include <linux/pm_domain.h>
>   
>   #include <drm/drm_atomic.h>
>   #include <drm/drm_atomic_helper.h>
> @@ -114,6 +115,72 @@ static const struct drm_driver tidss_driver = {
>   	.minor			= 0,
>   };
>   
> +static int tidss_detach_pm_domains(struct tidss_device *tidss)
> +{
> +	int i;
> +
> +	if (tidss->num_domains <= 1)
> +		return 0;
> +
> +	for (i = 0; i < tidss->num_domains; i++) {
> +		if (tidss->pd_link[i] && !IS_ERR(tidss->pd_link[i]))
> +			device_link_del(tidss->pd_link[i]);
> +		if (tidss->pd_dev[i] && !IS_ERR(tidss->pd_dev[i]))
> +			dev_pm_domain_detach(tidss->pd_dev[i], true);
> +		tidss->pd_dev[i] = NULL;
> +		tidss->pd_link[i] = NULL;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tidss_attach_pm_domains(struct tidss_device *tidss)
> +{
> +	struct device *dev = tidss->dev;
> +	int i;
> +	int ret;
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct device_node *np = pdev->dev.of_node;
> +
> +	tidss->num_domains = of_count_phandle_with_args(np, "power-domains",
> +							"#power-domain-cells");
> +	if (tidss->num_domains <= 1) {
> +		dev_dbg(dev, "One or less power domains, no need to do attach domains\n");
> +		return 0;
> +	}
> +
> +	tidss->pd_dev = devm_kmalloc_array(dev, tidss->num_domains,
> +					   sizeof(*tidss->pd_dev), GFP_KERNEL);
> +	if (!tidss->pd_dev)
> +		return -ENOMEM;
> +
> +	tidss->pd_link = devm_kmalloc_array(dev, tidss->num_domains,
> +					    sizeof(*tidss->pd_link), GFP_KERNEL);
> +	if (!tidss->pd_link)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < tidss->num_domains; i++) {
> +		tidss->pd_dev[i] = dev_pm_domain_attach_by_id(dev, i);
> +		if (IS_ERR(tidss->pd_dev[i])) {
> +			ret = PTR_ERR(tidss->pd_dev[i]);
> +			goto fail;
> +		}
> +
> +		tidss->pd_link[i] = device_link_add(dev, tidss->pd_dev[i],
> +						    DL_FLAG_STATELESS |
> +						    DL_FLAG_PM_RUNTIME | DL_FLAG_RPM_ACTIVE);
> +		if (!tidss->pd_link[i]) {
> +			ret = -EINVAL;
> +			goto fail;
> +		}
> +	}
> +
> +	return 0;
> +fail:
> +	tidss_detach_pm_domains(tidss);
> +	return ret;
> +}
> +
>   static int tidss_probe(struct platform_device *pdev)
>   {
>   	struct device *dev = &pdev->dev;
> @@ -136,6 +203,13 @@ static int tidss_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, tidss);
>   
> +	/* powering up associated OLDI domains */
> +	ret = tidss_attach_pm_domains(tidss);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to attach power domains %d\n", ret);
> +		return ret;
> +	}
> +
>   	ret = dispc_init(tidss);
>   	if (ret) {
>   		dev_err(dev, "failed to initialize dispc: %d\n", ret);
> @@ -193,6 +267,7 @@ static int tidss_probe(struct platform_device *pdev)
>   	dispc_runtime_suspend(tidss->dispc);
>   #endif
>   	pm_runtime_disable(dev);
> +	tidss_detach_pm_domains(tidss);
>   
>   	return ret;
>   }
> @@ -220,6 +295,7 @@ static void tidss_remove(struct platform_device *pdev)
>   	/* devm allocated dispc goes away with the dev so mark it NULL */
>   	dispc_remove(tidss);
>   
> +	tidss_detach_pm_domains(tidss);
>   	dev_dbg(dev, "%s done\n", __func__);
>   }
>   
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index d7f27b0b0315..3c8b37b3aba6 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -31,6 +31,11 @@ struct tidss_device {
>   
>   	spinlock_t wait_lock;	/* protects the irq masks */
>   	dispc_irq_t irq_mask;	/* enabled irqs in addition to wait_list */
> +
> +	int num_domains; /* Handle attached PM domains */
> +	struct device **pd_dev;
> +	struct device_link **pd_link;
> +
>   };
>   
>   #define to_tidss(__dev) container_of(__dev, struct tidss_device, ddev)
