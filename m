Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E91D198DE5
	for <lists+dri-devel@lfdr.de>; Tue, 31 Mar 2020 10:05:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7220F6E5B0;
	Tue, 31 Mar 2020 08:05:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5FE06E5B0
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 08:05:52 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id c195so479761wme.1
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Mar 2020 01:05:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=subject:to:cc:references:from:autocrypt:organization:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=LWTU/z3NAWu+BAP5PB/V35RgoUB9Z+L6czFAkvEzUVU=;
 b=I3OappxuD8cN5KscXbGEhiWdG8dHInQ70yv50Sc9cOu/H7TU1KFnsyqEMMsfePjCFo
 S2MP10t86Ovtc/6ztyYjTaFXq8wPCOImBIJia1f9zoKlksRGmrNrVErXAD6k+oX+EHcF
 JobBA4RDYWIC0rUS/Gja114Rw4gMtRo1WVg6/6urNxu1OZFDfLBvGTYDr7BlLTr9Hx00
 eIczyLtoSIiraiC7b5JaawRG310FNWf46d/uRArknnf9YbEOMvnY6mPqREnotiJIDnZb
 LcwEJMN0mKSRcVlIWf8upRHKGlECmViZ71BSErFpxwlIwUEXzda9FSpGkSHv2hfnsiPa
 UR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:autocrypt
 :organization:message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=LWTU/z3NAWu+BAP5PB/V35RgoUB9Z+L6czFAkvEzUVU=;
 b=EBkG5raonuOETfrVeCVo+xitl6bVVSUtGHBYZOyRN8ZlEcmbOgfl7FY1RDxuaihHAM
 HNJx4redKZ9RaFshoSK0e6ij6Kvm03iYsi0UrxuRF4+ZUiQsVC0kwCFl5kQlbnLPSLih
 wL/scYoxj8X6iv2Q7FOtYCF+3UYhbGHscA1iJQmwUeGArEYn7ssCom8IPEQfbGoV32l9
 OYKGIaPqE2K6EqlHz1Xxv62M06uu0/iRTPhQZ3OGhXAhy04NE2Yk/3QGzaBaMjYdnmZ8
 9l1ekXdp+UiCgvcjoExKilmXz0e+h0pqjAo5Km1arr9eTicDbieOLmW9m8vb6rFhKihT
 Zrjg==
X-Gm-Message-State: ANhLgQ2axJtA4DRMc94rOTbPqdRUzeXGdnNOf1An6JiZ09m9S9JpExgT
 czKeNO8W2+IOKBQvo2HtHNLQsKlHz93pKQ==
X-Google-Smtp-Source: ADFU+vvD+NmNdXAqcj+henKMJQxgNkfDBkFag7EqmOw1fLxoYbHIRrn1vquJ7O2sKqspyElQKdBjsg==
X-Received: by 2002:a1c:2203:: with SMTP id i3mr2171659wmi.25.1585641951023;
 Tue, 31 Mar 2020 01:05:51 -0700 (PDT)
Received: from ?IPv6:2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2?
 ([2a01:e35:2ec0:82b0:5c5f:613e:f775:b6a2])
 by smtp.gmail.com with ESMTPSA id f14sm2821580wmb.3.2020.03.31.01.05.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 Mar 2020 01:05:50 -0700 (PDT)
Subject: Re: [PATCH v2 3/4] drm/mediatek: Move mtk_hdmi_phy driver into
 drivers/phy/mediatek folder
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>
References: <20200330141222.17529-1-chunkuang.hu@kernel.org>
 <20200330141222.17529-4-chunkuang.hu@kernel.org>
From: Neil Armstrong <narmstrong@baylibre.com>
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 BSwxi7g3Mu7u5kUByanqHyA=
Organization: Baylibre
Message-ID: <b1c22917-76b4-2de9-3f0a-0d7736dae94f@baylibre.com>
Date: Tue, 31 Mar 2020 10:05:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200330141222.17529-4-chunkuang.hu@kernel.org>
Content-Language: en-US
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 30/03/2020 16:12, Chun-Kuang Hu wrote:
> From: CK Hu <ck.hu@mediatek.com>
> 
> mtk_hdmi_phy is currently placed inside mediatek drm driver, but it's
> more suitable to place a phy driver into phy driver folder, so move
> mtk_hdmi_phy driver into phy driver folder.

Pretty sure the subject should start with "phy: " and have an ack from Kishon.

Neil

> 
> Signed-off-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> ---
>  drivers/gpu/drm/mediatek/Kconfig                           | 7 -------
>  drivers/gpu/drm/mediatek/Makefile                          | 6 ------
>  drivers/phy/mediatek/Kconfig                               | 7 +++++++
>  drivers/phy/mediatek/Makefile                              | 7 +++++++
>  .../mediatek/phy-mtk-hdmi-mt2701.c}                        | 2 +-
>  .../mediatek/phy-mtk-hdmi-mt8173.c}                        | 2 +-
>  .../mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c}         | 2 +-
>  .../mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h}         | 0
>  8 files changed, 17 insertions(+), 16 deletions(-)
>  rename drivers/{gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt2701.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi-mt8173.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.c => phy/mediatek/phy-mtk-hdmi.c} (99%)
>  rename drivers/{gpu/drm/mediatek/mtk_hdmi_phy.h => phy/mediatek/phy-mtk-hdmi.h} (100%)
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
> index ff6a1eb4ae83..2427d5bf699d 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -26,10 +26,3 @@ config DRM_MEDIATEK_HDMI
>  	select PHY_MTK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs
> -
> -config PHY_MTK_HDMI
> -    tristate "MediaTek HDMI-PHY Driver"
> -    depends on ARCH_MEDIATEK && OF
> -    select GENERIC_PHY
> -    help
> -          Enable this to support HDMI-PHY
> diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
> index fcbef23aa6ce..77b0fd86063d 100644
> --- a/drivers/gpu/drm/mediatek/Makefile
> +++ b/drivers/gpu/drm/mediatek/Makefile
> @@ -22,9 +22,3 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
>  			  mtk_hdmi_ddc.o
>  
>  obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
> -
> -phy-mtk-hdmi-drv-objs := mtk_hdmi_phy.o \
> -			 mtk_mt2701_hdmi_phy.o \
> -			 mtk_mt8173_hdmi_phy.o
> -
> -obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
> diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> index dee757c957f2..10f0ec2d5b54 100644
> --- a/drivers/phy/mediatek/Kconfig
> +++ b/drivers/phy/mediatek/Kconfig
> @@ -35,3 +35,10 @@ config PHY_MTK_XSPHY
>  	  Enable this to support the SuperSpeedPlus XS-PHY transceiver for
>  	  USB3.1 GEN2 controllers on MediaTek chips. The driver supports
>  	  multiple USB2.0, USB3.1 GEN2 ports.
> +
> +config PHY_MTK_HDMI
> +    tristate "MediaTek HDMI-PHY Driver"
> +    depends on ARCH_MEDIATEK && OF
> +    select GENERIC_PHY
> +    help
> +          Enable this to support HDMI-PHY
> diff --git a/drivers/phy/mediatek/Makefile b/drivers/phy/mediatek/Makefile
> index 08a8e6a97b1e..cda074c53235 100644
> --- a/drivers/phy/mediatek/Makefile
> +++ b/drivers/phy/mediatek/Makefile
> @@ -6,3 +6,10 @@
>  obj-$(CONFIG_PHY_MTK_TPHY)		+= phy-mtk-tphy.o
>  obj-$(CONFIG_PHY_MTK_UFS)		+= phy-mtk-ufs.o
>  obj-$(CONFIG_PHY_MTK_XSPHY)		+= phy-mtk-xsphy.o
> +
> +phy-mtk-hdmi-drv-objs := phy-mtk-hdmi.o \
> +			 phy-mtk-hdmi-mt2701.o \
> +			 phy-mtk-hdmi-mt8173.o
> +
> +obj-$(CONFIG_PHY_MTK_HDMI) += phy-mtk-hdmi-drv.o
> +
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> rename to drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> index 99fe05cd3598..a6cb1dea3d0c 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt2701_hdmi_phy.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c
> @@ -4,7 +4,7 @@
>   * Author: Chunhui Dai <chunhui.dai@mediatek.com>
>   */
>  
> -#include "mtk_hdmi_phy.h"
> +#include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0	0x00
>  #define RG_HDMITX_DRV_IBIAS		0
> diff --git a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> rename to drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> index b55f51675205..3521c4893c53 100644
> --- a/drivers/gpu/drm/mediatek/mtk_mt8173_hdmi_phy.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c
> @@ -4,7 +4,7 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> -#include "mtk_hdmi_phy.h"
> +#include "phy-mtk-hdmi.h"
>  
>  #define HDMI_CON0		0x00
>  #define RG_HDMITX_PLL_EN		BIT(31)
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c b/drivers/phy/mediatek/phy-mtk-hdmi.c
> similarity index 99%
> rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> rename to drivers/phy/mediatek/phy-mtk-hdmi.c
> index fe022acddbef..8fc83f01a720 100644
> --- a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.c
> +++ b/drivers/phy/mediatek/phy-mtk-hdmi.c
> @@ -4,7 +4,7 @@
>   * Author: Jie Qiu <jie.qiu@mediatek.com>
>   */
>  
> -#include "mtk_hdmi_phy.h"
> +#include "phy-mtk-hdmi.h"
>  
>  static int mtk_hdmi_phy_power_on(struct phy *phy);
>  static int mtk_hdmi_phy_power_off(struct phy *phy);
> diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_phy.h b/drivers/phy/mediatek/phy-mtk-hdmi.h
> similarity index 100%
> rename from drivers/gpu/drm/mediatek/mtk_hdmi_phy.h
> rename to drivers/phy/mediatek/phy-mtk-hdmi.h
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
