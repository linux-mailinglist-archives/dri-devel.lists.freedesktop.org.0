Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 176D435C3FA
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 12:28:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ACD6E513;
	Mon, 12 Apr 2021 10:28:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 714746E50B
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Apr 2021 10:28:51 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id F057BAFCF;
 Mon, 12 Apr 2021 10:28:49 +0000 (UTC)
Subject: Re: [PATCH 12/18] drm/vc4: hdmi: Replace CSC_CTL hardcoded value by
 defines
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-13-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <f9dc15a6-0965-cdd0-8ded-1243678b7e30@suse.de>
Date: Mon, 12 Apr 2021 12:28:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210317154352.732095-13-maxime@cerno.tech>
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
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Content-Type: multipart/mixed; boundary="===============0399590390=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0399590390==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dmZdc5j6nqs5UGDPc24XhDgPJxBid2AUL"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dmZdc5j6nqs5UGDPc24XhDgPJxBid2AUL
Content-Type: multipart/mixed; boundary="Y0L173ukZCNYk7PjvCKQ8iSdfROmT48Wu";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Daniel Vetter <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Jernej Skrabec <jernej.skrabec@siol.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>
Cc: Tim Gover <tim.gover@raspberrypi.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 linux-rpi-kernel@lists.infradead.org, Phil Elwell <phil@raspberrypi.com>
Message-ID: <f9dc15a6-0965-cdd0-8ded-1243678b7e30@suse.de>
Subject: Re: [PATCH 12/18] drm/vc4: hdmi: Replace CSC_CTL hardcoded value by
 defines
References: <20210317154352.732095-1-maxime@cerno.tech>
 <20210317154352.732095-13-maxime@cerno.tech>
In-Reply-To: <20210317154352.732095-13-maxime@cerno.tech>

--Y0L173ukZCNYk7PjvCKQ8iSdfROmT48Wu
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 17.03.21 um 16:43 schrieb Maxime Ripard:
> On BCM2711, the HDMI_CSC_CTL register value has been hardcoded to an
> opaque value. Let's replace it with properly defined values.
>=20
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

> ---
>   drivers/gpu/drm/vc4/vc4_hdmi.c | 5 ++---
>   drivers/gpu/drm/vc4/vc4_regs.h | 3 +++
>   2 files changed, 5 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_hdmi.c b/drivers/gpu/drm/vc4/vc4_h=
dmi.c
> index 9ba555d24187..b0e0cb533944 100644
> --- a/drivers/gpu/drm/vc4/vc4_hdmi.c
> +++ b/drivers/gpu/drm/vc4/vc4_hdmi.c
> @@ -528,12 +528,11 @@ static void vc4_hdmi_csc_setup(struct vc4_hdmi *v=
c4_hdmi,
>   static void vc5_hdmi_csc_setup(struct vc4_hdmi *vc4_hdmi,
>   			       const struct drm_display_mode *mode)
>   {
> -	u32 csc_ctl;
> +	u32 csc_ctl =3D VC5_MT_CP_CSC_CTL_ENABLE | VC4_SET_FIELD(VC4_HD_CSC_C=
TL_MODE_CUSTOM,
> +							       VC5_MT_CP_CSC_CTL_MODE);
>  =20
>   	HDMI_WRITE(HDMI_VEC_INTERFACE_XBAR, 0x354021);
>  =20
> -	csc_ctl =3D 0x07;	/* RGB_CONVERT_MODE =3D custom matrix, || USE_RGB_T=
O_YCBCR */
> -
>   	if (vc4_hdmi_is_full_range_rgb(vc4_hdmi, mode)) {
>   		/* CEA VICs other than #1 requre limited range RGB
>   		 * output unless overridden by an AVI infoframe.
> diff --git a/drivers/gpu/drm/vc4/vc4_regs.h b/drivers/gpu/drm/vc4/vc4_r=
egs.h
> index be2c32a519b3..9d7c034c8b4f 100644
> --- a/drivers/gpu/drm/vc4/vc4_regs.h
> +++ b/drivers/gpu/drm/vc4/vc4_regs.h
> @@ -744,6 +744,9 @@
>   # define VC4_HD_CSC_CTL_RGB2YCC			BIT(1)
>   # define VC4_HD_CSC_CTL_ENABLE			BIT(0)
>  =20
> +# define VC5_MT_CP_CSC_CTL_ENABLE		BIT(2)
> +# define VC5_MT_CP_CSC_CTL_MODE_MASK		VC4_MASK(1, 0)
> +
>   # define VC4_DVP_HT_CLOCK_STOP_PIXEL		BIT(1)
>  =20
>   /* HVS display list information. */
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Y0L173ukZCNYk7PjvCKQ8iSdfROmT48Wu--

--dmZdc5j6nqs5UGDPc24XhDgPJxBid2AUL
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmB0IOAFAwAAAAAACgkQlh/E3EQov+C/
Zw//TrvOiYXqhcNJc9RAoqkB19FOJFuAHiHxU1JLlfwUHmWMEuTWxbREs+N26BCvmm7WDcPJJDSj
0FwwrMNvf/Uvh86DP5oDjmOadreyLAZBIlwgF2QWBzbwKztIcvW4BLS5onpWwVi8nTdvvNaFIhmf
0/45FCqcCZh3JjRzwFEwNW7nwZg4F6ijn3Ps63aEmlwmqx8aUXZ2agL4zqcTyiK/jR13zIfW6Bvs
Zfn09yWQoJ39Ju7xzaMtmL1jVAVifIoHsFM0LtHT88pBzYFHQdUv/GCXLMIGvmKzCX+3qqAC+au6
L4hvdpa51HewPlyFSUc8HZhz70/vsxroMuFbnkUpiqrIBXkEeLsxH5RHuW6/p1e2tzn1BxFUTamo
Eki4MJHa2jaKQkqF6VOMbw5iXgOLYSozTiBJQXGptbZUN+O5FS4M7HUl8qL+7Wkk1ijmiAse7897
F5816rvuNDibMgrMdAE3iT/H9KdwIofgQl2U3sgD66ZkVHB4V8K+g6HGe//DIMujmosyh4sQI9tU
VOLOa2fiuxm5BQqvks6eSvPbC8ShJrgR+pSO82we+XDEvISv4X490OKTFJkkzh9lqI6KKnf4jQbz
L1cdqnoFjzguowOnq5/PnMhCcvrpApgtN1xkOVS2+Wz+oojQRJIknRwjc2OJQf4Edm0aqcs+xlJP
+Ng=
=E2/x
-----END PGP SIGNATURE-----

--dmZdc5j6nqs5UGDPc24XhDgPJxBid2AUL--

--===============0399590390==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0399590390==--
