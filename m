Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C2C0676BD0B
	for <lists+dri-devel@lfdr.de>; Tue,  1 Aug 2023 20:55:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59F0A10E1D4;
	Tue,  1 Aug 2023 18:55:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:3::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02F2D10E1D6
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Aug 2023 18:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
 Message-ID:Sender:Reply-To:Content-ID:Content-Description;
 bh=ZbJ6XzZFv+F6scIaytBSdgvIm2dwO2prs0+W8B5me30=; b=tRb4rec/Sr7L58aBAg+lYczHwH
 NodjWNp9D97lEVUOMIX9q37VC7+tbt3fTQFQXHvlGH9pG35Wi+5NqEfyCW/3efHz1NUkaPodzIneD
 xfChRtZD6xrvl7ocUqpSEwYXAN9wk+jhzPbpPT9KTjm5MiwO+03Nfxz8GcJ2LJiz3et/qHdUD42WI
 /EmB/n7Ka0HCUPmS+k7guOVl+BrZQjZcD9YqG6wLANK8cVoqfSyhNGwOSsak8//gR9YCimKQyaven
 WV3IZRKW6sSQDw9NX4JrrtTOtL/KUsr6FJzM+aQImAZtAJKPNTDPL8+NAXm52i0KS+QT8PHF600u2
 h3LtBEzg==;
Received: from [2601:1c2:980:9ec0::2764]
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qQuX6-0034yw-0M; Tue, 01 Aug 2023 18:55:48 +0000
Message-ID: <08610e6b-e7eb-3442-b590-9d150f6556d6@infradead.org>
Date: Tue, 1 Aug 2023 11:55:45 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v1 v1 5/7] drm/vs: Register DRM device
Content-Language: en-US
To: Keith Zhao <keith.zhao@starfivetech.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20230801101030.2040-1-keith.zhao@starfivetech.com>
 <20230801101030.2040-6-keith.zhao@starfivetech.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230801101030.2040-6-keith.zhao@starfivetech.com>
Content-Type: text/plain; charset=UTF-8
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Shengyang Chen <shengyang.chen@starfivetech.com>,
 Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>,
 Jagan Teki <jagan@edgeble.ai>, Rob Herring <robh+dt@kernel.org>,
 Chris Morgan <macromorgan@hotmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Changhuang Liang <changhuang.liang@starfivetech.com>,
 Jack Zhu <jack.zhu@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Shawn Guo <shawnguo@kernel.org>, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 8/1/23 03:10, Keith Zhao wrote:
> diff --git a/drivers/gpu/drm/verisilicon/Kconfig b/drivers/gpu/drm/verisilicon/Kconfig
> new file mode 100644
> index 000000000..fcc39dded
> --- /dev/null
> +++ b/drivers/gpu/drm/verisilicon/Kconfig
> @@ -0,0 +1,25 @@
> +# SPDX-License-Identifier: GPL-2.0
> +config DRM_VERISILICON
> +	tristate "DRM Support for VeriSilicon"
> +	depends on DRM
> +	select DRM_KMS_HELPER
> +	select DRM_GEM_DMA_HELPER
> +	select CMA
> +	select DMA_CMA
> +	help
> +	  Choose this option if you have a VeriSilicon soc chipset.

s/soc/SoC/ as used below.

> +	  This driver provides VeriSilicon kernel mode
> +	  setting and buffer management. It does not
> +	  provide 2D or 3D acceleration.
> +
> +if DRM_VERISILICON
> +
> +config STARFIVE_HDMI
> +	bool "Starfive specific extensions HDMI"
> +	help
> +	   This selects support for StarFive SoC specific extensions
> +	   for the Innosilicon HDMI driver. If you want to enable
> +	   HDMI on JH7110 based SoC, you should select this option.
> +
> +	   To compile this driver as a module, choose M here.
> +endif

-- 
~Randy
