Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8474D56693B
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D25E710EF72;
	Tue,  5 Jul 2022 11:29:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F027897DC
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Jul 2022 06:54:25 +0000 (UTC)
X-UUID: bcc7d7e370f349a9af44f17cd9bf2b93-20220705
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8, REQID:66dbdefe-f985-4aec-a552-dd4ee86892a9, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:-5
X-CID-META: VersionHash:0f94e32, CLOUDID:9bc68d86-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
 ,QS:nil,BEC:nil,COL:0
X-UUID: bcc7d7e370f349a9af44f17cd9bf2b93-20220705
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 413294378; Tue, 05 Jul 2022 11:48:33 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 5 Jul 2022 11:48:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 5 Jul 2022 11:48:31 +0800
Message-ID: <20a5ac6a0e089a11f82f2d6eaa303a775b11e3a3.camel@mediatek.com>
Subject: Re: [PATCH v15 04/16] drm/mediatek: dpi: Remove output format of YUV
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <matthias.bgg@gmail.com>,
 <airlied@linux.ie>
Date: Tue, 5 Jul 2022 11:48:31 +0800
In-Reply-To: <20220701035845.16458-5-rex-bc.chen@mediatek.com>
References: <20220701035845.16458-1-rex-bc.chen@mediatek.com>
 <20220701035845.16458-5-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, granquet@baylibre.com, jitao.shi@mediatek.com,
 xinlei.lee@mediatek.com, liangxu.xu@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Fri, 2022-07-01 at 11:58 +0800, Bo-Chen Chen wrote:
> DPI is not support output format as YUV, but there is the setting of
> configuring output YUV. Therefore, remove them in this patch.

Applied to mediatek-drm-next [1], thanks.

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git/log/?h=mediatek-drm-next

Regards,
CK

> 
> Fixes: 9e629c17aa8d ("drm/mediatek: Add DPI sub driver")
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dpi.c | 31 ++++++--------------------
> ----
>  1 file changed, 6 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c
> b/drivers/gpu/drm/mediatek/mtk_dpi.c
> index f66a121ba0c9..3473ee18ad97 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dpi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
> @@ -54,13 +54,7 @@ enum mtk_dpi_out_channel_swap {
>  };
>  
>  enum mtk_dpi_out_color_format {
> -	MTK_DPI_COLOR_FORMAT_RGB,
> -	MTK_DPI_COLOR_FORMAT_RGB_FULL,
> -	MTK_DPI_COLOR_FORMAT_YCBCR_444,
> -	MTK_DPI_COLOR_FORMAT_YCBCR_422,
> -	MTK_DPI_COLOR_FORMAT_XV_YCC,
> -	MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL,
> -	MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL
> +	MTK_DPI_COLOR_FORMAT_RGB
>  };
>  
>  struct mtk_dpi {
> @@ -373,24 +367,11 @@ static void mtk_dpi_config_disable_edge(struct
> mtk_dpi *dpi)
>  static void mtk_dpi_config_color_format(struct mtk_dpi *dpi,
>  					enum mtk_dpi_out_color_format
> format)
>  {
> -	if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_444) ||
> -	    (format == MTK_DPI_COLOR_FORMAT_YCBCR_444_FULL)) {
> -		mtk_dpi_config_yuv422_enable(dpi, false);
> -		mtk_dpi_config_csc_enable(dpi, true);
> -		mtk_dpi_config_swap_input(dpi, false);
> -		mtk_dpi_config_channel_swap(dpi,
> MTK_DPI_OUT_CHANNEL_SWAP_BGR);
> -	} else if ((format == MTK_DPI_COLOR_FORMAT_YCBCR_422) ||
> -		   (format == MTK_DPI_COLOR_FORMAT_YCBCR_422_FULL)) {
> -		mtk_dpi_config_yuv422_enable(dpi, true);
> -		mtk_dpi_config_csc_enable(dpi, true);
> -		mtk_dpi_config_swap_input(dpi, true);
> -		mtk_dpi_config_channel_swap(dpi,
> MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> -	} else {
> -		mtk_dpi_config_yuv422_enable(dpi, false);
> -		mtk_dpi_config_csc_enable(dpi, false);
> -		mtk_dpi_config_swap_input(dpi, false);
> -		mtk_dpi_config_channel_swap(dpi,
> MTK_DPI_OUT_CHANNEL_SWAP_RGB);
> -	}
> +	/* only support RGB888 */
> +	mtk_dpi_config_yuv422_enable(dpi, false);
> +	mtk_dpi_config_csc_enable(dpi, false);
> +	mtk_dpi_config_swap_input(dpi, false);
> +	mtk_dpi_config_channel_swap(dpi, MTK_DPI_OUT_CHANNEL_SWAP_RGB);
>  }
>  
>  static void mtk_dpi_dual_edge(struct mtk_dpi *dpi)

