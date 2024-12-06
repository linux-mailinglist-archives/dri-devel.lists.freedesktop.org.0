Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB289E7362
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 16:19:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E6810F119;
	Fri,  6 Dec 2024 15:19:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="M5ovCuwD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF03110F119
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 15:19:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id AC006A40D77;
 Fri,  6 Dec 2024 15:17:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9DD6C4CED1;
 Fri,  6 Dec 2024 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733498382;
 bh=tWa/kd1g8R9U1xlANmTOF6uWWfIC79tBpVhB31M6msk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M5ovCuwD9zxxwuFMPjqNjqGylbWLBkgHw22DqLRJI1D/6aNpjl9gbBz6WZIgutTws
 Y20QN7uhtR/dhS143C4YPDAfDHgS4cdZoY/MnAclPmmDMutQOib7o3QKmB79i8j3XS
 92VPYJa6O61cVYhXzRDphkri3AVpNyh/VkNziRsKf8BToJ5Gm8gIl1mBpZRKmfuD57
 nzmbO33GLUrJtuDnyaB8B8KVpVCeOhOj/G/h9qrnecowYBNlJG2CJrlWw07NIFL6ZX
 bpiwe3N+mfuaqCNvDcTDtUHwufsOi8xDcZ0L8LUC4Gd04RYMwBokgENP5JZV5bJ94x
 z8QgJUUAWbAtA==
Date: Fri, 6 Dec 2024 16:19:37 +0100
From: Alejandro Colomar <alx@kernel.org>
To: Ian Rogers <irogers@google.com>
Cc: "G . Branden Robinson" <g.branden.robinson@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-man@vger.kernel.org
Subject: Re: [PATCH v5 2/4] proc_pid_fdinfo.5: Make pid clearer in the name
 and 1st paragraph
Message-ID: <20241206151937.ldkoo63cvmzvazqz@devuan>
References: <20241206073828.1119464-1-irogers@google.com>
 <20241206073828.1119464-2-irogers@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="b4d72dguxr3z7zmi"
Content-Disposition: inline
In-Reply-To: <20241206073828.1119464-2-irogers@google.com>
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


--b4d72dguxr3z7zmi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 2/4] proc_pid_fdinfo.5: Make pid clearer in the name
 and 1st paragraph
MIME-Version: 1.0

Hi Ian,

On Thu, Dec 05, 2024 at 11:38:26PM -0800, Ian Rogers wrote:
> Previously the pid was highlighted through being a tagged paragraph
> but not mentioned in the description. Add italics to the path
> emphasizing pid and then change the first sentence to include pid in
> the definition.
>=20
> Suggested-by: G. Branden Robinson <g.branden.robinson@gmail.com>

I'm going to reject this patch at the moment.  But I'd like to revisit
this patch in the future, so please resend (rebased) in half a year or
so (ideally after the release of groff-1.24.0).

Cheers,
Alex

> ---
> v5. Switch .IR pid to .I pid
> ---
>  man/man5/proc_pid_fdinfo.5 | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
>=20
> diff --git a/man/man5/proc_pid_fdinfo.5 b/man/man5/proc_pid_fdinfo.5
> index 1c6c38423..2797ae216 100644
> --- a/man/man5/proc_pid_fdinfo.5
> +++ b/man/man5/proc_pid_fdinfo.5
> @@ -6,10 +6,11 @@
>  .\"
>  .TH proc_pid_fdinfo 5 (date) "Linux man-pages (unreleased)"
>  .SH NAME
> -/proc/pid/fdinfo/ \- information about file descriptors
> +.IR /proc/ pid /fdinfo " \- information about file descriptors"
>  .SH DESCRIPTION
> -This is a subdirectory containing one entry for each file which the
> -process has open, named by its file descriptor.
> +This subdirectory contains one entry for each file that process
> +.I pid
> +has open, named by its file descriptor.
>  The files in this directory are readable only by the owner of the proces=
s.
>  The contents of each file can be read to obtain information
>  about the corresponding file descriptor.
> --=20
> 2.47.0.338.g60cca15819-goog
>=20

--=20
<https://www.alejandro-colomar.es/>

--b4d72dguxr3z7zmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6jqH8KTroDDkXfJAnowa+77/2zIFAmdTFgkACgkQnowa+77/
2zLXqxAAj+O/2Y80Jxmrmn4TG7imfywudiyLNF4kvcWGDbk2YC8lIQ19YN+Rc46w
ujn+AJmGUVYagd+fMljcD8RRoeVuMx7AyRe9E+TSdfLmpcp+iwFQ9tN9ftUx/oSs
+CQoRp0ZmQ5kKGXqam9zIc0sTCj/kQ8DVvn8m0dsy8oI6EbcEwlwxDREVA1X6lrP
cuxu78+elEizLRqogaiC5i/Qyv0P5CUbWjweWj1XMcZpa5aCtzYIyq6cgaafAZm+
4FQ5nSkqYfFEWIb5VdVe2Xb8bfpKt/LjTATPPvBGTan8Z0WdO1+lWz8kOXD0Zr4+
FJVHsxO9dUqxZlDTa7We7fE+S+2LE1/w08hmO4pZqudShni6tC4i2qCJAAXfo2oE
uirtwZEOOP7eUA8PBPRh0FQCIrdWVrxMZo8zLHBcL3ObPqd0cJfL21aQBNuG9sUU
PMHWiU1H5hsIzDPOTNKmvOqt1hbmWXeE+iZRnSkLzfio5X4qaa3+U7coe535RXTR
7AQr9noDr8tOUZG3O2YV06BB9ckIsEQXmCu/pUZkG5Rtcw64KwQi9G+Lo9jKF395
AfDXFoZ8YonxoKuBFRWC0wEU6n1aBfng19iximBm4u6CEeezCzqWXDZJwO8OBNtp
kUug8OlvHt1tfCEcIqjZrEvKaDJ4S0YnnEqRGfxQvkzg412fpQc=
=0Xzr
-----END PGP SIGNATURE-----

--b4d72dguxr3z7zmi--
