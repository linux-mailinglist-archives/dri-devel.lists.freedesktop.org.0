Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4D2A5430DD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 14:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CED8810FD76;
	Wed,  8 Jun 2022 12:54:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7236910FD76
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jun 2022 12:54:23 +0000 (UTC)
X-UUID: cc31f711586f46a2a3cc1ba1ab7b7834-20220608
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5, REQID:a8661de1-c5b3-4c18-bb21-ffd838d2566f, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:2a19b09, CLOUDID:aa611de5-2ba2-4dc1-b6c5-11feb6c769e0,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
 ,QS:0,BEC:nil
X-UUID: cc31f711586f46a2a3cc1ba1ab7b7834-20220608
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw02.mediatek.com (envelope-from <rex-bc.chen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1477899185; Wed, 08 Jun 2022 20:54:16 +0800
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; 
 Wed, 8 Jun 2022 20:54:14 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.3 via Frontend
 Transport; Wed, 8 Jun 2022 20:54:14 +0800
Message-ID: <61ed067bc117a67ccdf64420401605c2fadfe43a.camel@mediatek.com>
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
Date: Wed, 8 Jun 2022 20:54:14 +0800
In-Reply-To: <79bea587e20de842d48dcb2e1da19e276f9d635b.camel@mediatek.com>
References: <20220523104758.29531-1-granquet@baylibre.com>
 <20220523104758.29531-19-granquet@baylibre.com>
 <b8aef76cef2fa434401b6a016de291eb24198faa.camel@mediatek.com>
 <4329859ca11c13e7f6a9951b01a779fc391f029b.camel@mediatek.com>
 <79bea587e20de842d48dcb2e1da19e276f9d635b.camel@mediatek.com>
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

On Wed, 2022-06-08 at 10:44 +0800, CK Hu wrote:
> Hi, Rex:
> 
> On Tue, 2022-06-07 at 20:44 +0800, Rex-BC Chen wrote:
> > On Tue, 2022-06-07 at 14:44 +0800, CK Hu wrote:
> > > Hi, Rex:
> > > 
> > > On Mon, 2022-05-23 at 12:47 +0200, Guillaume Ranquet wrote:
> > > > From: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > 
> > > > This patch adds a DisplayPort driver for the Mediatek mt8195
> > > > SoC.
> > > > 
> > > > It supports the mt8195, the embedded DisplayPort units. It
> > > > offers
> > > > DisplayPort 1.4 with up to 4 lanes.
> > > > 
> > > > The driver creates a child device for the phy. The child device
> > > > will
> > > > never exist without the parent being active. As they are
> > > > sharing
> > > > a
> > > > register range, the parent passes a regmap pointer to the child
> > > > so
> > > > that
> > > > both can work with the same register range. The phy driver sets
> > > > device
> > > > data that is read by the parent to get the phy device that can
> > > > be
> > > > used
> > > > to control the phy properties.
> > > > 
> > > > This driver is based on an initial version by
> > > > Jason-JH.Lin <jason-jh.lin@mediatek.com>.
> > > > 
> > > > Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> > > > Signed-off-by: Guillaume Ranquet <granquet@baylibre.com>
> > > > ---
> > > 
> > > [snip]
> > > 
> > > > +
> > > > +static int mtk_dp_train_handler(struct mtk_dp *mtk_dp)
> > > > +{
> > > > +	bool training_done = false;
> > > > +	short max_retry = 50;
> > > > +	int ret = 0;
> > > > +
> > > > +	do {
> > > > +		switch (mtk_dp->train_state) {
> > > > +		case MTK_DP_TRAIN_STATE_STARTUP:
> > > 
> > > mtk_dp->train_state is initialized as MTK_DP_TRAIN_STATE_STARTUP
> > > even
> > > though HPD ISR does not exist. Does this mean HPD ISR is
> > > redundant?
> > > If
> > > HPD ISR is not redundant, create a new state
> > > MTK_DP_TRAIN_STATE_NONE
> > > for init state.
> > > 
> > 
> > Hello CK,
> > 
> > I think we don't need MTK_DP_TRAIN_STATE_NONE.
> > Because it's "DP_TRAIN_STATE" not "DP_STATE", I think it's ok if we
> > start this state machine with "MTK_DP_TRAIN_STATE_STARTUP".
> 
> The initial state is MTK_DP_TRAIN_STATE_STARTUP, and HPD thread would
> change state from MTK_DP_TRAIN_STATE_STARTUP to
> MTK_DP_TRAIN_STATE_STARTUP, this is redundant. So drop the state
> change
> in HPD thread.
> 

ok, in edp it's redundant in mtk_dp_hpd_event_thread(), but I will add
it back in dp patch.

> > 
> > > > +			mtk_dp_state_handler(mtk_dp);
> > > > +			mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_CHECKCAP;
> > > > +			break;
> > > > +
> > > > +		case MTK_DP_TRAIN_STATE_CHECKCAP:
> > > > +			if (mtk_dp_parse_capabilities(mtk_dp))
> > > > {
> > > > +				mtk_dp-
> > > > >train_info.check_cap_count = 0;
> > > > +				mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_CHECKEDID;
> > > > +			} else {
> > > > +				mtk_dp-
> > > > >train_info.check_cap_count++;
> > > > +
> > > > +				if (mtk_dp-
> > > > >train_info.check_cap_count
> > > > > 
> > > > 
> > > > +				    MTK_DP_CHECK_SINK_CAP_TIMEO
> > > > UT_COUNT
> > > > ) {
> > > > +					mtk_dp-
> > > > > train_info.check_cap_count = 0;
> > > > 
> > > > +					mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_DPIDLE;
> > > > +					ret = -ETIMEDOUT;
> > > > +				}
> > > > +			}
> > > > +			break;
> > > > +
> > > > +		case MTK_DP_TRAIN_STATE_CHECKEDID:
> > > > +			mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_TRAINING_PRE;
> > > 
> > > MTK_DP_TRAIN_STATE_CHECKEDID is a redundant state, drop it.
> > > 
> > > > +			break;
> > > > +
> > > > +		case MTK_DP_TRAIN_STATE_TRAINING_PRE:
> > > > +			mtk_dp_state_handler(mtk_dp);
> > > > +			mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_TRAINING;
> > > > +			break;
> > > > +
> > > > +		case MTK_DP_TRAIN_STATE_TRAINING:
> > > > +			ret = mtk_dp_train_start(mtk_dp);
> > > > +			if (ret == 0) {
> > > > +				mtk_dp_video_mute(mtk_dp,
> > > > true);
> > > > +				mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_NORMAL;
> > > > +				mtk_dp_fec_enable(mtk_dp,
> > > > mtk_dp-
> > > > > has_fec);
> > > > 
> > > > +			} else if (ret != -EAGAIN) {
> > > > +				mtk_dp->train_state =
> > > > MTK_DP_TRAIN_STATE_DPIDLE;
> > > > +			}
> > > > +			break;
> > > > +		case MTK_DP_TRAIN_STATE_NORMAL:
> > > > +			mtk_dp_state_handler(mtk_dp);
> > > > +			training_done = true;
> > > > +			break;
> > > > +		case MTK_DP_TRAIN_STATE_DPIDLE:
> > > 
> > > When would this case happen?
> > > 
> > > Regards,
> > > CK
> > 
> > Yes, if it's disconnected if we are still training for dp.
> > or failed to training min spec RBR.
> 
> I mean, every time state change to MTK_DP_TRAIN_STATE_DPIDLE, it
> would
> jump out of this loop and would not get into this loop, so this case
> would never get in. This is redundant, so remove this.
> 
> Regards,
> CK
> 

ok, I will remove it

BRs,
Bo-Chen

> > 
> > BRs,
> > Rex
> > > 
> > > > +			break;
> > > > +		default:
> > > > +			break;
> > > > +		}
> > > > +
> > > > +		if (ret) {
> > > > +			if (ret == -EAGAIN)
> > > > +				continue;
> > > > +			/*
> > > > +			 * If we get any other error number, it
> > > > doesn't
> > > > +			 * make any sense to keep iterating.
> > > > +			 */
> > > > +			break;
> > > > +		}
> > > > +	} while (!training_done || --max_retry);
> > > > +
> > > > +	return ret;
> > > > +}
> > > 
> > > 
> > 
> > 
> 
> 

