Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C210153E4EE
	for <lists+dri-devel@lfdr.de>; Mon,  6 Jun 2022 15:59:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FA4410E6F9;
	Mon,  6 Jun 2022 13:59:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout4-smtp.messagingengine.com (wout4-smtp.messagingengine.com
 [64.147.123.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C6510EA0F
 for <dri-devel@lists.freedesktop.org>; Mon,  6 Jun 2022 13:59:17 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id B19413200931;
 Mon,  6 Jun 2022 09:59:16 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute3.internal (MEProxy); Mon, 06 Jun 2022 09:59:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm1; t=1654523956; x=1654610356; bh=vB+pOdcnnn
 CnPWwbYVT9ycMrCrub3l+a0yxKe+6aP5o=; b=wClVA+DxDRZBtiflKzOFzQyVzM
 QQ5hxKlyE76wY4vzLU2hH0L3HLynvqSnTyND5juD6q6lDmhcCDx4g9t4qOvO/Lki
 bW/CCP1n2y6Zi3AfivPq2Z4L8thW+2TPbdsTbatyjFIZyCeB8SFXtaVr53gro5tc
 vhztOmdVITamZbwkFZ4DZNQuPfdv19JoDreGmm1flCC4+J528ne/BnFkzSR37y2F
 JZWfTBmD3jXomOI9k3tUJ6WfRWM06BtCjI9AA8EO5i+w8KlgbySAFqG5Hi6HmlqV
 fNoOgAsFWDnYs8KfuKxYEE/tbz94cbSwww6KwwluznU9f1Pq267mNK5+H3Gg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm2; t=1654523956; x=1654610356; bh=vB+pOdcnnnCnPWwbYVT9ycMrCrub
 3l+a0yxKe+6aP5o=; b=FKNO7AkzP70GhIxpnAsWY5zerMnFvTjodVtf21yxhtgD
 mOFPdPoMWAbv5BKl44WgHDLrivBNExZiUfDs7bzDaGtiM75zVGAR4N4o3T47GTv9
 QUS5vazOLGBpkcjg+VeyC7oR3WETLVybNrI/f6RX7Bj7H2cmYlvpykrOKInbM30R
 VUiGYOjEdw0fhdnPYeG7dGC5LTwxF6oL2nuHeb1o69XXLuDjeIn+lvx+O2T0saHB
 CYqzXb7RcyoD0BBvHPUEIRv0SzJk+JD/7fbZh91kS4kX1DIPs2B6G5uFChqfnyJX
 SpnmildOMByl7RgGFzr4cMVHXzKQdE28BDNJVn3V5w==
X-ME-Sender: <xms:MwieYoL6l0LJKS6cqBUq92i0mnId5S2gj_BjMDIwZaj1JJ-G86WzfQ>
 <xme:MwieYoKRlNm3hMkKsluJrQksZTK7TeNx1psAIP3Q8RdWsZl922HBWDNp--NaflQ4b
 nRXmihmwwemzKU4tDs>
X-ME-Received: <xmr:MwieYosYNfZnt1SBV2lMURLfGI2n7X6R1h0yg-bfmFzW7hGfSCzaaDmaBQz_FFy2DKFtxKiZuRp2n4OG6CY26JANdfggVg2rDxHINhU>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddtvddgjedtucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:MwieYlbBr_dnggut85E5ccFVYZWJJebmGu2xXEJS1RaTOQRYRvP-Mg>
 <xmx:MwieYvZZFGmllbfvF-3l_6mXDmHf2QucAZbXunqYigw0b_f_q3kcgg>
 <xmx:MwieYhDuK8rHNFlTbrri5IQ6OVGaAmKNOFULkvICsE7K0tfW3Ol1YQ>
 <xmx:NAieYrEFfpaAUoemKN0KSwgOHexx6c7ox3zjAZNA4JSahhr8YAwW1w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jun 2022 09:59:15 -0400 (EDT)
Date: Mon, 6 Jun 2022 15:59:14 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Melissa Wen <mwen@igalia.com>
Subject: Re: [PATCH 13/14] drm/vc4: crtc: Fix out of order frames during
 asynchronous page flips
Message-ID: <20220606135914.2ghokdevbjrqjlef@houat>
References: <20220503121341.983842-1-maxime@cerno.tech>
 <20220503121341.983842-14-maxime@cerno.tech>
 <20220509171005.lx3pqifg3s4e7nkj@mail.igalia.com>
 <20220509171442.svodrkdp4zjsat57@mail.igalia.com>
 <20220512104442.4n7g3nq622wzknmr@mail.igalia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="odufxp7iiknnz7iq"
Content-Disposition: inline
In-Reply-To: <20220512104442.4n7g3nq622wzknmr@mail.igalia.com>
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
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel.vetter@intel.com>,
 dri-devel@lists.freedesktop.org, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--odufxp7iiknnz7iq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, May 12, 2022 at 09:44:42AM -0100, Melissa Wen wrote:
> On 05/09, Melissa Wen wrote:
> > O 05/09, Melissa Wen wrote:
> > > On 05/03, Maxime Ripard wrote:
> > > > When doing an asynchronous page flip (PAGE_FLIP ioctl with the
> > > > DRM_MODE_PAGE_FLIP_ASYNC flag set), the current code waits for the
> > > > possible GPU buffer being rendered through a call to
> > > > vc4_queue_seqno_cb().
> > > >=20
> > > > On the BCM2835-37, the GPU driver is part of the vc4 driver and that
> > > > function is defined in vc4_gem.c to wait for the buffer to be rende=
red,
> > > > and once it's done, call a callback.
> > > >=20
> > > > However, on the BCM2711 used on the RaspberryPi4, the GPU driver is
> > > > separate (v3d) and that function won't do anything. This was working
> > > > because we were going into a path, due to uninitialized variables, =
that
> > > > was always scheduling the callback.
> > > >=20
> > > > However, we were never actually waiting for the buffer to be render=
ed
> > > > which was resulting in frames being displayed out of order.
> > > >=20
> > > > The generic API to signal those kind of completion in the kernel ar=
e the
> > > > DMA fences, and fortunately the v3d drivers supports them and signal
> > > > when its job is done. That API also provides an equivalent function=
 that
> > > > allows to have a callback being executed when the fence is signalle=
d as
> > > > done.
> > > >=20
> > > > Let's change our driver a bit to rely on the previous function for =
the
> > > > older SoCs, and on DMA fences for the BCM2711.
> > > >=20
> > > > Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> > > > ---
> > > >  drivers/gpu/drm/vc4/vc4_crtc.c | 41 ++++++++++++++++++++++++++++++=
++--
> > > >  1 file changed, 39 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/v=
c4_crtc.c
> > > > index e0ae7bef08fa..8e1369fca937 100644
> > > > --- a/drivers/gpu/drm/vc4/vc4_crtc.c
> > > > +++ b/drivers/gpu/drm/vc4/vc4_crtc.c
> > > > @@ -776,6 +776,7 @@ struct vc4_async_flip_state {
> > > >  	struct drm_pending_vblank_event *event;
> > > > =20
> > > >  	union {
> > > > +		struct dma_fence_cb fence;
> > > >  		struct vc4_seqno_cb seqno;
> > > >  	} cb;
> > > >  };
> > > > @@ -835,6 +836,43 @@ static void vc4_async_page_flip_seqno_complete=
(struct vc4_seqno_cb *cb)
> > > >  		vc4_bo_dec_usecnt(bo);
> > > >  }
> > > > =20
> > > > +static void vc4_async_page_flip_fence_complete(struct dma_fence *f=
ence,
> > > > +					       struct dma_fence_cb *cb)
> > > > +{
> > > > +	struct vc4_async_flip_state *flip_state =3D
> > > > +		container_of(cb, struct vc4_async_flip_state, cb.fence);
> > > > +
> > > > +	vc4_async_page_flip_complete(flip_state);
> > > > +	dma_fence_put(fence);
> > > > +}
> > > > +
> > > > +static int vc4_async_set_fence_cb(struct drm_device *dev,
> > > > +				  struct vc4_async_flip_state *flip_state)
> > > > +{
> > > > +	struct drm_framebuffer *fb =3D flip_state->fb;
> > > > +	struct drm_gem_cma_object *cma_bo =3D drm_fb_cma_get_gem_obj(fb, =
0);
> > > > +	struct vc4_dev *vc4 =3D to_vc4_dev(dev);
> > > > +	struct dma_fence *fence;
> > > > +	int ret;
> > > > +
> > > > +	if (!vc4->is_vc5) {
> > > > +		struct vc4_bo *bo =3D to_vc4_bo(&cma_bo->base);
> > > > +
> > > > +		return vc4_queue_seqno_cb(dev, &flip_state->cb.seqno, bo->seqno,
> > > > +					  vc4_async_page_flip_seqno_complete);
> > > > +	}
> > > > +
> > > > +	ret =3D dma_resv_get_singleton(cma_bo->base.resv, false, &fence);
> > + for kernel bot complaint, I replaced false with `DMA_RESV_USAGE_READ`
> > to run some tests
> >=20
> > > > +	if (ret)
> > > > +		return ret;
> > > > +
> > > > +	if (dma_fence_add_callback(fence, &flip_state->cb.fence,
> me again :)
>=20
> I was thinking if we should add a check here for !fence and just complete=
 the page flip,
> instead of letting `dma_fence_add_callback` warns whenever fence is NULL.
> I think there are situation in which fence is NULL and it is not an
> issue, right? Does it make sense?

I'm not sure. What situation do you have in mind?

Maxime

--odufxp7iiknnz7iq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYp4IMgAKCRDj7w1vZxhR
xf0GAQDH7BBKByzJ3X1vzIs4RLiujlTNXZ32cyABsUwo4F1vugEA0bRrOba2KUrk
866Xc+1KcmJV7bn1t6nE8PJALEIBggc=
=7snx
-----END PGP SIGNATURE-----

--odufxp7iiknnz7iq--
