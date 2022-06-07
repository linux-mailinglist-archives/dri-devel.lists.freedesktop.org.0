Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DEB553FF48
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jun 2022 14:46:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B708210EC3F;
	Tue,  7 Jun 2022 12:46:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B5310EC42
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jun 2022 12:46:38 +0000 (UTC)
X-UUID: 4536014a1aa64cfc89fa6006743de399-20220607
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:e63a083f-6cd4-4694-9894-e2fb43d438b0, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACT
 ION:release,TS:45
X-CID-INFO: VERSION:1.1.5, REQID:e63a083f-6cd4-4694-9894-e2fb43d438b0, OB:0,
 LOB:
 0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTIO
 N:release,TS:45
X-CID-META: VersionHash:2a19b09, CLOUDID:3d317e7e-c8dc-403a-96e8-6237210dceee,
 C
 OID:1fd60574827d,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:0,BEC:nil
X-UUID: 4536014a1aa64cfc89fa6006743de399-20220607
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by
 mailgw01.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 727649322; Tue, 07 Jun 2022 20:46:33 +0800
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Tue, 7 Jun 2022 20:46:31 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Tue, 7 Jun 2022 20:46:31 +0800
Message-ID: <fc37991f28247f593f0db668a2c1773e41ff9472.camel@mediatek.com>
Subject: Re: [PATCH v10 18/21] drm/mediatek: Add mt8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, Guillaume Ranquet <granquet@baylibre.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel
 <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chunfeng Yun
 =?UTF-8?Q?=28=E4=BA=91=E6=98=A5=E5=B3=B0=29?= <Chunfeng.Yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>, Helge
 Deller <deller@gmx.de>, Jitao Shi
 =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?= <jitao.shi@mediatek.com>
Date: Tue, 7 Jun 2022 20:46:31 +0800
In-Reply-To: <a93e5600ca3526651b728eceba51145b96d58037.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-19-granquet@baylibre.com>
 <a93e5600ca3526651b728eceba51145b96d58037.camel@mediatek.com>
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-fbdev@vger.kernel.org" <linux-fbdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Markus Schneider-Pargmann <msp@baylibre.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2022-06-07 at 15:30 +0800, CK Hu wrote:
> Hi, Rex:
> 
> On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a DisplayPort driver for the Mediatek mt8195 SoC.
> > 
> > It supports the mt8195, the embedded DisplayPort units. It offers
> > DisplayPort 1.4 with up to 4 lanes.
> > 
> > The driver creates a child device for the phy. The child device
> > will
> > never exist without the parent being active. As they are sharing a
> > register range, the parent passes a regmap pointer to the child so
> > that
> > both can work with the same register range. The phy driver sets
> > device
> > data that is read by the parent to get the phy device that can be
> > used
> > to control the phy properties.
> > 
> > This driver is based on an initial version by
> > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > ---
> 
> [snip]
> 
> > +
> > +static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
> > +				   struct drm_dp_aux_msg *msg)
> > +{
> > +	struct mtk_dp *mtk_dp;
> > +	bool is_read;
> > +	u8 request;
> > +	size_t accessed_bytes = 0;
> > +	int ret = 0;
> > +
> > +	mtk_dp = container_of(mtk_aux, struct mtk_dp, aux);
> > +
> > +	if (!mtk_dp->train_info.cable_plugged_in ||
> > +	    mtk_dp->train_info.irq_status & MTK_DP_HPD_DISCONNECT) {
> > +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_CHECKCAP;
> 
> Changing state here has no any effect, so drop this.
> 

ok, I will drop it.

> > +		return -EAGAIN;
> > +	}
> > +
> > +	switch (msg->request) {
> > +	case DP_AUX_I2C_MOT:
> > +	case DP_AUX_I2C_WRITE:
> > +	case DP_AUX_NATIVE_WRITE:
> > +	case DP_AUX_I2C_WRITE_STATUS_UPDATE:
> > +	case DP_AUX_I2C_WRITE_STATUS_UPDATE | DP_AUX_I2C_MOT:
> > +		request = msg->request &
> > ~DP_AUX_I2C_WRITE_STATUS_UPDATE;
> > +		is_read = false;
> > +		break;
> > +	case DP_AUX_I2C_READ:
> > +	case DP_AUX_NATIVE_READ:
> > +	case DP_AUX_I2C_READ | DP_AUX_I2C_MOT:
> > +		request = msg->request;
> > +		is_read = true;
> > +		break;
> > +	default:
> > +		drm_err(mtk_aux->drm_dev, "invalid aux cmd = %d\n",
> > +			msg->request);
> > +		return -EINVAL;
> > +	}
> > +
> > +	if (msg->size == 0) {
> > +		ret = mtk_dp_aux_do_transfer(mtk_dp, is_read, request,
> > +					     msg->address +
> > accessed_bytes,
> > +					     msg->buffer +
> > accessed_bytes, 0);
> > +	} else {
> > +		while (accessed_bytes < msg->size) {
> > +			size_t to_access =
> > +				min_t(size_t, DP_AUX_MAX_PAYLOAD_BYTES,
> > +				      msg->size - accessed_bytes);
> > +
> > +			ret = mtk_dp_aux_do_transfer(mtk_dp,
> > +						     is_read, request,
> > +							 msg->address +
> > accessed_bytes,
> > +							 msg->buffer +
> > accessed_bytes,
> > +							 to_access);
> > +
> > +			if (ret) {
> > +				drm_info(mtk_dp->drm_dev,
> > +					 "Failed to do AUX transfer:
> > %d\n", ret);
> > +				break;
> > +			}
> > +			accessed_bytes += to_access;
> > +		}
> > +	}
> > +
> > +	if (ret) {
> > +		msg->reply = DP_AUX_NATIVE_REPLY_NACK |
> > DP_AUX_I2C_REPLY_NACK;
> > +		return ret;
> > +	}
> > +
> > +	msg->reply = DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
> > +	return msg->size;
> > +}
> 
> 

