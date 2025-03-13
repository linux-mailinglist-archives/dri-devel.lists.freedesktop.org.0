Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D00C3A5F37E
	for <lists+dri-devel@lfdr.de>; Thu, 13 Mar 2025 12:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAE510E84C;
	Thu, 13 Mar 2025 11:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QyHOBJur";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C013A10E84C
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Mar 2025 11:55:40 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 97A8AA46E08;
 Thu, 13 Mar 2025 11:50:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C9374C4CEDD;
 Thu, 13 Mar 2025 11:55:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1741866936;
 bh=j/UxuFfYZjRloTYF+5DAhKRpSh3d6hX+rPVHR81TlAw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=QyHOBJur9eip0g5JOOU4J2LYpMmOmDMhO/KHPrxbBuHhafjk/0D948H2bU4J9YpuU
 +hQeipgcEw3h8cjvj/LnElc/QgZmFVaG+jRjxcMmcI27zf4zEVX3HoJL4IvqNDGqba
 sNd1bUEcSija1pmwx6Ah/w3JUgGXtYFguyoUtu2Ry4f4ZUpZ7Zmy68SkbavGFZecbD
 HIX8K8qEFF17n6yXNGRs9es6C/7rx1ucNppSIDNim+Q7TADXfmJDYNI89+0t45kOg+
 dv6UHG3EhJrYhpk6XmJonn2gpRhn+j384uK/T0Ilx98CWiVEbchRLO0HiMbZUAuspj
 9ABYoqL6HGgGw==
Date: Thu, 13 Mar 2025 12:55:33 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Andy Yan <andyshrk@163.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, 
 Herve Codina <herve.codina@bootlin.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Simona Vetter <simona.vetter@ffwll.ch>, lumag@kernel.org
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <20250313-dazzling-deer-of-ampleness-21db67@houat>
References: <20250304-bridge-connector-v5-0-aacf461d2157@kernel.org>
 <20250304-bridge-connector-v5-4-aacf461d2157@kernel.org>
 <5180089f.a640.19566290538.Coremail.andyshrk@163.com>
 <608c01c.7716.1958e8d879f.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="xsshdtprknacva2v"
Content-Disposition: inline
In-Reply-To: <608c01c.7716.1958e8d879f.Coremail.andyshrk@163.com>
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


--xsshdtprknacva2v
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
MIME-Version: 1.0

Hi,

On Thu, Mar 13, 2025 at 04:09:54PM +0800, Andy Yan wrote:
> At 2025-03-05 19:55:19, "Andy Yan" <andyshrk@163.com> wrote:
> >At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@kernel.org> wrote:
> >>With the bridges switching over to drm_bridge_connector, the direct
> >>association between a bridge driver and its connector was lost.
> >>
> >>This is mitigated for atomic bridge drivers by the fact you can access
> >>the encoder, and then call drm_atomic_get_old_connector_for_encoder() or
> >>drm_atomic_get_new_connector_for_encoder() with drm_atomic_state.
> >>
> >>This was also made easier by providing drm_atomic_state directly to all
> >>atomic hooks bridges can implement.
> >>
> >>However, bridge drivers don't have a way to access drm_atomic_state
> >>outside of the modeset path, like from the hotplug interrupt path or any
> >>interrupt handler.
> >>
> >>Let's introduce a function to retrieve the connector currently assigned
> >>to an encoder, without using drm_atomic_state, to make these drivers'
> >>life easier.
> >>
> >>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>Co-developed-by: Simona Vetter <simona.vetter@ffwll.ch>
> >>Signed-off-by: Maxime Ripard <mripard@kernel.org>
> >>---
> >> drivers/gpu/drm/drm_atomic.c | 45 ++++++++++++++++++++++++++++++++++++=
++++++++
> >> include/drm/drm_atomic.h     |  3 +++
> >> 2 files changed, 48 insertions(+)
> >>
> >>diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
> >>index 9ea2611770f43ce7ccba410406d5f2c528aab022..b926b132590e78f8d41d48e=
b4da4bccf170ee236 100644
> >>--- a/drivers/gpu/drm/drm_atomic.c
> >>+++ b/drivers/gpu/drm/drm_atomic.c
> >>@@ -985,10 +985,55 @@ drm_atomic_get_new_connector_for_encoder(const st=
ruct drm_atomic_state *state,
> >>=20
> >> 	return NULL;
> >> }
> >> EXPORT_SYMBOL(drm_atomic_get_new_connector_for_encoder);
> >>=20
> >>+/**
> >>+ * drm_atomic_get_connector_for_encoder - Get connector currently assi=
gned to an encoder
> >>+ * @encoder: The encoder to find the connector of
> >>+ * @ctx: Modeset locking context
> >>+ *
> >>+ * This function finds and returns the connector currently assigned to
> >>+ * an @encoder.
> >>+ *
> >>+ * Returns:
> >>+ * The connector connected to @encoder, or an error pointer otherwise.
> >>+ * When the error is EDEADLK, a deadlock has been detected and the
> >>+ * sequence must be restarted.
> >>+ */
> >>+struct drm_connector *
> >>+drm_atomic_get_connector_for_encoder(const struct drm_encoder *encoder,
> >>+				     struct drm_modeset_acquire_ctx *ctx)
> >>+{
> >>+	struct drm_connector_list_iter conn_iter;
> >>+	struct drm_connector *out_connector =3D ERR_PTR(-EINVAL);
> >>+	struct drm_connector *connector;
> >>+	struct drm_device *dev =3D encoder->dev;
> >>+	int ret;
> >>+
> >>+	ret =3D drm_modeset_lock(&dev->mode_config.connection_mutex, ctx);
> >>+	if (ret)
> >>+		return ERR_PTR(ret);
> >
> >It seems that this will cause a deadlock when called from a  hotplug han=
dling path,
> >I have a WIP DP diver[0],  which suggested by Dmitry to use this API fro=
m a=20
> >&drm_bridge_funcs.detect callback to get the connector,  as detect is ca=
lled by drm_helper_probe_detect,
> >which will hold connection_mutex first, so the deaklock happens:
> >
> >
> >drm_helper_probe_detect(struct drm_connector *connector,
> >                        struct drm_modeset_acquire_ctx *ctx,
> >                        bool force)
> >{
> >        const struct drm_connector_helper_funcs *funcs =3D connector->he=
lper_private;
> >        struct drm_device *dev =3D connector->dev;
> >        int ret;
> >
> >        if (!ctx)
> >                return drm_helper_probe_detect_ctx(connector, force);
> >
> >        ret =3D drm_modeset_lock(&dev->mode_config.connection_mutex, ctx=
);
> >        if (ret)
> >                return ret;
> >
> >        if (funcs->detect_ctx)
> >                ret =3D funcs->detect_ctx(connector, ctx, force);
> >        else if (connector->funcs->detect)
> >                ret =3D connector->funcs->detect(connector, force);
> >        else
> >                ret =3D connector_status_connected;
> >
> >        if (ret !=3D connector->status)
> >                connector->epoch_counter +=3D 1;
> >
> >So I wonder can we let drm_bridge_funcs.detect pass a connector for this=
 case ?
> >
> >
> >
> >[0]https://lore.kernel.org/linux-rockchip/047EECFC-7E55-44EC-896F-13FE04=
333E4D@gmail.com/T/#m25bc53b79f5cc7bddfcb7aae5656f68df396f094
> >>+
> >>+	drm_connector_list_iter_begin(dev, &conn_iter);
> >>+	drm_for_each_connector_iter(connector, &conn_iter) {
> >>+		if (!connector->state)
> >>+			continue;
> >>+
> >>+		if (encoder =3D=3D connector->state->best_encoder) {
> >>+			out_connector =3D connector;
>=20
>=20
> When try to use this patch in my bridge driver,  I found that the connect=
or->state->best_encoder=20
>  maybe NULL when   drm_bridge_funcs.detect or drm_bridge_funcs.detect_ctx=
 is  called:
>=20
> [   52.713030] Invalid return value -22 for connector detection
> [   52.713539] WARNING: CPU: 7 PID: 288 at drivers/gpu/drm/drm_probe_help=
er.c:602 drm_helper_probe_single_connector_modes+0x5e0/
> 0x63c
> [   52.714568] Modules linked in:
>=20
> [   52.724546] Call trace:
> [   52.724762]  drm_helper_probe_single_connector_modes+0x5e0/0x63c (P)
> [   52.725319]  drm_mode_getconnector+0x2a4/0x488
> [   52.725711]  drm_ioctl_kernel+0xb4/0x11c
> [   52.726057]  drm_ioctl+0x22c/0x544
> [   52.726358]  __arm64_sys_ioctl+0xac/0xe0
> [   52.726706]  invoke_syscall+0x44/0x100
> [   52.727039]  el0_svc_common.constprop.0+0x3c/0xd4
>=20
> This is because  best_encoder is set by set_best_encoder, which is called=
 from
> drm_atomic_helper_check_modeset. When we call drm_mode_getconnector=20
> for the first time, the functions mentioned above have not been called ye=
t,
> then we can't match the encoder from connector->state->best_encoder for t=
his case.

As far as I'm concerned, it's by design. Encoders and connectors have
1:N relationship, and only once a connector has been enabled it has an
encoder.

If the connector is disabled, there's no associated encoder.

Maxime

--xsshdtprknacva2v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCZ9LHtAAKCRDj7w1vZxhR
xVvBAP48i2/X1q1f6MXYy/AOqvz/U2IluDodoKdi1fETcrMKTQD/VPKyXcV8m/lS
xMLjJEJpzYEG0R0t/82OSx5j9vk6LgI=
=pEwZ
-----END PGP SIGNATURE-----

--xsshdtprknacva2v--
