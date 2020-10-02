Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121D628230F
	for <lists+dri-devel@lfdr.de>; Sat,  3 Oct 2020 11:24:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 060D06E2ED;
	Sat,  3 Oct 2020 09:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD456E12D
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Oct 2020 12:31:18 +0000 (UTC)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailout.nyi.internal (Postfix) with ESMTP id B5B905C009C;
 Fri,  2 Oct 2020 08:31:15 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute6.internal (MEProxy); Fri, 02 Oct 2020 08:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=
 date:from:to:cc:subject:message-id:references:mime-version
 :content-type:in-reply-to; s=fm1; bh=qoi6tzHHHO2R42uzXoGJBQd1C+u
 f6Ev9WlyzrVqIiNM=; b=iMnmhbYcfG+JtodMWPy2iRK3ph93mT9SzblVunn2RXK
 qt+F2xcqbX5IageN0UPaLx1hsVvPRZkFYwWDglfWK0hZ2FPxP/QjGa7Qiu+nOcUh
 FASRQfy5h2QlyDO+JK/2kL0hrlrhycilRyXoomjEob43APm9euysfHljeMMEBjz/
 cOFEH4Jh26Fm3OCKanc7WH1ytE8SgkwWDp4g5aHHz1R7nQuP6+n6NiA+yITb2Ykh
 +T1c+44dswTEkk9Pcic8cq5QqrABGsR2yrqD2Ncvn0XXNIY7swyTqDE/OfiytqVQ
 yXUMTWONe6rH0S+ZJXWF509IkRfRSKdgGTEYOo5Gj/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=qoi6tz
 HHHO2R42uzXoGJBQd1C+uf6Ev9WlyzrVqIiNM=; b=VqObktL38L2LPw9uk6nq3s
 LzWh5DlwL0fgYUapF6653f+LlFMEW1j6XSLOPszHrHkcvs0Ta2iXyOQhfaPZox2C
 MS105Btmqb92avuWfIs4paNT5iZUXjLgBmclrVjQSWJQDSt0IoH/GQoRhaMsFKW/
 2D3Dt9DLpwP82dM9Hsg8NARq4aNeTjxhTbnhXuD9SzVDgL/Rsd7idKcWOXprHzcQ
 xkSIFWE8rjgMASsFuaBUWQqhpStijliupx6Vsh6IrSx94F+ijSL6wv5GS5De0Fd3
 v1VYGLgbDwfy/qVD+nUg8BI1QF6OTIDaXAPv/JwvabGShfNO7M1S+zmvUzQDsy6g
 ==
X-ME-Sender: <xms:kh13X5VhyW4L7C8Su_wG7B9gIxY3M4_okl4zggEZ8AGheuvBB0cX_g>
 <xme:kh13X5mGvIyB2TElvQNBv8IBzTacF2K6CKw1Tujb__xqygcmWjZxodld6ZMrsa7Jc
 UuBb6snsyeyplaHyfc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrfeeigdehudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpeffhffvuffkfhggtggujgesghdtreertddtvdenucfhrhhomhepofgrgihimhgv
 ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
 gvrhhnpeelkeeghefhuddtleejgfeljeffheffgfeijefhgfeufefhtdevteegheeiheeg
 udenucfkphepledtrdekledrieekrdejieenucevlhhushhtvghrufhiiigvpedtnecurf
 grrhgrmhepmhgrihhlfhhrohhmpehmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:kh13X1YdnweKedbDe0sHFTfxAgjzwxScIkLhcVQOzET4QNZOawSNQg>
 <xmx:kh13X8UtRhd7gToQ1arCWBiLZIzedsZH8M4Z5l9tnAW3ZuyJYEHjfg>
 <xmx:kh13Xzk_4DkcHqPT_yUOp3nTZkm1zWjCoByB8kr3MvfTB0kZnht7vw>
 <xmx:kx13X8DsHNDrm_pzrTLNUItMFB7EtL3VSzwbsLa53OCaR9390n2Dyw>
Received: from localhost (lfbn-tou-1-1502-76.w90-89.abo.wanadoo.fr
 [90.89.68.76])
 by mail.messagingengine.com (Postfix) with ESMTPA id 40E94328005E;
 Fri,  2 Oct 2020 08:31:14 -0400 (EDT)
Date: Fri, 2 Oct 2020 14:31:12 +0200
From: Maxime Ripard <maxime@cerno.tech>
To: Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: Re: [PATCH] drm/atomic: Make the kerneldoc a bit clearer
Message-ID: <20201002123112.uupaal7jed7xkmrf@gilmour.lan>
References: <20201002075620.4157591-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
In-Reply-To: <20201002075620.4157591-1-daniel.vetter@ffwll.ch>
X-Mailman-Approved-At: Sat, 03 Oct 2020 09:23:39 +0000
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: multipart/mixed; boundary="===============0468989821=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--===============0468989821==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="csp3gmyjutc5nh5w"
Content-Disposition: inline


--csp3gmyjutc5nh5w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Oct 02, 2020 at 09:56:20AM +0200, Daniel Vetter wrote:
> Crank up the warning a notch and point at the right set of locking
> functions for atomic drivers.
>=20
> Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> ---
>  drivers/gpu/drm/drm_atomic.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> index aac9122f1da2..b2d20eb6c807 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -1642,11 +1642,11 @@ static void __drm_state_dump(struct drm_device *d=
ev, struct drm_printer *p,
>   * to dmesg in case of error irq's.  (Hint, you probably want to
>   * ratelimit this!)
>   *
> - * The caller must drm_modeset_lock_all(), or if this is called
> - * from error irq handler, it should not be enabled by default.
> - * (Ie. if you are debugging errors you might not care that this
> - * is racey.  But calling this without all modeset locks held is
> - * not inherently safe.)
> + * The caller must wrap this drm_modeset_lock_all_ctx() and
> + * drm_modeset_drop_locks(). If this is called from error irq handler, i=
t should
> + * not be enabled by default - if you are debugging errors you might
> + * not care that this is racey, but calling this without all modeset loc=
ks held
> + * is inherently unsafe.
>   */
>  void drm_state_dump(struct drm_device *dev, struct drm_printer *p)
>  {

For the comment itself:
Acked-by: Maxime Ripard <mripard@kernel.org>

But maybe we should add some lockdep assertion to make sure we can catch
someone actually doing this?

--csp3gmyjutc5nh5w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCX3cdkAAKCRDj7w1vZxhR
xVL4AP4ooYUTUd5ZOzvAXG8hmIazpxIIBjIFS9tmU0Y19D+xcgD+L9uWno5wjxc5
Lh0wfZV/8QJBvcZz+KxC8wl9QBNl5Qk=
=8N3O
-----END PGP SIGNATURE-----

--csp3gmyjutc5nh5w--

--===============0468989821==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0468989821==--
