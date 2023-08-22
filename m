Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A6DC783FE2
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 13:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84F2310E324;
	Tue, 22 Aug 2023 11:46:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F7F610E324
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 11:46:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DFCA96549C;
 Tue, 22 Aug 2023 11:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90D1BC433C7;
 Tue, 22 Aug 2023 11:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1692704797;
 bh=RM5w9bgNMrj8vwALOgdiYm9h818Ptnx4UPvI179AyvU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KgTPZ0AlInZWCri4V2PACa2nqOBQT1a1DRdKqTEwc710AmHIDUy6Ty7arh2WtYTuZ
 19Bh8keLRjl7GhEcH+hIkVGn2N38FS3OXNfVqqtJM/qq8N//gSnfN3dzM8YQK/XTwB
 Eiaf0WkzNInp7P948Gih/9tO73zL3fBcHfr+mZ02AZX6wJlZCdOMfxch9/tlpwk6X0
 olax1feJLeUg8J8QPhZcBaUMneSScHHDn+trxC1FzZSMenfqa/E2oiUu8ho1Vu1BTj
 1NKg1saUfPq1LjS/LRU7/Ka8lf8VHa+LuDzsDhekpKVXh8b6vk0FFjoTAAIgZJdjAV
 zYgQzB4ys3Thg==
Date: Tue, 22 Aug 2023 13:46:34 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH v14 RESEND 1/6] dt-bindings: display: imx: Add
 i.MX8qxp/qm DPU binding
Message-ID: <scbtbu4cdjlsmbr6ugkpqslvfywidvbuqyekxuttfe4rmbp2st@lev2zfqe4h62>
References: <20230822085949.816844-1-victor.liu@nxp.com>
 <20230822085949.816844-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="ccyhqw6wrihzcazw"
Content-Disposition: inline
In-Reply-To: <20230822085949.816844-2-victor.liu@nxp.com>
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, tzimmermann@suse.de,
 marcel.ziswiler@toradex.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 robh+dt@kernel.org, linux-imx@nxp.com, laurentiu.palcu@oss.nxp.com,
 guido.gunther@puri.sm, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--ccyhqw6wrihzcazw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Aug 22, 2023 at 04:59:44PM +0800, Liu Ying wrote:
> This patch adds bindings for i.MX8qxp/qm Display Processing Unit.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v7->v14:
> * No change.
>=20
> v6->v7:
> * Add Rob's R-b tag back.
>=20
> v5->v6:
> * Use graph schema. So, drop Rob's R-b tag as review is needed.
>=20
> v4->v5:
> * No change.
>=20
> v3->v4:
> * Improve compatible property by using enum instead of oneOf+const. (Rob)
> * Add Rob's R-b tag.
>=20
> v2->v3:
> * No change.
>=20
> v1->v2:
> * Fix yamllint warnings.
> * Require bypass0 and bypass1 clocks for both i.MX8qxp and i.MX8qm, as the
>   display controller subsystem spec does say that they exist.
> * Use new dt binding way to add clocks in the example.
> * Trivial tweaks for the example.
>=20
>  .../bindings/display/imx/fsl,imx8qxp-dpu.yaml | 387 ++++++++++++++++++
>  1 file changed, 387 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/imx/fsl,imx=
8qxp-dpu.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dp=
u.yaml b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> new file mode 100644
> index 000000000000..6b05c586cd9d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/imx/fsl,imx8qxp-dpu.yaml
> @@ -0,0 +1,387 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/imx/fsl,imx8qxp-dpu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale i.MX8qm/qxp Display Processing Unit
> +
> +maintainers:
> +  - Liu Ying <victor.liu@nxp.com>
> +
> +description: |
> +  The Freescale i.MX8qm/qxp Display Processing Unit(DPU) is comprised of=
 two
> +  main components that include a blit engine for 2D graphics acceleratio=
ns
> +  and a display controller for display output processing, as well as a c=
ommand
> +  sequencer.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qxp-dpu
> +      - fsl,imx8qm-dpu
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    items:
> +      - description: |
> +          store9 shadow load interrupt(blit engine)
> +      - description: |
> +          store9 frame complete interrupt(blit engine)
> +      - description: |
> +          store9 sequence complete interrupt(blit engine)
> +      - description: |
> +          extdst0 shadow load interrupt
> +          (display controller, content stream 0)
> +      - description: |
> +          extdst0 frame complete interrupt
> +          (display controller, content stream 0)
> +      - description: |
> +          extdst0 sequence complete interrupt
> +          (display controller, content stream 0)
> +      - description: |
> +          extdst4 shadow load interrupt
> +          (display controller, safety stream 0)
> +      - description: |
> +          extdst4 frame complete interrupt
> +          (display controller, safety stream 0)
> +      - description: |
> +          extdst4 sequence complete interrupt
> +          (display controller, safety stream 0)
> +      - description: |
> +          extdst1 shadow load interrupt
> +          (display controller, content stream 1)
> +      - description: |
> +          extdst1 frame complete interrupt
> +          (display controller, content stream 1)
> +      - description: |
> +          extdst1 sequence complete interrupt
> +          (display controller, content stream 1)
> +      - description: |
> +          extdst5 shadow load interrupt
> +          (display controller, safety stream 1)
> +      - description: |
> +          extdst5 frame complete interrupt
> +          (display controller, safety stream 1)
> +      - description: |
> +          extdst5 sequence complete interrupt
> +          (display controller, safety stream 1)
> +      - description: |
> +          disengcfg0 shadow load interrupt
> +          (display controller, display stream 0)
> +      - description: |
> +          disengcfg0 frame complete interrupt
> +          (display controller, display stream 0)
> +      - description: |
> +          disengcfg0 sequence complete interrupt
> +          (display controller, display stream 0)
> +      - description: |
> +          framegen0 programmable interrupt0
> +          (display controller, display stream 0)
> +      - description: |
> +          framegen0 programmable interrupt1
> +          (display controller, display stream 0)
> +      - description: |
> +          framegen0 programmable interrupt2
> +          (display controller, display stream 0)
> +      - description: |
> +          framegen0 programmable interrupt3
> +          (display controller, display stream 0)
> +      - description: |
> +          signature0 shadow load interrupt
> +          (display controller, display stream 0)
> +      - description: |
> +          signature0 measurement valid interrupt
> +          (display controller, display stream 0)
> +      - description: |
> +          signature0 error condition interrupt
> +          (display controller, display stream 0)
> +      - description: |
> +          disengcfg1 shadow load interrupt
> +          (display controller, display stream 1)
> +      - description: |
> +          disengcfg1 frame complete interrupt
> +          (display controller, display stream 1)
> +      - description: |
> +          disengcfg1 sequence complete interrupt
> +          (display controller, display stream 1)
> +      - description: |
> +          framegen1 programmable interrupt0
> +          (display controller, display stream 1)
> +      - description: |
> +          framegen1 programmable interrupt1
> +          (display controller, display stream 1)
> +      - description: |
> +          framegen1 programmable interrupt2
> +          (display controller, display stream 1)
> +      - description: |
> +          framegen1 programmable interrupt3
> +          (display controller, display stream 1)
> +      - description: |
> +          signature1 shadow load interrupt
> +          (display controller, display stream 1)
> +      - description: |
> +          signature1 measurement valid interrupt
> +          (display controller, display stream 1)
> +      - description: |
> +          signature1 error condition interrupt
> +          (display controller, display stream 1)
> +      - description: |
> +          command sequencer error condition interrupt(command sequencer)
> +      - description: |
> +          common control software interrupt0(common control)
> +      - description: |
> +          common control software interrupt1(common control)
> +      - description: |
> +          common control software interrupt2(common control)
> +      - description: |
> +          common control software interrupt3(common control)
> +      - description: |
> +          framegen0 synchronization status activated interrupt
> +          (display controller, safety stream 0)
> +      - description: |
> +          framegen0 synchronization status deactivated interrupt
> +          (display controller, safety stream 0)
> +      - description: |
> +          framegen0 synchronization status activated interrupt
> +          (display controller, content stream 0)
> +      - description: |
> +          framegen0 synchronization status deactivated interrupt
> +          (display controller, content stream 0)
> +      - description: |
> +          framegen1 synchronization status activated interrupt
> +          (display controller, safety stream 1)
> +      - description: |
> +          framegen1 synchronization status deactivated interrupt
> +          (display controller, safety stream 1)
> +      - description: |
> +          framegen1 synchronization status activated interrupt
> +          (display controller, content stream 1)
> +      - description: |
> +          framegen1 synchronization status deactivated interrupt
> +          (display controller, content stream 1)
> +
> +  interrupt-names:
> +    items:
> +      - const: store9_shdload
> +      - const: store9_framecomplete
> +      - const: store9_seqcomplete
> +      - const: extdst0_shdload
> +      - const: extdst0_framecomplete
> +      - const: extdst0_seqcomplete
> +      - const: extdst4_shdload
> +      - const: extdst4_framecomplete
> +      - const: extdst4_seqcomplete
> +      - const: extdst1_shdload
> +      - const: extdst1_framecomplete
> +      - const: extdst1_seqcomplete
> +      - const: extdst5_shdload
> +      - const: extdst5_framecomplete
> +      - const: extdst5_seqcomplete
> +      - const: disengcfg_shdload0
> +      - const: disengcfg_framecomplete0
> +      - const: disengcfg_seqcomplete0
> +      - const: framegen0_int0
> +      - const: framegen0_int1
> +      - const: framegen0_int2
> +      - const: framegen0_int3
> +      - const: sig0_shdload
> +      - const: sig0_valid
> +      - const: sig0_error
> +      - const: disengcfg_shdload1
> +      - const: disengcfg_framecomplete1
> +      - const: disengcfg_seqcomplete1
> +      - const: framegen1_int0
> +      - const: framegen1_int1
> +      - const: framegen1_int2
> +      - const: framegen1_int3
> +      - const: sig1_shdload
> +      - const: sig1_valid
> +      - const: sig1_error
> +      - const: cmdseq_error
> +      - const: comctrl_sw0
> +      - const: comctrl_sw1
> +      - const: comctrl_sw2
> +      - const: comctrl_sw3
> +      - const: framegen0_primsync_on
> +      - const: framegen0_primsync_off
> +      - const: framegen0_secsync_on
> +      - const: framegen0_secsync_off
> +      - const: framegen1_primsync_on
> +      - const: framegen1_primsync_off
> +      - const: framegen1_secsync_on
> +      - const: framegen1_secsync_off
> +
> +  clocks:
> +    maxItems: 8
> +
> +  clock-names:
> +    items:
> +      - const: axi
> +      - const: cfg
> +      - const: pll0
> +      - const: pll1
> +      - const: bypass0
> +      - const: bypass1
> +      - const: disp0
> +      - const: disp1
> +
> +  power-domains:
> +    items:
> +      - description: DC power-domain
> +      - description: PLL0 power-domain
> +      - description: PLL1 power-domain
> +
> +  power-domain-names:
> +    items:
> +      - const: dc
> +      - const: pll0
> +      - const: pll1
> +
> +  fsl,dpr-channels:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      List of phandle which points to DPR channels associated with
> +      this DPU instance.
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The DPU output port node from display stream0.
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: The DPU output port node from display stream1.
> +
> +    required:
> +      - port@0
> +      - port@1

Generally speaking, and looking at the main KMS drivers patch, it really
looks like it's multiple device glued as one, with the driver un-gluing
them and creating devices and their resources based on what actual
devices you have in there.

It's especially obvious for the CRTCs, and to some extent the embedded
interrupt controller you have in your driver.

This is *very* far from the usual way of describing things in the device
tree, and you would usually have a driver that doesn't take care of
creating the devices, because they are properly described in the device
tree.

If you have a good reason to deviate from that design, then it should be
explicitly discussed and explained.

Maxime

--ccyhqw6wrihzcazw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZOSgGgAKCRDj7w1vZxhR
xbMHAP9a8D0BifQwpJnJsTRysWV3rkSCppZAFPn5vluNt7c+lwEAwPYgoiXibJHv
4wGo+BmJ3KH3RvGjw8ntStfzBmFCmA8=
=iWvx
-----END PGP SIGNATURE-----

--ccyhqw6wrihzcazw--
