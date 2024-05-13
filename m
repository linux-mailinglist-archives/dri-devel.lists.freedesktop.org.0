Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8158C3CBF
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 09:57:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 128ED10E4A7;
	Mon, 13 May 2024 07:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=samsung.com header.i=@samsung.com header.b="O47hKkAr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com
 [210.118.77.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2A8F10E4A7
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:57:13 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20240513075710euoutp01d1fec7b470e2897488cd323df2bf16a4~O-VCbswMo3197031970euoutp01L
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 07:57:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20240513075710euoutp01d1fec7b470e2897488cd323df2bf16a4~O-VCbswMo3197031970euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1715587030;
 bh=PhXAZ64Gk0tg+3d0sEus6xMO34n2FFp+mmQRYOnG38o=;
 h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
 b=O47hKkArUAoXRiSl1UVUpVZzztgZUBKDnUMwgiLConF9T0PKF4h7eC6NR7eOq4LmJ
 RAgvar2EIckqFjKAS+jklZuPUuk/lAoNob9EV+25DWU4bfHHu8elvwReHZs29hkan4
 ncGMIpqdxO/vDlTJHBk60ULEIWA7TRg92Z56FRog=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20240513075710eucas1p2f8dabd9fbde4ab9d53839be971439c1d~O-VCFEqT40631806318eucas1p2w;
 Mon, 13 May 2024 07:57:10 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 96.CC.09875.6D7C1466; Mon, 13
 May 2024 08:57:10 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20240513075709eucas1p23b707be8d71e6d6dd0c4d1de8ec39b60~O-VBid6hG2803228032eucas1p2T;
 Mon, 13 May 2024 07:57:09 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20240513075709eusmtrp2ff23d3ff83f5f39b1cb8e90818a6e157~O-VBhjCX40066800668eusmtrp2X;
 Mon, 13 May 2024 07:57:09 +0000 (GMT)
X-AuditID: cbfec7f4-131ff70000002693-fc-6641c7d63360
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id 3D.7C.09010.5D7C1466; Mon, 13
 May 2024 08:57:09 +0100 (BST)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
 eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20240513075708eusmtip105af0fdfa13e6a904cbbf793f31e0c54~O-VAMLjc60207702077eusmtip19;
 Mon, 13 May 2024 07:57:08 +0000 (GMT)
Message-ID: <2283cbdf-e480-4d10-ab4e-d10dd772ef5d@samsung.com>
Date: Mon, 13 May 2024 09:57:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: bridge: samsung-dsim: Initialize bridge on attach
To: Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org
Cc: Adam Ford <aford173@gmail.com>, Alexander Stein
 <alexander.stein@ew.tq-group.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>, Frieder
 Schrempf <frieder.schrempf@kontron.de>, Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>, Lucas Stach
 <l.stach@pengutronix.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Michael Walle <mwalle@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Thomas
 Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20240513021849.129136-1-marex@denx.de>
Content-Transfer-Encoding: 7bit
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf0xTVxj1vvf6+mhWfG0h3HQmZCydbtnwx4y7ic5htmVP/5JEs8zEaCOv
 xfFDaUE3E2LNGAhI11YGaxlQKA4DaVFglZIqAZSCDbgRBKmwAutkdhBWikwklPF4uvHf+c53
 zved7+ZSuNRMyqnTmdmsJlOZnkCKCGfP0oP3hj0HVDscS9Fo7LEXR70jtRj6q9SOIb8tTKBV
 pxFHQ8/mSFRybUCATH4DgRaaDSSarnYA1DfzkEDhu49INFE5iqFCY50Q1YR+JtBM/iWA8gt/
 EqDlpUoczbl8AJmqRgWodcYoSIpl7CG/gKmy9BLMbx43zvxpiGDM7UUrwbgs40Km4rJZwNjc
 TzGmuaGQZO4+tAmYXsMgxowNu0mmqi+Z8Rd7MOa7lR2MvrUBHJYcE+1LYdNPn2M12/efFKU+
 6b+JnQ3Br1rCLaQOdMcUgSgK0rvh4/vVoAiIKCl9HUDzvFPAFwtrxbgDcCopHQYw3J/4ylH/
 u+OlqB7ANrMD50UhANtLFRwW0/thj8O5ZqYoglbAGtNWnpbAPnOA4HAsHQ/9vh+EHJbRydBs
 uLbOx9BJsLPgKs7Nx+kCErqd7RjXwOk46AtUr2OS3gmLZotIDketBdI3/Yrzmnh4a/bHdTOk
 K0XQFTESfOpP4PxyGcZjGQx6WoU83gJXXdxQzlAAoHXZ/7IwAKib9gFetReODbwguXNw+m3Y
 1L6dpw/AQGMhxtGQjoaPZiV8iGhocpbjPC2Gl/OlvPotaPE4/lvb+csgbgAJlg3vYtlwpmXD
 OZb/91oB0QDi2BxthprV7spkzydqlRnanEx14qkzGc1g7fd6I56FNlAfDCV2AYwCXQBSeEKM
 OCnrI5VUnKL8+gKrOXNCk5POarvA6xSRECdWpMSzUlqtzGbTWPYsq3nVxagouQ5LL8ub3nPx
 s7/vrFCCYvXkKeuJgaNBRUlZCWXbfGiwXH3vm/YrqinFyRr5MWwoavrDL2KOPzfRNY23o+dG
 JH39narnD1qS+yL2rbY4a507sjCkrfFmSdMuvTB8OV+hNzZNFZReKAxsVvVkdYdu3figs2ML
 7JDJhgmZ3ZZX8mSgutI0vuJ1tU19u7hqfTdv9J+RvRPZFytseecOWq5jOYHIodzGbSX+OcvT
 cl1xrsd9ePL+zdipuiO6165Il/e9L0yd7FB01Qa7Z442jIjEkrlnPR8v7vHaJ/R/fKp/8+ou
 Ye6yonvlhmkTvfrGeZd0/GDt58Fev0/+fdq9xk13jkh2yxMIbapy5zu4Rqv8F5L21ZwsBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLKsWRmVeSWpSXmKPExsVy+t/xu7pXjzumGdybp2Zx5/ZpZosT1xcx
 WbyespbJ4v7izywW/7dNZLa48vU9m0Xv0nOsFpPuT2Cx+LJpApvF8/nrGC1OvrnKYvH5yA02
 iwdzbzJZdE5cwm6x8ONWFos3bY2MFm2dy1gtfv+cy2zxfuctRotJ826yWmx5M5HVQdRj7cf7
 rB7zZp1g8bh3fA+zx4sJ/5g89n5bwOKxc9Zddo/ZHTNZPRbvecnksWlVJ5vHkauLWT1OTLjE
 5HHn2h42j3knAz3udx9n8uj/a+DRt2UVY4BglJ5NUX5pSapCRn5xia1StKGFkZ6hpYWekYml
 nqGxeayVkamSvp1NSmpOZllqkb5dgl7Gs7MbmQo+SlRs/ryZrYHxsEgXIyeHhICJxPLH61i7
 GLk4hASWMkrc/nKRDSIhI3FyWgMrhC0s8edaFxtE0XtGicbDk1lAErwCdhLH1m1j7GLk4GAR
 UJVYOEkdIiwocXLmE7ASUQF5ifu3ZrCD2MICgRIzJywFi4sIOEgcbJ/MDDKTWaCTTeLt/EYm
 iAXtjBJ39v8F28wsIC5x68l8JhCbTcBQouttF9h1nEBn962/yAxRYybRtbWLEcKWl9j+dg7z
 BEahWUgOmYVk1CwkLbOQtCxgZFnFKJJaWpybnltspFecmFtcmpeul5yfu4kRmG62Hfu5ZQfj
 ylcf9Q4xMnEwHmKU4GBWEuF1KLRPE+JNSaysSi3Kjy8qzUktPsRoCgyMicxSosn5wISXVxJv
 aGZgamhiZmlgamlmrCTO61nQkSgkkJ5YkpqdmlqQWgTTx8TBKdXAtDyk20R9z8E1IovPiezR
 P/lQ+0Rlls3y/ZcDDsw4n+kSOvvyHGerhDUG72/fPxD243VDxqOuBmGfwpnS23IXW+zzYdhr
 4JO8dYnYR8abi6983Lpq1YdXH5XzG7YtOn0zz9LjTPX3zfL7lTJOeKtFzucyb9t3RtR8h9S+
 2Nhgvhnv9Z8bn9zgPk25tqjbhCfzo8lZmRxrlZjtDKY331042rNkbffmcp5Vk+dffME87fH1
 5RuMPpw7eZzROO5wcOOcxQ/4n+7xT5h5SHTbSpdZjxoCBNc4X339ZK7En91rLzu1Ci6odWu4
 0+B/fdEO0ft1OxtZ7jSxTyz6u95z8pfFrEfk7uUHGjz5LfT3stOEuUe2KLEUZyQaajEXFScC
 AJohsfLAAwAA
X-CMS-MailID: 20240513075709eucas1p23b707be8d71e6d6dd0c4d1de8ec39b60
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20240513021916eucas1p127a78946a07fa16a85e588a726ed9243
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20240513021916eucas1p127a78946a07fa16a85e588a726ed9243
References: <CGME20240513021916eucas1p127a78946a07fa16a85e588a726ed9243@eucas1p1.samsung.com>
 <20240513021849.129136-1-marex@denx.de>
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


On 13.05.2024 04:16, Marek Vasut wrote:
> Initialize the bridge on attach already, to force lanes into LP11
> state, since attach does trigger attach of downstream bridges which
> may trigger (e)DP AUX channel mode read.
>
> This fixes a corner case where DSIM with TC9595 attached to it fails
> to operate the DP AUX channel, because the TC9595 enters some debug
> mode when it is released from reset without lanes in LP11 mode. By
> ensuring the DSIM lanes are in LP11, the TC9595 (tc358767.c driver)
> can be reset in its attach callback called from DSIM attach callback,
> and recovered out of the debug mode just before TC9595 performs first
> AUX channel access later in its attach callback.
>
> Signed-off-by: Marek Vasut <marex@denx.de>

This patch breaks driver operation on Samsung TM2e board with S6E3HF2 
DSI panel. The initialization procedure is very fragile and it looks 
that the changes must be done very carefully. We discussed this many 
times when converting this driver from Exynos DSI to generic Samsung DSI 
used on IMX and other SoCs.

> ---
> Cc: Adam Ford <aford173@gmail.com>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Michael Walle <mwalle@kernel.org>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: dri-devel@lists.freedesktop.org
> Cc: kernel@dh-electronics.com
> ---
>   drivers/gpu/drm/bridge/samsung-dsim.c | 16 ++++++++++++++--
>   1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
> index 95fedc68b0ae5..56093fc3d62cc 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1622,9 +1622,21 @@ static int samsung_dsim_attach(struct drm_bridge *bridge,
>   			       enum drm_bridge_attach_flags flags)
>   {
>   	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
> +	int ret;
> +
> +	ret = pm_runtime_resume_and_get(dsi->dev);
> +	if (ret < 0)
> +		return ret;
>   
> -	return drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> -				 flags);
> +	ret = samsung_dsim_init(dsi);
> +	if (ret < 0)
> +		goto err;
> +
> +	ret = drm_bridge_attach(bridge->encoder, dsi->out_bridge, bridge,
> +				flags);
> +err:
> +	pm_runtime_put_sync(dsi->dev);
> +	return ret;
>   }
>   
>   static const struct drm_bridge_funcs samsung_dsim_bridge_funcs = {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

