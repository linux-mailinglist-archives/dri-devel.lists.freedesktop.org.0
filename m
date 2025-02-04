Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48362A27649
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 16:44:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F13810E6A9;
	Tue,  4 Feb 2025 15:44:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="PXevnNNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1841F10E6A2
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Feb 2025 15:44:09 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 89CDD5C46F2;
 Tue,  4 Feb 2025 15:43:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D3C7C4CEDF;
 Tue,  4 Feb 2025 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738683848;
 bh=9LjR4PrthTacJS1PcN56bU3Mu47B6G3tqgbyXyXgOXA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=PXevnNNj56Mn3/RrfsdBMkk+CSi8osqLayw4LQehsm8BZFM8KQ2Z1neHySuvgFTks
 c1qLsUIMt+LeuLlZm7zOpxwY1dGlcmeF9EM1S/1jLNdAJqGySskA5eRgMM5cgsDPCF
 BEruBGIUOWOoxEaqV13wQ6hXTQ/qRiOg06uNsGfTRG4/lIekHJCtlsThzC3ZbBxBMH
 zBbACCJXd3NWLPRysuhjQ/JiUGQUy8b8PlJVRVj04CFcClFvP70MxZG8ViPI7tTYOE
 uLF0bty3Bc4RA23bgkNUo9Rj8AknLNpO0TMZpQXRd1iIx0yFpfeG7lx0/7ZbGonvoJ
 lk+1VG5/SVIVQ==
Date: Tue, 4 Feb 2025 16:44:05 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>, 
 Paul Kocialkowski <contact@paulk.fr>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
Message-ID: <20250204-aspiring-pumpkin-mastiff-5077be@houat>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-8-173065a1ece1@bootlin.com>
 <7kpgrgqp2jx6ivkwdc5ax3dfah2qkajaedpcdadldselr4bdlq@jewss2bdl4or>
 <20250102130149.5784c09b@booty> <20250110115819.55bc887b@booty>
 <20250116113236.39ba876a@booty>
 <20250116-brave-feathered-dormouse-8ea4cf@houat>
 <20250121122729.41c8f2b1@booty>
 <ksxomce6vddld7vikzyjd55babho63vj6ej5vrsiwfp2tid6yu@xfpagqpata4v>
 <20250129125146.22981c9f@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="5xavrfqrozjzhklo"
Content-Disposition: inline
In-Reply-To: <20250129125146.22981c9f@booty>
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


--5xavrfqrozjzhklo
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 08/10] drm/bridge: samsung-dsim: use supporting
 variable for out_bridge
MIME-Version: 1.0

Hi Luca,

On Wed, Jan 29, 2025 at 12:51:46PM +0100, Luca Ceresoli wrote:
> > > > > For hotplugging we cannot use drmm and devm and instead we use ge=
t/put,
> > > > > to let the "next bridge" disappear with the previous one still pr=
esent.
> > > > > So the trivial idea is to add a drm_of_get_bridge(), similar to
> > > > > {drmm,devm_drm}_of_get_bridge() except it uses plain
> > > > > drm_panel_bridge_add() instead of devm/drmm variants. But then the
> > > > > caller (which is the panel consumer) will have to dispose of the =
struct
> > > > > drm_bridge pointer by calling:
> > > > >=20
> > > > >  - drm_bridge_put() in case a)
> > > > >  - drm_panel_bridge_remove in case b)
> > > > >=20
> > > > > And that's the problem I need to solve.   =20
> > > >=20
> > > > I'm not sure the problem is limited to panel_bridge. Your question =
is
> > > > essentially: how do I make sure a driver-specific init is properly =
freed
> > > > at drm_bridge_put time. This was done so far mostly at bridge remove
> > > > time, but we obviously can't do that anymore.
> > > >=20
> > > > But we'd have the same issue if, say, we needed to remove a workque=
ue
> > > > from a driver.
> > > >=20
> > > > I think we need a destroy() hook for bridges, just like we have for
> > > > connectors for example that would deal with calling
> > > > drm_panel_bridge_remove() if necessary, or any other driver-specific
> > > > sequence. =20
> > >=20
> > > The .destroy hook looked appealing at first, however as I tried to
> > > apply the idea to bridges I'm not sure it matches. Here's why.
> > >=20
> > > The normal (and sane) flow for a bridge is:
> > >=20
> > >  A) probe
> > >     1. allocate private struct embedding struct drm_bridge
> > >        (I have an _alloc() variant ready for v5 to improve this as yo=
u proposed)
> > >     2. get resources, initialize struct fields
> > >     3. drm_bridge_add(): publish bridge into global bridge_list
> > >=20
> > > Now the bridge can be found and pointers taken and used. =20
> >=20
> > We agree so far.
>=20
> Good :-)
>=20
> > > And on hardware removal, in reverse order:
> > > =20
> > >  B) remove (hardware is hot-unplugged)
> > >     3. unpublish bridge
> > >     2. release resources, cleanup
> > >     1. kfree private struct =20
> >=20
> > I think the sequence would rather be something like:
> >=20
> > B') remove
> >   3. unpublish bridge
> >   2. release device resources
> >   1. release reference
> >=20
> > C') last put
> >   2. release KMS resources
> >   1. kfree private struct
>=20
> Just to ensure we are on the same page: patch 3 is already implementing
> this model except for C'2.
>=20
> Well, in reality it even implements a .destroy callback at C'2, even
> though it was not meant for the usage you have in mind and it's
> scheduled for removal in v6 -- even though as I said I'm OK in
> re-adding it if it is useful.
>=20
> Mainly I'm not sure I understand for which ultimate goal you propose to
> postpone releasing KMS resources to C'.
>=20
> Is it (1) because we _want_ to postpone releasing KMS resources? In this
> case I don't know the use case, so if you have a practical example it
> would probably help a lot.

It's not that we want it, it's that it's already happening :)

The main DRM device is only torn down not when its devices goes away,
but when the last application closes its fd to the device file. Thus,
there's a significant window (possibly infinitely long) between the
device being removed and the DRM device being freed, during which the
application will still be able to issue ioctl that might reach the
driver.

Thus, we have two kind of resources: the ones tied to the device
(clocks, register mappings, etc.) that will go away when the device is
removed, and the ones tied to the DRM device (connectors, bridges, etc.)
that need to stick until the DRM device is free'd. It's the difference
between devm and drmm actions.

> Moreover, for the panel bridge specifically, it would mean postponing
> the destruction of the struct panel_bridge, which however has a pointer
> to the panel. But the panel is probably hot-unplugged at the same time
> as the previous removable bridge(s), we'd have a time window between B'
> and C' where there is a pointer to a freed struct panel. We'd need to
> ensure that pointer is cleared at B'2, even though it is a "KMS
> resource" and not a "device resource".

You're correct, but we have to start somewhere. Fixing the issue for
bridges only will already fix it for all setups using only bridges, even
if the ones using panels are still broken.

I'm also mentoring someone at the moment to fix this for panels, so it's
only temporary.

> Or is it (2) because there are cases where we don't know how else we
> could release the KMS resources? AFAIK all bridge drivers are able to
> release everything in their remove function (B'2) with the exception of
> the panel bridge, so this sounds like a workaround for just one user
> that apparently we all agree should be improved on its own anyway.
>=20
> Note I'm not strongly against (2), if it simplifies the path towards
> dynamic bridge lifetime by postponing the panel bridge rework. I just
> need to understand the plan.
>=20
> Another question is what is a device resource and what is a KMS
> resource. What's the boolean expression to classify a
> resource in one or the other family? For example, in your example
> quoted above ("But we'd have the same issue if, say, we needed to
> remove a workqueue from a driver"), is the workqueue a KMS resource?

It depends on what the workqueue is doing. If it's to handle atomic
commits like the writeback code, then it's KMS facing. If it's to handle
interrupts, it's device facing.

It's hard to come up with a boolean classification, but it's basically
"can any ioctl code path end up using that resource?".

> I need to understand your idea if I want to implement it.
>=20
> > > Some drivers do real stuff in B2, so it is important that B3 happens
> > > before B2, isn't it? We don't want other drivers to find and use a
> > > bridge that is being dismantled, or afterwards. =20
> >=20
> > Yeah, B3/B'3 should definitely happen first.
> >=20
> > > B3 should normally happen by removing the bridge from the global
> > > bridge_list, or other bridges might find it. However setting the "gon=
e"
> > > bool and teaching of_drm_find_bridge() & Co to skip bridges with
> > > gone=3D=3Dtrue would allow to postpone the actual removal, if needed.
> > >=20
> > > With that said, with hotplugging there will be two distinct events:
> > >=20
> > >  * hardware removal
> > >  * last ref is put
> > >=20
> > > The second event could happen way later than the first one. During the
> > > time frame between the two events we need the bridge to be unpublished
> > > and the bridge resources to be already released, as the hardware is
> > > gone. We cannot do this at the last put, it's too late.
> > >=20
> > > So I think the only sane sequence is:
> > >=20
> > >  * on hardware removal:
> > >      B3) unpublish bridge (drm_bridge_remove() or just set gone flag)
> > >      B2) free resources, deinit whatever needed
> > >  * when last ref is put
> > >      B1) kfree (likely via devm) =20
> >=20
> > No, devm will have destroyed it in B'2. We need to destroy it in the
> > cleanup hook of kref_put
>=20
> devm will have destroyed what? Sorry I'm not following.
>
> If you mean "it" =3D=3D "the private struct", then no, this is not the
> case. drm_bridge_init in patch 3 does not kfree the private struct but
> instead registers a devm action to call drm_bridge_put. Then, at the
> last put, drm_bridge_free() will actually kfree the private struct.
>=20
> In this v5, kree()ing the private struct at the last put is done via
> a callback. In my work towards v6 the principle is the same but I have
> reworked it all, implementing a devm_drm_bridge_alloc() macro as you
> suggested (BTW that was a great improvement, thanks) and removing the
> .destroy callback as it was not needed.
>=20
> In case it helps, here's a preview of my v6, with some added comments to
> support this discussion:
>=20
> /* Internal function (for refcounted bridges) */
> void __drm_bridge_free(struct kref *kref)
> {
>         struct drm_bridge *bridge =3D container_of(kref, struct drm_bridg=
e, refcount);
>         void *container =3D ((void*)bridge) - bridge->container_offset;
>=20
>         DRM_DEBUG("bridge=3D%p, container=3D%p FREE\n", bridge, container=
);
>=20
>         kfree(container);
> }
> EXPORT_SYMBOL(__drm_bridge_free);
>=20
> static inline void drm_bridge_put(struct drm_bridge *bridge)
> {
>         if (!drm_bridge_is_refcounted(bridge))
>                 return;
>=20
>         DRM_DEBUG("bridge=3D%p PUT\n", bridge);
>=20
>         kref_put(&bridge->refcount, __drm_bridge_free);
> }
>=20
> static void drm_bridge_put_void(void *data)
> {
>         struct drm_bridge *bridge =3D (struct drm_bridge *)data;
>=20
>         drm_bridge_put(bridge);
> }
>=20
> // fold this into __devm_drm_bridge_alloc() or keep for consistency
> // with drm_encoder.c?
> static int __devm_drm_bridge_init(struct device *dev, struct drm_bridge *=
bridge,
>                                   size_t offset, const struct drm_bridge_=
funcs *funcs)
> {
>         int err;
>=20
>         bridge->container_offset =3D offset;
>         kref_init(&bridge->refcount);
>         bridge->is_refcounted =3D 1;
>=20
>         err =3D devm_add_action_or_reset(dev, drm_bridge_put_void, bridge=
); // <=3D=3D devm just puts one ref, does not kfree
>         if (err)
>                 return err;
>=20
>         bridge->funcs =3D funcs;
>=20
>         return 0;
> }
>=20
> void *__devm_drm_bridge_alloc(struct device *dev, size_t size, size_t off=
set,
>                               const struct drm_bridge_funcs *funcs)
> {
>         void *container;
>         struct drm_bridge *bridge;
>         int ret;
>=20
>         if (!funcs) {
>                 dev_warn(dev, "Missing funcs pointer\n");
>                 return ERR_PTR(-EINVAL);
>         }
>=20
>         container =3D kzalloc(size, GFP_KERNEL);     // <=3D=3D NOT alloc=
ating with devm
>         if (!container)
>                 return ERR_PTR(-ENOMEM);
>=20
>         bridge =3D container + offset;
>=20
>         ret =3D __devm_drm_bridge_init(dev, bridge, offset, funcs);
>         if (ret)
>                 return ERR_PTR(ret);
>=20
>         DRM_DEBUG("bridge=3D%p, container=3D%p, funcs=3D%ps ALLOC\n", bri=
dge, container, funcs);
>=20
>         return container;
> }
> EXPORT_SYMBOL(__devm_drm_bridge_alloc);

Awesome, I guess we were actually understanding each other the whole
time then :)

I'm still kind of sure we'll require a destroy callback to call in
__drm_bridge_free, but if it works, I guess it's good enough for now.

Maxime

--5xavrfqrozjzhklo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6I1xQAKCRAnX84Zoj2+
din7AX4z+wlKG9YMZHp7rfMZ14/EeGu5xVI5ae27mPjjrzm7+YoB26/yCsz2Fjgc
B9yCjsUBgMJBbRsTw/yYGmfshRFLspEG0zSCYqcLMrW0pD/OeUhgeD6YEOmq61WG
CgTVZu0JkQ==
=t+af
-----END PGP SIGNATURE-----

--5xavrfqrozjzhklo--
