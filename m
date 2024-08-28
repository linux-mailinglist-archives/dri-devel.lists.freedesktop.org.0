Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 389B29624F5
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 12:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 169E910E14D;
	Wed, 28 Aug 2024 10:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="rkDzbRiK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EA1E10E14D
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 10:32:54 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 9A47AA43368;
 Wed, 28 Aug 2024 10:32:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D188C98EC2;
 Wed, 28 Aug 2024 10:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724841173;
 bh=RAZiyHV0BW9WjoN1ECXpyLaENcTOjscCNA3CQ8WtSxg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rkDzbRiKRlpXFmTZretmNOGGQgiy5srKWiQ0PRA0Tk0OZDkahXPqUd4Z9CUuUNqBo
 nYGxEXH3rwTgaamSsdtMI/ul4SgdEA45Mv5vcQ1jvnYqV8l67eUuZvJUhL0+SpOZLc
 CtR3OVviUoN03RcnZCIWKOV5FaDXwjOJQL/YcDD8pcTl4aTGvITIxAaQnIJVjL/dxH
 TEfdTsqMfwOnr6d/uYlOW+ygSijg0UhHigPd3keM8m3YwMUpZU+wsk3kDRnsPInXGr
 luK/ARDKw3REReStXJIPprYvfeemOfSSHFZLRQB2gkKHeej8wuLr70XMYRGbXclw6c
 riP3Ob2CZ89tw==
Date: Wed, 28 Aug 2024 12:32:47 +0200
From: Alejandro Colomar <alx@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
 justinstitt@google.com, ebiederm@xmission.com, alexei.starovoitov@gmail.com, 
 rostedt@goodmis.org, catalin.marinas@arm.com,
 penguin-kernel@i-love.sakura.ne.jp, 
 linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org,
 linux-security-module@vger.kernel.org, 
 selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Simon Horman <horms@kernel.org>, 
 Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v8 6/8] mm/util: Deduplicate code in
 {kstrdup,kstrndup,kmemdup_nul}
Message-ID: <byi4tx6l2lrbs5w6oxypr44ldntlh4kp56vnsza3iuztwb37oa@2qtdx2kgz4bq>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-7-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fvf522dvf7ucivwn"
Content-Disposition: inline
In-Reply-To: <20240828030321.20688-7-laoar.shao@gmail.com>
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


--fvf522dvf7ucivwn
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
From: Alejandro Colomar <alx@kernel.org>
To: Yafang Shao <laoar.shao@gmail.com>
Cc: akpm@linux-foundation.org, torvalds@linux-foundation.org, 
	justinstitt@google.com, ebiederm@xmission.com, alexei.starovoitov@gmail.com, 
	rostedt@goodmis.org, catalin.marinas@arm.com, penguin-kernel@i-love.sakura.ne.jp, 
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, audit@vger.kernel.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, bpf@vger.kernel.org, netdev@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, Simon Horman <horms@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v8 6/8] mm/util: Deduplicate code in
 {kstrdup,kstrndup,kmemdup_nul}
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-7-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240828030321.20688-7-laoar.shao@gmail.com>

On Wed, Aug 28, 2024 at 11:03:19AM GMT, Yafang Shao wrote:
> These three functions follow the same pattern. To deduplicate the code,
> let's introduce a common helper __kmemdup_nul().
>=20
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Alejandro Colomar <alx@kernel.org>
> ---

Reviewed-by: Alejandro Colomar <alx@kernel.org>

Cheers,
Alex

>  mm/util.c | 68 ++++++++++++++++++++++---------------------------------
>  1 file changed, 27 insertions(+), 41 deletions(-)
>=20
> diff --git a/mm/util.c b/mm/util.c
> index 9a77a347c385..42714fe13e24 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -45,33 +45,41 @@ void kfree_const(const void *x)
>  EXPORT_SYMBOL(kfree_const);
> =20
>  /**
> - * kstrdup - allocate space for and copy an existing string
> - * @s: the string to duplicate
> + * __kmemdup_nul - Create a NUL-terminated string from @s, which might b=
e unterminated.
> + * @s: The data to copy
> + * @len: The size of the data, not including the NUL terminator
>   * @gfp: the GFP mask used in the kmalloc() call when allocating memory
>   *
> - * Return: newly allocated copy of @s or %NULL in case of error
> + * Return: newly allocated copy of @s with NUL-termination or %NULL in
> + * case of error
>   */
> -noinline
> -char *kstrdup(const char *s, gfp_t gfp)
> +static __always_inline char *__kmemdup_nul(const char *s, size_t len, gf=
p_t gfp)
>  {
> -	size_t len;
>  	char *buf;
> =20
> -	if (!s)
> +	/* '+1' for the NUL terminator */
> +	buf =3D kmalloc_track_caller(len + 1, gfp);
> +	if (!buf)
>  		return NULL;
> =20
> -	len =3D strlen(s) + 1;
> -	buf =3D kmalloc_track_caller(len, gfp);
> -	if (buf) {
> -		memcpy(buf, s, len);
> -		/* During memcpy(), the string might be updated to a new value,
> -		 * which could be longer than the string when strlen() is
> -		 * called. Therefore, we need to add a NUL termimator.
> -		 */
> -		buf[len - 1] =3D '\0';
> -	}
> +	memcpy(buf, s, len);
> +	/* Ensure the buf is always NUL-terminated, regardless of @s. */
> +	buf[len] =3D '\0';
>  	return buf;
>  }
> +
> +/**
> + * kstrdup - allocate space for and copy an existing string
> + * @s: the string to duplicate
> + * @gfp: the GFP mask used in the kmalloc() call when allocating memory
> + *
> + * Return: newly allocated copy of @s or %NULL in case of error
> + */
> +noinline
> +char *kstrdup(const char *s, gfp_t gfp)
> +{
> +	return s ? __kmemdup_nul(s, strlen(s), gfp) : NULL;
> +}
>  EXPORT_SYMBOL(kstrdup);
> =20
>  /**
> @@ -106,19 +114,7 @@ EXPORT_SYMBOL(kstrdup_const);
>   */
>  char *kstrndup(const char *s, size_t max, gfp_t gfp)
>  {
> -	size_t len;
> -	char *buf;
> -
> -	if (!s)
> -		return NULL;
> -
> -	len =3D strnlen(s, max);
> -	buf =3D kmalloc_track_caller(len+1, gfp);
> -	if (buf) {
> -		memcpy(buf, s, len);
> -		buf[len] =3D '\0';
> -	}
> -	return buf;
> +	return s ? __kmemdup_nul(s, strnlen(s, max), gfp) : NULL;
>  }
>  EXPORT_SYMBOL(kstrndup);
> =20
> @@ -192,17 +188,7 @@ EXPORT_SYMBOL(kvmemdup);
>   */
>  char *kmemdup_nul(const char *s, size_t len, gfp_t gfp)
>  {
> -	char *buf;
> -
> -	if (!s)
> -		return NULL;
> -
> -	buf =3D kmalloc_track_caller(len + 1, gfp);
> -	if (buf) {
> -		memcpy(buf, s, len);
> -		buf[len] =3D '\0';
> -	}
> -	return buf;
> +	return s ? __kmemdup_nul(s, len, gfp) : NULL;
>  }
>  EXPORT_SYMBOL(kmemdup_nul);
> =20
> --=20
> 2.43.5
>=20

--=20
<https://www.alejandro-colomar.es/>

--fvf522dvf7ucivwn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmbO/MkACgkQnowa+77/
2zJ0rg/6A9w0pR/IBhWTYnFTKH8DiRQVQuPVpRuWDuTYTqrMqUR2OEtQ2gWcf10h
TYl0N0mXcVo4vsCvdthueqs1ipa1bvOY3QN5aKpL5qXRq81NBe4JWd7ym/T8TU9Z
EP6iBPimsQMYTPMNwgCK768HYPfu9lygO8CecifrGLoSZ5EDZ2GnyDz2xzCMZIq6
+KKTKJqyhww4ydIgm49fMi1bk59rI45fjg0GpVepcATmdR6bbPiE8yvdazxOJCT1
t6dAVGehLzNV1hGgDqiG8QS0GuqM1YMwEy6pWoi6zoHUjT8326bOP0UXuzB1NAxd
M93w62xDoKpceGkLS22ajjH+0H7qgBtWyXBpd6QUVoqQ0lBWpnS7FfqMh9wJmd5L
55IaQKIPcaWDSBImqC/Mm2NYgH0DgcuF+JN/xaR6bhx+92rpzhE4/HM7Fll9OmuF
NVDkfuQIuuuZ74Be1QOYCa4h+jeB6sksNlF18wmhH8OipYCzRVEjROxUSd4SSb2m
bWd1Wpkx65jf1musgB9Q3oGofNPQvx9xnKYKk97o0n+UXyi7B7abukTl4oXKWbmB
WisDpchUmGJAOm0uncet+rsM5Vod5zXbdf0aRXz5WPYAE1CDauPDzi9z2qKrYdHc
gzn7xNZqVSRW8SsYctxEgro1zc1c8XxsHFiWJCQdjtwh9fOA1zU=
=+sNM
-----END PGP SIGNATURE-----

--fvf522dvf7ucivwn--
