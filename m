Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 662AB955664
	for <lists+dri-devel@lfdr.de>; Sat, 17 Aug 2024 10:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28CB68985A;
	Sat, 17 Aug 2024 08:39:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="X4qRGs68";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5AD28985A
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Aug 2024 08:39:04 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id F386360598;
 Sat, 17 Aug 2024 08:39:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30869C116B1;
 Sat, 17 Aug 2024 08:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723883943;
 bh=drcR0Ggvob9Xsaq04tuibw0a3w723D1cXfmcavnp7v8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X4qRGs68mHWdMwsIm8IcqoC0AjlA9unRAZyZItSaeap7PHizirk/hNNBeXaBbSGyi
 8TXQAjPdxFfBxyi7yYHq6mqApaR7yxkD08nUzjQj/awldhvM9VJr1i07GxDJn/8scG
 h28lmq1aJ4tliJZ6C4qTmJbhnufQdVSICkHH28rbualNjCN+dMGOAKFWA7bYRML9Dp
 zwk6+UUbpp+JiZxIrb3mn6+4/C5QLDZrwDqVugy8N3Q+dWQyhmirfyEUCVdCO3dsJH
 B0bz++Fwz+qpQzZ2Ia9SU0OIHOlNdgLk+3ah1rTJqAY9M7W4pASoQ/+TjDqoROGXH3
 JeShGAxlHtFsQ==
Date: Sat, 17 Aug 2024 10:38:58 +0200
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
 dri-devel@lists.freedesktop.org, Quentin Monnet <qmo@kernel.org>
Subject: Re: [PATCH v7 4/8] bpftool: Ensure task comm is always NUL-terminated
Message-ID: <teajtay63uw2ukcwhna7yfblnjeyrppw4zcx2dfwtdz3tapspn@rntw3luvstci>
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-5-laoar.shao@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="psoj2t3rvkbpqmnp"
Content-Disposition: inline
In-Reply-To: <20240817025624.13157-5-laoar.shao@gmail.com>
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


--psoj2t3rvkbpqmnp
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
	dri-devel@lists.freedesktop.org, Quentin Monnet <qmo@kernel.org>
Subject: Re: [PATCH v7 4/8] bpftool: Ensure task comm is always NUL-terminated
References: <20240817025624.13157-1-laoar.shao@gmail.com>
 <20240817025624.13157-5-laoar.shao@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20240817025624.13157-5-laoar.shao@gmail.com>

Hi Yafang,

On Sat, Aug 17, 2024 at 10:56:20AM GMT, Yafang Shao wrote:
> Let's explicitly ensure the destination string is NUL-terminated. This wa=
y,
> it won't be affected by changes to the source string.
>=20
> Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> Reviewed-by: Quentin Monnet <qmo@kernel.org>
> ---
>  tools/bpf/bpftool/pids.c | 2 ++
>  1 file changed, 2 insertions(+)
>=20
> diff --git a/tools/bpf/bpftool/pids.c b/tools/bpf/bpftool/pids.c
> index 9b898571b49e..23f488cf1740 100644
> --- a/tools/bpf/bpftool/pids.c
> +++ b/tools/bpf/bpftool/pids.c
> @@ -54,6 +54,7 @@ static void add_ref(struct hashmap *map, struct pid_ite=
r_entry *e)
>  		ref =3D &refs->refs[refs->ref_cnt];
>  		ref->pid =3D e->pid;
>  		memcpy(ref->comm, e->comm, sizeof(ref->comm));
> +		ref->comm[sizeof(ref->comm) - 1] =3D '\0';

Why doesn't this use strscpy()?  Isn't the source terminated?

Both the source and the destination measure 16 characters.  If it is
true that the source is not terminated, then this copy might truncate
the (non-)string by overwriting the last byte with a NUL.  Is that
truncation a good thing?

>  		refs->ref_cnt++;
> =20
>  		return;
> @@ -77,6 +78,7 @@ static void add_ref(struct hashmap *map, struct pid_ite=
r_entry *e)
>  	ref =3D &refs->refs[0];
>  	ref->pid =3D e->pid;
>  	memcpy(ref->comm, e->comm, sizeof(ref->comm));
> +	ref->comm[sizeof(ref->comm) - 1] =3D '\0';

Same question here.

>  	refs->ref_cnt =3D 1;
>  	refs->has_bpf_cookie =3D e->has_bpf_cookie;
>  	refs->bpf_cookie =3D e->bpf_cookie;
> --=20
> 2.43.5
>=20

--=20
<https://www.alejandro-colomar.es/>

--psoj2t3rvkbpqmnp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmbAYZwACgkQnowa+77/
2zKmIA/9Gqjb53CpMspqZM8sUUCdmGhqPv1cYcL2EDkg7W9lkRgn0GLudREK/roq
y4QBmGljgAhm3UbecLPiKvAPtiYmGoOmndrjJ4mq8E6lSqkMjHoaiMZ2EEPI7u+p
xPTHJklCQHIAndCjVjC7A4cIx2RZuBtx6Xg/JMgO7i/s0jtb2SqiQtXEEIHjuUd5
q0YybNl407qq/IRSt72qEL+rKEBVdcZppyDfoxPVKEZYOgbmhYpyyViq6Rli9HhU
loprXpAdwiumkNZQHJ7It8nXlC5/J3VDuazDN193PNRprMfzC5TjBpWezf+KY7Wn
Vx5tAC4H6ZTNdhD5a+NwfaApt9xqOcRVaYe2E1m1dMfIgojmUvJYd4zcRZBYRE5M
uhQxkrRLueuJoKeqVcIlbPRTafIUd6lev0ccKam+Ao9J5Nt4TmqAUMyYIOymQ90B
ldUgSSiofzyioNhrKNS1mLBCOVjTKClEBH+rbjKfO7KLf6Qo2dtvLoOCC5f7YZvy
k9GsCv9jGEF64bGdcK82pM+LjftAWuTbO3Uwlw7qUNDKJb7OWjQS5BtejgQpiOh6
RB4z4wZkDZ/Skwke7F16AsEeMugdcRyD1Wyl4paqcw8sXhc1AquvuymC6OPV5u8z
GZt0uJeVRKbg7CVQEny1jGFO8BiPLK6JzTHLRV3KRlTKCGc5vEY=
=fb44
-----END PGP SIGNATURE-----

--psoj2t3rvkbpqmnp--
