Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 774E4A60A41
	for <lists+dri-devel@lfdr.de>; Fri, 14 Mar 2025 08:45:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0962410E994;
	Fri, 14 Mar 2025 07:45:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VqlZ/yLF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A17B10E994
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Mar 2025 07:45:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B280D5C5859;
 Fri, 14 Mar 2025 07:43:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2124C4CEE3;
 Fri, 14 Mar 2025 07:45:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741938320;
 bh=rB/Ef3oLC3JztquXBp2C1XHzq8oE979wb4eRW4XPG/s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VqlZ/yLFIl+p9kr2RAScnZCNlqZJ3KtWeyUO2sLAO9Dn0zaRVibODadci+iX0SHQX
 VhD15JbJh00OlLpwWSHibMFlJXxVSqXleoXgKgMXkqPAVaDtSbg5vj6o8X3P40IHLC
 bpTr3/lqcIErKaM2QKT8FoGGditgqw+X5mHl0mHDqwxup1HKywwCfszR6UrHr+i4OQ
 fGHgtNY5w4o3Zj61eGvC49MdLI8bLLdmDL6QsCpXoGLQM3HURvq4Hioh8/GgAs4EL3
 sQ4bLB0OV6RgGjHKfmbPacKWghtYU9qNqGw650sdA0dPgxSEt+6/8mdO7MBKh2vZUH
 t2y4IfmzCXyrQ==
Date: Fri, 14 Mar 2025 08:45:17 +0100
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
Message-ID: <20250314-courageous-bison-of-prestige-8b884b@houat>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
 <5180089f.a640.19566290538.Coremail.andyshrk@163.com>
 <608c01c.7716.1958e8d879f.Coremail.andyshrk@163.com>
 <20250313-dazzling-deer-of-ampleness-21db67@houat>
 <6ae1c567.8c6.195922195d6.Coremail.andyshrk@163.com>
 <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="fau2wb4ziq56b5rc"
Content-Disposition: inline
In-Reply-To: <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
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


--fau2wb4ziq56b5rc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
MIME-Version: 1.0

On Fri, Mar 14, 2025 at 07:52:35AM +0200, Dmitry Baryshkov wrote:
> On Fri, Mar 14, 2025 at 08:50:29AM +0800, Andy Yan wrote:
> >=20
> > Hi Maxime and Simona,
> >=20
> >=20
> > At 2025-03-13 19:55:33, "Maxime Ripard" <mripard@kernel.org> wrote:
> > >Hi,
> > >
> > >On Thu, Mar 13, 2025 at 04:09:54PM +0800, Andy Yan wrote:
> > >> At 2025-03-05 19:55:19, "Andy Yan" <andyshrk@163.com> wrote:
> > >> >At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org> wrote:
> > >> >>With the bridges switching over to drm_bridge_connector, the direct
> > >> >>association between a bridge driver and its connector was lost.
> > >> >>
> > >> >>This is mitigated for atomic bridge drivers by the fact you can ac=
cess
> > >> >>the encoder, and then call drm_atomic_get_old_connector_for_encode=
r() or
> > >> >>drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> > >> >>
> > >> >>This was also made easier by providing drm_atomic_state directly t=
o all
> > >> >>atomic hooks bridges can implement.
> > >> >>
> > >> >>However, bridge drivers don't have a way to access drm_atomic_state
> > >> >>outside of the modeset path, like from the hotplug interrupt path =
or any
> > >> >>interrupt handler.
> > >> >>
> > >> >>Let's introduce a function to retrieve the connector currently ass=
igned
> > >> >>to an encoder, without using drm_atomic_state, to make these drive=
rs'
> > >> >>life easier.
> > >> >>
> > >> >>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> >>Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> > >> >>Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > >> >>---
> > >> >> drivers/gpu/drm/drm_atomic.c | 45 +++++++++++++++++++++++++++++++=
+++++++++++++
> > >> >> include/drm/drm_atomic.h     |  3 +++
> > >> >> 2 files changed, 48 insertions(+)
> > >> >>
> > >> >>diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_at=
omic.c
> > >> >>index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d4=
1d48eb4da4bccf170ee236 100644
> > >> >>--- a/drivers/gpu/drm/drm_atomic.c
> > >> >>+++ b/drivers/gpu/drm/drm_atomic.c
> > >> >>@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(con=
st struct drm_atomic_state *state,
> > >> >>=20
> > >> >> 	return NULL;
> > >> >> }
> > >> >> EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> > >> >>=20
> > >> >>+/**
> > >> >>+ * drm_atomic_get_connector_for_encoder - Get connector currently=
 assigned to an encoder
> > >> >>+ * @encoder: The encoder to find the connector of
> > >> >>+ * @ctx: Modeset locking context
> > >> >>+ *
> > >> >>+ * This function finds and returns the connector currently assign=
ed to
> > >> >>+ * an @encoder.
> > >> >>+ *
> > >> >>+ * Returns:
> > >> >>+ * The connector connected to @encoder, or an error pointer other=
wise.
> > >> >>+ * When the error is EDEADLK, a deadlock has been detected and the
> > >> >>+ * sequence must be restarted.
> > >> >>+ */
> > >> >>+struct drm_connector *
> > >> >>+drm_atomic_get_connector_for_encoder(const struct drm_encoder *en=
coder,
> > >> >>+				     struct drm_modeset_acquire_ctx *ctx)
> > >> >>+{
> > >> >>+	struct drm_connector_list_iter conn_iter;
> > >> >>+	struct drm_connector *out_connector =3D ERR_PTR(-EINVAL);
> > >> >>+	struct drm_connector *connector;
> > >> >>+	struct drm_device *dev =3D encoder->dev;
> > >> >>+	int ret;
> > >> >>+
> > >> >>+	ret =3D drm_modeset_lock(&dev->mode_config.connection_mutex, ctx=
);
> > >> >>+	if (ret)
> > >> >>+		return ERR_PTR(ret);
> > >> >
> > >> >It seems that this will cause a deadlock when called from a  hotplu=
g handling path,
> > >> >I have a WIP DP diver[0],  which suggested by Dmitry to use this AP=
I from a=20
> > >> >&drm_bridge_funcs.detect callback to get the connector,  as detect =
is called by drm_helper_probe_detect,
> > >> >which will hold connection_mutex first, so the deaklock happens:
> > >> >
> > >> >
> > >> >drm_helper_probe_detect(struct drm_connector *connector,
> > >> >                        struct drm_modeset_acquire_ctx *ctx,
> > >> >                        bool force)
> > >> >{
> > >> >        const struct drm_connector_helper_funcs *funcs =3D connecto=
r->helper_private;
> > >> >        struct drm_device *dev =3D connector->dev;
> > >> >        int ret;
> > >> >
> > >> >        if (!ctx)
> > >> >                return drm_helper_probe_detect_ctx(connector, force=
);
> > >> >
> > >> >        ret =3D drm_modeset_lock(&dev->mode_config.connection_mutex=
, ctx);
> > >> >        if (ret)
> > >> >                return ret;
> > >> >
> > >> >        if (funcs->detect_ctx)
> > >> >                ret =3D funcs->detect_ctx(connector, ctx, force);
> > >> >        else if (connector->funcs->detect)
> > >> >                ret =3D connector->funcs->detect(connector, force);
> > >> >        else
> > >> >                ret =3D connector_status_connected;
> > >> >
> > >> >        if (ret !=3D connector->status)
> > >> >                connector->epoch_counter +=3D 1;
> > >> >
> > >> >So I wonder can we let drm_bridge_funcs.detect pass a connector for=
 this case ?
> > >> >
> > >> >
> > >> >
> > >> >[0]https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-1=
3FE04333E4D@gmail.com/T/#m25bc53b79f5cc7bddfcb7aae5656f68df396f094
> > >> >>+
> > >> >>+	drm_connector_list_iter_begin(dev, &conn_iter);
> > >> >>+	drm_for_each_connector_iter(connector, &conn_iter) {
> > >> >>+		if (!connector->state)
> > >> >>+			continue;
> > >> >>+
> > >> >>+		if (encoder =3D=3D connector->state->best_encoder) {
> > >> >>+			out_connector =3D connector;
> > >>=20
> > >>=20
> > >> When try to use this patch in my bridge driver,  I found that the co=
nnector->state->best_encoder=20
> > >>  maybe NULL when   drm_bridge_funcs.detect or drm_bridge_funcs.detec=
t_ctx is  called:
> > >>=20
> > >> [   52.713030] Invalid return value -22 for connector detection
> > >> [   52.713539] WARNING: CPU: 7 PID: 288 at drivers/gpu/drm/drm_probe=
_helper.c:602 drm_helper_probe_single_connector_modes+0x5e0/
> > >> 0x63c
> > >> [   52.714568] Modules linked in:
> > >>=20
> > >> [   52.724546] Call trace:
> > >> [   52.724762]  drm_helper_probe_single_connector_modes+0x5e0/0x63c =
(P)
> > >> [   52.725319]  drm_mode_getconnector+0x2a4/0x488
> > >> [   52.725711]  drm_ioctl_kernel+0xb4/0x11c
> > >> [   52.726057]  drm_ioctl+0x22c/0x544
> > >> [   52.726358]  __arm64_sys_ioctl+0xac/0xe0
> > >> [   52.726706]  invoke_syscall+0x44/0x100
> > >> [   52.727039]  el0_svc_common.constprop.0+0x3c/0xd4
> > >>=20
> > >> This is because  best_encoder is set by set_best_encoder, which is c=
alled from
> > >> drm_atomic_helper_check_modeset. When we call drm_mode_getconnector=
=20
> > >> for the first time, the functions mentioned above have not been call=
ed yet,
> > >> then we can't match the encoder from connector->state->best_encoder =
for this case.
> > >
> > >As far as I'm concerned, it's by design. Encoders and connectors have
> > >1:N relationship, and only once a connector has been enabled it has an
> > >encoder.
> > >
> > >If the connector is disabled, there's no associated encoder.
> >=20
> > Does this prove that this API is not suitable for my application scenar=
io:=20
> > Get the connector in the bridge's .detect callback, so this means that =
I may
> > still need to modify the bridge's connector callback so that it can pas=
s the connector ?
>=20
> I'd say, yes, please.

And I'd say no :)

There's no reason to deviate from the API other entities have here. It's
just that the switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR hasn't been
completely thought through and it's one of the part where it shows.

We have two alternative solutions: Either the driver creates the
connector itself, since it doesn't seem to use any downstream bridge
anyway, or we need a new bridge helper to find the connector on a bridge
chain.

We have the iterator already, we just need a new accessor to retrieve
the (optional) connector of a bridge, and if there's none, go to the
next bridge and try again.

There's a decent amount of variations that ideally call for tests too,
but it should be pretty simple overall.

Maxime

--fau2wb4ziq56b5rc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ9PejAAKCRAnX84Zoj2+
djf9AX0W1BCHeuxaCTpGaOsUgonctU0H4uXU+bNeJLXIxkM2W0kujkJxZb+yDIIl
G2+dKPgBgMdlmHsK5JDWS5tuEJMHfq2wA1B6pjSegicOYtGabKbz3AalW2uxcXMh
jy92DPI0Hg==
=LmmJ
-----END PGP SIGNATURE-----

--fau2wb4ziq56b5rc--
