Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32C4CC12CF1
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 04:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028D610E02A;
	Tue, 28 Oct 2025 03:48:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="r+LlHi1D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 406FC10E57B;
 Tue, 28 Oct 2025 03:48:30 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 20E0860298;
 Tue, 28 Oct 2025 03:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2741AC4CEE7;
 Tue, 28 Oct 2025 03:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1761623308;
 bh=F9PEdAfzgWQQ2Eeck3XTAAh60sY+/GKtfF7NT+YXA9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=r+LlHi1DRjrYdeHjbmQptIeHgcr+h+3w70uVuYEPJGPrY4kRuE4Afm1cwWeN17Ni6
 IABr8PF3+vkXuiicY7YlxBsudMRGr6JUVREv4e2Z+ouddyWJCC9UNFN5LtV9jm+QLU
 +CYLaW7XWhQKux0MzE9HXbpzqwFx70xulmvMKLOFD4sNLFNDUh9gYLTLpFmrbmX9AO
 h0LGzo7sj/QQz430yP8rbrguggjQBsur4KRWQqRPEnvgfDyQ0px7BbYYyhsIW//bVN
 G/JiIFDV+D0+dvFICRAVgdqEjRUhe5n77ARIKYdvU1u3IwTYdHw2wI7C9NvqCts/Xj
 YbEd4ytzBVAFg==
Date: Mon, 27 Oct 2025 22:51:23 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
Cc: robin.clark@oss.qualcomm.com, lumag@kernel.org, 
 abhinav.kumar@linux.dev, sean@poorly.run, marijn.suijten@somainline.org, 
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca, 
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: Re: [PATCH 08/12] arm64: defconfig: Enable NT37801 DSI panel driver
Message-ID: <wuh7agcgg6spghilnx4amqukaaydj25u7kbdiod7fl6pu2ulvm@pmosyuo43cyw>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-1-yuanjie.yang@oss.qualcomm.com>
 <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023080609.1212-3-yuanjie.yang@oss.qualcomm.com>
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

On Thu, Oct 23, 2025 at 04:06:05PM +0800, yuanjie yang wrote:
> From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
> 
> Build the NT37801 DSI panel driver as module.
> 
> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
> Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

You (Yuanjie) authored the patch, but forgot to sign-off, then Yongxing
provided certificate of origin, then you provide certificate of origin
and send it to list?

Please correct.

Also, all other patches in this series are merged by DRM maintainers,
while I'm supposed to merge this one. Please send it separately, once
it's ready to be merged.

Thanks,
Bjorn

> ---
>  arch/arm64/configs/defconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 8cfb5000fa8e..537a065db11c 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -945,6 +945,7 @@ CONFIG_DRM_PANEL_SITRONIX_ST7703=m
>  CONFIG_DRM_PANEL_STARTEK_KD070FHFID015=m
>  CONFIG_DRM_PANEL_TRULY_NT35597_WQXGA=m
>  CONFIG_DRM_PANEL_VISIONOX_VTDR6130=m
> +CONFIG_DRM_PANEL_NOVATEK_NT37801=m
>  CONFIG_DRM_DISPLAY_CONNECTOR=m
>  CONFIG_DRM_FSL_LDB=m
>  CONFIG_DRM_ITE_IT6263=m
> -- 
> 2.34.1
> 
