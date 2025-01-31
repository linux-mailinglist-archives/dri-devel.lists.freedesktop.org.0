Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C13F4A2384F
	for <lists+dri-devel@lfdr.de>; Fri, 31 Jan 2025 01:41:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5989210EA01;
	Fri, 31 Jan 2025 00:41:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="fBvWEqNn";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="ukhYcM46";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 442 seconds by postgrey-1.36 at gabe;
 Fri, 31 Jan 2025 00:41:09 UTC
Received: from fout-b4-smtp.messagingengine.com
 (fout-b4-smtp.messagingengine.com [202.12.124.147])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D37910EA01
 for <dri-devel@lists.freedesktop.org>; Fri, 31 Jan 2025 00:41:09 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfout.stl.internal (Postfix) with ESMTP id 63355114015D;
 Thu, 30 Jan 2025 19:33:46 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Thu, 30 Jan 2025 19:33:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:content-type:content-type:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1738283626;
 x=1738370026; bh=j99SJx9+IyZ7/r4OezmfhlavbnB02Ja7JSF+YJce3E0=; b=
 fBvWEqNn3MrBQ97NnULtQxdiecq+Gb+3/PQbbJgjGP9Oj/2spdqMC6rYQ9hsgMRv
 0Iwxxd/VZqqzzuaIadQ49dTCeyGCYAqNhUqBoDPiyelqNqQJYQx0s3bwD8GyNqVb
 PjVUn+QUcBuBA54Lr6lwo1h63+6m2nCb2KvoqG2JUnD72Q+wkAVXRfIcOUn53sIZ
 LAAIRYVZewWomimIxPCBviSXVSIHNwurPGnov/9NvX9bgj4jcIMyeN3BZ7+gUJDl
 /fHS397ubeg0cjOj07jeuw9HFX0zG9ZhuLn6H4QtPLttdFmtWIbRN7Vr+knDXejq
 uClXpbh7hcxYeP/liBmpBg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1738283626; x=1738370026; bh=j99SJx9+IyZ7/r4OezmfhlavbnB02Ja7JSF
 +YJce3E0=; b=ukhYcM462h0Yyo5L/vjDR4BlFkf23xJOmGi6reGlSAdN6WQdCFm
 ve6k9AiPziSvn7UwjoaP4ZuTjc4ZsQc7jvH3uTCVX+Jz5+l7cVloKyzG1HGiP52f
 GhF0hjQhpRWV/WzIx8IXmVBagnRpxoc2GP7XgTIm3ZEe9Zboewn7QOgJo0AIPWms
 tVPHBqn+dKkiHMCHuf0oUkF08OS/pAe4lcvekPB6MJ3IFN1Dl+/yhDA7gAYD7MqD
 jHm4Rds3hp7uCESVeAElD8GAlwjlsH9oUWI1jETAGuuzEEei9MAPqjfehyR4w+e0
 0ham+c9HxyMKMM/TloJLuhjLgHdDWSRcCUQ==
X-ME-Sender: <xms:aRqcZ0MVWJjDOhA6w8yXek5zvl-ORa3WWrUa4XsxZc36yXrKNfAkUg>
 <xme:aRqcZ69bVfwEKpRuUMAqCEBWm0bs4c3rlNc_n2xvzHH4sgD8j-YPsxUxjeEzsn-08
 dEHQzlG1vkCwvg>
X-ME-Received: <xmr:aRqcZ7Sba18NnKiQVem16eIihmKJrMzbK_cGsO374AImA2UpJ3sl5hLcr_Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdejfedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
 rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
 htshculddquddttddmnecujfgurhepfffhvffukfhfgggtuggjsehgtderredttdejnecu
 hfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvhhish
 hisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedttedtueei
 vdefiedugfejtdeutdelfedvueekledtudegjedviedukeefhfeuteenucevlhhushhtvg
 hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhishhi
 sghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopedukedpmhhouggvpe
 hsmhhtphhouhhtpdhrtghpthhtohepuggvmhhiohgsvghnohhurhesghhmrghilhdrtgho
 mhdprhgtphhtthhopehhohhnghhlvghiuddrhhhurghnghesrghmugdrtghomhdprhgtph
 htthhopehrrgihrdhhuhgrnhhgsegrmhgurdgtohhmpdhrtghpthhtohepvhhirhhtuhgr
 lhhiiigrthhiohhnsehlihhsthhsrdhlihhnuhigqdhfohhunhgurghtihhonhdrohhrgh
 dprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhr
 ghdprhgtphhtthhopegumhhithhrhidrohhsihhpvghnkhhosegtohhllhgrsghorhgrrd
 gtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhk
 thhophdrohhrghdprhgtphhtthhopegrihhrlhhivggusehrvgguhhgrthdrtghomhdprh
 gtphhtthhopehkrhgrgigvlhesrhgvughhrghtrdgtohhm
X-ME-Proxy: <xmx:aRqcZ8tviDV2fH_Fig7gZuvUTO-Q2ol4AzOWoGY6D7TyyDHDWINsPQ>
 <xmx:aRqcZ8e_77SMnr4hQcFkljV16wDIKgv2sZp6rruj-cfLrMVFShP_6w>
 <xmx:aRqcZw0OvE4Bz0ERm413AjBj7Mxs2Yjx4z57hqQB8DctU261M1TGrg>
 <xmx:aRqcZw87SycT_jcUZzUq_ZJ3fHdctwdGyN8z3rV_RtJajO_jZOXOYw>
 <xmx:ahqcZ_VIDfYVUxJV9L-zEswUlE7cRIvQCdphyjywN14hUKE26-B8UQea>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 30 Jan 2025 19:33:44 -0500 (EST)
Date: Thu, 30 Jan 2025 19:33:37 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>,
 "Huang, Honglei1" <Honglei1.Huang@amd.com>, Huang Rui <ray.huang@amd.com>,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 Lingshan Zhu <Lingshan.Zhu@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 Kernel KVM virtualization development <kvm@vger.kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
Message-ID: <Z5waZsddenagCYtl@itl-email>
References: <20241220100409.4007346-1-honglei1.huang@amd.com>
 <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
 <Z36wV07M8B_wgWPl@phenom.ffwll.local>
 <c42ae4f7-f5f4-4906-85aa-b049ed44d7e9@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="9QyKV9EEhg0eMfJA"
Content-Disposition: inline
In-Reply-To: <c42ae4f7-f5f4-4906-85aa-b049ed44d7e9@gmail.com>
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


--9QyKV9EEhg0eMfJA
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jan 2025 19:33:37 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: Demi Marie Obenour <demiobenour@gmail.com>,
	"Huang, Honglei1" <Honglei1.Huang@amd.com>,
	Huang Rui <ray.huang@amd.com>,
	virtualization@lists.linux-foundation.org,
	linux-kernel@vger.kernel.org,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	dri-devel@lists.freedesktop.org, David Airlie <airlied@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Lingshan Zhu <Lingshan.Zhu@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Kernel KVM virtualization development <kvm@vger.kernel.org>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Stefano Stabellini <stefano.stabellini@amd.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource
 object

On Wed, Jan 29, 2025 at 03:54:59PM -0500, Demi Marie Obenour wrote:
> On 1/8/25 12:05 PM, Simona Vetter wrote:
> > On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1 wrote:
> >>
> >> On 2024/12/22 9:59, Demi Marie Obenour wrote:
> >>> On 12/20/24 10:35 AM, Simona Vetter wrote:
> >>>> On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang wrote:
> >>>>> From: Honglei Huang <Honglei1.Huang@amd.com>
> >>>>>
> >>>>> A virtio-gpu userptr is based on HMM notifier.
> >>>>> Used for let host access guest userspace memory and
> >>>>> notice the change of userspace memory.
> >>>>> This series patches are in very beginning state,
> >>>>> User space are pinned currently to ensure the host
> >>>>> device memory operations are correct.
> >>>>> The free and unmap operations for userspace can be
> >>>>> handled by MMU notifier this is a simple and basice
> >>>>> SVM feature for this series patches.
> >>>>> The physical PFNS update operations is splited into
> >>>>> two OPs in here. The evicted memories won't be used
> >>>>> anymore but remap into host again to achieve same
> >>>>> effect with hmm_rang_fault.
> >>>>
> >>>> So in my opinion there are two ways to implement userptr that make s=
ense:
> >>>>
> >>>> - pinned userptr with pin_user_pages(FOLL_LONGTERM). there is not mmu
> >>>>    notifier
> >>>>
> >>>> - unpinnned userptr where you entirely rely on userptr and do not ho=
ld any
> >>>>    page references or page pins at all, for full SVM integration. Th=
is
> >>>>    should use hmm_range_fault ideally, since that's the version that
> >>>>    doesn't ever grab any page reference pins.
> >>>>
> >>>> All the in-between variants are imo really bad hacks, whether they h=
old a
> >>>> page reference or a temporary page pin (which seems to be what you're
> >>>> doing here). In much older kernels there was some justification for =
them,
> >>>> because strange stuff happened over fork(), but with FOLL_LONGTERM t=
his is
> >>>> now all sorted out. So there's really only fully pinned, or true svm=
 left
> >>>> as clean design choices imo.
> >>>>
> >>>> With that background, why does pin_user_pages(FOLL_LONGTERM) not wor=
k for
> >>>> you?
> >>>
> >>> +1 on using FOLL_LONGTERM.  Fully dynamic memory management has a hug=
e cost
> >>> in complexity that pinning everything avoids.  Furthermore, this avoi=
ds the
> >>> host having to take action in response to guest memory reclaim reques=
ts.
> >>> This avoids additional complexity (and thus attack surface) on the ho=
st side.
> >>> Furthermore, since this is for ROCm and not for graphics, I am less c=
oncerned
> >>> about supporting systems that require swappable GPU VRAM.
> >>
> >> Hi Sima and Demi,
> >>
> >> I totally agree the flag FOLL_LONGTERM is needed, I will add it in next
> >> version.
> >>
> >> And for the first pin variants implementation, the MMU notifier is also
> >> needed I think.Cause the userptr feature in UMD generally used like th=
is:
> >> the registering of userptr always is explicitly invoked by user code l=
ike
> >> "registerMemoryToGPU(userptrAddr, ...)", but for the userptr release/f=
ree,
> >> there is no explicit API for it, at least in hsakmt/KFD stack. User ju=
st
> >> need call system call "free(userptrAddr)", then kernel driver will rel=
ease
> >> the userptr by MMU notifier callback.Virtio-GPU has no other way to kn=
ow if
> >> user has been free the userptr except for MMU notifior.And in UMD ther=
es is
> >> no way to get the free() operation is invoked by user.The only way is =
use
> >> MMU notifier in virtio-GPU driver and free the corresponding data in h=
ost by
> >> some virtio CMDs as far as I can see.
> >>
> >> And for the second way that is use hmm_range_fault, there is a predict=
able
> >> issues as far as I can see, at least in hsakmt/KFD stack. That is the =
memory
> >> may migrate when GPU/device is working. In bare metal, when memory is
> >> migrating KFD driver will pause the compute work of the device in
> >> mmap_wirte_lock then use hmm_range_fault to remap the migrated/evicted
> >> memories to GPU then restore the compute work of device to ensure the
> >> correction of the data. But in virtio-GPU driver the migration happen =
in
> >> guest kernel, the evict mmu notifier callback happens in guest, a virt=
io CMD
> >> can be used for notify host but as lack of mmap_write_lock protection =
in
> >> host kernel, host will hold invalid data for a short period of time, t=
his
> >> may lead to some issues. And it is hard to fix as far as I can see.
> >>
> >> I will extract some APIs into helper according to your request, and I =
will
> >> refactor the whole userptr implementation, use some callbacks in page
> >> getting path, let the pin method and hmm_range_fault can be choiced
> >> in this series patches.
> >=20
> > Ok, so if this is for svm, then you need full blast hmm, or the semanti=
cs
> > are buggy. You cannot fake svm with pin(FOLL_LONGTERM) userptr, this do=
es
> > not work.
> >=20
> > The other option is that hsakmt/kfd api is completely busted, and that's
> > kinda not a kernel problem.
> > -Sima
>=20
> On further thought, I believe the driver needs to migrate the pages to
> device memory (really a virtio-GPU blob object) *and* take a FOLL_LONGTERM
> pin on them.  The reason is that it isn=E2=80=99t possible to migrate the=
se pages
> back to "host" memory without unmapping them from the GPU.  For the reaso=
ns
> I mention in [1], I believe that temporarily revoking access to virtio-GPU
> blob objects is not feasible.  Instead, the pages must be treated as if
> they are permanently in device memory until guest userspace unmaps them
> from the GPU, after which they must be migrated back to host memory.

Discussion on IRC indicates that migration isn't reliable.  This is
because Linux core memory management is largely lock-free for
performance reasons, so there is no way to prevent temporary elevation
of a page's reference count.  A page with an elevated reference count
cannot be migrated.

The only alternative I can think of is for the hypervisor to perform the
migration.  The hypervisor can revoke the guest's access to the page
without the guest's consent or involvement.  The host can then replace
the page with one of its own pages, which might be on the CPU or GPU.
Further migration between the CPU and GPU is controlled by the host
kernel-mode driver (KMD) and host kernel memory management.  The guest
kernel driver must take a FOLL_LONGTERM pin before telling the host to
use the pages, but that is all.

On KVM, this should be essentially automatic, as guest memory really is
just host userspace memory.  On Xen, this requires that the backend
domain can revoke fronted access to _any_ frontend page, or at least
frontend pages that have been granted to the backend.  The backend will
then need to be able to handle page faults for the frontend pages, and
replace the frontend pages with its own pages at will.  Furthermore,
revoking pages that the backend has installed into the frontend must
never fail, because the backend will panic if it does fail.

Sima, is putting guest pages under host kernel control the only option?
I thought that this could be avoided by leaving the pages on the CPU if
migration fails, but that won't work because there will be no way to
migrate them to the GPU later, causing performance problems that would
be impossible to debug.  Is waiting (possibly forever) on migration to
finish an option?  Otherwise, this might mean extra complexity in the
Xen hypervisor, as I do not believe the primitives needed are currently
available.  Specifically, in addition to the primitives discussed at Xen
Project Summit 2024, the backend also needs to intercept access to, and
replace the contents of, arbitrary frontend-controlled pages.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--9QyKV9EEhg0eMfJA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmecGmEACgkQszaHOrMp
8lMt/w/9EultembzZOpL8oYFzpDKH4QFhJkkcONDqVqYYE5kH122Mqj5GsprGGW0
FqvHAgK5Qk/W+zz9LQrk+P6WEwJhP0XIo/TKJfSCOXqK6pEqwyZ8OPk1nHAiPli/
D7bm3ocsg69tYGoLsCylZehwUe87ATZZ43KVsh+bf1h+lRHONd8yOs46nSzJuxzl
zEOI373RpZVKzpRx3HQfyzS9oALVzvdyGzeX+1n3AmQyDbZtjs4ZInyyng4ruArL
viZtevqVe6boeeemKkZaGtGOzaiVZAmwX3PjTNXbIygsogzscCrMUfL3ZOYbg9D/
P18aWdQEu5f7+Vt5PL4sOfY6AsmArvlwAKWVQdmpk8eTTuW6fDk0651ogKcNFiV9
cgCJhv5SBa/hoas8i4nj2pl58AdfjaZFGtdXsEuKzQ2D7N6LivWZGOsbwfK+NVdT
AdzfuyH0M41tQw0Oy57NmnnbnC7clqk1wn8UTTSfxmtFWCVhBoMx25WgIK/fGUvp
JOHj+9q/MfD0A+dY0jng45Y8Kf7saNMMWmpmT0NNoAAnNWZzSJgO7+2IHjjd6DTn
K07huXex3wpOxtBnd42TWMb5fxiwtU48XhGRz7ZNyhPlakaK/ZKjJX8bE2WrLOrA
bAwm93etZnI91f08VSApkuYCYUCAh8nk/k6GDDdAkvWTWfsJ09w=
=U2FS
-----END PGP SIGNATURE-----

--9QyKV9EEhg0eMfJA--
