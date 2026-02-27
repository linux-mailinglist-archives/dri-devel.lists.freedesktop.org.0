Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iDgAOn2coWl8ugQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:30:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE811B7AA2
	for <lists+dri-devel@lfdr.de>; Fri, 27 Feb 2026 14:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD75D10EB40;
	Fri, 27 Feb 2026 13:30:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="F9ZwxSbT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE25E10EB40
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Feb 2026 13:30:33 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 04B5F60008;
 Fri, 27 Feb 2026 13:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD5CC116C6;
 Fri, 27 Feb 2026 13:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1772199032;
 bh=n4yX5l6q7fUwZBwFYRwfHjLdICdDCZUGrXzVl1z1sXg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=F9ZwxSbTgLHYJpVWUuDP8wbZwcQB05N9yCc139iBS4j42M6KY7s3p9hu4NaBCEhuo
 nm64rd+BuFeAnRt6r+oAAilijlNBgCpQX/8Vios1yk4BLbTekn169/1BPUBUTrR+T6
 1g+44JrAY8+QcLwWcfR3VxE5sd7R3JpFvEq6uKMV8Bri2YlpIDYwvuMsAwFXM3JWGm
 pewISR+4xeDio4bgZyALFItTtDfth0boMVvgA/jMury2H1cdCtzDDjLySkXPykIZDr
 GGH1R7bvtv2st3HjQYncwcWM8GG61yNVbeKUuKLEXbAjzt1mCuvoy/MV8W1sqRTXFA
 7QBd9EokKi1AA==
Date: Fri, 27 Feb 2026 14:30:29 +0100
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
Message-ID: <20260227-psychedelic-tireless-herring-0adfa9@houat>
References: <20260225-dma-buf-heaps-as-modules-v1-0-2109225a090d@kernel.org>
 <CANDhNCqk9Uk4aXHhUsL4hR1GHNmWZnH3C9Np-A02wdi+J3D7tA@mail.gmail.com>
 <20260226-adaptable-vermilion-nautilus-0aa6f0@penduick>
 <CANDhNCrpNU7QJgu+0CZRvdxLwKp8VNxZoG_zDo7qqxaE0mjoTw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="ybq2aqmqnxghgoih"
Content-Disposition: inline
In-Reply-To: <CANDhNCrpNU7QJgu+0CZRvdxLwKp8VNxZoG_zDo7qqxaE0mjoTw@mail.gmail.com>
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
	FORGED_RECIPIENTS(0.00)[m:jstultz@google.com,m:sumit.semwal@linaro.org,m:benjamin.gaignard@collabora.com,m:Brian.Starkey@arm.com,m:tjmercier@google.com,m:christian.koenig@amd.com,m:m.szyprowski@samsung.com,m:robin.murphy@arm.com,m:akpm@linux-foundation.org,m:david@kernel.org,m:lorenzo.stoakes@oracle.com,m:Liam.Howlett@oracle.com,m:vbabka@suse.cz,m:rppt@kernel.org,m:surenb@google.com,m:mhocko@suse.com,m:linux-media@vger.kernel.org,m:linaro-mm-sig@lists.linaro.org,m:linux-kernel@vger.kernel.org,m:iommu@lists.linux.dev,m:linux-mm@kvack.org,s:lists@lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,googlesource.com:url]
X-Rspamd-Queue-Id: 4FE811B7AA2
X-Rspamd-Action: no action


--ybq2aqmqnxghgoih
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/7] dma-buf: heaps: Turn heaps into modules
MIME-Version: 1.0

Hi John,

On Thu, Feb 26, 2026 at 10:03:21AM -0800, John Stultz wrote:
> On Thu, Feb 26, 2026 at 2:18=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> > On Wed, Feb 25, 2026 at 10:51:30AM -0800, John Stultz wrote:
> > > So heaps-as-modules is common in the Android kernels, and was
> > > attempted to be upstreamed long ago:
> > >   https://lore.kernel.org/lkml/20191025234834.28214-1-john.stultz@lin=
aro.org/
> > >
> > > And it got a fairly chilly reception, but maybe having the additional
> > > optee heap (as well as other proposed heaps) might sway folks on this
> > > now.
> >
> > I didn't know that Android was using heap as modules only, but I'd say
> > that it's even more of a reason to upstream it then.
> >
> > > There is also the kref bits you might need (which Android still carri=
es):
> > >   https://lore.kernel.org/lkml/20200725032633.125006-1-john.stultz@li=
naro.org/
> >
> > I'm curious about this one though. It looks like you add refcounting,
> > but never really get the references anywhere. What was your intent, that
> > on every allocation the buffer would get a reference to the heap so we
> > avoid removing a heap with allocated buffers?
>=20
> Oh, apologies I mixed this up. You can ignore that suggestion.
>=20
> In Android, once folks were familiar with thinking about dma-buf
> heaps, some (out of tree) drivers wanted to be able to internally
> allocate from a given heap (somewhat of a hold-over from the old ION
> drivers). So we have a convenience patch to provide that:
>    https://android.googlesource.com/kernel/common/+/8e1ec97355ef9927e82ec=
18c98312bdcd80bf289%5E%21/
>=20
> And since we return a dma_heap to the driver to allocate against:
>   https://android.googlesource.com/kernel/common/+/fc1310ebf8fe25ea7b9834=
00e6fa41f5a6d11966%5E%21/
>=20
> The kref bit is to make sure we're doing proper reference counting on
> that shared pointer.
>=20
> This ended up getting bundled together along with the heaps-as-modules
> changes in our out-of-tree changes, and I just confused its use here.

Understood, thanks :)

It looks like there's some people interested in doing what you described
though, so we might need your patch still.

Maxime

--ybq2aqmqnxghgoih
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaaGcdQAKCRAnX84Zoj2+
dlInAYDiZPR1HyqxbwSMVJaP54olybYOcsMkzhKqdmUzzyNp1PJL2iscONIeEv0g
z3hqowsBgJDNhcz09KstrR3FmwlC0rN908FYO2XMXAIcrplcSndu1qOliyhSfM9Z
3ioBgkbAMA==
=BqyY
-----END PGP SIGNATURE-----

--ybq2aqmqnxghgoih--
