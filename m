Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EC7eARxWpWnR9AUAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:19:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF0521D56DE
	for <lists+dri-devel@lfdr.de>; Mon, 02 Mar 2026 10:19:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09AA310E1C5;
	Mon,  2 Mar 2026 09:19:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Jy20L4Id";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AC3A10E1C5
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Mar 2026 09:19:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 0D58443220;
 Mon,  2 Mar 2026 09:19:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F036C19423;
 Mon,  2 Mar 2026 09:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772443159;
 bh=TaaPRzIzsiJYCDrLVRH+cpv6R+qksPRRJnPucWJCJnY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Jy20L4IdLKDTKoVZQQplQ52NEMl1acstjLIcsyA3F/3VBPZyXDttoIxL7TC7C3Y15
 LweIa9LyHH5q6gmi5/iRz2CC7fN1udYPQ2OiopniwlmgyNilUn1QCMSmXAA3ccbXP6
 lYbf1HjVAKSY5skXVBd2hIYCLZakSEZ8Z98i08TyYdKTDLrSYLOcWwPFUCSueJrh9M
 w1vKDzKQfBn3fQZV4WHHsA29DaNZGgH1yHACqbLunffygCzcVFlm0fuGorhxSYtezw
 DFlln5IO18wQ694ztJi0IbbdJJZMlZd/lsPfOmWBaBtOW+S+FBLm/vkSRIITObml5Z
 dMQNK4sJwV4AA==
Date: Mon, 2 Mar 2026 10:19:17 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Robin Murphy <robin.murphy@arm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v2 6/9] mm: cma: Export cma_get_name
Message-ID: <20260302-unbiased-chinchilla-of-honor-0df03d@houat>
References: <20260227-dma-buf-heaps-as-modules-v2-0-454aee7e06cc@kernel.org>
 <20260227-dma-buf-heaps-as-modules-v2-6-454aee7e06cc@kernel.org>
 <ca2ada49-08cf-43e6-a857-85994374549d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="b3uwsakrtltovl2y"
Content-Disposition: inline
In-Reply-To: <ca2ada49-08cf-43e6-a857-85994374549d@kernel.org>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.91 / 15.00];
	SIGNED_PGP(-2.00)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[22];
	RCVD_TLS_LAST(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:david@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: AF0521D56DE
X-Rspamd-Action: no action


--b3uwsakrtltovl2y
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 6/9] mm: cma: Export cma_get_name
MIME-Version: 1.0

Hi,

On Fri, Feb 27, 2026 at 09:43:12PM +0100, David Hildenbrand (Arm) wrote:
> On 2/27/26 14:15, Maxime Ripard wrote:
> > The CMA dma-buf heap uses the cma_get_name() function to get the name of
> > the heap instance it's going to create.
> >=20
> > However, this function is not exported. Since we want to turn the CMA
> > heap into a module, let's export it.
> >=20
> > Reviewed-by: T.J. Mercier <tjmercier@google.com>
> > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > ---
> >  mm/cma.c | 1 +
> >  1 file changed, 1 insertion(+)
> >=20
> > diff --git a/mm/cma.c b/mm/cma.c
> > index be142b473f3bd41b9c7d8ba4397f018f6993d962..550effb9c4e01cc488b5744=
fe61d55a5b70a6d6c 100644
> > --- a/mm/cma.c
> > +++ b/mm/cma.c
> > @@ -50,10 +50,11 @@ unsigned long cma_get_size(const struct cma *cma)
> > =20
> >  const char *cma_get_name(const struct cma *cma)
> >  {
> >  	return cma->name;
> >  }
> > +EXPORT_SYMBOL_GPL(cma_get_name);
>=20
> No real reason to not squash this patch into #5, right?

I was assuming it was not really the same "category" of the API than
alloc/free, so the reviews might not be the same (like they weren't for
dma_contiguous_default_area). But I guess it also makes sense to squash
both.

I'll update the series

Thanks!

--b3uwsakrtltovl2y
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaVWFAAKCRAnX84Zoj2+
dlFeAYDD9X9Vv/iM+aCL1lvTjD+K8ui/7OeGWlPDYDEF5o8UD5uVMHs3IY6BHmA1
KoFaDiABgJ1s+qzY07V4RNSom5YMw3yvdtgLOkUoHeCUwOCbz2vqhwSWpT/dAmyd
6eWOH1SckQ==
=KM0Q
-----END PGP SIGNATURE-----

--b3uwsakrtltovl2y--
