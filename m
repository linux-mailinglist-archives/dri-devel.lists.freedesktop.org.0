Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kM4yFETnjWkm8gAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:44:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84F7A12E65D
	for <lists+dri-devel@lfdr.de>; Thu, 12 Feb 2026 15:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3857910E757;
	Thu, 12 Feb 2026 14:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="XkxyqDfd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3078C10E757
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Feb 2026 14:44:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 6209A6001A;
 Thu, 12 Feb 2026 14:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87E5AC4CEF7;
 Thu, 12 Feb 2026 14:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770907454;
 bh=wsRfq4JQHV9EhUjp6BlIKRlXnA1FZ0qmUD3BISX7I1E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XkxyqDfdIbc2bvCV2VBTnKQn9x0JFcTOZBtBFX9PB8A/2SpUcIM1nvBYIKLVp7Lmm
 lQadF0urGbstpA3g9OASJ+foqHw327u6Sa3rSgYzmtxZDbIqF8POCkoZL6HQ0uzA2n
 euVz7mNjkB/EnKj7QbbU4yEvU27No5zuj7siNzFWGIA4qqv9MeuF4DWoOhsyqGj+nQ
 YedwoFYYkkwAZIeXxE7U+M5M9UiuoXGQY1TTFXZs0kXeg0mCoNz2Ssbs09aLyqB1I6
 cG5j7sYjeMmNkVYyk0RePGcka/JK5TRHwlAEYq3Nqj2STN4KtIFqQSP7/eQ+SwpDmV
 N3yMaDkmI1QQQ==
Date: Thu, 12 Feb 2026 15:44:11 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Maxime Ripard <mripard@redhat.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Brian Starkey <Brian.Starkey@arm.com>, 
 John Stultz <jstultz@google.com>, "T . J . Mercier" <tjmercier@google.com>, 
 Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>,
 Mike Rapoport <rppt@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
Message-ID: <aY3j57xvdOY09EwQ@orome>
References: <20260122161009.3865888-1-thierry.reding@kernel.org>
 <20260122161009.3865888-5-thierry.reding@kernel.org>
 <20260123-active-witty-rabbit-0fc5b9@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="glr5iu7kbaysq2rw"
Content-Disposition: inline
In-Reply-To: <20260123-active-witty-rabbit-0fc5b9@houat>
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
X-Spamd-Result: default: False [-1.41 / 15.00];
	SIGNED_PGP(-2.00)[];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.20)[multipart/signed,text/plain];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER(0.00)[thierry.reding@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	FORGED_RECIPIENTS(0.00)[m:mripard@redhat.com,m:airlied@gmail.com,m:simona@ffwll.ch,m:sumit.semwal@linaro.org,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:jstultz@google.com,m:tjmercier@google.com,m:akpm@linux-foundation.org,m:david@redhat.com,m:rppt@kernel.org,m:sumit.garg@kernel.org,m:devicetree@vger.kernel.org,m:linux-tegra@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-mm@kvack.org,m:krzk@kernel.org,m:conor@kernel.org,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,ffwll.ch,linaro.org,kernel.org,collabora.com,arm.com,google.com,linux-foundation.org,redhat.com,lists.freedesktop.org,vger.kernel.org,lists.linaro.org,kvack.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[20];
	FORGED_SENDER_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_NEQ_ENVFROM(0.00)[thierry.reding@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 84F7A12E65D
X-Rspamd-Action: no action


--glr5iu7kbaysq2rw
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 04/10] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Fri, Jan 23, 2026 at 02:25:16PM +0100, Maxime Ripard wrote:
> On Thu, Jan 22, 2026 at 05:10:03PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > There is no technical reason why there should be a limited number of CMA
> > regions, so extract some code into helpers and use them to create extra
> > functions (cma_create() and cma_free()) that allow creating and freeing,
> > respectively, CMA regions dynamically at runtime.
> >=20
> > The static array of CMA areas cannot be replaced by dynamically created
> > areas because for many of them, allocation must not fail and some cases
> > may need to initialize them before the slab allocator is even available.
> > To account for this, keep these "early" areas in a separate list and
> > track the dynamic areas in a separate list.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
>=20
> AFAIU, this won't create a new cma heap when registering. This goes
> against the recent work we did to create one for every cma region.
>=20
> I guess, since you have a driver that would explicitly handle that
> region, we should create some kind of opt-out mechanism, but by default,
> we should still create such a heap.

It sounds like there's a bit of a conflict between what you want to
achieve and what this series attempts to do.

The way I see it, the CMA code is more of a helper that gives you a
specific functionality set. Exposing each CMA area as a heap that
userspace can allocate from seems like a bad idea to me.

Without knowing anything specific about a CMA area you don't know if it
makes sense to expose it as a heap. Given that there is very little
information associated with a CMA area there's only so much guessing
that you can do. I think it'd be more sensible to make CMA areas opt-in
to have a heap created for them rather than requiring opt-out. Exposing
a heap publicly applies only to a (potentially) small subset of all CMA
areas, albeit at the moment it may seem that that is what it's primarily
used for.

In fact, for this particular driver nobody must allocate from any of the
CMA regions associated with the heap driver outside of that heap driver,
simply because the heap driver maintains meta data about these CMA
regions for things to work. If we allow access to it from anywhere,
things are eventually going to explode.

> That being said, it's not clear to me why the heap driver uses CMA in
> the first place.

We use CMA as a way of reclaiming memory if needed. The heap that we
create is meant to be resizable, so that when nothing uses the heap, the
memory can be reused for other purposes. However, when memory is
allocated from the heap, we need to reclaim that memory for the heap and
relocate any buffers allocated from the region somewhere else. CMA does
all of that for us, so it seemed like the logical choice for this.

Thierry

--glr5iu7kbaysq2rw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmN5zgACgkQ3SOs138+
s6FSqRAAwWGzG1UjDgVwyR+isYP6DrFMGbojEtczHFxgKElBKoFjjqtdmpN97XRD
7MIc1C6LGCLoJa++YXy7ZlL24CTzYRohVBnmy/Hygdz2uoaeW7GdR0M31slI/lG4
TpliCL/GXNi1ZhmE8BjykmsEqgjHG+PH9Vd1/VEgo/5DoaX3uc+8TndO9hqh/Jgh
gFScFbr/VRKDx8wdWyhOsWN4Nm52uJBCPbhJ8dGv4iabMopEwOlLpcm32aFNWMHv
El8zIIeGzfw9lfWm2WZvtO8heFn3R0kT5yw4opDc7STvO7k6fC/ZQWbg86FR71/e
DtrHMcjjg+75TIZemvKQwPrshL7CAdwcaNnT+QxVKE0oqHxjoIonRsUkEaTrFKyE
6n6eqR8+enCtH3hamWE6rFocZQzL5zXxqILwbzeAR/4CBtXBh3pZL4SH6V0cye9h
jci5Lfjh2SiLSggSKXsTBgrCLCvz8DuapM8GEtfkRS1YoKrix+uGe0nj+J3uAx+U
SyvOCMoTb+WWQNOyNBMpS2Wk3KcNDMuadOtuxbZa1BInxUBOktPn/km1vJgiO0au
5sWtH6xSgLF50qbTEFRVg+Pz31LIT+TZSA6L2gj5EmD1gKZeefPCtkiBgDZdsvwk
KAejAHsfMS0kibucCHIgTg6cjifaVKfFVtiBh3BX8ZuSmmlqnOM=
=TTIe
-----END PGP SIGNATURE-----

--glr5iu7kbaysq2rw--
