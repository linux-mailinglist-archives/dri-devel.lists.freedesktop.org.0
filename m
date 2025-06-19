Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675D7AE068C
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jun 2025 15:09:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE8A810E06E;
	Thu, 19 Jun 2025 13:09:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="ehn+WljS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCFC110E06E
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jun 2025 13:09:21 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 44BC75C66C7;
 Thu, 19 Jun 2025 13:07:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E782C4CEEA;
 Thu, 19 Jun 2025 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1750338557;
 bh=mclfFlM2/awGiFxX39iShH1fqwzk9UfcBe431TdThNo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ehn+WljSlGtqWNSwcm0+ArqhhtLYii9GEZw7KDpbu7IiRdWzdM5E8cdMjuREYErCT
 M37vFsEnJymOVIswOD0S+1y7PaUYtzBE3YbjQWEwp9Bdbqt9YhQJesGugyubNc7ABH
 liyLVJMGt6QS4gqFBH9u2yr+dPUpybyFphSxlKO1aAr4oe5OahlkwBmFbZBj0QwaVl
 5GWO365+ZLV6i9vYCp/xWo8SV1J8X1kdtDjepL6eJytdmO5W1C4R7pAzh+5W2Mxn3b
 FvNub8csTR3xk9HRjE00bIj9OV3eQOvPcDl7D0lTaULFa2DpiyERCw7QVGidiG/NAq
 uyduHWyQIKciQ==
Date: Thu, 19 Jun 2025 15:09:09 +0200
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
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
Message-ID: <20250619-polar-aromatic-agama-1d46f7@houat>
References: <k2md4q2tgwsdynaeljieqlzjdds677wqqduimfyrgmvyfi732a@vh3dbg7kdaop>
 <20250314-courageous-bison-of-prestige-8b884b@houat>
 <lf4wu5v3wym3foqgimuulyzz2dmd2jezkj3otn7xm7xp77nast@azqmajrn45lw>
 <20250314-hissing-spirited-armadillo-dc9d3a@houat>
 <2tfryn5plcqysdobavbjljnd3rq5ar2n2qmeyyryk6wqbx2zpk@qvqpkxe5ffjl>
 <20250318-active-giraffe-of-memory-e0c66d@houat>
 <lsbzit4765y6jrw7jmbpfb6rixidenpndjwgw2yx57rz2espux@hbfco2ht6vwi>
 <20250321-majestic-cicada-of-argument-15b2d0@houat>
 <vw2ncdomx3rwltb2xlo6nf3rapgcdtcjcodofgmecrzzabf7ji@pybsfv27jkq2>
 <mdwhn4wml3qpoqgzegiczintfs6geuuet54bip3uxlpc2a4bfl@c6momnue7z7y>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
 protocol="application/pgp-signature"; boundary="44qomko4rbzaytju"
Content-Disposition: inline
In-Reply-To: <mdwhn4wml3qpoqgzegiczintfs6geuuet54bip3uxlpc2a4bfl@c6momnue7z7y>
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


--44qomko4rbzaytju
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 04/16] drm/atomic: Introduce helper to lookup
 connector by encoder
MIME-Version: 1.0

On Sat, May 24, 2025 at 11:09:48AM +0300, Dmitry Baryshkov wrote:
> On Sun, Mar 23, 2025 at 04:22:27AM +0200, Dmitry Baryshkov wrote:
> > On Fri, Mar 21, 2025 at 10:46:56AM +0100, Maxime Ripard wrote:
> > > On Tue, Mar 18, 2025 at 09:00:29PM +0200, Dmitry Baryshkov wrote:
> > > > On Tue, Mar 18, 2025 at 04:51:19PM +0100, Maxime Ripard wrote:
> > > > > On Fri, Mar 14, 2025 at 08:28:22PM +0200, Dmitry Baryshkov wrote:
> > > > > > On Fri, Mar 14, 2025 at 06:40:24PM +0100, Maxime Ripard wrote:
> > > > > > > On Fri, Mar 14, 2025 at 09:59:36AM +0200, Dmitry Baryshkov wr=
ote:
> > > > > > > > On Fri, Mar 14, 2025 at 08:45:17AM +0100, Maxime Ripard wro=
te:
> > > > > > > > > On Fri, Mar 14, 2025 at 07:52:35AM +0200, Dmitry Baryshko=
v wrote:
> > > > > > > > > > On Fri, Mar 14, 2025 at 08:50:29AM +0800, Andy Yan wrot=
e:
> > > > > > > > > > > At 2025-03-13 19:55:33, "Maxime Ripard" <mripard@kern=
el.org> wrote:
> > > > > > > > > > > >Hi,
> > > > > > > > > > > >
> > > > > > > > > > > >On Thu, Mar 13, 2025 at 04:09:54PM +0800, Andy Yan w=
rote:
> > > > > > > > > > > >> At 2025-03-05 19:55:19, "Andy Yan" <andyshrk@163.c=
om> wrote:
> > > > > > > > > > > >> >At 2025-03-04 19:10:47, "Maxime Ripard" <mripard@=
kernel.org> wrote:
> > > > > > > > > > > >> >>With the bridges switching over to drm_bridge_co=
nnector, the direct
> > > > > > > > > > > >> >>association between a bridge driver and its conn=
ector was lost.
> > > > > > > > > > > >> >>
> > > > > > > > > > > >> >>This is mitigated for atomic bridge drivers by t=
he fact you can access
> > > > > > > > > > > >> >>the encoder, and then call drm_atomic_get_old_co=
nnector_for_encoder() or
> > > > > > > > > > > >> >>drm_atomic_get_new_connector_for_encoder() with =
drm_atomic_state.
> > > > > > > > > > > >> >>
> > > > > > > > > > > >> >>This was also made easier by providing drm_atomi=
c_state directly to all
> > > > > > > > > > > >> >>atomic hooks bridges can implement.
> > > > > > > > > > > >> >>
> > > > > > > > > > > >> >>However, bridge drivers don't have a way to acce=
ss drm_atomic_state
> > > > > > > > > > > >> >>outside of the modeset path, like from the hotpl=
ug interrupt path or any
> > > > > > > > > > > >> >>interrupt handler.
> > > > > > > > > > > >> >>
> > > > > > > > > > > >> >>Let's introduce a function to retrieve the conne=
ctor currently assigned
> > > > > > > > > > > >> >>to an encoder, without using drm_atomic_state, t=
o make these drivers'
> > > > > > > > > > > >> >>life easier.
> > > > > > > > > > > >> >>
> > > > > > > > > > > >> >>Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@=
linaro.org>
> > > > > > > > > > > >> >>Co-developed-by: Simona Vetter <simona.vetter@ff=
wll.ch>
> > > > > > > > > > > >> >>Signed-off-by: Maxime Ripard <mripard@kernel.org>
> > > > > > > > > > > >> >>---
> > > > > > > > > > > >> >> drivers/gpu/drm/drm_atomic.c | 45 +++++++++++++=
+++++++++++++++++++++++++++++++
> > > > > > > > > > > >> >> include/drm/drm_atomic.h     |  3 +++
> > > > > > > > > > > >> >> 2 files changed, 48 insertions(+)
> > > > > > > > > > > >> >>
> > > > > > > > > > > >> >>diff --git a/drivers/gpu/drm/drm_atomic.c b/driv=
ers/gpu/drm/drm_atomic.c
> > > > > > > > > > > >> >>index 9ea2611770f43ce7ccba410406d5f2c528aab022..=
b926b132590e78f8d41d48eb4da4bccf170ee236 100644
> > > > > > > > > > > >> >>--- a/drivers/gpu/drm/drm_atomic.c
> > > > > > > > > > > >> >>+++ b/drivers/gpu/drm/drm_atomic.c
> > > > > > > > > > > >> >>@@ -985,10 +985,55 @@ drm_atomic_get_new_connect=
or_for_encoder(const struct drm_atomic_state *state,
> > > > > > > > > > > >> >>=20
> > > > > > > > > > > >> >> 	return NULL;
> > > > > > > > > > > >> >> }
> > > > > > > > > > > >> >> EXPORT_SYMBOL(drm_atomic_get_new_connector_for_=
encoder);
> > > > > > > > > > > >> >>=20
> > > > > > > > > > > >> >>+/**
> > > > > > > > > > > >> >>+ * drm_atomic_get_connector_for_encoder - Get c=
onnector currently assigned to an encoder
> > > > > > > > > > > >> >>+ * @encoder: The encoder to find the connector =
of
> > > > > > > > > > > >> >>+ * @ctx: Modeset locking context
> > > > > > > > > > > >> >>+ *
> > > > > > > > > > > >> >>+ * This function finds and returns the connecto=
r currently assigned to
> > > > > > > > > > > >> >>+ * an @encoder.
> > > > > > > > > > > >> >>+ *
> > > > > > > > > > > >> >>+ * Returns:
> > > > > > > > > > > >> >>+ * The connector connected to @encoder, or an e=
rror pointer otherwise.
> > > > > > > > > > > >> >>+ * When the error is EDEADLK, a deadlock has be=
en detected and the
> > > > > > > > > > > >> >>+ * sequence must be restarted.
> > > > > > > > > > > >> >>+ */
> > > > > > > > > > > >> >>+struct drm_connector *
> > > > > > > > > > > >> >>+drm_atomic_get_connector_for_encoder(const stru=
ct drm_encoder *encoder,
> > > > > > > > > > > >> >>+				     struct drm_modeset_acquire_ctx *ctx)
> > > > > > > > > > > >> >>+{
> > > > > > > > > > > >> >>+	struct drm_connector_list_iter conn_iter;
> > > > > > > > > > > >> >>+	struct drm_connector *out_connector =3D ERR_PT=
R(-EINVAL);
> > > > > > > > > > > >> >>+	struct drm_connector *connector;
> > > > > > > > > > > >> >>+	struct drm_device *dev =3D encoder->dev;
> > > > > > > > > > > >> >>+	int ret;
> > > > > > > > > > > >> >>+
> > > > > > > > > > > >> >>+	ret =3D drm_modeset_lock(&dev->mode_config.con=
nection_mutex, ctx);
> > > > > > > > > > > >> >>+	if (ret)
> > > > > > > > > > > >> >>+		return ERR_PTR(ret);
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >It seems that this will cause a deadlock when cal=
led from a  hotplug handling path,
> > > > > > > > > > > >> >I have a WIP DP diver[0],  which suggested by Dmi=
try to use this API from a=20
> > > > > > > > > > > >> >&drm_bridge_funcs.detect callback to get the conn=
ector,  as detect is called by drm_helper_probe_detect,
> > > > > > > > > > > >> >which will hold connection_mutex first, so the de=
aklock happens:
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >drm_helper_probe_detect(struct drm_connector *con=
nector,
> > > > > > > > > > > >> >                        struct drm_modeset_acquir=
e_ctx *ctx,
> > > > > > > > > > > >> >                        bool force)
> > > > > > > > > > > >> >{
> > > > > > > > > > > >> >        const struct drm_connector_helper_funcs *=
funcs =3D connector->helper_private;
> > > > > > > > > > > >> >        struct drm_device *dev =3D connector->dev;
> > > > > > > > > > > >> >        int ret;
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >        if (!ctx)
> > > > > > > > > > > >> >                return drm_helper_probe_detect_ct=
x(connector, force);
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >        ret =3D drm_modeset_lock(&dev->mode_confi=
g.connection_mutex, ctx);
> > > > > > > > > > > >> >        if (ret)
> > > > > > > > > > > >> >                return ret;
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >        if (funcs->detect_ctx)
> > > > > > > > > > > >> >                ret =3D funcs->detect_ctx(connect=
or, ctx, force);
> > > > > > > > > > > >> >        else if (connector->funcs->detect)
> > > > > > > > > > > >> >                ret =3D connector->funcs->detect(=
connector, force);
> > > > > > > > > > > >> >        else
> > > > > > > > > > > >> >                ret =3D connector_status_connecte=
d;
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >        if (ret !=3D connector->status)
> > > > > > > > > > > >> >                connector->epoch_counter +=3D 1;
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >So I wonder can we let drm_bridge_funcs.detect pa=
ss a connector for this case ?
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >
> > > > > > > > > > > >> >[0]https://lore.kernel.org/linux-rockchip/047EECF=
C-7E55-44EC-896F-13FE04333E4D@gmail.com/T/#m25bc53b79f5cc7bddfcb7aae5656f68=
df396f094
> > > > > > > > > > > >> >>+
> > > > > > > > > > > >> >>+	drm_connector_list_iter_begin(dev, &conn_iter);
> > > > > > > > > > > >> >>+	drm_for_each_connector_iter(connector, &conn_i=
ter) {
> > > > > > > > > > > >> >>+		if (!connector->state)
> > > > > > > > > > > >> >>+			continue;
> > > > > > > > > > > >> >>+
> > > > > > > > > > > >> >>+		if (encoder =3D=3D connector->state->best_enc=
oder) {
> > > > > > > > > > > >> >>+			out_connector =3D connector;
> > > > > > > > > > > >>=20
> > > > > > > > > > > >>=20
> > > > > > > > > > > >> When try to use this patch in my bridge driver,  I=
 found that the connector->state->best_encoder=20
> > > > > > > > > > > >>  maybe NULL when   drm_bridge_funcs.detect or drm_=
bridge_funcs.detect_ctx is  called:
> > > > > > > > > > > >>=20
> > > > > > > > > > > >> [   52.713030] Invalid return value -22 for connec=
tor detection
> > > > > > > > > > > >> [   52.713539] WARNING: CPU: 7 PID: 288 at drivers=
/gpu/drm/drm_probe_helper.c:602 drm_helper_probe_single_connector_modes+0x5=
e0/
> > > > > > > > > > > >> 0x63c
> > > > > > > > > > > >> [   52.714568] Modules linked in:
> > > > > > > > > > > >>=20
> > > > > > > > > > > >> [   52.724546] Call trace:
> > > > > > > > > > > >> [   52.724762]  drm_helper_probe_single_connector_=
modes+0x5e0/0x63c (P)
> > > > > > > > > > > >> [   52.725319]  drm_mode_getconnector+0x2a4/0x488
> > > > > > > > > > > >> [   52.725711]  drm_ioctl_kernel+0xb4/0x11c
> > > > > > > > > > > >> [   52.726057]  drm_ioctl+0x22c/0x544
> > > > > > > > > > > >> [   52.726358]  __arm64_sys_ioctl+0xac/0xe0
> > > > > > > > > > > >> [   52.726706]  invoke_syscall+0x44/0x100
> > > > > > > > > > > >> [   52.727039]  el0_svc_common.constprop.0+0x3c/0x=
d4
> > > > > > > > > > > >>=20
> > > > > > > > > > > >> This is because  best_encoder is set by set_best_e=
ncoder, which is called from
> > > > > > > > > > > >> drm_atomic_helper_check_modeset. When we call drm_=
mode_getconnector=20
> > > > > > > > > > > >> for the first time, the functions mentioned above =
have not been called yet,
> > > > > > > > > > > >> then we can't match the encoder from connector->st=
ate->best_encoder for this case.
> > > > > > > > > > > >
> > > > > > > > > > > >As far as I'm concerned, it's by design. Encoders an=
d connectors have
> > > > > > > > > > > >1:N relationship, and only once a connector has been=
 enabled it has an
> > > > > > > > > > > >encoder.
> > > > > > > > > > > >
> > > > > > > > > > > >If the connector is disabled, there's no associated =
encoder.
> > > > > > > > > > >=20
> > > > > > > > > > > Does this prove that this API is not suitable for my =
application scenario:=20
> > > > > > > > > > > Get the connector in the bridge's .detect callback, s=
o this means that I may
> > > > > > > > > > > still need to modify the bridge's connector callback =
so that it can pass the connector ?
> > > > > > > > > >=20
> > > > > > > > > > I'd say, yes, please.
> > > > > > > > >=20
> > > > > > > > > And I'd say no :)
> > > > > > > >=20
> > > > > > > > Fair enough :-)
> > > > > > > >=20
> > > > > > > > > There's no reason to deviate from the API other entities =
have here. It's
> > > > > > > > > just that the switch to DRM_BRIDGE_ATTACH_NO_CONNECTOR ha=
sn't been
> > > > > > > > > completely thought through and it's one of the part where=
 it shows.
> > > > > > > > >=20
> > > > > > > > > We have two alternative solutions: Either the driver crea=
tes the
> > > > > > > > > connector itself, since it doesn't seem to use any downst=
ream bridge
> > > > > > > > > anyway, or we need a new bridge helper to find the connec=
tor on a bridge
> > > > > > > > > chain.
> > > > > > > > >=20
> > > > > > > > > We have the iterator already, we just need a new accessor=
 to retrieve
> > > > > > > > > the (optional) connector of a bridge, and if there's none=
, go to the
> > > > > > > > > next bridge and try again.
> > > > > > > >=20
> > > > > > > > The problem is that there is no guarantee that the the crea=
ted connector
> > > > > > > > is created for or linked to any bridge. For example, for ms=
m driver I'm
> > > > > > > > waiting for several series to go in, but after that I plan =
to work on
> > > > > > > > moving connector creation to the generic code within the ms=
m driver.
> > > > > > > >=20
> > > > > > > > In other words, with DRM_BRIDGE_ATTACH_NO_CONNECTOR in plac=
e it is
> > > > > > > > perfectly legit not to have a bridge which has "connector o=
f a bridge".
> > > > > > > > It is possible to create drm_bridge_connector on the drm_en=
coder's side
> > > > > > > > after the drm_bridge_attach() succeeds.
> > > > > > >=20
> > > > > > > Sure, but then I'd expect detect and get_modes to only be cal=
led *after*
> > > > > > > that connector has been created, right?
> > > > > >=20
> > > > > > Yes. But you can not get the connector by following bridge chai=
n. Well,
> > > > > > unless you include encoder into the chain. If that's what you h=
ave had
> > > > > > in mind, then please excuse me, I didn't understand that from t=
he
> > > > > > beginning.
> > > > >=20
> > > > > You can't include the encoder either, because the encoder doesn't=
 have a
> > > > > connector assigned yet at that time.
> > > > >=20
> > > > > However, you can:
> > > > >=20
> > > > >   - Store the bridge attach flags in drm_bridge
> > > > >=20
> > > > >   - Create a hook that returns the connector a bridge creates, de=
pending
> > > > >     on the attach flags.
> > > > >=20
> > > > >   - Create a helper that iterates over the next bridges until the
> > > > >     previous hook returns !NULL. If it doesn't find anything, ret=
urn
> > > > >     NULL.
> > > > >=20
> > > > > AFAIK, it solves all the problems being discussed here, while dea=
ling
> > > > > with legacy and new-style bridge drivers.
> > > >=20
> > > > I'm still fail to understand how does that solve the issue for new-=
style
> > > > bridges. How do we find the created drm_bridge_connector for them?
> > >=20
> > > Sigh, for some reason I was remembering that drm_bridge_connector was=
 a
> > > bridge itself, which it isn't. My bad. But I guess it still applies. =
If
> > > we make drm_bridge_connector a bridge, then it works, doesn't it?
> >=20
> > I'd rather not. This would complicate other bridges using
> > drm_bridge_connector (e.g. ite-it6263, ti-sn65dsi86)
>=20
> I should have probably explained this a bit more.
>=20
> Currently each bridge has a link to the next bridge, obtained by lookup.
> All bridges are attached, then we create a connector.  Adding drm_bridge
> into drm_bridge_connector would mean that the chain is mutated after all
> bridges are attached. The bridge that assumes that is the last bridge in
> the chain won't be the last one anymore.
>=20
> Next, we get an immediate issue with DP bridge chains. In some cases
> they rely on connector's fwnode being the fwnode of the last bridge so
> that displayport AltMode driver can deliver HPD events properly via a
> call to drm_connector_oob_hotplug_event(). Pushing one extra bridge
> would raise a question, which OF node should be specified in that bridge
> (and why), how will connector receive HPD calls, etc.
>=20
> Last, but not least, we have bridge drivers which create
> drm_bridge_connector on their own if DRM_BRIDGE_ATTACH_NO_CONNECTOR
> wasn't specified. Adding one extra bridge might surprise them.
>=20
> Generally I feel that while this looks appealing, it turns the framework
> upside down and makes it more fragile.
>=20
> >=20
> > > > > > But frankly speaking, I think it might be easier to pass down t=
he
> > > > > > connector to the detect callback (as drm_connector_funcs.detect=
 already
> > > > > > gets the connecor) rather than making bridge drivers go through=
 the
> > > > > > chain to get the value that is already present in the caller fu=
nction.
> > > > > >=20
> > > > > > (For some other usecases I'd totally agree with you, especially=
 if the
> > > > > > connector isn't already available on the caller side).
> > > > >=20
> > > > > Still, we've tried to converge to the same API for all entities, =
it
> > > > > feels like a step backward to me.
> > > >=20
> > > > I'd argue here a bit. The drm_connector interface has connector her=
e.
> > > > drm_bridge is an extension/subpart of the drm_connector, so it woul=
d be
> > > > logical to extend that interface.
> > >=20
> > > The drm_connector interface has the connector because it's a connecto=
r.
> > > Just like CRTC atomic_check has a crtc, but you wouldn't pass the crtc
> > > pointer to drm_bridge atomic_check.
>=20
> I wouldn't pass CRTC pointer, because drm_bridge isn't a part of the
> CRTC. However it is clear that bridges reside between encoder and
> connector. As I wrote later, there are enough drm_bridge calls which
> recieve connector as an argument: get_modes(), edid_read(), all
> hdmi_audio_*() and dp_audio_*() calls. Not passing connector to those
> calls would make them much more complicated, especially in spite of
> Luca's work on hot-pluggable DRM bridges.

The counterpoints being atomic_check, or
atomic_get_input/output_bus_fmts where having the crtc_state and
connector state just don't make sense. You can get them through
drm_atomic_state, and that's what we should be doing.

We basically have two cases: the hooks that have access to
drm_atomic_state, and the ones that don't. The former should just get
drm_bridge and drm_atomic_state. They don't need anything more.

For the latter, I guess you've convinced me and we could indeed pass the
connector. However, I'd still like the parameters to be consistent, and
hdmi_audio_* have the reversed order compared to get_modes and
edid_read. Could you make sure the audio callbacks are using the same
order doing so?

Thanks

Maxime

--44qomko4rbzaytju
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaFQL7QAKCRAnX84Zoj2+
dqXeAX9Rz8e8LsLcV4WpiMD71VHOHLGJkJhKXtMHR4SfqRi/piQlP7nLegf3eltn
1BIc+X0BgOmIdCkvqQVnvBAQBWJgasBa+ffWr8H0SyqfO1m2luZEuMM2JpDGxOAs
6rKWPOCqXg==
=Rc/Y
-----END PGP SIGNATURE-----

--44qomko4rbzaytju--
