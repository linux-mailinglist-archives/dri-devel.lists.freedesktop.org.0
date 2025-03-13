Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B51CA5F86B
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 15:34:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB51310E1DD;
	Thu, 13 Mar 2025 14:34:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="pTfRH0T6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 169A610E1DD
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 14:34:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BC5175C5E3C;
 Thu, 13 Mar 2025 14:32:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE564C4CEEB;
 Thu, 13 Mar 2025 14:34:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741876487;
 bh=4K9tzoTtsP7BAI3B6cdLbG/K3RYZzOAO85EJfhQyad8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=pTfRH0T6OKHomu6IanaWZ2qglSzsYxgg0HiLa/4qRR/pbRm/XaQH5zuz+HTko7gLq
 LsKRSjwgd2cGbV35vsUNH790ot/mSKFyDw5M9oBEVX2l5AMKtBvHduvs+qg80Pu2+7
 RPvn6e+PczMCDUTBkdC6AOmlBoiSWSkbwefhzFwG0iv27I/w5eMiU1h27RVfx6UXAJ
 ru6b/vvdiK8Lgez9/kWStynD+bPOHbMQ4+otxApA2rsXOYmUhNXzJuK5jWFE6U2aeH
 3lLnwMg+c5g0Zythzmmh3zxyttYBWWhpjdCbOxe6e6LclCqfnELafCb7VWv5QfjSpp
 4y71Z2nLB4/lA==
Date: Thu, 13 Mar 2025 15:34:44 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Anusha Srivatsa <asrivats@redhat.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/2] drm/panel: Add new helpers for refcounted panel
 allocatons
Message-ID: <20250313-enlightened-shrewd-skunk-b6ed72@houat>
References: <20250312-drm-panel-v1-0-e99cd69f6136@redhat.com>
 <20250312-drm-panel-v1-1-e99cd69f6136@redhat.com>
 <20250313110944.1c1f7e4e@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="2ate5ne4iejyiwlh"
Content-Disposition: inline
In-Reply-To: <20250313110944.1c1f7e4e@booty>
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


--2ate5ne4iejyiwlh
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH RFC 1/2] drm/panel: Add new helpers for refcounted panel
 allocatons
MIME-Version: 1.0

On Thu, Mar 13, 2025 at 11:09:44AM +0100, Luca Ceresoli wrote:
> Hello Anusha,
>=20
> On Wed, 12 Mar 2025 20:54:42 -0400
> Anusha Srivatsa <asrivats@redhat.com> wrote:
>=20
> > Introduce reference counted allocations for panels to avoid
> > use-after-free. The patch adds the macro devm_drm_bridge_alloc()
> > to allocate a new refcounted panel. Followed the documentation for
> > drmm_encoder_alloc() and devm_drm_dev_alloc and other similar
> > implementations for this purpose.
> >=20
> > Also adding drm_panel_get() and drm_panel_put() to suitably
> > increment and decrement the refcount
> >=20
> > Signed-off-by: Anusha Srivatsa <asrivats@redhat.com>
>=20
> I'm very happy to see the very first step of the panel rework mentioned
> by Maxime see the light! :-)
>=20
> This patch looks mostly good to me, and the similarity with my bridge
> refcounting work is by itself reassuring.
>=20
> I have a few notes, one is relevant and the others are minor details,
> see below.
>=20
> In the Subject line: s/allocatons/allocations/
>=20
> [...]
>=20
> > +void *__devm_drm_panel_alloc(struct device *dev, size_t size, size_t o=
ffset,
> > +			     const struct drm_panel_funcs *funcs)
> > +{
> > +	void *container;
> > +	struct drm_panel *panel;
> > +	int err;
> > +
> > +	if (!funcs) {
> > +		dev_warn(dev, "Missing funcs pointer\n");
> > +		return ERR_PTR(-EINVAL);
> > +	}
> > +
> > +	container =3D kzalloc(size, GFP_KERNEL);
> > +	if (!container)
> > +		return ERR_PTR(-ENOMEM);
> > +
> > +	panel =3D container + offset;
> > +	panel->container_offset =3D offset;
> > +	panel->funcs =3D funcs;
> > +	kref_init(&panel->refcount);
> > +
> > +	err =3D devm_add_action_or_reset(dev, drm_panel_put_void, panel);
> > +	if (err)
> > +		return ERR_PTR(err);
> > +
> > +	drm_panel_init(panel, dev, funcs, panel->connector_type);
>=20
> panel->connector_type here is uninitialized. You are passing
> panel->connector_type to drm_panel_init(), which will then copy it into
> panel->connector_type itself.

Yeah, we need to have the connector type as a parameter.

Maxime

--2ate5ne4iejyiwlh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9LtBAAKCRDj7w1vZxhR
xYMCAQCVGbMderUCo19/lZEwItzpHYd9ffnbQ7OXbu9onz68zwEAhS/0Ln7m5ePp
bVFGwvzvZZ65R983T9RMp3zR8bo9sws=
=nzmg
-----END PGP SIGNATURE-----

--2ate5ne4iejyiwlh--
