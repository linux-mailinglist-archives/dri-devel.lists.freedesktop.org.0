Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1424042E543
	for <lists+dri-devel@lfdr.de>; Fri, 15 Oct 2021 02:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ABF36ECB2;
	Fri, 15 Oct 2021 00:26:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7943E6ECB2
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Oct 2021 00:26:03 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id y15so34319792lfk.7
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Oct 2021 17:26:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=gAakFVCdlu4BwUnr1HsiBStLYgFMjKgM2HCJV6khvVI=;
 b=KqrFJqTAAd10gLKTVHbzWujEhl0n1HYn0E+xVy66B9zm1FNUxx8QtX5yZVfLeeODxs
 TYuPsYapJNCClxzEXoVd2HvUwe/BQa07J/w+ePK17SSbJQXNzoX4Zri8wYr9KTf82caF
 iH7sJpZRdliFvfgO2ualjYGlVrWZTKdGa09dTq3gOozlXNwDalk6SknK8K0j0TE78GRD
 hoFF/VtosBG2t8NSZhhlDJ12ZDgS2Rmh2cb00OIpkxvm7hXT3y9qfQUhiIcdrj0W8K2X
 F9oFDrm2aJQBk3gTmmc5a3T7XgWTZYV4zw14o4TXGuBhh3oGIPpOAvTOlyjwaB8dhoje
 6QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=gAakFVCdlu4BwUnr1HsiBStLYgFMjKgM2HCJV6khvVI=;
 b=dT+lXHPB6qrk4HydKwk5VzA7yZ/gndJRy1KzzTMwM7P5AdC2sWGeH4GlD6GIwRuMol
 Y/HXfoqhPuM4dfuwT7lDEuQ9CxDzcCVH1TvqNqfdbuLvlg8BxJbh64NLHOJ24iRcynuz
 yFL44LqQ0SCxXIgu6IDnX+TypZBiOsrmvZcz10ytkbZ0mvCEuklpaK4i8PqSo8FsGtEM
 aeB+eMaSuQnbwbGlAT+KH/clJ+a6Fzr0UBIGgViIOQzYHce8gB7FNYHzaM8h/zlWFy7n
 plR+EeyvdkybFh/cVC+BPUpzmcI9+zW1PMdLpjl3nYvc4yxxe3IrYdVEjnB4QStNBz29
 DA2Q==
X-Gm-Message-State: AOAM532Kei6Cy5J8VuQINQMvsQkJjJ51O0YMPf/TuWmJMAf+C7aGc9JU
 650lewfIKt5KAXDEMhIJxFS6Tw==
X-Google-Smtp-Source: ABdhPJw9BcxSBn4If2tX2xf6UOr7GhCJzVW2y/ue10VwQ8YI92czy1tR/ihi61fsOSqbJQZNBCi/ng==
X-Received: by 2002:ac2:4ecd:: with SMTP id p13mr7883899lfr.237.1634257561771; 
 Thu, 14 Oct 2021 17:26:01 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e12sm396760ljp.30.2021.10.14.17.26.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 14 Oct 2021 17:26:01 -0700 (PDT)
Subject: Re: [PATCH] drm: msm: fix building without CONFIG_COMMON_CLK
To: Arnd Bergmann <arnd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Arnd Bergmann <arnd@arndb.de>, Randy Dunlap <rdunlap@infradead.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Alex Elder <elder@linaro.org>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Rajeev Nandan <rajeevny@codeaurora.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20211013144308.2248978-1-arnd@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <e88d5a3f-2c46-f891-c505-87e20bf714e9@linaro.org>
Date: Fri, 15 Oct 2021 03:26:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <20211013144308.2248978-1-arnd@kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 13/10/2021 17:42, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> When CONFIG_COMMON_CLOCK is disabled, the 8996 specific
> phy code is left out, which results in a link failure:
> 
> ld: drivers/gpu/drm/msm/hdmi/hdmi_phy.o:(.rodata+0x3f0): undefined reference to `msm_hdmi_phy_8996_cfg'
> 
> This was only exposed after it became possible to build
> test the driver without the clock interfaces.
> 
> Make COMMON_CLK a hard dependency for compile testing,
> and simplify it a little based on that.
> 
> Fixes: b3ed524f84f5 ("drm/msm: allow compile_test on !ARM")
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

This drops dependency on CONFIG_OF. While ARM64 selects OF, pure ARM 
does not.

With that fixed:
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/Kconfig  | 2 +-
>   drivers/gpu/drm/msm/Makefile | 6 +++---
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
> index f5107b6ded7b..cb204912e0f4 100644
> --- a/drivers/gpu/drm/msm/Kconfig
> +++ b/drivers/gpu/drm/msm/Kconfig
> @@ -4,8 +4,8 @@ config DRM_MSM
>   	tristate "MSM DRM"
>   	depends on DRM
>   	depends on ARCH_QCOM || SOC_IMX5 || COMPILE_TEST
> +	depends on COMMON_CLK
>   	depends on IOMMU_SUPPORT
> -	depends on (OF && COMMON_CLK) || COMPILE_TEST
>   	depends on QCOM_OCMEM || QCOM_OCMEM=n
>   	depends on QCOM_LLCC || QCOM_LLCC=n
>   	depends on QCOM_COMMAND_DB || QCOM_COMMAND_DB=n
> diff --git a/drivers/gpu/drm/msm/Makefile b/drivers/gpu/drm/msm/Makefile
> index 904535eda0c4..bbee22b54b0c 100644
> --- a/drivers/gpu/drm/msm/Makefile
> +++ b/drivers/gpu/drm/msm/Makefile
> @@ -23,8 +23,10 @@ msm-y := \
>   	hdmi/hdmi_i2c.o \
>   	hdmi/hdmi_phy.o \
>   	hdmi/hdmi_phy_8960.o \
> +	hdmi/hdmi_phy_8996.o \
>   	hdmi/hdmi_phy_8x60.o \
>   	hdmi/hdmi_phy_8x74.o \
> +	hdmi/hdmi_pll_8960.o \
>   	edp/edp.o \
>   	edp/edp_aux.o \
>   	edp/edp_bridge.o \
> @@ -37,6 +39,7 @@ msm-y := \
>   	disp/mdp4/mdp4_dtv_encoder.o \
>   	disp/mdp4/mdp4_lcdc_encoder.o \
>   	disp/mdp4/mdp4_lvds_connector.o \
> +	disp/mdp4/mdp4_lvds_pll.o \
>   	disp/mdp4/mdp4_irq.o \
>   	disp/mdp4/mdp4_kms.o \
>   	disp/mdp4/mdp4_plane.o \
> @@ -117,9 +120,6 @@ msm-$(CONFIG_DRM_MSM_DP)+= dp/dp_aux.o \
>   	dp/dp_audio.o
>   
>   msm-$(CONFIG_DRM_FBDEV_EMULATION) += msm_fbdev.o
> -msm-$(CONFIG_COMMON_CLK) += disp/mdp4/mdp4_lvds_pll.o
> -msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_pll_8960.o
> -msm-$(CONFIG_COMMON_CLK) += hdmi/hdmi_phy_8996.o
>   
>   msm-$(CONFIG_DRM_MSM_HDMI_HDCP) += hdmi/hdmi_hdcp.o
>   
> 


-- 
With best wishes
Dmitry
