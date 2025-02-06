Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D481AA2B577
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 23:46:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4292D10E982;
	Thu,  6 Feb 2025 22:46:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="HPQamRPm";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="IAeGkUHk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fout-a8-smtp.messagingengine.com
 (fout-a8-smtp.messagingengine.com [103.168.172.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8ACE210E97F
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 22:46:37 +0000 (UTC)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal
 [10.202.2.51])
 by mailfout.phl.internal (Postfix) with ESMTP id C710C1380217;
 Thu,  6 Feb 2025 17:46:36 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-11.internal (MEProxy); Thu, 06 Feb 2025 17:46:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1738881996;
 x=1738968396; bh=3aUJSUxA/5Oys0lRe4RPNEASJchaynSRHC0bl4jRxyY=; b=
 HPQamRPmcSxQF7y2mRTyQz26d8jzxZZJ8+OpVozlAPS5cz//AmODSznXxblJOH08
 /akNhlHZLkvmf7mAGO6Ps4f+1mdnM/gdLIGTgicuvnSINbZYKkReuiCqid7DpPYs
 L+OFhuKmVRRnwgUV4ix4N9a1eOxfv1FvqB47fNIRwaYAjfaF4iwQ/NAVGoZSQt3+
 laWs7PSy/7pTzWyw38GhuHS06RC6X3OrHpSa8B+W5MgoW46i7YDUBrnw+R/D8+7u
 kff65j4k3CQ+2eefJJ9izlUQK7RzJAfLSlVEzwFQMm/zOvL3WM4s4zHsi12Iodx+
 EjlYvq6ObyDHkTNrjOoKPQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1738881996; x=1738968396; bh=3aUJSUxA/5Oys0lRe4RPNEASJchaynSRHC0
 bl4jRxyY=; b=IAeGkUHkJEgOFjLX0PFXZtSbDR5t/g8xkMVi0tMajrDw1Nbb7io
 /f0N0spxzNAwbE7WxTPcktMFvIJ+deZROhDQfpDcZUIm1LeZib6d7pS9Px/pNZPs
 DjtTsrrZhMdO8F/kaZja7wnDF5o2WIH1e7YGsqfJkyXCl86WQhdZr9wDlyb3BN0F
 GORCW9biuREu3shadtm79nul2BgGS/KW3/XH5To2n1t0El6Gi2jpv/46sdyFqrMr
 xmpd6eBcaprCvAeJ84FmD2rZmBHCgLLQYxsc15rIO03a3FMSuU6Chn78HlPL9pGF
 xX+0I/I+iJBNSF3aJd8qutu9k1kEbLt5Nfw==
X-ME-Sender: <xms:zDulZ6DOqJk-Cle8AtYT6jjxGWkXtSshxo0NoCkHqjiSL8cpXpuQ2Q>
 <xme:zDulZ0jW-ZlffGEIyJ35i_jTTiYsTvHi0l65MYYoKN9qCtx5K1z5lE9c5QMHsnJT3
 F1MxzlgQTcDK5c>
X-ME-Received: <xmr:zDulZ9lEpfegKNYew3RhBJufmVCuw5-9vDKoNLOR_1MsHP1yfn1e8gdujc4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjeeiudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeet
 geekhfetudfhgfetffegfffguddvgffhffeifeeikeektdehgeetheffleenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhi
 shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeduiedpmhhoug
 gvpehsmhhtphhouhhtpdhrtghpthhtoheprhhoghgvrhdrphgruhestghithhrihigrdgt
 ohhmpdhrtghpthhtohephhhonhhglhgvihdurdhhuhgrnhhgsegrmhgurdgtohhmpdhrtg
 hpthhtoheprhgrhidrhhhurghnghesrghmugdrtghomhdprhgtphhtthhopegumhhithhr
 hidrohhsihhpvghnkhhosegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohepughrih
 dquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthho
 pegrihhrlhhivggusehrvgguhhgrthdrtghomhdprhgtphhtthhopehkrhgrgigvlhesrh
 gvughhrghtrdgtohhmpdhrtghpthhtohepghhurhgthhgvthgrnhhsihhnghhhsegthhhr
 ohhmihhumhdrohhrghdprhgtphhtthhopeholhhvrghffhgvsehgmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:zDulZ4yyKNgZxtwmi3Z0TyEO0HwA0LK0PrXQdqmPg4syAtHxPRIDGQ>
 <xmx:zDulZ_SREde4ElLsh3WaiOvpXlf0mrS5WEAMTahPyIetmz7NfXhRoA>
 <xmx:zDulZzb5cgGVFrTdlsPzYWX8lXtZI60A92rMW8nBSJLpAH1hRELS-A>
 <xmx:zDulZ4QxQO7bqcSnH8oYbpCOtFOjbRyQsKAZpzJ4bYxLjtlUvgwsDw>
 <xmx:zDulZwAzQJEa8zdpanVmKxFtp8M5yDUOLP6XXykSXLwTntJVYgSD_ea4>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Feb 2025 17:46:35 -0500 (EST)
Date: Thu, 6 Feb 2025 17:46:29 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>, Huang Rui <ray.huang@amd.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Marek =?us-ascii?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/?=
 =?us-ascii?Q?=3D?= <marmarek@invisiblethingslab.com>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen memory management primitives for GPU virtualization
Message-ID: <Z6U7yOrMyLZWqPA4@itl-email>
References: <Z5794ysNE4KDkFuT@itl-email>
 <Z6T0t4DMJeY6K18w@macbook.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="dDcC+PbFKfPResFL"
Content-Disposition: inline
In-Reply-To: <Z6T0t4DMJeY6K18w@macbook.local>
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


--dDcC+PbFKfPResFL
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 6 Feb 2025 17:46:29 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>
Cc: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Lingshan Zhu <Lingshan.Zhu@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?us-ascii?B?PT91dGYtOD9RP01hcmN6eWtvd3NraS1HPUMzPUIzcmVja2k/?=
	=?us-ascii?Q?=3D?= <marmarek@invisiblethingslab.com>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	Andrew Cooper <andrew.cooper3@citrix.com>
Subject: Re: Xen memory management primitives for GPU virtualization

On Thu, Feb 06, 2025 at 06:43:19PM +0100, Roger Pau Monn=C3=A9 wrote:
> On Sun, Feb 02, 2025 at 12:08:46AM -0500, Demi Marie Obenour wrote:
> > Recently, AMD submitted patches to the dri-devel mailing list to support
> > using application-provided buffers in virtio-GPU.  This feature is
> > called Shared Virtual Memory (SVM) and it is implemented via an API
> > called User Pointer (userptr).  This lead to some discussion on
> > dri-devel@lists.freedesktop.org and dri-devel IRC, from which I
> > concluded that Xen is missing critical primitives for GPU-accelerated
> > graphics and compute.  The missing primitives for graphics are the ones
> > discussed at Xen Project Summit 2024, but it turns out that additional
> > primitives are needed for compute workloads.
> >=20
> > As discussed at Xen Project Summit 2024, GPU acceleration via virtio-GPU
> > requires that an IOREQ server have access to the following primitives:
> >=20
> > 1. Map: Map a backend-provided buffer into the frontend.  The buffer
> >    might point to system memory or to a PCIe BAR.  The frontend is _not_
> >    allowed to use these buffers in hypercalls or grant them to other
> >    domains.  Accessing the pages using hypercalls directed at the
> >    frontend fails as if the frontend did not have the pages.
>=20
> Do you really need to strictly enforce failure of access when used as
> hypercall buffers?
>=20
> Would it be fine to just get failures when the p2m entries are not
> populated?  I assume the point is that accesses to those guest pages
> from Xen should never go into the IOREQ?

These pages might point to PCIe BAR memory.  I'm not sure if that is
allowed to be used in hypercalls, and what the security consequences are
if it is allowed.  Also, allowing the guest to determine if the pages
are mapped in the p2m violates encapsulation and risks pointers to the
pages winding up in places they must not.

> >    The only
> >    exception is that the frontend _may_ be allowed to use the buffer in
> >    a Map operation, provided that Revoke (below) is transitive.
>=20
> The fact that the mapped memory can either be RAM or MMIO makes it a
> bit harder to handle any possible reference counting, as MMIO regions
> don't have backing page_info structs, and hence no reference counting.
> I think that might be hidden by the p2m handling, but needs to be
> checked to be correct.

These pages must never have p2m type p2m_ram_rw, as that would allow
them to be foreign-mapped or used in grant table operations.  I also
believe this feature should be x86-only to begin with, as it is clear
that parts of the code (like get_paged_frame()) are not ready for other
architectures.  On x86, p2m_mmio_direct seems to be the appropriate type
when the pages that are accessible via CPU instructions, and p2m_mmio_dm
when they are not.  Will using p2m_mmio_direct for pages backed by
system RAM cause problems?

> Also when mapping MMIO pages, will those maps respect the domain
> d->iomem_caps permission ranges, and then require modifications for
> the mappings to succeed, or just ignore d->iomem_caps?

They should respect the backend's permissions and ignore those of the
frontend.  This might require a global lock (or cleverness) to avoid
lock order inversions.

> > 2. Revoke: Revoke access to a buffer provided by the backend.  Once
> >    access is revoked, no operation on or in the frontend domain can
> >    access or modify the pages, and the backend can safely reuse the
> >    backing memory for other purposes.
>=20
> It looks to me that revocation means removing the page from the p2m?

This is one part.

> (and additionally adjusting d->iomem_caps if required to revoke domain
> permission to map the page)

The frontend domain should never have permission to map the pages.

> >    Furthermore, revocation is not
> >    allowed to fail unless the backend or hypervisor is buggy, and if it
> >    does fail for any reason, the backend will panic.  Once access is
> >    revoked, further accesses by the frontend will cause a fault that the
> >    backend can intercept.
>=20
> Such faults would translate into a new IOREQ type, maybe IOREQ_TYPE_FAULT.
>=20
> I think that just having a rangeset on the ioreq to signal the
> accesses that should trigger a IOREQ_TYPE_FAULT instead of an
> IOREQ_TYPE_COPY should be enough?

I think so.  Better documentation would be very helpful.

> The p2m type could be set as p2m_mmio_dm for those ranges.

That seems correct.

> > Map can be handled by userspace, but Revoke must be handled entirely
> > in-kernel.  This is because Revoke happens from a Linux MMU notifier
> > callback, and those are not allowed to block, fail, or involve userspace
> > in any way.  Since MMU notifier callbacks are called before freeing
> > memory, failure means that some other part of the system still has
> > access to freed memory that might be reused for other purposes, which
> > is a security vulnerability.
>=20
> This "revoke" action would just be an hypercall, I think that would
> satisfy your requirements?

It would, provided that (unless misused) it always succeeds promptly and
is security-supported (including DoS) with partially trusted callers.  I
don't care about DoS but AMD's automotive customers definitely do.

> > It turns out that compute has additional requirements.  Graphics APIs
> > use DMA buffers (dmabufs), which only support a subset of operations.
> > In particular, direct I/O doesn't work.  Compute APIs allow users to
> > make malloc'd memory accessible to the GPU.  This memory can be used
> > in Linux kernel direct I/O and in other operations that do not work
> > with dmabufs.  However, such memory starts out as frontend-owned pages,
> > so it must be converted to backend pages before it can be used by the
> > GPU.  Linux supports migration of userspace pages, but this is too
> > unreliable to be used for this purpose.  Instead, it will need to be
> > done by Xen and the backend.
> >=20
> > This requires two additional primitives:
> >=20
> > 3. Steal: Convert frontend-owned pages to backend-owned pages and
> >    provide the backend with a mapping of the page.
>=20
> What does "owned" exactly mean in this context?
>=20
> What you describe above sound very much like a foreign map, but I'm
> not sure I fully understand the constrains below.
>=20
> Does this "steal" operation make the pages inaccessible by the domain
> running the frontend (so the orignal owner of the memory).

It's a foreign map for which the backend can deny the frontend access to
its own pages if it so chooses.  It was needed for a feature (Shared
Virtual Memory) that Qubes OS doesn't need.

> >    After a successful
> >    Steal operation, the pages are in the same state as if they had been
> >    provided via Map.  Steal fails if the pages are currently being used
> >    in a hypercall, are MMIO (as opposed to system memory), were provided
> >    by another domain via Map or grant tables, are currently foreign
> >    mapped, are currently granted to another domain, or more generally
> >    are accessible to any domain other than the target domain.
>=20
> I think the above means that "stealed" pages must have the
> "p2m_ram_rw" type in the frontend domain p2m.   IOW: must be strictly
> RAM and owned by the domain running the frontend.

I'm not sure what this looks like from the Xen PoV, but I'm no longer
interested in seeing page steal and return implemented.

> >    The
> >    frontend's quota is decreased by the number of pages stolen, and the
> >    backend's quota is increased by the same amount.  A successful Steal
> >    operation means that Revoke and Map can be used to operate on the
> >    pages.
>=20
> Hm, why do you need this quota adjustment?  Aren't the "stolen" pages
> still owned by the domain running the frontend (have
> page_info->v.inuse._domain =3D=3D frontend domain)?

Nope, they were meant to be owned by the backend, but I'm no longer
interested in this feature.

> > 4. Return: Convert a backend-owned page to a frontend-owned page.  After
> >    a successful call to Return, the backend is no lonter able to use
> >    Revoke or Map.  The returned page ceases to count against backend
> >    quota and now counts against frontend quota.
> >=20
> > Are these operations ones that Xen is interested in providing?  There
> > may be other primitives that are sufficient to implement the above four,
> > but I believe that any solution that allows virtio-GPU to work must
> > allow the above four operations to be implemented.  Without the first
> > two, virtio-GPU will not be able to support Vulkan or native contexts,
> > and without the second two also being present, shared virtual memory
> > and compute APIs that require it will not work.
>=20
> I'm sure Xen can arrange for what's required, but the Xen primitives
> should be as simple as possible, offloading all possible logic to the
> backend.

Makes sense, though I don't want to make the backend 10x more complex to
make the Xen code slightly simpler, as the backend in Qubes OS will
often be dom0.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--dDcC+PbFKfPResFL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmelO8YACgkQszaHOrMp
8lOV2Q//Y+vOJi5Z99Y1BVZPeJ/D0lNOo9FRlG8gqJg6BOq+FHYZ6MgsZdvas445
2Au11p9eZfjsClCU0MVZIeteyUOYj/HQYC+IWhz9/Ysw/2c7+5V9CaNbHcu2X9Bx
v+b4It6ujUxolu0r692deR/7rLcV4SqCOjP39gBGXPpLTA1MlAnyKrLoHPQdcUD0
q8UvEusxKI11GNQBvgX8iJvF0jqxv4L6Q5NZFzke4JEbSpLGMIDZ7cw4unWs+Tgt
NJVxAbSn46XHCSFWP3063JrsBVR5ghNzZ8h64WHRmyjxNUjZdmWgLe+HYcaaF6b/
BsmFnxdgBQPHAwF3VrWinlF9M/1qfzK9eaVaDNf/50nuDWslvIJB7nY3SJVt/eHv
j00ZjAKD6jnxH4B3zNPOj+zdRftLOJN3x7cNhmhyU0+oo4FHmP5GY3GZrdvU7ocN
A1mmj7WathGZapGVIkDHAL218NRwStl2Kka88EppXi4lxpqsIl61VbhXRK8DCaen
xC3Ry3GNwoPWmgdipWLcN/BVwn17TO9TBH3ZH311hfJ+lbRx5zrQsJGSsPSdvBZY
oeqsFwg1igSlBI4WxdLJIQADNgyten4d0iTMrYNySMClxlk9PPDUKm5bJ7mMeWnc
9tKLN6zNaHXeci1O6Ohj/FNYx+11hrOv2jIuix16VuRt0i7BsyQ=
=RxIz
-----END PGP SIGNATURE-----

--dDcC+PbFKfPResFL--
