Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09635627B2B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Nov 2022 11:57:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7281B10E011;
	Mon, 14 Nov 2022 10:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA1A10E011
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 10:57:32 +0000 (UTC)
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20221114105730euoutp0239a304e8a02744d8e9ec54d93c36b098~nbknpLrA90114101141euoutp02o
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Nov 2022 10:57:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20221114105730euoutp0239a304e8a02744d8e9ec54d93c36b098~nbknpLrA90114101141euoutp02o
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1668423450;
 bh=4RndksB8KAJmIga3kjCPmp0KZEwzJpSMDX8SkKvrHEs=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=fWu6eO6AYs2wrhFIZLvnzM+KoVR2MUnb6HrVpduSClbEyHJE2vHud2c0ex8YOper2
 4MU/TPmyR0W4QnseNo9PMGqA1kutCzwPR/lXj/pyn3TZov9ueibrqaUfsAguHGxGJL
 X3WAVEe0dyrH13koSbIFsDspuirogthe6PaqapQo=
Received: from eusmges1new.samsung.com (unknown [203.254.199.242]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20221114105730eucas1p1b4398627ec65a3bef998f61e821b4878~nbknQj9kj3071730717eucas1p1u;
 Mon, 14 Nov 2022 10:57:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges1new.samsung.com (EUCPMTA) with SMTP id 47.E1.09561.A1F12736; Mon, 14
 Nov 2022 10:57:30 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20221114105729eucas1p102568e7a4040a0cc2349aa89f903dcc7~nbkmstKVZ2805928059eucas1p1B;
 Mon, 14 Nov 2022 10:57:29 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20221114105729eusmtrp2cc9ed0a2a9c070c178aa2769c0a945bc~nbkmrwfxW2777827778eusmtrp2X;
 Mon, 14 Nov 2022 10:57:29 +0000 (GMT)
X-AuditID: cbfec7f2-0c9ff70000002559-8d-63721f1a5142
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id FA.B5.09026.91F12736; Mon, 14
 Nov 2022 10:57:29 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20221114105724eusmtip2c0a887d76c19653f2ce8b183816f4f4c~nbkh73jtT0849408494eusmtip2E;
 Mon, 14 Nov 2022 10:57:24 +0000 (GMT)
Message-ID: <b13635de-26ce-a8e8-e38e-13c49a99312d@samsung.com>
Date: Mon, 14 Nov 2022 11:57:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v8 09/14] drm: bridge: samsung-dsim: Add
 atomic_get_input_bus_fmts
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>, Joonyoung Shim
 <jy0922.shim@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin
 Park <kyungmin.park@samsung.com>, Frieder Schrempf
 <frieder.schrempf@kontron.de>, Fancy Fang <chen.fang@nxp.com>, Tim Harvey
 <tharvey@gateworks.com>, Michael Nazzareno Trimarchi
 <michael@amarulasolutions.com>, Adam Ford <aford173@gmail.com>, Neil
 Armstrong <narmstrong@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>, Marek Vasut <marex@denx.de>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20221110183853.3678209-10-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTGfe+9vb00aXOtrn1FYpMu00HG16T2jQy2qsluMrO5ZRnGbHEV
 rq2zgLSWqXEBRD6syDqHYi8WOpCPERmz7VydjChjlo9B1TnXAdI40QmDKdDFARuO9urGf+c8
 z3nyO+/JS+HSk2QktStrL2vM0hqUpIg4f2WmPzZSYUxP4B5SaGiwF0eBumkC/T7YRKIbfz4g
 0bH6fgE6HrASKOi0kuj+8DUC9R0aF6Ijn5wRokZrO4mcd24KkGX2cxyd8rVjaLy4AKDeX1tx
 1FNQRKDrFd+RaIq7veB+Okqia11TOHo014e/ImNaJgMCpprrIpiKrk4B0192i2QucLeETFWp
 TcDUtY1iTOdPdQJm6GYbyQSOejHGdSaPOfeHB2PK3c2AmXau2iLZJnopgzXsymWN8anvi/S/
 2IPEnruKfTMNTjwftK+wgAgK0knwXsFloQWIKCndBOBj1ywWMqR0EMA7P0TzxjSAwdZHgqeJ
 nvoTGG80AnjRepfkE5MA9rVoQ7WYToUDtUeJUE3Qz0HnXDHg9aWw2zYS1p+hM+Bnbn+Ytoze
 Cr89UR/WcVoOB0ZqwoDldIsAljeUkaEGDwHK/rqNh6ZIOhFaJixhcgS9EfZVnBTyaQX8euI0
 HgpAulwEC5uKhPzem+C5xo8Jvl4Gx7zuJ3oUfHyBx0G6BEDHXOBJYwUw/7cBwE8lw6H+2QUc
 tYCIhq3fxPOyBvoPObGQDGkJ9E8s5ZeQwOPnK3FeFsPSYik/vRpy3i/+w16+eh23AiW36DDc
 ogNwi57D/c91AKIZyFmzKVPHmhKz2A/jTNpMkzlLF5eenekEC1+3d9475QH2scm4DoBRoANA
 ClcuF1dHZadLxRna/QdYY/Z2o9nAmjrASopQysXkqZh0Ka3T7mV3s+we1vjUxaiIyHwsUzy0
 Pm/fuLn2mMgzL5Cva87X2WRVK2y23Y4bSzRJhx+8I3ltp8agJ1y5aTkKiaOqK3gwugRz1D0v
 O7z5BU3lqtUzsk5SFR+sMZ/lLlntY3aQR63blNPOJKyxSH1v+zZQ8OfT2Jc78iw1qSMHombW
 x73xY4q9R9VWmbTj5eSY7oo3Y+9zaVs2Kh8GXnSrRreqZlMiX7enFRUS2w6qk1Nr/TsdhRuu
 UESuOpjh5T6qLTGSc6VLElTvVg/LU9QJiduphu7RAo9sjT7NO/Z3qVCnaB7c77qkXvme5Puz
 9xzzb+nJnLV+B2dI9rwa+5XP6LKv1bgv+tTPTh354Oo/w0rCpNcmxuBGk/ZfhK0QpykEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJKsWRmVeSWpSXmKPExsVy+t/xe7qS8kXJBj/OKFncuX2a2eL+4s8s
 Fq9vr2CzuPL1PZtF79JzrBaT7k9gsfiyaQKbxYt7F1kszja9YbfonLiE3WL5hH1sFpseX2O1
 6Pq1ktlixvl9TBZv2hoZLU4/Ws9scaqxlcXi0pTDbBafZj0Eyk5+yWZx8cQnZovvv88yO4h5
 rP14n9Vj3qwTLB5TThxh9TjXc5fNY+esu+wesztmsnos3vOSyePI1cWsHneu7WHzuN99nMlj
 85J6j43vdjB59G1ZxejxeZNcAF+Unk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWR
 qZK+nU1Kak5mWWqRvl2CXsbNuV9YCp7KV/xctom5gXGfZBcjJ4eEgInEqaVTmboYuTiEBJYy
 Snzrvc4GkZCRODmtgRXCFpb4c62LDaLoPaPE6rXXWUASvAJ2ErcWdYPZLAKqEpt+tzFCxAUl
 Ts58AhTn4BAVSJFYdyQKJCwsECGxd+pSsHJmAXGJW0/mgy0WEdjMKrH33QQwh1ngI6PEpclb
 2CG2nWOUmDV5KlgLm4ChRNfbLrDzOAWcJc5OmcYOMcpMomtrFyOELS+x/e0c5gmMQrOQHDIL
 ycZZSFpmIWlZwMiyilEktbQ4Nz232EivODG3uDQvXS85P3cTIzDNbDv2c8sOxpWvPuodYmTi
 YDzEKMHBrCTCO08mP1mINyWxsiq1KD++qDQntfgQoykwNCYyS4km5wMTXV5JvKGZgamhiZml
 gamlmbGSOK9nQUeikEB6YklqdmpqQWoRTB8TB6dUA5Mx82Jd60jzqLfn33sdXcyyyWbjZtHu
 bYwb5KLWq92e+MTfML7135RHuxb/LLqi4sxUuLqDi9t1n+1JqZ785P377/mssT626MOE38zd
 V+PPKHhyX/73c+2Cc3NcUgsvP2zbZqm+eHb3ypbJXY2Bestz+9e7N1bf4k77LMNdef9k2NRj
 G6ZePXZnb+qlDT1LT0+84Lvn6euybYoPXc9E58o9+BtyO7f6fSVLc6xz3s0vO2pn1iwLuBxj
 ek3kT4Pf9Da2rm1r1v7wjixbPNn4Smy4xQ1vCa89N73UawJP/zt2M1Jxu99l/8cuwRMaUn53
 y/qHvLaY9zqkK23dDV6Vk/4F0iez+o9ti3l9u/ofn+MPJZbijERDLeai4kQAFhZkdLwDAAA=
X-CMS-MailID: 20221114105729eucas1p102568e7a4040a0cc2349aa89f903dcc7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20221110184122eucas1p11379ff6b85cf9a66455a026259c93340
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20221110184122eucas1p11379ff6b85cf9a66455a026259c93340
References: <20221110183853.3678209-1-jagan@amarulasolutions.com>
 <CGME20221110184122eucas1p11379ff6b85cf9a66455a026259c93340@eucas1p1.samsung.com>
 <20221110183853.3678209-10-jagan@amarulasolutions.com>
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 dri-devel@lists.freedesktop.org, NXP Linux Team <linux-imx@nxp.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 10.11.2022 19:38, Jagan Teki wrote:
> Finding the right input bus format throughout the pipeline is hard
> so add atomic_get_input_bus_fmts callback and initialize with the
> proper input format from list of supported output formats.
>
> This format can be used in pipeline for negotiating bus format between
> the DSI-end of this bridge and the other component closer to pipeline
> components.
>
> List of Pixel formats are taken from,
> AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> 3.7.4 Pixel formats
> Table 14. DSI pixel packing formats
>
> v8:
> * added pixel formats supported by NXP AN13573 i.MX 8/RT MIPI DSI/CSI-2
>
> v7, v6, v5, v4:
> * none
>
> v3:
> * include media-bus-format.h
>
> v2:
> * none
>
> v1:
> * new patch
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 53 +++++++++++++++++++++++++++
>   1 file changed, 53 insertions(+)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 0fe153b29e4f..33e5ae9c865f 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -15,6 +15,7 @@
>   #include <linux/clk.h>
>   #include <linux/delay.h>
>   #include <linux/irq.h>
> +#include <linux/media-bus-format.h>
>   #include <linux/of_device.h>
>   #include <linux/phy/phy.h>
>   
> @@ -1321,6 +1322,57 @@ static void samsung_dsim_atomic_post_disable(struct drm_bridge *bridge,
>   	pm_runtime_put_sync(dsi->dev);
>   }
>   
> +/*
> + * This pixel output formats list referenced from,
> + * AN13573 i.MX 8/RT MIPI DSI/CSI-2, Rev. 0, 21 March 2022
> + * 3.7.4 Pixel formats
> + * Table 14. DSI pixel packing formats
> + */
> +static const u32 samsung_dsim_pixel_output_fmts[] = {
> +	MEDIA_BUS_FMT_UYVY8_1X16,
> +	MEDIA_BUS_FMT_RGB101010_1X30,
> +	MEDIA_BUS_FMT_RGB121212_1X36,
> +	MEDIA_BUS_FMT_RGB565_1X16,
> +	MEDIA_BUS_FMT_RGB666_1X18,
> +	MEDIA_BUS_FMT_RGB888_1X24,
> +};
> +
> +static bool samsung_dsim_pixel_output_fmt_supported(u32 fmt)
> +{
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(samsung_dsim_pixel_output_fmts); i++) {
> +		if (samsung_dsim_pixel_output_fmts[i] == fmt)
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +static u32 *
> +samsung_dsim_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
> +				       struct drm_bridge_state *bridge_state,
> +				       struct drm_crtc_state *crtc_state,
> +				       struct drm_connector_state *conn_state,
> +				       u32 output_fmt,
> +				       unsigned int *num_input_fmts)
> +{
> +	u32 *input_fmts;
> +
> +	if (!samsung_dsim_pixel_output_fmt_supported(output_fmt))
> +		return NULL;


Please add support for MEDIA_BUS_FMT_FIXED and maybe default to 
MEDIA_BUS_FMT_RGB888_1X24 if requested format is not matched.

Otherwise the above check breaks all current clients of the Samsung 
DSIM/Exynos DSI. I didn't dig into the bus matching code yet, but all 
DSI panels requests such format on my test systems...


> +
> +	*num_input_fmts = 1;
> +
> +	input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> +	if (!input_fmts)
> +		return NULL;
> +
> +	input_fmts[0] = output_fmt;
> +
> +	return input_fmts;
> +}
> +
>   static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
>   				     struct drm_bridge_state *bridge_state,
>   				     struct drm_crtc_state *crtc_state,
> @@ -1385,6 +1437,7 @@ static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {
>   	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
>   	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
>   	.atomic_reset			= drm_atomic_helper_bridge_reset,
> +	.atomic_get_input_bus_fmts	= samsung_dsim_atomic_get_input_bus_fmts,
>   	.atomic_check			= samsung_dsim_atomic_check,
>   	.atomic_pre_enable		= samsung_dsim_atomic_pre_enable,
>   	.atomic_enable			= samsung_dsim_atomic_enable,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

