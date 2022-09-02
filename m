Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6665AA8D4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 09:39:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69B8510E793;
	Fri,  2 Sep 2022 07:39:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 816FD10E793
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 07:38:58 +0000 (UTC)
X-UUID: 0cc935874e6940129b10690957193d35-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=u5DqFk5pS9uX9k6/7kK1pTWMDwS+Hgz5SrDHvFVlYkA=; 
 b=Tl094ff47oT/36ImHpnEd1PYK51+BEqSswvtyiQ54iT7SGjHn5lY7HVSq3rwLlX9q3Qz/FSuM1+m3XZL5M1H5GsJeJ+DyL2paPniQ+TwVFXeaxKzI6Dlef023zNRSf/lvSyodPRGxa88tHWEt/MzHwpTDztbcODl2jvS9mj0Qyc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:fbb1cbcc-9398-4430-a2c1-8e2edb909429, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:-5
X-CID-META: VersionHash:84eae18, CLOUDID:4138ed20-1c20-48a5-82a0-25f9c331906d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 0cc935874e6940129b10690957193d35-20220902
Received: from mtkexhb02.mediatek.inc [(172.21.101.103)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1604680535; Fri, 02 Sep 2022 15:38:53 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 2 Sep 2022 15:38:51 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 2 Sep 2022 15:38:51 +0800
Message-ID: <e513fa856dc5c7b85a45057293f6e6549777a04e.camel@mediatek.com>
Subject: Re: [PATCH v17 06/10] drm/mediatek: dp: Add multiple calibration
 data formats support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Fri, 2 Sep 2022 15:38:51 +0800
In-Reply-To: <20220901044149.16782-7-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <20220901044149.16782-7-rex-bc.chen@mediatek.com>
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 granquet@baylibre.com, jitao.shi@mediatek.com, liangxu.xu@mediatek.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 msp@baylibre.com, Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Thu, 2022-09-01 at 12:41 +0800, Bo-Chen Chen wrote:
> The calibration data formats of eDP and DP are different. We add
> "const struct mtk_dp_efuse_fmt *efuse_fmt" to the device data to
> define them.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 9 ++++++---
>  1 file changed, 6 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 971bd744cdb2..136e13150281 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -113,8 +113,10 @@ struct mtk_dp {
>  struct mtk_dp_data {
>  	int bridge_type;
>  	unsigned int smc_cmd;
> +	const struct mtk_dp_efuse_fmt *efuse_fmt;
>  };
> -static const struct mtk_dp_efuse_fmt
> mtk_dp_efuse_data[MTK_DP_CAL_MAX] = {
> +
> +static const struct mtk_dp_efuse_fmt
> mt8195_edp_efuse_fmt[MTK_DP_CAL_MAX] = {
>  	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
>  		.idx = 3,
>  		.shift = 27,
> @@ -811,7 +813,7 @@ static void mtk_dp_get_calibration_data(struct
> mtk_dp *mtk_dp)
>  	}
>  
>  	for (i = 0; i < MTK_DP_CAL_MAX; i++) {
> -		fmt = &mtk_dp_efuse_data[i];
> +		fmt = &mtk_dp->data->efuse_fmt[i];
>  		cal_data[i] = (buf[fmt->idx] >> fmt->shift) & fmt-
> >mask;
>  
>  		if (cal_data[i] < fmt->min_val || cal_data[i] > fmt-
> >max_val) {
> @@ -827,7 +829,7 @@ static void mtk_dp_get_calibration_data(struct
> mtk_dp *mtk_dp)
>  use_default_val:
>  	dev_warn(mtk_dp->dev, "Use default calibration data\n");
>  	for (i = 0; i < MTK_DP_CAL_MAX; i++)
> -		cal_data[i] = mtk_dp_efuse_data[i].default_val;
> +		cal_data[i] = mtk_dp->data->efuse_fmt[i].default_val;
>  }
>  
>  static void mtk_dp_set_calibration_data(struct mtk_dp *mtk_dp)
> @@ -1983,6 +1985,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops,
> mtk_dp_suspend, mtk_dp_resume);
>  static const struct mtk_dp_data mt8195_edp_data = {
>  	.bridge_type = DRM_MODE_CONNECTOR_eDP,
>  	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
> +	.efuse_fmt = mt8195_edp_efuse_fmt,
>  };
>  
>  static const struct of_device_id mtk_dp_of_match[] = {

