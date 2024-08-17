Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48339955680
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 10:58:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B5710E06C;
	Sat, 17 Aug 2024 08:58:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="jA/+K0Ku";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E0C10E06C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 08:58:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 83E74CE0121;
 Sat, 17 Aug 2024 08:58:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11DBFC116B1;
 Sat, 17 Aug 2024 08:57:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723885082;
 bh=dCqnyQN2UFl3dmnzEXRNHHoFuoYH8Pb/Zy25P4PIooM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jA/+K0KuJr6bosX7kAhhjeeNBHtpza6p1jhlROjEcWPRYknBmwZU+eHcxxeSBTkrv
 vYBlMHW2+468pbPRYmdcL4SvKRMFDqKjbPkJGv0rupfZ9BPQzZYnCktWhOmaHBXmbQ
 awtkm8U862WlOslcofyM2PSvBb0LwoZ1kG8/GQKgqzQJp3VjiFrgPc71GmGwMiBVOa
 x8aYt4pQYido4JBoJgVDF+IUvG/rQU+OoYOH9JJMuif391eMi+gQjHL6EYgwmhRuee
 Gv0mEunbxeOW/lVzQIVMTNXsu78p6/AGLxYiNcco83pGmdFKxbPhcBbTto09rtMU6G
 iLrN0sAz4TlMA==
Date: Sat, 17 Aug 2024 10:57:56 +0200
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
Subject: Re: [PATCH v7 6/8] mm/util: Deduplicate code in
 {kstrdup,kstrndup,kmemdup_nul}
Message-ID: <nmhexn3mkwhgu5e6o3i7gvipboisbuwdoloshf64ulgzdxr5nv@3gwujx2y5jre>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-7-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="sc6ko3aljxex75k2"
Content-Disposition: inline
In-Reply-To: <20240817025624.13157-7-laoar.shao@gmail.com>
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


--sc6ko3aljxex75k2
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
Subject: Re: [PATCH v7 6/8] mm/util: Deduplicate code in
 {kstrdup,kstrndup,kmemdup_nul}
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-7-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240817025624.13157-7-laoar.shao@gmail.com>

Hi Yafang,

On Sat, Aug 17, 2024 at 10:56:22AM GMT, Yafang Shao wrote:
> These three functions follow the same pattern. To deduplicate the code,
> let's introduce a common helper __kmemdup_nul().
>=20
> Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: Simon Horman <horms@kernel.org>
> Cc: Matthew Wilcox <willy@infradead.org>
> ---
>  mm/util.c | 67 +++++++++++++++++++++----------------------------------
>  1 file changed, 26 insertions(+), 41 deletions(-)
>=20
> diff --git a/mm/util.c b/mm/util.c
> index 4542d8a800d9..310c7735c617 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -45,33 +45,40 @@ void kfree_const(const void *x)
>  EXPORT_SYMBOL(kfree_const);
> =20
>  /**
> - * kstrdup - allocate space for and copy an existing string
> - * @s: the string to duplicate
> + * __kmemdup_nul - Create a NUL-terminated string from @s, which might b=
e unterminated.
> + * @s: The data to copy
> + * @len: The size of the data, including the null terminator
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
> +	buf =3D kmalloc_track_caller(len, gfp);
> +	if (!buf)
>  		return NULL;
> =20
> -	len =3D strlen(s) + 1;
> -	buf =3D kmalloc_track_caller(len, gfp);
> -	if (buf) {
> -		memcpy(buf, s, len);
> -		/* During memcpy(), the string might be updated to a new value,
> -		 * which could be longer than the string when strlen() is
> -		 * called. Therefore, we need to add a null termimator.
> -		 */
> -		buf[len - 1] =3D '\0';
> -	}
> +	memcpy(buf, s, len);
> +	/* Ensure the buf is always NUL-terminated, regardless of @s. */
> +	buf[len - 1] =3D '\0';
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
> +	return s ? __kmemdup_nul(s, strlen(s) + 1, gfp) : NULL;
> +}
>  EXPORT_SYMBOL(kstrdup);
> =20
>  /**
> @@ -106,19 +113,7 @@ EXPORT_SYMBOL(kstrdup_const);
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
> +	return s ? __kmemdup_nul(s, strnlen(s, max) + 1, gfp) : NULL;
>  }
>  EXPORT_SYMBOL(kstrndup);
> =20
> @@ -192,17 +187,7 @@ EXPORT_SYMBOL(kvmemdup);
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
> +	return s ? __kmemdup_nul(s, len + 1, gfp) : NULL;
>  }
>  EXPORT_SYMBOL(kmemdup_nul);

I like the idea of the patch, but it's plagued with all those +1 and -1.
I think that's due to a bad choice of value being passed by.  If you
pass the actual length of the string (as suggested in my reply to the
previous patch) you should end up with a cleaner set of APIs.

The only remaining +1 is for kmalloc_track_caller(), which I ignore what
it does.

	char *
	__kmemdup_nul(const char *s, size_t len, gfp_t gfp)
	{
		char *buf;

		buf =3D kmalloc_track_caller(len + 1, gfp);
		if (!buf)
			return NULL;

		strcpy(mempcpy(buf, s, len), "");
		return buf;
	}

	char *
	kstrdup(const char *s, gfp_t gfp)
	{
		return s ? __kmemdup_nul(s, strlen(s), gfp) : NULL;
	}

	char *
	kstrndup(const char *s, size_t n, gfp_t gfp)
	{
		return s ? __kmemdup_nul(s, strnlen(s, n), gfp) : NULL;
	}

	char *
	kmemdup_nul(const char *s, size_t len, gfp_t gfp)
	{
		return s ? __kmemdup_nul(s, len, gfp) : NULL;
	}

Have a lovely day!
Alex

--=20
<https://www.alejandro-colomar.es/>

--sc6ko3aljxex75k2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmbAZhQACgkQnowa+77/
2zLSDhAAk8fODkJDRXvKCNp5tsLUvdHvQxqdEu4TN2l1Adq0ikdxXT3bMWS/GANV
dv/O9AzGQAzVzaeG3Z7uelEFLUrhKvbS0U019F6JPTLzmk0FVgK+ZgJgZ+48Ow7m
raK9HJr/m6JHtW88LThyKubewPQdnu9/DsySW7qrwNhtdGcbw+zNGTTPJYolzf2k
mpvaEhs58srxhy/0Bs7QaFtn3gtsEVJ0rybwT3sEE6S/fnZ/iExx1PSr3mbWZkIz
NuUPekcrqKFfwFIcQMBuSNV+//Eku8h8h6SZE3tbTu2+A9V8I3KxMmCbLraMYi8x
j9lMOJoPEZLKEVHGitamyvAlThGJOOK+4CLqEVKYlofjMt51OX+FZDTnNk6h1FSG
bCE/yE4W0w/9/Wz9OywRkv0X2RfStKDILVgeWd7MhkcoJdg6FdAU9zQ/0UjVjhjz
aYyIX+0dGguAm7RyGI+IvoSgo5cidoD/kmo7UKF4Y8YhTtdtyi/3uYyJvXZsJUcj
lZePj2bznRHJC7izE+NdVsKhuW48n1CfV7RFg/JfBBaDYBHJ/9ch3WfDaJ5jcCfM
WbRQczftMNyNEuE0yEVQugKngeNShru4KoySkZtpiNx805lHwbHvrdHlxFG8xSin
iI8byyMOTtBv2znlfaIx2MK4tJs6xiDuPKfzZ0LGTyI3gTEIk5Q=
=0Zb6
-----END PGP SIGNATURE-----

--sc6ko3aljxex75k2--
