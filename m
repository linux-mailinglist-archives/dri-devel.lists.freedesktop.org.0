Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BEC5AA8C4
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 09:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEAAC10E78E;
	Fri,  2 Sep 2022 07:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7041510E78E
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Sep 2022 07:32:22 +0000 (UTC)
X-UUID: 37ba8d69d9544fff83dab4228e52ad2b-20220902
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=qM1qgq1MV7finP/aae8s5yQZ0OBqyz3rZqiMvkPhvrk=; 
 b=G4r3C5h5cHvAVDcRRHHgoPLBhlLRM0Vb4tnJrd/KpEQwrnDgIiM/5pzW4RcEgdoVbJkT3ez4P0ZcOB1hjX2oWRZwlO7/ExPeWm61Y+LPFtIefh41VHAXhpbR7+pWlaAIv0U7NP7YhRZpMaI9OJfwSgs7cRi72eukcsdlrujD/ro=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.10, REQID:6c390545-a2b1-498b-ada8-8ac6fa5c2923, OB:0,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_
 Ham,ACTION:release,TS:0
X-CID-META: VersionHash:84eae18, CLOUDID:81f5ec20-1c20-48a5-82a0-25f9c331906d,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:11|1,File:
 nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 37ba8d69d9544fff83dab4228e52ad2b-20220902
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by
 mailgw01.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1567408428; Fri, 02 Sep 2022 15:32:16 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Fri, 2 Sep 2022 15:32:15 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 2 Sep 2022 15:32:14 +0800
Message-ID: <8ae888c3f478112bca0ae40543de878f829f2470.camel@mediatek.com>
Subject: Re: [PATCH v17 05/10] drm/mediatek: dp: Add multiple smc commands
 support
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Fri, 2 Sep 2022 15:32:14 +0800
In-Reply-To: <20220901044149.16782-6-rex-bc.chen@mediatek.com>
References: <20220901044149.16782-1-rex-bc.chen@mediatek.com>
 <20220901044149.16782-6-rex-bc.chen@mediatek.com>
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
> The smc commands of eDP and DP are different. We add smc_cmd to the
> device data to define them.

Reviewed-by: CK Hu <ck.hu@mediatek.com>

> 
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
> b/drivers/gpu/drm/mediatek/mtk_dp.c
> index 2696c1ac1a47..971bd744cdb2 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -112,6 +112,7 @@ struct mtk_dp {
>  
>  struct mtk_dp_data {
>  	int bridge_type;
> +	unsigned int smc_cmd;
>  };
>  static const struct mtk_dp_efuse_fmt
> mtk_dp_efuse_data[MTK_DP_CAL_MAX] = {
>  	[MTK_DP_CAL_GLB_BIAS_TRIM] = {
> @@ -945,11 +946,11 @@ static void mtk_dp_video_mute(struct mtk_dp
> *mtk_dp, bool enable)
>  			   VIDEO_MUTE_SW_DP_ENC0_P0);
>  
>  	arm_smccc_smc(MTK_DP_SIP_CONTROL_AARCH32,
> -		      MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable,
> +		      mtk_dp->data->smc_cmd, enable,
>  		      0, 0, 0, 0, 0, &res);
>  
>  	dev_dbg(mtk_dp->dev, "smc cmd: 0x%x, p1: 0x%x, ret: 0x%lx-
> 0x%lx\n",
> -		MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE, enable, res.a0,
> res.a1);
> +		mtk_dp->data->smc_cmd, enable, res.a0, res.a1);
>  }
>  
>  static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
> @@ -1981,6 +1982,7 @@ static SIMPLE_DEV_PM_OPS(mtk_dp_pm_ops,
> mtk_dp_suspend, mtk_dp_resume);
>  
>  static const struct mtk_dp_data mt8195_edp_data = {
>  	.bridge_type = DRM_MODE_CONNECTOR_eDP,
> +	.smc_cmd = MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE,
>  };
>  
>  static const struct of_device_id mtk_dp_of_match[] = {

