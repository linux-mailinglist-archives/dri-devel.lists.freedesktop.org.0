Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE0B4773CF
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 15:00:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73C27112118;
	Thu, 16 Dec 2021 13:59:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D493F112118
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 13:59:54 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s1so10253262wrg.1
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Dec 2021 05:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=vEL/p+6X4t2RxWiyQBolJiVn1r+GBjsT1ZsJkJj0PPo=;
 b=flpxh0Or0b7P+X7i4LdmbnJYrWfkkN1krgWgekNohPFOYCV/BeW8+4PFx2r+qp/WRY
 GKQYJgImE3HXE+y4A5HuIA6kNZ3LmlAw9IFYi+lO6EZpybHQbVLgYRHBKJdPHU/nonXF
 ZGJjUa3GaSDBf61fX4uPvvrdDTAYhHbsYXUFA7+czDQk6KnFBbvdarSoT18TXEI2kd4p
 53xUMxh+mskr6kZLM9YYeotsFocUf94XPVlSymZBEuCoAbqMGdjvbrxjBXRGXSgPRcFM
 nsM4ApBWhxGYAQcrFOPu9qRfv9N02QfKgPvUOEOx5I1MW6k7/S+iX1urteq6GlBx0dLg
 NOGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=vEL/p+6X4t2RxWiyQBolJiVn1r+GBjsT1ZsJkJj0PPo=;
 b=Ey8EQzSOgXE5Lk/GocKoSuWCgtsDvHMF4dIi/HVpf5VwCaaTTs8ORrskTpLCj8shCh
 vbd+TvcCJhiEmy8Ui+F9QEsY13WUJ5qA1am9qUoE/FJfDnIefAQj/qSk50gOWLpPyhkJ
 GyUYbpMKtwo/IY7uRYQBLBGX5k39WVWURZS9+4MSPy9EUW45FL6Oe3l6+uEZFqbT59yf
 jD9ycP3F4lizBEeRoSxm7YN5u2kv1F/Urp5q7EKBataeH1REA+PEjRmQ1v1cTBORUYq2
 gZpGE6ig30KT4AjXh2knQ0nezXqvlAM75ZbWz+UNkILpRUqRY035ptR8ZlDg3ExwJ/0e
 C8sA==
X-Gm-Message-State: AOAM531SHNsEPVDbqOayct2p2viKvxH5zWDHE7zHAdTY1u4VvKYTJiuC
 hiriFpdR1C9iilDeIDe+wElEvjXeUzH7Tw==
X-Google-Smtp-Source: ABdhPJzm1yiVRK/KgEFXo+3/iCJ3xmvI6CtnldBWGvgBdba8TugGiRs1bmoKZlpDwjIN90mvSarwgQ==
X-Received: by 2002:a05:6000:156c:: with SMTP id
 12mr2694347wrz.104.1639663193349; 
 Thu, 16 Dec 2021 05:59:53 -0800 (PST)
Received: from orome ([193.209.96.43])
 by smtp.gmail.com with ESMTPSA id j8sm4661904wrh.16.2021.12.16.05.59.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Dec 2021 05:59:52 -0800 (PST)
Date: Thu, 16 Dec 2021 14:59:48 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 02/22] ASoC: dt-bindings: tegra20-i2s: Convert to schema
Message-ID: <YbtGVHBogkZG7xEo@orome>
References: <20211204143725.31646-1-digetx@gmail.com>
 <20211204143725.31646-3-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="nGNIxp6bVJwYANhE"
Content-Disposition: inline
In-Reply-To: <20211204143725.31646-3-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, dri-devel@lists.freedesktop.org,
 Agneli <poczt@protonmail.ch>, linux-tegra@vger.kernel.org,
 Jonathan Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--nGNIxp6bVJwYANhE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 04, 2021 at 05:37:05PM +0300, Dmitry Osipenko wrote:
> Convert NVIDIA Tegra20 I2S binding to schema.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/sound/nvidia,tegra20-i2s.txt     | 30 --------
>  .../bindings/sound/nvidia,tegra20-i2s.yaml    | 70 +++++++++++++++++++
>  2 files changed, 70 insertions(+), 30 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra2=
0-i2s.txt
>  create mode 100644 Documentation/devicetree/bindings/sound/nvidia,tegra2=
0-i2s.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.t=
xt b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
> deleted file mode 100644
> index dc30c6bfbe95..000000000000
> --- a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.txt
> +++ /dev/null
> @@ -1,30 +0,0 @@
> -NVIDIA Tegra 20 I2S controller
> -
> -Required properties:
> -- compatible : "nvidia,tegra20-i2s"
> -- reg : Should contain I2S registers location and length
> -- interrupts : Should contain I2S interrupt
> -- resets : Must contain an entry for each entry in reset-names.
> -  See ../reset/reset.txt for details.
> -- reset-names : Must include the following entries:
> -  - i2s
> -- dmas : Must contain an entry for each entry in clock-names.
> -  See ../dma/dma.txt for details.
> -- dma-names : Must include the following entries:
> -  - rx
> -  - tx
> -- clocks : Must contain one entry, for the module clock.
> -  See ../clocks/clock-bindings.txt for details.
> -
> -Example:
> -
> -i2s@70002800 {
> -	compatible =3D "nvidia,tegra20-i2s";
> -	reg =3D <0x70002800 0x200>;
> -	interrupts =3D < 45 >;
> -	clocks =3D <&tegra_car 11>;
> -	resets =3D <&tegra_car 11>;
> -	reset-names =3D "i2s";
> -	dmas =3D <&apbdma 21>, <&apbdma 21>;
> -	dma-names =3D "rx", "tx";
> -};
> diff --git a/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.y=
aml b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
> new file mode 100644
> index 000000000000..ad43b237d9af
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/nvidia,tegra20-i2s.yaml
> @@ -0,0 +1,70 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/nvidia,tegra20-i2s.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NVIDIA Tegra20 I2S Controller
> +
> +description: |
> +  The I2S Controller streams synchronous serial audio data between system
> +  memory and an external audio device. The controller supports the I2S L=
eft
> +  Justified Mode, Right Justified Mode, and DSP mode formats.
> +
> +maintainers:
> +  - Thierry Reding <treding@nvidia.com>
> +  - Jon Hunter <jonathanh@nvidia.com>
> +
> +properties:
> +  compatible:
> +    const: nvidia,tegra20-i2s
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    const: i2s
> +
> +  interrupts:
> +    maxItems: 1

I prefer ordering these by the same order that we typically have in
device tree, so "compatible", "reg", "interrupts", "clocks",
"clock-names", "resets", "reset-names", "dmas", "dma-names". I find
that clearer because it lists the common properties at the top and
the less common ones (such as "dmas") at the bottom.

Anyway, it doesn't really matter, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--nGNIxp6bVJwYANhE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmG7RlQACgkQ3SOs138+
s6F39g/8Cy821xezorEEzUPmXIFzlPsyeO2N2H+EY19l6SFCrJ0EHpabduqC43rC
g2fcVI0ueQiJUkjZ3NHOqufv3994fF6dJPhN/2ASFCJacvwD0JpYQ231hH7l3Z7l
5X+VfANc2dQErfyMuobk/g2GDEcOlSKb9mEvot/nBI66fzo+NCSl21/lT6w4bruB
JT4b+2ECbjdREcu6gT1yzyOFrbABOiIHRSEno0SZOASiMQDh7xX4i3eaeNKc93gQ
oXWBB7r3NsMoRB/6L4BUuBSLcWnxvAGsw3B57dQQgQt/5pu3uBQSkQTZ1Ds3aOBh
eXerhBJCYopGZAO5iQ3t25O1c3Kg+U9+CFbIQO/wCwVCbVOiPcT5rT3fgC04rqgG
82jW/yJ3eJv5cGV4oFA0NgK21uk2bocAyGOg9II4ewBzjUZQpGQnrJ2OupN7jW/+
8oJmIIMKmLQtsuytx9YHtoWazQ5ewOcKv5y6UOnGB296V2EooxBCqHNdOv1PRF5z
nBNiJlAeuddbeDqB69iVWZ8wyu7q3Jl+jPmLO/9pAO4ta5Bgx6Ain7KrxRhhjYUP
zOIFXcCDepJw4U0m4x5Oou6xG9pseqm9fuYdS6vLMM+dfzXFaVe9aQgWN3kG6aac
SKpnXMfg7Q4rLf8gga6vIOS9/e4JsX87s29LSJtRU/93VJMmaaI=
=Qqas
-----END PGP SIGNATURE-----

--nGNIxp6bVJwYANhE--
