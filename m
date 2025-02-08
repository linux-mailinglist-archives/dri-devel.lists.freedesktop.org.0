Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 257F8A2D328
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 03:43:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57D7410EBBC;
	Sat,  8 Feb 2025 02:43:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="FQWLRsUg";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="i32l2juV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF32510EBBC
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 02:43:10 +0000 (UTC)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal
 [10.202.2.52])
 by mailfhigh.stl.internal (Postfix) with ESMTP id D4EA8254016F;
 Fri,  7 Feb 2025 21:43:09 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
 by phl-compute-12.internal (MEProxy); Fri, 07 Feb 2025 21:43:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1738982589;
 x=1739068989; bh=JnAUJP6f+n+Id3QdTI1JBV8/ZYL9nA844b3+f38N/0w=; b=
 FQWLRsUgQEP4ddPCXh1OqLir+9v9pcXm7HwQlckYccZ06J7HJZ833wwQ3pHtaf97
 6e6Z2Q2mIqzPdmouNRvUP5rO8UvJceTYtEQXqBA7ramQE+29qWsRJMtkTDq2bF2m
 jRZ+eUbzlq/bkqmQ6U6eqck+fsJNckZ/+ue3cBov+uituHqOFBDWuemtnBA6V6G2
 6XXe9j4etkDCFKL01G2KqiOp4Zu7HlMcd8qQi6TnOqjMWHEajTshQfmjT782hEn7
 LaT06reWF6LEDBHJNVnorhIo/zUzR/00M3z5Glvj7njY2JV4ZW0z+5jjwk9O9UoH
 dEBuckdIAMdbB2HNGcmvYg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1738982589; x=1739068989; bh=JnAUJP6f+n+Id3QdTI1JBV8/ZYL9nA844b3
 +f38N/0w=; b=i32l2juValIoSFC7zsUCklN0BUdf1H2hNbDvri9ZEOhUbwXXyoM
 eZcCOfmmBrc8bx/wRNATggu4oTn2i70X6e/4MQ2xAIpcllIIcudo3ulkGR15Y54D
 pih1NvIdTAGg4XqOIChUs9w3QblMYO+FB/IJ7M9/MaAunlgyiXm04hq449ofSdJ3
 WDFZOoRXhCtiWaeg6e5S3eoHHeaG+nQEHQeIErM4ybb9IuakdXFdHfGn8ffX/cfE
 nKTGugjbB2IBQKET23HsWTEDMbyxH/Eik8euShgWlro6AWSJOoCP1OL/bJKLl9sA
 rnaAVrPk9M8TdkV/BDatpOZ72BduAtVGkVg==
X-ME-Sender: <xms:vMSmZ0OHwlQWa8X2CYP8_sruX6D21Wx7rR7ykuhd39vMYpIMajT7vQ>
 <xme:vMSmZ6_lE_DvGWE43H1yLywQZ-kVAq-ysnskPfoQAimpVDowqQfQJV3oRsLVW2kk_
 Ekw3IQPdbxWXP4>
X-ME-Received: <xmr:vMSmZ7RdiI-gcczy6ugviIHHTSRAUNybueb2KyHUWKVj_5KwI5N_JAMYuYs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdefuddtudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
 uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
 hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehgtderredttdej
 necuhfhrohhmpeffvghmihcuofgrrhhivgcuqfgsvghnohhurhcuoeguvghmihesihhnvh
 hishhisghlvghthhhinhhgshhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpedvjeet
 geekhfetudfhgfetffegfffguddvgffhffeifeeikeektdehgeetheffleenucevlhhush
 htvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpeguvghmihesihhnvhhi
 shhisghlvghthhhinhhgshhlrggsrdgtohhmpdhnsggprhgtphhtthhopeduledpmhhoug
 gvpehsmhhtphhouhhtpdhrtghpthhtohephhhonhhglhgvihdurdhhuhgrnhhgsegrmhgu
 rdgtohhmpdhrtghpthhtohepuggvmhhiohgsvghnohhurhesghhmrghilhdrtghomhdprh
 gtphhtthhopehrrgihrdhhuhgrnhhgsegrmhgurdgtohhmpdhrtghpthhtohepshhtvghf
 rghnohdrshhtrggsvghllhhinhhisegrmhgurdgtohhmpdhrtghpthhtohepvhhirhhtuh
 grlhhiiigrthhiohhnsehlihhsthhsrdhlihhnuhigqdhfohhunhgurghtihhonhdrohhr
 ghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdroh
 hrghdprhgtphhtthhopegrihhrlhhivggusehrvgguhhgrthdrtghomhdprhgtphhtthho
 pegurhhiqdguvghvvghlsehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhgpdhrtg
 hpthhtohepughmihhtrhihrdhoshhiphgvnhhkohestgholhhlrggsohhrrgdrtghomh
X-ME-Proxy: <xmx:vMSmZ8sJE2CFld1rE-6KSPlkMUjvK9e6f2uzxfx4lQ0ySenVA2GAbA>
 <xmx:vcSmZ8dRT1AN5YFowHD2Z6UhfyUye-7DgufbQ_Y2HYaIW42mCIWopQ>
 <xmx:vcSmZw04mevOc9kjeEWAwRiMpnbK61tLems7wdS8rFioTZYgtYMzIQ>
 <xmx:vcSmZw8dMl32Vk9xurTuIKfYBdMoqS8yMzwzrK3tc6SH7CiroAW2og>
 <xmx:vcSmZxBO2N4SnwHyZnKqpEAMQWrHjMlEWRUkKbHBy7d8_0rUmwG4Sgk4>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Feb 2025 21:43:07 -0500 (EST)
Date: Fri, 7 Feb 2025 21:43:02 -0500
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
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
Message-ID: <Z6bEuc6XW_0hFcyS@itl-email>
References: <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
 <Z36wV07M8B_wgWPl@phenom.ffwll.local>
 <c42ae4f7-f5f4-4906-85aa-b049ed44d7e9@gmail.com>
 <Z5waZsddenagCYtl@itl-email>
 <7b0bf2d5-700a-4cc7-b410-a9b2e2083b5d@amd.com>
 <Z6T9lDSj8Y9ATE3k@itl-email>
 <b5cf2939-5853-4c1f-90eb-68f281106f86@amd.com>
 <Z6a_URD8n72F2E41@itl-email>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="iF+xZbPqvFG3L78Z"
Content-Disposition: inline
In-Reply-To: <Z6a_URD8n72F2E41@itl-email>
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


--iF+xZbPqvFG3L78Z
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 7 Feb 2025 21:43:02 -0500
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
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>,
	Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource
 object

On Fri, Feb 07, 2025 at 09:30:45PM -0500, Demi Marie Obenour wrote:
> On Fri, Feb 07, 2025 at 07:07:11PM +0800, Huang, Honglei1 wrote:
> > On 2025/2/7 2:21, Demi Marie Obenour wrote:
> > > On Thu, Feb 06, 2025 at 06:53:55PM +0800, Huang, Honglei1 wrote:
> > > > On 2025/1/31 8:33, Demi Marie Obenour wrote:
> > > > > On Wed, Jan 29, 2025 at 03:54:59PM -0500, Demi Marie Obenour wrot=
e:
> > > > > > On 1/8/25 12:05 PM, Simona Vetter wrote:
> > > > > > > On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1 wro=
te:
> > > > > > > >=20
> > > > > > > > On 2024/12/22 9:59, Demi Marie Obenour wrote:
> > > > > > > > > On 12/20/24 10:35 AM, Simona Vetter wrote:
> > > > > > > > > > On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang=
 wrote:
> > > > > > > > > > > From: Honglei Huang <Honglei1.Huang@amd.com>
> > > > > > > > > > >=20
> > > > > > > > > > > A virtio-gpu userptr is based on HMM notifier.
> > > > > > > > > > > Used for let host access guest userspace memory and
> > > > > > > > > > > notice the change of userspace memory.
> > > > > > > > > > > This series patches are in very beginning state,
> > > > > > > > > > > User space are pinned currently to ensure the host
> > > > > > > > > > > device memory operations are correct.
> > > > > > > > > > > The free and unmap operations for userspace can be
> > > > > > > > > > > handled by MMU notifier this is a simple and basice
> > > > > > > > > > > SVM feature for this series patches.
> > > > > > > > > > > The physical PFNS update operations is splited into
> > > > > > > > > > > two OPs in here. The evicted memories won't be used
> > > > > > > > > > > anymore but remap into host again to achieve same
> > > > > > > > > > > effect with hmm_rang_fault.
> > > > > > > > > >=20
> > > > > > > > > > So in my opinion there are two ways to implement userpt=
r that make sense:
> > > > > > > > > >=20
> > > > > > > > > > - pinned userptr with pin_user_pages(FOLL_LONGTERM). th=
ere is not mmu
> > > > > > > > > >      notifier
> > > > > > > > > >=20
> > > > > > > > > > - unpinnned userptr where you entirely rely on userptr =
and do not hold any
> > > > > > > > > >      page references or page pins at all, for full SVM =
integration. This
> > > > > > > > > >      should use hmm_range_fault ideally, since that's t=
he version that
> > > > > > > > > >      doesn't ever grab any page reference pins.
> > > > > > > > > >=20
> > > > > > > > > > All the in-between variants are imo really bad hacks, w=
hether they hold a
> > > > > > > > > > page reference or a temporary page pin (which seems to =
be what you're
> > > > > > > > > > doing here). In much older kernels there was some justi=
fication for them,
> > > > > > > > > > because strange stuff happened over fork(), but with FO=
LL_LONGTERM this is
> > > > > > > > > > now all sorted out. So there's really only fully pinned=
, or true svm left
> > > > > > > > > > as clean design choices imo.
> > > > > > > > > >=20
> > > > > > > > > > With that background, why does pin_user_pages(FOLL_LONG=
TERM) not work for
> > > > > > > > > > you?
> > > > > > > > >=20
> > > > > > > > > +1 on using FOLL_LONGTERM.  Fully dynamic memory manageme=
nt has a huge cost
> > > > > > > > > in complexity that pinning everything avoids.  Furthermor=
e, this avoids the
> > > > > > > > > host having to take action in response to guest memory re=
claim requests.
> > > > > > > > > This avoids additional complexity (and thus attack surfac=
e) on the host side.
> > > > > > > > > Furthermore, since this is for ROCm and not for graphics,=
 I am less concerned
> > > > > > > > > about supporting systems that require swappable GPU VRAM.
> > > > > > > >=20
> > > > > > > > Hi Sima and Demi,
> > > > > > > >=20
> > > > > > > > I totally agree the flag FOLL_LONGTERM is needed, I will ad=
d it in next
> > > > > > > > version.
> > > > > > > >=20
> > > > > > > > And for the first pin variants implementation, the MMU noti=
fier is also
> > > > > > > > needed I think.Cause the userptr feature in UMD generally u=
sed like this:
> > > > > > > > the registering of userptr always is explicitly invoked by =
user code like
> > > > > > > > "registerMemoryToGPU(userptrAddr, ...)", but for the userpt=
r release/free,
> > > > > > > > there is no explicit API for it, at least in hsakmt/KFD sta=
ck. User just
> > > > > > > > need call system call "free(userptrAddr)", then kernel driv=
er will release
> > > > > > > > the userptr by MMU notifier callback.Virtio-GPU has no othe=
r way to know if
> > > > > > > > user has been free the userptr except for MMU notifior.And =
in UMD theres is
> > > > > > > > no way to get the free() operation is invoked by user.The o=
nly way is use
> > > > > > > > MMU notifier in virtio-GPU driver and free the correspondin=
g data in host by
> > > > > > > > some virtio CMDs as far as I can see.
> > > > > > > >=20
> > > > > > > > And for the second way that is use hmm_range_fault, there i=
s a predictable
> > > > > > > > issues as far as I can see, at least in hsakmt/KFD stack. T=
hat is the memory
> > > > > > > > may migrate when GPU/device is working. In bare metal, when=
 memory is
> > > > > > > > migrating KFD driver will pause the compute work of the dev=
ice in
> > > > > > > > mmap_wirte_lock then use hmm_range_fault to remap the migra=
ted/evicted
> > > > > > > > memories to GPU then restore the compute work of device to =
ensure the
> > > > > > > > correction of the data. But in virtio-GPU driver the migrat=
ion happen in
> > > > > > > > guest kernel, the evict mmu notifier callback happens in gu=
est, a virtio CMD
> > > > > > > > can be used for notify host but as lack of mmap_write_lock =
protection in
> > > > > > > > host kernel, host will hold invalid data for a short period=
 of time, this
> > > > > > > > may lead to some issues. And it is hard to fix as far as I =
can see.
> > > > > > > >=20
> > > > > > > > I will extract some APIs into helper according to your requ=
est, and I will
> > > > > > > > refactor the whole userptr implementation, use some callbac=
ks in page
> > > > > > > > getting path, let the pin method and hmm_range_fault can be=
 choiced
> > > > > > > > in this series patches.
> > > > > > >=20
> > > > > > > Ok, so if this is for svm, then you need full blast hmm, or t=
he semantics
> > > > > > > are buggy. You cannot fake svm with pin(FOLL_LONGTERM) userpt=
r, this does
> > > > > > > not work.
> > > > > > >=20
> > > > > > > The other option is that hsakmt/kfd api is completely busted,=
 and that's
> > > > > > > kinda not a kernel problem.
> > > > > > > -Sima
> > > > > >=20
> > > > > > On further thought, I believe the driver needs to migrate the p=
ages to
> > > > > > device memory (really a virtio-GPU blob object) *and* take a FO=
LL_LONGTERM
> > > > > > pin on them.  The reason is that it isn=E2=80=99t possible to m=
igrate these pages
> > > > > > back to "host" memory without unmapping them from the GPU.  For=
 the reasons
> > > > > > I mention in [1], I believe that temporarily revoking access to=
 virtio-GPU
> > > > > > blob objects is not feasible.  Instead, the pages must be treat=
ed as if
> > > > > > they are permanently in device memory until guest userspace unm=
aps them
> > > > > > from the GPU, after which they must be migrated back to host me=
mory.
> > > > >=20
> > > > > Discussion on IRC indicates that migration isn't reliable.  This =
is
> > > > > because Linux core memory management is largely lock-free for
> > > > > performance reasons, so there is no way to prevent temporary elev=
ation
> > > > > of a page's reference count.  A page with an elevated reference c=
ount
> > > > > cannot be migrated.
> > > > >=20
> > > > > The only alternative I can think of is for the hypervisor to perf=
orm the
> > > > > migration.  The hypervisor can revoke the guest's access to the p=
age
> > > > > without the guest's consent or involvement.  The host can then re=
place
> > > > > the page with one of its own pages, which might be on the CPU or =
GPU.
> > > > > Further migration between the CPU and GPU is controlled by the ho=
st
> > > > > kernel-mode driver (KMD) and host kernel memory management.  The =
guest
> > > > > kernel driver must take a FOLL_LONGTERM pin before telling the ho=
st to
> > > > > use the pages, but that is all.
> > > > >=20
> > > > > On KVM, this should be essentially automatic, as guest memory rea=
lly is
> > > > > just host userspace memory.  On Xen, this requires that the backe=
nd
> > > > > domain can revoke fronted access to _any_ frontend page, or at le=
ast
> > > > > frontend pages that have been granted to the backend.  The backen=
d will
> > > > > then need to be able to handle page faults for the frontend pages=
, and
> > > > > replace the frontend pages with its own pages at will.  Furthermo=
re,
> > > > > revoking pages that the backend has installed into the frontend m=
ust
> > > > > never fail, because the backend will panic if it does fail.
> > > > >=20
> > > > > Sima, is putting guest pages under host kernel control the only o=
ption?
> > > > > I thought that this could be avoided by leaving the pages on the =
CPU if
> > > > > migration fails, but that won't work because there will be no way=
 to
> > > > > migrate them to the GPU later, causing performance problems that =
would
> > > > > be impossible to debug.  Is waiting (possibly forever) on migrati=
on to
> > > > > finish an option?  Otherwise, this might mean extra complexity in=
 the
> > > > > Xen hypervisor, as I do not believe the primitives needed are cur=
rently
> > > > > available.  Specifically, in addition to the primitives discussed=
 at Xen
> > > > > Project Summit 2024, the backend also needs to intercept access t=
o, and
> > > > > replace the contents of, arbitrary frontend-controlled pages.
> > > >=20
> > > > Hi Demi,
> > > >=20
> > > > I agree that to achieve the complete SVM feature in virtio-GPU, it =
is
> > > > necessary to have the hypervisor deeply involved and add new featur=
es.
> > > > It needs solid design, I saw the detailed reply in a another thread=
, it
> > > > is very helpful,looking forward to the response from the Xen/hyperv=
isor
> > > > experts.
> > >=20
> > >  From further discussion with Sima, I suspect that virtio-GPU cannot
> > > support SVM with reasonable performance.  Native contexts have such g=
ood
> > > performance for graphics workloads because graphics workloads very ra=
rely
> > > perform blocking waits for host GPU operations to complete, so one can
> > > make all frequently-used operations asynchronous and therefore hide t=
he
> > > guest <=3D> host latency.  SVM seems to require many synchronous GPU
> > > operations, and I believe those will severely harm performance with
> > > virtio-GPU.
> > >=20
> > > If you need full SVM for your workloads, I recommend using hardware
> > > SR-IOV.  This should allow the guest to perform GPU virtual memory
> > > operations without host involvement, which I expect will be much fast=
er
> > > than paravirtualizing these operations.  Scalable I/O virtualization
> > > might also work, but it might also require paravirtualizing the
> > > performance-critical address-space operations unless the hardware has
> > > stage 2 translation tables.
> > >=20
> >=20
> > Yes I think so, the SR-IOV or some other hardware virtualization are cl=
ean
> > design for ROCm/compute currently. But actually those hardware features
> > supported solution also have their own limitation, like high hardware c=
ost
> > and the performance decreasing caused by different guest VMs hardware
> > workload schedule. We are trying a low-cost, high-performance virtualiz=
ation
> > solution, it appears to be difficult to support full feature VS SR-IOV =
at
> > present. But it doesn't prevent us from enabling part of functions.
> >=20
> > > > So for the current virito-GPU userptr implementation, It can not su=
pport the
> > > > full SVM feature, it just can only let GPU access the user space me=
mory,
> > > > maybe can be called by userptr feature. I think I will finish this =
small
> > > > part firstly and then to try to complete the whole SVM feature.
> > >=20
> > > I think you will still have problems if the host is able to migrate
> > > pages in any way.  This requires that the host install an MMU notifier
> > > for the pages it has received from the guest, which in turn implies t=
hat
> > > the host must be able to prevent the guest from accessing the pages.
> > > If the pages are used in grant table operations, this isn't possible.
> > >=20
> > > If you are willing to have the pages be pinned on the host side things
> > > are much simpler.  Such pages will always be in system memory, and wi=
ll
> > > never be able to migrate to VRAM.  This will result in a performance
> > > penalty and will likely require explicit prefetching by programs using
> > > ROCm, but this may be acceptable for your use-cases.  The performance
> > > penalty is the same as that with XNACK disabled, which is the case for
> > > all RDNA2+ GPUs, so all code that aims to be portable to recent consu=
mer
> > > hardware will have to account for it anyway.
> >=20
> > Totally agreed. Actually memory migrating to VRAM is very common in GFX
> > side, but in ROCm/KFD, maybe it can be disabled and not often used as f=
ar as
> > I know. ROCm/KFD always uses SDMA to transfer or copy data maybe this is
> > faster than migrating to VRAM (needs further verification).
> > But we have some method to workaround it. Really thanks for your remind=
ing.
>=20
> I think you will do okay if you treat virtio-GPU as providing a virtual
> GPU with no XNACK support.  XNACK is necessary for migrating pages
> between GPU and CPU based on demand, and it is this migration that is
> so hard to implement.  Furthermore, I highly doubt that the combination
> of AMDKFD and the hardware you are targeting even supports XNACK.
>=20
> At Xen Project Summit 2024, AMD mentioned that it wanted to enable both
> rendering (Vulkan/OpenGL) and compute (ROCm) with virtio-GPU native
> contexts under Xen.  The only GPUs for which AMDKFD will enable XNACK
> support are GFX9 GPUs, which are GCN and CDNA.  Shipping a GCN GPU in a
> new design would be very unusual and CDNA (Instinct) accelerators do not
> support graphics, so either AMD is using separate devices for compute
> and graphics or the workloads will run with no XNACK support.  Since you
> mention HW cost as an important consideration, I suspect the latter.
>=20
> I believe that the Instinct accelerators that support XNACK also support
> SR-IOV, but if you wish to combine XNACK and virtio-GPU, this should be
> possible subject to caveats.  The main caveat is that under no
> circumstances can the host's Xen driver install an MMU notifier for
> pages that the guest can use in grant table operations or DMA.  A driver
> that installs an MMU notifier promises that it can block access to
> pages in a bounded amount of time, and if the guest can DMA to the pages
> or grant them to other domains this is not possible.  Without the Xen
> driver installing an MMU notifier, there is no way for the pages to be
> migrated to the GPU without risking use-after-free or at least data
> corruption.  Instead, one of the following options will be needed:
>=20
> 1. hipMallocManaged() allocates the memory from the backend using the
>    Map primitive discussed elsewhere.  Such memory is not mappable in
>    the IOMMU (if there is an assigned PCI device) and cannot be used for
>    grant table operations.  Memory allocated via system allocators
>    (anonymous pages) is not able to be migrated.
>=20
> 2. The frontend uses shadow buffers for all I/O.  This allows the
>    backend to use a new Steal primitive to revoke the guest's accesses
>    to anonymous pages and handle page faults accordingly.
>=20
> 3. Same as 2 except that the frontend allocates all memory (except
>    bounce buffers) from the backend, just like a KVM guest does, rather
>    than from the Xen toolstack.
>=20
> 4. The frontend tries to migrate the pages to backend-provided ones, and
>    falls back to leaving them pinned on the CPU.  The frontend's MMU
>    notifier tells the backend to stop accessing the pages, blocking
>    until the backend confirms this.  The frontend then moves the pages
>    to its own memory and returns from the notifier.  This may require
>    new AMDKFD APIs.
>=20
> 5. Same as 4 except that the frontend uses hmm_range_fault to move the
>    pages to the backend in response to GPU page faults.  This requires a
>    frontend <-> backend round-trip for each fault (slooooow) so a new
>    fast mechanism for this might be needed.
> --=20
> Sincerely,
> Demi Marie Obenour (she/her/hers)
> Invisible Things Lab

CC Simona Vetter
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--iF+xZbPqvFG3L78Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmemxLYACgkQszaHOrMp
8lNYBw/7Be64tzuwDz/4BVd7UhUbrRB8Wq4mDkUNmrPQnLKzqx/9uHVjPgutkOoi
XC9yonehg1OBMEg9ZNCiTJjVwPYe7ps//mF1XWqe9gicB7nmbRXdEmqe9ZzOtnMV
Fci/nKtDRE1KkknwMKh01lrR/9tX1gd7RcekZPgZcC9FZ2iM1yNMwdSK+ypcnBSg
m4l33YDjLltNa0qfrBWPREASBNnp4THLyxJlkxgENCo5YNbEsBuGYT/VL+oseaCJ
CZWQD0u4WTCRCzNRPwSymUm9PTyhhUJWeQfK8AWBeR5UfOe2qlnheLfa1q6o4UR/
EipGcZbtPF9lPVII3ek8XxaLPQOM2ug16wk/HvW+4BprOQ1J0+tyZrg/MXdjubLB
o9sQcGv/+YQlsg0UXsy1rbRZbpht+Ybm9bpSiQLSYZSFO+Q5jbK6m/wCbX/JGAgo
X4VFiNBjaFvVFgnoNYZfc+KKNHCsMBrV6dMj2B1xEW8tnIVNisn8aIyf4W8sFKBr
Eo7A3/aRm84Go4141q/Xp+SS45kAHJxa929yOe1GG+NVJQR6lSW4Xa2Vax+xEmDN
YCoivjfuyX9x82AqS4KAwkAIL2nJibrlOEt8Gtb8Oaq9pgDZX1Yb3AZRW63biGvD
rmOLS713iMNBoMo6O7ZHgrIpM9+F+16JBZsVmk4HkIAeB4PHI44=
=eCCo
-----END PGP SIGNATURE-----

--iF+xZbPqvFG3L78Z--
