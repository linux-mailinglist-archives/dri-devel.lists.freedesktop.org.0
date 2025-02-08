Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1BEA2D860
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 20:48:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D29910E010;
	Sat,  8 Feb 2025 19:48:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="PhmBlHuu";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="z5LJNMlc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b6-smtp.messagingengine.com
 (fhigh-b6-smtp.messagingengine.com [202.12.124.157])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3962410E010
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 19:48:03 +0000 (UTC)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal
 [10.202.2.49])
 by mailfhigh.stl.internal (Postfix) with ESMTP id E1EC525400E6;
 Sat,  8 Feb 2025 14:48:01 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-09.internal (MEProxy); Sat, 08 Feb 2025 14:48:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1739044081;
 x=1739130481; bh=20EPH6IeHOH2WSDyvs9rsz5ETovIVwAvKxXT0313V/c=; b=
 PhmBlHuuU6UNMYyWk3YsVOqHBx6X6b1qz1+xRKXkIk9RL/EqnRXsurCICQKu3zDx
 UhDd7yHlw1nwIlRsj8JST8yKs8sb7FVoSwPkNHeMppGZMgOltCkEf9EO3B3nhTU4
 CNTeB0aKQwc/uq+WXHR7o1pHpqyGIp0Zcb8STnngha6yYVhxp9cK5R6IGkDJICGj
 117NNph1vVolZtxeMvjmThgv4bczVhG5sQsNFPtMOsK06A+Yf5CIxZ2S38/ANQcK
 5KU6EsvL7Zi7eCDFfgj+1CxY28RJ3O3/4INuLChTMHHCKLBoJg5t9rANZHlsw9Jz
 5b7afz62RsrVBViiabH9lg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1739044081; x=1739130481; bh=20EPH6IeHOH2WSDyvs9rsz5ETovIVwAvKxX
 T0313V/c=; b=z5LJNMlcS+7fREvUcDvTfcWu9jn3ttoN1fAP9TOz3lzYKIBSsnD
 6I+QX80Olx5pugS9I/fT8My8n2ghObUN9Z7O1qHX42WQD99uONmKHfkZk50Ej9DW
 xl9z2drZgu03VIEF74sVjhbeZQFZIIChNQTfm2drlg46q9n5f+gLKa+c0SKrA1i7
 84sREIox6oKxJduJwZjfpp/oFMYlStKWSmoj38QdW6O1HGs0b4+0iyPWe83tsaRN
 yA9wJrOMYieGeBHJAlB+CqGlhOgzvm648pHl81/y9yRYBs4orWA8ALQm/9JP9jdr
 g6H1yLYnIOk9LW50wWpi63JPr8iWguVlxCA==
X-ME-Sender: <xms:8LSnZ4RweAuG6_7JTYYK8B7xrNSrBPBHt_Cxm-YXXWWjBHToHRyqww>
 <xme:8LSnZ1ycBJEbPgR-mogpClckIos_SD93xpT2sH7km8CkHyuQCwN5XhJELykZZuXQn
 0MZIh5-j89d-98>
X-ME-Received: <xmr:8LSnZ12Tocfz04JY2RzKb1dImGXE8kGu0y6XsCacSHF1Fbj-4JUdcOp_Q9Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeffedutdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeelfeej
 ueekheekgeeitdegkeekleetvdfhuddufefgffehffehueevvdeileefhfenucffohhmrg
 hinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghm
 pehmrghilhhfrhhomhepuggvmhhisehinhhvihhsihgslhgvthhhihhnghhslhgrsgdrtg
 homhdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
 pehhohhnghhlvghiuddrhhhurghnghesrghmugdrtghomhdprhgtphhtthhopeguvghmih
 hosggvnhhouhhrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprhgrhidrhhhurghnghes
 rghmugdrtghomhdprhgtphhtthhopehsthgvfhgrnhhordhsthgrsggvlhhlihhnihesrg
 hmugdrtghomhdprhgtphhtthhopehvihhrthhurghlihiirghtihhonheslhhishhtshdr
 lhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhhinhhugidqkh
 gvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghirhhlihgv
 ugesrhgvughhrghtrdgtohhmpdhrtghpthhtohepughrihdquggvvhgvlheslhhishhtsh
 drfhhrvggvuggvshhkthhophdrohhrghdprhgtphhtthhopegumhhithhrhidrohhsihhp
 vghnkhhosegtohhllhgrsghorhgrrdgtohhm
X-ME-Proxy: <xmx:8LSnZ8C40O7XXgwqBNEX3aFbWEqX_MrLW5Bp_Hvnp4646HG0X4RTDQ>
 <xmx:8LSnZxjuHkKttrRcq0P7OjUUivVpp-Yig8ZjT7_w60Lh5sfWl61EFw>
 <xmx:8LSnZ4qMG8C-EpEQYLf2p8EmHabEiZ1EPFKlpYuPNAoKUaDEjDphZQ>
 <xmx:8LSnZ0hk1DmYLscnzgkyRUhIhlej0sAcmM2prvi6vRZWZDRY3a3XlA>
 <xmx:8bSnZ23WQ-0e_NyMI-iti4ZDBmMIrm4aFmjNeXKrNLgRv_q_AscvSRP1>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 8 Feb 2025 14:48:00 -0500 (EST)
Date: Sat, 8 Feb 2025 14:47:54 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
 "Huang, Ray" <Ray.Huang@amd.com>,
 "Stabellini, Stefano" <stefano.stabellini@amd.com>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 David Airlie <airlied@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Chia-I Wu <olvaffe@gmail.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 "Zhu, Lingshan" <Lingshan.Zhu@amd.com>,
 Xen developer discussion <xen-devel@lists.xenproject.org>,
 Kernel KVM virtualization development <kvm@vger.kernel.org>,
 Xenia Ragiadakou <burzalodowa@gmail.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
Message-ID: <Z6e07Y13dXr1XIWW@itl-email>
References: <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
 <Z36wV07M8B_wgWPl@phenom.ffwll.local>
 <c42ae4f7-f5f4-4906-85aa-b049ed44d7e9@gmail.com>
 <Z5waZsddenagCYtl@itl-email>
 <7b0bf2d5-700a-4cc7-b410-a9b2e2083b5d@amd.com>
 <Z6T9lDSj8Y9ATE3k@itl-email>
 <b5cf2939-5853-4c1f-90eb-68f281106f86@amd.com>
 <Z6a_URD8n72F2E41@itl-email> <Z6bEuc6XW_0hFcyS@itl-email>
 <d259279c-9989-410f-907d-9bf0b318bc84@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="N7UYG+NykaBDAK3r"
Content-Disposition: inline
In-Reply-To: <d259279c-9989-410f-907d-9bf0b318bc84@amd.com>
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


--N7UYG+NykaBDAK3r
Content-Type: text/plain; charset=utf-8; protected-headers=v1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Sat, 8 Feb 2025 14:47:54 -0500
From: Demi Marie Obenour <demi@invisiblethingslab.com>
To: "Huang, Honglei1" <Honglei1.Huang@amd.com>
Cc: Demi Marie Obenour <demiobenour@gmail.com>,
	"Huang, Ray" <Ray.Huang@amd.com>,
	"Stabellini, Stefano" <stefano.stabellini@amd.com>,
	"virtualization@lists.linux-foundation.org" <virtualization@lists.linux-foundation.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	David Airlie <airlied@redhat.com>,
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
	Dmitry Osipenko <dmitry.osipenko@collabora.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Chia-I Wu <olvaffe@gmail.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	"Zhu, Lingshan" <Lingshan.Zhu@amd.com>,
	Xen developer discussion <xen-devel@lists.xenproject.org>,
	Kernel KVM virtualization development <kvm@vger.kernel.org>,
	Xenia Ragiadakou <burzalodowa@gmail.com>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource
 object

On Sat, Feb 08, 2025 at 05:44:14PM +0800, Huang, Honglei1 wrote:
> On 2025/2/8 10:43, Demi Marie Obenour wrote:
> > On Fri, Feb 07, 2025 at 09:30:45PM -0500, Demi Marie Obenour wrote:
> > > On Fri, Feb 07, 2025 at 07:07:11PM +0800, Huang, Honglei1 wrote:
> > > > On 2025/2/7 2:21, Demi Marie Obenour wrote:
> > > > > On Thu, Feb 06, 2025 at 06:53:55PM +0800, Huang, Honglei1 wrote:
> > > > > > On 2025/1/31 8:33, Demi Marie Obenour wrote:
> > > > > > > On Wed, Jan 29, 2025 at 03:54:59PM -0500, Demi Marie Obenour =
wrote:
> > > > > > > > On 1/8/25 12:05 PM, Simona Vetter wrote:
> > > > > > > > > On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1=
 wrote:
> > > > > > > > > >=20
> > > > > > > > > > On 2024/12/22 9:59, Demi Marie Obenour wrote:
> > > > > > > > > > > On 12/20/24 10:35 AM, Simona Vetter wrote:
> > > > > > > > > > > > On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei H=
uang wrote:
> > > > > > > > > > > > > From: Honglei Huang <Honglei1.Huang@amd.com>
> > > > > > > > > > > > >=20
> > > > > > > > > > > > > A virtio-gpu userptr is based on HMM notifier.
> > > > > > > > > > > > > Used for let host access guest userspace memory a=
nd
> > > > > > > > > > > > > notice the change of userspace memory.
> > > > > > > > > > > > > This series patches are in very beginning state,
> > > > > > > > > > > > > User space are pinned currently to ensure the host
> > > > > > > > > > > > > device memory operations are correct.
> > > > > > > > > > > > > The free and unmap operations for userspace can be
> > > > > > > > > > > > > handled by MMU notifier this is a simple and basi=
ce
> > > > > > > > > > > > > SVM feature for this series patches.
> > > > > > > > > > > > > The physical PFNS update operations is splited in=
to
> > > > > > > > > > > > > two OPs in here. The evicted memories won't be us=
ed
> > > > > > > > > > > > > anymore but remap into host again to achieve same
> > > > > > > > > > > > > effect with hmm_rang_fault.
> > > > > > > > > > > >=20
> > > > > > > > > > > > So in my opinion there are two ways to implement us=
erptr that make sense:
> > > > > > > > > > > >=20
> > > > > > > > > > > > - pinned userptr with pin_user_pages(FOLL_LONGTERM)=
=2E there is not mmu
> > > > > > > > > > > >       notifier
> > > > > > > > > > > >=20
> > > > > > > > > > > > - unpinnned userptr where you entirely rely on user=
ptr and do not hold any
> > > > > > > > > > > >       page references or page pins at all, for full=
 SVM integration. This
> > > > > > > > > > > >       should use hmm_range_fault ideally, since tha=
t's the version that
> > > > > > > > > > > >       doesn't ever grab any page reference pins.
> > > > > > > > > > > >=20
> > > > > > > > > > > > All the in-between variants are imo really bad hack=
s, whether they hold a
> > > > > > > > > > > > page reference or a temporary page pin (which seems=
 to be what you're
> > > > > > > > > > > > doing here). In much older kernels there was some j=
ustification for them,
> > > > > > > > > > > > because strange stuff happened over fork(), but wit=
h FOLL_LONGTERM this is
> > > > > > > > > > > > now all sorted out. So there's really only fully pi=
nned, or true svm left
> > > > > > > > > > > > as clean design choices imo.
> > > > > > > > > > > >=20
> > > > > > > > > > > > With that background, why does pin_user_pages(FOLL_=
LONGTERM) not work for
> > > > > > > > > > > > you?
> > > > > > > > > > >=20
> > > > > > > > > > > +1 on using FOLL_LONGTERM.  Fully dynamic memory mana=
gement has a huge cost
> > > > > > > > > > > in complexity that pinning everything avoids.  Furthe=
rmore, this avoids the
> > > > > > > > > > > host having to take action in response to guest memor=
y reclaim requests.
> > > > > > > > > > > This avoids additional complexity (and thus attack su=
rface) on the host side.
> > > > > > > > > > > Furthermore, since this is for ROCm and not for graph=
ics, I am less concerned
> > > > > > > > > > > about supporting systems that require swappable GPU V=
RAM.
> > > > > > > > > >=20
> > > > > > > > > > Hi Sima and Demi,
> > > > > > > > > >=20
> > > > > > > > > > I totally agree the flag FOLL_LONGTERM is needed, I wil=
l add it in next
> > > > > > > > > > version.
> > > > > > > > > >=20
> > > > > > > > > > And for the first pin variants implementation, the MMU =
notifier is also
> > > > > > > > > > needed I think.Cause the userptr feature in UMD general=
ly used like this:
> > > > > > > > > > the registering of userptr always is explicitly invoked=
 by user code like
> > > > > > > > > > "registerMemoryToGPU(userptrAddr, ...)", but for the us=
erptr release/free,
> > > > > > > > > > there is no explicit API for it, at least in hsakmt/KFD=
 stack. User just
> > > > > > > > > > need call system call "free(userptrAddr)", then kernel =
driver will release
> > > > > > > > > > the userptr by MMU notifier callback.Virtio-GPU has no =
other way to know if
> > > > > > > > > > user has been free the userptr except for MMU notifior.=
And in UMD theres is
> > > > > > > > > > no way to get the free() operation is invoked by user.T=
he only way is use
> > > > > > > > > > MMU notifier in virtio-GPU driver and free the correspo=
nding data in host by
> > > > > > > > > > some virtio CMDs as far as I can see.
> > > > > > > > > >=20
> > > > > > > > > > And for the second way that is use hmm_range_fault, the=
re is a predictable
> > > > > > > > > > issues as far as I can see, at least in hsakmt/KFD stac=
k. That is the memory
> > > > > > > > > > may migrate when GPU/device is working. In bare metal, =
when memory is
> > > > > > > > > > migrating KFD driver will pause the compute work of the=
 device in
> > > > > > > > > > mmap_wirte_lock then use hmm_range_fault to remap the m=
igrated/evicted
> > > > > > > > > > memories to GPU then restore the compute work of device=
 to ensure the
> > > > > > > > > > correction of the data. But in virtio-GPU driver the mi=
gration happen in
> > > > > > > > > > guest kernel, the evict mmu notifier callback happens i=
n guest, a virtio CMD
> > > > > > > > > > can be used for notify host but as lack of mmap_write_l=
ock protection in
> > > > > > > > > > host kernel, host will hold invalid data for a short pe=
riod of time, this
> > > > > > > > > > may lead to some issues. And it is hard to fix as far a=
s I can see.
> > > > > > > > > >=20
> > > > > > > > > > I will extract some APIs into helper according to your =
request, and I will
> > > > > > > > > > refactor the whole userptr implementation, use some cal=
lbacks in page
> > > > > > > > > > getting path, let the pin method and hmm_range_fault ca=
n be choiced
> > > > > > > > > > in this series patches.
> > > > > > > > >=20
> > > > > > > > > Ok, so if this is for svm, then you need full blast hmm, =
or the semantics
> > > > > > > > > are buggy. You cannot fake svm with pin(FOLL_LONGTERM) us=
erptr, this does
> > > > > > > > > not work.
> > > > > > > > >=20
> > > > > > > > > The other option is that hsakmt/kfd api is completely bus=
ted, and that's
> > > > > > > > > kinda not a kernel problem.
> > > > > > > > > -Sima
> > > > > > > >=20
> > > > > > > > On further thought, I believe the driver needs to migrate t=
he pages to
> > > > > > > > device memory (really a virtio-GPU blob object) *and* take =
a FOLL_LONGTERM
> > > > > > > > pin on them.  The reason is that it isn=E2=80=99t possible =
to migrate these pages
> > > > > > > > back to "host" memory without unmapping them from the GPU. =
 For the reasons
> > > > > > > > I mention in [1], I believe that temporarily revoking acces=
s to virtio-GPU
> > > > > > > > blob objects is not feasible.  Instead, the pages must be t=
reated as if
> > > > > > > > they are permanently in device memory until guest userspace=
 unmaps them
> > > > > > > > from the GPU, after which they must be migrated back to hos=
t memory.
> > > > > > >=20
> > > > > > > Discussion on IRC indicates that migration isn't reliable.  T=
his is
> > > > > > > because Linux core memory management is largely lock-free for
> > > > > > > performance reasons, so there is no way to prevent temporary =
elevation
> > > > > > > of a page's reference count.  A page with an elevated referen=
ce count
> > > > > > > cannot be migrated.
> > > > > > >=20
> > > > > > > The only alternative I can think of is for the hypervisor to =
perform the
> > > > > > > migration.  The hypervisor can revoke the guest's access to t=
he page
> > > > > > > without the guest's consent or involvement.  The host can the=
n replace
> > > > > > > the page with one of its own pages, which might be on the CPU=
 or GPU.
> > > > > > > Further migration between the CPU and GPU is controlled by th=
e host
> > > > > > > kernel-mode driver (KMD) and host kernel memory management.  =
The guest
> > > > > > > kernel driver must take a FOLL_LONGTERM pin before telling th=
e host to
> > > > > > > use the pages, but that is all.
> > > > > > >=20
> > > > > > > On KVM, this should be essentially automatic, as guest memory=
 really is
> > > > > > > just host userspace memory.  On Xen, this requires that the b=
ackend
> > > > > > > domain can revoke fronted access to _any_ frontend page, or a=
t least
> > > > > > > frontend pages that have been granted to the backend.  The ba=
ckend will
> > > > > > > then need to be able to handle page faults for the frontend p=
ages, and
> > > > > > > replace the frontend pages with its own pages at will.  Furth=
ermore,
> > > > > > > revoking pages that the backend has installed into the fronte=
nd must
> > > > > > > never fail, because the backend will panic if it does fail.
> > > > > > >=20
> > > > > > > Sima, is putting guest pages under host kernel control the on=
ly option?
> > > > > > > I thought that this could be avoided by leaving the pages on =
the CPU if
> > > > > > > migration fails, but that won't work because there will be no=
 way to
> > > > > > > migrate them to the GPU later, causing performance problems t=
hat would
> > > > > > > be impossible to debug.  Is waiting (possibly forever) on mig=
ration to
> > > > > > > finish an option?  Otherwise, this might mean extra complexit=
y in the
> > > > > > > Xen hypervisor, as I do not believe the primitives needed are=
 currently
> > > > > > > available.  Specifically, in addition to the primitives discu=
ssed at Xen
> > > > > > > Project Summit 2024, the backend also needs to intercept acce=
ss to, and
> > > > > > > replace the contents of, arbitrary frontend-controlled pages.
> > > > > >=20
> > > > > > Hi Demi,
> > > > > >=20
> > > > > > I agree that to achieve the complete SVM feature in virtio-GPU,=
 it is
> > > > > > necessary to have the hypervisor deeply involved and add new fe=
atures.
> > > > > > It needs solid design, I saw the detailed reply in a another th=
read, it
> > > > > > is very helpful,looking forward to the response from the Xen/hy=
pervisor
> > > > > > experts.
> > > > >=20
> > > > >   From further discussion with Sima, I suspect that virtio-GPU ca=
nnot
> > > > > support SVM with reasonable performance.  Native contexts have su=
ch good
> > > > > performance for graphics workloads because graphics workloads ver=
y rarely
> > > > > perform blocking waits for host GPU operations to complete, so on=
e can
> > > > > make all frequently-used operations asynchronous and therefore hi=
de the
> > > > > guest <=3D> host latency.  SVM seems to require many synchronous =
GPU
> > > > > operations, and I believe those will severely harm performance wi=
th
> > > > > virtio-GPU.
> > > > >=20
> > > > > If you need full SVM for your workloads, I recommend using hardwa=
re
> > > > > SR-IOV.  This should allow the guest to perform GPU virtual memory
> > > > > operations without host involvement, which I expect will be much =
faster
> > > > > than paravirtualizing these operations.  Scalable I/O virtualizat=
ion
> > > > > might also work, but it might also require paravirtualizing the
> > > > > performance-critical address-space operations unless the hardware=
 has
> > > > > stage 2 translation tables.
> > > > >=20
> > > >=20
> > > > Yes I think so, the SR-IOV or some other hardware virtualization ar=
e clean
> > > > design for ROCm/compute currently. But actually those hardware feat=
ures
> > > > supported solution also have their own limitation, like high hardwa=
re cost
> > > > and the performance decreasing caused by different guest VMs hardwa=
re
> > > > workload schedule. We are trying a low-cost, high-performance virtu=
alization
> > > > solution, it appears to be difficult to support full feature VS SR-=
IOV at
> > > > present. But it doesn't prevent us from enabling part of functions.
> > > >=20
> > > > > > So for the current virito-GPU userptr implementation, It can no=
t support the
> > > > > > full SVM feature, it just can only let GPU access the user spac=
e memory,
> > > > > > maybe can be called by userptr feature. I think I will finish t=
his small
> > > > > > part firstly and then to try to complete the whole SVM feature.
> > > > >=20
> > > > > I think you will still have problems if the host is able to migra=
te
> > > > > pages in any way.  This requires that the host install an MMU not=
ifier
> > > > > for the pages it has received from the guest, which in turn impli=
es that
> > > > > the host must be able to prevent the guest from accessing the pag=
es.
> > > > > If the pages are used in grant table operations, this isn't possi=
ble.
> > > > >=20
> > > > > If you are willing to have the pages be pinned on the host side t=
hings
> > > > > are much simpler.  Such pages will always be in system memory, an=
d will
> > > > > never be able to migrate to VRAM.  This will result in a performa=
nce
> > > > > penalty and will likely require explicit prefetching by programs =
using
> > > > > ROCm, but this may be acceptable for your use-cases.  The perform=
ance
> > > > > penalty is the same as that with XNACK disabled, which is the cas=
e for
> > > > > all RDNA2+ GPUs, so all code that aims to be portable to recent c=
onsumer
> > > > > hardware will have to account for it anyway.
> > > >=20
> > > > Totally agreed. Actually memory migrating to VRAM is very common in=
 GFX
> > > > side, but in ROCm/KFD, maybe it can be disabled and not often used =
as far as
> > > > I know. ROCm/KFD always uses SDMA to transfer or copy data maybe th=
is is
> > > > faster than migrating to VRAM (needs further verification).
> > > > But we have some method to workaround it. Really thanks for your re=
minding.
> > >=20
> > > I think you will do okay if you treat virtio-GPU as providing a virtu=
al
> > > GPU with no XNACK support.  XNACK is necessary for migrating pages
> > > between GPU and CPU based on demand, and it is this migration that is
> > > so hard to implement.  Furthermore, I highly doubt that the combinati=
on
> > > of AMDKFD and the hardware you are targeting even supports XNACK.
>=20
> Yes the goal of this patch set is to support functions without memory
> migration related. It seems like XNACK is hard to support at present.
>=20
> > > At Xen Project Summit 2024, AMD mentioned that it wanted to enable bo=
th
> > > rendering (Vulkan/OpenGL) and compute (ROCm) with virtio-GPU native
> > > contexts under Xen.  The only GPUs for which AMDKFD will enable XNACK
> > > support are GFX9 GPUs, which are GCN and CDNA.  Shipping a GCN GPU in=
 a
> > > new design would be very unusual and CDNA (Instinct) accelerators do =
not
> > > support graphics, so either AMD is using separate devices for compute
> > > and graphics or the workloads will run with no XNACK support.  Since =
you
> > > mention HW cost as an important consideration, I suspect the latter.
> > >=20
> > > I believe that the Instinct accelerators that support XNACK also supp=
ort
> > > SR-IOV, but if you wish to combine XNACK and virtio-GPU, this should =
be
> > > possible subject to caveats.  The main caveat is that under no
> > > circumstances can the host's Xen driver install an MMU notifier for
> > > pages that the guest can use in grant table operations or DMA.  A dri=
ver
> > > that installs an MMU notifier promises that it can block access to
> > > pages in a bounded amount of time, and if the guest can DMA to the pa=
ges
> > > or grant them to other domains this is not possible.  Without the Xen
> > > driver installing an MMU notifier, there is no way for the pages to be
> > > migrated to the GPU without risking use-after-free or at least data
> > > corruption.  Instead, one of the following options will be needed:
> > >=20
> > > 1. hipMallocManaged() allocates the memory from the backend using the
> > >     Map primitive discussed elsewhere.  Such memory is not mappable in
> > >     the IOMMU (if there is an assigned PCI device) and cannot be used=
 for
> > >     grant table operations.  Memory allocated via system allocators
> > >     (anonymous pages) is not able to be migrated.
> > >=20
> > > 2. The frontend uses shadow buffers for all I/O.  This allows the
> > >     backend to use a new Steal primitive to revoke the guest's access=
es
> > >     to anonymous pages and handle page faults accordingly.
> > >=20
> > > 3. Same as 2 except that the frontend allocates all memory (except
> > >     bounce buffers) from the backend, just like a KVM guest does, rat=
her
> > >     than from the Xen toolstack.
> > >=20
> > > 4. The frontend tries to migrate the pages to backend-provided ones, =
and
> > >     falls back to leaving them pinned on the CPU.  The frontend's MMU
> > >     notifier tells the backend to stop accessing the pages, blocking
> > >     until the backend confirms this.  The frontend then moves the pag=
es
> > >     to its own memory and returns from the notifier.  This may require
> > >     new AMDKFD APIs.
>=20
> This step needs new AMDKFD userspace APIs, KFD has some internel APIs for
> it, need exported into UMD. But actually the most challenging parts are
> adding hypervisior primitive, and adding the frontend <-> backend sync
> solution. KFD needs mmap_write_lock to handle migrate/update operations,
> this lock needs be removed or the sync between frontend and backend is ha=
rd
> to implement. It maybe needs refactor the KFD SVM, only for this task nee=
ds
> a lot of work, and there may be other work that needs to do I haven't
> discovered it yet.
> Before starting all of it, we may need a solid design or another
> clever/compromise solution that may reduce some of the workload. Your
> reminding are professional and detailed, many things I haven't noticed,
> really thanks a lot.

You're welcome.  I am glad to have helped.

I believe the best first step would be to implement Map and Revoke as
described in https://lore.kernel.org/xen-devel/Z6U7yOrMyLZWqPA4@itl-email/T=
/,
and to submit the code for upstream review.  These primitives should be
sufficient for graphics, and they are are also prerequisites for future
SVM work.  By submitting the code upstream without waiting for
virtio-GPU ROCm support, you will be able to get review of Xen-related
code to happen in parallel with the ROCm work.  This will shorten the
critical path for upstreaming, and will reduce this risk of spending
development resources on designs that would not be acceptable upstream.
Sending the current patches would be a good idea, even if they are known
to have bugs, as this will allow upstream to help you fix them.

Once Map and Revoke are implemented, you should be able to implement
full support for virtio-GPU native contexts in Xen+QEMU.  This unlocks
OpenGL and Vulkan, along with OpenCL via rusticl.  This work can happen
in parallel with the kernel and hypervisor patches being reviewed.  I
also expect supporting ROCm with no XNACK to be feasible here, though I
am not certain as I am not familiar with the details of the AMDKFD
driver.

Finally, XNACK support can be implemented.  This should be the last
step, as it depends on all of the other work and will be a signfiicant
amount of effort in its own right.  It also might not be necessary in
practice, as if one is willing to abandon fine-grained cache coherency
I believe one can achieve equivalent performance without it, at the
expense of additional effort from the programmer.  Due to the limited
hardware support for XNACK, I expect that programs intended to be run
on end-user devices (as opposed to servers) will not require it, and it
might not be possible to achieve reasonable performance with virtio-GPU.
Since my understanding is that AMD's use-cases for virtio-GPU are
primarily in the automotive sector, I am not sure that AMD will gain any
value from enabling it, unless either UDNA devices will support XNACK in
ROCm or automotive OEMs will be including Instinct accelerators in the
cars they make.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--N7UYG+NykaBDAK3r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmentOsACgkQszaHOrMp
8lN6Lw/6AzGL6hkpxfMP+PGoFecu1upNPytzTRWiMoaX662VWqGqE/hDkSzjQyXs
9/7guV+rMOe5xLxGy8HQgmKD87/HHS3C+0+pRaw2rLIOpiAr3zl/aeuH4DticyBC
zFNcJwy9/TY9mBoiDjdfg2L+HGGisSemLJNLSA5oE9mVOWzYMi0xFScSNPUZd1J+
DDq5Sqyk+ojOlLczimvw/afuKpfhH89Fpy3y9QhZ80YiFO51lpP3GzQK27TaQ7Gy
tOkU47Gcy5Z9ONoA/1zfs2RrYUb5EmsGiANaUjC4JFcdrp2/mRBbJXnenSm3LCKX
BflJivvUmWQ6U5XehIiO/jAU2aeqNvdicK++fYjygvgSSLeFAbKqgCEz7xyegY9Q
lnej0yiH9o0W9nchT1LRhAdQ/piN/ZbqX9fHbTBjjXTpRFdnR/cFMff3LSLOiArE
jDCWqf7Mp90+Ec2R407AauTa5VdhZA9awMyi86i88pnRQZFlibfN2rg0h/rRzu2u
YYnW3rRvwM/4g95c2Jkk4Q4qysQ8scpqg8HCyJm17TJXVkTaQ7HvECYUx4dh6+iO
TXGycLjFlHndheOC83R4ZJUoe5dTHiQlYHSQLg6XNxU/uKA19jo2BRugXBi8N190
V8VyGfKV3fiuhyG/m5i45IAKyg3Ls4Jyjs0rVcqKFx1Hig1S/gw=
=i7oW
-----END PGP SIGNATURE-----

--N7UYG+NykaBDAK3r--
