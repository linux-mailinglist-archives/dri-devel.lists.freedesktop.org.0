Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 736549D6451
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 19:51:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C8F710EC6A;
	Fri, 22 Nov 2024 18:51:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=sebastian.reichel@collabora.com header.b="hoIXMCZj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com
 [136.143.188.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 221D310E300
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 18:51:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1732301455; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=gInYdvLqG1o6ZdSbDYACNnLl1deipdaNI1bOigW4cNoq9DztwKU9D6lGf5ljEoKN/k6KH2+jyYN7/O/sb4AmkRSOi7TD2HF14ZqAX6JZnqQEELmNbcw/5F9yXbsvKAkgjKdMvG4dkGHm4vBpKmBj6CFH8pxhmrhgaU7GhXuh61U=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1732301455;
 h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=S+FtLMtWNpKULLmd3K8NNsS/XMu6z2ERGdnDAQCM4cA=; 
 b=YWpOMkjCSC3NC6o9mlOv0L5H6UKGjOj5Plwth6zBMSgNigCCCZVNqGLkmyJLwneQcFzgOh17yOefN8v7GHxtYf28CZFGp/5jH+4c7loTnXTBbgFrZqyIM2M7b+iJQyXYslAp+87KLDU7SByHVx0DcI9HqjSdivmgtvpBvg8JVOU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
 dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1732301455; 
 s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
 h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
 bh=S+FtLMtWNpKULLmd3K8NNsS/XMu6z2ERGdnDAQCM4cA=;
 b=hoIXMCZjIC3/A6uPhIPVnz2hIwmPI8EHKezy2lDoJp563zJwnFbGT+/vp29I/CKc
 7Iyg/Na1WkChFoKtosaFO3wL8boU+5B6N8ul2wvSSHt7ge0MrupOVUF/2lKqDqfuzGl
 xY51sefp+tDCV3JDIwtimuF3XNM2bT9ckfK7kYyA=
Received: by mx.zohomail.com with SMTPS id 1732301451890468.4328585076563;
 Fri, 22 Nov 2024 10:50:51 -0800 (PST)
Received: by mercury (Postfix, from userid 1000)
 id 058D410604B0; Fri, 22 Nov 2024 19:50:47 +0100 (CET)
Date: Fri, 22 Nov 2024 19:50:47 +0100
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: quentin.schulz@theobroma-systems.com, hjc@rock-chips.com, 
 andy.yan@rock-chips.com, dri-devel@lists.freedesktop.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko.stuebner@cherry.de>,
 Quentin Schulz <quentin.schulz@cherry.de>, Andy Yan <andyshrk@163.com>
Subject: Re: [PATCH v2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk
 verification
Message-ID: <hmdbq56pv3hzzeewh2vy7khe3zr5yz7loas62antivuq2yl4lm@oyojcydl2u42>
References: <20241115151131.416830-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2eeu7mhffudy7uue"
Content-Disposition: inline
In-Reply-To: <20241115151131.416830-1-heiko@sntech.de>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-1.3.1/232.275.92
X-ZohoMailClient: External
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


--2eeu7mhffudy7uue
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] drm/rockchip: vop2: fix rk3588 dp+dsi maxclk
 verification
MIME-Version: 1.0

Hi,

On Fri, Nov 15, 2024 at 04:11:31PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>=20
> The clock is in Hz while the value checked against is in kHz, so
> actual frequencies will never be able to be below to max value.
> Fix this by specifying the max-value in Hz too.
>=20
> Fixes: 5a028e8f062f ("drm/rockchip: vop2: Add support for rk3588")
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
> Acked-by: Andy Yan<andyshrk@163.com>
> ---

Reviewed-by: Sebastian Reichel <sebastian.reichel@collabora.com>
Tested-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

> changes in v2:
> - drop the separate vp3-config patch, as vp3 will always get the leftover
>   resources, so _should_ be fine (Andy)
> - fix error output to also report Hz for the value in Hz (Quentin)
> - add received Reviews+Acks
>=20
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/d=
rm/rockchip/rockchip_drm_vop2.c
> index 9ad025aa9ab0..0c8ec7220fbe 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1864,9 +1864,9 @@ static unsigned long rk3588_calc_cru_cfg(struct vop=
2_video_port *vp, int id,
>  		else
>  			dclk_out_rate =3D v_pixclk >> 2;
> =20
> -		dclk_rate =3D rk3588_calc_dclk(dclk_out_rate, 600000);
> +		dclk_rate =3D rk3588_calc_dclk(dclk_out_rate, 600000000);
>  		if (!dclk_rate) {
> -			drm_err(vop2->drm, "DP dclk_out_rate out of range, dclk_out_rate: %ld=
 KHZ\n",
> +			drm_err(vop2->drm, "DP dclk_out_rate out of range, dclk_out_rate: %ld=
 Hz\n",
>  				dclk_out_rate);
>  			return 0;
>  		}
> @@ -1881,9 +1881,9 @@ static unsigned long rk3588_calc_cru_cfg(struct vop=
2_video_port *vp, int id,
>  		 * dclk_rate =3D N * dclk_core_rate N =3D (1,2,4 ),
>  		 * we get a little factor here
>  		 */
> -		dclk_rate =3D rk3588_calc_dclk(dclk_out_rate, 600000);
> +		dclk_rate =3D rk3588_calc_dclk(dclk_out_rate, 600000000);
>  		if (!dclk_rate) {
> -			drm_err(vop2->drm, "MIPI dclk out of range, dclk_out_rate: %ld KHZ\n",
> +			drm_err(vop2->drm, "MIPI dclk out of range, dclk_out_rate: %ld Hz\n",
>  				dclk_out_rate);
>  			return 0;
>  		}
> --=20
> 2.45.2
>=20

--2eeu7mhffudy7uue
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmdA0ocACgkQ2O7X88g7
+pq+OA//auA09X+F19vqyltYszS4rFqnQHuB4VhXl2Tt3aPbMHzg0JHlYHZqdl8o
hXEBxgTCOMULUc0+yK/mfTdeOYtFwrDjXrfTxNvkrKuUvkW59rlZK5+eFrINVoYB
+1B4/kAckcEBbuNuHEYm1IjDNZtQQ5cmidoX0X4BAcXpXU181JjVusfXbmZeryJW
sTY/Dj3Uva0JGhUz1vghwpHxgOy8ZVGdNXcfu86ICF04/3bnTAmoZrDFNiX6qz57
i5jLi9HtAs9gzgW4KNzX8TzRzlWGKZMxiTAc71AfZXrS0oReotkGFKr1MRQga16V
94jQa1VrK2xUPXKl7XOjJN+29+N8pUFDqd8fVUW7+X6xaS9oD5axFADpEaLltfBT
8bInVEuXx4g0/DWoA8/eLXwEo4p5XbZC0ZGCnE5GJ4eAGZnorSJPcC//I52DJzOt
XPobbijNgdexFdPV9q+GEaDQ235fQosoCNeJ6YQbVZY7AgVZ8/QTUWNgEzI6Akrl
084Lyf++bIYLk1Bxtp8J7AVs2t0HQ2LpZoB6TdbANkG7wbGKJxPXXBahk3KQchNq
QkUczep6xS/gvZc57g8+4QEa0bHWN48dmBFXV8y9p8/oFpAbjOL9W+xogVoT20RL
QKinHDk7Ucho/J9lyems96suStxkV70OhpF0vJ4jE4ey2eMDzwI=
=oZX3
-----END PGP SIGNATURE-----

--2eeu7mhffudy7uue--
