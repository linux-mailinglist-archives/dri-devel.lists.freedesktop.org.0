Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 45B1465E6E1
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 09:36:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5A8F10E12B;
	Thu,  5 Jan 2023 08:36:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BCD10E12B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 08:36:12 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 15CC95C016A;
 Thu,  5 Jan 2023 03:36:12 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Thu, 05 Jan 2023 03:36:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1672907772; x=1672994172; bh=0hFqlupEzn
 R2c30toJCTonuWUKZ4pCGfFXI/nMopxJY=; b=GsnkZs/QJb/HzNcany4FB0rXiT
 MgaSRe/Zd6OPOl/4eRnnY3eMEDEhmZOqbBR3jvzdqBfEi2GBuT/+z8XMPka8Ktg5
 cmD8E0Gbmlc5oDz/ocNrkSe0bHHnawaQ02fYnceNm8tyzBkQl9VhnHpT6qeHX7Xc
 lDJMzfrxZOvF66b2em4bwWwck4T9hT6a3mHsxvYXZtIQcBjSdCdxsc7H+Q2ieWqQ
 GwnkBNTR49j+xBxj1qOHvBuY3geFaMMcUrmB2lMEIUacjEzRn1E3o1wNSeb0uIfw
 BLM2cBU0s98mDsZr6sX3XlNLc5WQrBzO88tcmEexsb7ZfMkf4j4Lk0h8VMGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1672907772; x=1672994172; bh=0hFqlupEznR2c30toJCTonuWUKZ4
 pCGfFXI/nMopxJY=; b=HyigzQBeIQTuymfjmSkBfXuHBnLRrr2o4xUteBkgO8AH
 fJcntcqGDOb+YuClVAmLggqPNbHgoFHHX9PXOb9LIAY70cZdg5rjTH++YWcl9lGk
 KJ5LDxBM1hKwTbiDlE/HUOOcs5Ky/46i8fAhEH8R03FerNrM02xONgEceFzmcIZ4
 SFVjGyMBJbbHX1X9WVhBqyBPzuOvw+qcZ/kZ4Jz4ePNbJdTX/bU8qY08D8uSoyfF
 vtksvd5TkqvRA+4YONRvtoAHq+yhXneH4e5bPYJy6qq7dzzexO69iFTxyQpmKqRV
 kjffF+soWjTvY2uedMRWdw7Mju4fgc22/8ywpAdwzQ==
X-ME-Sender: <xms:-4u2Y7cQfRhVBAFrHeEBc1jkyKT9UwI0kSIvIkQzwJc8wrhqhLrfFA>
 <xme:-4u2YxOk7iyJsGnnNMBWMCIjZWRCZpB6GkHn7r3OMCYnIU8skse6eOPkgMm0Rk1oN
 UPAHYXNTGFpXdos8oQ>
X-ME-Received: <xmr:-4u2Y0hG6TvpAB86KacpGpjL-5yi54A7R7f9VbrhQEE-69pbfCNnULEYYijQUYHMfXMJQB4DM0Hl24PTwnFZZBedpXiHlBjp4DaxJbt7ACgn6w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrjeejgdduvdegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeeljeeugfegveetleevkeetffegudevieetieeugeeugeeivddtjeejvdef
 feetgfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivg
 eptdenucfrrghrrghmpehmrghilhhfrhhomhepmhgrgihimhgvsegtvghrnhhordhtvggt
 hh
X-ME-Proxy: <xmx:-4u2Y88Iu5bFTwWB23MWyklNDiZItkVgHcKrcI3IJXcNi5FbQrBZ3g>
 <xmx:-4u2Y3t-pBQO7tij-XmxfXGrqHN-y0EBEJ6XF0FTCdjHM8khP16GPw>
 <xmx:-4u2Y7H49lflHODevEP5ka0MMsxtek_joLmgDFBA4YCfk6didRRUvA>
 <xmx:_Iu2Y3F4SmxraffpuFCma75oXBPqlJcgXk1ZJK8TFg1p7Njbju06DQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 5 Jan 2023 03:36:10 -0500 (EST)
Date: Thu, 5 Jan 2023 09:36:09 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/vc4: Start console with 32 bpp / 24 depth
Message-ID: <20230105083609.ofeikov65kbv3gte@houat>
References: <20230105080734.23554-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="bdcctzebyxhdotvm"
Content-Disposition: inline
In-Reply-To: <20230105080734.23554-1-tzimmermann@suse.de>
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
Cc: emma@anholt.net, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--bdcctzebyxhdotvm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Jan 05, 2023 at 09:07:34AM +0100, Thomas Zimmermann wrote:
> Invoke the generic console emulation with a 32 bits per pixel. The
> preferred color depth is 24, so the current value of 16 bpp is too
> small. This results in the following error message
>=20
> vc4-drm gpu: [drm] bpp/depth value of 16/24 not supported
> vc4-drm gpu: [drm] No compatible format found
> ------------[ cut here ]------------
> WARNING: CPU: 2 PID: 66 at drivers/gpu/drm/drm_atomic.c:1604 __drm_atomic=
_helper_set_config+0x2e8/0x314 [drm]
>=20
> The problem has been present for a long, but has only now surfaced
> as commit 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format
> selection") attempts to improve selection of the color format.
>=20
> See [1] for the initial bug report.
>=20
> Reported-by: Ma=EDra Canal <mcanal@igalia.com>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Ma=EDra Canal <mcanal@igalia.com>
> Fixes: 37c90d589dc0 ("drm/fb-helper: Fix single-probe color-format select=
ion")
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: Javier Martinez Canillas <javierm@redhat.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Link: https://lore.kernel.org/dri-devel/20230102112927.26565-1-tzimmerman=
n@suse.de/T/#mb09eb6f615f4b0302c78f250b4241ee48d1915f8 # 1
> ---
>  drivers/gpu/drm/vc4/vc4_drv.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
> index 0ccaee57fe9a..64423b79982f 100644
> --- a/drivers/gpu/drm/vc4/vc4_drv.c
> +++ b/drivers/gpu/drm/vc4/vc4_drv.c
> @@ -387,7 +387,7 @@ static int vc4_drm_bind(struct device *dev)
>  	if (ret < 0)
>  		goto unbind_all;
> =20
> -	drm_fbdev_generic_setup(drm, 16);
> +	drm_fbdev_generic_setup(drm, 32);

This is essentially a revert of f741b28fb299.

It's not clear to me what sets the depth preference to 24, because I'd
rather change that.

Maxime

--bdcctzebyxhdotvm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY7aL+QAKCRDj7w1vZxhR
xdkSAQCw06UVdamNa2gEX2/9CnUGeGt20zOJZl629dATcoI3lwEAlLXDUOPBm1Q4
htvVcvVxfFuSQ/jf5tprw6IJUVHFjA0=
=IW7+
-----END PGP SIGNATURE-----

--bdcctzebyxhdotvm--
