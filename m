Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C99AB4E75A3
	for <lists+dri-devel@lfdr.de>; Fri, 25 Mar 2022 16:02:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAF2610E956;
	Fri, 25 Mar 2022 15:02:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CA810E949
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:02:32 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220325150231euoutp01540e66097aa5f17dde8e83ef116f617e~fp9vLESoh2551625516euoutp01f
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Mar 2022 15:02:31 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220325150231euoutp01540e66097aa5f17dde8e83ef116f617e~fp9vLESoh2551625516euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1648220551;
 bh=2e3pyRvxpfSFgJZj8gNhpXbwHMAVpxpazLSUUHzwAJw=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=b19OBaA4KyVve2SVKw65oT+ovz3QNa3teABCWAqSTicChqu+eikjkWDabRB03Voer
 zM9evMvqKKeo32jDixPkbjJ39B57ZBdrU1b2sgvvSwuZW2a0Z4fTjWq9j8jl6FByrH
 exq4RSLsavIV4+Cx5kON4lbqUKBd1hfbX5WTB7q8=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220325150230eucas1p223cc579289e3a91b9c9cb0361f873f50~fp9u3rR7L2846128461eucas1p2f;
 Fri, 25 Mar 2022 15:02:30 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 11.B2.10260.689DD326; Fri, 25
 Mar 2022 15:02:30 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220325150230eucas1p2ca3d1d04aaaa067bb3fdea7fa312f5c9~fp9ua4VJ92670926709eucas1p2m;
 Fri, 25 Mar 2022 15:02:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20220325150230eusmtrp1ed120478914d42e6e49b6c0a261b35b6~fp9uaAyPC1580115801eusmtrp1T;
 Fri, 25 Mar 2022 15:02:30 +0000 (GMT)
X-AuditID: cbfec7f5-bf3ff70000002814-b1-623dd986feea
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 87.3D.09522.689DD326; Fri, 25
 Mar 2022 15:02:30 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20220325150229eusmtip13146b0172eae75367b20ad3932d2d227~fp9tuSm240799107991eusmtip1-;
 Fri, 25 Mar 2022 15:02:29 +0000 (GMT)
Message-ID: <8423a420-365c-2aab-de28-98ae19e4bc55@samsung.com>
Date: Fri, 25 Mar 2022 16:02:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v6 6/6] drm: exynos: dsi: Switch to atomic funcs
Content-Language: en-US
To: Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <narmstrong@baylibre.com>, Robert
 Foss <robert.foss@linaro.org>, Laurent Pinchart
 <Laurent.pinchart@ideasonboard.com>, Sam Ravnborg <sam@ravnborg.org>,
 Michael Nazzareno Trimarchi <michael@amarulasolutions.com>, Inki Dae
 <inki.dae@samsung.com>
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20220303163654.3381470-7-jagan@amarulasolutions.com>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrBKsWRmVeSWpSXmKPExsWy7djPc7ptN22TDD690bS4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFFcNimpOZllqUX6dglcGR8eGxZ8
 ka5Ytn0uSwPjR7EuRg4OCQETiXMdjF2MXBxCAisYJW6/vsgO4XxhlFh3cg0rhPOZUaLnyFWW
 LkZOsI6eCd3MEInljBJPj+6GavnIKHFozhdmkCpeATuJqZd/MILYLAKqElNXzGaBiAtKnJz5
 BMwWFUiSWL19NRuILSzgInHt+ktWEJtZQFzi1pP5TCBDRQQeMUk8/fMfKuEu8fTNNrAFbAKG
 El1vu9hAnuAUcJLY8zYEokReYvvbOWDXSQi0c0q0vD/PCHG2i8TuCUeZIGxhiVfHt7BD2DIS
 pyf3sEACI1/i7wxjiHCFxLXXa5ghbGuJO+d+ga1iFtCUWL9LHyLsKPHq3UcmiE4+iRtvBSEu
 4JOYtG06M0SYV6KjTQiiWk1i1vF1cDsPXrjEPIFRaRZSmMxC8vssJL/MQti7gJFlFaN4amlx
 bnpqsXFearlecWJucWleul5yfu4mRmDiOv3v+NcdjCtefdQ7xMjEwXiIUYKDWUmE9/5l6yQh
 3pTEyqrUovz4otKc1OJDjNIcLErivMmZGxKFBNITS1KzU1MLUotgskwcnFINTOWP964//fTP
 xb6F3zwPXFnEVFCfIP/XN8165dRn5xYbzi9vmHXBd14fL2eg9ul1ATse/Ftn5j/Ba3vOhUf9
 3wrS3tQGFcyxvfrabWJUu8iak1+Eb87eXrxlzQ2uY3rRZctSMtbPOH9v/sHqfxx6hUHrFBlM
 5KelV95l2Fj9bZvWsehABtvdjhwezvKhx9Zdlty0yOSvhsRJ+9pvt3P/fqswd3S6nW7KptPe
 soPxmNGe2ntOfQ/uv+ydrfXMgaHzb9W0nZ2F77suvS1jPPjaZt/55mOB9yas/ibx8PnTC833
 g/+H39ui/MtwTi/fp1NzJt+ZbHRS5H5fwSNvOQupoP2ODI9X3N97REot/+bxmgc6SizFGYmG
 WsxFxYkAA78Fx8sDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRmVeSWpSXmKPExsVy+t/xu7ptN22TDL495bC4v/gzi8WVr+/Z
 LCbdn8Bi8WXTBDaLzolL2C2WT9jHZnGqsZXF4lBftMWnWQ+ZLVb83MrowOWx9uN9Vo/3N1rZ
 PWZ3zGT1WLznJZPHnWt72Dzudx9n8lgy7SqbR9+WVYwBHFF6NkX5pSWpChn5xSW2StGGFkZ6
 hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GR8eGxZ8ka5Ytn0uSwPjR7EuRk4OCQET
 iZ4J3cxdjFwcQgJLGSVW/p7ODJGQkTg5rYEVwhaW+HOtiw2i6D2jxLazrUwgCV4BO4mpl38w
 gtgsAqoSU1fMZoGIC0qcnPkEzBYVSJK41NUOViMs4CJx7fpLsKHMAuISt57MZwIZKiLwjEni
 6Ka1UAl3iadvtkGddJZR4tq+E2AJNgFDia63IGdwcHAKOEnseRsCUW8m0bW1ixHClpfY/nYO
 8wRGoVlI7piFZN8sJC2zkLQsYGRZxSiSWlqcm55bbKhXnJhbXJqXrpecn7uJERix24793LyD
 cd6rj3qHGJk4GA8xSnAwK4nw3r9snSTEm5JYWZValB9fVJqTWnyI0RQYGBOZpUST84EpI68k
 3tDMwNTQxMzSwNTSzFhJnNezoCNRSCA9sSQ1OzW1ILUIpo+Jg1OqgSlYU/TP2ydayQ9U3mXo
 vZypmnxxderXQ69ZdjHH/tv8oykvy/FaqeoJRsXsM1U8bwsf7Zpcd+PYl55Mq7zzCU9Ldqun
 3RTRcr2xotH+dXNboWbfhaXfzPur5CzvmPVEfTKcm/ekdYrcxJaoubN9WKz+HOs5qyTmc8Jr
 zl3L2rbd337e3/NP7C7XjGV2d5tW8fbuZE07lnfnWHjs+SuTruz0OmOplNfsGbbx/Z0C3ovv
 X+lMU6p51Oumo3ItZdb6kNJT/b6f3n79//Sv8xKe526xnSmNwRt7j56c//mMVWOemt8VZbE5
 XfXZVZIBjItvRfTfYmmN6XT8vbeOfYrznX0J/rOEJvrL8Zq+/sJyIVmJpTgj0VCLuag4EQB4
 WrgwYQMAAA==
X-CMS-MailID: 20220325150230eucas1p2ca3d1d04aaaa067bb3fdea7fa312f5c9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20220303163831eucas1p1aa7708045a48b8bfcb4d370e619979b9
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220303163831eucas1p1aa7708045a48b8bfcb4d370e619979b9
References: <20220303163654.3381470-1-jagan@amarulasolutions.com>
 <CGME20220303163831eucas1p1aa7708045a48b8bfcb4d370e619979b9@eucas1p1.samsung.com>
 <20220303163654.3381470-7-jagan@amarulasolutions.com>
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
Cc: linux-amarula@amarulasolutions.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 03.03.2022 17:36, Jagan Teki wrote:
> The new support drm bridges are moving towards atomic functions.
>
> Replace atomic version of functions to continue the transition
> to the atomic API.
>
> Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

> ---
> Changes for v6, v5, v4, v3:
> - none
>
>   drivers/gpu/drm/exynos/exynos_drm_dsi.c | 25 ++++++++++++++++---------
>   1 file changed, 16 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_dsi.c b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> index 59a4f7f52180..06130eee8df8 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_dsi.c
> @@ -1358,7 +1358,8 @@ static void exynos_dsi_unregister_te_irq(struct exynos_dsi *dsi)
>   	}
>   }
>   
> -static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
> +static void exynos_dsi_atomic_pre_enable(struct drm_bridge *bridge,
> +					 struct drm_bridge_state *old_bridge_state)
>   {
>   	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   	int ret;
> @@ -1375,7 +1376,8 @@ static void exynos_dsi_pre_enable(struct drm_bridge *bridge)
>   	dsi->state |= DSIM_STATE_ENABLED;
>   }
>   
> -static void exynos_dsi_enable(struct drm_bridge *bridge)
> +static void exynos_dsi_atomic_enable(struct drm_bridge *bridge,
> +				     struct drm_bridge_state *old_bridge_state)
>   {
>   	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
> @@ -1387,7 +1389,8 @@ static void exynos_dsi_enable(struct drm_bridge *bridge)
>   	return;
>   }
>   
> -static void exynos_dsi_disable(struct drm_bridge *bridge)
> +static void exynos_dsi_atomic_disable(struct drm_bridge *bridge,
> +				      struct drm_bridge_state *old_bridge_state)
>   {
>   	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
> @@ -1397,7 +1400,8 @@ static void exynos_dsi_disable(struct drm_bridge *bridge)
>   	dsi->state &= ~DSIM_STATE_VIDOUT_AVAILABLE;
>   }
>   
> -static void exynos_dsi_post_disable(struct drm_bridge *bridge)
> +static void exynos_dsi_atomic_post_disable(struct drm_bridge *bridge,
> +					   struct drm_bridge_state *old_bridge_state)
>   {
>   	struct exynos_dsi *dsi = bridge_to_dsi(bridge);
>   
> @@ -1425,10 +1429,13 @@ static int exynos_dsi_attach(struct drm_bridge *bridge,
>   }
>   
>   static const struct drm_bridge_funcs exynos_dsi_bridge_funcs = {
> -	.pre_enable			= exynos_dsi_pre_enable,
> -	.enable				= exynos_dsi_enable,
> -	.disable			= exynos_dsi_disable,
> -	.post_disable			= exynos_dsi_post_disable,
> +	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
> +	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
> +	.atomic_reset			= drm_atomic_helper_bridge_reset,
> +	.atomic_pre_enable		= exynos_dsi_atomic_pre_enable,
> +	.atomic_enable			= exynos_dsi_atomic_enable,
> +	.atomic_disable			= exynos_dsi_atomic_disable,
> +	.atomic_post_disable		= exynos_dsi_atomic_post_disable,
>   	.mode_set			= exynos_dsi_mode_set,
>   	.attach				= exynos_dsi_attach,
>   };
> @@ -1597,7 +1604,7 @@ static void exynos_dsi_unbind(struct device *dev, struct device *master,
>   {
>   	struct exynos_dsi *dsi = dev_get_drvdata(dev);
>   
> -	exynos_dsi_disable(&dsi->bridge);
> +	exynos_dsi_atomic_disable(&dsi->bridge, NULL);
>   
>   	mipi_dsi_host_unregister(&dsi->dsi_host);
>   }

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

