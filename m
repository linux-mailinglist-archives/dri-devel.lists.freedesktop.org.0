Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC929785194
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 09:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA9610E2D1;
	Wed, 23 Aug 2023 07:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 125C910E2D1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 07:32:33 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id AD50F646E6;
 Wed, 23 Aug 2023 07:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68D70C433C7;
 Wed, 23 Aug 2023 07:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692775950;
 bh=oeJxFsLUX+jkWEdav/GnOIl5H5TmqsB9yM2IBgEkEOk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FcXiEniPnmAJgThA4ttyEjbnl/rg7BfenQrP+s13mwi8EM5GxWCwp2M46ZV6YRFXZ
 lAh0lyv30OOdCGhIjkmD9tMvAoZummCLZFuO+SyMRlajNdVUFc/6dKCx8/sM0H0xeG
 XOsqeLx6x+a3DdQxFcS3VGCZpG44VSdQBx2KVGap0Xwn2DInzYARKo65Uqta4oLSt+
 dOpYm3SglzA5vC6XdhWfLZzgL2K5tnSNpjBGCZcYx6x7UGOM6GHBeOfbahk0O7uD1g
 xERhP8qCCgCMklIjstcpcOariyyxzqD7nDBmm71DvDs4rtaEJqyTSNbNfTK8wdoc2d
 ERhzc7SWhM5TA==
Date: Wed, 23 Aug 2023 09:32:28 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Ying Liu <victor.liu@nxp.com>
Subject: Re: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add
 i.MX8qxp/qm DPU binding
Message-ID: <64bpiz5nt3xgboxya26gcdh6d7nyyflm2m56orgjwwwibh52n7@yk4ogdcierho>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-2-victor.liu@nxp.com>
 <scbtbu4cdjlsmbr6ugkpqslvfywidvbuqyekxuttfe4rmbp2st@lev2zfqe4h62>
 <AM7PR04MB70469E94D5FCFC46F51A72F3981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ktp5u4bmvdhpovpe"
Content-Disposition: inline
In-Reply-To: <AM7PR04MB70469E94D5FCFC46F51A72F3981CA@AM7PR04MB7046.eurprd04.prod.outlook.com>
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
 "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "tzimmermann@suse.de" <tzimmermann@suse.de>,
 Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>, dl-linux-imx <linux-imx@nxp.com>,
 "Laurentiu Palcu \(OSS\)" <laurentiu.palcu@oss.nxp.com>,
 Guido =?utf-8?Q?G=C3=BCnther?= <guido.gunther@puri.sm>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ktp5u4bmvdhpovpe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 23, 2023 at 02:45:53AM +0000, Ying Liu wrote:
> On  Tuesday, August 22, 2023 7:47 PM Maxime Ripard <mripard@kernel.org> w=
rote:
> >=20
> > Hi,
>=20
> Hi Maxime,
>=20
> Thanks for your review.
>=20
> >=20
> > On Tue, Aug 22, 2023 at 04:59:44PM +0800, Liu Ying wrote:
> > > This patch adds bindings for i.MX8qxp/qm Display Processing Unit.
> > >
> > > Reviewed-by: Rob Herring <robh@kernel.org>
> > > Signed-off-by: Liu Ying <victor.liu@nxp.com>
> > > ---
> > > v7->v14:
> > > * No change.
> > >
> > > v6->v7:
> > > * Add Rob's R-b tag back.
> > >
> > > v5->v6:
> > > * Use graph schema. So, drop Rob's R-b tag as review is needed.
> > >
> > > v4->v5:
> > > * No change.
> > >
> > > v3->v4:
> > > * Improve compatible property by using enum instead of oneOf+const.
> > (Rob)
> > > * Add Rob's R-b tag.
> > >
> > > v2->v3:
> > > * No change.
> > >
> > > v1->v2:
> > > * Fix yamllint warnings.
> > > * Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm, as
> > the
> > >   display controller subsystem spec does say that they exist.
> > > * Use new dt binding way to add clocks in the example.
> > > * Trivial tweaks for the example.
> > >
> > >  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml | 387 ++++++++++++++++=
++
> > >  1 file changed, 387 insertions(+)
> > >  create mode 100644
> > Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qx=
p-
> > dpu.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-
> > dpu.yaml
> > > new file mode 100644
> > > index 000000000000..6b05c586cd9d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-
> > dpu.yaml
> > > @@ -0,0 +1,387 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dpu.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Freescale i.MX8qm/qxp Display Processing Unit
> > > +
> > > +maintainers:
> > > +  - Liu Ying <victor.liu@nxp.com>
> > > +
> > > +description: |
> > > +  The Freescale i.MX8qm/qxp Display Processing Unit(DPU) is comprise=
d of
> > two
> > > +  main components that include a blit engine for 2D graphics acceler=
ations
> > > +  and a display controller for display output processing, as well as=
 a
> > command
> > > +  sequencer.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - fsl,imx8qxp-dpu
> > > +      - fsl,imx8qm-dpu
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  interrupts:
> > > +    items:
> > > +      - description: |
> > > +          store9 shadow load interrupt(blit engine)
> > > +      - description: |
> > > +          store9 frame complete interrupt(blit engine)
> > > +      - description: |
> > > +          store9 sequence complete interrupt(blit engine)
> > > +      - description: |
> > > +          extdst0 shadow load interrupt
> > > +          (display controller, content stream 0)
> > > +      - description: |
> > > +          extdst0 frame complete interrupt
> > > +          (display controller, content stream 0)
> > > +      - description: |
> > > +          extdst0 sequence complete interrupt
> > > +          (display controller, content stream 0)
> > > +      - description: |
> > > +          extdst4 shadow load interrupt
> > > +          (display controller, safety stream 0)
> > > +      - description: |
> > > +          extdst4 frame complete interrupt
> > > +          (display controller, safety stream 0)
> > > +      - description: |
> > > +          extdst4 sequence complete interrupt
> > > +          (display controller, safety stream 0)
> > > +      - description: |
> > > +          extdst1 shadow load interrupt
> > > +          (display controller, content stream 1)
> > > +      - description: |
> > > +          extdst1 frame complete interrupt
> > > +          (display controller, content stream 1)
> > > +      - description: |
> > > +          extdst1 sequence complete interrupt
> > > +          (display controller, content stream 1)
> > > +      - description: |
> > > +          extdst5 shadow load interrupt
> > > +          (display controller, safety stream 1)
> > > +      - description: |
> > > +          extdst5 frame complete interrupt
> > > +          (display controller, safety stream 1)
> > > +      - description: |
> > > +          extdst5 sequence complete interrupt
> > > +          (display controller, safety stream 1)
> > > +      - description: |
> > > +          disengcfg0 shadow load interrupt
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          disengcfg0 frame complete interrupt
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          disengcfg0 sequence complete interrupt
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          framegen0 programmable interrupt0
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          framegen0 programmable interrupt1
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          framegen0 programmable interrupt2
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          framegen0 programmable interrupt3
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          signature0 shadow load interrupt
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          signature0 measurement valid interrupt
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          signature0 error condition interrupt
> > > +          (display controller, display stream 0)
> > > +      - description: |
> > > +          disengcfg1 shadow load interrupt
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          disengcfg1 frame complete interrupt
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          disengcfg1 sequence complete interrupt
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          framegen1 programmable interrupt0
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          framegen1 programmable interrupt1
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          framegen1 programmable interrupt2
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          framegen1 programmable interrupt3
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          signature1 shadow load interrupt
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          signature1 measurement valid interrupt
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          signature1 error condition interrupt
> > > +          (display controller, display stream 1)
> > > +      - description: |
> > > +          command sequencer error condition interrupt(command sequen=
cer)
> > > +      - description: |
> > > +          common control software interrupt0(common control)
> > > +      - description: |
> > > +          common control software interrupt1(common control)
> > > +      - description: |
> > > +          common control software interrupt2(common control)
> > > +      - description: |
> > > +          common control software interrupt3(common control)
> > > +      - description: |
> > > +          framegen0 synchronization status activated interrupt
> > > +          (display controller, safety stream 0)
> > > +      - description: |
> > > +          framegen0 synchronization status deactivated interrupt
> > > +          (display controller, safety stream 0)
> > > +      - description: |
> > > +          framegen0 synchronization status activated interrupt
> > > +          (display controller, content stream 0)
> > > +      - description: |
> > > +          framegen0 synchronization status deactivated interrupt
> > > +          (display controller, content stream 0)
> > > +      - description: |
> > > +          framegen1 synchronization status activated interrupt
> > > +          (display controller, safety stream 1)
> > > +      - description: |
> > > +          framegen1 synchronization status deactivated interrupt
> > > +          (display controller, safety stream 1)
> > > +      - description: |
> > > +          framegen1 synchronization status activated interrupt
> > > +          (display controller, content stream 1)
> > > +      - description: |
> > > +          framegen1 synchronization status deactivated interrupt
> > > +          (display controller, content stream 1)
> > > +
> > > +  interrupt-names:
> > > +    items:
> > > +      - const: store9_shdload
> > > +      - const: store9_framecomplete
> > > +      - const: store9_seqcomplete
> > > +      - const: extdst0_shdload
> > > +      - const: extdst0_framecomplete
> > > +      - const: extdst0_seqcomplete
> > > +      - const: extdst4_shdload
> > > +      - const: extdst4_framecomplete
> > > +      - const: extdst4_seqcomplete
> > > +      - const: extdst1_shdload
> > > +      - const: extdst1_framecomplete
> > > +      - const: extdst1_seqcomplete
> > > +      - const: extdst5_shdload
> > > +      - const: extdst5_framecomplete
> > > +      - const: extdst5_seqcomplete
> > > +      - const: disengcfg_shdload0
> > > +      - const: disengcfg_framecomplete0
> > > +      - const: disengcfg_seqcomplete0
> > > +      - const: framegen0_int0
> > > +      - const: framegen0_int1
> > > +      - const: framegen0_int2
> > > +      - const: framegen0_int3
> > > +      - const: sig0_shdload
> > > +      - const: sig0_valid
> > > +      - const: sig0_error
> > > +      - const: disengcfg_shdload1
> > > +      - const: disengcfg_framecomplete1
> > > +      - const: disengcfg_seqcomplete1
> > > +      - const: framegen1_int0
> > > +      - const: framegen1_int1
> > > +      - const: framegen1_int2
> > > +      - const: framegen1_int3
> > > +      - const: sig1_shdload
> > > +      - const: sig1_valid
> > > +      - const: sig1_error
> > > +      - const: cmdseq_error
> > > +      - const: comctrl_sw0
> > > +      - const: comctrl_sw1
> > > +      - const: comctrl_sw2
> > > +      - const: comctrl_sw3
> > > +      - const: framegen0_primsync_on
> > > +      - const: framegen0_primsync_off
> > > +      - const: framegen0_secsync_on
> > > +      - const: framegen0_secsync_off
> > > +      - const: framegen1_primsync_on
> > > +      - const: framegen1_primsync_off
> > > +      - const: framegen1_secsync_on
> > > +      - const: framegen1_secsync_off
> > > +
> > > +  clocks:
> > > +    maxItems: 8
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: axi
> > > +      - const: cfg
> > > +      - const: pll0
> > > +      - const: pll1
> > > +      - const: bypass0
> > > +      - const: bypass1
> > > +      - const: disp0
> > > +      - const: disp1
> > > +
> > > +  power-domains:
> > > +    items:
> > > +      - description: DC power-domain
> > > +      - description: PLL0 power-domain
> > > +      - description: PLL1 power-domain
> > > +
> > > +  power-domain-names:
> > > +    items:
> > > +      - const: dc
> > > +      - const: pll0
> > > +      - const: pll1
> > > +
> > > +  fsl,dpr-channels:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > > +    description: |
> > > +      List of phandle which points to DPR channels associated with
> > > +      this DPU instance.
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: The DPU output port node from display stream0.
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/properties/port
> > > +        description: The DPU output port node from display stream1.
> > > +
> > > +    required:
> > > +      - port@0
> > > +      - port@1
> >=20
> > Generally speaking, and looking at the main KMS drivers patch, it really
> > looks like it's multiple device glued as one, with the driver un-gluing
> > them and creating devices and their resources based on what actual
> > devices you have in there.
> >=20
> > It's especially obvious for the CRTCs, and to some extent the embedded
> > interrupt controller you have in your driver.
> >=20
> > This is *very* far from the usual way of describing things in the device
> > tree, and you would usually have a driver that doesn't take care of
> > creating the devices, because they are properly described in the device
> > tree.
>=20
> The DPU core driver(dpu-core.c) creates platform devices only for CRTCs,
> no other device is created.  The CRTC devices, as components, are bound
> together with the DPU DRM master device.  i.MX8qm SoC embeds two
> DPU IPs, while i.MX8qxp SoC embeds one.  Each DPU supports two CRTCs.
> So, e.g., for i.MX8qm, there could be at most four CRTCs under the imx8-d=
pu
> umbrella.

Yeah, and that's fine. It should all be separate devices in the device
tree though.

> > If you have a good reason to deviate from that design, then it should be
> > explicitly discussed and explained.
>=20
> The DPU is one single IP which cannot be split into separate devices.

Sure it can, your driver does so already by splitting it into several
devices and accessing registers based on their stream_id.

> The "IPIdentifer" register in DPU register map kind of provides version
> information for the IP.

That's fine too, just read the version register in the main KMS driver,
every other component will then have access to it.

> This dt-binding just follows generic dt-binding rule to describe the DPU =
IP
> hardware, not the software implementation.  DPU internal units do not
> constitute separate devices.

I mean, your driver does split them into separate devices so surely it
constitutes separate devices.

Maxime

--ktp5u4bmvdhpovpe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOW2CwAKCRDj7w1vZxhR
xbnLAP9Y36AdFk8XzOZEJZpJRr1hs65z15Xir93pfysw9ivxOQD+KXmdtF+Z4w6P
O3s8WhaLg44GsH8nPub0HWgjyVcD2QE=
=Ecdc
-----END PGP SIGNATURE-----

--ktp5u4bmvdhpovpe--
