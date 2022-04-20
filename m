Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8F7B5082BE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Apr 2022 09:51:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9C6110F18A;
	Wed, 20 Apr 2022 07:51:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8278A10F188
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Apr 2022 07:51:17 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id 1E4373201F24;
 Wed, 20 Apr 2022 03:51:13 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 20 Apr 2022 03:51:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1650441072; x=1650527472; bh=MsKOodruT2
 oXaRJF6VJaF5JiZnjQuI98fj1xuyGxqGI=; b=lRgfqF8HAlnNz1RhVxyNF9hva4
 KMnLtw03fYLTisjKVZAfr25kSfwD5heiwv4fIpkaYFE1qVpNsYPXqUHl7yw8SH2m
 64B+SY/bBGUC8uU32lv8OUJyzBjkU8ki4KtIrwDKqVzrn/GZtmLjayZu2o1QXO/O
 K08kzktMPSOalj//Y+H3S6iTMyguejAFdcS26VgRFLrI01OsNKJQZBQcjoV1jyhY
 btPdMsswDM+TbVYE7WBxqX4FsuADXWgpI+BQFNT43RtkxVqcrSApEM704Z8PRnun
 a4GttotHbNrUzd6CUlK7NwdqpweS6VWQjs6/NWXDXk4fVeBWGQMXpjz9yGmg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1650441072; x=
 1650527472; bh=MsKOodruT2oXaRJF6VJaF5JiZnjQuI98fj1xuyGxqGI=; b=D
 T96WEXLoyIgOcPE8dN0zlg5F1yA0uAB7vIoBer09Ao06/zg/eRQiLgOtYzz1TjGs
 4rQOBXzaew1BG2T8/0wDXMCjU5GlakgFKlvvfxh4Cw0VqJvtaM6YGuKALXIoMg/z
 t3vjx0T/k5iDyX3rQ1fY4SP6ItEiPBdpc1ASlRE7bVqApVuxK5ZDoe8CcGZsikJC
 GuIdCfdDmh/EWOgZZKM2I9ZQvHuZbQ8EVE+lYtNLYSo62Zfj8JSfw2aV5Jvj5NWo
 ItuhgPtnxM8gd//6egBBEFrguLSfwO4Yc1CpKnMbrvzwkayFHEF0nOQJwFtcvycT
 KWU6RAuAC31YQDFbp3bIA==
X-ME-Sender: <xms:cLtfYps7X0Dgjz_svKwr8gO0t6OVvcwMMpWbNLL2-fPJFbHN3509Fg>
 <xme:cLtfYie_85xxZYZvN_Qlq6FikBwgP9_Q7s6hGVmmraJ5Rq6goGpsuxDcXqSmREvIu
 b2n68lcxTnTDYhId68>
X-ME-Received: <xmr:cLtfYszF2dIPBP7FYyygTayjagetDYUUWKknS2152i_3VxZMQ9FLkSdG4CYLU_QGaCjzwj-R4vXozUw2wTL-2kaubbt-k9HxMqzzyaI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrvddtgedguddvvdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheei
 heegudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:cLtfYgPsYfPc_9LZ-NsGx_ono0acG0wlnslAAiqFEDITDwSd3TzQ_w>
 <xmx:cLtfYp_zwwOPQ7-5kYShpdoPohsxA5v3BrqQyvXcLubfr3L2Ijy3nA>
 <xmx:cLtfYgUxyqBK7ngkiaWPSV-OblgWmRRh2XbSjex3GqeqjGGVqoxCcA>
 <xmx:cLtfYskNwGftDty77EvceA8I2_ocdjliCXbUMUphchd3rSolQpMRKA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 20 Apr 2022 03:51:11 -0400 (EDT)
Date: Wed, 20 Apr 2022 09:51:08 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Miaoqian Lin <linmq006@gmail.com>
Subject: Re: [PATCH v2] drm/vc4: Fix pm_runtime_get_sync() usage
Message-ID: <20220420075108.xm5ujthootlpayy2@houat>
References: <20220419124407.ugzl7hknsytbhrmr@houat>
 <20220420004949.20508-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="oly5e7o3uziyspjr"
Content-Disposition: inline
In-Reply-To: <20220420004949.20508-1-linmq006@gmail.com>
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
Cc: Emma Anholt <emma@anholt.net>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--oly5e7o3uziyspjr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 12:49:48AM +0000, Miaoqian Lin wrote:
> If the device is already in a runtime PM enabled state
> pm_runtime_get_sync() will return 1, so a test for negative
> value should be used to check for errors.
>=20
> Also, we need to call pm_runtime_put_noidle() when pm_runtime_get_sync()
> fails, so use pm_runtime_resume_and_get() instead. this function
> will handle this.
>=20
> Fixes: 4078f5757144 ("drm/vc4: Add DSI driver")
> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>
> ---
> change in v2:
> - switch to pm_runtime_resume_and_get() to fix refcount leak.
> ---
>  drivers/gpu/drm/vc4/vc4_dsi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_dsi.c b/drivers/gpu/drm/vc4/vc4_dsi.c
> index 752f921735c6..9d7ffaf6bc70 100644
> --- a/drivers/gpu/drm/vc4/vc4_dsi.c
> +++ b/drivers/gpu/drm/vc4/vc4_dsi.c
> @@ -846,8 +846,8 @@ static void vc4_dsi_encoder_enable(struct drm_encoder=
 *encoder)
>  	unsigned long phy_clock;
>  	int ret;
> =20
> -	ret =3D pm_runtime_get_sync(dev);
> -	if (ret) {
> +	ret =3D pm_runtime_resume_and_get(dev);
> +	if (ret < 0) {

pm_runtime_resume_and_get will return 0 on success, so the previous check w=
as correct

Maxime

--oly5e7o3uziyspjr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYl+7bAAKCRDj7w1vZxhR
xYhXAP9VaFI+97/fQ1k4qQ9WQJniyAR3mlrk9f9hApGc2o4CegEA63kjjD3m0HzB
DkaJU2zePXhUfjiPl+yySOfcgIsH3wo=
=Nz+v
-----END PGP SIGNATURE-----

--oly5e7o3uziyspjr--
