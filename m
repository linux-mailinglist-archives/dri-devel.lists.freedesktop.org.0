Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0E754F2D4
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jun 2022 10:27:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA0AC10F12C;
	Fri, 17 Jun 2022 08:27:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3859F10F12C
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jun 2022 08:27:04 +0000 (UTC)
X-UUID: 7ba1a5c9b1114ed5baac875b53b3956a-20220617
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.6, REQID:515ee71a-d3e2-4642-9db6-0cba937dff52, OB:20,
 L
 OB:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,AC
 TION:release,TS:45
X-CID-INFO: VERSION:1.1.6, REQID:515ee71a-d3e2-4642-9db6-0cba937dff52, OB:20,
 LOB
 :0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:45,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:45
X-CID-META: VersionHash:b14ad71, CLOUDID:dfc29ff6-e099-41ba-a32c-13b8bfe63214,
 C
 OID:d65a67a1ec62,Recheck:0,SF:28|17|19|48,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7ba1a5c9b1114ed5baac875b53b3956a-20220617
Received: from mtkcas11.mediatek.inc [(172.21.101.40)] by mailgw02.mediatek.com
 (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1664422747; Fri, 17 Jun 2022 16:26:58 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Fri, 17 Jun 2022 16:26:56 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 17 Jun 2022 16:26:56 +0800
Message-ID: <9d924423c2b7ded984e2daf42a3667332dabbee2.camel@mediatek.com>
Subject: Re: [PATCH v11 05/10] drm/mediatek: Add MT8195 Embedded DisplayPort
 driver
From: Rex-BC Chen <rex-bc.chen@mediatek.com>
To: CK Hu <ck.hu@mediatek.com>, "chunkuang.hu@kernel.org"
 <chunkuang.hu@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
 "daniel@ffwll.ch" <daniel@ffwll.ch>, "robh+dt@kernel.org"
 <robh+dt@kernel.org>, "krzysztof.kozlowski+dt@linaro.org"
 <krzysztof.kozlowski+dt@linaro.org>, "mripard@kernel.org"
 <mripard@kernel.org>, "tzimmermann@suse.de" <tzimmermann@suse.de>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "deller@gmx.de"
 <deller@gmx.de>, "airlied@linux.ie" <airlied@linux.ie>
Date: Fri, 17 Jun 2022 16:26:55 +0800
In-Reply-To: <d5416a2f2a655f6574b17597fdc22615fe2fc22a.camel@mediatek.com>
References: <20220610105522.13449-1-rex-bc.chen@mediatek.com>
 <20220610105522.13449-6-rex-bc.chen@mediatek.com>
 <d5416a2f2a655f6574b17597fdc22615fe2fc22a.camel@mediatek.com>
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
 "granquet@baylibre.com" <granquet@baylibre.com>,
 Jitao Shi =?UTF-8?Q?=28=E7=9F=B3=E8=AE=B0=E6=B6=9B=29?=
 <jitao.shi@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "msp@baylibre.com" <msp@baylibre.com>, Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "wenst@chromium.org" <wenst@chromium.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2022-06-15 at 10:58 +0800, CK Hu wrote:
> Hi, Bo-Chen:
> 
> On Fri, 2022-06-10 at 18:55 +0800, Bo-Chen Chen wrote:
> > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > 
> > This patch adds a embedded displayport driver for the MediaTek
> > mt8195
> > SoC.
> > 
> > It supports the MT8195, the embedded DisplayPort units. It offers
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
> > Jitao shi <jitao.shi@mediatek.com>
> > 
> > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > [Bo-Chen: Cleanup the drivers and modify comments from reviewers]
> > Signed-off-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
> > ---
> 
> [snip]
> 
> > +
> > +static int mtk_dp_train_flow(struct mtk_dp *mtk_dp, u8
> > target_link_rate,
> > +			     u8 target_lane_count)
> > +{
> > +	u8 lane_adjust[2] = {};
> > +	bool pass_tps1 = false;
> > +	bool pass_tps2_3 = false;
> > +	int train_retries;
> > +	int status_control;
> > +	int iteration_count;
> > +	int ret;
> > +	u8 prev_lane_adjust;
> > +
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LINK_BW_SET,
> > target_link_rate);
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
> > +			   target_lane_count |
> > DP_LANE_COUNT_ENHANCED_FRAME_EN);
> > +
> > +	if (mtk_dp->train_info.sink_ssc)
> > +		drm_dp_dpcd_writeb(&mtk_dp->aux, DP_DOWNSPREAD_CTRL,
> > +				   DP_SPREAD_AMP_0_5);
> > +
> > +	train_retries = 0;
> > +	status_control = 0;
> > +	iteration_count = 1;
> > +	prev_lane_adjust = 0xFF;
> > +
> > +	mtk_dp_set_lanes(mtk_dp, target_lane_count / 2);
> > +	ret = mtk_dp_phy_configure(mtk_dp, target_link_rate,
> > target_lane_count);
> > +	if (ret)
> > +		return -EINVAL;
> > +
> > +	dev_dbg(mtk_dp->dev,
> > +		"Link train target_link_rate = 0x%x, target_lane_count
> > = 0x%x\n",
> > +		target_link_rate, target_lane_count);
> > +
> > +	do {
> > +		train_retries++;
> > +		if (!mtk_dp->train_info.cable_plugged_in ||
> > +		    mtk_dp->train_info.irq_sta.hpd_disconnect) {
> 
> In mtk_dp_hpd_isr_handler(), train_info.irq_sta.hpd_disconnect would
> finally be set to false, so you need not to check it here. So remove
> it
> here.
> 

Hello CK,

ok, I will drop this.

> > +			return -ENODEV;
> > +		}
> > +
> > +		if (mtk_dp->train_state < MTK_DP_TRAIN_STATE_TRAINING)
> > +			return -EAGAIN;
> > +
> > +		if (!pass_tps1) {
> > +			ret = mtk_dp_train_tps_1(mtk_dp,
> > target_lane_count,
> > +						 &iteration_count,
> > lane_adjust,
> > +						 &status_control,
> > +						 &prev_lane_adjust);
> > +			if (!ret) {
> > +				pass_tps1 = true;
> > +				train_retries = 0;
> > +			} else if (ret == -EINVAL) {
> > +				break;
> > +			}
> > +		} else {
> > +			ret = mtk_dp_train_tps_2_3(mtk_dp,
> > target_link_rate,
> > +						   target_lane_count,
> > +						   &iteration_count,
> > +						   lane_adjust,
> > &status_control,
> > +						   &prev_lane_adjust);
> > +			if (!ret) {
> > +				pass_tps2_3 = true;
> > +				break;
> > +			} else if (ret == -EINVAL) {
> > +				break;
> > +			}
> > +		}
> > +
> > +		drm_dp_dpcd_read(&mtk_dp->aux,
> > DP_ADJUST_REQUEST_LANE0_1,
> > +				 lane_adjust, sizeof(lane_adjust));
> > +		mtk_dp_train_update_swing_pre(mtk_dp,
> > target_lane_count,
> > +					      lane_adjust);
> > +	} while (train_retries < MTK_DP_TRAIN_RETRY_LIMIT &&
> > +		 iteration_count < MTK_DP_TRAIN_MAX_ITERATIONS);
> > +
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_TRAINING_PATTERN_SET,
> > +			   DP_TRAINING_PATTERN_DISABLE);
> > +	ret = mtk_dp_train_set_pattern(mtk_dp, 0);
> > +	if (ret)
> > +		return -EINVAL;
> > +
> > +	if (!pass_tps2_3)
> > +		return -ETIMEDOUT;
> > +
> > +	mtk_dp->train_info.link_rate = target_link_rate;
> > +	mtk_dp->train_info.lane_count = target_lane_count;
> > +
> > +	mtk_dp_training_set_scramble(mtk_dp, true);
> > +
> > +	drm_dp_dpcd_writeb(&mtk_dp->aux, DP_LANE_COUNT_SET,
> > +			   target_lane_count |
> > +				   DP_LANE_COUNT_ENHANCED_FRAME_EN);
> > +	mtk_dp_set_enhanced_frame_mode(mtk_dp, true);
> > +
> > +	return ret;
> > +}
> > +
> 
> [snip]
> 
> > +
> > +/*
> > + * We need to handle HPD signal in eDP even though eDP is a always
> > connected
> > + * device. Besides connected status, there is another feature for
> > HPD signal -
> > + * HPD pulse: it presents an IRQ from sink devices to source
> > devices
> > (Refer to
> > + * 5.1.4 of DP1.4 spec).
> > + */
> > +static irqreturn_t mtk_dp_hpd_isr_handler(struct mtk_dp *mtk_dp)
> > +{
> > +	bool connected;
> > +	u32 irq_status = mtk_dp_swirq_get_clear(mtk_dp) |
> > +			 mtk_dp_hwirq_get_clear(mtk_dp);
> > +	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
> > +
> > +	if (irq_status & MTK_DP_HPD_INTERRUPT)
> > +		train_info->irq_sta.hpd_inerrupt = true;
> > +	if (irq_status & MTK_DP_HPD_CONNECT)
> > +		train_info->irq_sta.hpd_connect = true;
> > +	if (irq_status & MTK_DP_HPD_DISCONNECT)
> > +		train_info->irq_sta.hpd_disconnect = true;
> > +
> 
> train_info->irq_sta.hpd_connect is used only in this function, so let
> hpd_connect to be local variable.
> 

ok

> > +	if (!irq_status)
> > +		return IRQ_HANDLED;
> > +
> > +	connected = mtk_dp_plug_state(mtk_dp);
> > +	if (connected || !train_info->cable_plugged_in)
> > +		train_info->irq_sta.hpd_disconnect  = false;
> > +	else if (!connected || train_info->cable_plugged_in)
> > +		train_info->irq_sta.hpd_connect = false;
> > +
> > +	if (!(train_info->irq_sta.hpd_connect ||
> > +	      train_info->irq_sta.hpd_disconnect))
> > +		return IRQ_WAKE_THREAD;
> > +
> > +	if (train_info->irq_sta.hpd_connect) {
> > +		train_info->irq_sta.hpd_connect = false;
> > +		train_info->cable_plugged_in = true;
> > +	} else {
> > +		train_info->irq_sta.hpd_disconnect = false;
> > +		train_info->cable_plugged_in = false;
> > +		mtk_dp->train_state = MTK_DP_TRAIN_STATE_TRAINING;
> > +	}
> > +	train_info->cable_state_change = true;
> > +
> > +	return IRQ_WAKE_THREAD;
> > +}
> > +
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
> > +	    mtk_dp->train_info.irq_sta.hpd_disconnect) {
> 
> In mtk_dp_hpd_isr_handler(), train_info.irq_sta.hpd_disconnect would
> finally be set to false, so you need not to check it here. So remove
> it
> here.
> 

ok, I will drop this

BRs,
Bo-Chen

> Regards,
> CK
> 
> > +		ret = -EAGAIN;
> > +		goto err;
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
> > +		ret = -EINVAL;
> > +		goto err;
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
> > +			ret = mtk_dp_aux_do_transfer(mtk_dp, is_read,
> > request,
> > +						     msg->address +
> > accessed_bytes,
> > +						     msg->buffer +
> > accessed_bytes,
> > +						     to_access);
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
> > +err:
> > +	if (ret) {
> > +		msg->reply = DP_AUX_NATIVE_REPLY_NACK |
> > DP_AUX_I2C_REPLY_NACK;
> > +		return ret;
> > +	}
> > +
> > +	msg->reply = DP_AUX_NATIVE_REPLY_ACK | DP_AUX_I2C_REPLY_ACK;
> > +	return msg->size;
> > +}
> > +
> 
> 

