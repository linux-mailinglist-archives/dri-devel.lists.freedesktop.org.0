Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E02976CB62
	for <lists+dri-devel@lfdr.de>; Wed,  2 Aug 2023 13:00:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D61E10E023;
	Wed,  2 Aug 2023 11:00:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B7510E023;
 Wed,  2 Aug 2023 11:00:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690974026; x=1722510026;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=uL/lMcoIpmA8jyiK1UfZfDEuaaCRn/1fGgpNmc5qjng=;
 b=EeGJUfoIx+4/8EVjhTtdWz/bzn8uh4iGKpdEzN2osM+QAvU/HgV+sjzZ
 vTBQIzFFRfWVJChEbPJhpUpeXeWMJGLsR2u3E0Bp7DUrY4vjP70a/rL+v
 /4s4fasJQAIK729F+TD1wZ+w0SmSIgqMB5U1DUIizxKZNJ7nJh3BQSOH4
 andlx2+72KyqZ1plzfx0yMivO647e15DYwsh/V4U8PcZRMfzlkA81e2qC
 ghiIHLCNhUelSohgyFHu0MfsOQ80wzmCTxu6J3DvFcyPXSvWUeBSGdByI
 3XgK+s5qUUykNDm4G0OUoAMHUojiJbhFCPuxnOOIf+YL9G5qMpLsV/qE4 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10789"; a="359589895"
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; d="scan'208";a="359589895"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Aug 2023 04:00:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="872438426"
Received: from kuha.fi.intel.com ([10.237.72.185])
 by fmsmga001.fm.intel.com with SMTP; 02 Aug 2023 04:00:19 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation);
 Wed, 02 Aug 2023 14:00:16 +0300
Date: Wed, 2 Aug 2023 14:00:16 +0300
From: Heikki Krogerus <heikki.krogerus@linux.intel.com>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 3/3] usb: typec: nb7vpq904m: switch to DRM_SIMPLE_BRIDGE
Message-ID: <ZMo3QDym4Nteu8Tj@kuha.fi.intel.com>
References: <20230802011845.4176631-1-dmitry.baryshkov@linaro.org>
 <20230802011845.4176631-4-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230802011845.4176631-4-dmitry.baryshkov@linaro.org>
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
Cc: Kishon Vijay Abraham I <kishon@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-usb@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Vinod Koul <vkoul@kernel.org>, Andy Gross <agross@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 02, 2023 at 04:18:45AM +0300, Dmitry Baryshkov wrote:
> Switch to using the new DRM_SIMPLE_BRIDGE helper to create the
> transparent DRM bridge device instead of handcoding corresponding
> functionality.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

> ---
>  drivers/usb/typec/mux/Kconfig      |  2 +-
>  drivers/usb/typec/mux/nb7vpq904m.c | 44 ++----------------------------
>  2 files changed, 3 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/usb/typec/mux/Kconfig b/drivers/usb/typec/mux/Kconfig
> index 784b9d8107e9..350a7ffce67e 100644
> --- a/drivers/usb/typec/mux/Kconfig
> +++ b/drivers/usb/typec/mux/Kconfig
> @@ -39,7 +39,7 @@ config TYPEC_MUX_NB7VPQ904M
>  	tristate "On Semiconductor NB7VPQ904M Type-C redriver driver"
>  	depends on I2C
>  	depends on DRM || DRM=n
> -	select DRM_PANEL_BRIDGE if DRM
> +	select DRM_SIMPLE_BRIDGE if DRM
>  	select REGMAP_I2C
>  	help
>  	  Say Y or M if your system has a On Semiconductor NB7VPQ904M Type-C
> diff --git a/drivers/usb/typec/mux/nb7vpq904m.c b/drivers/usb/typec/mux/nb7vpq904m.c
> index 9360b65e8b06..c89a956412ea 100644
> --- a/drivers/usb/typec/mux/nb7vpq904m.c
> +++ b/drivers/usb/typec/mux/nb7vpq904m.c
> @@ -11,7 +11,7 @@
>  #include <linux/regmap.h>
>  #include <linux/bitfield.h>
>  #include <linux/of_graph.h>
> -#include <drm/drm_bridge.h>
> +#include <drm/display/drm_simple_bridge.h>
>  #include <linux/usb/typec_dp.h>
>  #include <linux/usb/typec_mux.h>
>  #include <linux/usb/typec_retimer.h>
> @@ -70,8 +70,6 @@ struct nb7vpq904m {
>  	bool swap_data_lanes;
>  	struct typec_switch *typec_switch;
>  
> -	struct drm_bridge bridge;
> -
>  	struct mutex lock; /* protect non-concurrent retimer & switch */
>  
>  	enum typec_orientation orientation;
> @@ -297,44 +295,6 @@ static int nb7vpq904m_retimer_set(struct typec_retimer *retimer, struct typec_re
>  	return ret;
>  }
>  
> -#if IS_ENABLED(CONFIG_OF) && IS_ENABLED(CONFIG_DRM_PANEL_BRIDGE)
> -static int nb7vpq904m_bridge_attach(struct drm_bridge *bridge,
> -				    enum drm_bridge_attach_flags flags)
> -{
> -	struct nb7vpq904m *nb7 = container_of(bridge, struct nb7vpq904m, bridge);
> -	struct drm_bridge *next_bridge;
> -
> -	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
> -		return -EINVAL;
> -
> -	next_bridge = devm_drm_of_get_bridge(&nb7->client->dev, nb7->client->dev.of_node, 0, 0);
> -	if (IS_ERR(next_bridge)) {
> -		dev_err(&nb7->client->dev, "failed to acquire drm_bridge: %pe\n", next_bridge);
> -		return PTR_ERR(next_bridge);
> -	}
> -
> -	return drm_bridge_attach(bridge->encoder, next_bridge, bridge,
> -				 DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> -}
> -
> -static const struct drm_bridge_funcs nb7vpq904m_bridge_funcs = {
> -	.attach	= nb7vpq904m_bridge_attach,
> -};
> -
> -static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
> -{
> -	nb7->bridge.funcs = &nb7vpq904m_bridge_funcs;
> -	nb7->bridge.of_node = nb7->client->dev.of_node;
> -
> -	return devm_drm_bridge_add(&nb7->client->dev, &nb7->bridge);
> -}
> -#else
> -static int nb7vpq904m_register_bridge(struct nb7vpq904m *nb7)
> -{
> -	return 0;
> -}
> -#endif
> -
>  static const struct regmap_config nb7_regmap = {
>  	.max_register = 0x1f,
>  	.reg_bits = 8,
> @@ -461,7 +421,7 @@ static int nb7vpq904m_probe(struct i2c_client *client)
>  
>  	gpiod_set_value(nb7->enable_gpio, 1);
>  
> -	ret = nb7vpq904m_register_bridge(nb7);
> +	ret = drm_simple_bridge_register(dev);
>  	if (ret)
>  		return ret;
>  
> -- 
> 2.39.2

-- 
heikki
