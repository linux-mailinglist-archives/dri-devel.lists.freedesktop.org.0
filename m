Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8I2dB0WZoWl8ugQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:16:53 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 781AB1B7825
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:16:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084CB10EB39;
	Fri, 27 Feb 2026 13:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="atCPtfbS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2F7610EB39
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 13:16:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id BD99760054;
 Fri, 27 Feb 2026 13:16:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA494C116C6;
 Fri, 27 Feb 2026 13:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772198207;
 bh=egCWlPm1x8iHr9PPIzoYHflwiSm/bh95WCzD6gZYC3c=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=atCPtfbSo6Zvk5tUFHE0DZyHYYrtBPlRAIDk2mxNRXEtPE0XaZAfWxmPGH2sW5M6S
 eTxLV3zr0Lw2PBwhHycBLW1jVxNqhngWqtqMsPQ18NLiQjbwwCI3UxULojF/uzWeMP
 29DUDUetMPpyNPFuJY6WE/1Cy3CdrW4wN7E197m9W5mDYZBwlSKlfiYxDXPNI5Il0F
 5YHLwWvg3D5LnI5n9/gwS03rSP9SmZ3R0NmEo54rv7Yy6GfDTWHFKfl25+7ihDwaad
 2ogx1sYQqiPPwmqMAny/6zTX+/QzVrDuZsC5Ok3sVSRq/FE+86ymrA83rm6vE87Laa
 YWi8qZBOe8nHw==
Date: Fri, 27 Feb 2026 14:16:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, 
 Sumit Semwal <sumit.semwal@linaro.org>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Brian Starkey <Brian.Starkey@arm.com>, John Stultz <jstultz@google.com>, 
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
Subject: Re: [PATCH 2/7] mm: cma: Export cma_alloc and cma_release
Message-ID: <20260227-proficient-crazy-dinosaur-d2fb0b@houat>
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <20260225-dma-buf-heaps-as-modules-v1-2-2109225a090d@kernel.org>
 <60ecebf2-a708-4797-bedd-588c3e9931ff@kernel.org>
 <20260226-impetuous-analytic-jellyfish-d4a86d@penduick>
 <CABdmKX0KZLGaJWBoo3tkCxLvby3f4Fn0nMCLyz4a-H-9J_CtPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5ak2rz3ozdmtomty"
Content-Disposition: inline
In-Reply-To: <CABdmKX0KZLGaJWBoo3tkCxLvby3f4Fn0nMCLyz4a-H-9J_CtPQ@mail.gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:tjmercier@google.com,m:david@kernel.org,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 781AB1B7825
X-Rspamd-Action: no action


--5ak2rz3ozdmtomty
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/7] mm: cma: Export cma_alloc and cma_release
MIME-Version: 1.0

On Thu, Feb 26, 2026 at 08:58:51AM -0800, T.J. Mercier wrote:
> On Thu, Feb 26, 2026 at 2:38=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > Hi David,
> >
> > On Thu, Feb 26, 2026 at 11:25:24AM +0100, David Hildenbrand (Arm) wrote:
> > > On 2/25/26 17:41, Maxime Ripard wrote:
> > > > The CMA dma-buf heap uses cma_alloc() and cma_release() to allocate=
 and
> > > > free, respectively, its CMA buffers.
> > > >
> > > > However, these functions are not exported. Since we want to turn th=
e CMA
> > > > heap into a module, let's export them both.
> > > >
> > > > Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > ---
> > > >  mm/cma.c | 2 ++
> > > >  1 file changed, 2 insertions(+)
> > > >
> > > > diff --git a/mm/cma.c b/mm/cma.c
> > > > index 94b5da468a7d719e5144d33b06bcc7619c0fbcc9..be142b473f3bd41b9c7=
d8ba4397f018f6993d962 100644
> > > > --- a/mm/cma.c
> > > > +++ b/mm/cma.c
> > > > @@ -949,10 +949,11 @@ struct page *cma_alloc(struct cma *cma, unsig=
ned long count,
> > > >     if (page)
> > > >             set_pages_refcounted(page, count);
> > > >
> > > >     return page;
> > > >  }
> > > > +EXPORT_SYMBOL_GPL(cma_alloc);
> > > >
> > > >  static struct cma_memrange *find_cma_memrange(struct cma *cma,
> > > >             const struct page *pages, unsigned long count)
> > > >  {
> > > >     struct cma_memrange *cmr =3D NULL;
> > > > @@ -1025,10 +1026,11 @@ bool cma_release(struct cma *cma, const str=
uct page *pages,
> > > >
> > > >     __cma_release_frozen(cma, cmr, pages, count);
> > > >
> > > >     return true;
> > > >  }
> > > > +EXPORT_SYMBOL_GPL(cma_release);
> > > >
> > > >  bool cma_release_frozen(struct cma *cma, const struct page *pages,
> > > >             unsigned long count)
> > > >  {
> > > >     struct cma_memrange *cmr;
> > > >
> > >
> > > I'm wondering whether we want to restrict all these exports to the
> > > dma-buf module only using EXPORT_SYMBOL_FOR_MODULES().
> >
> > TIL about EXPORT_SYMBOL_FOR_MODULES, thanks.
>=20
> Ohh, ditto.
>=20
> > > Especially dma_contiguous_default_area() (patch #4), I am not sure
> > > whether we want arbitrary modules to mess with that.
> >
> > Yeah, I wasn't too fond about that one either. Alternatively, I guess we
> > could turn dev_get_cma_area into a non-inlined function and export that
> > instead?
>=20
> I checked the history to see if dev_get_cma_area was converted to
> inline at some point for performance, but it has always been that way
> since 3.5. That'd be my only worry with un-inlining and exporting it.
> EXPORT_SYMBOL_FOR_MODULES sounds like a better way to me.

I just realised the new tegra heap is also going to use cma_alloc:
https://lore.kernel.org/dri-devel/20260122161009.3865888-7-thierry.reding@k=
ernel.org/

I exported dev_get_cma_area() like we discussed, but kept EXPORT_SYMBOL
for now in the new version.

Maxime

--5ak2rz3ozdmtomty
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaGZOAAKCRAnX84Zoj2+
dqUlAX0VyCWn5CEtDD/d5NgnlGbw9KsIwryYjK5R5t6xQFatxl8VgXaPSTMj/TUC
FboTTuYBgI3AtXRp7wzZaBm9GIM0NkjXj8o4AB9rric8F0GeL82ApZqBGuoJreEV
DfrgHnsiFg==
=HATT
-----END PGP SIGNATURE-----

--5ak2rz3ozdmtomty--
