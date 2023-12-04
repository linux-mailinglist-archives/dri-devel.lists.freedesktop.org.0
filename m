Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 603108034E4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Dec 2023 14:28:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AC7D10E1CE;
	Mon,  4 Dec 2023 13:28:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14E3510E22D;
 Mon,  4 Dec 2023 13:27:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701696481; x=1733232481;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=xAo1jP5xdLJDHA5y+K5s26G3/Skb6cWDEtnKHmw94sw=;
 b=oKjVgvi2FMhgMzzrq8YHq8+1LG2PC5cFPcXoU1RzBKqJbrUTogzHu2FQ
 qXH9n6Meswa3Z2NUkpsbPTmWsdUiE6jN3+mxaV/yhx64XSUy8IPWkg6+B
 6xjGVJ8+MGL/ZpQT+zdQ5FiT8EcMA+2bvZaB8NqeqyASIONko1kmxGRN7
 n5Ib6PvtEa/6oXCADooPYuWyb5zDnIXd4Nh0WcBTD8hAcPZKRNC3rc9iZ
 WBCZ89gHtrP5oiA6bHnXvM8u7cYwXv7sxXK+Wn8QqtgF1UEoNOsZfVi1G
 WTHrR6L7Q+SGWfosCzhFmCw5J6iISjFK6IaMP44neGb7pLFF6u4GP9Ash A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="12445085"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="12445085"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 05:27:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="914424174"
X-IronPort-AV: E=Sophos;i="6.04,249,1695711600"; d="scan'208";a="914424174"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 04 Dec 2023 05:27:45 -0800
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Mon, 04 Dec 2023 15:27:44 +0200
Date: Mon, 4 Dec 2023 15:27:44 +0200
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH RESEND 6/6] usb: typec: qcom-pmic-typec: switch to
 DRM_AUX_HPD_BRIDGE
Message-ID: <ZW3F6wdNiSc8c0FX@kuha.fi.intel.com>
References: <20231203114333.1305826-1-dmitry.baryshkov@linaro.org>
 <20231203114333.1305826-7-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231203114333.1305826-7-dmitry.baryshkov@linaro.org>
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
Cc: dri-devel@lists.freedesktop.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Janne Grunau <j@jannau.net>,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Andy Gross <agross@kernel.org>, Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, linux-arm-msm@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dmitry,

On Sun, Dec 03, 2023 at 02:43:33PM +0300, Dmitry Baryshkov wrote:
> Use the freshly defined DRM_AUX_HPD_BRIDGE instead of open-coding the
> same functionality for the DRM bridge chain termination.
> 
> Acked-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

I'm sorry, I've completely missed this second typec patch.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/tcpm/Kconfig                |  1 +
>  drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 41 +++----------------
>  2 files changed, 7 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/usb/typec/tcpm/Kconfig b/drivers/usb/typec/tcpm/Kconfig
> index 0b2993fef564..64d5421c69e6 100644
> --- a/drivers/usb/typec/tcpm/Kconfig
> +++ b/drivers/usb/typec/tcpm/Kconfig
> @@ -80,6 +80,7 @@ config TYPEC_QCOM_PMIC
>  	tristate "Qualcomm PMIC USB Type-C Port Controller Manager driver"
>  	depends on ARCH_QCOM || COMPILE_TEST
>  	depends on DRM || DRM=n
> +	select DRM_AUX_HPD_BRIDGE if DRM_BRIDGE
>  	help
>  	  A Type-C port and Power Delivery driver which aggregates two
>  	  discrete pieces of silicon in the PM8150b PMIC block: the
> diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> index 581199d37b49..1a2b4bddaa97 100644
> --- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> +++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
> @@ -18,7 +18,7 @@
>  #include <linux/usb/tcpm.h>
>  #include <linux/usb/typec_mux.h>
>  
> -#include <drm/drm_bridge.h>
> +#include <drm/bridge/aux-bridge.h>
>  
>  #include "qcom_pmic_typec_pdphy.h"
>  #include "qcom_pmic_typec_port.h"
> @@ -36,7 +36,6 @@ struct pmic_typec {
>  	struct pmic_typec_port	*pmic_typec_port;
>  	bool			vbus_enabled;
>  	struct mutex		lock;		/* VBUS state serialization */
> -	struct drm_bridge	bridge;
>  };
>  
>  #define tcpc_to_tcpm(_tcpc_) container_of(_tcpc_, struct pmic_typec, tcpc)
> @@ -150,35 +149,6 @@ static int qcom_pmic_typec_init(struct tcpc_dev *tcpc)
>  	return 0;
>  }
>  
> -#if IS_ENABLED(CONFIG_DRM)
> -static int qcom_pmic_typec_attach(struct drm_bridge *bridge,
> -				     enum drm_bridge_attach_flags flags)
> -{
> -	return flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR ? 0 : -EINVAL;
> -}
> -
> -static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
> -	.attach = qcom_pmic_typec_attach,
> -};
> -
> -static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
> -{
> -	tcpm->bridge.funcs = &qcom_pmic_typec_bridge_funcs;
> -#ifdef CONFIG_OF
> -	tcpm->bridge.of_node = of_get_child_by_name(tcpm->dev->of_node, "connector");
> -#endif
> -	tcpm->bridge.ops = DRM_BRIDGE_OP_HPD;
> -	tcpm->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
> -
> -	return devm_drm_bridge_add(tcpm->dev, &tcpm->bridge);
> -}
> -#else
> -static int qcom_pmic_typec_init_drm(struct pmic_typec *tcpm)
> -{
> -	return 0;
> -}
> -#endif
> -
>  static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  {
>  	struct pmic_typec *tcpm;
> @@ -186,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  	struct device_node *np = dev->of_node;
>  	const struct pmic_typec_resources *res;
>  	struct regmap *regmap;
> +	struct device *bridge_dev;
>  	u32 base[2];
>  	int ret;
>  
> @@ -241,14 +212,14 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
>  	mutex_init(&tcpm->lock);
>  	platform_set_drvdata(pdev, tcpm);
>  
> -	ret = qcom_pmic_typec_init_drm(tcpm);
> -	if (ret)
> -		return ret;
> -
>  	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
>  	if (!tcpm->tcpc.fwnode)
>  		return -EINVAL;
>  
> +	bridge_dev = drm_dp_hpd_bridge_register(tcpm->dev, to_of_node(tcpm->tcpc.fwnode));
> +	if (IS_ERR(bridge_dev))
> +		return PTR_ERR(bridge_dev);
> +
>  	tcpm->tcpm_port = tcpm_register_port(tcpm->dev, &tcpm->tcpc);
>  	if (IS_ERR(tcpm->tcpm_port)) {
>  		ret = PTR_ERR(tcpm->tcpm_port);
> -- 
> 2.39.2

-- 
heikki
