Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C37448D0976
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 19:36:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A020C10F330;
	Mon, 27 May 2024 17:36:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Zye5Y2M6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A4CF10E331
 for <dri-devel@lists.freedesktop.org>; Mon, 27 May 2024 17:36:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B80A61B9A;
 Mon, 27 May 2024 17:36:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1853C2BBFC;
 Mon, 27 May 2024 17:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716831396;
 bh=9azP1CoqBgVzc1Ap21svaHMHj3h571dn+Ed1pu/oZnU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Zye5Y2M6ZcwVdvsk5HTNp16+CzXgCstjS1xb9IxfH4+tcOhW0sR7W9u0/bCC4mRr+
 yh8xka7Oj//VwikLVjQ/a1J4ULjGTAZR9BTXzaaC9Me/U9cttPvRwq7JjYeYOfPFgM
 wTD2X1BPGVI+HcaQPOyatPyo7ZOBJGU3RCDci8lR7XNQNGJHNWl01ouq3JAhpN+9le
 Q5n83MV6Wji9XSwh+MP/R4TGaf8fKV4ZgmQNI+Bmw6J1/8UwKih+cIF2qDRgHmiuwT
 BPIdf5HQfXTu7gZbMcD9YJVjWtMlb0TD7JiU+9nG/dX2WpeqV9d8iRMiYwWzGH7DVH
 +Ou4bN2/Bejtg==
Date: Mon, 27 May 2024 18:36:30 +0100
From: Conor Dooley <conor@kernel.org>
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH RESEND,v6 2/8] dt-bindings: mailbox: Add property for
 CMDQ secure driver
Message-ID: <20240527-bullion-slapping-d35fcddb56d5@spud>
References: <20240526144443.14345-1-jason-jh.lin@mediatek.com>
 <20240526144443.14345-3-jason-jh.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="gfL6Eu9ihKM1A1EB"
Content-Disposition: inline
In-Reply-To: <20240526144443.14345-3-jason-jh.lin@mediatek.com>
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


--gfL6Eu9ihKM1A1EB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2024 at 10:44:37PM +0800, Jason-JH.Lin wrote:
> 1. Add mboxes property to define a GCE loopping thread as a secure IRQ
> handler.
> The CMDQ secure driver requests a mbox channel and sends a looping
> command to the GCE thread. The looping command will wait for a secure
> packet done event signal from secure world and then jump back to the
> first instuction. Each time it waits for an event, it notifies the
> CMDQ driver to perform the same action as the IRQ handler.
>=20
> 2. Add gce-events property from gce-props.yaml to define a
> secure packet done signal in secure world.
> There are 1024 events IDs for GCE to use to execute instructions in
> the specific event happened. These events could be signaled by HW or SW
> and their value would be different in different SoC because of HW event
> IDs distribution range from 0 to 1023.
> If we set a static event ID: 855 for mt8188, it might be conflict the
> event ID original set in mt8195.

Two different SoCs, two different compatibles, no problem.
I'm almost certain you previously told me that the firmware changing
could result in a different event ID, but I see no mention of that here.
The commit messages makes it seem like this can be determined by the
compatible, so either give me a commit message that explains why the
compatible is not sufficient or drop the patch.

> So we define an event ID that will be set when GCE runs to the end of
> secure cmdq packet in the secure world.
>=20
> This can reduce the latency of software communication between normal
> world and secure world. In addition, we can also remove the complex
> logic after the secure packet done in the secure world.
>=20
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>
> ---
>  .../devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailb=
ox.yaml b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.ya=
ml
> index cef9d7601398..6e5e848d61d9 100644
> --- a/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> +++ b/Documentation/devicetree/bindings/mailbox/mediatek,gce-mailbox.yaml
> @@ -49,6 +49,10 @@ properties:
>      items:
>        - const: gce
> =20
> +  mboxes:
> +    items:
> +      - description: GCE looping thread as a secure IRQ handler

Why is this needed? It's going to be a reference to itself, right?
Why can't you just reserve a channel in the driver?

Thanks,
Conor.

> +
>  required:
>    - compatible
>    - "#mbox-cells"
> @@ -57,6 +61,8 @@ required:
>    - clocks
> =20
>  allOf:
> +  - $ref: /schemas/mailbox/mediatek,gce-props.yaml#
> +
>    - if:
>        not:
>          properties:
> @@ -67,7 +73,7 @@ allOf:
>        required:
>          - clock-names
> =20
> -additionalProperties: false
> +unevaluatedProperties: false
> =20
>  examples:
>    - |
> --=20
> 2.18.0
>=20

--gfL6Eu9ihKM1A1EB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZlTEngAKCRB4tDGHoIJi
0to1AQDxMdlkCNTKNL4Cai++qtW6p5V+CLhlWwb1OMH0cnYOqgEArzOexHmWlxUE
80S67d+XuFdcAciAe/PNG2Dd7EsXdwA=
=ITK7
-----END PGP SIGNATURE-----

--gfL6Eu9ihKM1A1EB--
