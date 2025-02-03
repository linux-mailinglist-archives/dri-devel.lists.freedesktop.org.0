Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D85F3A25139
	for <lists+dri-devel@lfdr.de>; Mon,  3 Feb 2025 03:20:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FCA10E1AF;
	Mon,  3 Feb 2025 02:20:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="ncqRb4Ag";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="e0XlE5bR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b1-smtp.messagingengine.com
 (fhigh-b1-smtp.messagingengine.com [202.12.124.152])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7898410E1AF
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Feb 2025 02:20:40 +0000 (UTC)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal
 [10.202.2.46])
 by mailfhigh.stl.internal (Postfix) with ESMTP id 0F1A825400EE;
 Sun,  2 Feb 2025 21:20:39 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-06.internal (MEProxy); Sun, 02 Feb 2025 21:20:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1738549238;
 x=1738635638; bh=kLgdLI5oUO5W6IbNsChm6AJlzDDfUQRpYNImEHLeohM=; b=
 ncqRb4AgPpaGHCbbtHgwBxEUkPiWkOXJ9x1hT3P1WLc7tgWfUFfPoIeczEoaMZk5
 CpKjMb+WRI8ywyA6aFEQnhkPDpMgYEYTQYg0HTewdAz9BCMTMchD5xv+3UqE2XEI
 n4cEmuOzb1SmVbGJaVWDpJ7UX1hMgm8BF7Lt8XtVLC+a01SypNFhvibh88RL19rT
 F1KtmVP9/9Nl0rDQTEk4mSrTF9osEQV3pGdKDSsGTazG3j4cJEmIoLltGq+jd9Yc
 jKcDJT6CnJIqtKk7rSxyVMmzcJJ21aByywxaBh36ujhjObSzM6nmNQfqE3W5wr1u
 a0kivErtKjsNn9TMLMcvig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1738549238; x=1738635638; bh=kLgdLI5oUO5W6IbNsChm6AJlzDDfUQRpYNI
 mEHLeohM=; b=e0XlE5bRmpUnVCqeYdO0TyzykVBXzkXZaYh3F836bC3yrxrMSQ8
 R36yjtRLhVVPz7cac8IImt4Z9oG4YTtZSEpTlPXP9Rgvgzq762Khch6KmGAhLV5K
 R1Gli4rccTPYVOgNPWzjYKrX1tStaG5MqRKzdpoA6LdBj9WzAygy4OMEDKTsmtxB
 qxSnZlt/3qLGuvukLEIFdOe+F8bXDWlC3MQShHj+hrgRgTepdhqDIx4yxcEWEaR0
 uECLxgX2h10HLJfBKTeKL/GkMgmM8mJQn3skGI/1GqsTmCmciYy7WU9CnAOVnYJP
 0U3mJhNbyueONQwLLbYPJ/r2cdY/7iPp8+g==
X-ME-Sender: <xms:9iegZ9Er1xwDSsdifAjLQeiF_hc77G7oy3P8QPT2DU9Az3GM7g_IVg>
 <xme:9iegZyWKnYM3dHi8UdnkyycnLDGdqT7tQ3Jf01mOtt7AJU5khPHnawCO2hGZe7HIg
 KUeGBVDlMlSQQs>
X-ME-Received: <xmr:9iegZ_Jnrft4IDiKvetPAdqexEaHwk-WyJR3KbHvcTmhaZlp8zwpDPKNAqs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduieefiecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvuffkfhggtggujgesghdtreertddtvden
 ucfhrhhomhepffgvmhhiucforghrihgvucfqsggvnhhouhhruceouggvmhhisehinhhvih
 hsihgslhgvthhhihhnghhslhgrsgdrtghomheqnecuggftrfgrthhtvghrnhepiefgieef
 vdfgjeelfeeifefgjedvvdefleegleeifeegfffhgffffeffhfeuudehnecuvehluhhsth
 gvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepuggvmhhisehinhhvihhs
 ihgslhgvthhhihhnghhslhgrsgdrtghomhdpnhgspghrtghpthhtohepudekpdhmohguvg
 epshhmthhpohhuthdprhgtphhtthhopehhohhnghhlvghiuddrhhhurghnghesrghmugdr
 tghomhdprhgtphhtthhopehrrgihrdhhuhgrnhhgsegrmhgurdgtohhmpdhrtghpthhtoh
 epughmihhtrhihrdhoshhiphgvnhhkohestgholhhlrggsohhrrgdrtghomhdprhgtphht
 thhopegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpd
 hrtghpthhtoheprghirhhlihgvugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepkhhr
 rgigvghlsehrvgguhhgrthdrtghomhdprhgtphhtthhopehguhhrtghhvghtrghnshhinh
 hghhestghhrhhomhhiuhhmrdhorhhgpdhrtghpthhtohepohhlvhgrfhhfvgesghhmrghi
 lhdrtghomhdprhgtphhtthhopegrkhhihhhikhhordhouggrkhhisegurgihnhhigidrtg
 homh
X-ME-Proxy: <xmx:9iegZzEaNOgSGM9Yon92Im4r0b1M_wMeZXfndSJeRCkKYLsB0QPd1A>
 <xmx:9iegZzXxJo2-dwTxOEwyj4j4PUaNQOEN513yjD2dwxRtcfxPVpwb2Q>
 <xmx:9iegZ-PtDOokRGouCaKQii9Dq_JxDzQVkwEmbE2rnCIzu5aicExPtw>
 <xmx:9iegZy3NHN-0W5re0cyQtJtEeNIjGU_SX0YNnhEmZTZAGO94A8DTcA>
 <xmx:9iegZ6OhqvdmY-sFGKoCC3Ay55jRIV5wpS9TWhELj6mEJWMnCqTmiFdF>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 2 Feb 2025 21:20:37 -0500 (EST)
Date: Sun, 2 Feb 2025 21:20:22 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>, Huang Rui <ray.huang@amd.com>,
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
 Andrew Cooper <andrew.cooper3@citrix.com>,
 Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
 Matthew Wilcox <willy@infradead.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: Xen memory management primitives for GPU virtualization
Message-ID: <Z6An8odKgv2xgmBw@itl-email>
References: <Z5794ysNE4KDkFuT@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="QlLW1qX7YRCu52Cm"
Content-Disposition: inline
In-Reply-To: <Z5794ysNE4KDkFuT@itl-email>
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


--QlLW1qX7YRCu52Cm
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sun, 2 Feb 2025 21:20:22 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>,
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
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Roger Pau =?utf-8?B?TW9ubsOp?= <roger.pau@citrix.com>,
	Matthew Wilcox <willy@infradead.org>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: Xen memory management primitives for GPU virtualization

On Sun, Feb 02, 2025 at 12:08:46AM -0500, Demi Marie Obenour wrote:
> Recently, AMD submitted patches to the dri-devel mailing list to support
> using application-provided buffers in virtio-GPU.  This feature is
> called Shared Virtual Memory (SVM) and it is implemented via an API
> called User Pointer (userptr).  This lead to some discussion on
> dri-devel@lists.freedesktop.org and dri-devel IRC, from which I
> concluded that Xen is missing critical primitives for GPU-accelerated
> graphics and compute.  The missing primitives for graphics are the ones
> discussed at Xen Project Summit 2024, but it turns out that additional
> primitives are needed for compute workloads.
>=20
> As discussed at Xen Project Summit 2024, GPU acceleration via virtio-GPU
> requires that an IOREQ server have access to the following primitives:
>=20
> 1. Map: Map a backend-provided buffer into the frontend.  The buffer
>    might point to system memory or to a PCIe BAR.  The frontend is _not_
>    allowed to use these buffers in hypercalls or grant them to other
>    domains.  Accessing the pages using hypercalls directed at the
>    frontend fails as if the frontend did not have the pages.  The only
>    exception is that the frontend _may_ be allowed to use the buffer in
>    a Map operation, provided that Revoke (below) is transitive.

Further note: if the frontend has an assigned PCI device, I believe that
pages provided by Map _should not_ be included in the device's IOMMU
mappings.  This avoids needing a synchronous IOTLB flush when Revoke is
performed, which would be slow.  Delaying the flush would allow the
frontend to DMA into freed backend memory and so would be a security
vulnerability.  Furthermore, such entries would not be useable by the
frontend in any way, as the frontend cannot perform DMA to them without
racing against a concurrent call to Revoke made by the backend.

> 2. Revoke: Revoke access to a buffer provided by the backend.  Once
>    access is revoked, no operation on or in the frontend domain can
>    access or modify the pages, and the backend can safely reuse the
>    backing memory for other purposes.  Furthermore, revocation is not
>    allowed to fail unless the backend or hypervisor is buggy, and if it
>    does fail for any reason, the backend will panic.  Once access is
>    revoked, further accesses by the frontend will cause a fault that the
>    backend can intercept.

How should this interact with emulated I/O devices?  If the emulated I/O
device uses mmap() on the dmabuf to access the pages, things will work
fine, but if it uses foreign mapping operations, things will fail rather
miserably.  I think it is okay for this to fail: DMA to pages provided
by Map is always a guest bug, and that includes DMA by an emulated
device.  Guest userspace is prepared for such errors, because dmabufs on
bare silicon work the same way.

> 3. Steal: Convert frontend-owned pages to backend-owned pages and
>    provide the backend with a mapping of the page.  After a successful
>    Steal operation, the pages are in the same state as if they had been
>    provided via Map.  Steal fails if the pages are currently being used
>    in a hypercall, are MMIO (as opposed to system memory), were provided
>    by another domain via Map or grant tables, are currently foreign
>    mapped, are currently granted to another domain, or more generally
>    are accessible to any domain other than the target domain.  The
>    frontend's quota is decreased by the number of pages stolen, and the
>    backend's quota is increased by the same amount.  A successful Steal
>    operation means that Revoke and Map can be used to operate on the
>    pages.

How should this work if the frontend has an assigned PCI device?  Xen
can unmap the pages from the frontend's IOMMU mappings, but the frontend
might continue to try to perform DMA to these pages.  This would result
in runtime misbehavior or data corruption.

PV devices could be a significant problem too, because Steal is
incompatible with grant tables for security reasons.  Otherwise, a
malicious guest could grant a page to domain A (which expects it to be
ordinary RAM) and then ask domain B to steal it.  Domain B steals the
page, revokes it (for page migration purposes, say), and reuses the
backing storage.  Now domain A has a mapping of freed domain B memory.
If Steal instead revoked domain A's mapping too, domain B could block
domain A forever.  This means unless domain B is privileged over domain
A (and domain A has no assigned PCI devices), the mapping must fail.

Matthew: Do you know if Linux supports marking anonymous memory as "does
not support DMA/pin_user_pages()"?  If not, how hard would it be to
implement this?  Without this, all I/O by a guest using virtio-GPU
shared virtual memory would need to be bounce-buffered, which isn't
great for performance.  This includes I/O using paravirtualized devices,
unless the PV driver can handle the grant operation failing and fall
back to a bounce buffer.  It would be much better if only I/O from stolen
pages needed to be bounced.

What _might_ work is this sequence of operations:

1. The frontend asks backend userspace to give the pages back.
2. The backend converts the memory to pinned CPU memory, perhaps via
   mlock().
3. The backend returns the pages to the guest via Return (below).  This
   can be done without blocking GPU access because these pages are
   pinned to system RAM.
4. The frontend uses the pages for DMA/grant tables/etc as normal.

This requires a blocking cross-VM round-trip, though, so it won't be
fast.

As an aside, emulated devices will work fine if the device model is in
the same domain as the backend and uses the same mappings as are passed
to the GPU driver.  In that case, access to the stolen pages will be
handled correctly.  It's only when there are multiple IOREQ servers
or PV drivers involved that sadness occurs.  It seems that shared
virtual memory is very unfriendly to disaggregated setups.

> 4. Return: Convert a backend-owned page to a frontend-owned page.  After
>    a successful call to Return, the backend is no lonter able to use
>    Revoke or Map.  The returned page ceases to count against backend
>    quota and now counts against frontend quota.
>=20
> Are these operations ones that Xen is interested in providing?  There
> may be other primitives that are sufficient to implement the above four,
> but I believe that any solution that allows virtio-GPU to work must
> allow the above four operations to be implemented.  Without the first
> two, virtio-GPU will not be able to support Vulkan or native contexts,
> and without the second two also being present, shared virtual memory
> and compute APIs that require it will not work.

In light of all of the above limitations, I think that there is an
important special case: if the GPU is an iGPU, then all SVM buffers
should be allocated form pinned CPU memory, which makes the problem go
away entirely.  If access to SVM data is not at all performance
critical, then it might still be possible to keep all the data in system
memory.

The underlying limitation that causes all of the above problems is that
both DMA and Xen grant table operations require pinned memory, and there
is no way to do that from userspace. =20
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab>=20

--QlLW1qX7YRCu52Cm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmegJ+8ACgkQszaHOrMp
8lMLxw/+OoP8cs+d1RU/7CGDcJgR6gQWEHjeMCiMKTmmVobPAAhzuTBNLXajBPOr
xYTkI2ggQcHUlGTV6hSxDu3NJST/Twheb4Yq+NKNMXVzxIfsnfu/UDwW9b55Vmnn
ggv8HQeMfLFghA+UTmWaZIkowgj0vr86Z6Jg9l0ey5UPAedgSB4yPx9wNl2Xio/W
ruB2VsEf3470MZ/w3rGcqnwlL+2l6qTD+dTBPztfqtvcLOWeB1fL7IoZqr5WzZsp
SFq6O+eV/NSJXlywEzr1EPbxmobX4q19LafAkEgwXVXnu87SdahzNwePuhUnBLPf
jENIbOMjkRbe+o/DPqMh7DkVCBPJQQ/6P1LF9p+2eHABqBclm1i1XvH20OnXsCv5
MsWLbaHPHAO5aHhnSegISQHQUXattXvb2NpZ9dq2IX54V1fjmxQEst8+Wr96y/bH
tJ/G2gBebNGM674LRhzUVxUOFOc1b2AF7ejgMf4UxAXfsS0ymvu8/MikNPTGBVtT
VZeDtvFf8+20IKB0Cq9iFRB7a+3A8veQTXWOx+OxvDhWtCXuvvaUBYaUVlnEK2dB
wh02apRSvuMt1dc5lbLIG0vb3sQw+K8nd5bpgNlT34U1rDldo+71Ii5tBdy2eB+g
Yt6x7mNp7K/GJb4bFuSw9CP85AtfRZSaG/f5nBcuD0LQAiA+m44=
=zwlt
-----END PGP SIGNATURE-----

--QlLW1qX7YRCu52Cm--
