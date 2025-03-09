Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9602DA58137
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 07:52:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556B610E081;
	Sun,  9 Mar 2025 06:52:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 785 seconds by postgrey-1.36 at gabe;
 Sun, 09 Mar 2025 06:52:32 UTC
Received: from bg1.exmail.qq.com (bg1.exmail.qq.com [114.132.67.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F26710E081
 for <dri-devel@lists.freedesktop.org>; Sun,  9 Mar 2025 06:52:32 +0000 (UTC)
X-QQ-mid: bizesmtpip2t1741503090t8sbs1w
X-QQ-Originating-IP: XwhKMfl3zf720/W1DEA9jiyONxzExdR32tccPWBx8ps=
Received: from [IPV6:240f:10b:7440:1:893e:bed3 ( [localhost])
 by bizesmtp.qq.com (ESMTP) with 
 id ; Sun, 09 Mar 2025 14:51:24 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12559739766669339929
Message-ID: <4F8F58DC9699ED12+95e301f9-a9f1-4f6b-8b8f-21c6c1df5cc2@radxa.com>
Date: Sun, 9 Mar 2025 15:51:24 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] drm/bridge: synopsys: Add DW DPTX Controller support
 library
To: Andy Yan <andyshrk@163.com>, heiko@sntech.de
Cc: neil.armstrong@linaro.org, sebastian.reichel@collabora.com,
 devicetree@vger.kernel.org, hjc@rock-chips.com, mripard@kernel.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 yubing.zhang@rock-chips.com, dri-devel@lists.freedesktop.org,
 Andy Yan <andy.yan@rock-chips.com>, krzk+dt@kernel.org, robh@kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250223113036.74252-1-andyshrk@163.com>
 <20250223113036.74252-3-andyshrk@163.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250223113036.74252-3-andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: N4WhQbLQyIqS188IzcypNGG75bD7D7grAHlZbfB5iQ737s2ShidHPf3W
 D24PZj6r/6fo1zR2GVFe7nBZap1F332I3LLeXM28iN/kWjEoyUfqulM4bH9FWFsl5S0T6ww
 qNyPAr6p9XGHZJFvYmDKzwYG/htRkFuieVUWJbHyXGS5WC+EwowByO9PyG0cNPd9LJlyMh2
 PuxPJWcIq+1FvoeOQsbwGr7tRrp3sMHL/ScmimrdwU0WheNOQ3fLL4pnuOl9I8rQwPhNadZ
 1hPmlBtpS1L4xzD7k8wg7SQ4gd6IktVan1U5PFxv0pMWdJXwVnWJyOCS5fhPVPs9zR9l5we
 fCDkk2XQvQTM08CQ6v6RaceEyHnm0sLXfODMJx2VO9U1mToOiEYJCRZXkkSPfYr2kih3M+Z
 MbzGu2cvQZ6iEe2jmvFpy2gPQBK8vij/LYnb1NrHRtvF6LyUJIsjv0/ibQMRB2uARsDwBZh
 mX/IYyt/lY/uHnPquQvDyKrWB8FD/d8K5D9Y6SQXrkLmAEw16mTKoivN13ejc+YKVi3hdFQ
 m2TOSrPI5klyA9RJB6vuR6db4gwtrCL48YhX/KxXMdKlqw2+SENy90n0HWQm0L7wqA9jbVN
 Nc3/JElAHGMkqWWMLX7NoXshqNEnM9lFs2d/TA6CfoTB9G6hIkKo2h4cnECT/ByTLfUOVIl
 P6CXFU2iK34H3di42fvDo2RJjUzZ5BI+ZezGZgdZAFn/QBQ7d3RqeuKSzy7RoOvDgcWSCPs
 uSHWV7LbrW4AzkW9k9Gg4ETOvtI5WVRPGvaX0zvLqS+0zvIzuHK3Ry41RKpO6zDgo+9QFwq
 GfOIA4JUks/+t+lanrl1b+VH2odcLYnqYzUV6qYTWiS6Uk51kO+NGQAl0LQVUvtGrGn5YVd
 K4UF1MK7y/H6OOVnAzbdkGtEU8+orOekqPwsNjujZyMP86lPYx0FZg==
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
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

Hi Andy,

On 2/23/25 20:30, Andy Yan wrote:
(snip)
> +struct dw_dp *dw_dp_bind(struct device *dev, struct drm_encoder *encoder,
> +			 const struct dw_dp_plat_data *plat_data)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct dw_dp *dp;
> +	struct drm_bridge *bridge;
> +	void __iomem *res;
> +	int ret;
> +
> +	dp = devm_kzalloc(dev, sizeof(*dp), GFP_KERNEL);
> +	if (!dp)
> +		return ERR_PTR(-ENOMEM);
> +
> +	dp->dev = dev;
> +	dp->video.pixel_mode = DW_DP_MP_QUAD_PIXEL;
> +
> +	dp->plat_data = plat_data;
> +	bridge = &dp->bridge;
> +	mutex_init(&dp->irq_lock);
> +	INIT_WORK(&dp->hpd_work, dw_dp_hpd_work);
> +	init_completion(&dp->complete);
> +
> +	res = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(res))
> +		return ERR_CAST(res);
> +
> +	dp->regmap = devm_regmap_init_mmio(dev, res, &dw_dp_regmap_config);
> +	if (IS_ERR(dp->regmap)) {
> +		dev_err_probe(dev, PTR_ERR(dp->regmap), "failed to create regmap\n");
> +		return ERR_CAST(dp->regmap);
> +	}
> +
> +	dp->phy = devm_of_phy_get(dev, dev->of_node, NULL);
> +	if (IS_ERR(dp->phy)) {
> +		dev_err_probe(dev, PTR_ERR(dp->phy), "failed to get phy\n");
> +		return ERR_CAST(dp->phy);
> +	}
> +
> +	dp->apb_clk = devm_clk_get_enabled(dev, "apb");
> +	if (IS_ERR(dp->apb_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->apb_clk), "failed to get apb clock\n");
> +		return ERR_CAST(dp->apb_clk);
> +	}
> +
> +	dp->aux_clk = devm_clk_get_enabled(dev, "aux");
> +	if (IS_ERR(dp->aux_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->aux_clk), "failed to get aux clock\n");
> +		return ERR_CAST(dp->aux_clk);
> +	}
> +
> +	dp->i2s_clk = devm_clk_get(dev, "i2s");
> +	if (IS_ERR(dp->i2s_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->i2s_clk), "failed to get i2s clock\n");
> +		return ERR_CAST(dp->i2s_clk);
> +	}
> +
> +	dp->spdif_clk = devm_clk_get(dev, "spdif");
> +	if (IS_ERR(dp->spdif_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->spdif_clk), "failed to get spdif clock\n");
> +		return ERR_CAST(dp->spdif_clk);
> +	}
> +
> +	dp->hdcp_clk = devm_clk_get(dev, "hdcp");
> +	if (IS_ERR(dp->hdcp_clk)) {
> +		dev_err_probe(dev, PTR_ERR(dp->hdcp_clk), "failed to get hdcp clock\n");
> +		return ERR_CAST(dp->hdcp_clk);
> +	}
> +
> +	dp->rstc = devm_reset_control_get(dev, NULL);
> +	if (IS_ERR(dp->rstc)) {
> +		dev_err_probe(dev, PTR_ERR(dp->rstc), "failed to get reset control\n");
> +		return ERR_CAST(dp->rstc);
> +	}
> +
> +	dp->irq = platform_get_irq(pdev, 0);
> +	if (dp->irq < 0)
> +		return ERR_PTR(ret);
> +
> +	ret = devm_request_threaded_irq(dev, dp->irq, NULL, dw_dp_irq,
> +					IRQF_ONESHOT, dev_name(dev), dp);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "failed to request irq\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	bridge->of_node = dev->of_node;
> +	bridge->funcs = &dw_dp_bridge_funcs;
> +	bridge->ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
> +	bridge->type = DRM_MODE_CONNECTOR_DisplayPort;
> +	bridge->ycbcr_420_allowed = true;
> +	bridge->vendor = "Synopsys";
> +	bridge->product = "DW DP TX";
> +
> +	platform_set_drvdata(pdev, dp);
> +
> +	dp->aux.dev = dev;
> +	dp->aux.drm_dev = encoder->dev;
> +	dp->aux.name = dev_name(dev);
> +	dp->aux.transfer = dw_dp_aux_transfer;
> +	ret = drm_dp_aux_register(&dp->aux);
> +	if (ret) {
> +		dev_err_probe(dev, ret, "Aux register failed\n");
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
> +	if (ret)
> +		dev_err_probe(dev, ret, "Failed to attach bridge\n");
> +
> +	dw_dp_init_hw(dp);
> +
> +	return dp;
> +}

EXPORT_SYMBOL_GPL(dw_dp_bind);

is required to build it as a module.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.
