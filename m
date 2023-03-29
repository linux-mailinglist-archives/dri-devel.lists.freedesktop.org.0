Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBACC6CF3CD
	for <lists+dri-devel@lfdr.de>; Wed, 29 Mar 2023 21:56:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 429FD10E55A;
	Wed, 29 Mar 2023 19:56:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5495410E55A
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Mar 2023 19:56:43 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id CF0D032002F9;
 Wed, 29 Mar 2023 15:56:41 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute2.internal (MEProxy); Wed, 29 Mar 2023 15:56:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:content-type:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm3; t=1680119801; x=1680206201; bh=no
 XiJIPie8dV9ePTw+SFQsO0YQNm2CoaSAiwIsdQxWY=; b=dhX/CDGktLBJ59bws1
 SBd5MyUrWvJrFsBrVeAcOAIIOON8qZVFvlHWEupXGQ+QK9V6Shv8v1V06GUfSHbE
 REpoPWc4hpwXLYnOM2yBzg9XThL5e88JOKvyn9WDy86EkjsFXTKAtgocml/wELkK
 M8CbixMKVxgLW7vA+szzycquz6Kd6FuLzewgt+ej30+TL+hFaL4VAPztbJo44ELG
 hIrT8HCkNG+x+Ui+TalipT8H89pKukX3868zIlyVPPlm4MsNSEkpRC09R6iNAgsO
 kp9sbQfeWynd1hRnKNj77/HENaBHF1jwvncRUVngGBVjNo7YsbyZ4gzqPcXyKA6A
 Mkzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm2; t=1680119801; x=1680206201; bh=noXiJIPie8dV9
 ePTw+SFQsO0YQNm2CoaSAiwIsdQxWY=; b=VQflJgiYK2fuZdRhXHweK9JeB6Anm
 hA0vcz6up+MNKNHhh68F2kQF+/4NhFDnxiT7y6it/PctSKFwI66OC47kTVL+rts/
 978f/qKQdDK6xpgdhHhnZGB58lQ4ZBX3c/tGi0chGgBCgUlc1xW+jA9xiKvDOkVX
 wcXVZksgXC/665tWjAew2SBt9V8u70RWHWUyyCItLvNpSGiMiI1uOWyVihpZ8j03
 V1JWWsVcfBajs9O5xkKyRYURQLMkGTTgcwVGDeiFy4zOwNK7gtYYRxGq81mO1svf
 NI8SuXlIQXLDdEs/Sr5WSgkMI32fDtPDZhW44t6UtdTZJ6Kk1JzNkWvrw==
X-ME-Sender: <xms:-JckZPreUsTnw_QVHZp9gOewnoEeXGFrxnq2phyZsqeqRLyDFM_S5g>
 <xme:-JckZJqoC64_TFJePBjgzeQRZLoNywmyZGH23AGYEOuqLwAj7dZJK7Z9ydmeVayO9
 KIybdJYquTloxwXTZg>
X-ME-Received: <xmr:-JckZMN9yYVwFdC7NRsKsRT60YIjpGzXiAs_vY_60xNnrEcyocQ0dmkAqQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrvdehiedgudeghecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepteefffefgfektdefgfeludfgtdejfeejvddttdekteeiffejvdfgheeh
 fffhvedunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:-ZckZC4qb0zUDG1CSROAhpnm2N3QaW8m1t0xrzdddB8wR2-9obZXow>
 <xmx:-ZckZO4N5m00Z91caxn0OYmPuT_6dB_ThYi-0ir03NVvoYSuDRMSgQ>
 <xmx:-ZckZKhexjf47-Je1pfiLB-1ojxCMMHMCzj8j71uRrzLWgYjwgpmhA>
 <xmx:-ZckZHEye8DGUgO1iIYeMyQAfxVhnS_47QNV9vn28e-gTwXw1Urzmw>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 29 Mar 2023 15:56:40 -0400 (EDT)
Date: Wed, 29 Mar 2023 21:56:39 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH] drm/sun4i: uncouple DSI dotclock divider from
 TCON0_DCLK_REG
Message-ID: <20230329195639.iep4rv5rcigu3gj2@penduick>
References: <20230320161636.24411-1-romanberanek@icloud.com>
 <87wn356ni4.fsf@oltmanns.dev>
 <20230327202045.ceeqqwjug4ktxtsf@penduick>
 <87bkkc3bzc.fsf@oltmanns.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="w77waeuhy2kubgq3"
Content-Disposition: inline
In-Reply-To: <87bkkc3bzc.fsf@oltmanns.dev>
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
Cc: Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Roman Beranek <romanberanek@icloud.com>, Chen-Yu Tsai <wens@csie.org>,
 dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--w77waeuhy2kubgq3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Mar 28, 2023 at 09:28:19PM +0200, Frank Oltmanns wrote:
> --- a/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> +++ b/drivers/gpu/drm/sun4i/sun6i_mipi_dsi.c
> @@ -819,6 +819,34 @@ static void sun6i_dsi_encoder_disable(struct drm_enc=
oder *encoder)
>  	regulator_disable(dsi->regulator);
>  }
>=20
> +static bool sun6i_dsi_encoder_mode_fixup(
> +				   struct drm_encoder *encoder,
> +				   const struct drm_display_mode *mode,
> +				   struct drm_display_mode *adjusted_mode)

So, mode_fixup is kind of deprecated in favour of atomic_check

> +{
> +	if (encoder->encoder_type =3D=3D DRM_MODE_ENCODER_DSI) {
> +		/*
> +		 * For DSI the PLL rate has to respect the bits per pixel and
> +		 * number of lanes.
> +		 *
> +		 * According to the BSP code:
> +		 * PLL rate =3D DOTCLOCK * bpp / lanes
> +		 *
> +		 * Therefore, the clock has to be adjusted in order to set the
> +		 * correct PLL rate when actually setting the clock.
> +		 */
> +		struct sun6i_dsi *dsi =3D encoder_to_sun6i_dsi(encoder);
> +		struct mipi_dsi_device *device =3D dsi->device;
> +		u8 bpp =3D mipi_dsi_pixel_format_to_bpp(device->format);
> +		u8 lanes =3D device->lanes;
> +
> +		adjusted_mode->crtc_clock =3D mode->crtc_clock
> +				 * bpp / (lanes * SUN6I_DSI_TCON_DIV);

And that's visible to the userspace, so it's not where we should store
that value. I guess the best way to do something similar would be to
store it into crtc_state, and then reuse it there. But it starts to make
a lot of rather complicated code compared to your previous patch.

Maxime

--w77waeuhy2kubgq3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZCSX9wAKCRDj7w1vZxhR
xaruAQCGPe9DdXyqjNQS1/luLCBVHVNEYdtb1P+8H83LWTX0FgEAswrnvVcJtuq+
lBULl/xcVsrxuFzib6ShMcSpHy9u6AM=
=LAf9
-----END PGP SIGNATURE-----

--w77waeuhy2kubgq3--
