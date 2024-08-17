Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 782A5955676
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 10:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A117810E07A;
	Sat, 17 Aug 2024 08:48:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Uwag4ecI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4925D10E06C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 08:48:18 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 652D5CE0FFC;
 Sat, 17 Aug 2024 08:48:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E68BC116B1;
 Sat, 17 Aug 2024 08:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723884495;
 bh=y+GQ801+56Qy38J6PlOE3jEeIZQ6gl38pFHqBSE07mM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Uwag4ecIv7SyLksRVrw758JAs/w9VL4kFVVtuawF0QJONmUWJh+UNbMist7MYW4h9
 empQz2XHkr7lF8FAWA+gO+Jnp7942pie99CT7dmHDNGlegl0wjd7VhYhmAtlSURaqn
 HThZyMGPUVcvwKym2NQt8dviuYWyoGr96M8TRlRMph7s0c3KGiemmmVyR9zmax6vWE
 xoXf3nJ1dRAHRd3ndaOpOmiPJqOJJfxRkfmFkVqxCaaGxaqm/yDEwIilUyADUWcoyu
 uR7B8fBCl1v6MghLBxULfUB1erKub/VJ3504HgOlXkQV5Fz8z6T/y8S0nRrIjOq7Lh
 eZ/ZVgdVBJp8Q==
Date: Sat, 17 Aug 2024 10:48:10 +0200
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
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 5/8] mm/util: Fix possible race condition in kstrdup()
Message-ID: <w6fx3gozq73slfpge4xucpezffrdioauzvoscdw2is5xf7viea@a4doumg264s4>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-6-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fmddhafpzo3fg7cn"
Content-Disposition: inline
In-Reply-To: <20240817025624.13157-6-laoar.shao@gmail.com>
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


--fmddhafpzo3fg7cn
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
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v7 5/8] mm/util: Fix possible race condition in kstrdup()
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-6-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240817025624.13157-6-laoar.shao@gmail.com>

Hi Yafang,

On Sat, Aug 17, 2024 at 10:56:21AM GMT, Yafang Shao wrote:
> In kstrdup(), it is critical to ensure that the dest string is always
> NUL-terminated. However, potential race condidtion can occur between a
> writer and a reader.
>=20
> Consider the following scenario involving task->comm:
>=20
>     reader                    writer
>=20
>   len =3D strlen(s) + 1;
>                              strlcpy(tsk->comm, buf, sizeof(tsk->comm));
>   memcpy(buf, s, len);
>=20
> In this case, there is a race condition between the reader and the
> writer. The reader calculate the length of the string `s` based on the
> old value of task->comm. However, during the memcpy(), the string `s`
> might be updated by the writer to a new value of task->comm.
>=20
> If the new task->comm is larger than the old one, the `buf` might not be
> NUL-terminated. This can lead to undefined behavior and potential
> security vulnerabilities.
>=20
> Let's fix it by explicitly adding a NUL-terminator.
>=20
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> ---
>  mm/util.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/mm/util.c b/mm/util.c
> index 983baf2bd675..4542d8a800d9 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -62,8 +62,14 @@ char *kstrdup(const char *s, gfp_t gfp)
> =20
>  	len =3D strlen(s) + 1;
>  	buf =3D kmalloc_track_caller(len, gfp);
> -	if (buf)
> +	if (buf) {
>  		memcpy(buf, s, len);
> +		/* During memcpy(), the string might be updated to a new value,
> +		 * which could be longer than the string when strlen() is
> +		 * called. Therefore, we need to add a null termimator.
> +		 */
> +		buf[len - 1] =3D '\0';
> +	}

I would compact the above to:

	len =3D strlen(s);
	buf =3D kmalloc_track_caller(len + 1, gfp);
	if (buf)
		strcpy(mempcpy(buf, s, len), "");

It allows _FORTIFY_SOURCE to track the copy of the NUL, and also uses
less screen.  It also has less moving parts.  (You'd need to write a
mempcpy() for the kernel, but that's as easy as the following:)

	#define mempcpy(d, s, n)  (memcpy(d, s, n) + n)

In shadow utils, I did a global replacement of all buf[...] =3D '\0'; by
strcpy(..., "");.  It ends up being optimized by the compiler to the
same code (at least in the experiments I did).


Have a lovely day!
Alex

>  	return buf;
>  }
>  EXPORT_SYMBOL(kstrdup);
> --=20
> 2.43.5
>=20

--=20
<https://www.alejandro-colomar.es/>

--fmddhafpzo3fg7cn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmbAY8kACgkQnowa+77/
2zJy9w//VpNvNlz0qkO1e7GsXV2Oay7F3Mv07UYbMUQROCVAnkJ5089Gt5oQTGqt
KofcZ8qVFOpVffW33J9WD2NmbWwDHudXlWSpsC98H4YlmmbpwZQOqTnA7OoZjn5V
L8N5qXReoJTBCJ/nFO8FIu6FWYiZzb0yiIvDBdJ9wx3NvOVXaN9Id+YOU4OgzDBc
HshTJLYpyK3iVgI2PEVf9nHnsgqqJaBLNCBQwqGkjO3eJJZBrpq+YcwB7JEbSzz1
q/ETj+JDUKBTCSQKKV1vGnrfe6/lQWfLA6fc9XHzIYlrwLeJsfXqnGyqSxSLRm45
HzYZbCiHqqIrIeK7EP6F3VrRvOFhT7pWKnopvysQ9LajuM8zWzHXOQuBXr1+M46O
Uz5u/J9ZX9+ZzEmtgtSO9rIVGE4LfKd+ngF/gZCCYMobkUPet+e99uOhtIelLzD8
VviJU+xlRcLFPXMod7N/dfK6kfHxZ87K7KCetn68h2T5XDntslmoXXqed+W2Xi8p
d6woLOoIM/AeQdMlzirWDhr/fXOG+X2+7ojkEpIK0fkv2bTWs5H0iu/qcoespWtJ
ifPmabJGLvIN/8K/dDZKYNKKssIbS2ePuMpzghMbknKx3fQiB14LWaGUZ0fTzb8W
YT4Ic9hLiqgcPLVyVEjw+qa28m+qnJ4nwMXDFbu08oqn/VVa9vE=
=8JvT
-----END PGP SIGNATURE-----

--fmddhafpzo3fg7cn--
