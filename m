Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2LKxIugdoGmzfgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:18:16 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFEB1A421A
	for <lists+dri-devel@lfdr.de>; Thu, 26 Feb 2026 11:18:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B718410E8BD;
	Thu, 26 Feb 2026 10:18:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YA05vn+G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3349F10E8BD
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Feb 2026 10:18:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 54F0F60097;
 Thu, 26 Feb 2026 10:18:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 653B0C19423;
 Thu, 26 Feb 2026 10:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772101092;
 bh=tJEgWGAKGq9f+lDM1K325bKAQQGVyuPowxRSNNeauh8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YA05vn+GecAOHOV0bBkerBcyLQZtuSeUa6UQ7vgNRSwpIOnk1+Xg6+oT0x9IHtTrl
 onYSZPAZMTe0F6nGswJKHdgRDg7XQpXjYPnevq2aP5CjzYYkfR/90mmCWiRXuQKXgO
 +H6Xg/Rhq5agCeF2gZr/HUOYNb17ra9+vda9r0ixBAHkwbHtqrU3kZA80oQM3Md0VV
 3oG+afWszq4v8KgLw8YU0gigEQkK/ASy2JB3YMNHuc2rU2TRc0G1OCIOlc/+VT9/An
 WWug7j7lR9Tts668IPaefBI8ZdIfDjIeHH8rA4GmNx2mGPbyBeq/94vk28A4Nl//XZ
 CkRcRNPs8Ilvw==
Date: Thu, 26 Feb 2026 11:18:08 +0100
From: Maxime Ripard <mripard@kernel.org>
To: John Stultz <jstultz@google.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 "T.J. Mercier" <tjmercier@google.com>,
 Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 linux-media@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
Message-ID: <20260226-adaptable-vermilion-nautilus-0aa6f0@penduick>
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="sxksscuwilvy7rfq"
Content-Disposition: inline
In-Reply-To: <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com>
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
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:jstultz@google.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[mripard@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: ECFEB1A421A
X-Rspamd-Action: no action


--sxksscuwilvy7rfq
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
MIME-Version: 1.0

Hi John,

Thanks for the review

On Wed, Feb 25, 2026 at 10:51:30AM -0800, John Stultz wrote:
> On Wed, Feb 25, 2026 at 8:42=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > The recent introduction of heaps in the optee driver [1] made possible
> > the creation of heaps as modules.
> >
> > It's generally a good idea if possible, including for the already
> > existing system and CMA heaps.
> >
> > The system one is pretty trivial, the CMA one is a bit more involved,
> > especially since we have a call from kernel/dma/contiguous.c to the CMA
> > heap code. This was solved by turning the logic around and making the
> > CMA heap call into the contiguous DMA code.
> >
>=20
> So heaps-as-modules is common in the Android kernels, and was
> attempted to be upstreamed long ago:
>   https://lore.kernel.org/lkml/20191025234834.28214-1-john.stultz@linaro.=
org/
>=20
> And it got a fairly chilly reception, but maybe having the additional
> optee heap (as well as other proposed heaps) might sway folks on this
> now.

I didn't know that Android was using heap as modules only, but I'd say
that it's even more of a reason to upstream it then.

> There is also the kref bits you might need (which Android still carries):
>   https://lore.kernel.org/lkml/20200725032633.125006-1-john.stultz@linaro=
=2Eorg/

I'm curious about this one though. It looks like you add refcounting,
but never really get the references anywhere. What was your intent, that
on every allocation the buffer would get a reference to the heap so we
avoid removing a heap with allocated buffers?

Maxime

--sxksscuwilvy7rfq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaAd3wAKCRAnX84Zoj2+
dircAYDWmwkdH/3AAjuPp85DnYNPbSGFdhX/eyVBlLKWPqfln+xq2+gc6gDrOAAL
OyDKUToBf19j250y3Z4PQ7QYr1AXEq1bAKHYLpYrTQLrYCtOtKbL3L1J1eqyj4Jl
H3gZy48H7w==
=URjd
-----END PGP SIGNATURE-----

--sxksscuwilvy7rfq--
