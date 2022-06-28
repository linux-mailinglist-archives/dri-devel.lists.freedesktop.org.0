Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F288955BED7
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 08:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0081911AB1A;
	Tue, 28 Jun 2022 06:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA45F11AB1A
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 06:42:35 +0000 (UTC)
X-UUID: 7e03ed20222940d6844cd5bc1e17f222-20220628
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:afafa65f-2c04-4a56-b8c9-a3e66b72495c, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.7, REQID:afafa65f-2c04-4a56-b8c9-a3e66b72495c, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:87442a2, CLOUDID:3a4806d6-5d6d-4eaf-a635-828a3ee48b7c,
 C
 OID:65e80b9b2c5b,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7e03ed20222940d6844cd5bc1e17f222-20220628
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 609913103; Tue, 28 Jun 2022 14:42:28 +0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 28 Jun 2022 14:42:26 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Jun 2022 14:42:26 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 28 Jun 2022 14:42:26 +0800
Message-ID: <63abbd99c5d95daea7126328252e98a4b8cde2d9.camel@mediatek.com>
Subject: Re: [PATCH v12 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Tue, 28 Jun 2022 14:42:26 +0800
In-Reply-To: <20220627080341.5087-6-rex-bc.chen@mediatek.com>
References: <20220627080341.5087-1-rex-bc.chen@mediatek.com>
 <20220627080341.5087-6-rex-bc.chen@mediatek.com>
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
 granquet@baylibre.com, jitao.shi@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, msp@baylibre.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi, Bo-Chen:

On Mon, 2022-06-27 at 16:03 +0800, Bo-Chen Chen wrote:
> From: Markus Schneider-Pargmann <msp@baylibre.com>
> 
> This patch adds a embedded displayport driver for the MediaTek mt8195
> SoC.
> 
> It supports the MT8195, the embedded DisplayPort units. It offers
> DisplayPort 1.4 with up to 4 lanes.
> 
> The driver creates a child device for the phy. The child device will
> never exist without the parent being active. As they are sharing a
> register range, the parent passes a regmap pointer to the child so
> that
> both can work with the same register range. The phy driver sets
> device
> data that is read by the parent to get the phy device that can be
> used
> to control the phy properties.
> 
> This driver is based on an initial version by
> Jitao shi <jitao.shi@mediatek.com>
> 
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> ---

[snip]

> +
> +static int mtk_dp_training(struct mtk_dp *mtk_dp)
> +{
> +	bool training_done = false;
> +	short max_retry = 50;
> +	int ret = 0;
> +
> +	do {
> +		switch (mtk_dp->train_state) {
> +		case MTK_DP_TRAIN_STATE_TRAINING:
> +			ret = mtk_dp_train_start(mtk_dp);
> +			if (!ret)
> +				mtk_dp->train_state =
> MTK_DP_TRAIN_STATE_NORMAL;
> +			break;
> +		case MTK_DP_TRAIN_STATE_NORMAL:
> +			mtk_dp_video_config(mtk_dp);
> +			mtk_dp_video_enable(mtk_dp, true);
> +			training_done = true;
> +			break;
> +		default:
> +			break;
> +		}
> +
> +		if (ret) {
> +			if (ret == -EAGAIN)
> +				continue;
> +			/*
> +			 * If we get any other error number, it doesn't
> +			 * make any sense to keep iterating.
> +			 */
> +			break;
> +		}
> +	} while (!training_done || --max_retry);
> +
> +	return ret;
> +}

This function could re rewritten as:

static bool mtk_dp_training(struct mtk_dp *mtk_dp)
{
	short max_retry = 50;

	do {
		ret = mtk_dp_train_start(mtk_dp);
		if (!ret)
			break;
		else if (ret != -EAGAIN)
			return false;
	} while (--max_retry);

	if (!max_retry)
		return false;

	mtk_dp_video_config(mtk_dp);
	mtk_dp_video_enable(mtk_dp, true);

	return true;
}

Regards,
CK



