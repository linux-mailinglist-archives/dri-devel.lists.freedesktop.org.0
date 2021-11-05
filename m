Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBF5446310
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 12:57:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6621F6E239;
	Fri,  5 Nov 2021 11:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBF96E231;
 Fri,  5 Nov 2021 11:57:51 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.west.internal (Postfix) with ESMTP id CD5943200C46;
 Fri,  5 Nov 2021 07:57:48 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Fri, 05 Nov 2021 07:57:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=GXv8uTQQMC84AFsDfN1s4dkYTlk
 J+uJwixHFe05xs5A=; b=G9vj57WOaV98UrEPEj0k756GLwtGvkKCgNeWfJYlzLO
 8p3n1moUFQLu8Rgc3PImQElOxqG8OlB9CcsncF9nRDlvtZI0McDLOiAd1iUZCkos
 sH4jgzv99x23szWPoI7Btceq7RG8gGnTC7jVF5cbG4m+fEqcHTgqPoCW0Ow2XhEa
 ugUqIy8CaZRBN+MgV25uG90nTExvnz1kgQZhzK7ZdNTyV7BkAMZelYssKmjk90dX
 bw9KNQywnYNrCfC/iLGCIaL04KxA6GKOA6CZqrW6dlUr9CcuHmegnkfUeM5wU5tl
 hti53I7VSUyUJR2A+LM8g7uYKSeIWGeS3nsJ0afBv2Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=GXv8uT
 QQMC84AFsDfN1s4dkYTlkJ+uJwixHFe05xs5A=; b=heQkImP7etvn9nYSz4a+vX
 KS10HYncfm65v6J74cBSPuraY2HdAyUI88i6bEEL1D7nSczbdalb1IUOjyVocyBA
 B6Wox3qo2EH2WOQO6HfBRbil3kBFvk8tpvRwAI0+Cua+u5Q2lFtbzziXYF31jdVr
 JXM6wN49ouljb537NLE8rHpIbnCiyj8VDG1UDeh0UgVtUWMTzMjZjbmVVWDfp27q
 afTR7yU61RqP+mCTPIkSGJDV/lg06TuUai1mx00ms7vyX8pYvOvXXnDmpCzgBcmd
 iktyEYJP1u0gyKIgjP6V3/+PWcGYf8WNoubmFN86k9rdsLce/qjvY4C6ANXg9v6A
 ==
X-ME-Sender: <xms:OxyFYTz9_K8EJfG6WNKMucHsQTV85gIeC1kOEV5Cjr6noLJJyFJ1Hg>
 <xme:OxyFYbTWgf0T39im5a6pICEfC3xPdSPm255dQFtpwds8poWzhRFwFFqVSp9S537b0
 zVEOTAvYovmRTxvqOU>
X-ME-Received: <xmr:OxyFYdV6fpR3rC45oQ_yUpLF-BiSBXMoIibqBxB7w-xoaD4HImftM_yUomDiiDiKYSK_xvkNK7QElH9gUNo8bgGrRXd125dfl1FWg2gs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdeigdefvdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
 igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OxyFYdgWdROWw882YshFuN4RvocnR07SK_xcHxoh449QPLVRqPNv7g>
 <xmx:OxyFYVCOxBbf9Ozi6E8hFC10wu0PAaKOMiYpmx8qKXMvCJxlA2XDHg>
 <xmx:OxyFYWIUM1zbwaVAg62wgoVTkvq2JorCdGzAUVCX1Np4qpEjacdaDg>
 <xmx:PByFYZ3CRXHVFGNcxR6gpkkXMoo6m5nChbNS1Kar2blgGR2s-DLBhw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Nov 2021 07:57:47 -0400 (EDT)
Date: Fri, 5 Nov 2021 12:57:45 +0100
From: Maxime Ripard <maxime@cerno.tech>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
Message-ID: <20211105115745.pg2a33quk63l4434@gilmour>
References: <20211015202648.258445ef@canb.auug.org.au>
 <20211101194223.749197c5@canb.auug.org.au>
 <20211105171517.287de894@canb.auug.org.au>
 <874k8qampc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="vkojbrwivjvcbsco"
Content-Disposition: inline
In-Reply-To: <874k8qampc.fsf@intel.com>
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--vkojbrwivjvcbsco
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Nov 05, 2021 at 01:03:43PM +0200, Jani Nikula wrote:
> On Fri, 05 Nov 2021, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> > Hi all,
> >
> > On Mon, 1 Nov 2021 19:42:23 +1100 Stephen Rothwell <sfr@canb.auug.org.a=
u> wrote:
> >>
> >> On Fri, 15 Oct 2021 20:26:48 +1100 Stephen Rothwell <sfr@canb.auug.org=
=2Eau> wrote:
> >> >
> >> > After merging the drm-misc tree, today's linux-next build (arm
> >> > multi_v7_defconfig) failed like this:
> >> >=20
> >> > drivers/gpu/drm/drm_modeset_lock.c:111:29: error: conflicting types =
for '__stack_depot_save'
> >> >   111 | static depot_stack_handle_t __stack_depot_save(void)
> >> >       |                             ^~~~~~~~~~~~~~~~~~
> >> > In file included from include/linux/page_ext.h:7,
> >> >                  from include/linux/mm.h:25,
> >> >                  from include/linux/kallsyms.h:13,
> >> >                  from include/linux/bpf.h:20,
> >> >                  from include/linux/bpf-cgroup.h:5,
> >> >                  from include/linux/cgroup-defs.h:22,
> >> >                  from include/linux/cgroup.h:28,
> >> >                  from include/linux/memcontrol.h:13,
> >> >                  from include/linux/swap.h:9,
> >> >                  from include/linux/suspend.h:5,
> >> >                  from include/linux/regulator/consumer.h:35,
> >> >                  from include/linux/i2c.h:18,
> >> >                  from include/drm/drm_crtc.h:28,
> >> >                  from include/drm/drm_atomic.h:31,
> >> >                  from drivers/gpu/drm/drm_modeset_lock.c:24:
> >> > include/linux/stackdepot.h:18:22: note: previous declaration of '__s=
tack_depot_save' was here
> >> >    18 | depot_stack_handle_t __stack_depot_save(unsigned long *entri=
es,
> >> >       |                      ^~~~~~~~~~~~~~~~~~
> >> >=20
> >> > Caused by commit
> >> >=20
> >> >   cd06ab2fd48f ("drm/locking: add backtrace for locking contended lo=
cks without backoff")
> >> >=20
> >> > This may only have been revealed because of another fix I have had to
> >> > apply today.
> >> >=20
> >> > I have applied the following patch for today.
> >> >=20
> >> > From: Stephen Rothwell <sfr@canb.auug.org.au>
> >> > Date: Fri, 15 Oct 2021 20:17:52 +1100
> >> > Subject: [PATCH] drm/locking: fix for name conflict
> >> >=20
> >> > Fixes: cd06ab2fd48f ("drm/locking: add backtrace for locking contend=
ed locks without backoff")
> >> > Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> >> > ---
> >> >  drivers/gpu/drm/drm_modeset_lock.c | 6 +++---
> >> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >> >=20
> >> > diff --git a/drivers/gpu/drm/drm_modeset_lock.c b/drivers/gpu/drm/dr=
m_modeset_lock.c
> >> > index 4d32b61fa1fd..ee36dd20900d 100644
> >> > --- a/drivers/gpu/drm/drm_modeset_lock.c
> >> > +++ b/drivers/gpu/drm/drm_modeset_lock.c
> >> > @@ -79,7 +79,7 @@
> >> >  static DEFINE_WW_CLASS(crtc_ww_class);
> >> > =20
> >> >  #if IS_ENABLED(CONFIG_DRM_DEBUG_MODESET_LOCK)
> >> > -static noinline depot_stack_handle_t __stack_depot_save(void)
> >> > +static noinline depot_stack_handle_t __drm_stack_depot_save(void)
> >> >  {
> >> >  	unsigned long entries[8];
> >> >  	unsigned int n;
> >> > @@ -108,7 +108,7 @@ static void __stack_depot_print(depot_stack_hand=
le_t stack_depot)
> >> >  	kfree(buf);
> >> >  }
> >> >  #else /* CONFIG_DRM_DEBUG_MODESET_LOCK */
> >> > -static depot_stack_handle_t __stack_depot_save(void)
> >> > +static depot_stack_handle_t __drm_stack_depot_save(void)
> >> >  {
> >> >  	return 0;
> >> >  }
> >> > @@ -317,7 +317,7 @@ static inline int modeset_lock(struct drm_modese=
t_lock *lock,
> >> >  		ret =3D 0;
> >> >  	} else if (ret =3D=3D -EDEADLK) {
> >> >  		ctx->contended =3D lock;
> >> > -		ctx->stack_depot =3D __stack_depot_save();
> >> > +		ctx->stack_depot =3D __drm_stack_depot_save();
> >> >  	}
> >> > =20
> >> >  	return ret;
> >>=20
> >> This has reappeared today.  I don't know what happened to the drm-misc
> >> tree over the weeked :-(
> >>=20
> >> I have reapplied the above fix.
> >
> > So the above drm-misc commit is now in the drm tree, but its fix up
> > commit vanished from the drm-misc tree over the past weekend :-(
>=20
> Cc: drm-misc maintainers.
>=20
> We normally point drm-misc/for-linux-next at drm-misc-next, *except* to
> drm-misc-next-fixes during the merge window. This is because
> drm-misc-next already starts accumulating stuff that's headed to one
> release later, e.g. currently v5.17. I think that's part of the reason.

Indeed

> I probably should have pushed c4f08d7246a5 ("drm/locking: fix
> __stack_depot_* name conflict") to drm-misc-next-fixes.
>=20
> There's still something funny going on, because the drm-misc-next pull
> request [1] isn't part of the drm pull request for v5.16 [2]. Is there
> going to be another drm pull?

The last drm-misc-next PR for some reason didn't got logged into
patchwork, and Dave missed it.

We found out yesterday, and he pulled it today so I assume there will be
a second PR with that last PR and today's drm-misc-next-fixes PR.

Maxime

--vkojbrwivjvcbsco
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYYUcOQAKCRDj7w1vZxhR
xU+MAP4hgo9+qBCiI/qme/i6DPqP4+Y2ORFyGlUEBuEar1UvwgEAtP1vY7VT12Fi
2bs9GPcW2eHwXfRgz2UMaIg32SZO7wM=
=oApB
-----END PGP SIGNATURE-----

--vkojbrwivjvcbsco--
