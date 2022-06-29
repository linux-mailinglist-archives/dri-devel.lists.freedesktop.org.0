Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0175155F5B0
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 07:34:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8AC112B26;
	Wed, 29 Jun 2022 05:34:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5DB11271C
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Jun 2022 05:34:19 +0000 (UTC)
X-UUID: 37ddd689f04e49b9bcd731470b3f0d60-20220629
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7, REQID:850cf4fb-fd0c-485d-b8b6-9c90c83c4667, OB:10,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.7, REQID:850cf4fb-fd0c-485d-b8b6-9c90c83c4667, OB:10,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:87442a2, CLOUDID:27d60e86-57f0-47ca-ba27-fe8c57fbf305,
 C
 OID:3081cad28a70,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 37ddd689f04e49b9bcd731470b3f0d60-20220629
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw02.mediatek.com
 (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1882402547; Wed, 29 Jun 2022 13:34:12 +0800
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Wed, 29 Jun 2022 13:34:10 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jun 2022 13:34:10 +0800
Message-ID: <78d71a052d214e0c11cab5c2f4dee39c4f67c0bc.camel@mediatek.com>
Subject: Re: [PATCH v12 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Wed, 29 Jun 2022 13:34:10 +0800
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
> +static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
> +			   0, SW_RST_B_PHYD);
> +
> +	/* Wait for power enable */
> +	usleep_range(10, 200);
> +
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
> +			   SW_RST_B_PHYD, SW_RST_B_PHYD);
> +	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +			   DP_PWR_STATE_BANDGAP_TPLL,
> DP_PWR_STATE_MASK);
> +}
> +
> +static void mtk_dp_power_disable(struct mtk_dp *mtk_dp)
> +{
> +	mtk_dp_write(mtk_dp, MTK_DP_TOP_PWR_STATE, 0);
> +
> +	mtk_dp_write(mtk_dp, MTK_DP_0034,
> +		     DA_CKM_CKTX0_EN_FORCE_EN |
> +		     DA_CKM_BIAS_LPF_EN_FORCE_VAL |
> +		     DA_CKM_BIAS_EN_FORCE_VAL |
> +		     DA_XTP_GLB_LDO_EN_FORCE_VAL |
> +		     DA_XTP_GLB_AVD10_ON_FORCE_VAL);
> +
> +	/* Disable RX */
> +	mtk_dp_write(mtk_dp, MTK_DP_1040, 0);

MTK_DP_1040 is set to 0 in mtk_dp_power_disable(), but it is not set to
other value in mtk_dp_power_enable(). Does any thing would be wrong
when mtk_dp_power_disable() and mtk_dp_power_enable()?

Regards,
CK

> +	mtk_dp_write(mtk_dp, MTK_DP_TOP_MEM_PD,
> +		     0x550 | BIT(FUSE_SEL_SHIFT) |
> BIT(MEM_ISO_EN_SHIFT));
> +}
> +

