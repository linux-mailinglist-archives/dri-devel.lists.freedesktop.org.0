Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27E48A6B7F3
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 10:47:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D85010E76B;
	Fri, 21 Mar 2025 09:47:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YAzRNXkP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5D6210E76B
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 09:47:08 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id DB2355C6D66;
 Fri, 21 Mar 2025 09:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15688C4CEE3;
 Fri, 21 Mar 2025 09:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742550419;
 bh=CrjzwuYeRw8z388mFRTNM1uWt3Eih30tX6FE2LRfNEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YAzRNXkPaVqBCYAcfWCXgu+fHdAoKNEbVEEbTKhFtNHdRRRmCQLPfaqQCYG1CaWRP
 MfZ/dOtLPfIlLRSM4HnonzpzdjvKevTIRq4zhK+aMFl/unjkjkWDMjoCtlyDC8tOt6
 wapxffF7pW9KmDTYXFUFwEZEWVTpOr9ZQFHQVigCafNktskLxpIaWcn6kjfut/Q/zJ
 pnS+h+zsVJLCUqka33UDYqNeDKcHUw9j3m1zVmfEf9GZpbhZXc6/Tf+HCp3Ed63cfl
 ISEYPdy/70tJRqV1U3D3sE6b/sQBAVOeU+e07+xaPpupd8NCipDD7Qpb83ZAJwraH8
 zdHsHSxQjxwRg==
Date: Fri, 21 Mar 2025 10:46:56 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Andy Yan <andyshrk@163.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Douglas Anderson <dianders@chromium.org>,
 Herve Codina <herve.codina@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, lumag@kernel.org
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <20250321-majestic-cicada-of-argument-15b2d0@houat>
References: <608c01c.7716.1958e8d879f.Coremail.andyshrk@163.com>
 <20250313-dazzling-deer-of-ampleness-21db67@houat>
 <6ae1c567.8c6.195922195d6.Coremail.andyshrk@163.com>
 <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
 <20250314-courageous-bison-of-prestige-8b884b@houat>
 <lf4wu5v3wym3foqgimuulyzz2dmd2jezkj3otn7xm7xp77nast@azqmajrn45lw>
 <20250314-hissing-spirited-armadillo-dc9d3a@houat>
 <2tfryn5plcqysdobavbjljnd3rq5ar2n2qmeyyryk6wqbx2zpk@qvqpkxe5ffjl>
 <20250318-active-giraffe-of-memory-e0c66d@houat>
 <lsbzit4765y6jrw7jmbpfb6rixidenpndjwgw2yx57rz2espux@hbfco2ht6vwi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="tbbglb6tkryifmhd"
Content-Disposition: inline
In-Reply-To: <lsbzit4765y6jrw7jmbpfb6rixidenpndjwgw2yx57rz2espux@hbfco2ht6vwi>
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


--tbbglb6tkryifmhd
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
MIME-Version: 1.0

On Tue, Mar 18, 2025 at 09:00:29PM +0200, Dmitry Baryshkov wrote:
> On Tue, Mar 18, 2025 at 04:51:19PM +0100, Maxime Ripard wrote:
> > On Fri, Mar 14, 2025 at 08:28:22PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Mar 14, 2025 at 06:40:24PM +0100, Maxime Ripard wrote:
> > > > On Fri, Mar 14, 2025 at 09:59:36AM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, Mar 14, 2025 at 08:45:17AM +0100, Maxime Ripard wrote:
> > > > > > On Fri, Mar 14, 2025 at 07:52:35AM +0200, Dmitry Baryshkov wrot=
e:
> > > > > > > On Fri, Mar 14, 2025 at 08:50:29AM +0800, Andy Yan wrote:
> > > > > > > > At 2025-03-13 19:55:33, "Maxime Ripard" <mripard@kernel.org=
> wrote:
> > > > > > > > >Hi,
> > > > > > > > >
> > > > > > > > >On Thu, Mar 13, 2025 at 04:09:54PM +0800, Andy Yan wrote:
> > > > > > > > >> At 2025-03-05 19:55:19, "Andy Yan" <andyshrk@163.com> wr=
ote:
> > > > > > > > >> >At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel=
=2Eorg> wrote:
> > > > > > > > >> >>With the bridges switching over to drm_bridge_connecto=
r, the direct
> > > > > > > > >> >>association between a bridge driver and its connector =
was lost.
> > > > > > > > >> >>
> > > > > > > > >> >>This is mitigated for atomic bridge drivers by the fac=
t you can access
> > > > > > > > >> >>the encoder, and then call drm_atomic_get_old_connecto=
r_for_encoder() or
> > > > > > > > >> >>drm_atomic_get_new_connector_for_encoder() with drm_at=
omic_state.
> > > > > > > > >> >>
> > > > > > > > >> >>This was also made easier by providing drm_atomic_stat=
e directly to all
> > > > > > > > >> >>atomic hooks bridges can implement.
> > > > > > > > >> >>
> > > > > > > > >> >>However, bridge drivers don't have a way to access drm=
_atomic_state
> > > > > > > > >> >>outside of the modeset path, like from the hotplug int=
errupt path or any
> > > > > > > > >> >>interrupt handler.
> > > > > > > > >> >>
> > > > > > > > >> >>Let's introduce a function to retrieve the connector c=
urrently assigned
> > > > > > > > >> >>to an encoder, without using drm_atomic_state, to make=
 these drivers'
> > > > > > > > >> >>life easier.
> > > > > > > > >> >>
> > > > > > > > >> >>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro=
=2Eorg>
> > > > > > > > >> >>Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > > > > >> >>Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > > >> >>---
> > > > > > > > >> >> drivers/gpu/drm/drm_atomic.c | 45 +++++++++++++++++++=
+++++++++++++++++++++++++
> > > > > > > > >> >> include/drm/drm_atomic.h     |  3 +++
> > > > > > > > >> >> 2 files changed, 48 insertions(+)
> > > > > > > > >> >>
> > > > > > > > >> >>diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gp=
u/drm/drm_atomic.c
> > > > > > > > >> >>index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b1=
32590e78f8d41d48eb4da4bccf170ee236 100644
> > > > > > > > >> >>--- a/drivers/gpu/drm/drm_atomic.c
> > > > > > > > >> >>+++ b/drivers/gpu/drm/drm_atomic.c
> > > > > > > > >> >>@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for=
_encoder(const struct drm_atomic_state *state,
> > > > > > > > >> >>=20
> > > > > > > > >> >> 	return NULL;
> > > > > > > > >> >> }
> > > > > > > > >> >> EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encode=
r);
> > > > > > > > >> >>=20
> > > > > > > > >> >>+/**
> > > > > > > > >> >>+ * drm_atomic_get_connector_for_encoder - Get connect=
or currently assigned to an encoder
> > > > > > > > >> >>+ * @encoder: The encoder to find the connector of
> > > > > > > > >> >>+ * @ctx: Modeset locking context
> > > > > > > > >> >>+ *
> > > > > > > > >> >>+ * This function finds and returns the connector curr=
ently assigned to
> > > > > > > > >> >>+ * an @encoder.
> > > > > > > > >> >>+ *
> > > > > > > > >> >>+ * Returns:
> > > > > > > > >> >>+ * The connector connected to @encoder, or an error p=
ointer otherwise.
> > > > > > > > >> >>+ * When the error is EDEADLK, a deadlock has been det=
ected and the
> > > > > > > > >> >>+ * sequence must be restarted.
> > > > > > > > >> >>+ */
> > > > > > > > >> >>+struct drm_connector *
> > > > > > > > >> >>+drm_atomic_get_connector_for_encoder(const struct drm=
_encoder *encoder,
> > > > > > > > >> >>+				     struct drm_modeset_acquire_ctx *ctx)
> > > > > > > > >> >>+{
> > > > > > > > >> >>+	struct drm_connector_list_iter conn_iter;
> > > > > > > > >> >>+	struct drm_connector *out_connector =3D ERR_PTR(-EIN=
VAL);
> > > > > > > > >> >>+	struct drm_connector *connector;
> > > > > > > > >> >>+	struct drm_device *dev =3D encoder->dev;
> > > > > > > > >> >>+	int ret;
> > > > > > > > >> >>+
> > > > > > > > >> >>+	ret =3D drm_modeset_lock(&dev->mode_config.connectio=
n_mutex, ctx);
> > > > > > > > >> >>+	if (ret)
> > > > > > > > >> >>+		return ERR_PTR(ret);
> > > > > > > > >> >
> > > > > > > > >> >It seems that this will cause a deadlock when called fr=
om a  hotplug handling path,
> > > > > > > > >> >I have a WIP DP diver[0],  which suggested by Dmitry to=
 use this API from a=20
> > > > > > > > >> >&drm_bridge_funcs.detect callback to get the connector,=
  as detect is called by drm_helper_probe_detect,
> > > > > > > > >> >which will hold connection_mutex first, so the deaklock=
 happens:
> > > > > > > > >> >
> > > > > > > > >> >
> > > > > > > > >> >drm_helper_probe_detect(struct drm_connector *connector,
> > > > > > > > >> >                        struct drm_modeset_acquire_ctx =
*ctx,
> > > > > > > > >> >                        bool force)
> > > > > > > > >> >{
> > > > > > > > >> >        const struct drm_connector_helper_funcs *funcs =
=3D connector->helper_private;
> > > > > > > > >> >        struct drm_device *dev =3D connector->dev;
> > > > > > > > >> >        int ret;
> > > > > > > > >> >
> > > > > > > > >> >        if (!ctx)
> > > > > > > > >> >                return drm_helper_probe_detect_ctx(conn=
ector, force);
> > > > > > > > >> >
> > > > > > > > >> >        ret =3D drm_modeset_lock(&dev->mode_config.conn=
ection_mutex, ctx);
> > > > > > > > >> >        if (ret)
> > > > > > > > >> >                return ret;
> > > > > > > > >> >
> > > > > > > > >> >        if (funcs->detect_ctx)
> > > > > > > > >> >                ret =3D funcs->detect_ctx(connector, ct=
x, force);
> > > > > > > > >> >        else if (connector->funcs->detect)
> > > > > > > > >> >                ret =3D connector->funcs->detect(connec=
tor, force);
> > > > > > > > >> >        else
> > > > > > > > >> >                ret =3D connector_status_connected;
> > > > > > > > >> >
> > > > > > > > >> >        if (ret !=3D connector->status)
> > > > > > > > >> >                connector->epoch_counter +=3D 1;
> > > > > > > > >> >
> > > > > > > > >> >So I wonder can we let drm_bridge_funcs.detect pass a c=
onnector for this case ?
> > > > > > > > >> >
> > > > > > > > >> >
> > > > > > > > >> >
> > > > > > > > >> >[0]https://lore.kernel.org/linux-rockchip/047EECFC-7E55=
-44EC-896F-13FE04333E4D@gmail.com/T/#m25bc53b79f5cc7bddfcb7aae5656f68df396f=
094
> > > > > > > > >> >>+
> > > > > > > > >> >>+	drm_connector_list_iter_begin(dev, &conn_iter);
> > > > > > > > >> >>+	drm_for_each_connector_iter(connector, &conn_iter) {
> > > > > > > > >> >>+		if (!connector->state)
> > > > > > > > >> >>+			continue;
> > > > > > > > >> >>+
> > > > > > > > >> >>+		if (encoder =3D=3D connector->state->best_encoder) {
> > > > > > > > >> >>+			out_connector =3D connector;
> > > > > > > > >>=20
> > > > > > > > >>=20
> > > > > > > > >> When try to use this patch in my bridge driver,  I found=
 that the connector->state->best_encoder=20
> > > > > > > > >>  maybe NULL when   drm_bridge_funcs.detect or drm_bridge=
_funcs.detect_ctx is  called:
> > > > > > > > >>=20
> > > > > > > > >> [   52.713030] Invalid return value -22 for connector de=
tection
> > > > > > > > >> [   52.713539] WARNING: CPU: 7 PID: 288 at drivers/gpu/d=
rm/drm_probe_helper.c:602 drm_helper_probe_single_connector_modes+0x5e0/
> > > > > > > > >> 0x63c
> > > > > > > > >> [   52.714568] Modules linked in:
> > > > > > > > >>=20
> > > > > > > > >> [   52.724546] Call trace:
> > > > > > > > >> [   52.724762]  drm_helper_probe_single_connector_modes+=
0x5e0/0x63c (P)
> > > > > > > > >> [   52.725319]  drm_mode_getconnector+0x2a4/0x488
> > > > > > > > >> [   52.725711]  drm_ioctl_kernel+0xb4/0x11c
> > > > > > > > >> [   52.726057]  drm_ioctl+0x22c/0x544
> > > > > > > > >> [   52.726358]  __arm64_sys_ioctl+0xac/0xe0
> > > > > > > > >> [   52.726706]  invoke_syscall+0x44/0x100
> > > > > > > > >> [   52.727039]  el0_svc_common.constprop.0+0x3c/0xd4
> > > > > > > > >>=20
> > > > > > > > >> This is because  best_encoder is set by set_best_encoder=
, which is called from
> > > > > > > > >> drm_atomic_helper_check_modeset. When we call drm_mode_g=
etconnector=20
> > > > > > > > >> for the first time, the functions mentioned above have n=
ot been called yet,
> > > > > > > > >> then we can't match the encoder from connector->state->b=
est_encoder for this case.
> > > > > > > > >
> > > > > > > > >As far as I'm concerned, it's by design. Encoders and conn=
ectors have
> > > > > > > > >1:N relationship, and only once a connector has been enabl=
ed it has an
> > > > > > > > >encoder.
> > > > > > > > >
> > > > > > > > >If the connector is disabled, there's no associated encode=
r.
> > > > > > > >=20
> > > > > > > > Does this prove that this API is not suitable for my applic=
ation scenario:=20
> > > > > > > > Get the connector in the bridge's .detect callback, so this=
 means that I may
> > > > > > > > still need to modify the bridge's connector callback so tha=
t it can pass the connector ?
> > > > > > >=20
> > > > > > > I'd say, yes, please.
> > > > > >=20
> > > > > > And I'd say no :)
> > > > >=20
> > > > > Fair enough :-)
> > > > >=20
> > > > > > There's no reason to deviate from the API other entities have h=
ere. It's
> > > > > > just that the switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR hasn't b=
een
> > > > > > completely thought through and it's one of the part where it sh=
ows.
> > > > > >=20
> > > > > > We have two alternative solutions: Either the driver creates the
> > > > > > connector itself, since it doesn't seem to use any downstream b=
ridge
> > > > > > anyway, or we need a new bridge helper to find the connector on=
 a bridge
> > > > > > chain.
> > > > > >=20
> > > > > > We have the iterator already, we just need a new accessor to re=
trieve
> > > > > > the (optional) connector of a bridge, and if there's none, go t=
o the
> > > > > > next bridge and try again.
> > > > >=20
> > > > > The problem is that there is no guarantee that the the created co=
nnector
> > > > > is created for or linked to any bridge. For example, for msm driv=
er I'm
> > > > > waiting for several series to go in, but after that I plan to wor=
k on
> > > > > moving connector creation to the generic code within the msm driv=
er.
> > > > >=20
> > > > > In other words, with DRM_BRIDGE_ATTACH_NO_CONNECTOR in place it is
> > > > > perfectly legit not to have a bridge which has "connector of a br=
idge".
> > > > > It is possible to create drm_bridge_connector on the drm_encoder'=
s side
> > > > > after the drm_bridge_attach() succeeds.
> > > >=20
> > > > Sure, but then I'd expect detect and get_modes to only be called *a=
fter*
> > > > that connector has been created, right?
> > >=20
> > > Yes. But you can not get the connector by following bridge chain. Wel=
l,
> > > unless you include encoder into the chain. If that's what you have had
> > > in mind, then please excuse me, I didn't understand that from the
> > > beginning.
> >=20
> > You can't include the encoder either, because the encoder doesn't have a
> > connector assigned yet at that time.
> >=20
> > However, you can:
> >=20
> >   - Store the bridge attach flags in drm_bridge
> >=20
> >   - Create a hook that returns the connector a bridge creates, depending
> >     on the attach flags.
> >=20
> >   - Create a helper that iterates over the next bridges until the
> >     previous hook returns !NULL. If it doesn't find anything, return
> >     NULL.
> >=20
> > AFAIK, it solves all the problems being discussed here, while dealing
> > with legacy and new-style bridge drivers.
>=20
> I'm still fail to understand how does that solve the issue for new-style
> bridges. How do we find the created drm_bridge_connector for them?

Sigh, for some reason I was remembering that drm_bridge_connector was a
bridge itself, which it isn't. My bad. But I guess it still applies. If
we make drm_bridge_connector a bridge, then it works, doesn't it?

> >=20
> > > But frankly speaking, I think it might be easier to pass down the
> > > connector to the detect callback (as drm_connector_funcs.detect alrea=
dy
> > > gets the connecor) rather than making bridge drivers go through the
> > > chain to get the value that is already present in the caller function.
> > >=20
> > > (For some other usecases I'd totally agree with you, especially if the
> > > connector isn't already available on the caller side).
> >=20
> > Still, we've tried to converge to the same API for all entities, it
> > feels like a step backward to me.
>=20
> I'd argue here a bit. The drm_connector interface has connector here.
> drm_bridge is an extension/subpart of the drm_connector, so it would be
> logical to extend that interface.

The drm_connector interface has the connector because it's a connector.
Just like CRTC atomic_check has a crtc, but you wouldn't pass the crtc
pointer to drm_bridge atomic_check.

I still think it goes against the trend and work we've been doing over
the years. And we should at least *try* something different instead of
just taking the easy way out. Or accepting to duplicate the helpers that
started the discussion, or to create a connector directyl instead of
using drm_bridge_connector for that driver.

Maxime

--tbbglb6tkryifmhd
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ901jAAKCRAnX84Zoj2+
dpF5AYDSRzW0ehKLxnhsHPapXpYlsJYxn+nUonKp74NaMNj2HDyy5kvwa1/sonO+
86uMnDsBfRzl+ciVxulLnqWiIOeB6nxm7903FELob1Ydg/1sMksMvtHNt94+ndYz
OuvWM7h5aw==
=n1Ez
-----END PGP SIGNATURE-----

--tbbglb6tkryifmhd--
