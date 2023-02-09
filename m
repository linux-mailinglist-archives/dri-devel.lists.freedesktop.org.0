Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3156690B86
	for <lists+dri-devel@lfdr.de>; Thu,  9 Feb 2023 15:19:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C116910E20C;
	Thu,  9 Feb 2023 14:19:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93FD810E20C
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Feb 2023 14:19:30 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 02F8C5C0032;
 Thu,  9 Feb 2023 09:19:28 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
 by compute5.internal (MEProxy); Thu, 09 Feb 2023 09:19:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm2; t=1675952367; x=1676038767; bh=OSY+bJv3do
 oz6le47m1ziOIkOkoyKiZtvv4g0fRCFJY=; b=n6rSEPA9jVqAj6Gw0QJrJFBjcd
 OaC3z/CzCIdKHOEsk7MA4ghgLTYKZrW8tOSvYmYJ8Z7wv0Swi1vLjnMpoQcTWh9u
 THbi5RZ4ev46JXQQmPa9/j6x0Wl/eIsfoTsWgJQ5F/WEvxr7FSL8DPS6PfEg2hw5
 sY8p5twLaYO6nCrMCkuR5lzU/WXqk9B/Zt00QGTAsdF4MgGehV8Ac4vFdZkeKjBc
 C6xiaZtwoUje4qRtF/OR9GMRBQTsy2oDJc2nm5L+DIsc3CMpCoFe1P4COLtfi5Sq
 X45YGlhe6fabc3r4QHwPNJFDCSobrkGrYhvi/JhsMDs3BiQdAiCClBP0U82A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1675952367; x=1676038767; bh=OSY+bJv3dooz6le47m1ziOIkOkoy
 KiZtvv4g0fRCFJY=; b=l1KLOiruT367vxZC4f+HIG72EOQrAnFnSaTangfBLNzM
 kCpY9QQ2TA4sfwwDOyIQIDBPhCiLh0o6q1xTlCYL/vsSbj4aKkA79bfKY3TK85g2
 foVOotbx0/C0rrk4QWFQMupe6WGZjnCVcBTqcySmsV9JCqpGcBuNn8ScmL0Rak4g
 pRYEW3q6zV3Arjyi6EChvP+VMP+94RUd1kuamEiH+LweVTyBgjaZvLH9qTwGosJV
 kPDCgbnnWSkdPJU9dUFNpup7v2NyzJ0jR13pGiZWdFsQvyuz3m3Zw+HsDoT7Yqk2
 7f3BiORRfRJMFTjKtoKtzxH5p4DWQGzYes9VtXtqjQ==
X-ME-Sender: <xms:7wDlY-AnEWHiJlMlzJsBCg_dPTD4XkEmxVXPW4eJEAR5jnSRFWijPQ>
 <xme:7wDlY4hWlwiOvuj20iUUTJsPQKapi19iixYbC-zPFcDcmW527Tu0btPhtKD12iU4W
 PJv1TUoTcfJsDJqe5k>
X-ME-Received: <xmr:7wDlYxlg7kz1n_AuN-t0R5JiURSF6cW9WOvsWrD8eLqywvn3_0xI2rAAEWOz6kOCV-2qgQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrudehfedgieduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtudenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeejveefheefkeeiffegveelveetgffffeektdefuefhtedtgeejhefggedu
 ffffudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:7wDlY8zMxHW-sTpdr481CCUjQWK1RzBFtEUEfg5eJsbT3tczGK6PAA>
 <xmx:7wDlYzQ_HuW7Czq26UDRQqcigvc4Jj8JEqrmyjYu3P-TNwjNzob-Gw>
 <xmx:7wDlY3Y9gJdxihEIrg1tPHENvWaHbozPytx1uwL8_nxKSNz99XfPDA>
 <xmx:7wDlYyJ6JSXEDqGayTbnML4WOih5lQK8O9HE_gMK8Mv6csOHD02qBA>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 9 Feb 2023 09:19:26 -0500 (EST)
Date: Thu, 9 Feb 2023 15:19:23 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Christian =?utf-8?B?S8O2bmln?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: Try to address the drm_debugfs issues
Message-ID: <20230209141923.4n4ffsqchdrx5vnp@houat>
References: <20230209081838.45273-1-christian.koenig@amd.com>
 <0d9c852b-8639-55f4-4ec1-ca24f72d72f7@igalia.com>
 <4161ae4e-549c-00f6-5f37-f635a9cb775d@gmail.com>
 <613b9aec-7105-ca2d-13cd-16ddd85a6fda@igalia.com>
 <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="fyqrkao6nomnlqbz"
Content-Disposition: inline
In-Reply-To: <cbe1ac86-1d41-bcf7-679b-ad4e2a810361@gmail.com>
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


--fyqrkao6nomnlqbz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 09, 2023 at 03:06:10PM +0100, Christian K=F6nig wrote:
> Am 09.02.23 um 14:06 schrieb Ma=EDra Canal:
> > On 2/9/23 09:13, Christian K=F6nig wrote:
> > > Am 09.02.23 um 12:23 schrieb Ma=EDra Canal:
> > > > On 2/9/23 05:18, Christian K=F6nig wrote:
> > > > > Hello everyone,
> > > > >=20
> > > > > the drm_debugfs has a couple of well known design problems.
> > > > >=20
> > > > > Especially it wasn't possible to add files between
> > > > > initializing and registering
> > > > > of DRM devices since the underlying debugfs directory wasn't
> > > > > created yet.
> > > > >=20
> > > > > The resulting necessity of the driver->debugfs_init()
> > > > > callback function is a
> > > > > mid-layering which is really frowned on since it creates a horrib=
le
> > > > > driver->DRM->driver design layering.
> > > > >=20
> > > > > The recent patch "drm/debugfs: create device-centered
> > > > > debugfs functions" tried
> > > > > to address those problem, but doesn't seem to work
> > > > > correctly. This looks like
> > > > > a misunderstanding of the call flow around
> > > > > drm_debugfs_init(), which is called
> > > > > multiple times, once for the primary and once for the render node.
> > > > >=20
> > > > > So what happens now is the following:
> > > > >=20
> > > > > 1. drm_dev_init() initially allocates the drm_minor objects.
> > > > > 2. ... back to the driver ...
> > > > > 3. drm_dev_register() is called.
> > > > >=20
> > > > > 4. drm_debugfs_init() is called for the primary node.
> > > > > 5. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
> > > > > =A0=A0=A0 drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
> > > > > to add the files
> > > > > =A0=A0=A0 for the primary node.
> > > > > 6. The driver->debugfs_init() callback is called to add
> > > > > debugfs files for the
> > > > > =A0=A0=A0 primary node.
> > > > > 7. The added files are consumed and added to the primary
> > > > > node debugfs directory.
> > > > >=20
> > > > > 8. drm_debugfs_init() is called for the render node.
> > > > > 9. drm_framebuffer_debugfs_init(), drm_client_debugfs_init() and
> > > > > =A0=A0=A0 drm_atomic_debugfs_init() call drm_debugfs_add_file(s)()
> > > > > to add the files
> > > > > =A0=A0=A0 again for the render node.
> > > > > 10. The driver->debugfs_init() callback is called to add
> > > > > debugfs files for the
> > > > > =A0=A0=A0=A0 render node.
> > > > > 11. The added files are consumed and added to the render
> > > > > node debugfs directory.
> > > > >=20
> > > > > 12. Some more files are added through drm_debugfs_add_file().
> > > > > 13. drm_debugfs_late_register() add the files once more to
> > > > > the primary node
> > > > > =A0=A0=A0=A0 debugfs directory.
> > > > > 14. From this point on files added through
> > > > > drm_debugfs_add_file() are simply ignored.
> > > > > 15. ... back to the driver ...
> > > > >=20
> > > > > Because of this the dev->debugfs_mutex lock is also
> > > > > completely pointless since
> > > > > any concurrent use of the interface would just randomly
> > > > > either add the files to
> > > > > the primary or render node or just not at all.
> > > > >=20
> > > > > Even worse is that this implementation nails the coffin for
> > > > > removing the
> > > > > driver->debugfs_init() mid-layering because otherwise
> > > > > drivers can't control
> > > > > where their debugfs (primary/render node) are actually added.
> > > > >=20
> > > > > This patch set here now tries to clean this up a bit, but
> > > > > most likely isn't
> > > > > fully complete either since I didn't audit every driver/call path.
> > > >=20
> > > > I tested the patchset on the v3d, vc4 and vkms and all the files
> > > > are generated
> > > > as expected, but I'm getting the following errors on dmesg:
> > > >=20
> > > > [=A0=A0=A0 3.872026] debugfs: File 'v3d_ident' in directory '0'
> > > > already present!
> > > > [=A0=A0=A0 3.872064] debugfs: File 'v3d_ident' in directory '128'
> > > > already present!
> > > > [=A0=A0=A0 3.872078] debugfs: File 'v3d_regs' in directory '0' alre=
ady
> > > > present!
> > > > [=A0=A0=A0 3.872087] debugfs: File 'v3d_regs' in directory '128'
> > > > already present!
> > > > [=A0=A0=A0 3.872097] debugfs: File 'measure_clock' in directory '0'
> > > > already present!
> > > > [=A0=A0=A0 3.872105] debugfs: File 'measure_clock' in directory '12=
8'
> > > > already present!
> > > > [=A0=A0=A0 3.872116] debugfs: File 'bo_stats' in directory '0' alre=
ady
> > > > present!
> > > > [=A0=A0=A0 3.872124] debugfs: File 'bo_stats' in directory '128'
> > > > already present!
> > > >=20
> > > > It looks like the render node is being added twice, since this
> > > > doesn't happen
> > > > for vc4 and vkms.
> > >=20
> > > Thanks for the feedback and yes that's exactly what I meant with
> > > that I haven't looked into all code paths.
> > >=20
> > > Could it be that v3d registers it's debugfs files from the
> > > debugfs_init callback?
> >=20
> > Although this is true, I'm not sure if this is the reason why the files
> > are
> > being registered twice, as this doesn't happen to vc4, and it also uses
> > the
> > debugfs_init callback. I believe it is somewhat related to the fact that
> > v3d is the primary node and the render node.
>=20
> I see. Thanks for the hint.
>=20
> >=20
> > Best Regards,
> > - Ma=EDra Canal
> >=20
> > >=20
> > > One alternative would be to just completely nuke support for
> > > separate render node debugfs files and only add a symlink to the
> > > primary node. Opinions?
>=20
> What do you think of this approach? I can't come up with any reason why we
> should have separate debugfs files for render nodes and I think it is pre=
tty
> much the same reason you came up with the patch for per device debugfs fi=
les
> instead of per minor.

They are two entirely separate devices and drivers, it doesn't make much
sense to move their debugfs files to one or the other.

Maxime

--fyqrkao6nomnlqbz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY+UA5QAKCRDj7w1vZxhR
xXSKAP9n++dFIzCH7SAKAgyVGZnNbbg2RvvZ4n2rOFVseBTw6AEA8PxMGw0dIvCb
YV7Z0+OZR5mMFoizeyRLiC0zsh7oZAU=
=6YFY
-----END PGP SIGNATURE-----

--fyqrkao6nomnlqbz--
