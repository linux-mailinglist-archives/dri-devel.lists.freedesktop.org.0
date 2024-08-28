Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44686962500
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 12:33:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCD9910E106;
	Wed, 28 Aug 2024 10:33:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ZfAUOrA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F28E10E170
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 10:33:37 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id ECBB4A4335C;
 Wed, 28 Aug 2024 10:33:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC6B1C98EC0;
 Wed, 28 Aug 2024 10:33:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1724841216;
 bh=cPZgE31BSHwwP95dmqEz0ZNgyoyAIhKJPLIMk9rRdfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZfAUOrA4+4PzUIlLfwx0pZzjjMSWEwQzTUICw7S+nyRjSvVasQjwzTTKkWt5+VGUU
 snpNxm8aDorQtx2+eoDhq5hjE7V2fmP1Y4yVZkDZ7Az3sQBzwKR4QqC3jX+LM9X3Rp
 byiEdTEwUHqvU3eO792QkR3MI00yEyYXKsmZK2FPPX6nutKv/IgkOujyyNDE47XTjG
 3GcB+TQpnQVHPf6o7tRjIEnqzPMK7Yvci5uJeqREZ9I18yHVzTq7HrZ62RMHkAYsd+
 TPAVJgCyAb24sCuJGpMQUAIqQAVLxRiEHdDtD5g/WI34U22SQM0IrmtRGgQM3jEOj+
 izlByCP+HD/Tw==
Date: Wed, 28 Aug 2024 12:33:30 +0200
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
Message-ID: <bbdhr62fk7jts6b4wok6hpbjtoiyzofbithwlq7kl5dkabn3bz@3lf47k4xrmhc>
References: <20240828030321.20688-1-laoar.shao@gmail.com>
 <20240828030321.20688-7-laoar.shao@gmail.com>
 <byi4tx6l2lrbs5w6oxypr44ldntlh4kp56vnsza3iuztwb37oa@2qtdx2kgz4bq>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xaakvknay6p4srmg"
Content-Disposition: inline
In-Reply-To: <byi4tx6l2lrbs5w6oxypr44ldntlh4kp56vnsza3iuztwb37oa@2qtdx2kgz4bq>
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


--xaakvknay6p4srmg
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
 <byi4tx6l2lrbs5w6oxypr44ldntlh4kp56vnsza3iuztwb37oa@2qtdx2kgz4bq>
MIME-Version: 1.0
In-Reply-To: <byi4tx6l2lrbs5w6oxypr44ldntlh4kp56vnsza3iuztwb37oa@2qtdx2kgz4bq>

On Wed, Aug 28, 2024 at 12:32:53PM GMT, Alejandro Colomar wrote:
> On Wed, Aug 28, 2024 at 11:03:19AM GMT, Yafang Shao wrote:
> > These three functions follow the same pattern. To deduplicate the code,
> > let's introduce a common helper __kmemdup_nul().
> >=20
> > Suggested-by: Andrew Morton <akpm@linux-foundation.org>
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Cc: Simon Horman <horms@kernel.org>
> > Cc: Matthew Wilcox <willy@infradead.org>
> > Cc: Alejandro Colomar <alx@kernel.org>
> > ---
>=20
> Reviewed-by: Alejandro Colomar <alx@kernel.org>

(Or maybe I should say

Co-developed-by: Alejandro Colomar <alx@kernel.org>
Signed-off-by: Alejandro Colomar <alx@kernel.org>

)


>=20
> Cheers,
> Alex
>=20
> >  mm/util.c | 68 ++++++++++++++++++++++---------------------------------
> >  1 file changed, 27 insertions(+), 41 deletions(-)
> >=20
> > diff --git a/mm/util.c b/mm/util.c
> > index 9a77a347c385..42714fe13e24 100644
> > --- a/mm/util.c
> > +++ b/mm/util.c
> > @@ -45,33 +45,41 @@ void kfree_const(const void *x)
> >  EXPORT_SYMBOL(kfree_const);
> > =20
> >  /**
> > - * kstrdup - allocate space for and copy an existing string
> > - * @s: the string to duplicate
> > + * __kmemdup_nul - Create a NUL-terminated string from @s, which might=
 be unterminated.
> > + * @s: The data to copy
> > + * @len: The size of the data, not including the NUL terminator
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
> > +	/* '+1' for the NUL terminator */
> > +	buf =3D kmalloc_track_caller(len + 1, gfp);
> > +	if (!buf)
> >  		return NULL;
> > =20
> > -	len =3D strlen(s) + 1;
> > -	buf =3D kmalloc_track_caller(len, gfp);
> > -	if (buf) {
> > -		memcpy(buf, s, len);
> > -		/* During memcpy(), the string might be updated to a new value,
> > -		 * which could be longer than the string when strlen() is
> > -		 * called. Therefore, we need to add a NUL termimator.
> > -		 */
> > -		buf[len - 1] =3D '\0';
> > -	}
> > +	memcpy(buf, s, len);
> > +	/* Ensure the buf is always NUL-terminated, regardless of @s. */
> > +	buf[len] =3D '\0';
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
> > +	return s ? __kmemdup_nul(s, strlen(s), gfp) : NULL;
> > +}
> >  EXPORT_SYMBOL(kstrdup);
> > =20
> >  /**
> > @@ -106,19 +114,7 @@ EXPORT_SYMBOL(kstrdup_const);
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
> > +	return s ? __kmemdup_nul(s, strnlen(s, max), gfp) : NULL;
> >  }
> >  EXPORT_SYMBOL(kstrndup);
> > =20
> > @@ -192,17 +188,7 @@ EXPORT_SYMBOL(kvmemdup);
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
> > +	return s ? __kmemdup_nul(s, len, gfp) : NULL;
> >  }
> >  EXPORT_SYMBOL(kmemdup_nul);
> > =20
> > --=20
> > 2.43.5
> >=20
>=20
> --=20
> <https://www.alejandro-colomar.es/>



--=20
<https://www.alejandro-colomar.es/>

--xaakvknay6p4srmg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmbO/PoACgkQnowa+77/
2zLPnw/6A+aBCutQmKak+5R0meV1Cxil2Ncoh02Vf0xc2uWghVz4ES9qrmIq3vsF
s+1JFTqZm983+114HxnK1NGfs30MiLs9PSiFvqtK77V4LW4I6V+eSKfjCywWH3ep
s+0O51nVwX4a6ys2pW6q1Jb1JNPSjZovOQi1OVe+TWTtpHJSdqvsiYoLyEK9b41L
f0wj/lJ4R7XhNBo/9WqpOW73pOub4Lx+RQThi87449z+mpiaKsaFZIZSlLv0nEvH
9VNnxKYmTQOzE7kHiEUoVSL7sC0DTU+FIsw1nF7an9UmEpTcvCHmEKQHpPerKs1T
EoGHKtPiLY3U23B5fw4zxheJaIAQCDFM73XwYGhtluwQToyS4nswC2sjYJXB0Tyy
8SrkG+Lubl3mMRHY/WlBBkBumKo9GYRbIiuVU2N/Xsn0AdNViOy7mQTGdeGmh9qz
l0pU6qnyso0Bdeaum22hOW/SgHwU1zvy8LVZwYkaWjMpDkuJKM2W5rvA1MGnHisR
DkXA953cx17eO33YRMFpuRthuA7X2/qNmEj3d6elhUP3x9ea9YLRl1PC9j0jIgRA
PiZXrJuFNeQpp27Qz6k4PxWbBmPjzZyleFwGtvZ86qbaRzFWZo2gCQZrrPckac2X
6fs3M2nM+8tZ6ZaqFeEb+kMnIRB3fZo7I59kFr6OEmgHSZsWCGM=
=+lO+
-----END PGP SIGNATURE-----

--xaakvknay6p4srmg--
