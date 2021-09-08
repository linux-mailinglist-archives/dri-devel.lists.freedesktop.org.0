Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 918A0403541
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 09:24:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 682F36E14D;
	Wed,  8 Sep 2021 07:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A7086E14D
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 07:24:43 +0000 (UTC)
X-UUID: 55abe93ce43d45f18f51a92e5edc81da-20210908
X-UUID: 55abe93ce43d45f18f51a92e5edc81da-20210908
Received: from mtkexhb01.mediatek.inc [(172.21.101.102)] by
 mailgw01.mediatek.com (envelope-from <jason-jh.lin@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1865226570; Wed, 08 Sep 2021 15:24:38 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 8 Sep 2021 15:24:36 +0800
Received: from mtkcas07.mediatek.inc (172.21.101.84) by mtkcas07.mediatek.inc
 (172.21.101.84) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 8 Sep 2021 15:24:36 +0800
Received: from mtksdccf07 (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 8 Sep 2021 15:24:36 +0800
Message-ID: <adf8bebaccba94a3d84f6c3400628ea8adaebed1.camel@mediatek.com>
Subject: Re: [PATCH v10 07/17] dt-bindings: display: mediatek: merge: add
 additional prop for mt8195
From: Jason-JH Lin <jason-jh.lin@mediatek.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, Chun-Kuang Hu
 <chunkuang.hu@kernel.org>
CC: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>,
 <hsinyi@chromium.org>, <fshao@chromium.org>, Yongqiang Niu
 <yongqiang.niu@mediatek.com>, <nancy.lin@mediatek.com>,
 <singo.chang@mediatek.com>, <devicetree@vger.kernel.org>,
 <linux-stm32@st-md-mailman.stormreply.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>
Date: Wed, 8 Sep 2021 15:24:36 +0800
In-Reply-To: <5ffef736524f3d7fb69f97332576ee9913032bcd.camel@pengutronix.de>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
 <20210908060312.24007-8-jason-jh.lin@mediatek.com>
 <5ffef736524f3d7fb69f97332576ee9913032bcd.camel@pengutronix.de>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Philipp,

Thanks for the reviews.

On Wed, 2021-09-08 at 08:39 +0200, Philipp Zabel wrote:
> Hi Jason,
> 
> On Wed, 2021-09-08 at 14:03 +0800, jason-jh.lin wrote:
> > add MERGE additional properties description for mt8195:
> > 1. async clock
> > 2. fifo setting enable
> > 3. reset controller
> > 
> > Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> > ---
> >  .../display/mediatek/mediatek,merge.yaml      | 30
> > +++++++++++++++++++
> >  1 file changed, 30 insertions(+)
> > 
> > diff --git
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > index 75beeb207ceb..0fe204d9ad2c 100644
> > ---
> > a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > +++
> > b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge
> > .yaml
> > @@ -38,6 +38,19 @@ properties:
> >    clocks:
> >      items:
> >        - description: MERGE Clock
> > +      - description: MERGE Async Clock
> > +          Controlling the synchronous process between MERGE and
> > other display
> > +          function blocks cross clock domain.
> > +
> > +  mediatek,merge-fifo-en:
> > +    description:
> > +      The setting of merge fifo is mainly provided for the display
> > latency
> > +      buffer to ensure that the back-end panel display data will
> > not be
> > +      underrun, a little more data is needed in the fifo.
> > +      According to the merge fifo settings, when the water level
> > is detected
> > +      to be insufficient, it will trigger RDMA sending ultra and
> > preulra
> > +      command to SMI to speed up the data rate.
> > +    type: boolean
> >  
> >    mediatek,gce-client-reg:
> >      description:
> > @@ -50,6 +63,10 @@ properties:
> >      $ref: /schemas/types.yaml#/definitions/phandle-array
> >      maxItems: 1
> >  
> > +  resets:
> > +    description: reset controller
> > +      See Documentation/devicetree/bindings/reset/reset.txt for
> > details.
> 
> From the example this looks like it could have a maxItems: 1.

OK, I think it could have a maxItems: 1 in mt8195 because
merge1~megre5 only have one async clock.

> 
> > +
> >  required:
> >    - compatible
> >    - reg
> 
> Should the resets property be required for "mediatek,mt8195-disp-
> merge"?

I think the resets property is not the required propoerty.
The reset controller is for async clock of MERGE module on vdosys1.
MERGE module on vdosys0 doesn't have async clock, so it doesn't need to
add the resets property.

Regards,
Jason-JH.Lin
> 
> > @@ -67,3 +84,16 @@ examples:
> >          power-domains = <&spm MT8173_POWER_DOMAIN_MM>;
> >          clocks = <&mmsys CLK_MM_DISP_MERGE>;
> >      };
> > +
> > +    merge5: disp_vpp_merge5@1c110000 {
> > +        compatible = "mediatek,mt8195-disp-merge";
> > +        reg = <0 0x1c110000 0 0x1000>;
> > +        interrupts = <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> > +        clocks = <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> > +                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> > +        clock-names = "merge","merge_async";
> > +        power-domains = <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> > +        mediatek,gce-client-reg = <&gce1 SUBSYS_1c11XXXX 0x0000
> > 0x1000>;
> > +        mediatek,merge-fifo-en = <1>;
> > +        resets = <&vdosys1
> > MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> > +    };
> 
> regards
> Philipp
-- 
Jason-JH Lin <jason-jh.lin@mediatek.com>

