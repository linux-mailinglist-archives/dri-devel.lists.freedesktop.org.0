Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AA8B8527B03
	for <lists+dri-devel@lfdr.de>; Mon, 16 May 2022 02:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9F3610F325;
	Mon, 16 May 2022 00:38:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80DC410F325
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 00:38:13 +0000 (UTC)
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20220516003810epoutp021e67d0f3582b57ec28bbcf475e330106~vbt6nmJoR2134021340epoutp02I
 for <dri-devel@lists.freedesktop.org>; Mon, 16 May 2022 00:38:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20220516003810epoutp021e67d0f3582b57ec28bbcf475e330106~vbt6nmJoR2134021340epoutp02I
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1652661490;
 bh=HBIGweGRh7wg1uYBKnzZ9aHR1vAvSeMCU7BAAigS5mc=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=uECcn/v37eTjxg8ZLB1/PLTZ6pBZ/kMo1ApCc9fSAvl8hu85lrmR93hZ+yEr9kT8j
 H6yXuz/8Kb8TSHjVDOoPN5YyxQm7H5xD1tr1VeVOvg+i5g4afww0CWEVr9AEzakQev
 YW2XxwNgNHRfjlE0UuIMrtm7q4R5FvqfZOLrr9hk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20220516003810epcas1p407018727d2846659ac977a26a958b03c~vbt6Qt7nN0345303453epcas1p4k;
 Mon, 16 May 2022 00:38:10 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.38.232]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4L1gMj2RC5z4x9Q5; Mon, 16 May
 2022 00:38:09 +0000 (GMT)
Received: from epcas1p1.samsung.com ( [182.195.41.45]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 01.27.09785.DEC91826; Mon, 16 May 2022 09:38:05 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220516003805epcas1p19d48a295c442b3da6f2f52fc1deb36c1~vbt1nFHBQ2792327923epcas1p1J;
 Mon, 16 May 2022 00:38:05 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220516003805epsmtrp2f3a1b7c00601d7741430d97ee1c2ffac~vbt1mRBE_1881318813epsmtrp2H;
 Mon, 16 May 2022 00:38:05 +0000 (GMT)
X-AuditID: b6c32a36-c87ff70000002639-03-62819cedb921
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 8B.C7.11276.DEC91826; Mon, 16 May 2022 09:38:05 +0900 (KST)
Received: from [10.113.221.211] (unknown [10.113.221.211]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220516003805epsmtip23349207ec6474e5246df20a183ce3496~vbt1Xdc3G0760207602epsmtip2V;
 Mon, 16 May 2022 00:38:05 +0000 (GMT)
Message-ID: <d83c9944-da93-e445-0831-9bcac69c733c@samsung.com>
Date: Mon, 16 May 2022 09:50:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH] drm/exynos: mic: Rework initialization
Content-Language: en-US
To: Marek Szyprowski <m.szyprowski@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org
From: Inki Dae <inki.dae@samsung.com>
In-Reply-To: <20220513083105.9456-1-m.szyprowski@samsung.com>
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFJsWRmVeSWpSXmKPExsWy7bCmru7bOY1JBg0vdS2ufH3PZvFl0wQ2
 i72vt7JbzDi/j8li7ZG77BafZj1ktpgx+SWbA7vH2o/3WT3uXNvD5nG/+ziTR9+WVYwenzfJ
 BbBGZdtkpCampBYppOYl56dk5qXbKnkHxzvHm5oZGOoaWlqYKynkJeam2iq5+AToumXmAJ2h
 pFCWmFMKFApILC5W0rezKcovLUlVyMgvLrFVSi1IySkwLdArTswtLs1L18tLLbEyNDAwMgUq
 TMjOuDh7F3vBJ52KiQ09rA2M01S6GDk5JARMJPbPmMzSxcjFISSwg1Hi+c0tbBDOJ0aJ1fsn
 MkM43xglWndOZ4FpebT2JCNEYi+jxJR53ewQzntGidONnawgVbwCdhLTpjxiA7FZBFQlOhov
 skDEBSVOznwCZosKREhMm3UGrEZYwFpi/+w2dhCbWUBc4taT+UwgtohAqcTc/8eg4psZJb59
 KgCx2YBmTlxxH6yXU8BWYnfjDqgaeYnmrbPBzpYQ6OWQOHe+mRHibBeJjTc3sELYwhKvjm9h
 h7ClJD6/28sG0TCZUeLO9RUsEM4MRonDP69DdRtL7F86GegkDqAVmhLrd+lDhBUldv6eywix
 mU/i3dceVpASCQFeiY42IYgSJYljF29ATZGQuLBkIhuE7SHxZF8r+wRGxVlI4TILyf+zkPwz
 C2HxAkaWVYxiqQXFuempxYYFRvD4Ts7P3cQITqRaZjsYJ739oHeIkYmD8RCjBAezkgivQUVD
 khBvSmJlVWpRfnxRaU5q8SFGU2DsTGSWEk3OB6byvJJ4QxNLAxMzI2MTC0MzQyVx3lXTTicK
 CaQnlqRmp6YWpBbB9DFxcEo1MHU5Z009einrNfvjP5meOYtzWt7JnKqXFDFfMsdUpHAlo+3j
 /zNU34ewNCzQWOn54vurSb/DLTKefFkZ0mhoNNGAibflteTRH6dvCZ9xZDZ7M8Pf6hb/zu7F
 e4+FPb34mC3wvkSYxf7rjexTngmWrDfcEj316s4kfz613rrrE9bFn3hz1+RJRre2ieG2RX1f
 0yTmxDIvO79DylDO6EXNmkufeXUMVXp+BWkk5WofUP7y5t2EzxP5fz5St/ldZBvHtrEiKS90
 udmWbqHtvEz55yueBKYYXtx4a5mX8BIm09C7W4pWzAo/zbJB++qt9nl9VsbaGgurPhp5nneP
 mvsty4rdkadbb3dgnfrnI0YVQkosxRmJhlrMRcWJABKp1MUtBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrKLMWRmVeSWpSXmKPExsWy7bCSvO7bOY1JBtdviVtc+fqezeLLpgls
 Fntfb2W3mHF+H5PF2iN32S0+zXrIbDFj8ks2B3aPtR/vs3rcubaHzeN+93Emj74tqxg9Pm+S
 C2CN4rJJSc3JLEst0rdL4Mq4OHsXe8EnnYqJDT2sDYzTVLoYOTkkBEwkHq09ydjFyMUhJLCb
 UeLysyVADgdQQkJiy1YOCFNY4vDhYoiSt4wSF2beYQbp5RWwk5g25REbiM0ioCrR0XiRBSIu
 KHFy5hMwW1QgQuLB7rOsILawgLXE/tlt7CA2s4C4xK0n85lAbBGBUolX/ffBbmAW2Mwo8e3I
 fTaIbRMYJZpbJjGCVLEBbZi44j7YNk4BW4ndjTvYQa5jFlCXWD9PCGKovETz1tnMExiFZiG5
 YxaSfbMQOmYh6VjAyLKKUTK1oDg3PbfYsMAwL7Vcrzgxt7g0L10vOT93EyM4ZrQ0dzBuX/VB
 7xAjEwfjIUYJDmYlEV6DioYkId6UxMqq1KL8+KLSnNTiQ4zSHCxK4rwXuk7GCwmkJ5akZqem
 FqQWwWSZODilGpj6roXM6524UYK3lWth6sRcPqmG5WvTXjKcfF9oINvm83zBxqqvpxi+/Zkk
 /0Lzt29y7M58x8ndoQ8ltLij4hcVx8YLy3kYfXPIW1TXWne37YZgQ3br9b/ipfe2Tdwquvyr
 hch0+U/zdt/6ta7UPnONx2sZsYSSzrDymzeK7+jOfsPnmKTnq9Tr1Vme90tskjCrw8dJxqu1
 mS7Xt4W0M+/ezHx9zvKSt0+zHNTT1Nw2cq+LtzyZfax9xZXZIpfay7umOSVwhbXWfvh7+5L2
 /az9u5acFbAP2LDrR2966PbIrNeWOoHn+dyVo6WXMk0tqRPzbG1OnL9t2w2RCgMpL03hRoY/
 P6+W2NTXq5Q1K7EUZyQaajEXFScCAEwXQHoIAwAA
X-CMS-MailID: 20220516003805epcas1p19d48a295c442b3da6f2f52fc1deb36c1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20220513083244eucas1p115ea99c134d62692389303b8116702be
References: <CGME20220513083244eucas1p115ea99c134d62692389303b8116702be@eucas1p1.samsung.com>
 <20220513083105.9456-1-m.szyprowski@samsung.com>
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek,

22. 5. 13. 17:31에 Marek Szyprowski 이(가) 쓴 글:
> Commit dd8b6803bc49 ("exynos: drm: dsi: Attach in_bridge in MIC driver")
> moved Exynos MIC attaching from DSI to MIC driver. However the method
> proposed there is incomplete and cannot really work. To properly attach
> it to the bridge chain, access to the respective encoder is needed. The
> Exynos MIC driver always attaches to the encoder created by the Exynos
> DSI driver, so grab it via available helpers for getting access to the
> CRTC and encoders. This also requires to change the order of driver
> component binding to let DSI to be bound before MIC.
> 
> Fixes: dd8b6803bc49 ("exynos: drm: dsi: Attach in_bridge in MIC driver")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
> A few words of comment. The mentioned commit has my Tested-by tag and
> indeed I gave it. However that time due to remote work and incorrect
> camera configuration in the office I was not able to check if the board
> really produces valid display, I only checked if it boots and reports
> valid DRM structures to the userspace.
> 
> If possible, please merge this to the drm-misc-next together with the
> rest of Exynos DSI to drm bridge rework patches.

The commit-id, dd8b6803bc49, has already been merged to drm-next. Seems no need to go drm-misc-next.
So I will merge it as a regression fix after the review, which will be merged to 5.19-rc series.
Please let me know if there is my missing something.

Thanks,
Inki Dae

> ---
>  drivers/gpu/drm/exynos/exynos_drm_drv.c |  6 ++--
>  drivers/gpu/drm/exynos/exynos_drm_mic.c | 42 +++++++------------------
>  2 files changed, 15 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> index 424ea23eec32..16c539657f73 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
> @@ -176,15 +176,15 @@ static struct exynos_drm_driver_info exynos_drm_drivers[] = {
>  	}, {
>  		DRV_PTR(mixer_driver, CONFIG_DRM_EXYNOS_MIXER),
>  		DRM_COMPONENT_DRIVER
> -	}, {
> -		DRV_PTR(mic_driver, CONFIG_DRM_EXYNOS_MIC),
> -		DRM_COMPONENT_DRIVER
>  	}, {
>  		DRV_PTR(dp_driver, CONFIG_DRM_EXYNOS_DP),
>  		DRM_COMPONENT_DRIVER
>  	}, {
>  		DRV_PTR(dsi_driver, CONFIG_DRM_EXYNOS_DSI),
>  		DRM_COMPONENT_DRIVER
> +	}, {
> +		DRV_PTR(mic_driver, CONFIG_DRM_EXYNOS_MIC),
> +		DRM_COMPONENT_DRIVER
>  	}, {
>  		DRV_PTR(hdmi_driver, CONFIG_DRM_EXYNOS_HDMI),
>  		DRM_COMPONENT_DRIVER
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_mic.c b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> index 9e06f8e2a863..09ce28ee08d9 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_mic.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_mic.c
> @@ -26,6 +26,7 @@
>  #include <drm/drm_print.h>
>  
>  #include "exynos_drm_drv.h"
> +#include "exynos_drm_crtc.h"
>  
>  /* Sysreg registers for MIC */
>  #define DSD_CFG_MUX	0x1004
> @@ -100,9 +101,7 @@ struct exynos_mic {
>  
>  	bool i80_mode;
>  	struct videomode vm;
> -	struct drm_encoder *encoder;
>  	struct drm_bridge bridge;
> -	struct drm_bridge *next_bridge;
>  
>  	bool enabled;
>  };
> @@ -229,8 +228,6 @@ static void mic_set_reg_on(struct exynos_mic *mic, bool enable)
>  	writel(reg, mic->reg + MIC_OP);
>  }
>  
> -static void mic_disable(struct drm_bridge *bridge) { }
> -
>  static void mic_post_disable(struct drm_bridge *bridge)
>  {
>  	struct exynos_mic *mic = bridge->driver_private;
> @@ -297,34 +294,30 @@ static void mic_pre_enable(struct drm_bridge *bridge)
>  	mutex_unlock(&mic_mutex);
>  }
>  
> -static void mic_enable(struct drm_bridge *bridge) { }
> -
> -static int mic_attach(struct drm_bridge *bridge,
> -		      enum drm_bridge_attach_flags flags)
> -{
> -	struct exynos_mic *mic = bridge->driver_private;
> -
> -	return drm_bridge_attach(bridge->encoder, mic->next_bridge,
> -				 &mic->bridge, flags);
> -}
> -
>  static const struct drm_bridge_funcs mic_bridge_funcs = {
> -	.disable = mic_disable,
>  	.post_disable = mic_post_disable,
>  	.mode_set = mic_mode_set,
>  	.pre_enable = mic_pre_enable,
> -	.enable = mic_enable,
> -	.attach = mic_attach,
>  };
>  
>  static int exynos_mic_bind(struct device *dev, struct device *master,
>  			   void *data)
>  {
>  	struct exynos_mic *mic = dev_get_drvdata(dev);
> +	struct drm_device *drm_dev = data;
> +	struct exynos_drm_crtc *crtc = exynos_drm_crtc_get_by_type(drm_dev,
> +						       EXYNOS_DISPLAY_TYPE_LCD);
> +	struct drm_encoder *e, *encoder = NULL;
> +
> +	drm_for_each_encoder(e, drm_dev)
> +		if (e->possible_crtcs == drm_crtc_mask(&crtc->base))
> +			encoder = e;
> +	if (!encoder)
> +		return -ENODEV;
>  
>  	mic->bridge.driver_private = mic;
>  
> -	return 0;
> +	return drm_bridge_attach(encoder, &mic->bridge, NULL, 0);
>  }
>  
>  static void exynos_mic_unbind(struct device *dev, struct device *master,
> @@ -388,7 +381,6 @@ static int exynos_mic_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
>  	struct exynos_mic *mic;
> -	struct device_node *remote;
>  	struct resource res;
>  	int ret, i;
>  
> @@ -432,16 +424,6 @@ static int exynos_mic_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	remote = of_graph_get_remote_node(dev->of_node, 1, 0);
> -	mic->next_bridge = of_drm_find_bridge(remote);
> -	if (IS_ERR(mic->next_bridge)) {
> -		DRM_DEV_ERROR(dev, "mic: Failed to find next bridge\n");
> -		ret = PTR_ERR(mic->next_bridge);
> -		goto err;
> -	}
> -
> -	of_node_put(remote);
> -
>  	platform_set_drvdata(pdev, mic);
>  
>  	mic->bridge.funcs = &mic_bridge_funcs;
