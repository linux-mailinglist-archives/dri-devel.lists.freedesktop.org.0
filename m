Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82BEC23D52F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Aug 2020 03:49:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B7036E10C;
	Thu,  6 Aug 2020 01:49:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [203.11.71.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB59A6E10C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Aug 2020 01:49:02 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4BMWcR5H9gz9sPC;
 Thu,  6 Aug 2020 11:48:55 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=canb.auug.org.au;
 s=201702; t=1596678540;
 bh=Ceb6LToJ+7vmEHhGywFYyHWH3nc/3SWKpK13hR/D9sU=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Yx3BJr6pOw4OmA8EZp0nMhU9EQiiGK96eNm+E244cdRsEyxS9+lBXbwYyVLTzlM7I
 HXN43s7N8yL3VoE8wdrGycmcFjBch7eM6Sdygp3dMEFmX0vdESx6bfMFhjoAYF3utQ
 NMU1wKsqKRBBLxrHOLIvH4dOBzUnwcmGJXAY5OdiRYX1UkRGQy1zEZ0p9GhV59UqZs
 wcMycN8JK9znIBjOP7bIiZWE6UmJ/6eMOfFbUD6qmFjvy6Sb5EagMd9mZ/tFT3qxVm
 G3XrUyVZg0LdrrGFKclf7CAGO+PUbFSX1JBmT8K3Yo0boBOWqVnotwRCn5dpV3fesU
 VdZpXCieSOaDQ==
Date: Thu, 6 Aug 2020 11:48:53 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Subject: Re: linux-next: manual merge of the devicetree tree with the drm tree
Message-ID: <20200806114853.43f2e6fb@canb.auug.org.au>
In-Reply-To: <20200722155239.07bafdfc@canb.auug.org.au>
References: <20200722155239.07bafdfc@canb.auug.org.au>
MIME-Version: 1.0
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
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Rob Herring <robherring2@gmail.com>,
 "Alexander A. Klimov" <grandmaster@al2klimov.de>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0473382598=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--===============0473382598==
Content-Type: multipart/signed; boundary="Sig_/ciKrCbctQVDTvj=cVrqeP4m";
 protocol="application/pgp-signature"; micalg=pgp-sha256

--Sig_/ciKrCbctQVDTvj=cVrqeP4m
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Wed, 22 Jul 2020 15:52:39 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>
> Today's linux-next merge of the devicetree tree got a conflict in:
>=20
>   Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.txt
>=20
> between commit:
>=20
>   5a2e9b658cdc ("dt-bindings: drm/bridge: ti-sn65dsi86: Convert to yaml")
>=20
> from the drm tree and commit:
>=20
>   382646090f7f ("dt-bindings: drm/bridge: Replace HTTP links with HTTPS o=
nes")
>=20
> from the devicetree tree.
>=20
> I fixed it up (I delete the file and adde the following merge fix
> patch) and can carry the fix as necessary. This is now fixed as far as
> linux-next is concerned, but any non trivial conflicts should be
> mentioned to your upstream maintainer when your tree is submitted for
> merging.  You may also want to consider cooperating with the maintainer
> of the conflicting tree to minimise any particularly complex conflicts.
>=20
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Wed, 22 Jul 2020 15:47:22 +1000
> Subject: [PATCH] fix for "dt-bindings: drm/bridge: Replace HTTP links wit=
h HTTPS ones"
>=20
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  .../devicetree/bindings/display/bridge/ti,sn65dsi86.yaml        | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi8=
6.yaml b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> index be10e8cf31e1..f8622bd0f61e 100644
> --- a/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> +++ b/Documentation/devicetree/bindings/display/bridge/ti,sn65dsi86.yaml
> @@ -11,7 +11,7 @@ maintainers:
> =20
>  description: |
>    The Texas Instruments SN65DSI86 bridge takes MIPI DSI in and outputs e=
DP.
> -  http://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumber=
=3Dsn65dsi86&fileType=3Dpdf
> +  https://www.ti.com/general/docs/lit/getliterature.tsp?genericPartNumbe=
r=3Dsn65dsi86&fileType=3Dpdf
> =20
>  properties:
>    compatible:
> --=20
> 2.27.0

This is now a conflict between the drm tree and Linus' tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/ciKrCbctQVDTvj=cVrqeP4m
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAl8rYYUACgkQAVBC80lX
0GwIXQf/SLzjkXaFmkX9wJyeKhhsoMGpM7T59b9DWNPtr1S4cP7EIuDXY7+cBhde
UsF9GfJux7P2i1OadYftdH843y4rGP+SmxxKt0/2DsNjgsWQXz1u4/khJ3tEz9Q7
aRQD9ukn9F6UjiJmWvWtn1RTpJj58RYjHAoMGEB7aKIMD1bBCWiq30CD8cxheBZt
z/hm4bPSpK3JoyP2JH0lz901ZmgoAhEwek3eX2F8FYgAaAvnDwS9FqjsZbJ8g3OR
y0VgI/y+6CnLinCWeYkH+kMJZa4rCU+dBdkRZBeMio/T9DC7mwHvZHjPJ0Ec7wmm
2wr2T2pU6kEHlf+QMYbkq1Z4Hs7Q4w==
=D5vb
-----END PGP SIGNATURE-----

--Sig_/ciKrCbctQVDTvj=cVrqeP4m--

--===============0473382598==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0473382598==--
