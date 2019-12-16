Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 680D11228EE
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2019 11:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50EBA6E996;
	Tue, 17 Dec 2019 10:32:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com
 [66.111.4.224])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27A3089F3C
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 10:58:31 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailnew.nyi.internal (Postfix) with ESMTP id 5EA5E7118;
 Mon, 16 Dec 2019 05:58:30 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 16 Dec 2019 05:58:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=7E2TpTwENCgP1MRD7/Eziybb/Th
 2bGLOCc12fC88q6E=; b=IMLrsBodXXXGicPZCQDlL4YhxJ8yYXkJiGeQPJQQwf4
 cvkx9X6OxYx4AIhSKnPbdJllQHaNKzzF32/qX58QgboLLpEQjhHszLxaPpdgMMqV
 5jwKe1BCnPBcTCzsnR03dumppfba/ket7EzIV/vDMcpIzk6A9IEqm5vtpgGTV0is
 zhsxVo69knhpEPIVcq8TwJ3MXG2+XWNQp+POUAs1H0De5zyyiyMRlkSCghfcP6au
 1A6KiA/ogyumRutouWKKu8dAEzQyxprg9hq1qJbuVHeCMMxACjaQnueTYxbD/Xbp
 1EaHOWLopra/MTOUFxZc/cLJR14aFWEUPkFkB2CgpAw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=7E2TpT
 wENCgP1MRD7/Eziybb/Th2bGLOCc12fC88q6E=; b=q+xW6eiNUtLhXYj2T6MpV1
 DO8WdVfGXHlYR8Od+K4ZToowmTlu5f3/0IOeXhM0VokgQyeONZ1a7SFy1qvQ09sS
 RJo277PYsWoBr9JZzYUX1G8wrKf8zaGzsV3XCIqtSdwweXbLBWtRqbsDZDQyVKT8
 BBUNVnMhxMxo6H0jMMQkFW58R8n+XHpB9KIkoJH+b3JN5yZPUEtHDIGdPI5GMBV/
 YEWDRRva+BF230lJgh67fWaDUDKu+WGR40H/0ooi009xOpo+5NNKgJ0NOx8/e41Q
 pUtQwoztthAvbEQgK30HoL9BjVCTgbU5uRqaC5EzMJnejxYGnCQB2JqhHaGLlKxw
 ==
X-ME-Sender: <xms:VGP3XUY8i-9w8CG05Yj5PzjIikoPOmggk-UF_ctcBee-8Lck051Ulg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedrvddthedgvddvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvffukfhfgggtuggjsehgtderredttddvnecuhfhrohhmpeforgigihhm
 vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecukfhppeeltd
 drkeelrdeikedrjeeinecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggv
 rhhnohdrthgvtghhnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:VGP3Xbt6ohxrttMcaXVI6FmO7AAaqrpN7X7GqTN0Wk7tLzLIlYh-yg>
 <xmx:VGP3XRtN1Yg5tIbLqODohz6GBDmEP1smxIZbRdwPBUzowBcnBB7ffA>
 <xmx:VGP3XQe2jz2UyPBCXhDoFD1nNHKHF_HUD8nsB_jR_XrJ_cT8fDkXMA>
 <xmx:VmP3XVbpO_j_XIh2rB_1sEeclFhYceWTGR5NP61U8O2Mv5Qzxs8Stw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 690A280063;
 Mon, 16 Dec 2019 05:58:28 -0500 (EST)
Date: Mon, 16 Dec 2019 11:58:27 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 09/12] drm/rockchip: lvds: Add PX30 support
Message-ID: <20191216105827.rxkfbwemkqw446jx@gilmour.lan>
References: <20191213181051.25983-1-miquel.raynal@bootlin.com>
 <20191213181051.25983-10-miquel.raynal@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20191213181051.25983-10-miquel.raynal@bootlin.com>
X-Mailman-Approved-At: Tue, 17 Dec 2019 10:31:56 +0000
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 David Airlie <airlied@linux.ie>, Sandy Huang <hjc@rock-chips.com>,
 dri-devel@lists.freedesktop.org,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0981981204=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0981981204==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="akf2tzjwfz7nnjic"
Content-Disposition: inline


--akf2tzjwfz7nnjic
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

On Fri, Dec 13, 2019 at 07:10:48PM +0100, Miquel Raynal wrote:
> +static int px30_lvds_grf_config(struct drm_encoder *encoder,
> +				struct drm_display_mode *mode)
> +{
> +	struct rockchip_lvds *lvds = encoder_to_lvds(encoder);
> +	u8 nhsync = !(mode->flags & DRM_MODE_FLAG_PHSYNC);
> +	u8 nvsync = !(mode->flags & DRM_MODE_FLAG_PVSYNC);
> +	u8 ndclk = !(mode->flags & DRM_MODE_FLAG_PCSYNC);
> +	int ret;
> +
> +	if (lvds->output != DISPLAY_OUTPUT_LVDS) {
> +		DRM_DEV_ERROR(lvds->dev, "Unsupported display output %d\n",
> +			      lvds->output);
> +		return -EINVAL;
> +	}
> +
> +	if (nhsync ^ nvsync) {
> +		DRM_DEV_ERROR(lvds->dev, "Unsupported Hsync/Vsync polarity\n");
> +		return -EINVAL;
> +	}
> +
> +	/* Set format */
> +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON1,
> +				 PX30_LVDS_FORMAT(lvds->format),
> +				 PX30_LVDS_FORMAT(lvds->format));
> +	if (ret)
> +		return ret;
> +
> +	/* Control Hsync/Vsync polarity */
> +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> +				 PX30_LVDS_TIE_CLKS(1),
> +				 PX30_LVDS_TIE_CLKS(1));
> +	if (ret)
> +		return ret;
> +
> +	/* Set Hsync/Vsync polarity */
> +	ret = regmap_update_bits(lvds->grf, PX30_LVDS_GRF_PD_VO_CON0,
> +				 PX30_LVDS_INVERT_CLKS(1),
> +				 PX30_LVDS_INVERT_CLKS(nhsync));
> +	if (ret)
> +		return ret;

I don't know the hardware but it seems pretty weird to me. hsync and
vsync in LVDS are not clocks (or even signals), they're a bit in the
payload. Is there any explanation in the datasheet (or even a
datasheet in the first place)?

Maxime

--akf2tzjwfz7nnjic
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCXfdjUgAKCRDj7w1vZxhR
xRBYAP44GLCelEvFF7JRcxbERsDpTT+xk8XxtfgoWUly8jPqegD+Jrne3aLXYopK
ogFPLh6TeB2oQ1+pAWNgKDtT5Zntxwo=
=SVmk
-----END PGP SIGNATURE-----

--akf2tzjwfz7nnjic--

--===============0981981204==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0981981204==--
