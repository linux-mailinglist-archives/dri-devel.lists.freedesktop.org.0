Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85B0F58C2C6
	for <lists+dri-devel@lfdr.de>; Mon,  8 Aug 2022 07:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66E114A397;
	Mon,  8 Aug 2022 05:22:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE628D27D
 for <dri-devel@lists.freedesktop.org>; Mon,  8 Aug 2022 05:22:02 +0000 (UTC)
X-UUID: d9445aa5bd2d4b018e3d6b324b5af82e-20220808
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=hQFOClsoBFUo+S5UAAJFv6gCUWt7W/fTQiotWmpTraQ=; 
 b=hi4t5vLDn89nDFsJpoIkAnqReudoLKapkZaWWOdpmx/pmaDu+bswgEZbJAHU7BnExL6rf42bDuLsHTHtADRV5JxDKbfhWbcKmY0IaKS+yaUUmfORjVkHcogys6m0vj9VoPZkuGOAnpp84rFFxetFt2Yc5oSPIpm8TRvXyUwzer8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.9, REQID:ff16173d-2816-48e2-99db-879f28142fea, OB:0,
 LO
 B:30,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release
 _Ham,ACTION:release,TS:45
X-CID-INFO: VERSION:1.1.9, REQID:ff16173d-2816-48e2-99db-879f28142fea, OB:0,
 LOB:
 30,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,BULK:0,RULE:Release_H
 am,ACTION:release,TS:45
X-CID-META: VersionHash:3d8acc9, CLOUDID:434bfc48-f57f-4088-93dd-066979cdb4e6,
 C
 OID:76cc9ae0fa5d,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: d9445aa5bd2d4b018e3d6b324b5af82e-20220808
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw02.mediatek.com (envelope-from <ck.hu@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1586861012; Mon, 08 Aug 2022 13:21:57 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.186) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 8 Aug 2022 13:21:55 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 8 Aug 2022 13:21:55 +0800
Message-ID: <150988eef41cac1e1c4b422cf1ad65c10309f472.camel@mediatek.com>
Subject: Re: [PATCH v16 3/8] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: CK Hu <ck.hu@mediatek.com>
To: Bo-Chen Chen <rex-bc.chen@mediatek.com>, <chunkuang.hu@kernel.org>,
 <p.zabel@pengutronix.de>, <daniel@ffwll.ch>, <robh+dt@kernel.org>,
 <krzysztof.kozlowski+dt@linaro.org>, <mripard@kernel.org>,
 <tzimmermann@suse.de>, <matthias.bgg@gmail.com>, <deller@gmx.de>,
 <airlied@linux.ie>
Date: Mon, 8 Aug 2022 13:21:55 +0800
In-Reply-To: <20220805101459.3386-4-rex-bc.chen@mediatek.com>
References: <20220805101459.3386-1-rex-bc.chen@mediatek.com>
 <20220805101459.3386-4-rex-bc.chen@mediatek.com>
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

On Fri, 2022-08-05 at 18:14 +0800, Bo-Chen Chen wrote:
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
> Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> Tested-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> Reviewed-by: AngeloGioacchino Del Regno <
> angelogioacchino.delregno@collabora.com>
> ---

[snip]

> +
> +static void mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
> +{
> +	ssize_t ret;
> +	u8 link_status[DP_LINK_STATUS_SIZE] = {};
> +	u32 link_status_reg = DP_LANE0_1_STATUS;
> +
> +	ret = drm_dp_dpcd_read(&mtk_dp->aux, link_status_reg,
> link_status,
> +			       sizeof(link_status));
> +	if (!ret) {
> +		drm_err(mtk_dp->drm_dev, "Read link status failed\n");
> +		return;
> +	}
> +
> +	if (!drm_dp_channel_eq_ok(link_status, mtk_dp-
> >train_info.lane_count)) {
> +		drm_err(mtk_dp->drm_dev, "Channel EQ failed\n");
> +		return;
> +	}
> +
> +	if (link_status[1] & DP_REMOTE_CONTROL_COMMAND_PENDING)

I does not see any other DP driver process
DP_REMOTE_CONTROL_COMMAND_PENDING, why mtk dp driver process it? If
this is an advanced function, separate this to an independent patch.

Regards,
CK

> +		drm_dp_dpcd_writeb(&mtk_dp->aux,
> DP_DEVICE_SERVICE_IRQ_VECTOR,
> +				   DP_REMOTE_CONTROL_COMMAND_PENDING);
> +}
> +
> 

