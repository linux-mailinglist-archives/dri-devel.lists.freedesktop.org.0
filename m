Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E5B195EDD2
	for <lists+dri-devel@lfdr.de>; Mon, 26 Aug 2024 11:57:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9AE10E184;
	Mon, 26 Aug 2024 09:57:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="iBKObYzu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABCC510E166
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Aug 2024 09:57:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id BFF9BA4204F;
 Mon, 26 Aug 2024 09:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D866AC567F3;
 Mon, 26 Aug 2024 09:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724664032;
 bh=rwXP+5eSF7J7wNGs6IQQcMn0Z+ZA7RlktZ3B5d40Kzs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iBKObYzuSp3BAhGOIaeeqPeyFwX6izp/CzVO7M8RvdNK3JPks06o2TiJ+t8CcU1m3
 XC2jxvvLE+LrcQsgITEHaeINvLSs3UupG1w1zm7DJVCemGYK8PyENOjRP+4VWyK4rW
 6+96F9UQ66WtJDHBUhXDroLekZ1v9QlaDlSf7WyqIV33fYeV/H/LAj2gZ4XB5nQq9g
 0csBKvjOUBdCLOE8XGNGPoYI2Q5lXCvZd0ZkB+xpUwXtoitcg0Cap60IRO4xzF+pY2
 zKBYqCf+TuOJOF9hFXPAXseDtApOVbZA4ykbdbiPOrERygoEXm94IYMk4f1Ml1OAvd
 ou7qaxJH4vXgg==
Date: Mon, 26 Aug 2024 11:20:26 +0200
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
Message-ID: <ep44ahlsa2krmpjcqrsvoi5vfoesvnvly44icavup7dsfolewm@flnm5rl23diz>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-7-laoar.shao@gmail.com>
 <nmhexn3mkwhgu5e6o3i7gvipboisbuwdoloshf64ulgzdxr5nv@3gwujx2y5jre>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fr6yymnvpqcqqdt5"
Content-Disposition: inline
In-Reply-To: <nmhexn3mkwhgu5e6o3i7gvipboisbuwdoloshf64ulgzdxr5nv@3gwujx2y5jre>
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


--fr6yymnvpqcqqdt5
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
 <nmhexn3mkwhgu5e6o3i7gvipboisbuwdoloshf64ulgzdxr5nv@3gwujx2y5jre>
MIME-Version: 1.0
In-Reply-To: <nmhexn3mkwhgu5e6o3i7gvipboisbuwdoloshf64ulgzdxr5nv@3gwujx2y5jre>

Hi Yafang,

On Sat, Aug 17, 2024 at 10:58:02AM GMT, Alejandro Colomar wrote:
> Hi Yafang,
>=20
> On Sat, Aug 17, 2024 at 10:56:22AM GMT, Yafang Shao wrote:
> > These three functions follow the same pattern. To deduplicate the code,
> > let's introduce a common helper __kmemdup_nul().
> >=20
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Cc: Simon Horman <horms@kernel.org>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > ---
> >  mm/util.c | 67 +++++++++++++++++++++----------------------------------
> >  1 file changed, 26 insertions(+), 41 deletions(-)
> >=20
> > diff --git a/mm/util.c b/mm/util.c
> > index 4542d8a800d9..310c7735c617 100644
> > --- a/mm/util.c
> > +++ b/mm/util.c
> > @@ -45,33 +45,40 @@ void kfree_const(const void *x)
> >  EXPORT_SYMBOL(kfree_const);
> > =20
> >  /**
> > - * kstrdup - allocate space for and copy an existing string
> > - * @s: the string to duplicate
> > + * __kmemdup_nul - Create a NUL-terminated string from @s, which might=
 be unterminated.
> > + * @s: The data to copy
> > + * @len: The size of the data, including the null terminator
> >   * @gfp: the GFP mask used in the kmalloc() call when allocating memory
> >   *
> > - * Return: newly allocated copy of @s or %NULL in case of error
> > + * Return: newly allocated copy of @s with NUL-termination or %NULL in
> > + * case of error
> >   */
> > -noinline
> > -char *kstrdup(const char *s, gfp_t gfp)
> > +static __always_inline char *__kmemdup_nul(const char *s, size_t len, =
gfp_t gfp)
> >  {
> > -	size_t len;
> >  	char *buf;
> > =20
> > -	if (!s)
> > +	buf =3D kmalloc_track_caller(len, gfp);
> > +	if (!buf)
> >  		return NULL;
> > =20
> > -	len =3D strlen(s) + 1;
> > -	buf =3D kmalloc_track_caller(len, gfp);
> > -	if (buf) {
> > -		memcpy(buf, s, len);
> > -		/* During memcpy(), the string might be updated to a new value,
> > -		 * which could be longer than the string when strlen() is
> > -		 * called. Therefore, we need to add a null termimator.
> > -		 */
> > -		buf[len - 1] =3D '\0';
> > -	}
> > +	memcpy(buf, s, len);
> > +	/* Ensure the buf is always NUL-terminated, regardless of @s. */
> > +	buf[len - 1] =3D '\0';
> >  	return buf;
> >  }
> > +
> > +/**
> > + * kstrdup - allocate space for and copy an existing string
> > + * @s: the string to duplicate
> > + * @gfp: the GFP mask used in the kmalloc() call when allocating memory
> > + *
> > + * Return: newly allocated copy of @s or %NULL in case of error
> > + */
> > +noinline
> > +char *kstrdup(const char *s, gfp_t gfp)
> > +{
> > +	return s ? __kmemdup_nul(s, strlen(s) + 1, gfp) : NULL;
> > +}
> >  EXPORT_SYMBOL(kstrdup);
> > =20
> >  /**
> > @@ -106,19 +113,7 @@ EXPORT_SYMBOL(kstrdup_const);
> >   */
> >  char *kstrndup(const char *s, size_t max, gfp_t gfp)
> >  {
> > -	size_t len;
> > -	char *buf;
> > -
> > -	if (!s)
> > -		return NULL;
> > -
> > -	len =3D strnlen(s, max);
> > -	buf =3D kmalloc_track_caller(len+1, gfp);
> > -	if (buf) {
> > -		memcpy(buf, s, len);
> > -		buf[len] =3D '\0';
> > -	}
> > -	return buf;
> > +	return s ? __kmemdup_nul(s, strnlen(s, max) + 1, gfp) : NULL;
> >  }
> >  EXPORT_SYMBOL(kstrndup);
> > =20
> > @@ -192,17 +187,7 @@ EXPORT_SYMBOL(kvmemdup);
> >   */
> >  char *kmemdup_nul(const char *s, size_t len, gfp_t gfp)
> >  {
> > -	char *buf;
> > -
> > -	if (!s)
> > -		return NULL;
> > -
> > -	buf =3D kmalloc_track_caller(len + 1, gfp);
> > -	if (buf) {
> > -		memcpy(buf, s, len);
> > -		buf[len] =3D '\0';
> > -	}
> > -	return buf;
> > +	return s ? __kmemdup_nul(s, len + 1, gfp) : NULL;
> >  }
> >  EXPORT_SYMBOL(kmemdup_nul);
>=20
> I like the idea of the patch, but it's plagued with all those +1 and -1.
> I think that's due to a bad choice of value being passed by.  If you
> pass the actual length of the string (as suggested in my reply to the
> previous patch) you should end up with a cleaner set of APIs.
>=20
> The only remaining +1 is for kmalloc_track_caller(), which I ignore what
> it does.
>=20
> 	char *
> 	__kmemdup_nul(const char *s, size_t len, gfp_t gfp)
> 	{
> 		char *buf;
>=20
> 		buf =3D kmalloc_track_caller(len + 1, gfp);
> 		if (!buf)
> 			return NULL;
>=20
> 		strcpy(mempcpy(buf, s, len), "");

Changing these strcpy(, "") to the usual; =3D'\0' or =3D0, but I'd still
recommend the rest of the changes, that is, changing the value passed in
len, to remove several +1 and -1s.

What do you think?

Have a lovely day!
Alex

> 		return buf;
> 	}
>=20
> 	char *
> 	kstrdup(const char *s, gfp_t gfp)
> 	{
> 		return s ? __kmemdup_nul(s, strlen(s), gfp) : NULL;
> 	}
>=20
> 	char *
> 	kstrndup(const char *s, size_t n, gfp_t gfp)
> 	{
> 		return s ? __kmemdup_nul(s, strnlen(s, n), gfp) : NULL;
> 	}
>=20
> 	char *
> 	kmemdup_nul(const char *s, size_t len, gfp_t gfp)
> 	{
> 		return s ? __kmemdup_nul(s, len, gfp) : NULL;
> 	}
>=20
> Have a lovely day!
> Alex
>=20
> --=20
> <https://www.alejandro-colomar.es/>



--=20
<https://www.alejandro-colomar.es/>

--fr6yymnvpqcqqdt5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmbMSNoACgkQnowa+77/
2zLIExAAowwDvn4fGttE88cvxlhQwOy8jHj4erHbWDOLMcKFNLpWhwWRqOaVZyMN
dseuMqjKxp0vlIjA+QRvwtCSfMPrfGFrF+hSal8nEVG5YPp02IJFeKPVs2UIMirG
WQfz7OkEGY6BN61CHuNhXQL+WLCzEuP/jqqh6bZ5/l9elU7H+CAEGJgWMq5QeyRo
eVljlfkFRxJkdzcKPJJFc/wK95vSKXFPe5mE7UGfJx1oO3m6q3j5i2aaBFQcIjm3
QiBGQ8aXepDV7L3XLJaRPa/Tkm7Cc5fdL6B9KEN4SvxOXn7V5VDRVOlrT8Du9YQ1
G77o8rFyZ9MNFsPcZh5g6DgqQyK7RWTZLm/Xq8GjfB5/iQ8FeZ7gaLye6d52vDub
vsvIk9D/L3iWDeGTahM9+5bHe8AHr3sI9eCnKbLayJrZ0TA03KgCEKhj8Sp1kkdu
hai6+ym4Wc9aAYAGEHdJFI/8Gu93uqXT35bT270ov2E77VMyhVltprOCW6qbziTr
ebt5iKyJ6f2e/rXOCOlqP4CTLSTtRfo2padaLlAJCSEJLs4Q1YsqZMIyLbn7PYuD
MpkrWxeysR2d3KsKcb1MYCZoKqsQ+hWtkEHZWqHgygI3fbBPE5tkmCS/ustkAk1s
15ry+Az65a6wiEv5w38JrVCJnzZ/x0aPwOCDNdgYwS/amQEQP10=
=I3ve
-----END PGP SIGNATURE-----

--fr6yymnvpqcqqdt5--
