Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D06EA24AFD9
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 09:16:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548AF6E8DF;
	Thu, 20 Aug 2020 07:15:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from merlin.infradead.org (merlin.infradead.org
 [IPv6:2001:8b0:10b:1231::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B17166E517
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Aug 2020 15:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:Content-Type:
 In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
 :Reply-To:Content-ID:Content-Description;
 bh=LChl76aTDgmS9+kOpuBki8FoklfurTAmg+2uUwheR6w=; b=qG8XaXeerAa3YoJbnSQdWcflqI
 RQ4xWeOA0NWlkOLRIsDIczB7644AZOrhhvo7v4IoOcK6TQq61ISg5CmjsqZiXZSuinCMOs7qvUTPP
 +9thtGx9KBVdxacFoG7VP3D1oMDhdCP8lCJCZ4toD3tsqniPoXOWx43VUL79t6Y9FowcZUEHEANMT
 WsUbNPcpfEDB3ElEniSTlDZuPy5dhIfnH7/C6WlMx2E82o+qFwARrGa7XGX5l+/EpaQ05eUgWRDy9
 riVWVmZKJkbA3z953zv+K+sT28xBtBGtgHRTJqvjEdXdqvs9c8ERDiSW4zJonmkvnGiGCuGkg2LTb
 UsdSKtSA==;
Received: from [2601:1c0:6280:3f0::19c2]
 by merlin.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Q3G-0006f4-QA; Wed, 19 Aug 2020 15:30:59 +0000
Subject: Re: [PATCH 38/49] staging: hikey9xx/gpu: add kirin9xx driver to the
 building system
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
References: <cover.1597833138.git.mchehab+huawei@kernel.org>
 <6bb2c71410a8065e2a2c5f13294b27154dbd786b.1597833138.git.mchehab+huawei@kernel.org>
From: Randy Dunlap <rdunlap@infradead.org>
Message-ID: <52e4ab95-304c-54b2-e92e-099be108939e@infradead.org>
Date: Wed, 19 Aug 2020 08:30:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <6bb2c71410a8065e2a2c5f13294b27154dbd786b.1597833138.git.mchehab+huawei@kernel.org>
Content-Language: en-US
X-Mailman-Approved-At: Thu, 20 Aug 2020 07:14:47 +0000
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
Cc: devel@driverdev.osuosl.org, Liwei Cai <cailiwei@hisilicon.com>,
 Manivannan Sadhasivam <mani@kernel.org>, Chen Feng <puck.chen@hisilicon.com>,
 linuxarm@huawei.com, dri-devel <dri-devel@lists.freedesktop.org>,
 Xiubin Zhang <zhangxiubin1@huawei.com>, mauro.chehab@huawei.com,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 8/19/20 4:46 AM, Mauro Carvalho Chehab wrote:
> Now that everything is in place, add the driver to the
> building system.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Hi Mauro,

In this patch and in patch 01/49, please be consistent in capitalization
on HiSilicon.

more below:

> ---
>  drivers/staging/hikey9xx/Kconfig      |  3 ++
>  drivers/staging/hikey9xx/Makefile     |  1 +
>  drivers/staging/hikey9xx/gpu/Kconfig  | 52 ++++++---------------------
>  drivers/staging/hikey9xx/gpu/Makefile | 21 ++++-------
>  4 files changed, 22 insertions(+), 55 deletions(-)
> 
> diff --git a/drivers/staging/hikey9xx/Kconfig b/drivers/staging/hikey9xx/Kconfig
> index 0e97b5b9a56a..b2ce886e1c4e 100644
> --- a/drivers/staging/hikey9xx/Kconfig
> +++ b/drivers/staging/hikey9xx/Kconfig
> @@ -36,3 +36,6 @@ config REGULATOR_HI6421V600
>  	  This driver provides support for the voltage regulators on
>  	  HiSilicon Hi6421v600 PMU / Codec IC.
>  	  This is used on Kirin 3670 boards, like HiKey 970.
> +
> +# DRM/KMS driver
> +source "drivers/staging/hikey9xx/gpu/Kconfig"

> diff --git a/drivers/staging/hikey9xx/gpu/Kconfig b/drivers/staging/hikey9xx/gpu/Kconfig
> index 5533ee624f29..957da13bcf81 100644
> --- a/drivers/staging/hikey9xx/gpu/Kconfig
> +++ b/drivers/staging/hikey9xx/gpu/Kconfig
> @@ -1,52 +1,22 @@
> -config DRM_HISI_KIRIN
> -	tristate "DRM Support for Hisilicon Kirin series SoCs Platform"> +config DRM_HISI_KIRIN9XX
> +	tristate "DRM Support for Hisilicon Kirin9xx series SoCs Platform"

	                          HiSilicon

>  	depends on DRM && OF && ARM64
>  	select DRM_KMS_HELPER
>  	select DRM_GEM_CMA_HELPER
>  	select DRM_KMS_CMA_HELPER
> -	select HISI_KIRIN_DW_DSI
> -	help
> -	  Choose this option if you have a hisilicon Kirin chipsets(hi6220).
> -	  If M is selected the module will be called kirin-drm.
> -
> -config DRM_KIRIN_960
> -	tristate "DRM Support for Hisilicon Kirin960 series SoCs Platform"
> -	depends on DRM && OF && ARM64
> -	select DRM_KMS_HELPER
> -	select DRM_GEM_CMA_HELPER
> -	select DRM_KMS_CMA_HELPER
> -	select HISI_KIRIN_DW_DSI
> -	help
> -	  Choose this option if you have a hisilicon Kirin chipsets(kirin960).
> -	  If M is selected the module will be called kirin-drm.
> -
> -config HISI_KIRIN_DW_DSI
> -	tristate "HiSilicon Kirin specific extensions for Synopsys DW MIPI DSI"
> -	depends on DRM_HISI_KIRIN || DRM_KIRIN_960
>  	select DRM_MIPI_DSI
> -	select DRM_PANEL
>  	help
> -	 This selects support for HiSilicon Kirin SoC specific extensions for
> -	 the Synopsys DesignWare DSI driver. If you want to enable MIPI DSI on
> -	 hi6220 based SoC, you should selet this option.
> +	  Choose this option if you have a HiSilicon Kirin960 or Kirin970.
> +	  If M is selected the module will be called kirin9xx-drm.

Indent with 1 tab + 2 spaces.

>  
> -config DRM_PANEL_HIKEY960_NTE300NTS
> -	tristate "Hikey960 NTE300NTS video mode panel"
> -	depends on OF
> -	depends on DRM_MIPI_DSI
> -	help
> -		Say Y here if you want to enable LCD panel driver for Hikey960 boadr.
> -		Current support panel: NTE300NTS(1920X1200)
> -
> -config HISI_FB_970
> -	tristate "DRM Support for Hisilicon Kirin970 series SoCs Platform"
> -	depends on DRM && OF && ARM64
> +config DRM_HISI_KIRIN970
> +	bool "Enable support for Hisilicon Kirin970"

	                         HiSilicon

>  	depends on DRM_MIPI_DSI
> +	depends on DRM_HISI_KIRIN9XX
>  	help
>  	  Choose this option if you have a hisilicon Kirin chipsets(kirin970).

	                                   HiSilicon

> -	  If M is selected the module will be called kirin-drm.
>  
> -config HDMI_ADV7511_AUDIO
> -	tristate "HDMI Support ADV7511 audio"
> -	help
> -	  Choose this option to support HDMI ADV7511 audio.
> +config DRM_HISI_KIRIN9XX_DSI
> +	tristate
> +	depends on DRM_HISI_KIRIN9XX
> +	default y

thanks.
-- 
~Randy

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
