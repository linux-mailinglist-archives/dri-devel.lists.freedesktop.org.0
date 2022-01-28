Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DC149F3C4
	for <lists+dri-devel@lfdr.de>; Fri, 28 Jan 2022 07:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1800810F6FA;
	Fri, 28 Jan 2022 06:38:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 396E010F6F8
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Jan 2022 06:38:26 +0000 (UTC)
X-UUID: 3cee5282e0f4416380f3153d6e4bb05a-20220128
X-UUID: 3cee5282e0f4416380f3153d6e4bb05a-20220128
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 539038571; Fri, 28 Jan 2022 14:38:22 +0800
Received: from mtkexhb02.mediatek.inc (172.21.101.103) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Fri, 28 Jan 2022 14:38:20 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by mtkexhb02.mediatek.inc
 (172.21.101.103) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 28 Jan 2022 14:38:20 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 28 Jan 2022 14:38:20 +0800
Message-ID: <10f4a1a11759f2b2a2d322f9d4f17c3159f9769a.camel@mediatek.com>
Subject: Re: [RFC PATCH 2/2] drm/mediatek: add mtk8195 hdmi display driver
From: CK Hu <ck.hu@mediatek.com>
To: Guillaume Ranquet <granquet@baylibre.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, "David
 Airlie" <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, "Matthias
 Brugger" <matthias.bgg@gmail.com>
Date: Fri, 28 Jan 2022 14:38:20 +0800
In-Reply-To: <20211108000847.14320-3-granquet@baylibre.com>
References: <20211108000847.14320-1-granquet@baylibre.com>
 <20211108000847.14320-3-granquet@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
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
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Guillaume:

On Mon, 2021-11-08 at 01:08 +0100, Guillaume Ranquet wrote:
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> Change-Id: I6399dec26cfe56a338c2ca96989cb7cbd14e292b
> ---
>  drivers/gpu/drm/mediatek/Kconfig              |    9 +
>  drivers/gpu/drm/mediatek/Makefile             |    2 +
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.c    |  219 +-
>  drivers/gpu/drm/mediatek/mtk_hdmi_common.h    |   24 +-
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c    | 1835
> +++++++++++++++++
>  drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h    |   26 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c    |  530 +++++
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h    |   20 +
>  .../gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h   |  329 +++
>  9 files changed, 2932 insertions(+), 62 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_ddc.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_mt8195_hdmi_regs.h
> 
> diff --git a/drivers/gpu/drm/mediatek/Kconfig
> b/drivers/gpu/drm/mediatek/Kconfig
> index 0df75bceb74e..76cc402cbd75 100644
> --- a/drivers/gpu/drm/mediatek/Kconfig
> +++ b/drivers/gpu/drm/mediatek/Kconfig
> @@ -31,3 +31,12 @@ config DRM_MEDIATEK_HDMI
>  	help
>  	  DRM/KMS HDMI driver for Mediatek SoCs

[snip]

> +
> +static int mtk_hdmi_ddc_xfer(struct i2c_adapter *adapter, struct
> i2c_msg *msgs,
> +			     int num)
> +{
> +	struct mtk_hdmi_ddc *ddc = adapter->algo_data;
> +	struct device *dev = adapter->dev.parent;
> +	int ret;
> +	int i;
> +
> +	if (!ddc)
> +		return -EINVAL;
> +
> +	for (i = 0; i < num; i++) {
> +		struct i2c_msg *msg = &msgs[i];
> +
> +		if (msg->flags & I2C_M_RD)
> +			ret = fg_ddc_data_read(ddc, msg->addr, msg-
> >buf[0],
> +					    (msg->len), &msg->buf[0]);
> +		else
> +			ret = fg_ddc_data_write(ddc, msg->addr, msg-
> >buf[0],
> +					     (msg->len - 1), &msg-
> >buf[1]);

Why do you use msg->buf[1]? In mt8173 hdmi ddc driver,
mtk_hdmi_ddc_write_msg() just use msg->buf[0]. If using msg->buf[1] is
advance function, separate this advance function to another patch.

Regards,
CK

> +
> +		if (ret <= 0)
> +			goto xfer_end;
> +	}
> +
> +	return i;
> +
> +xfer_end:
> +	dev_err(dev, "ddc failed! : %d\n", ret);
> +	return ret;
> +}
> +

