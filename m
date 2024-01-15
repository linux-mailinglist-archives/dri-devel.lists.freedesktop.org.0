Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0D182D53D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 09:45:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC95A10E22D;
	Mon, 15 Jan 2024 08:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F3B210E20E
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 08:45:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-40e7fce1abcso613975e9.2
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 00:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705308312; x=1705913112; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=MkvUp3r4BoZpuzEzE3dqcWkeQdN+VmBZ+WCi4HFTClE=;
 b=d7uDtd8Xk4TMx+BV/ZXkfYjlT4ftf0oQ0Uldtg+MB4yWsq/zwfgyIlKEPvolJye+ge
 SPbAWP4i1aWVPLtTKLJSmVYUl7D/tjf5wIB9M+jzWJFVOiQ4oqyVEC522rqVs/PpEyAh
 AWOm/rzdIN9ikSV/6sPRNy3+MFLxbuTuiATVYSw4RI2L74+SqbW3Ew7AaeBm5d99is76
 A7cENmrZIwgV4fXOeY4yjS3/t5QuVW0KeDR6WPNGUB6LCx3WRcJoh087gMVFd9kx7neu
 TdcdaHyg/TRkQQhd6fQO+mCrWQUiapV8lPayRjIsvP7Hw0wW/8sx+NyfALdqTiG6+CKS
 2paw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705308312; x=1705913112;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=MkvUp3r4BoZpuzEzE3dqcWkeQdN+VmBZ+WCi4HFTClE=;
 b=fnnHEbOoeRYQzpIUjf+F6iqgSYugszyGjpQAGctduumFrKbvW0HnbgaGNuksJtEIwS
 tpFUTabnuDAW76LldliRiJ4diNmlnO746FVov9CGUgowvEaZ+3MhvU9pp1oIE+zxG/Ca
 2AQ/8OYcKIAAXyfQC7y49DN4LOiaTXBXpLL1VyX9ot0xN68tCaJKzGwr79v+0KmfXOzQ
 K2dm4WXUJazaZe4i7K9RAuDM/lmoTjdu60ZmwigJpL+yPGdteoPanvpoik9x8dKQJt7g
 +leLaaSwflSgGJkGlYnttpBkN0i3m2YxrcvrFsCQvR2cJjQHv5m8XzLcRCVkDU3vE1TF
 nw4g==
X-Gm-Message-State: AOJu0YxOLDuKi32q+rzIg1x1tDVeQqWxz9F0irQzD3JMVSW8qhmz5KqF
 5lQ7y5r7S6R/uyPYx7TXjrPoiZAzwx/jUg==
X-Google-Smtp-Source: AGHT+IFzDJllfxrskx0EeLYqcR/JG0o5oDu+AhtJ2Rufm6ow1NgQUK2RTAW7KX62LW9mxQUFctMV1w==
X-Received: by 2002:a05:600c:3585:b0:40e:4556:5870 with SMTP id
 p5-20020a05600c358500b0040e45565870mr2875085wmq.120.1705308311739; 
 Mon, 15 Jan 2024 00:45:11 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:af6f:bcbb:3c88:33c2?
 ([2a01:e0a:982:cbb0:af6f:bcbb:3c88:33c2])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a7bca5a000000b0040e54381a85sm14669897wml.26.2024.01.15.00.45.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 00:45:11 -0800 (PST)
Message-ID: <9dd100de-6d33-4872-8619-1df6ee520c5a@linaro.org>
Date: Mon, 15 Jan 2024 09:45:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH] drm/bridge: synopsys: dw-mipi-dsi: fix deferred dsi host
 probe breaks dsi device probe
Content-Language: en-US, fr
To: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>,
 victor.liu@nxp.com, andrzej.hajda@intel.com, rfoss@kernel.org,
 jonas@kwiboo.se, jernej.skrabec@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, daniel@ffwll.ch, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, khilman@baylibre.com, jbrunet@baylibre.com,
 martin.blumenstingl@googlemail.com, hjc@rock-chips.com, heiko@sntech.de,
 yannick.fertre@foss.st.com, raphael.gallais-pou@foss.st.com,
 philippe.cornu@foss.st.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com
References: <20240112180737.551318-1-farouk.bouabid@theobroma-systems.com>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <20240112180737.551318-1-farouk.bouabid@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Reply-To: neil.armstrong@linaro.org
Cc: bouabid.farouk97@gmail.com, quentin.schulz@theobroma-systems.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 12/01/2024 19:07, Farouk Bouabid wrote:
> dw-mipi-dsi based drivers such as dw-mipi-dsi-rockchip or dw_mipi_dsi-stm
> depend on dw_mipi_dsi_probe() to initialize the dw_mipi_dsi driver
> structure (dmd pointer). This structure is only initialized once
> dw_mipi_dsi_probe() returns, creating the link between the locally created
> structure and the actual dmd pointer.
> 
> Probing the dsi host can be deferred in case of dependency to a dsi
> phy-supply (eg. "rockchip,px30-dsi-dphy"). Meanwhile dsi-device drivers
> like panels (eg. "ltk050h3146w") can already be registered on the bus.
> In that case, when attempting, to register the dsi host from
> dw_mipi_dsi_probe() using mipi_dsi_host_register(), the panel probe is
> called with a dsi-host pointer that is still locally allocated in
> dw_mipi_dsi_probe().
> 
> While probing, the panel driver tries to attach to a dsi host
> (mipi_dsi_attach()) which calls in return for the specific dsi host
> attach hook. (e.g. dw_mipi_dsi_rockchip_host_attach()).
> dw_mipi_dsi_rockchip uses the component framework.
> In the attach hook, the host component is registered which calls in return
> for drm_bridge_attach() while trying to bind the component
> (dw_mipi_dsi_bind())

In meson_dw_mipi_dsi I simply fixed this by getting rid of components...

Neil

> 
> drm_bridge_attach() requires a valid drm bridge parameter. However, the
> drm bridge (&dmd->bridge) that will be passed, is not yet initialized since
> the dw_mipi_dsi_probe() has not yet returned. This call will fail with a
> fatal error (invalid bridge) causing the panel to not be probed again.
> 
> To simplify the issue: drm_bridge_attach() depends on the result pointer
> of dw_mipi_dsi_probe().
> While, if the dsi probe is deferred, drm_bridge_attach() is called before
> dw_mipi_dsi_probe() returns.
> 
> drm_bridge_attach+0x14/0x1ac
> dw_mipi_dsi_bind+0x24/0x30
> dw_mipi_dsi_rockchip_bind+0x258/0x378
> component_bind_all+0x118/0x248
> rockchip_drm_bind+0xb0/0x1f8
> try_to_bring_up_aggregate_device+0x168/0x1d4
> __component_add+0xa4/0x170
> component_add+0x14/0x20
> dw_mipi_dsi_rockchip_host_attach+0x54/0x144
> dw_mipi_dsi_host_attach+0x9c/0xcc
> mipi_dsi_attach+0x28/0x3c
> ltk050h3146w_probe+0x10c/0x1a4
> mipi_dsi_drv_probe+0x20/0x2c
> really_probe+0x148/0x2ac
> __driver_probe_device+0x78/0x12c
> driver_probe_device+0xdc/0x160
> __device_attach_driver+0xb8/0x134
> bus_for_each_drv+0x80/0xdc
> __device_attach+0xa8/0x1b0
> device_initial_probe+0x14/0x20
> bus_probe_device+0xa8/0xac
> device_add+0x5cc/0x778
> mipi_dsi_device_register_full+0xd8/0x198
> mipi_dsi_host_register+0x98/0x18c
> __dw_mipi_dsi_probe+0x290/0x35c
> dw_mipi_dsi_probe+0x10/0x6c
> dw_mipi_dsi_rockchip_probe+0x208/0x3e4
> platform_probe+0x68/0xdc
> really_probe+0x148/0x2ac
> __driver_probe_device+0x78/0x12c
> driver_probe_device+0xdc/0x160
> __device_attach_driver+0xb8/0x134
> bus_for_each_drv+0x80/0xdc
> __device_attach+0xa8/0x1b0
> device_initial_probe+0x14/0x20
> bus_probe_device+0xa8/0xac
> deferred_probe_work_func+0x88/0xc0
> process_one_work+0x138/0x260
> worker_thread+0x32c/0x438
> kthread+0x118/0x11c
> ret_from_fork+0x10/0x20
> ---[ end trace 0000000000000000 ]---
> 
> Fix this by initializing directly the dmd pointer in dw_mipi_dsi_probe(),
> which requires also initializting the dmd->bridge attributes that are
> required in drm_bridge_attach() before calling mipi_dsi_host_register().
> 
> Signed-off-by: Farouk Bouabid <farouk.bouabid@theobroma-systems.com>
> ---
>   drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c   |  4 +-
>   drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 42 ++++++++++---------
>   drivers/gpu/drm/meson/meson_dw_mipi_dsi.c     |  8 ++--
>   .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   |  5 +--
>   drivers/gpu/drm/stm/dw_mipi_dsi-stm.c         |  5 +--
>   include/drm/bridge/dw_mipi_dsi.h              |  5 ++-
>   6 files changed, 35 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> index 3ff30ce80c5b..469976ad3b19 100644
> --- a/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/imx/imx93-mipi-dsi.c
> @@ -881,8 +881,8 @@ static int imx93_dsi_probe(struct platform_device *pdev)
>   	dsi->pdata.priv_data = dsi;
>   	platform_set_drvdata(pdev, dsi);
>   
> -	dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
> -	if (IS_ERR(dsi->dmd))
> +	ret = dw_mipi_dsi_probe(pdev, &dsi->pdata, &dsi->dmd);
> +	if (ret < 0)
>   		return dev_err_probe(dev, PTR_ERR(dsi->dmd),
>   				     "failed to probe dw_mipi_dsi\n");
>   
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> index 824fb3c65742..306cba366ba8 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
> @@ -1184,18 +1184,19 @@ static void dw_mipi_dsi_debugfs_remove(struct dw_mipi_dsi *dsi) { }
>   
>   #endif /* CONFIG_DEBUG_FS */
>   
> -static struct dw_mipi_dsi *
> -__dw_mipi_dsi_probe(struct platform_device *pdev,
> -		    const struct dw_mipi_dsi_plat_data *plat_data)
> +int __dw_mipi_dsi_probe(struct platform_device *pdev,
> +		    const struct dw_mipi_dsi_plat_data *plat_data, struct dw_mipi_dsi **dsi_p)
>   {
>   	struct device *dev = &pdev->dev;
>   	struct reset_control *apb_rst;
>   	struct dw_mipi_dsi *dsi;
>   	int ret;
>   
> -	dsi = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> -	if (!dsi)
> -		return ERR_PTR(-ENOMEM);
> +	*dsi_p = devm_kzalloc(dev, sizeof(*dsi), GFP_KERNEL);
> +	if (!*dsi_p)
> +		return -ENOMEM;
> +
> +	dsi = *dsi_p;
>   
>   	dsi->dev = dev;
>   	dsi->plat_data = plat_data;
> @@ -1203,13 +1204,13 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>   	if (!plat_data->phy_ops->init || !plat_data->phy_ops->get_lane_mbps ||
>   	    !plat_data->phy_ops->get_timing) {
>   		DRM_ERROR("Phy not properly configured\n");
> -		return ERR_PTR(-ENODEV);
> +		return -ENODEV;
>   	}
>   
>   	if (!plat_data->base) {
>   		dsi->base = devm_platform_ioremap_resource(pdev, 0);
>   		if (IS_ERR(dsi->base))
> -			return ERR_PTR(-ENODEV);
> +			return -ENODEV;
>   
>   	} else {
>   		dsi->base = plat_data->base;
> @@ -1219,7 +1220,7 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>   	if (IS_ERR(dsi->pclk)) {
>   		ret = PTR_ERR(dsi->pclk);
>   		dev_err(dev, "Unable to get pclk: %d\n", ret);
> -		return ERR_PTR(ret);
> +		return ret;
>   	}
>   
>   	/*
> @@ -1233,14 +1234,14 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>   		if (ret != -EPROBE_DEFER)
>   			dev_err(dev, "Unable to get reset control: %d\n", ret);
>   
> -		return ERR_PTR(ret);
> +		return ret;
>   	}
>   
>   	if (apb_rst) {
>   		ret = clk_prepare_enable(dsi->pclk);
>   		if (ret) {
>   			dev_err(dev, "%s: Failed to enable pclk\n", __func__);
> -			return ERR_PTR(ret);
> +			return ret;
>   		}
>   
>   		reset_control_assert(apb_rst);
> @@ -1255,19 +1256,20 @@ __dw_mipi_dsi_probe(struct platform_device *pdev,
>   
>   	dsi->dsi_host.ops = &dw_mipi_dsi_host_ops;
>   	dsi->dsi_host.dev = dev;
> +	dsi->bridge.driver_private = dsi;
> +	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
> +	dsi->bridge.of_node = pdev->dev.of_node;
> +
>   	ret = mipi_dsi_host_register(&dsi->dsi_host);
>   	if (ret) {
>   		dev_err(dev, "Failed to register MIPI host: %d\n", ret);
>   		pm_runtime_disable(dev);
>   		dw_mipi_dsi_debugfs_remove(dsi);
> -		return ERR_PTR(ret);
> +		return ret;
>   	}
>   
> -	dsi->bridge.driver_private = dsi;
> -	dsi->bridge.funcs = &dw_mipi_dsi_bridge_funcs;
> -	dsi->bridge.of_node = pdev->dev.of_node;
>   
> -	return dsi;
> +	return 0;
>   }
>   
>   static void __dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi)
> @@ -1301,11 +1303,11 @@ EXPORT_SYMBOL_GPL(dw_mipi_dsi_get_bridge);
>   /*
>    * Probe/remove API, used from platforms based on the DRM bridge API.
>    */
> -struct dw_mipi_dsi *
> -dw_mipi_dsi_probe(struct platform_device *pdev,
> -		  const struct dw_mipi_dsi_plat_data *plat_data)
> +int dw_mipi_dsi_probe(struct platform_device *pdev,
> +		  const struct dw_mipi_dsi_plat_data *plat_data,
> +		  struct dw_mipi_dsi **dsi_p)
>   {
> -	return __dw_mipi_dsi_probe(pdev, plat_data);
> +	return __dw_mipi_dsi_probe(pdev, plat_data, dsi_p);
>   }
>   EXPORT_SYMBOL_GPL(dw_mipi_dsi_probe);
>   
> diff --git a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> index e5fe4e994f43..b103f3e31f2a 100644
> --- a/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_mipi_dsi.c
> @@ -262,6 +262,7 @@ static int meson_dw_mipi_dsi_probe(struct platform_device *pdev)
>   {
>   	struct meson_dw_mipi_dsi *mipi_dsi;
>   	struct device *dev = &pdev->dev;
> +	int ret;
>   
>   	mipi_dsi = devm_kzalloc(dev, sizeof(*mipi_dsi), GFP_KERNEL);
>   	if (!mipi_dsi)
> @@ -315,10 +316,9 @@ static int meson_dw_mipi_dsi_probe(struct platform_device *pdev)
>   	mipi_dsi->pdata.priv_data = mipi_dsi;
>   	platform_set_drvdata(pdev, mipi_dsi);
>   
> -	mipi_dsi->dmd = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata);
> -	if (IS_ERR(mipi_dsi->dmd))
> -		return dev_err_probe(dev, PTR_ERR(mipi_dsi->dmd),
> -				     "Failed to probe dw_mipi_dsi\n");
> +	ret = dw_mipi_dsi_probe(pdev, &mipi_dsi->pdata, &mipi_dsi->dmd);
> +	if (ret < 0)
> +		return dev_err_probe(dev, ret, "Failed to probe dw_mipi_dsi\n");
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> index 6396f9324dab..4df32747476c 100644
> --- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
> @@ -1457,9 +1457,8 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
>   	if (IS_ERR(phy_provider))
>   		return PTR_ERR(phy_provider);
>   
> -	dsi->dmd = dw_mipi_dsi_probe(pdev, &dsi->pdata);
> -	if (IS_ERR(dsi->dmd)) {
> -		ret = PTR_ERR(dsi->dmd);
> +	ret = dw_mipi_dsi_probe(pdev, &dsi->pdata, &dsi->dmd);
> +	if (ret < 0) {
>   		if (ret != -EPROBE_DEFER)
>   			DRM_DEV_ERROR(dev,
>   				      "Failed to probe dw_mipi_dsi: %d\n", ret);
> diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> index d5f8c923d7bc..44dbbfc277d8 100644
> --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> @@ -518,9 +518,8 @@ static int dw_mipi_dsi_stm_probe(struct platform_device *pdev)
>   
>   	platform_set_drvdata(pdev, dsi);
>   
> -	dsi->dsi = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data);
> -	if (IS_ERR(dsi->dsi)) {
> -		ret = PTR_ERR(dsi->dsi);
> +	ret = dw_mipi_dsi_probe(pdev, &dw_mipi_dsi_stm_plat_data, &dsi->dsi);
> +	if (ret < 0) {
>   		dev_err_probe(dev, ret, "Failed to initialize mipi dsi host\n");
>   		goto err_dsi_probe;
>   	}
> diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
> index 65d5e68065e3..f073e819251e 100644
> --- a/include/drm/bridge/dw_mipi_dsi.h
> +++ b/include/drm/bridge/dw_mipi_dsi.h
> @@ -76,9 +76,10 @@ struct dw_mipi_dsi_plat_data {
>   	void *priv_data;
>   };
>   
> -struct dw_mipi_dsi *dw_mipi_dsi_probe(struct platform_device *pdev,
> +int dw_mipi_dsi_probe(struct platform_device *pdev,
>   				      const struct dw_mipi_dsi_plat_data
> -				      *plat_data);
> +				      *plat_data,
> +					  struct dw_mipi_dsi **dsi_p);
>   void dw_mipi_dsi_remove(struct dw_mipi_dsi *dsi);
>   int dw_mipi_dsi_bind(struct dw_mipi_dsi *dsi, struct drm_encoder *encoder);
>   void dw_mipi_dsi_unbind(struct dw_mipi_dsi *dsi);

