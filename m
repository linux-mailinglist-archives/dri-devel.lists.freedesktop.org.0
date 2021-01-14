Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0D42F74AA
	for <lists+dri-devel@lfdr.de>; Fri, 15 Jan 2021 09:55:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F7A89F6F;
	Fri, 15 Jan 2021 08:55:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wnew2-smtp.messagingengine.com (wnew2-smtp.messagingengine.com
 [64.147.123.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D746E24D
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Jan 2021 11:42:29 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailnew.west.internal (Postfix) with ESMTP id A3AC11575;
 Thu, 14 Jan 2021 06:42:24 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Thu, 14 Jan 2021 06:42:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=t6PlT8muw6VrCHVALFPUTNXxD5o
 0m/g2bY8zMhmjaog=; b=sOaWEOjE6VHnvqZpyI97Cr8XxUxD5usf7urGMrvRpe8
 1G65ZHQp4ls+nv30chVh7bN1WU0RmOyORUXGPg0ERLWdPj2QvHRzLaCqNhC0pice
 wUHuDF55hGJnnUbn1di0+ZJJVsyu47sOtl/dwxIJp5b9olZk8NIejQvwCVul6myU
 59B/Ak6ALq2QuNW+mZRLzazuep5wPLXGOfVN1VS2/+FDa1BQnHdcY+Rm45R+fOOu
 M33M/HtVo1maqgfqlXOl878F/Flzxfbs1KSeI/q2Bar0SN9tBqBKyVqD9stnPFBk
 vRKylG6ShpyKQ4bkEqOUMS3AhpPbgWL1M2zXgDpyiZg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=t6PlT8
 muw6VrCHVALFPUTNXxD5o0m/g2bY8zMhmjaog=; b=qKLeiG9bCXCgvEnjB/ZKMK
 Ukle0+PggfmkvT0FPYoXadH+dQuCmU/Ls6ILeqK2TOoGUw7Q+pkH52dRlRMZaGN1
 /3OBdHux0X2523hMmw6LcOjqnZFrwQTAMl9iRYC28WQa18MDjusaXCeZD8pO9IuZ
 i45OLHykI59SXrT/pA4w2h/KcyTKCbbXzfkZvKT+jAiIaPaAeMlc4yXt/X/dOUFX
 omtlFv0JiARcqJh9KyaX11iaa8OOIaqRT/BCkmBNPLvrlrGqgiSmD30xjXom3mNO
 vs4gaXFx8EAievGW1jLCmPkekvffrL+6VnZau6ix8lTwCcuPIl5ivXa9IKuGjkmw
 ==
X-ME-Sender: <xms:HC4AYBF3Kx-lNP83KK1pb9DkNuB6rdBmntWgvlaWRb1FaQZxvgTY_A>
 <xme:HC4AYKrjvnEM_koz9JiP2EbTWpWVRuDUTnxjsmADTZfxyO7_L3jJJMD2baM-hO_wi
 U9bzaaPDsK3om5ZhdY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrtddtgddthecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeduvdduhfekkeehgffftefflefgffdtheffudffgeevteffheeuiedvvdejvdfg
 veenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:HC4AYCReHhd_M2m6bsOj_f1KKb1JRtSigIbcry1QyKZBd8Rf-bcKLg>
 <xmx:HC4AYPNkhNMICmwO-dpogZxvVTuvdltI9H4P-QVV4vcZxA6um177Qw>
 <xmx:HC4AYNNVkwCgyFhNj1uSFrYZK7-IKFPF0osWR7JeKTcVpqaoMQua-g>
 <xmx:IC4AYI_dJu1p3LwuMqGBL9zZrqjuJxl8iPKi--hlW3GzAnDsylDwPMzvDP0>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 5E62C1080059;
 Thu, 14 Jan 2021 06:42:20 -0500 (EST)
Date: Thu, 14 Jan 2021 12:42:19 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [PATCH v6] drm/sun4i: tcon: fix inverted DCLK polarity
Message-ID: <20210114114219.faulkwww3dhdqwmc@gilmour>
References: <d244aa6b-00b7-d768-83cb-e5a228b7ee08@trexom.it>
 <20210114081732.9386-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
In-Reply-To: <20210114081732.9386-1-giulio.benetti@benettiengineering.com>
X-Mailman-Approved-At: Fri, 15 Jan 2021 08:55:00 +0000
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>, airlied@linux.ie,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, wens@csie.org,
 linux-arm-kernel@lists.infradead.org, treding@nvidia.com,
 Giulio Benetti <giulio.benetti@micronovasrl.com>,
 Marjan Pascolo <marjan.pascolo@trexom.it>
Content-Type: multipart/mixed; boundary="===============1464218736=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============1464218736==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lcvqz25cpg3ywj2t"
Content-Disposition: inline


--lcvqz25cpg3ywj2t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 14, 2021 at 09:17:32AM +0100, Giulio Benetti wrote:
> From: Giulio Benetti <giulio.benetti@micronovasrl.com>
>=20
> During commit 88bc4178568b ("drm: Use new
> DRM_BUS_FLAG_*_(DRIVE|SAMPLE)_(POS|NEG)EDGE flags") DRM_BUS_FLAG_*
> macros have been changed to avoid ambiguity but just because of this
> ambiguity previous DRM_BUS_FLAG_PIXDATA_(POS/NEG)EDGE were used meaning
> _SAMPLE_ not _DRIVE_. This leads to DLCK inversion and need to fix but
> instead of swapping phase values, let's adopt an easier approach Maxime
> suggested:
> It turned out that bit 26 of SUN4I_TCON0_IO_POL_REG is dedicated to
> invert DCLK polarity and this makes things really easier than before. So
> let's handle DCLK polarity by adding SUN4I_TCON0_IO_POL_DCLK_DRIVE_NEGEDGE
> as bit 26 and activating according to bus_flags the same way it is done
> for all the other signals polarity.
>=20
> Fixes: 88bc4178568b ("drm: Use new DRM_BUS_FLAG_*_(DRIVE|SAMPLE)_(POS|NEG=
)EDGE flags")
> Suggested-by: Maxime Ripard <maxime@cerno.tech>
> Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
> ---
> V2->V3:
> - squash 2 patches into 1
> V3->V4:
> - add SUN4I_TCON0_IO_POL_DCLK_POSITIVE to regmap_update_bits() as suggest=
ed by Maxime
> V4->V5:
> polarity is still wrong so:
> - let's use SUN4I_TCON0_IO_POL_DCLK_DRIVE_NEGEDGE macro
>   instead of _DCLK_POSITIVE(that would make sense only in realtion with D=
CLK)
> - invert condition using _NEGEDGE instead of _POSEDGE and then matching w=
ith
>   register bit SUN4I_TCON0_IO_POL_DCLK_DRIVE_NEGEDGE
> - correct commit log according to V4->V5 changes
> V5->V6:
> - fix typo in SUN4I_TCON0_IO_POL_DCLK_DRIVE_NEGEDGE as suggested by Marjan
> ---
>  drivers/gpu/drm/sun4i/sun4i_tcon.c | 21 ++-------------------
>  drivers/gpu/drm/sun4i/sun4i_tcon.h |  1 +
>  2 files changed, 3 insertions(+), 19 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.c b/drivers/gpu/drm/sun4i/s=
un4i_tcon.c
> index eaaf5d70e352..6b9af4c08cd6 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.c
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.c
> @@ -569,30 +569,13 @@ static void sun4i_tcon0_mode_set_rgb(struct sun4i_t=
con *tcon,
>  	if (info->bus_flags & DRM_BUS_FLAG_DE_LOW)
>  		val |=3D SUN4I_TCON0_IO_POL_DE_NEGATIVE;
> =20
> -	/*
> -	 * On A20 and similar SoCs, the only way to achieve Positive Edge
> -	 * (Rising Edge), is setting dclk clock phase to 2/3(240=B0).
> -	 * By default TCON works in Negative Edge(Falling Edge),
> -	 * this is why phase is set to 0 in that case.
> -	 * Unfortunately there's no way to logically invert dclk through
> -	 * IO_POL register.
> -	 * The only acceptable way to work, triple checked with scope,
> -	 * is using clock phase set to 0=B0 for Negative Edge and set to 240=B0
> -	 * for Positive Edge.
> -	 * On A33 and similar SoCs there would be a 90=B0 phase option,
> -	 * but it divides also dclk by 2.
> -	 * Following code is a way to avoid quirks all around TCON
> -	 * and DOTCLOCK drivers.
> -	 */
> -	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
> -		clk_set_phase(tcon->dclk, 240);
> -
>  	if (info->bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> -		clk_set_phase(tcon->dclk, 0);
> +		val |=3D SUN4I_TCON0_IO_POL_DCLK_DRIVE_NEGEDGE;
> =20
>  	regmap_update_bits(tcon->regs, SUN4I_TCON0_IO_POL_REG,
>  			   SUN4I_TCON0_IO_POL_HSYNC_POSITIVE |
>  			   SUN4I_TCON0_IO_POL_VSYNC_POSITIVE |
> +			   SUN4I_TCON0_IO_POL_DCLK_DRIVE_NEGEDGE |
>  			   SUN4I_TCON0_IO_POL_DE_NEGATIVE,
>  			   val);
> =20
> diff --git a/drivers/gpu/drm/sun4i/sun4i_tcon.h b/drivers/gpu/drm/sun4i/s=
un4i_tcon.h
> index cfbf4e6c1679..c5ac1b02482c 100644
> --- a/drivers/gpu/drm/sun4i/sun4i_tcon.h
> +++ b/drivers/gpu/drm/sun4i/sun4i_tcon.h
> @@ -113,6 +113,7 @@
>  #define SUN4I_TCON0_IO_POL_REG			0x88
>  #define SUN4I_TCON0_IO_POL_DCLK_PHASE(phase)		((phase & 3) << 28)
>  #define SUN4I_TCON0_IO_POL_DE_NEGATIVE			BIT(27)
> +#define SUN4I_TCON0_IO_POL_DCLK_DRIVE_NEGEDGE		BIT(26)
>  #define SUN4I_TCON0_IO_POL_HSYNC_POSITIVE		BIT(25)
>  #define SUN4I_TCON0_IO_POL_VSYNC_POSITIVE		BIT(24)
> =20
> --=20
> 2.25.1
>=20
Applied, thanks!
Maxime

--lcvqz25cpg3ywj2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYAAuGwAKCRDj7w1vZxhR
xaoIAP9OtTnumUDxgNNTQFtC7oOJn1YsBUjkqVZp2fi9J7qkwAD+NE2kvzKlPgZf
UYE0jF/kx7nz7FX3odyMJmy16ZDJrA0=
=wEvo
-----END PGP SIGNATURE-----

--lcvqz25cpg3ywj2t--

--===============1464218736==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1464218736==--
