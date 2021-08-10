Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EF113E56CD
	for <lists+dri-devel@lfdr.de>; Tue, 10 Aug 2021 11:26:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D998898E8;
	Tue, 10 Aug 2021 09:26:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ozlabs.org (bilbo.ozlabs.org [IPv6:2401:3900:2:1::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0356A898E8
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Aug 2021 09:26:42 +0000 (UTC)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4GkSJG0sQKz9sT6;
 Tue, 10 Aug 2021 19:26:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
 s=201702; t=1628587598;
 bh=ujxBT6JOzhQsnjHTTGJrV5DnVKi8jPWIZ+grZbTmO34=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=YDXp3moxuPwwVAV440zscERSPPjtkIRQ6ltbaBAUp9iU6rtb3raxDt2JUaFiGKiIm
 DPqgooaOlGBh61fThk8btufWzy4wxkwZfxobVitddkbHwRTfDylg/6mcrqTRLbK110
 DlK0klQ9Yz5h/2EOcvy2vjeu/sxQLk3/e5W3hDqQKzkqNAq1ktQcB+3AjFQ+VP6SkC
 me3ujyeyIwHdoz+6ZgGWfOK6bxmRVWLdt2ilVMwjzxcqfY5gMXG0LQC08sEFMNhDJh
 r2wm2FfW0NCF6nysJWV3Vr8gEz/X3MEcrkHXMtGetHUkZPQiFkdLkXmtmccCmaWVlp
 YRvzD1Aeu456w==
Date: Tue, 10 Aug 2021 19:26:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
To: Dave Airlie <airlied@linux.ie>, DRI <dri-devel@lists.freedesktop.org>
Cc: Matthew Auld <matthew.auld@intel.com>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, Linux Next Mailing List
 <linux-next@vger.kernel.org>
Subject: Re: linux-next: build warnings after merge of the drm tree
Message-ID: <20210810192636.625220ae@canb.auug.org.au>
In-Reply-To: <20210708122048.534c1c4d@canb.auug.org.au>
References: <20210603193242.1ce99344@canb.auug.org.au>
 <20210708122048.534c1c4d@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/PdFYQG0PzTCvSx0s5gcPuCo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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

--Sig_/PdFYQG0PzTCvSx0s5gcPuCo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi all,

On Thu, 8 Jul 2021 12:20:48 +1000 Stephen Rothwell <sfr@canb.auug.org.au> w=
rote:
>
> On Thu, 3 Jun 2021 19:32:42 +1000 Stephen Rothwell <sfr@canb.auug.org.au>=
 wrote:
> >
> > After merging the drm tree, today's linux-next build (htmldocs) produced
> > these warnings:
> >=20
> > Documentation/gpu/driver-uapi.rst:2412: WARNING: Duplicate C declaratio=
n, also defined at gpu/rfc/i915_gem_lmem:1393.
> > Declaration is '.. c:enum:: drm_i915_gem_memory_class'.
> > Documentation/gpu/driver-uapi.rst:2484: WARNING: Duplicate C declaratio=
n, also defined at gpu/rfc/i915_gem_lmem:2484.
> > Declaration is '.. c:struct:: drm_i915_gem_memory_class_instance'.
> > Documentation/gpu/driver-uapi.rst:7: WARNING: Duplicate C declaration, =
also defined at gpu/rfc/i915_gem_lmem:7.
> > Declaration is '.. c:struct:: drm_i915_memory_region_info'.
> > Documentation/gpu/driver-uapi.rst:2531: WARNING: Duplicate C declaratio=
n, also defined at gpu/rfc/i915_gem_lmem:2531.
> > Declaration is '.. c:struct:: drm_i915_query_memory_regions'.
> > Documentation/gpu/driver-uapi.rst:2595: WARNING: Duplicate C declaratio=
n, also defined at gpu/rfc/i915_gem_lmem:1393.
> > Declaration is '.. c:struct:: drm_i915_gem_create_ext'.
> > Documentation/gpu/driver-uapi.rst:2615: WARNING: Duplicate C declaratio=
n, also defined at gpu/rfc/i915_gem_lmem:1393.
> > Declaration is '.. c:struct:: drm_i915_gem_create_ext_memory_regions'.
> >=20
> > Introduced by (one or more of) commits
> >=20
> >   0c1a77cbdafb ("drm/doc: add section for driver uAPI")
> >   2bc9c04ea702 ("drm/doc/rfc: i915 DG1 uAPI")
> >   727ecd99a4c9 ("drm/doc/rfc: drop the i915_gem_lmem.h header") =20
>=20
> I am still getting these warning.

Still getting them ...

--=20
Cheers,
Stephen Rothwell

--Sig_/PdFYQG0PzTCvSx0s5gcPuCo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmESRkwACgkQAVBC80lX
0Gwu0Qf7BXVjF6CjiHSUhDtdaw/dtje+vQ8f84zqbdnWnbZHD7nOhIY/KfRmrYBe
PbzQpbbdTfyJA8a9af8K4HK7SOhnjQa4kabi4RtfQGhRip9Hgb+9Y2yGH4yzddFI
YnunPgO5yPm+PY/nLJZXNBZoJ6S0/yxxkcT9Q8BQD08JzzKSHKMBwbWv5R52sh88
UCWzU297m4gD+eGdIZKvWY80xG6z+MWZZLvvZ2FU66MRxtLyuOImrvVGJ8bQoGWo
5QZTtJ+SjJf/NUKlxZ0ZY3pXr8S7jSvssHiOQP85UrrHdcMUxa2AmK0I+sIaCeNZ
oZCU81MNFfsxvrJMZCSo+h7lKrh87A==
=Q0bJ
-----END PGP SIGNATURE-----

--Sig_/PdFYQG0PzTCvSx0s5gcPuCo--
