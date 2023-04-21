Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B07876EA916
	for <lists+dri-devel@lfdr.de>; Fri, 21 Apr 2023 13:25:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B24010E0A8;
	Fri, 21 Apr 2023 11:25:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19E7B10E0A8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 11:25:31 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20230421112529euoutp02466c27eff30b9f8ffefec9b195795249~X74JuAd4G2263222632euoutp02Z
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Apr 2023 11:25:29 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20230421112529euoutp02466c27eff30b9f8ffefec9b195795249~X74JuAd4G2263222632euoutp02Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1682076329;
 bh=X9Uc8/wiA5Xs838ROjL7g0Ad87gfoAq/y+Io8xsD7P8=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=eF5WL1cOCRIvScF5JHW8nJ0vD/ti/rBF1RbjE0NVv45+mu+jeY/cuMORpTu4DeCjz
 K4jVR6DKk02nBJE/j7hpzJ8uhm4aN+deqYFVS0vPqyWokk4EgwYv97cUAZnBQudTZn
 2laSjYnlhk0+cDgKId+06gf6uuvR1QHeRBlZxHUE=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20230421112528eucas1p2c36a166fe8a830b0b661643a70693641~X74JUbLYJ2901129011eucas1p2l;
 Fri, 21 Apr 2023 11:25:28 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id ED.5D.09503.8A272446; Fri, 21
 Apr 2023 12:25:28 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20230421112528eucas1p202ae1e38ffbc63d3ff968ca9d8141d94~X74IyZduT3120531205eucas1p2i;
 Fri, 21 Apr 2023 11:25:28 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20230421112528eusmtrp28fd5e92e7d1e7ed2ff2de6ae20c3b1ba~X74IxqX7f1838318383eusmtrp2L;
 Fri, 21 Apr 2023 11:25:28 +0000 (GMT)
X-AuditID: cbfec7f2-ea5ff7000000251f-f9-644272a8aaad
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 9E.DD.34412.8A272446; Fri, 21
 Apr 2023 12:25:28 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20230421112527eusmtip11e24bee1308db329ce428ae9f7dab24c~X74HlSgIj0246502465eusmtip1r;
 Fri, 21 Apr 2023 11:25:26 +0000 (GMT)
Message-ID: <28219b3d-e2cc-63b1-555b-c3845300f45a@samsung.com>
Date: Fri, 21 Apr 2023 13:25:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH 3/6] drm: bridge: samsung-dsim: Fetch
 pll-clock-frequency automatically
Content-Language: en-US
To: Adam Ford <aford173@gmail.com>, dri-devel@lists.freedesktop.org
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20230415104104.5537-3-aford173@gmail.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxbVRjGc+69vb1067wUZo9MxDXDOBQKbhkngREpRK9x6rLpNMNFmvUG
 iC2QlvpBIHa6wegUC4ubK58bKKxZIatNN5AOZSuUoIxtBVwBK4EI1DJgIDg+Nm0vKv897/O+
 v/Oe5+RQuKieDKOysvNYdbZcKSEFhK3zQW90o1qmiK1vk6LhoR4cfd9/io+cgxcw5KmbJ9Aj
 WxmOam708pDrzxkSjfa/gco9BgItWAwkmqhpAqjb108g01ctBCqdHMVRSVk9H1nGBnhIv3wR
 R3daK0nkKzoG0EyLG6Dy6rs8dMJ+g4/WrlgINGkVvwgZ85yHx0w16HCm2ugkGPtiLcG0GEf4
 TMXJczymrm0KYyymEpJxGm5jzPBAG8l4TnVhzHf1nzCX713FmC/XYplSqwkw85an9tOHBYkK
 Vpn1AauWJqULMn+6f5HItdEfVSyc4evACaEeBFGQ3g2PN9fieiCgRHQjgKtVf/H9DRG9AODQ
 1CGuMQ/gnaZqUg+oAHF+Rsn5DQDarSaMK+YA1HfYCD8tpJPgalkV4QcIOhKuXk/h7GDYfW48
 MLKVZuGnFT6+fySEPgKt7Xv8Nk6LoXu8BvPrUDoFdq8tBo7H6eskHPI5AixJx0H9tJ706yA6
 HlZ8W0pycAS8Ml0ZSANpswAWrdhJLmYq/Pm4A3A6BHq7rHxOPwkftdRgHFAMYO2KZ70wAKib
 cK8TCXC4dzkQH6d3wuZWKWcnw0sDXpx7lS3wl+lg7hJbYLnt7LothCeLRNz0M9DY1fTf2h/7
 buMGIDFueBbjhvzGDXGM/++tBYQJiFmtRpXBauKy2Q9jNHKVRpudEXM0R2UB/3zknodd96+C
 Ku9cTAfAKNABIIVLQoUzsTKFSKiQf5zPqnPeU2uVrKYDbKMIiVj43N7uoyI6Q57Hvs+yuaz6
 3y5GBYXpMHHxiKVgYnO4fTrcsjP5YJriB9uy4pCr52ZskKw56olJu6oh/c12z4j7i+3PXogS
 ppT52jaN/3rk97Cb7xpmT1dt3Sd/rCWSzKqbe6270Lzv7czf4Fxq6crewVsearFzsDHRsTT+
 yoMd+de+Pnj4ckH+kgfi2x8mnhfLdqmSFjI37U47cMt9r3B/dGX6seJXawr7PptV992devmd
 BF8wGRmv7Wx3Sr2zVPZZXV1qZKEqLbr2j4XNuTmO8j1pwY7PzSV5oS8p3pLpkh8fbS42W7VO
 V3yIMtw14tUcGFvNk5a0Er0ZFdtcUQ1j1y6lFaPnI05HLMleKPgmxZZ4Zhf++o7ohKclhCZT
 HheFqzXyvwEgL8bWNwQAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsVy+t/xu7oripxSDK7P57C4c/s0s8Xuq93s
 FieuL2KyuL/4M4vF/20TmS3mHznHanHl63s2i4dX/S0m3Z/AYvFl0wQ2i+fz1zFanHxzlcVi
 1dSdLBZ9Lx4yW3ROXMJusenxNVaLrl8rmS0u75rDZvGmrZHR4v3OW4wWk+bdZLVo3XuE3eLv
 9k0sFi+2iDtIeKz9eJ/V4+XyBmaPebNOsHjs/baAxWPnrLvsHrM7ZrJ6LN7zkslj06pONo8T
 Ey4xedy5tofN4373cSaPzUvqPTa+28Hk0f/XwKNvyypGj8+b5AIEovRsivJLS1IVMvKLS2yV
 og0tjPQMLS30jEws9QyNzWOtjEyV9O1sUlJzMstSi/TtEvQyznxayVKwTaBi9pdp7A2Mrbxd
 jBwcEgImEgvf53QxcnEICSxllFi7fDZzFyMnUFxG4uS0BlYIW1jiz7UuNoii94wSV2btAEvw
 CthJ/Jk4lwVkEIuAqsSfw84QYUGJkzOfsIDYogKpEjf2/GEDsYUFYiXaH1xlBLGZBcQlbj2Z
 zwRiiwg4S5z8+40JZD6zwFE2iROPvzJDLNvOKHFj4j6wSWwChhJdb7vAJnEKmEvMXtbHBjHJ
 TKJraxfUVHmJ7W/nME9gFJqF5JBZSBbOQtIyC0nLAkaWVYwiqaXFuem5xUZ6xYm5xaV56XrJ
 +bmbGIFJaNuxn1t2MK589VHvECMTB+MhRgkOZiUR3vcGTilCvCmJlVWpRfnxRaU5qcWHGE2B
 gTGRWUo0OR+YBvNK4g3NDEwNTcwsDUwtzYyVxHk9CzoShQTSE0tSs1NTC1KLYPqYODilGpi4
 f3WGp69zONK/T8LPgf/S7h0TeXrYf/as+Dd/j2Hr27ssaeEBeqURW49vaxK6YPXe72rY3W0z
 dpswSj3RTC3Nu2KV9UwovWRNSk+b2aPSc2tWyDkzTBb+1BB5tzPsVNzERm4Frncqi1zvsSWF
 rjmuubtDo3viXLtfcXOWaizcF9ulMnNukF/SoeRfG58qPN3/4fZ/iT3bEwMEDyys2HvmnZDg
 4fM+XfNqNv44ojvTNPekRbnUltDnQtc4GRoY+Kd1X7khsKYl2dx5/cbpT1babDrV7bJQYMOj
 igBb1TijD96su/bf28E7+SyXitR8gbpDJzd8KHnXWr1m2pvHh00LjAuqOSepT7ZcaHi/7Zy9
 EktxRqKhFnNRcSIANn5Fx8sDAAA=
X-CMS-MailID: 20230421112528eucas1p202ae1e38ffbc63d3ff968ca9d8141d94
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20230415104123eucas1p103250c1748170354509932778b233900
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20230415104123eucas1p103250c1748170354509932778b233900
References: <20230415104104.5537-1-aford173@gmail.com>
 <CGME20230415104123eucas1p103250c1748170354509932778b233900@eucas1p1.samsung.com>
 <20230415104104.5537-3-aford173@gmail.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 aford@beaconembedded.com, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, marex@denx.de,
 Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, Jagan Teki <jagan@amarulasolutions.com>,
 devicetree@vger.kernel.org, Jonas Karlman <jonas@kwiboo.se>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Shawn Guo <shawnguo@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15.04.2023 12:41, Adam Ford wrote:
> Fetch the clock rate of "sclk_mipi" (or "pll_clk") instead of
> having an entry in the device tree for samsung,pll-clock-frequency.
>
> Signed-off-by: Adam Ford <aford173@gmail.com>

This one breaks DSI panel operation on my Exynos-based Trats, Trats2 and 
TM2e boards. I've didn't check the details, but probably something is 
missing in the dts to make it working properly. Surprisingly the display 
is still working fine on Arndale board with DSI TC358764 bridge.

> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 9fec32b44e05..73f0c3fbbdf5 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1744,11 +1744,6 @@ static int samsung_dsim_parse_dt(struct samsung_dsim *dsi)
>   	struct device_node *node = dev->of_node;
>   	int ret;
>   
> -	ret = samsung_dsim_of_read_u32(node, "samsung,pll-clock-frequency",
> -				       &dsi->pll_clk_rate);
> -	if (ret < 0)
> -		return ret;
> -
>   	ret = samsung_dsim_of_read_u32(node, "samsung,burst-clock-frequency",
>   				       &dsi->burst_clk_rate);
>   	if (ret < 0)
> @@ -1823,13 +1818,18 @@ int samsung_dsim_probe(struct platform_device *pdev)
>   		if (IS_ERR(dsi->clks[i])) {
>   			if (strcmp(clk_names[i], "sclk_mipi") == 0) {
>   				dsi->clks[i] = devm_clk_get(dev, OLD_SCLK_MIPI_CLK_NAME);
> -				if (!IS_ERR(dsi->clks[i]))
> +				if (!IS_ERR(dsi->clks[i])) {
> +					dsi->pll_clk_rate = clk_get_rate(dsi->clks[i]);
>   					continue;
> +				}
>   			}
>   
>   			dev_info(dev, "failed to get the clock: %s\n", clk_names[i]);
>   			return PTR_ERR(dsi->clks[i]);
>   		}
> +
> +		if (strcmp(clk_names[i], "sclk_mipi") == 0)
> +			dsi->pll_clk_rate = clk_get_rate(dsi->clks[i]);
>   	}
>   
>   	dsi->reg_base = devm_platform_ioremap_resource(pdev, 0);

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

