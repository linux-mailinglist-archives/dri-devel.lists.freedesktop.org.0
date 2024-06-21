Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8263C9125C2
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jun 2024 14:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6173610E03D;
	Fri, 21 Jun 2024 12:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="l8IKh8rP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D1FC10E03D
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jun 2024 12:44:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8D73162612;
 Fri, 21 Jun 2024 12:44:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4569EC2BBFC;
 Fri, 21 Jun 2024 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1718973868;
 bh=bwqf13fJbLJEoJ55Fq8cVIZa/qvXiPcZ4TMFf7szj6I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=l8IKh8rPJ6LhZPucaRVWP/8fVx7Xxn6rv2vU7HIlfwyi9Q96L78zxrZ3zhmjtudB0
 J3tju9CVfyLjhlAOJWMauyHtWsdLjK3txtaalshO/dngDUizd1XzDP6LMIUbZBXavB
 +8KE0WLENQ6jEdfgeJYwijdzrlgFvpOTR2HFnkBrAc0rdcKAXPoTkZLV4bV/cTusbH
 OBtLDjkQPYR3wotR+Wn7W5zr040SNYXGr1ZQRN8QKzEvEtgTV8xggmtD7my/kpv1qT
 wLn6blkh/cY091zWPbqahLn59Luh3YNHrKn/lEiz3fKB1cxWABQ/Sb62GAvK/7RrdJ
 tIK9yeZk6HlDg==
Date: Fri, 21 Jun 2024 13:44:20 +0100
From: Mark Brown <broonie@kernel.org>
To: amergnat@baylibre.com
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
Subject: Re: [PATCH v6 12/16] ASoC: codecs: add MT6357 support
Message-ID: <1ca27c79-a83a-42a7-9e9b-766da0064c73@sirena.org.uk>
References: <20240226-audio-i350-v6-0-f754ec1a7634@baylibre.com>
 <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="Y31DJCgxhlUXFcNQ"
Content-Disposition: inline
In-Reply-To: <20240226-audio-i350-v6-12-f754ec1a7634@baylibre.com>
X-Cookie: Androphobia:
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


--Y31DJCgxhlUXFcNQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 19, 2024 at 04:46:48PM +0200, amergnat@baylibre.com wrote:

> +	/* gain default values*/
> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON0, MT6357_AUDPREAMPLGAIN_MASK,
> +			   UL_GAIN_0DB << MT6357_AUDPREAMPLGAIN_SFT);
> +	regmap_update_bits(priv->regmap, MT6357_AUDENC_ANA_CON1, MT6357_AUDPREAMPRGAIN_MASK,
> +			   UL_GAIN_0DB << MT6357_AUDPREAMPRGAIN_SFT);
> +
> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON1,
> +			   MT6357_AUD_LOL_GAIN_MASK |
> +			   MT6357_AUD_LOR_GAIN_MASK,
> +			   DL_GAIN_0DB << MT6357_AUD_LOL_GAIN_SFT |
> +			   DL_GAIN_0DB << MT6357_AUD_LOR_GAIN_SFT);
> +
> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON2,
> +			   MT6357_AUD_HPL_GAIN_MASK |
> +			   MT6357_AUD_HPR_GAIN_MASK,
> +			   DL_GAIN_0DB << MT6357_AUD_HPL_GAIN_SFT |
> +			   DL_GAIN_0DB << MT6357_AUD_HPR_GAIN_SFT);
> +
> +	regmap_update_bits(priv->regmap, MT6357_ZCD_CON3,
> +			   MT6357_AUD_HS_GAIN_MASK, DL_GAIN_0DB);

We generally leave everything at chip defaults, why is this different?

> +static int mt6357_codec_probe(struct snd_soc_component *codec)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +
> +	mt6357_codec_init(priv);
> +	return 0;
> +}

Why not just inline mt6357_codec_init() into the one user?

> +static unsigned int mt6357_read(struct snd_soc_component *codec, unsigned int reg)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +	unsigned int val;
> +
> +	regmap_read(priv->regmap, reg, &val);
> +	return val;
> +}
> +
> +static int mt6357_write(struct snd_soc_component *codec, unsigned int reg, unsigned int value)
> +{
> +	struct mt6357_priv *priv = snd_soc_component_get_drvdata(codec);
> +
> +	return regmap_update_bits(priv->regmap, reg, 0xffff, value);
> +}

Why open code these, the core has standard adaptors for regmap?

> +static const u32 micbias_values[MT6357_MICBIAS_ARRAY_SIZE] = {
> +	1700000, 1800000, 1900000, 2000000,
> +	2100000, 2500000, 2600000, 2700000
> +};

Just use ARRAY_SIZE() for the size then the number can't be out of sync.


--Y31DJCgxhlUXFcNQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmZ1daMACgkQJNaLcl1U
h9DFewf+M/CBa2qN5RnVF8Zc5QWTvxC4SKpFwRma8NGXYRkdIuRXOhTpxRG85BYY
w0ndJAb81OyrS1X3S8EpFu0cTQdBB7po6aGY3/n1tnY0JIkQ820QI+XDGlduderG
aPJ1LFil592z/y4CEYhDWzOsFWLLyJKyRI490d6BuyRNdljzSLS1QmJ2HrpnPI/S
D63ThavR4gijP3ePCZ6Bajond76rmR5CDUo3/LtUBAliMvLcIpwdKqcEjjdpMm7G
BuKS/CUvpRgJ5D+hyi9xFWRSBajwhFVLHJ1R/jtOLU/DQiYH/x78dMej8JApEp6X
Gohk7DuuhbfZflRiEj17qKTMYvMWvA==
=P5mN
-----END PGP SIGNATURE-----

--Y31DJCgxhlUXFcNQ--
