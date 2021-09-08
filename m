Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A5B403456
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 08:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9F746E133;
	Wed,  8 Sep 2021 06:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de
 [IPv6:2001:67c:670:201:290:27ff:fe1d:cc33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE2156E133
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 06:39:51 +0000 (UTC)
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNrF7-000821-T7; Wed, 08 Sep 2021 08:39:33 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1mNrF3-00031K-86; Wed, 08 Sep 2021 08:39:29 +0200
Message-ID: <5ffef736524f3d7fb69f97332576ee9913032bcd.camel@pengutronix.de>
Subject: Re: [PATCH v10 07/17] dt-bindings: display: mediatek: merge: add
 additional prop for mt8195
From: Philipp Zabel <p.zabel@pengutronix.de>
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>,  Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, David Airlie <airlied@linux.ie>, Daniel Vetter
 <daniel@ffwll.ch>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 hsinyi@chromium.org, fshao@chromium.org, Yongqiang Niu
 <yongqiang.niu@mediatek.com>,  nancy.lin@mediatek.com,
 singo.chang@mediatek.com, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org,  dri-devel@lists.freedesktop.org
Date: Wed, 08 Sep 2021 08:39:29 +0200
In-Reply-To: <20210908060312.24007-8-jason-jh.lin@mediatek.com>
References: <20210908060312.24007-1-jason-jh.lin@mediatek.com>
 <20210908060312.24007-8-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: dri-devel@lists.freedesktop.org
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

Hi Jason,

On Wed, 2021-09-08 at 14:03 +0800, jason-jh.lin wrote:
> add MERGE additional properties description for mt8195:
> 1. async clock
> 2. fifo setting enable
> 3. reset controller
>=20
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
>  .../display/mediatek/mediatek,merge.yaml      | 30 +++++++++++++++++++
>  1 file changed, 30 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
merge.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,me=
rge.yaml
> index 75beeb207ceb..0fe204d9ad2c 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,merge.y=
aml
> @@ -38,6 +38,19 @@ properties:
>    clocks:
>      items:
>        - description: MERGE Clock
> +      - description: MERGE Async Clock
> +          Controlling the synchronous process between MERGE and other di=
splay
> +          function blocks cross clock domain.
> +
> +  mediatek,merge-fifo-en:
> +    description:
> +      The setting of merge fifo is mainly provided for the display laten=
cy
> +      buffer to ensure that the back-end panel display data will not be
> +      underrun, a little more data is needed in the fifo.
> +      According to the merge fifo settings, when the water level is dete=
cted
> +      to be insufficient, it will trigger RDMA sending ultra and preulra
> +      command to SMI to speed up the data rate.
> +    type: boolean
> =20
>    mediatek,gce-client-reg:
>      description:
> @@ -50,6 +63,10 @@ properties:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      maxItems: 1
> =20
> +  resets:
> +    description: reset controller
> +      See Documentation/devicetree/bindings/reset/reset.txt for details.

From the example this looks like it could have a maxItems: 1.

> +
>  required:
>    - compatible
>    - reg

Should the resets property be required for "mediatek,mt8195-disp-merge"?

> @@ -67,3 +84,16 @@ examples:
>          power-domains =3D <&spm MT8173_POWER_DOMAIN_MM>;
>          clocks =3D <&mmsys CLK_MM_DISP_MERGE>;
>      };
> +
> +    merge5: disp_vpp_merge5@1c110000 {
> +        compatible =3D "mediatek,mt8195-disp-merge";
> +        reg =3D <0 0x1c110000 0 0x1000>;
> +        interrupts =3D <GIC_SPI 507 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks =3D <&vdosys1 CLK_VDO1_VPP_MERGE4>,
> +                 <&vdosys1 CLK_VDO1_MERGE4_DL_ASYNC>;
> +        clock-names =3D "merge","merge_async";
> +        power-domains =3D <&spm MT8195_POWER_DOMAIN_VDOSYS1>;
> +        mediatek,gce-client-reg =3D <&gce1 SUBSYS_1c11XXXX 0x0000 0x1000=
>;
> +        mediatek,merge-fifo-en =3D <1>;
> +        resets =3D <&vdosys1 MT8195_VDOSYS1_SW0_RST_B_MERGE4_DL_ASYNC>;
> +    };

regards
Philipp
