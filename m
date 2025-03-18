Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1632A6785A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Mar 2025 16:51:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F44910E1BC;
	Tue, 18 Mar 2025 15:51:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="oiWGA7ev";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5BDB10E1BC
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Mar 2025 15:51:22 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B71E5C53F2;
 Tue, 18 Mar 2025 15:49:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FFDC4CEEE;
 Tue, 18 Mar 2025 15:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1742313082;
 bh=rA6X8gR2QWzooRehB87OVUrpPlXRC7dTuJLXwIFQGTc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oiWGA7evIPXaw1y1N8SboJEcNvWwjuHCjtwtBEXOQi5jXWDzDFGOPgtznPH3JRYzI
 rt+2mamChUwh/wrVdmol81InNQdGW33mxQ+PerbHoRsyRmkzXbBs9kxDvu4iwsGOIS
 t3xrXzp5q7+bKesKptlZFwq9g8Do7rzGRuNuzkqnHoBWq8HuVT3s0sNN1/INQdgGer
 xGFr+ozI/3GBi3ZCpMQUDdS7DNkFpaoEUpj3TiVe0AV3j+M3lb9PU27b1lTd1YdAvC
 cwQJ3qneNHi1viB+A1KKIfc0rkzCBTJKpLwYKUp76b+IGOScSCtnNNOcvcT+71nSoh
 ce8vJpJHu1/pg==
Date: Tue, 18 Mar 2025 16:51:19 +0100
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
Message-ID: <20250318-active-giraffe-of-memory-e0c66d@houat>
References: <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
 <5180089f.a640.19566290538.Coremail.andyshrk@163.com>
 <608c01c.7716.1958e8d879f.Coremail.andyshrk@163.com>
 <20250313-dazzling-deer-of-ampleness-21db67@houat>
 <6ae1c567.8c6.195922195d6.Coremail.andyshrk@163.com>
 <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
 <20250314-courageous-bison-of-prestige-8b884b@houat>
 <lf4wu5v3wym3foqgimuulyzz2dmd2jezkj3otn7xm7xp77nast@azqmajrn45lw>
 <20250314-hissing-spirited-armadillo-dc9d3a@houat>
 <2tfryn5plcqysdobavbjljnd3rq5ar2n2qmeyyryk6wqbx2zpk@qvqpkxe5ffjl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="hp2fhvas6ltodzrt"
Content-Disposition: inline
In-Reply-To: <2tfryn5plcqysdobavbjljnd3rq5ar2n2qmeyyryk6wqbx2zpk@qvqpkxe5ffjl>
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


--hp2fhvas6ltodzrt
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
MIME-Version: 1.0

On Fri, Mar 14, 2025 at 08:28:22PM +0200, Dmitry Baryshkov wrote:
> On Fri, Mar 14, 2025 at 06:40:24PM +0100, Maxime Ripard wrote:
> > On Fri, Mar 14, 2025 at 09:59:36AM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Mar 14, 2025 at 08:45:17AM +0100, Maxime Ripard wrote:
> > > > On Fri, Mar 14, 2025 at 07:52:35AM +0200, Dmitry Baryshkov wrote:
> > > > > On Fri, Mar 14, 2025 at 08:50:29AM +0800, Andy Yan wrote:
> > > > > > At 2025-03-13 19:55:33, "Maxime Ripard" <mripard@kernel.org> wr=
ote:
> > > > > > >Hi,
> > > > > > >
> > > > > > >On Thu, Mar 13, 2025 at 04:09:54PM +0800, Andy Yan wrote:
> > > > > > >> At 2025-03-05 19:55:19, "Andy Yan" <andyshrk@163.com> wrote:
> > > > > > >> >At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org=
> wrote:
> > > > > > >> >>With the bridges switching over to drm_bridge_connector, t=
he direct
> > > > > > >> >>association between a bridge driver and its connector was =
lost.
> > > > > > >> >>
> > > > > > >> >>This is mitigated for atomic bridge drivers by the fact yo=
u can access
> > > > > > >> >>the encoder, and then call drm_atomic_get_old_connector_fo=
r_encoder() or
> > > > > > >> >>drm_atomic_get_new_connector_for_encoder() with drm_atomic=
_state.
> > > > > > >> >>
> > > > > > >> >>This was also made easier by providing drm_atomic_state di=
rectly to all
> > > > > > >> >>atomic hooks bridges can implement.
> > > > > > >> >>
> > > > > > >> >>However, bridge drivers don't have a way to access drm_ato=
mic_state
> > > > > > >> >>outside of the modeset path, like from the hotplug interru=
pt path or any
> > > > > > >> >>interrupt handler.
> > > > > > >> >>
> > > > > > >> >>Let's introduce a function to retrieve the connector curre=
ntly assigned
> > > > > > >> >>to an encoder, without using drm_atomic_state, to make the=
se drivers'
> > > > > > >> >>life easier.
> > > > > > >> >>
> > > > > > >> >>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > >> >>Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > > > > > >> >>Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > >> >>---
> > > > > > >> >> drivers/gpu/drm/drm_atomic.c | 45 +++++++++++++++++++++++=
+++++++++++++++++++++
> > > > > > >> >> include/drm/drm_atomic.h     |  3 +++
> > > > > > >> >> 2 files changed, 48 insertions(+)
> > > > > > >> >>
> > > > > > >> >>diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/dr=
m/drm_atomic.c
> > > > > > >> >>index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b13259=
0e78f8d41d48eb4da4bccf170ee236 100644
> > > > > > >> >>--- a/drivers/gpu/drm/drm_atomic.c
> > > > > > >> >>+++ b/drivers/gpu/drm/drm_atomic.c
> > > > > > >> >>@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_enc=
oder(const struct drm_atomic_state *state,
> > > > > > >> >>=20
> > > > > > >> >> 	return NULL;
> > > > > > >> >> }
> > > > > > >> >> EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> > > > > > >> >>=20
> > > > > > >> >>+/**
> > > > > > >> >>+ * drm_atomic_get_connector_for_encoder - Get connector c=
urrently assigned to an encoder
> > > > > > >> >>+ * @encoder: The encoder to find the connector of
> > > > > > >> >>+ * @ctx: Modeset locking context
> > > > > > >> >>+ *
> > > > > > >> >>+ * This function finds and returns the connector currentl=
y assigned to
> > > > > > >> >>+ * an @encoder.
> > > > > > >> >>+ *
> > > > > > >> >>+ * Returns:
> > > > > > >> >>+ * The connector connected to @encoder, or an error point=
er otherwise.
> > > > > > >> >>+ * When the error is EDEADLK, a deadlock has been detecte=
d and the
> > > > > > >> >>+ * sequence must be restarted.
> > > > > > >> >>+ */
> > > > > > >> >>+struct drm_connector *
> > > > > > >> >>+drm_atomic_get_connector_for_encoder(const struct drm_enc=
oder *encoder,
> > > > > > >> >>+				     struct drm_modeset_acquire_ctx *ctx)
> > > > > > >> >>+{
> > > > > > >> >>+	struct drm_connector_list_iter conn_iter;
> > > > > > >> >>+	struct drm_connector *out_connector =3D ERR_PTR(-EINVAL);
> > > > > > >> >>+	struct drm_connector *connector;
> > > > > > >> >>+	struct drm_device *dev =3D encoder->dev;
> > > > > > >> >>+	int ret;
> > > > > > >> >>+
> > > > > > >> >>+	ret =3D drm_modeset_lock(&dev->mode_config.connection_mu=
tex, ctx);
> > > > > > >> >>+	if (ret)
> > > > > > >> >>+		return ERR_PTR(ret);
> > > > > > >> >
> > > > > > >> >It seems that this will cause a deadlock when called from a=
  hotplug handling path,
> > > > > > >> >I have a WIP DP diver[0],  which suggested by Dmitry to use=
 this API from a=20
> > > > > > >> >&drm_bridge_funcs.detect callback to get the connector,  as=
 detect is called by drm_helper_probe_detect,
> > > > > > >> >which will hold connection_mutex first, so the deaklock hap=
pens:
> > > > > > >> >
> > > > > > >> >
> > > > > > >> >drm_helper_probe_detect(struct drm_connector *connector,
> > > > > > >> >                        struct drm_modeset_acquire_ctx *ctx,
> > > > > > >> >                        bool force)
> > > > > > >> >{
> > > > > > >> >        const struct drm_connector_helper_funcs *funcs =3D =
connector->helper_private;
> > > > > > >> >        struct drm_device *dev =3D connector->dev;
> > > > > > >> >        int ret;
> > > > > > >> >
> > > > > > >> >        if (!ctx)
> > > > > > >> >                return drm_helper_probe_detect_ctx(connecto=
r, force);
> > > > > > >> >
> > > > > > >> >        ret =3D drm_modeset_lock(&dev->mode_config.connecti=
on_mutex, ctx);
> > > > > > >> >        if (ret)
> > > > > > >> >                return ret;
> > > > > > >> >
> > > > > > >> >        if (funcs->detect_ctx)
> > > > > > >> >                ret =3D funcs->detect_ctx(connector, ctx, f=
orce);
> > > > > > >> >        else if (connector->funcs->detect)
> > > > > > >> >                ret =3D connector->funcs->detect(connector,=
 force);
> > > > > > >> >        else
> > > > > > >> >                ret =3D connector_status_connected;
> > > > > > >> >
> > > > > > >> >        if (ret !=3D connector->status)
> > > > > > >> >                connector->epoch_counter +=3D 1;
> > > > > > >> >
> > > > > > >> >So I wonder can we let drm_bridge_funcs.detect pass a conne=
ctor for this case ?
> > > > > > >> >
> > > > > > >> >
> > > > > > >> >
> > > > > > >> >[0]https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44E=
C-896F-13FE04333E4D@gmail.com/T/#m25bc53b79f5cc7bddfcb7aae5656f68df396f094
> > > > > > >> >>+
> > > > > > >> >>+	drm_connector_list_iter_begin(dev, &conn_iter);
> > > > > > >> >>+	drm_for_each_connector_iter(connector, &conn_iter) {
> > > > > > >> >>+		if (!connector->state)
> > > > > > >> >>+			continue;
> > > > > > >> >>+
> > > > > > >> >>+		if (encoder =3D=3D connector->state->best_encoder) {
> > > > > > >> >>+			out_connector =3D connector;
> > > > > > >>=20
> > > > > > >>=20
> > > > > > >> When try to use this patch in my bridge driver,  I found tha=
t the connector->state->best_encoder=20
> > > > > > >>  maybe NULL when   drm_bridge_funcs.detect or drm_bridge_fun=
cs.detect_ctx is  called:
> > > > > > >>=20
> > > > > > >> [   52.713030] Invalid return value -22 for connector detect=
ion
> > > > > > >> [   52.713539] WARNING: CPU: 7 PID: 288 at drivers/gpu/drm/d=
rm_probe_helper.c:602 drm_helper_probe_single_connector_modes+0x5e0/
> > > > > > >> 0x63c
> > > > > > >> [   52.714568] Modules linked in:
> > > > > > >>=20
> > > > > > >> [   52.724546] Call trace:
> > > > > > >> [   52.724762]  drm_helper_probe_single_connector_modes+0x5e=
0/0x63c (P)
> > > > > > >> [   52.725319]  drm_mode_getconnector+0x2a4/0x488
> > > > > > >> [   52.725711]  drm_ioctl_kernel+0xb4/0x11c
> > > > > > >> [   52.726057]  drm_ioctl+0x22c/0x544
> > > > > > >> [   52.726358]  __arm64_sys_ioctl+0xac/0xe0
> > > > > > >> [   52.726706]  invoke_syscall+0x44/0x100
> > > > > > >> [   52.727039]  el0_svc_common.constprop.0+0x3c/0xd4
> > > > > > >>=20
> > > > > > >> This is because  best_encoder is set by set_best_encoder, wh=
ich is called from
> > > > > > >> drm_atomic_helper_check_modeset. When we call drm_mode_getco=
nnector=20
> > > > > > >> for the first time, the functions mentioned above have not b=
een called yet,
> > > > > > >> then we can't match the encoder from connector->state->best_=
encoder for this case.
> > > > > > >
> > > > > > >As far as I'm concerned, it's by design. Encoders and connecto=
rs have
> > > > > > >1:N relationship, and only once a connector has been enabled i=
t has an
> > > > > > >encoder.
> > > > > > >
> > > > > > >If the connector is disabled, there's no associated encoder.
> > > > > >=20
> > > > > > Does this prove that this API is not suitable for my applicatio=
n scenario:=20
> > > > > > Get the connector in the bridge's .detect callback, so this mea=
ns that I may
> > > > > > still need to modify the bridge's connector callback so that it=
 can pass the connector ?
> > > > >=20
> > > > > I'd say, yes, please.
> > > >=20
> > > > And I'd say no :)
> > >=20
> > > Fair enough :-)
> > >=20
> > > > There's no reason to deviate from the API other entities have here.=
 It's
> > > > just that the switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR hasn't been
> > > > completely thought through and it's one of the part where it shows.
> > > >=20
> > > > We have two alternative solutions: Either the driver creates the
> > > > connector itself, since it doesn't seem to use any downstream bridge
> > > > anyway, or we need a new bridge helper to find the connector on a b=
ridge
> > > > chain.
> > > >=20
> > > > We have the iterator already, we just need a new accessor to retrie=
ve
> > > > the (optional) connector of a bridge, and if there's none, go to the
> > > > next bridge and try again.
> > >=20
> > > The problem is that there is no guarantee that the the created connec=
tor
> > > is created for or linked to any bridge. For example, for msm driver I=
'm
> > > waiting for several series to go in, but after that I plan to work on
> > > moving connector creation to the generic code within the msm driver.
> > >=20
> > > In other words, with DRM_BRIDGE_ATTACH_NO_CONNECTOR in place it is
> > > perfectly legit not to have a bridge which has "connector of a bridge=
".
> > > It is possible to create drm_bridge_connector on the drm_encoder's si=
de
> > > after the drm_bridge_attach() succeeds.
> >=20
> > Sure, but then I'd expect detect and get_modes to only be called *after*
> > that connector has been created, right?
>=20
> Yes. But you can not get the connector by following bridge chain. Well,
> unless you include encoder into the chain. If that's what you have had
> in mind, then please excuse me, I didn't understand that from the
> beginning.

You can't include the encoder either, because the encoder doesn't have a
connector assigned yet at that time.

However, you can:

  - Store the bridge attach flags in drm_bridge

  - Create a hook that returns the connector a bridge creates, depending
    on the attach flags.

  - Create a helper that iterates over the next bridges until the
    previous hook returns !NULL. If it doesn't find anything, return
    NULL.

AFAIK, it solves all the problems being discussed here, while dealing
with legacy and new-style bridge drivers.

> But frankly speaking, I think it might be easier to pass down the
> connector to the detect callback (as drm_connector_funcs.detect already
> gets the connecor) rather than making bridge drivers go through the
> chain to get the value that is already present in the caller function.
>=20
> (For some other usecases I'd totally agree with you, especially if the
> connector isn't already available on the caller side).

Still, we've tried to converge to the same API for all entities, it
feels like a step backward to me.

Maxime

--hp2fhvas6ltodzrt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9mWcwAKCRAnX84Zoj2+
dgpyAX9NW/gNmxEUdpBFsQ1QGH8CotncgbbRSnTTIIVtY9kXy+ZuDOFFDYhNejYh
gf4JZhgBgKrVCDP3qGQO1jJ9s6oamM/AZO62PWV93aNMGrZiDv1aJnsqRt8Rg4ch
GIH/HEJq0w==
=TdpK
-----END PGP SIGNATURE-----

--hp2fhvas6ltodzrt--
