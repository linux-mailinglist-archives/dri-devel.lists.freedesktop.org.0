Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBA7C59FEBF
	for <lists+dri-devel@lfdr.de>; Wed, 24 Aug 2022 17:48:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECB27B7E7C;
	Wed, 24 Aug 2022 15:48:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A7D8B7D97
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Aug 2022 15:48:27 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.west.internal (Postfix) with ESMTP id CEE8C32009C8;
 Wed, 24 Aug 2022 11:48:26 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Wed, 24 Aug 2022 11:48:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
 :cc:content-type:date:date:from:from:in-reply-to:in-reply-to
 :message-id:mime-version:references:reply-to:sender:subject
 :subject:to:to; s=fm3; t=1661356106; x=1661442506; bh=KiIFMGOdSQ
 RAgyuh6d1iUT5BtacW3klnbBIVwJD0Oqs=; b=kvnRV1eddW5m5h4fMiulMBz1dv
 xnNqkypAWWx0UFAeELpiH5uG7JTd1l4D5DBqX3akRyi7ve4rwihHV82zctXkrcty
 ZhKjSde99R6jb5JW2titRfm1779ohFweEFVBMj5cn35ZlfzA6z18ECGvEZdl4XwJ
 LbejOZG6PwvXCYcGMG5+4ik3naJ9iyIEJFEce6YdyVVXzrtWurgBhPH/FoAeLeY+
 jDd8Ik0V72ZPMsl7MRfuWNOs2aK/qJSlz5ft/OOjFozTSoF5GOfwsheLJp60AEdd
 rTXaaq1JyF4HZaImbW/DO7wfP9URJROrIz/a4oLfoRwPovw7K+F97LnafshA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
 :feedback-id:from:from:in-reply-to:in-reply-to:message-id
 :mime-version:references:reply-to:sender:subject:subject:to:to
 :x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
 fm1; t=1661356106; x=1661442506; bh=KiIFMGOdSQRAgyuh6d1iUT5BtacW
 3klnbBIVwJD0Oqs=; b=RrmBPMmC4K/PIzZBG5PT2o4WofGgwCRlnN9XV9jrjqo2
 cdEcKncx6qJfkHc7Wy9UkHpv3y31Ws383TayXakm/YoCcNE81rMYbqX2Ozime0or
 dpQat30mlDb1aESdrIwWImJ7sQDGOPQl3NQ8y30sBP39CiWNnqKsGJBqALbFLHbd
 EJ2JVEwCZxuQk5GIe/4hGfNAPM3uUahjtCFvq34kw2BfWWFleWiyCk8xzhp5PFRz
 ERQ5Pjo1UvGCOgSjMyTRRBsvFc1eLcXZEPxLOfN8EQnBYGr6cpzho48xRPNKDIbn
 WTaGkknCKVbIcZ36gHcjFpmIf6PODgI39bJm7fQNOQ==
X-ME-Sender: <xms:SkgGY7fbesNrMwqMcg1LyxZzrxutpGHvP1E7QMh_MYMaQwFIP6NYeg>
 <xme:SkgGYxMTYCPwxFj0942kfgH_p-KeDdp1DnMbObKlbz35aJwBl85NR9RJy-aqWfAcJ
 xyJkk9wQPLhXmOf7pY>
X-ME-Received: <xmr:SkgGY0iJ72fxmpIEcCIAtRStsL3v7ckcNtgNGkVcjbJy3U-xh4-XeKpr7EFh>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdejuddgleehucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepfffhvfevuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihi
 mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
 htthgvrhhnpeetfefffefgkedtfefgledugfdtjeefjedvtddtkeetieffjedvgfehheff
 hfevudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
 hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:SkgGY8-Pl7kej_EyLcSnGm-_ytk16aIXAJ-H4nxu988KY8wqHbQeHg>
 <xmx:SkgGY3v504GGZmf_-JAS-Rr2zsh2NNidLpAy-m2He6ZV9YOywOP0sg>
 <xmx:SkgGY7FXsOGcxEq4wAMGzc7QjAUsa0_M3X6o8kltLsUI1kNoMC_JVQ>
 <xmx:SkgGYxI2JiRg2JayFiuWCDgqV-qaRhzRqesfleI7HaNfbS7P-3F6ZQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Aug 2022 11:48:25 -0400 (EDT)
Date: Wed, 24 Aug 2022 17:48:23 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Danilo Krummrich <dakr@redhat.com>
Subject: Re: [PATCH drm-misc-next v2 2/4] drm/vc4: plane: protect device
 resources after removal
Message-ID: <20220824154823.qu3tdwypg5o3ci4z@houat>
References: <20220819110849.192037-1-dakr@redhat.com>
 <20220819110849.192037-3-dakr@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="i6p2xirgmwjujatv"
Content-Disposition: inline
In-Reply-To: <20220819110849.192037-3-dakr@redhat.com>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--i6p2xirgmwjujatv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2022 at 01:08:47PM +0200, Danilo Krummrich wrote:
> (Hardware) resources which are bound to the driver and device lifecycle
> must not be accessed after the device and driver are unbound.
>=20
> However, the DRM device isn't freed as long as the last user closed it,
> hence userspace can still call into the driver.
>=20
> Therefore protect the critical sections which are accessing those
> resources with drm_dev_enter() and drm_dev_exit().
>=20
> Fixes: 9872c7a31921 ("drm/vc4: plane: Switch to drmm_universal_plane_allo=
c()")
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/vc4/vc4_plane.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_pl=
ane.c
> index eff9c63adfa7..c46acb770036 100644
> --- a/drivers/gpu/drm/vc4/vc4_plane.c
> +++ b/drivers/gpu/drm/vc4/vc4_plane.c
> @@ -19,6 +19,7 @@
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_atomic_uapi.h>
>  #include <drm/drm_blend.h>
> +#include <drm/drm_drv.h>
>  #include <drm/drm_fb_dma_helper.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_framebuffer.h>
> @@ -1219,6 +1220,10 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane,=
 u32 __iomem *dlist)
>  {
>  	struct vc4_plane_state *vc4_state =3D to_vc4_plane_state(plane->state);
>  	int i;
> +	int idx;
> +
> +	if (!drm_dev_enter(plane->dev, &idx))
> +		goto out;
> =20
>  	vc4_state->hw_dlist =3D dlist;
> =20
> @@ -1226,6 +1231,9 @@ u32 vc4_plane_write_dlist(struct drm_plane *plane, =
u32 __iomem *dlist)
>  	for (i =3D 0; i < vc4_state->dlist_count; i++)
>  		writel(vc4_state->dlist[i], &dlist[i]);
> =20
> +	drm_dev_exit(idx);
> +
> +out:
>  	return vc4_state->dlist_count;
>  }
> =20
> @@ -1245,6 +1253,7 @@ void vc4_plane_async_set_fb(struct drm_plane *plane=
, struct drm_framebuffer *fb)
>  	struct vc4_plane_state *vc4_state =3D to_vc4_plane_state(plane->state);
>  	struct drm_gem_dma_object *bo =3D drm_fb_dma_get_gem_obj(fb, 0);
>  	uint32_t addr;
> +	int idx;
> =20
>  	/* We're skipping the address adjustment for negative origin,
>  	 * because this is only called on the primary plane.
> @@ -1252,12 +1261,17 @@ void vc4_plane_async_set_fb(struct drm_plane *pla=
ne, struct drm_framebuffer *fb)
>  	WARN_ON_ONCE(plane->state->crtc_x < 0 || plane->state->crtc_y < 0);
>  	addr =3D bo->dma_addr + fb->offsets[0];
> =20
> +	if (!drm_dev_enter(plane->dev, &idx))
> +		return;
> +
>  	/* Write the new address into the hardware immediately.  The
>  	 * scanout will start from this address as soon as the FIFO
>  	 * needs to refill with pixels.
>  	 */
>  	writel(addr, &vc4_state->hw_dlist[vc4_state->ptr0_offset]);
> =20
> +	drm_dev_exit(idx);
> +

You did change the CRTC patch, but the comment to protect the entire
function also applies to this one.

Maxime

--i6p2xirgmwjujatv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCYwZIRwAKCRDj7w1vZxhR
xTpMAP9QqYSv8ty8je48B2HuywFGJE+Q2WGNAW/paVlqkHD0WwD/XgOG/VA+mckd
g+GkI3JRlnAhkCqVRyReiq/t0DFeagk=
=OEZa
-----END PGP SIGNATURE-----

--i6p2xirgmwjujatv--
