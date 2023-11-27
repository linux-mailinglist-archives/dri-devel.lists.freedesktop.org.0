Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6401A7FA69F
	for <lists+dri-devel@lfdr.de>; Mon, 27 Nov 2023 17:38:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7D8810E3A3;
	Mon, 27 Nov 2023 16:38:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16CB710E3A3
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Nov 2023 16:38:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 76515CE0FB9;
 Mon, 27 Nov 2023 16:38:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F78FC433C7;
 Mon, 27 Nov 2023 16:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1701103096;
 bh=Jc3uA/l1xBlBTvWQCweF4LiIVoRMESPYgni0yWyW2Fs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTQIm9VH39NKodbZyyDvRXxu01IHJDuYFiSXB4jaBnPiFhXMweVgff7c7Ccb6CS/F
 LnM3e6/tBcAaiZUxblFUn6aj9+y55YxbyqHf32ns3pwKhPRxDBOHY51UCo6QxclrTB
 faIMrxb/8qLlPrMx7z6Pi4ppFSX5Zqo/sR0uEDxTb7xgsFOFqSUVszxMpSu8QMvFNw
 Cph8H3g+F+BZzwmh/K0i3MIMjzxYI85fQ/0vrnLEeWtAFhcBwB6EnIgiLYbVYfKyG0
 /N2EPflRHlJAso6QDwGSjJVgRFmyhkYoeJWlLxO/9eIZwiEBRJNsyUGE+x1qB1l0ZH
 I27k7+m89VOGw==
Date: Mon, 27 Nov 2023 17:38:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: rafael@kernel.org, gregkh@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] driver core: Export device_is_dependent() to
 modules
Message-ID: <v6rthnruba5xaxazsn4jsptn6catso5qwuyf5xxbf4ml25b6eo@snttjo7oqlod>
References: <20231127051414.3783108-1-victor.liu@nxp.com>
 <20231127051414.3783108-2-victor.liu@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="qtwx6kzcm62expan"
Content-Disposition: inline
In-Reply-To: <20231127051414.3783108-2-victor.liu@nxp.com>
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
Cc: sfr@canb.auug.org.au, ulf.hansson@linaro.org, jernej.skrabec@gmail.com,
 rfoss@kernel.org, tzimmermann@suse.de, neil.armstrong@linaro.org,
 Liu Ying <victor.liu@nxp.com>, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-next@vger.kernel.org,
 Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 angelogioacchino.delregno@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--qtwx6kzcm62expan
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Greg, Rafael,

On Mon, Nov 27, 2023 at 01:14:13PM +0800, Liu Ying wrote:
> Export device_is_dependent() since the drm_kms_helper module is starting
> to use it.
>=20
> Signed-off-by: Liu Ying <victor.liu@nxp.com>
> ---
> v2:
> * Newly introduced as needed by patch 2.
>=20
>  drivers/base/core.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 67ba592afc77..bfd2bf0364b7 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -328,6 +328,7 @@ int device_is_dependent(struct device *dev, void *tar=
get)
>  	}
>  	return ret;
>  }
> +EXPORT_SYMBOL_GPL(device_is_dependent);

So, a committer just applied this to drm-misc-fixes without your
approval. Could you ack it? If you don't want to, we'll fix it.

Maxime

--qtwx6kzcm62expan
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZWTF9QAKCRDj7w1vZxhR
xb0rAP48ijAtHc/miJhU3dvSZ7sHTokRzAIYyqw7KRtdReE2hwD/ahQdxB+702cR
W49SZmDCxK5raw/Hq4Pk4Xi/s7ICwA4=
=B8s7
-----END PGP SIGNATURE-----

--qtwx6kzcm62expan--
