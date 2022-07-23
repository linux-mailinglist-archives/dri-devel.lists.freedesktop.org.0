Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AC657F1E2
	for <lists+dri-devel@lfdr.de>; Sun, 24 Jul 2022 00:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23DEE96038;
	Sat, 23 Jul 2022 22:45:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37422B09B8
 for <dri-devel@lists.freedesktop.org>; Sat, 23 Jul 2022 22:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:
 Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9INdeDdiGGjVt7kAmmoK6Sl85fUEVz9OggNQttQyITU=; b=iEsWqBiXCDMyzZJa6Hvg8cM+hZ
 p0YYapIULjVVkRypytDhxPPPS9bg/jwUZuewbJ+TddQM4CFJmf8LQUYwi04UsEEYLE3k1VizScj7Q
 8ctZwbmgY6nbL0ZfWIi7NXYFT60adtJclCW8b/h98DYOMlEPWNcbFOL2IT984KegXA/2lpwg4YVkM
 dAxnMcqKSQRV8QDHZ+82hoT0lBmYWt3eLZXz/JWJDfWcRiPFMIbZxiPvmxgNv+HMs6e6sRiZGplsX
 BSGWCzJy7QBWILikc0aX+Uh4GUY22PMvzwewdj+Whc7ETF/IzWnlnlWoC1Lwf9k7x4/OleKSHmR38
 gqP85gIA==;
Received: from [165.90.126.25] (helo=mail.igalia.com)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1oFNs2-0042At-4W; Sun, 24 Jul 2022 00:45:14 +0200
Date: Sat, 23 Jul 2022 21:45:00 -0100
From: Melissa Wen <mwen@igalia.com>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH RESEND 08/10] drm/v3d: use idr_init_base() to initialize
 v3d_priv->perfmon.idr
Message-ID: <20220723224500.w6pezv3ojgu2d6qi@mail.igalia.com>
References: <20220720132830.193747-1-dakr@redhat.com>
 <20220720132830.193747-9-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="7efy5bucdwv7jzri"
Content-Disposition: inline
In-Reply-To: <20220720132830.193747-9-dakr@redhat.com>
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
Cc: emma@anholt.net, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--7efy5bucdwv7jzri
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 07/20, Danilo Krummrich wrote:
> idr_init_base(), implemented by commit 6ce711f27500 ("idr: Make 1-based
> IDRs more efficient"), let us set an arbitrary base other than
> idr_init(), which uses base 0.
>=20
> Since, for this IDR, no ID < 1 is ever requested/allocated, using
> idr_init_base(&idr, 1) avoids unnecessary tree walks.
>=20
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> Acked-by: Christian K=F6nig <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/v3d/v3d_perfmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/v3d/v3d_perfmon.c b/drivers/gpu/drm/v3d/v3d_=
perfmon.c
> index f6a88abccc7d..48aaaa972c49 100644
> --- a/drivers/gpu/drm/v3d/v3d_perfmon.c
> +++ b/drivers/gpu/drm/v3d/v3d_perfmon.c
> @@ -95,7 +95,7 @@ struct v3d_perfmon *v3d_perfmon_find(struct v3d_file_pr=
iv *v3d_priv, int id)
>  void v3d_perfmon_open_file(struct v3d_file_priv *v3d_priv)
>  {
>  	mutex_init(&v3d_priv->perfmon.lock);
> -	idr_init(&v3d_priv->perfmon.idr);
> +	idr_init_base(&v3d_priv->perfmon.idr, 1);

Reviewed-by: Melissa Wen <mwen@igalia.com>

Thanks

>  }
> =20
>  static int v3d_perfmon_idr_del(int id, void *elem, void *data)
> --=20
> 2.36.1
>=20

--7efy5bucdwv7jzri
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEd8WOo/JViG+Tu+XIwqF3j0dLehwFAmLced8ACgkQwqF3j0dL
ehwGIw/+LUNPvk78JTm0C8+zpXW9CrRPyarEFWTgL6cZSa0dyd/ssidCxMUx7pjs
G9YBT60Aq7k/TP0wYcebKKXY2UkPrrPrrIRMqpSarTFqMa9d9XBT3KFlgiYrtGI9
gCAwEPOi/o5oKphAXvRP9KWC6qcZyCPhUPmHsCMRBOsvY3HYvyj+EYb90d0jrwY0
ZdbNzVsHTDikQfKMttZo2kWYwNhSfcCO0qKMx7ccj7FssJmTeB2Rf8vRIOiChfIe
B0614Rp7UmUkXlTrK57YzWMWNRegVWbE6EVGm7E5ojRZjio87RJVcYGJG0YelQ9Y
E778NCZffqfoQiQzf7PLq0qef6LvbOBUZGqbYcLA1qMu0R1AGtBHrvhUXuVUNlsD
eMCHYmAUBK6byXJCOx9zW44iFSFaSJIyw0eiNu3oCXdxkKXCUitn+EvymPyVKEDQ
ilJprF8nuM4nGkDszQn/UiZychB4C2VpDveVFdNo6G8PONjaq6dx7QQasAuNAbYZ
n3n0Co8+T72vfnbMm5DNTks0JaFrCoSevpTVCQSE9iEqVSFE5i3uVDpcbzyb/0CJ
CvgiWMqBS7Yl+bXtRKD4HllJ+YsIhEl9N0dwbdGxJ7OSZ7jcHYb6TTKl9b1y/qf3
qbuPBlL9zQ+7WjZfh7WDGrxpdwnr/X8+xXduHHTcOX4UbnC7AyM=
=GlXz
-----END PGP SIGNATURE-----

--7efy5bucdwv7jzri--
