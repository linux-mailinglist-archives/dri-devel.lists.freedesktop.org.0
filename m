Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 333966910A5
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 19:48:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14F5610EB64;
	Thu,  9 Feb 2023 18:48:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59FC810EB64
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 18:48:49 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id BEC373200941;
 Thu,  9 Feb 2023 13:48:45 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Thu, 09 Feb 2023 13:48:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-transfer-encoding:content-type:date:date:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to; s=fm2; t=1675968525; x=
 1676054925; bh=BN95Mo7HBBb/i4Z8QN5zsMvMCzbwRU+xPxasR0LxsPI=; b=N
 3AgNuWVHyEb1rMBwMJ17JGdrMEFYy7AB5awbLISKYTJV30Sb5sF72PVD0qpF0aDw
 IjJYMkNLN/u1d7Bah+ous/f10EkvXOgViZk4/8yV0gZiRQF/aBeuGQgu/d3hVosQ
 9lq0fLBmyNzomL+VyzzlyeE2ksGcBmvDJgNqNxGp3u2t/gVy7pGX2iuZIYw160xo
 ekVoS/+16KDhAPJ3BfNQ7hqIOUuM6SI1sZhKqgPtUShIb/f3NTxefPq0/MrelzLE
 hgyx0o0/pa3XhLVxXXcH0vVcfuhiY7QoLiTCIjHEImL1SRG8eZKzIOVBcbDuKC1U
 6gJtpvL1B3VyVLOMBy3XQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding
 :content-type:date:date:feedback-id:feedback-id:from:from
 :in-reply-to:in-reply-to:message-id:mime-version:references
 :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1675968525; x=
 1676054925; bh=BN95Mo7HBBb/i4Z8QN5zsMvMCzbwRU+xPxasR0LxsPI=; b=V
 dFw48/n+JnYkwfXZnKZHu976cI5/mwmXeXSX4nGPIAKKvkTxwxdmCVDaHK09+HDd
 JV74a1rzumXNW/hssIYMRgOYbPH4yzzJdkiHNJ7zqthp0tRWIHPY9SQUt7xSy8cj
 VVS9NqzLFPJ/KGu9ufRy3dpjQ1EsQgK9XGqVVjs9VMwdpSipHA2VYh7Xb+sn2IpS
 0vPFciG2n+VaJapziV44ChSG74Mz99wO8S13hqvnTQApiCKLT3VtTMb3RXf9aWW3
 AEZRwvEHICny5NCJ0Aot4G+yb0UskDPmLiNqDdsPjOoC8Lc1TrkcpC2MeEPdPOI1
 E3mEBNGjNl5W07xzc68Vg==
X-ME-Sender: <xms:DEDlY8-Tndom0irOMPE3MQ7GXits-7KNwM-cvNsdnPE4TiDcWRRXsg>
 <xme:DEDlY0sFrrQm5XTAUsfm0KxDI-TPjLkP4u_jEuYA4LWpTpkogD93DOBpKTe-yigv-
 DGRLfgZ1mwt7XKVlg0>
X-ME-Received: <xmr:DEDlYyD7XSkDtsvdm4GJ73I1nmSq3XHtwKDbw-p4Lr1pO7Bh8HPmQ0bcW95DgM10510VOw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehfedgudduhecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpeffhffvvefukfhfgggtugfgjgesthhqredttddtudenucfhrhhomhepofgr
 gihimhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtf
 frrghtthgvrhhnpeelleefieelleetteefvdeikeeffeffvefhtdevgfehveduveehjedv
 vdeiledtieenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:DEDlY8cYBpPktfFP_cJMOr8Tqq8eIlR09zrA0tddPpBF4rWrt-Eu0A>
 <xmx:DEDlYxMbk7k3iFd8I3AH2RgGAlxygYDUcopIkQjiHHrN-6lvDuePvg>
 <xmx:DEDlY2k1YB7gU_GZGtXsDrnXzIHqmjNd182vktYANUTJXGFJ2XPOzQ>
 <xmx:DUDlY1lqOJJBG9K3XT0uNugL5G-K-3VpH5JTaKy1rbv7X6n5gGwP4Q>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 13:48:44 -0500 (EST)
Date: Thu, 9 Feb 2023 19:48:41 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Try to address the drm_debugfs issues
Message-ID: <20230209184841.axndkk66geoopr6d@houat>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
 <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
 <20230209141923.4n4ffsqchdrx5vnp@houat>
 <95e7f52a-46ce-5e16-b686-5e4011693287@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <95e7f52a-46ce-5e16-b686-5e4011693287@gmail.com>
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

On Thu, Feb 09, 2023 at 04:52:54PM +0100, Christian K=F6nig wrote:
> Am 09.02.23 um 15:19 schrieb Maxime Ripard:
> > On Thu, Feb 09, 2023 at 03:06:10PM +0100, Christian K=F6nig wrote:
> > > Am 09.02.23 um 14:06 schrieb Ma=EDra Canal:
> > > > On 2/9/23 09:13, Christian K=F6nig wrote:
> > > > > Am 09.02.23 um 12:23 schrieb Ma=EDra Canal:
> > > > > > On 2/9/23 05:18, Christian K=F6nig wrote:
> > > > > > > Hello everyone,
> > > > > > >=20
> > > > > > > the drm_debugfs has a couple of well known design problems.
> > > > > > >=20
> > > > > > > Especially it wasn't possible to add files between
> > > > > > > initializing and registering
> > > > > > > of DRM devices since the underlying debugfs directory wasn't
> > > > > > > created yet.
> > > > > > >=20
> > > > > > > The resulting necessity of the driver->debugfs_init()
> > > > > > > callback function is a
> > > > > > > mid-layering which is really frowned on since it creates a ho=
rrible
> > > > > > > driver->DRM->driver design layering.
> > > > > > >=20
> > > > > > > The recent patch "drm/debugfs: create device-centered
> > > > > > > debugfs functions" tried
> > > > > > > to address those problem, but doesn't seem to work
> > > > > > > correctly. This looks like
> > > > > > > a misunderstanding of the call flow around
> > > > > > > drm_debugfs_init(), which is called
> > > > > > > multiple times, once for the primary and once for the render =
node.
> > > > > > >=20
> > > > > > > So what happens now is the following:
> > > > > > >=20
> > > > > > > 1. drm_dev_init() initially allocates the drm_minor objects.
> > > > > > > 2. ... back to the driver ...
> > > > > > > 3. drm_dev_register() is called.
> > > > > > >=20
> > > > > > > 4. drm_debugfs_init() is called for the primary node.
> > > > > > > 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() =
and
> > > > > > >  =A0=A0=A0 drm_atomic_debugfs_init() call drm_debugfs_add_fil=
e(s)()
> > > > > > > to add the files
> > > > > > >  =A0=A0=A0 for the primary node.
> > > > > > > 6. The driver->debugfs_init() callback is called to add
> > > > > > > debugfs files for the
> > > > > > >  =A0=A0=A0 primary node.
> > > > > > > 7. The added files are consumed and added to the primary
> > > > > > > node debugfs directory.
> > > > > > >=20
> > > > > > > 8. drm_debugfs_init() is called for the render node.
> > > > > > > 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() =
and
> > > > > > >  =A0=A0=A0 drm_atomic_debugfs_init() call drm_debugfs_add_fil=
e(s)()
> > > > > > > to add the files
> > > > > > >  =A0=A0=A0 again for the render node.
> > > > > > > 10. The driver->debugfs_init() callback is called to add
> > > > > > > debugfs files for the
> > > > > > >  =A0=A0=A0=A0 render node.
> > > > > > > 11. The added files are consumed and added to the render
> > > > > > > node debugfs directory.
> > > > > > >=20
> > > > > > > 12. Some more files are added through drm_debugfs_add_file().
> > > > > > > 13. drm_debugfs_late_register() add the files once more to
> > > > > > > the primary node
> > > > > > >  =A0=A0=A0=A0 debugfs directory.
> > > > > > > 14. From this point on files added through
> > > > > > > drm_debugfs_add_file() are simply ignored.
> > > > > > > 15. ... back to the driver ...
> > > > > > >=20
> > > > > > > Because of this the dev->debugfs_mutex lock is also
> > > > > > > completely pointless since
> > > > > > > any concurrent use of the interface would just randomly
> > > > > > > either add the files to
> > > > > > > the primary or render node or just not at all.
> > > > > > >=20
> > > > > > > Even worse is that this implementation nails the coffin for
> > > > > > > removing the
> > > > > > > driver->debugfs_init() mid-layering because otherwise
> > > > > > > drivers can't control
> > > > > > > where their debugfs (primary/render node) are actually added.
> > > > > > >=20
> > > > > > > This patch set here now tries to clean this up a bit, but
> > > > > > > most likely isn't
> > > > > > > fully complete either since I didn't audit every driver/call =
path.
> > > > > > I tested the patchset on the v3d, vc4 and vkms and all the files
> > > > > > are generated
> > > > > > as expected, but I'm getting the following errors on dmesg:
> > > > > >=20
> > > > > > [=A0=A0=A0 3.872026] debugfs: File 'v3d_ident' in directory '0'
> > > > > > already present!
> > > > > > [=A0=A0=A0 3.872064] debugfs: File 'v3d_ident' in directory '12=
8'
> > > > > > already present!
> > > > > > [=A0=A0=A0 3.872078] debugfs: File 'v3d_regs' in directory '0' =
already
> > > > > > present!
> > > > > > [=A0=A0=A0 3.872087] debugfs: File 'v3d_regs' in directory '128'
> > > > > > already present!
> > > > > > [=A0=A0=A0 3.872097] debugfs: File 'measure_clock' in directory=
 '0'
> > > > > > already present!
> > > > > > [=A0=A0=A0 3.872105] debugfs: File 'measure_clock' in directory=
 '128'
> > > > > > already present!
> > > > > > [=A0=A0=A0 3.872116] debugfs: File 'bo_stats' in directory '0' =
already
> > > > > > present!
> > > > > > [=A0=A0=A0 3.872124] debugfs: File 'bo_stats' in directory '128'
> > > > > > already present!
> > > > > >=20
> > > > > > It looks like the render node is being added twice, since this
> > > > > > doesn't happen
> > > > > > for vc4 and vkms.
> > > > > Thanks for the feedback and yes that's exactly what I meant with
> > > > > that I haven't looked into all code paths.
> > > > >=20
> > > > > Could it be that v3d registers it's debugfs files from the
> > > > > debugfs_init callback?
> > > > Although this is true, I'm not sure if this is the reason why the f=
iles
> > > > are
> > > > being registered twice, as this doesn't happen to vc4, and it also =
uses
> > > > the
> > > > debugfs_init callback. I believe it is somewhat related to the fact=
 that
> > > > v3d is the primary node and the render node.
> > > I see. Thanks for the hint.
> > >=20
> > > > Best Regards,
> > > > - Ma=EDra Canal
> > > >=20
> > > > > One alternative would be to just completely nuke support for
> > > > > separate render node debugfs files and only add a symlink to the
> > > > > primary node. Opinions?
> > > What do you think of this approach? I can't come up with any reason w=
hy we
> > > should have separate debugfs files for render nodes and I think it is=
 pretty
> > > much the same reason you came up with the patch for per device debugf=
s files
> > > instead of per minor.
> > They are two entirely separate devices and drivers, it doesn't make much
> > sense to move their debugfs files to one or the other.
>=20
> Well exactly that isn't true.

Ok.

> The primary and render node are just two file under /dev for the same
> hardware device and driver.
>=20
> We just offer different functionality through the two interfaces, but
> essentially there isn't any information we could expose for one which
> isn't true for the other as well.

I'd like to know what criteria you're using to say that they are the
same hardware device then, because they don't share the same MMIO
mappings, interrupts, clocks, IOMMUs, power domains, etc. They can also
operate independently.

So unless that criteria is that they share the RAM, they cannot be
considered the same hardware device.

Maxime
