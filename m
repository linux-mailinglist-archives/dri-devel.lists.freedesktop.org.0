Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7916A2D315
	for <lists+dri-devel@lfdr.de>; Sat,  8 Feb 2025 03:30:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5264E10E217;
	Sat,  8 Feb 2025 02:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=invisiblethingslab.com header.i=@invisiblethingslab.com header.b="ixGotGTL";
	dkim=pass (2048-bit key; unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.b="i4crRAxu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fhigh-b4-smtp.messagingengine.com
 (fhigh-b4-smtp.messagingengine.com [202.12.124.155])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A2E10E217
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Feb 2025 02:30:53 +0000 (UTC)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal
 [10.202.2.42])
 by mailfhigh.stl.internal (Postfix) with ESMTP id A97B1254018F;
 Fri,  7 Feb 2025 21:30:52 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
 by phl-compute-02.internal (MEProxy); Fri, 07 Feb 2025 21:30:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 invisiblethingslab.com; h=cc:cc:content-type:content-type:date
 :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:subject:subject:to:to; s=fm3; t=1738981852;
 x=1739068252; bh=mpgFs/MQUqHczoCdgcA53k90E5M8F9+8YGmj6wU4TSQ=; b=
 ixGotGTLLpBIKx9P/eYgjet/TQ12LefRqy1Jti3X/sYNBAdMJU/wGafY+eZB3eVt
 A/jTiWqZMgAJP6BvM1GvjIg5h4MkgzkFpyCqtGMmAArYFLdLFME8uEjKkeC37oLw
 wEG/0svg9dOmpPlzDj+XDlPGyWv44+e75pz1iAG0BNhTawyzXTOIh8h0F19g+Uwa
 jMULBMcK3vkjmSCBRp5LLl85tIlx2O+H/lyUVizK51hQpcdgikMVxDhdpzjzwNa3
 Fk2Cl+aaekSMyn7htyjb9fmpgYjxHtmrG0guM6gIjVQMKqkDICA38PX7wpm8GoRJ
 D+TE2xPAn/pLs+/BfhN5Qg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:content-type:date:date
 :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:subject:subject:to
 :to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
 1738981852; x=1739068252; bh=mpgFs/MQUqHczoCdgcA53k90E5M8F9+8YGm
 j6wU4TSQ=; b=i4crRAxuCeJQfOlGoC3ZSH6mSgMdhhXLGE1zDhVjBUfRJhBQ7+3
 PW9VI9ihTs57UBQWlVvYCJG2lSKR4M5mxgP0Y+aD7K52V9GBfQE5Syl0aumtQrrb
 kGACdBiqgTp0VAcQU+7vmGW5rZSzyLra75NIwyoqtmDkEe6G+lOhqu/V0bUnvkhv
 ENQMq7W3cGEM++kp1BqXz8oka8U5u7U8Z/R3dJ4Av6g9rc/3Fw/Cr/okvFBgJ4Yl
 cHI3pRoxf2guwEc1kuHSEVNWm+gj/X5L5fsmUNQR3S9A1NwLQwLNslvw35BiIuTQ
 bRkI1dtan/PW09aNjdI2+LjzCDGh3W6Ibdw==
X-ME-Sender: <xms:28GmZ9Efhs62Oa6KD305Te11eGNwn4t6wNJo6Z-wSgK2LbpY3cLBdw>
 <xme:28GmZyVuU0obfyFIAKPD40x-0un4ZT5s14WhANo-SwWqkeEJzsCgU6UrHbNLU8b9d
 np0mgubN60wnPA>
X-ME-Received: <xmr:28GmZ_J79zEmeijAmplM4TRahz4AwMs4dYDrprl_OpmsSY-NOvDymvdwPy0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdelkecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:3MGmZzGetgNi5taIFtQ6l8p9Yi5VkKU7sfyQeSWyTG2TvbPmiFDv3Q>
 <xmx:3MGmZzUlUTaokH-ih9K5en9cIs81Fv-3DxlPk-vUBhND39zATa5HHg>
 <xmx:3MGmZ-MRvcv5ZCzoYOmQKBPq2fyTNYmVgJbDQr7yoQhSdOdFyVXK4Q>
 <xmx:3MGmZy0hdGdmPX-SYJPUPCBTnT-7mPv77p3cXY0fV92lAfSNHfISRA>
 <xmx:3MGmZ6NV_Li1Z9htlb87Hal7dS_KpfhtzZYxEBH7uu84atr6547avWnK>
Feedback-ID: iac594737:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 7 Feb 2025 21:30:51 -0500 (EST)
Date: Fri, 7 Feb 2025 21:30:45 -0500
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
 Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource object
Message-ID: <Z6a_URD8n72F2E41@itl-email>
References: <20241220100409.4007346-3-honglei1.huang@amd.com>
 <Z2WO2udH2zAEr6ln@phenom.ffwll.local>
 <2fb36b50-4de2-4060-a4b7-54d221db8647@gmail.com>
 <de8ade34-eb67-4bff-a1c9-27cb51798843@amd.com>
 <Z36wV07M8B_wgWPl@phenom.ffwll.local>
 <c42ae4f7-f5f4-4906-85aa-b049ed44d7e9@gmail.com>
 <Z5waZsddenagCYtl@itl-email>
 <7b0bf2d5-700a-4cc7-b410-a9b2e2083b5d@amd.com>
 <Z6T9lDSj8Y9ATE3k@itl-email>
 <b5cf2939-5853-4c1f-90eb-68f281106f86@amd.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="K/G4WvuFnvlbOg7s"
Content-Disposition: inline
In-Reply-To: <b5cf2939-5853-4c1f-90eb-68f281106f86@amd.com>
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


--K/G4WvuFnvlbOg7s
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Date: Fri, 7 Feb 2025 21:30:45 -0500
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
	Marek =?utf-8?Q?Marczykowski-G=C3=B3recki?= <marmarek@invisiblethingslab.com>
Subject: Re: [RFC PATCH 3/3] drm/virtio: implement blob userptr resource
 object

On Fri, Feb 07, 2025 at 07:07:11PM +0800, Huang, Honglei1 wrote:
> On 2025/2/7 2:21, Demi Marie Obenour wrote:
> > On Thu, Feb 06, 2025 at 06:53:55PM +0800, Huang, Honglei1 wrote:
> > > On 2025/1/31 8:33, Demi Marie Obenour wrote:
> > > > On Wed, Jan 29, 2025 at 03:54:59PM -0500, Demi Marie Obenour wrote:
> > > > > On 1/8/25 12:05 PM, Simona Vetter wrote:
> > > > > > On Fri, Dec 27, 2024 at 10:24:29AM +0800, Huang, Honglei1 wrote:
> > > > > > >=20
> > > > > > > On 2024/12/22 9:59, Demi Marie Obenour wrote:
> > > > > > > > On 12/20/24 10:35 AM, Simona Vetter wrote:
> > > > > > > > > On Fri, Dec 20, 2024 at 06:04:09PM +0800, Honglei Huang w=
rote:
> > > > > > > > > > From: Honglei Huang <Honglei1.Huang@amd.com>
> > > > > > > > > >=20
> > > > > > > > > > A virtio-gpu userptr is based on HMM notifier.
> > > > > > > > > > Used for let host access guest userspace memory and
> > > > > > > > > > notice the change of userspace memory.
> > > > > > > > > > This series patches are in very beginning state,
> > > > > > > > > > User space are pinned currently to ensure the host
> > > > > > > > > > device memory operations are correct.
> > > > > > > > > > The free and unmap operations for userspace can be
> > > > > > > > > > handled by MMU notifier this is a simple and basice
> > > > > > > > > > SVM feature for this series patches.
> > > > > > > > > > The physical PFNS update operations is splited into
> > > > > > > > > > two OPs in here. The evicted memories won't be used
> > > > > > > > > > anymore but remap into host again to achieve same
> > > > > > > > > > effect with hmm_rang_fault.
> > > > > > > > >=20
> > > > > > > > > So in my opinion there are two ways to implement userptr =
that make sense:
> > > > > > > > >=20
> > > > > > > > > - pinned userptr with pin_user_pages(FOLL_LONGTERM). ther=
e is not mmu
> > > > > > > > >      notifier
> > > > > > > > >=20
> > > > > > > > > - unpinnned userptr where you entirely rely on userptr an=
d do not hold any
> > > > > > > > >      page references or page pins at all, for full SVM in=
tegration. This
> > > > > > > > >      should use hmm_range_fault ideally, since that's the=
 version that
> > > > > > > > >      doesn't ever grab any page reference pins.
> > > > > > > > >=20
> > > > > > > > > All the in-between variants are imo really bad hacks, whe=
ther they hold a
> > > > > > > > > page reference or a temporary page pin (which seems to be=
 what you're
> > > > > > > > > doing here). In much older kernels there was some justifi=
cation for them,
> > > > > > > > > because strange stuff happened over fork(), but with FOLL=
_LONGTERM this is
> > > > > > > > > now all sorted out. So there's really only fully pinned, =
or true svm left
> > > > > > > > > as clean design choices imo.
> > > > > > > > >=20
> > > > > > > > > With that background, why does pin_user_pages(FOLL_LONGTE=
RM) not work for
> > > > > > > > > you?
> > > > > > > >=20
> > > > > > > > +1 on using FOLL_LONGTERM.  Fully dynamic memory management=
 has a huge cost
> > > > > > > > in complexity that pinning everything avoids.  Furthermore,=
 this avoids the
> > > > > > > > host having to take action in response to guest memory recl=
aim requests.
> > > > > > > > This avoids additional complexity (and thus attack surface)=
 on the host side.
> > > > > > > > Furthermore, since this is for ROCm and not for graphics, I=
 am less concerned
> > > > > > > > about supporting systems that require swappable GPU VRAM.
> > > > > > >=20
> > > > > > > Hi Sima and Demi,
> > > > > > >=20
> > > > > > > I totally agree the flag FOLL_LONGTERM is needed, I will add =
it in next
> > > > > > > version.
> > > > > > >=20
> > > > > > > And for the first pin variants implementation, the MMU notifi=
er is also
> > > > > > > needed I think.Cause the userptr feature in UMD generally use=
d like this:
> > > > > > > the registering of userptr always is explicitly invoked by us=
er code like
> > > > > > > "registerMemoryToGPU(userptrAddr, ...)", but for the userptr =
release/free,
> > > > > > > there is no explicit API for it, at least in hsakmt/KFD stack=
=2E User just
> > > > > > > need call system call "free(userptrAddr)", then kernel driver=
 will release
> > > > > > > the userptr by MMU notifier callback.Virtio-GPU has no other =
way to know if
> > > > > > > user has been free the userptr except for MMU notifior.And in=
 UMD theres is
> > > > > > > no way to get the free() operation is invoked by user.The onl=
y way is use
> > > > > > > MMU notifier in virtio-GPU driver and free the corresponding =
data in host by
> > > > > > > some virtio CMDs as far as I can see.
> > > > > > >=20
> > > > > > > And for the second way that is use hmm_range_fault, there is =
a predictable
> > > > > > > issues as far as I can see, at least in hsakmt/KFD stack. Tha=
t is the memory
> > > > > > > may migrate when GPU/device is working. In bare metal, when m=
emory is
> > > > > > > migrating KFD driver will pause the compute work of the devic=
e in
> > > > > > > mmap_wirte_lock then use hmm_range_fault to remap the migrate=
d/evicted
> > > > > > > memories to GPU then restore the compute work of device to en=
sure the
> > > > > > > correction of the data. But in virtio-GPU driver the migratio=
n happen in
> > > > > > > guest kernel, the evict mmu notifier callback happens in gues=
t, a virtio CMD
> > > > > > > can be used for notify host but as lack of mmap_write_lock pr=
otection in
> > > > > > > host kernel, host will hold invalid data for a short period o=
f time, this
> > > > > > > may lead to some issues. And it is hard to fix as far as I ca=
n see.
> > > > > > >=20
> > > > > > > I will extract some APIs into helper according to your reques=
t, and I will
> > > > > > > refactor the whole userptr implementation, use some callbacks=
 in page
> > > > > > > getting path, let the pin method and hmm_range_fault can be c=
hoiced
> > > > > > > in this series patches.
> > > > > >=20
> > > > > > Ok, so if this is for svm, then you need full blast hmm, or the=
 semantics
> > > > > > are buggy. You cannot fake svm with pin(FOLL_LONGTERM) userptr,=
 this does
> > > > > > not work.
> > > > > >=20
> > > > > > The other option is that hsakmt/kfd api is completely busted, a=
nd that's
> > > > > > kinda not a kernel problem.
> > > > > > -Sima
> > > > >=20
> > > > > On further thought, I believe the driver needs to migrate the pag=
es to
> > > > > device memory (really a virtio-GPU blob object) *and* take a FOLL=
_LONGTERM
> > > > > pin on them.  The reason is that it isn=E2=80=99t possible to mig=
rate these pages
> > > > > back to "host" memory without unmapping them from the GPU.  For t=
he reasons
> > > > > I mention in [1], I believe that temporarily revoking access to v=
irtio-GPU
> > > > > blob objects is not feasible.  Instead, the pages must be treated=
 as if
> > > > > they are permanently in device memory until guest userspace unmap=
s them
> > > > > from the GPU, after which they must be migrated back to host memo=
ry.
> > > >=20
> > > > Discussion on IRC indicates that migration isn't reliable.  This is
> > > > because Linux core memory management is largely lock-free for
> > > > performance reasons, so there is no way to prevent temporary elevat=
ion
> > > > of a page's reference count.  A page with an elevated reference cou=
nt
> > > > cannot be migrated.
> > > >=20
> > > > The only alternative I can think of is for the hypervisor to perfor=
m the
> > > > migration.  The hypervisor can revoke the guest's access to the page
> > > > without the guest's consent or involvement.  The host can then repl=
ace
> > > > the page with one of its own pages, which might be on the CPU or GP=
U.
> > > > Further migration between the CPU and GPU is controlled by the host
> > > > kernel-mode driver (KMD) and host kernel memory management.  The gu=
est
> > > > kernel driver must take a FOLL_LONGTERM pin before telling the host=
 to
> > > > use the pages, but that is all.
> > > >=20
> > > > On KVM, this should be essentially automatic, as guest memory reall=
y is
> > > > just host userspace memory.  On Xen, this requires that the backend
> > > > domain can revoke fronted access to _any_ frontend page, or at least
> > > > frontend pages that have been granted to the backend.  The backend =
will
> > > > then need to be able to handle page faults for the frontend pages, =
and
> > > > replace the frontend pages with its own pages at will.  Furthermore,
> > > > revoking pages that the backend has installed into the frontend must
> > > > never fail, because the backend will panic if it does fail.
> > > >=20
> > > > Sima, is putting guest pages under host kernel control the only opt=
ion?
> > > > I thought that this could be avoided by leaving the pages on the CP=
U if
> > > > migration fails, but that won't work because there will be no way to
> > > > migrate them to the GPU later, causing performance problems that wo=
uld
> > > > be impossible to debug.  Is waiting (possibly forever) on migration=
 to
> > > > finish an option?  Otherwise, this might mean extra complexity in t=
he
> > > > Xen hypervisor, as I do not believe the primitives needed are curre=
ntly
> > > > available.  Specifically, in addition to the primitives discussed a=
t Xen
> > > > Project Summit 2024, the backend also needs to intercept access to,=
 and
> > > > replace the contents of, arbitrary frontend-controlled pages.
> > >=20
> > > Hi Demi,
> > >=20
> > > I agree that to achieve the complete SVM feature in virtio-GPU, it is
> > > necessary to have the hypervisor deeply involved and add new features.
> > > It needs solid design, I saw the detailed reply in a another thread, =
it
> > > is very helpful,looking forward to the response from the Xen/hypervis=
or
> > > experts.
> >=20
> >  From further discussion with Sima, I suspect that virtio-GPU cannot
> > support SVM with reasonable performance.  Native contexts have such good
> > performance for graphics workloads because graphics workloads very rare=
ly
> > perform blocking waits for host GPU operations to complete, so one can
> > make all frequently-used operations asynchronous and therefore hide the
> > guest <=3D> host latency.  SVM seems to require many synchronous GPU
> > operations, and I believe those will severely harm performance with
> > virtio-GPU.
> >=20
> > If you need full SVM for your workloads, I recommend using hardware
> > SR-IOV.  This should allow the guest to perform GPU virtual memory
> > operations without host involvement, which I expect will be much faster
> > than paravirtualizing these operations.  Scalable I/O virtualization
> > might also work, but it might also require paravirtualizing the
> > performance-critical address-space operations unless the hardware has
> > stage 2 translation tables.
> >=20
>=20
> Yes I think so, the SR-IOV or some other hardware virtualization are clean
> design for ROCm/compute currently. But actually those hardware features
> supported solution also have their own limitation, like high hardware cost
> and the performance decreasing caused by different guest VMs hardware
> workload schedule. We are trying a low-cost, high-performance virtualizat=
ion
> solution, it appears to be difficult to support full feature VS SR-IOV at
> present. But it doesn't prevent us from enabling part of functions.
>=20
> > > So for the current virito-GPU userptr implementation, It can not supp=
ort the
> > > full SVM feature, it just can only let GPU access the user space memo=
ry,
> > > maybe can be called by userptr feature. I think I will finish this sm=
all
> > > part firstly and then to try to complete the whole SVM feature.
> >=20
> > I think you will still have problems if the host is able to migrate
> > pages in any way.  This requires that the host install an MMU notifier
> > for the pages it has received from the guest, which in turn implies that
> > the host must be able to prevent the guest from accessing the pages.
> > If the pages are used in grant table operations, this isn't possible.
> >=20
> > If you are willing to have the pages be pinned on the host side things
> > are much simpler.  Such pages will always be in system memory, and will
> > never be able to migrate to VRAM.  This will result in a performance
> > penalty and will likely require explicit prefetching by programs using
> > ROCm, but this may be acceptable for your use-cases.  The performance
> > penalty is the same as that with XNACK disabled, which is the case for
> > all RDNA2+ GPUs, so all code that aims to be portable to recent consumer
> > hardware will have to account for it anyway.
>=20
> Totally agreed. Actually memory migrating to VRAM is very common in GFX
> side, but in ROCm/KFD, maybe it can be disabled and not often used as far=
 as
> I know. ROCm/KFD always uses SDMA to transfer or copy data maybe this is
> faster than migrating to VRAM (needs further verification).
> But we have some method to workaround it. Really thanks for your remindin=
g.

I think you will do okay if you treat virtio-GPU as providing a virtual
GPU with no XNACK support.  XNACK is necessary for migrating pages
between GPU and CPU based on demand, and it is this migration that is
so hard to implement.  Furthermore, I highly doubt that the combination
of AMDKFD and the hardware you are targeting even supports XNACK.

At Xen Project Summit 2024, AMD mentioned that it wanted to enable both
rendering (Vulkan/OpenGL) and compute (ROCm) with virtio-GPU native
contexts under Xen.  The only GPUs for which AMDKFD will enable XNACK
support are GFX9 GPUs, which are GCN and CDNA.  Shipping a GCN GPU in a
new design would be very unusual and CDNA (Instinct) accelerators do not
support graphics, so either AMD is using separate devices for compute
and graphics or the workloads will run with no XNACK support.  Since you
mention HW cost as an important consideration, I suspect the latter.

I believe that the Instinct accelerators that support XNACK also support
SR-IOV, but if you wish to combine XNACK and virtio-GPU, this should be
possible subject to caveats.  The main caveat is that under no
circumstances can the host's Xen driver install an MMU notifier for
pages that the guest can use in grant table operations or DMA.  A driver
that installs an MMU notifier promises that it can block access to
pages in a bounded amount of time, and if the guest can DMA to the pages
or grant them to other domains this is not possible.  Without the Xen
driver installing an MMU notifier, there is no way for the pages to be
migrated to the GPU without risking use-after-free or at least data
corruption.  Instead, one of the following options will be needed:

1. hipMallocManaged() allocates the memory from the backend using the
   Map primitive discussed elsewhere.  Such memory is not mappable in
   the IOMMU (if there is an assigned PCI device) and cannot be used for
   grant table operations.  Memory allocated via system allocators
   (anonymous pages) is not able to be migrated.

2. The frontend uses shadow buffers for all I/O.  This allows the
   backend to use a new Steal primitive to revoke the guest's accesses
   to anonymous pages and handle page faults accordingly.

3. Same as 2 except that the frontend allocates all memory (except
   bounce buffers) from the backend, just like a KVM guest does, rather
   than from the Xen toolstack.

4. The frontend tries to migrate the pages to backend-provided ones, and
   falls back to leaving them pinned on the CPU.  The frontend's MMU
   notifier tells the backend to stop accessing the pages, blocking
   until the backend confirms this.  The frontend then moves the pages
   to its own memory and returns from the notifier.  This may require
   new AMDKFD APIs.

5. Same as 4 except that the frontend uses hmm_range_fault to move the
   pages to the backend in response to GPU page faults.  This requires a
   frontend <-> backend round-trip for each fault (slooooow) so a new
   fast mechanism for this might be needed.
--=20
Sincerely,
Demi Marie Obenour (she/her/hers)
Invisible Things Lab

--K/G4WvuFnvlbOg7s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEopQtqVJW1aeuo9/sszaHOrMp8lMFAmemwdYACgkQszaHOrMp
8lNv+RAAjsTL0tTmo7EqT5QnTaMsMPWvcyt4GzbRb8G3XPOmXyRBdkKjtLzshY4O
HlPjRtMXLfXFCUUxaTLJkc6kktv/hwsj8Wggqxh+NepRBgKmtJ0AdT9VIs8S2czs
sQUPzA22KRYKxEphfNBx4XZ+uda1DbxlvPpXMBWsmUpH4qldaUCYYh0q1UlJxyBm
wsbMPya16DubK6uUPiwY10hE1e3/y6WktiIsf/CqlDv+lbyTcH2tFhv3oTyFDF2N
F+tyO7QQPGV0K2Pch2Mq1YeVRzaMKucMPe+qhgNEDDKdM+CTVBvwU1MfgOu7cdjI
lyKYMK3qWiEoASCLKakvW4A84tcFhNqfRdVOGj0k8dF9yR6xRjnIw/iYNc7GhFTy
Z6Enh6Mnz8Tpy3rZhRuRM+cweCcA8R61qla0E5K52aI9j/d7YTgGFxztLYLyeXtk
qBT/XfOtUizOj56derZY6wyfJZafWryNVnCryyqPkVwlMkFTrcOa0pD/Glt8K46+
nQL7KRGEKS8ZqwKpK8zXZ5q0Sx7rLdwvzR85+LwagVPDRCtp7ruq75YwEqSvlUmT
vqfDEWvqHXEZM4vIgEpNhL5GrermlgJVzY+fJSIOJnoSVVgCeP5Wwse3iE6Uw1uq
QSV3HuxbMuBHBT5+BzLeir5c+LurRSfg8DG8LZCYkptCQDydP98=
=Zfgi
-----END PGP SIGNATURE-----

--K/G4WvuFnvlbOg7s--
