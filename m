Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA09D691EFB
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 13:19:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C054A10E13A;
	Fri, 10 Feb 2023 12:19:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C9F810E13A
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Feb 2023 12:19:04 +0000 (UTC)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id 609BF5C00EA;
 Fri, 10 Feb 2023 07:19:02 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute2.internal (MEProxy); Fri, 10 Feb 2023 07:19:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1676031542; x=
 1676117942; bh=hAciNDJx5WMqCe54zqG4xivQMkjWYiV5+CN4SguebVU=; b=T
 KlDq68E2cyplQ1Fblc1ONWRwVA6FjiL4QV/YU11sM8zH6+cQmEFFGjd5wUnBlCNb
 3JtbSuZoZm+qg+1wT2MhAvm9B+v2V0SGOlfGLsDV+I275rC4gr3KQEBn6cCpeUpz
 TwX8lLpsld3aoOKQ33E1ar2+q13J0lwfmYdGNu5vO8bZbGbNgapO+EJuHpPjLmXZ
 A6MJM3YL0dT1PlElQ/FsJtUnFGPjmZ2Y5grjRno9qO61Ygpha2qUVwSp3TWFprG4
 hs75rSVZw5LNVUW9slNfZSxVbercG3m99JfB5Gk/P/wgWIPw+8UdGJH6olt2LUwq
 WLjfuUvBUM/cDjR+WQVxQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1676031542; x=
 1676117942; bh=hAciNDJx5WMqCe54zqG4xivQMkjWYiV5+CN4SguebVU=; b=K
 qHJ8Vax4S7e8QSHiTlhUoAnIwfOwhDjA0Kp9HppMYw9a9KU0HU3GeZF5w46/NlED
 Ldrdr67p72xNkIIhj8cs9LnV2HBXyNu+hId3YM9+MJQXynAyK59NNwrJJKM9VVWT
 jnLV6DlBErK7ZT1V4RTzByFGhC6en6Z4LeWUpKwzaG/JmPh4x7jPksBRO1LA9S1q
 h0JW1rocsDGfD0Piqib69qrhjoaHbT9g/GV/QIudznVtlWZErjm/f3XFdNLH91bY
 /UrmgCH6qwT9eo56Cg5/VtWKIzTDPFPuOH5PrhJ0UB6wh8C3lUe46JK8bbNoxXnM
 fDXm7pFyY4iLSmzzr3P1A==
X-ME-Sender: <xms:NTbmYyok2u2zRtwegQPWFIAHDEnkX2jDiUj2MaCrrHHuf2k8fyzkAg>
 <xme:NTbmYwo-DU2R7ONIs9V0Pb9OlwtuIXvV6xk4UOLzAgOK76G55REfBlKsFKiyunh5Z
 s-LA1EPhJBSebrVpTg>
X-ME-Received: <xmr:NTbmY3O--IjE2QcTMA3MQ4dhIEt_f85dxm7JLAMSs4-DCzZg3-dGtv_CvCVzQmuI9qyXxvx3NW9CZOJfL3l1XcukIqY--po>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehhedgfeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggugfgjsehtqhertddttddunecuhfhrohhmpeforgig
 ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
 grthhtvghrnhepleelfeeileelteetfedvieekfeefffevhfdtvefgheevudevheejvddv
 ieeltdeinecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:NTbmYx7V611ZoBwkJI_X7TnFr9D-FL-DUqhrKy14h6Y4NQr80j28pQ>
 <xmx:NTbmYx52zpYfxV9qfWDW9_ZNwXi47ZUYsRLEcq8AOZF-QBYKA45zLQ>
 <xmx:NTbmYxjblRw2P67TNjvd5M2QWsTkZ_vMq_cqT9sqZHkc7HLtSW-gGQ>
 <xmx:NjbmY5yW1-8hmmGSt2Ocq6lYQLRf29IKkro8TbCr8bjSrRsyEd4Y9Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 10 Feb 2023 07:19:01 -0500 (EST)
Date: Fri, 10 Feb 2023 13:18:58 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Try to address the drm_debugfs issues
Message-ID: <20230210121858.fxlgnurminvrg725@houat>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
 <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
 <20230209141923.4n4ffsqchdrx5vnp@houat>
 <95e7f52a-46ce-5e16-b686-5e4011693287@gmail.com>
 <20230209184841.axndkk66geoopr6d@houat>
 <67e10f56-15b3-a4f0-b5b3-23e878c1f12a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <67e10f56-15b3-a4f0-b5b3-23e878c1f12a@gmail.com>
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
Cc: daniel.vetter@ffwll.ch, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>,
 dri-devel@lists.freedesktop.org, mwen@igalia.com, mairacanal@riseup.net,
 wambui.karugax@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Feb 10, 2023 at 01:07:39PM +0100, Christian K=F6nig wrote:
> Am 09.02.23 um 19:48 schrieb Maxime Ripard:
> > On Thu, Feb 09, 2023 at 04:52:54PM +0100, Christian K=F6nig wrote:
> > > Am 09.02.23 um 15:19 schrieb Maxime Ripard:
> > > > On Thu, Feb 09, 2023 at 03:06:10PM +0100, Christian K=F6nig wrote:
> > > > > Am 09.02.23 um 14:06 schrieb Ma=EDra Canal:
> > > > > > On 2/9/23 09:13, Christian K=F6nig wrote:
> > > > > > > Am 09.02.23 um 12:23 schrieb Ma=EDra Canal:
> > > > > > > > On 2/9/23 05:18, Christian K=F6nig wrote:
> > > > > > > > > Hello everyone,
> > > > > > > > >=20
> > > > > > > > > the drm_debugfs has a couple of well known design problem=
s.
> > > > > > > > >=20
> > > > > > > > > Especially it wasn't possible to add files between
> > > > > > > > > initializing and registering
> > > > > > > > > of DRM devices since the underlying debugfs directory was=
n't
> > > > > > > > > created yet.
> > > > > > > > >=20
> > > > > > > > > The resulting necessity of the driver->debugfs_init()
> > > > > > > > > callback function is a
> > > > > > > > > mid-layering which is really frowned on since it creates =
a horrible
> > > > > > > > > driver->DRM->driver design layering.
> > > > > > > > >=20
> > > > > > > > > The recent patch "drm/debugfs: create device-centered
> > > > > > > > > debugfs functions" tried
> > > > > > > > > to address those problem, but doesn't seem to work
> > > > > > > > > correctly. This looks like
> > > > > > > > > a misunderstanding of the call flow around
> > > > > > > > > drm_debugfs_init(), which is called
> > > > > > > > > multiple times, once for the primary and once for the ren=
der node.
> > > > > > > > >=20
> > > > > > > > > So what happens now is the following:
> > > > > > > > >=20
> > > > > > > > > 1. drm_dev_init() initially allocates the drm_minor objec=
ts.
> > > > > > > > > 2. ... back to the driver ...
> > > > > > > > > 3. drm_dev_register() is called.
> > > > > > > > >=20
> > > > > > > > > 4. drm_debugfs_init() is called for the primary node.
> > > > > > > > > 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_ini=
t() and
> > > > > > > > >   =A0=A0=A0 drm_atomic_debugfs_init() call drm_debugfs_ad=
d_file(s)()
> > > > > > > > > to add the files
> > > > > > > > >   =A0=A0=A0 for the primary node.
> > > > > > > > > 6. The driver->debugfs_init() callback is called to add
> > > > > > > > > debugfs files for the
> > > > > > > > >   =A0=A0=A0 primary node.
> > > > > > > > > 7. The added files are consumed and added to the primary
> > > > > > > > > node debugfs directory.
> > > > > > > > >=20
> > > > > > > > > 8. drm_debugfs_init() is called for the render node.
> > > > > > > > > 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_ini=
t() and
> > > > > > > > >   =A0=A0=A0 drm_atomic_debugfs_init() call drm_debugfs_ad=
d_file(s)()
> > > > > > > > > to add the files
> > > > > > > > >   =A0=A0=A0 again for the render node.
> > > > > > > > > 10. The driver->debugfs_init() callback is called to add
> > > > > > > > > debugfs files for the
> > > > > > > > >   =A0=A0=A0=A0 render node.
> > > > > > > > > 11. The added files are consumed and added to the render
> > > > > > > > > node debugfs directory.
> > > > > > > > >=20
> > > > > > > > > 12. Some more files are added through drm_debugfs_add_fil=
e().
> > > > > > > > > 13. drm_debugfs_late_register() add the files once more to
> > > > > > > > > the primary node
> > > > > > > > >   =A0=A0=A0=A0 debugfs directory.
> > > > > > > > > 14. From this point on files added through
> > > > > > > > > drm_debugfs_add_file() are simply ignored.
> > > > > > > > > 15. ... back to the driver ...
> > > > > > > > >=20
> > > > > > > > > Because of this the dev->debugfs_mutex lock is also
> > > > > > > > > completely pointless since
> > > > > > > > > any concurrent use of the interface would just randomly
> > > > > > > > > either add the files to
> > > > > > > > > the primary or render node or just not at all.
> > > > > > > > >=20
> > > > > > > > > Even worse is that this implementation nails the coffin f=
or
> > > > > > > > > removing the
> > > > > > > > > driver->debugfs_init() mid-layering because otherwise
> > > > > > > > > drivers can't control
> > > > > > > > > where their debugfs (primary/render node) are actually ad=
ded.
> > > > > > > > >=20
> > > > > > > > > This patch set here now tries to clean this up a bit, but
> > > > > > > > > most likely isn't
> > > > > > > > > fully complete either since I didn't audit every driver/c=
all path.
> > > > > > > > I tested the patchset on the v3d, vc4 and vkms and all the =
files
> > > > > > > > are generated
> > > > > > > > as expected, but I'm getting the following errors on dmesg:
> > > > > > > >=20
> > > > > > > > [=A0=A0=A0 3.872026] debugfs: File 'v3d_ident' in directory=
 '0'
> > > > > > > > already present!
> > > > > > > > [=A0=A0=A0 3.872064] debugfs: File 'v3d_ident' in directory=
 '128'
> > > > > > > > already present!
> > > > > > > > [=A0=A0=A0 3.872078] debugfs: File 'v3d_regs' in directory =
'0' already
> > > > > > > > present!
> > > > > > > > [=A0=A0=A0 3.872087] debugfs: File 'v3d_regs' in directory =
'128'
> > > > > > > > already present!
> > > > > > > > [=A0=A0=A0 3.872097] debugfs: File 'measure_clock' in direc=
tory '0'
> > > > > > > > already present!
> > > > > > > > [=A0=A0=A0 3.872105] debugfs: File 'measure_clock' in direc=
tory '128'
> > > > > > > > already present!
> > > > > > > > [=A0=A0=A0 3.872116] debugfs: File 'bo_stats' in directory =
'0' already
> > > > > > > > present!
> > > > > > > > [=A0=A0=A0 3.872124] debugfs: File 'bo_stats' in directory =
'128'
> > > > > > > > already present!
> > > > > > > >=20
> > > > > > > > It looks like the render node is being added twice, since t=
his
> > > > > > > > doesn't happen
> > > > > > > > for vc4 and vkms.
> > > > > > > Thanks for the feedback and yes that's exactly what I meant w=
ith
> > > > > > > that I haven't looked into all code paths.
> > > > > > >=20
> > > > > > > Could it be that v3d registers it's debugfs files from the
> > > > > > > debugfs_init callback?
> > > > > > Although this is true, I'm not sure if this is the reason why t=
he files
> > > > > > are
> > > > > > being registered twice, as this doesn't happen to vc4, and it a=
lso uses
> > > > > > the
> > > > > > debugfs_init callback. I believe it is somewhat related to the =
fact that
> > > > > > v3d is the primary node and the render node.
> > > > > I see. Thanks for the hint.
> > > > >=20
> > > > > > Best Regards,
> > > > > > - Ma=EDra Canal
> > > > > >=20
> > > > > > > One alternative would be to just completely nuke support for
> > > > > > > separate render node debugfs files and only add a symlink to =
the
> > > > > > > primary node. Opinions?
> > > > > What do you think of this approach? I can't come up with any reas=
on why we
> > > > > should have separate debugfs files for render nodes and I think i=
t is pretty
> > > > > much the same reason you came up with the patch for per device de=
bugfs files
> > > > > instead of per minor.
> > > > They are two entirely separate devices and drivers, it doesn't make=
 much
> > > > sense to move their debugfs files to one or the other.
> > > Well exactly that isn't true.
> > Ok.
> >=20
> > > The primary and render node are just two file under /dev for the same
> > > hardware device and driver.
> > >=20
> > > We just offer different functionality through the two interfaces, but
> > > essentially there isn't any information we could expose for one which
> > > isn't true for the other as well.
> > I'd like to know what criteria you're using to say that they are the
> > same hardware device then, because they don't share the same MMIO
> > mappings, interrupts, clocks, IOMMUs, power domains, etc. They can also
> > operate independently.
>=20
> Well you don't seem to understand what I'm talking about.

I would certainly like you to stop making those kind of statements.
Apart from creating unnecessary tension, they don't bring anything to
the discussion.

> This is about the primary and render node under /dev/dri/, not some
> separate hw device.

The thing is, vc4 and v3d are both different nodes under /dev/dri and
separate hw devices.

> So you really have only one hardware device. E.g. clocks, IOMMU, power
> etc... is all the same.

Well, I mean, you can claim that all you want, but they certainly aren't
the same hardware device. Just like on virtually any !x86 SoC, the GPU
and display engines aren't the same device, and most of the time don't
even come from the same vendor.

Going back to the initial issue, one of the files exposed by the v3d
driver is the v3d registers content. It makes no sense to expose the v3d
registers into the primary (vc4) node when the hardware doesn't match,
and v3d has its own node.

Maxime
