Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE117B9D5A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 15:34:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9FB210E402;
	Thu,  5 Oct 2023 13:34:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from vulcan.natalenko.name (vulcan.natalenko.name
 [IPv6:2001:19f0:6c00:8846:5400:ff:fe0c:dfa0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1696410E402
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 13:34:54 +0000 (UTC)
Received: from spock.localnet (unknown [94.142.239.106])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by vulcan.natalenko.name (Postfix) with ESMTPSA id A4062152ED08;
 Thu,  5 Oct 2023 15:34:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natalenko.name;
 s=dkim-20170712; t=1696512891;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G7OmVnDV4XM8M5IsSqI8Ix0o10uDr9wvy0myjlHH3sQ=;
 b=havpDLvC8JWRtLhfFGMQj/UvPRh0H2e6jJMdt1Zz4hkVWvrV2SqusX3rt4TpbPHVlY9OAh
 8ANmKHrpFZ4FGDEDT1mIdcmdLwWnsS66V2HQv44D0pdkjD+Iqc+i7OmshCMHTNSVrwekOE
 shIQriGGfhLeu/kTmHZVG6NVUU7SE4A=
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Matthew Wilcox <willy@infradead.org>
Subject: Re: [REGRESSION] BUG: KFENCE: memory corruption in
 drm_gem_put_pages+0x186/0x250
Date: Thu, 05 Oct 2023 15:34:41 +0200
Message-ID: <9175204.CDJkKcVGEf@natalenko.name>
In-Reply-To: <ZR60lylMtLO6ZGp7@casper.infradead.org>
References: <13360591.uLZWGnKmhe@natalenko.name>
 <22037450.EfDdHjke4D@natalenko.name>
 <ZR60lylMtLO6ZGp7@casper.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart3187816.5fSG56mABF";
 micalg="pgp-sha256"; protocol="application/pgp-signature"
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
Cc: Linux Regressions <regressions@lists.linux.dev>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sumit Semwal <sumit.semwal@linaro.org>, linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Bagas Sanjaya <bagasdotme@gmail.com>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--nextPart3187816.5fSG56mABF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Oleksandr Natalenko <oleksandr@natalenko.name>
To: Matthew Wilcox <willy@infradead.org>
Date: Thu, 05 Oct 2023 15:34:41 +0200
Message-ID: <9175204.CDJkKcVGEf@natalenko.name>
In-Reply-To: <ZR60lylMtLO6ZGp7@casper.infradead.org>
MIME-Version: 1.0

On =C4=8Dtvrtek 5. =C5=99=C3=ADjna 2023 15:05:27 CEST Matthew Wilcox wrote:
> On Thu, Oct 05, 2023 at 02:30:55PM +0200, Oleksandr Natalenko wrote:
> > No-no, sorry for possible confusion. Let me explain again:
> >=20
> > 1. we had an issue with i915, which was introduced by 0b62af28f249, and=
 later was fixed by 863a8eb3f270
> > 2. now I've discovered another issue, which looks very similar to 1., b=
ut in a VM with Cirrus VGA, and it happens even while having 863a8eb3f270 a=
pplied
> > 3. I've tried reverting 3291e09a4638, after which I cannot reproduce th=
e issue with Cirrus VGA, but clearly there was no fix for it discussed
> >=20
> > IOW, 863a8eb3f270 is the fix for 0b62af28f249, but not for 3291e09a4638=
=2E It looks like 3291e09a4638 requires a separate fix.
>=20
> Thank you!  Sorry about the misunderstanding.  Try this:
>=20
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 6129b89bb366..44a948b80ee1 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -540,7 +540,7 @@ struct page **drm_gem_get_pages(struct drm_gem_object=
 *obj)
>  	struct page **pages;
>  	struct folio *folio;
>  	struct folio_batch fbatch;
> -	int i, j, npages;
> +	long i, j, npages;
> =20
>  	if (WARN_ON(!obj->filp))
>  		return ERR_PTR(-EINVAL);
> @@ -564,11 +564,13 @@ struct page **drm_gem_get_pages(struct drm_gem_obje=
ct *obj)
> =20
>  	i =3D 0;
>  	while (i < npages) {
> +		long nr;
>  		folio =3D shmem_read_folio_gfp(mapping, i,
>  				mapping_gfp_mask(mapping));
>  		if (IS_ERR(folio))
>  			goto fail;
> -		for (j =3D 0; j < folio_nr_pages(folio); j++, i++)
> +		nr =3D min(npages - i, folio_nr_pages(folio));
> +		for (j =3D 0; j < nr; j++, i++)
>  			pages[i] =3D folio_file_page(folio, i);
> =20
>  		/* Make sure shmem keeps __GFP_DMA32 allocated pages in the

No issues after five reboots with this patch applied on top of v6.5.5.

Reported-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Tested-by: Oleksandr Natalenko <oleksandr@natalenko.name>
Link: https://lore.kernel.org/lkml/13360591.uLZWGnKmhe@natalenko.name/
=46ixes: 3291e09a4638 ("drm: convert drm_gem_put_pages() to use a folio_bat=
ch")
Cc: stable@vger.kernel.org # 6.5.x

Thank you!

=2D-=20
Oleksandr Natalenko (post-factum)
--nextPart3187816.5fSG56mABF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEZUOOw5ESFLHZZtOKil/iNcg8M0sFAmUeu3EACgkQil/iNcg8
M0ukOxAAp/BVEyQy2PylnOYA9bNDAnOlxHaslswKSerCTxALAYhIo/Fs7a1/eOIf
OosjDaawXSueUi47gxloa/ZdEi5RUtYZTBB8L2FK7QX9CdKwwHIWLfkMzW0AuIiY
CVeP6MMsulrSD0Uu0IwaifAwP9G0AL9EE/a3dRbh29AJhqwmUmzHtxuqsJkg8/+e
K3O7HedfPZg7bBHdyoNcpjDGdXQE/sZiCW8mSYJgM9kvoXEOsaB52TxGoiooF6Ti
ETsLn2AQBabbt/XcTNMcLLf6hL56mmd7xA4LpGqkqftjTBVl9SjLKzrHu0fY4pMb
eff23+Z1uRoHeEiSMpy75/JDN2emeYR5dsvpcFK/DcT4A3VLl9YyJ6iB9LBtLthk
lMz1ftAOhBrULfLGMJQhub0PDxcRPuEgpwyu3IBqwuNAf9mlGH/SDMg/7Q7mX1Oe
nVyhqhq9YHHe5ZgTkV8lTCMOPLwQAAIk2aRDmZQAhnhNtPpCaP6/FG6d9++y1hY/
WglEFusswiz2sjm86xWHnvaX1TB7+eMf7yh8rhYjcVxR86QFDoGnVkdXFap6Hp7c
uPQ/EoUocvVxfIqYBQlWf2Lrg4BGszBG1LDxie6bLQKoQWilFN3Z1CO/vWOfvfx+
LJCyyZBPa6+M7ADFb1VLjQ/+sE9jimijlPcpm7degwY1X1+Ifck=
=7qWv
-----END PGP SIGNATURE-----

--nextPart3187816.5fSG56mABF--



