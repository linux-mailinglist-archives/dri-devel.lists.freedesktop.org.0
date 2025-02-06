Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97C63A2B0C3
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2025 19:25:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B99BD10E2AA;
	Thu,  6 Feb 2025 18:25:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="kmXSdWxP";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="p3/Sme92";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-a8-smtp.messagingengine.com
 (fhigh-a8-smtp.messagingengine.com [103.168.172.159])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F7AE10E91C
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2025 18:21:13 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.phl.internal (Postfix) with ESMTP id C392B114023E;
 Thu,  6 Feb 2025 13:21:12 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Thu, 06 Feb 2025 13:21:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1738866072;
 x=1738952472; bh=LVWd6g0jNd2/cna7ay95TAMpwJ4DUTXCoUp9pBK29VA=; b=
 kmXSdWxPiJJVi9L0ooGYjpowht5gG4g2kLMqB0tTfjwdqS5voSCtJ5Z+d5Xv78Nn
 QaqrUPWqzVwwT3XyLqctVX2hzpuN0dicrty3vfzjjfbljmIHa/2xPxRV5jYbtQOM
 NQXiM4qE7L5MQw+soHvfvwu+bsxj+x6dZpa+IBwXeBcyNzPzq6Md9A3glSntkxRg
 Y9ERleElXLoWnSNOzqvnpz/aQlhs2kSzOyIqlV/9+hGsUGUBgfDSxtbO8eBOvbPd
 XFamY44dYcRyi1c224cL6qG9d7dodx02ThOl9Fl8YfGmh/wIbCoNEP9hMlNXwv9V
 2XG9iORCHsyx4W3DiXvrvg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1738866072; x=1738952472; bh=LVWd6g0jNd2/cna7ay95TAMpwJ4DUTXCoUp
 9pBK29VA=; b=p3/Sme92UbG4olaB/yg2IkafbNXzOIaDY6glUjyMt5P+FKdYTef
 h+5twob+Eo+Ynj7HlCHj7gKSpNdDXxuc4iuE5PrWnwRdHqwkfhc9eUydKurRcbDK
 wEDBQui3y6wL21I0dWiaTl05wiGl1HuF7caXj983mh3520CqiXHbuKDFu/HhiEJk
 X/wrwUEX4J4RUt2s6MoPmzxJUMriSLyJsNuhaV2BZ2h0VRl3JpOV2ogbpYqkOtIe
 yWYz2lSfQaPAyHMzrw2sICBGZMGU0v1Cmvg8/iCV1zGK7Sjkeko7qyKMWBlzafkh
 OnHhulWFiELml3wB6GjolKuPMUpigPBlidA==
X-ME-Sender: <xms:mP2kZ3phIyeacO6nHKoic5JKUJlW2p6ywz72awmxYH0DyaSXqr9S1w>
 <xme:mP2kZxo5EmSV1iRI90sSES4KIwiaJHneP0be3R6rPNuyIC4IqMxd93VeWFjwATGAF
 23nUkXrz4Hhuwo>
X-ME-Received: <xmr:mP2kZ0MEaCIFxBXlaWCaTXfdNdyCKHlEC5_YyigHPA_2Qr37gEhDJMgcjE0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvjedtlecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeet
 geekhfetudfhgfetffegfffguddvgffhffeifeeikeektdehgeetheffleenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhi
 shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedukedpmhhoug
 gvpehsmhhtphhouhhtpdhrtghpthhtohephhhonhhglhgvihdurdhhuhgrnhhgsegrmhgu
 rdgtohhmpdhrtghpthhtohepuggvmhhiohgsvghnohhurhesghhmrghilhdrtghomhdprh
 gtphhtthhopehrrgihrdhhuhgrnhhgsegrmhgurdgtohhmpdhrtghpthhtohepshhtvghf
 rghnohdrshhtrggsvghllhhinhhisegrmhgurdgtohhmpdhrtghpthhtohepvhhirhhtuh
 grlhhiiigrthhiohhnsehlihhsthhsrdhlihhnuhigqdhfohhunhgurghtihhonhdrohhr
 ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
 hrghdprhgtphhtthhopegrihhrlhhivggusehrvgguhhgrthdrtghomhdprhgtphhtthho
 pegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtg
 hpthhtohepughmihhtrhihrdhoshhiphgvnhhkohestgholhhlrggsohhrrgdrtghomh
X-ME-Proxy: <xmx:mP2kZ65uxWYKQg8JStfQFyh0sordyZ9zExZ0crqmVbQUL8lUj0XP2g>
 <xmx:mP2kZ244LEz3d5Z49_ZSJpCx9lGmq5S_q5beYIs3qLSjTestqEWCFg>
 <xmx:mP2kZyh31RPT-xN1gkFgKyJnTbd0-vZn3p7K93YAbico6iT6UJ30cA>
 <xmx:mP2kZ449bzYZEfS7xLe7azXw2pqLFrB9n2PbHaWyK6U2Rk2T5mF3Bg>
 <xmx:mP2kZzw_Njbh6Z7Gd3x6Lk5QFvJ9TzOQx4kfZnNa3CRQ_4W-AJN2AdAc>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 6 Feb 2025 13:21:11 -0500 (EST)
Date: Thu, 6 Feb 2025 13:21:04 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>,
 virtualization@lists.linux-foundation.org,
 linux-kernel@vger.kernel.org, David Airlie <airlied@redhat.com>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Kernel KVM virtualization development <kvm@vger.kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
Message-ID: <Z6T9lDSj8Y9ATE3k@itl-email>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
 <Z36wV07M8B_wgWPl@phenom.ffwll.local>
 <c42ae4f7-f5f4-4906-85aa-b049ed44d7e9@gmail.com>
 <Z5waZsddenagCYtl@itl-email>
 <7b0bf2d5-700a-4cc7-b410-a9b2e2083b5d@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Wy7U6lvUah8lMeg3"
Content-Disposition: inline
In-Reply-To: <7b0bf2d5-700a-4cc7-b410-a9b2e2083b5d@amd.com>
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


--Wy7U6lvUah8lMeg3
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 6 Feb 2025 13:21:04 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	Huang Rui <ray.huang@amd.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org, David Airlie <airlied@redhat.com>,
	dri-devel@lists.freedesktop.org,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Lingshan Zhu <Lingshan.Zhu@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Kernel KVM virtualization development <kvm@vger.kernel.org>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource
 object

On Thu, Feb 06, 2025 at 06:53:55PM +0800, Huang, Honglei1 wrote:
> On 2025/1/31 8:33, Demi Marie Obenour wrote:
> > On Wed, Jan 29, 2025 at 03:54:59PM -0500, Demi Marie Obenour wrote:
> > > On 1/8/25 12:05 PM, Simona Vetter wrote:
> > > > On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1 wrote:
> > > > >=20
> > > > > On 2024/12/22 9:59, Demi Marie Obenour wrote:
> > > > > > On 12/20/24 10:35 AM, Simona Vetter wrote:
> > > > > > > On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
> > > > > > > > From: Honglei Huang <Honglei1.Huang@amd.com>
> > > > > > > >=20
> > > > > > > > A virtio-gpu userptr is based on HMM notifier.
> > > > > > > > Used for let host access guest userspace memory and
> > > > > > > > notice the change of userspace memory.
> > > > > > > > This series patches are in very beginning state,
> > > > > > > > User space are pinned currently to ensure the host
> > > > > > > > device memory operations are correct.
> > > > > > > > The free and unmap operations for userspace can be
> > > > > > > > handled by MMU notifier this is a simple and basice
> > > > > > > > SVM feature for this series patches.
> > > > > > > > The physical PFNS update operations is splited into
> > > > > > > > two OPs in here. The evicted memories won't be used
> > > > > > > > anymore but remap into host again to achieve same
> > > > > > > > effect with hmm_rang_fault.
> > > > > > >=20
> > > > > > > So in my opinion there are two ways to implement userptr that=
 make sense:
> > > > > > >=20
> > > > > > > - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is=
 not mmu
> > > > > > >     notifier
> > > > > > >=20
> > > > > > > - unpinnned userptr where you entirely rely on userptr and do=
 not hold any
> > > > > > >     page references or page pins at all, for full SVM integra=
tion. This
> > > > > > >     should use hmm_range_fault ideally, since that's the vers=
ion that
> > > > > > >     doesn't ever grab any page reference pins.
> > > > > > >=20
> > > > > > > All the in-between variants are imo really bad hacks, whether=
 they hold a
> > > > > > > page reference or a temporary page pin (which seems to be wha=
t you're
> > > > > > > doing here). In much older kernels there was some justificati=
on for them,
> > > > > > > because strange stuff happened over fork(), but with FOLL_LON=
GTERM this is
> > > > > > > now all sorted out. So there's really only fully pinned, or t=
rue svm left
> > > > > > > as clean design choices imo.
> > > > > > >=20
> > > > > > > With that background, why does pin_user_pages(FOLL_LONGTERM) =
not work for
> > > > > > > you?
> > > > > >=20
> > > > > > +1 on using FOLL_LONGTERM.  Fully dynamic memory management has=
 a huge cost
> > > > > > in complexity that pinning everything avoids.  Furthermore, thi=
s avoids the
> > > > > > host having to take action in response to guest memory reclaim =
requests.
> > > > > > This avoids additional complexity (and thus attack surface) on =
the host side.
> > > > > > Furthermore, since this is for ROCm and not for graphics, I am =
less concerned
> > > > > > about supporting systems that require swappable GPU VRAM.
> > > > >=20
> > > > > Hi Sima and Demi,
> > > > >=20
> > > > > I totally agree the flag FOLL_LONGTERM is needed, I will add it i=
n next
> > > > > version.
> > > > >=20
> > > > > And for the first pin variants implementation, the MMU notifier i=
s also
> > > > > needed I think.Cause the userptr feature in UMD generally used li=
ke this:
> > > > > the registering of userptr always is explicitly invoked by user c=
ode like
> > > > > "registerMemoryToGPU(userptrAddr, ...)", but for the userptr rele=
ase/free,
> > > > > there is no explicit API for it, at least in hsakmt/KFD stack. Us=
er just
> > > > > need call system call "free(userptrAddr)", then kernel driver wil=
l release
> > > > > the userptr by MMU notifier callback.Virtio-GPU has no other way =
to know if
> > > > > user has been free the userptr except for MMU notifior.And in UMD=
 theres is
> > > > > no way to get the free() operation is invoked by user.The only wa=
y is use
> > > > > MMU notifier in virtio-GPU driver and free the corresponding data=
 in host by
> > > > > some virtio CMDs as far as I can see.
> > > > >=20
> > > > > And for the second way that is use hmm_range_fault, there is a pr=
edictable
> > > > > issues as far as I can see, at least in hsakmt/KFD stack. That is=
 the memory
> > > > > may migrate when GPU/device is working. In bare metal, when memor=
y is
> > > > > migrating KFD driver will pause the compute work of the device in
> > > > > mmap_wirte_lock then use hmm_range_fault to remap the migrated/ev=
icted
> > > > > memories to GPU then restore the compute work of device to ensure=
 the
> > > > > correction of the data. But in virtio-GPU driver the migration ha=
ppen in
> > > > > guest kernel, the evict mmu notifier callback happens in guest, a=
 virtio CMD
> > > > > can be used for notify host but as lack of mmap_write_lock protec=
tion in
> > > > > host kernel, host will hold invalid data for a short period of ti=
me, this
> > > > > may lead to some issues. And it is hard to fix as far as I can se=
e.
> > > > >=20
> > > > > I will extract some APIs into helper according to your request, a=
nd I will
> > > > > refactor the whole userptr implementation, use some callbacks in =
page
> > > > > getting path, let the pin method and hmm_range_fault can be choic=
ed
> > > > > in this series patches.
> > > >=20
> > > > Ok, so if this is for svm, then you need full blast hmm, or the sem=
antics
> > > > are buggy. You cannot fake svm with pin(FOLL_LONGTERM) userptr, thi=
s does
> > > > not work.
> > > >=20
> > > > The other option is that hsakmt/kfd api is completely busted, and t=
hat's
> > > > kinda not a kernel problem.
> > > > -Sima
> > >=20
> > > On further thought, I believe the driver needs to migrate the pages to
> > > device memory (really a virtio-GPU blob object) *and* take a FOLL_LON=
GTERM
> > > pin on them.  The reason is that it isn=E2=80=99t possible to migrate=
 these pages
> > > back to "host" memory without unmapping them from the GPU.  For the r=
easons
> > > I mention in [1], I believe that temporarily revoking access to virti=
o-GPU
> > > blob objects is not feasible.  Instead, the pages must be treated as =
if
> > > they are permanently in device memory until guest userspace unmaps th=
em
> > > from the GPU, after which they must be migrated back to host memory.
> >=20
> > Discussion on IRC indicates that migration isn't reliable.  This is
> > because Linux core memory management is largely lock-free for
> > performance reasons, so there is no way to prevent temporary elevation
> > of a page's reference count.  A page with an elevated reference count
> > cannot be migrated.
> >=20
> > The only alternative I can think of is for the hypervisor to perform the
> > migration.  The hypervisor can revoke the guest's access to the page
> > without the guest's consent or involvement.  The host can then replace
> > the page with one of its own pages, which might be on the CPU or GPU.
> > Further migration between the CPU and GPU is controlled by the host
> > kernel-mode driver (KMD) and host kernel memory management.  The guest
> > kernel driver must take a FOLL_LONGTERM pin before telling the host to
> > use the pages, but that is all.
> >=20
> > On KVM, this should be essentially automatic, as guest memory really is
> > just host userspace memory.  On Xen, this requires that the backend
> > domain can revoke fronted access to _any_ frontend page, or at least
> > frontend pages that have been granted to the backend.  The backend will
> > then need to be able to handle page faults for the frontend pages, and
> > replace the frontend pages with its own pages at will.  Furthermore,
> > revoking pages that the backend has installed into the frontend must
> > never fail, because the backend will panic if it does fail.
> >=20
> > Sima, is putting guest pages under host kernel control the only option?
> > I thought that this could be avoided by leaving the pages on the CPU if
> > migration fails, but that won't work because there will be no way to
> > migrate them to the GPU later, causing performance problems that would
> > be impossible to debug.  Is waiting (possibly forever) on migration to
> > finish an option?  Otherwise, this might mean extra complexity in the
> > Xen hypervisor, as I do not believe the primitives needed are currently
> > available.  Specifically, in addition to the primitives discussed at Xen
> > Project Summit 2024, the backend also needs to intercept access to, and
> > replace the contents of, arbitrary frontend-controlled pages.
>=20
> Hi Demi,
>=20
> I agree that to achieve the complete SVM feature in virtio-GPU, it is
> necessary to have the hypervisor deeply involved and add new features.
> It needs solid design, I saw the detailed reply in a another thread, it
> is very helpful,looking forward to the response from the Xen/hypervisor
> experts.

=46rom further discussion with Sima, I suspect that virtio-GPU cannot
support SVM with reasonable performance.  Native contexts have such good
performance for graphics workloads because graphics workloads very rarely
perform blocking waits for host GPU operations to complete, so one can
make all frequently-used operations asynchronous and therefore hide the
guest <=3D> host latency.  SVM seems to require many synchronous GPU
operations, and I believe those will severely harm performance with
virtio-GPU.

If you need full SVM for your workloads, I recommend using hardware
SR-IOV.  This should allow the guest to perform GPU virtual memory
operations without host involvement, which I expect will be much faster
than paravirtualizing these operations.  Scalable I/O virtualization
might also work, but it might also require paravirtualizing the
performance-critical address-space operations unless the hardware has
stage 2 translation tables.

> So for the current virito-GPU userptr implementation, It can not support =
the
> full SVM feature, it just can only let GPU access the user space memory,
> maybe can be called by userptr feature. I think I will finish this small
> part firstly and then to try to complete the whole SVM feature.

I think you will still have problems if the host is able to migrate
pages in any way.  This requires that the host install an MMU notifier
for the pages it has received from the guest, which in turn implies that
the host must be able to prevent the guest from accessing the pages.
If the pages are used in grant table operations, this isn't possible.

If you are willing to have the pages be pinned on the host side things
are much simpler.  Such pages will always be in system memory, and will
never be able to migrate to VRAM.  This will result in a performance
penalty and will likely require explicit prefetching by programs using
ROCm, but this may be acceptable for your use-cases.  The performance
penalty is the same as that with XNACK disabled, which is the case for
all RDNA2+ GPUs, so all code that aims to be portable to recent consumer
hardware will have to account for it anyway.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--Wy7U6lvUah8lMeg3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmek/ZEACgkQszaHOrMp
8lNGXw/+JUcT/GOzV8A1jCU1gkU9B3O6PrKXJSBccmciRNQBRhG/MkAFmCJW3Ygs
aGnDjn1AxkaMpbgBi0Wo8nI0mAcs1WCKk4G98qIno6CoIFLB76mqA6x/6bI/atZO
TP9lnrd6ERZrnmDobjxujKOP2pgXAKGX07xJWrPbUioi/BgDlSXShU0/Qs9o2jp5
egERRdAi2CPDEQXPw8KKT6Agonl8IQNm1JHmknUeUFlIEkyDxRtdSISCYycCRir7
zS44mhQDAfuL4jR0m3nOu9PUFjJdHdzssFiX1qAhdE1lZLu6aJWFpoTACqL1hYJf
6sMv+VC6H+thwDXSUgvPepNYrwyS4kDKRWxfMV2JW0zoR8XVaXG4Y5gnNpClwz4I
xIYqxmXUSWS9yPRL/MjtdrmrFqAhUY3YhxZ1PKE2KoEeNDqlkxPqJbAiBy5sNFDF
OYRCprX1HWWcK76WAn1ZseV5V/pXMM1wYZ5iiIQd0Z2f5T4AE/u7mb5EQT8ZNiNv
VNONuV9FMjcWqIEOcKsaVjYwHYT7CkWsoOw4R5zncapWzh4pK+1T8TQtQjwZG5os
YkZxR8//nYf5eRUfWtSq3OsQdC4lxQBCi3xFDCOTqmu8E/FbJ9JY5vzOjr0NDrsa
qtnwJbThJPqTXFvBQQ+luTLEo8tgLhsChI35gfQGv8fylU0Zc7o=
=tP4G
-----END PGP SIGNATURE-----

--Wy7U6lvUah8lMeg3--
