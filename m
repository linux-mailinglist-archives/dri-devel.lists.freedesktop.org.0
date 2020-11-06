Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED70C2A919C
	for <lists+dri-devel@lfdr.de>; Fri,  6 Nov 2020 09:37:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01DAE6EE2B;
	Fri,  6 Nov 2020 08:37:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A206EE28
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Nov 2020 08:37:22 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id A7909AB8F;
 Fri,  6 Nov 2020 08:37:20 +0000 (UTC)
Subject: Re: [PATCH] drm: Pass the full state to connectors atomic functions
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
References: <20201105173007.593960-1-maxime@cerno.tech>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <8acac28a-f0af-8785-132c-86b5d310be48@suse.de>
Date: Fri, 6 Nov 2020 09:37:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.3
MIME-Version: 1.0
In-Reply-To: <20201105173007.593960-1-maxime@cerno.tech>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, Leo Li <sunpeng.li@amd.com>,
 Melissa Wen <melissa.srw@gmail.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: multipart/mixed; boundary="===============1038635848=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1038635848==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="fUJeeTA2wWhFMONRDS2kOKFeiD3EP7tep"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--fUJeeTA2wWhFMONRDS2kOKFeiD3EP7tep
Content-Type: multipart/mixed; boundary="bz8B8HexPuRcWNRBg0spz8zGF3aElBznR";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>, Daniel Vetter
 <daniel.vetter@intel.com>, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, Harry Wentland <harry.wentland@amd.com>,
 Leo Li <sunpeng.li@amd.com>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Ben Skeggs <bskeggs@redhat.com>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>
Message-ID: <8acac28a-f0af-8785-132c-86b5d310be48@suse.de>
Subject: Re: [PATCH] drm: Pass the full state to connectors atomic functions
References: <20201105173007.593960-1-maxime@cerno.tech>
In-Reply-To: <20201105173007.593960-1-maxime@cerno.tech>

--bz8B8HexPuRcWNRBg0spz8zGF3aElBznR
Content-Type: multipart/mixed;
 boundary="------------37B1580A73F4DB5ED3754C52"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------37B1580A73F4DB5ED3754C52
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi

Am 05.11.20 um 18:30 schrieb Maxime Ripard:
> The current atomic helpers have either their object state being passed =
as
> an argument or the full atomic state.
>=20
> The former is the pattern that was done at first, before switching to t=
he
> latter for new hooks or when it was needed.
>=20
> Now that the CRTCs have been converted, let's move forward with the
> connectors to provide a consistent interface.
>=20
> The conversion was done using the coccinelle script below, and built te=
sted
> on all the drivers.

The coccinelle script appears to be missing. Apart from that

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>

>=20
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: "Christian K=C3=B6nig" <christian.koenig@amd.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> Cc: Melissa Wen <melissa.srw@gmail.com>
> Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>  .../drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c |  5 ++++-
>  drivers/gpu/drm/drm_atomic_helper.c                 |  8 ++++----
>  drivers/gpu/drm/i915/display/intel_dp_mst.c         |  7 +++++--
>  drivers/gpu/drm/nouveau/dispnv50/disp.c             |  5 ++++-
>  drivers/gpu/drm/vc4/vc4_txp.c                       |  4 +++-
>  drivers/gpu/drm/vkms/vkms_writeback.c               |  7 +++++--
>  include/drm/drm_modeset_helper_vtables.h            | 13 ++++++-------=

>  7 files changed, 31 insertions(+), 18 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.=
c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> index eee19edeeee5..f346cc74387f 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_mst_types.c
> @@ -24,6 +24,7 @@
>   */
> =20
>  #include <linux/version.h>
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_dp_mst_helper.h>
>  #include <drm/drm_dp_helper.h>
> @@ -252,8 +253,10 @@ static int dm_dp_mst_get_modes(struct drm_connecto=
r *connector)
> =20
>  static struct drm_encoder *
>  dm_mst_atomic_best_encoder(struct drm_connector *connector,
> -			   struct drm_connector_state *connector_state)
> +			   struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_co=
nnector_state(state,
> +											 connector);
>  	struct drm_device *dev =3D connector->dev;
>  	struct amdgpu_device *adev =3D drm_to_adev(dev);
>  	struct amdgpu_crtc *acrtc =3D to_amdgpu_crtc(connector_state->crtc);
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> index ddd0e3239150..ba1507036f26 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -122,7 +122,8 @@ static int handle_conflicting_encoders(struct drm_a=
tomic_state *state,
>  			continue;
> =20
>  		if (funcs->atomic_best_encoder)
> -			new_encoder =3D funcs->atomic_best_encoder(connector, new_conn_stat=
e);
> +			new_encoder =3D funcs->atomic_best_encoder(connector,
> +								 state);
>  		else if (funcs->best_encoder)
>  			new_encoder =3D funcs->best_encoder(connector);
>  		else
> @@ -345,8 +346,7 @@ update_connector_routing(struct drm_atomic_state *s=
tate,
>  	funcs =3D connector->helper_private;
> =20
>  	if (funcs->atomic_best_encoder)
> -		new_encoder =3D funcs->atomic_best_encoder(connector,
> -							 new_connector_state);
> +		new_encoder =3D funcs->atomic_best_encoder(connector, state);
>  	else if (funcs->best_encoder)
>  		new_encoder =3D funcs->best_encoder(connector);
>  	else
> @@ -1313,7 +1313,7 @@ static void drm_atomic_helper_commit_writebacks(s=
truct drm_device *dev,
> =20
>  		if (new_conn_state->writeback_job && new_conn_state->writeback_job->=
fb) {
>  			WARN_ON(connector->connector_type !=3D DRM_MODE_CONNECTOR_WRITEBACK=
);
> -			funcs->atomic_commit(connector, new_conn_state);
> +			funcs->atomic_commit(connector, old_state);
>  		}
>  	}
>  }
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_mst.c b/drivers/gpu/=
drm/i915/display/intel_dp_mst.c
> index 64d885539e94..b879a0622ada 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_mst.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_mst.c
> @@ -23,6 +23,7 @@
>   *
>   */
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_edid.h>
>  #include <drm/drm_probe_helper.h>
> @@ -706,11 +707,13 @@ intel_dp_mst_mode_valid_ctx(struct drm_connector =
*connector,
>  }
> =20
>  static struct drm_encoder *intel_mst_atomic_best_encoder(struct drm_co=
nnector *connector,
> -							 struct drm_connector_state *state)
> +							 struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_co=
nnector_state(state,
> +											 connector);
>  	struct intel_connector *intel_connector =3D to_intel_connector(connec=
tor);
>  	struct intel_dp *intel_dp =3D intel_connector->mst_port;
> -	struct intel_crtc *crtc =3D to_intel_crtc(state->crtc);
> +	struct intel_crtc *crtc =3D to_intel_crtc(connector_state->crtc);
> =20
>  	return &intel_dp->mst_encoders[crtc->pipe]->base.base;
>  }
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/=
nouveau/dispnv50/disp.c
> index b111fe24a06b..911c2cbe6aa3 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -32,6 +32,7 @@
>  #include <linux/hdmi.h>
>  #include <linux/component.h>
> =20
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_atomic_helper.h>
>  #include <drm/drm_dp_helper.h>
>  #include <drm/drm_edid.h>
> @@ -1161,8 +1162,10 @@ nv50_msto_new(struct drm_device *dev, struct nv5=
0_head *head, int id)
> =20
>  static struct drm_encoder *
>  nv50_mstc_atomic_best_encoder(struct drm_connector *connector,
> -			      struct drm_connector_state *connector_state)
> +			      struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_co=
nnector_state(state,
> +											 connector);
>  	struct nv50_mstc *mstc =3D nv50_mstc(connector);
>  	struct drm_crtc *crtc =3D connector_state->crtc;
> =20
> diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_tx=
p.c
> index 34612edcabbd..8aa5220885f4 100644
> --- a/drivers/gpu/drm/vc4/vc4_txp.c
> +++ b/drivers/gpu/drm/vc4/vc4_txp.c
> @@ -273,8 +273,10 @@ static int vc4_txp_connector_atomic_check(struct d=
rm_connector *conn,
>  }
> =20
>  static void vc4_txp_connector_atomic_commit(struct drm_connector *conn=
,
> -					struct drm_connector_state *conn_state)
> +					struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *conn_state =3D drm_atomic_get_new_connect=
or_state(state,
> +										    conn);
>  	struct vc4_txp *txp =3D connector_to_vc4_txp(conn);
>  	struct drm_gem_cma_object *gem;
>  	struct drm_display_mode *mode;
> diff --git a/drivers/gpu/drm/vkms/vkms_writeback.c b/drivers/gpu/drm/vk=
ms/vkms_writeback.c
> index 26b903926872..cafdc8463541 100644
> --- a/drivers/gpu/drm/vkms/vkms_writeback.c
> +++ b/drivers/gpu/drm/vkms/vkms_writeback.c
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: GPL-2.0+
> =20
>  #include "vkms_drv.h"
> +#include <drm/drm_atomic.h>
>  #include <drm/drm_fourcc.h>
>  #include <drm/drm_writeback.h>
>  #include <drm/drm_probe_helper.h>
> @@ -99,8 +100,10 @@ static void vkms_wb_cleanup_job(struct drm_writebac=
k_connector *connector,
>  }
> =20
>  static void vkms_wb_atomic_commit(struct drm_connector *conn,
> -				  struct drm_connector_state *state)
> +				  struct drm_atomic_state *state)
>  {
> +	struct drm_connector_state *connector_state =3D drm_atomic_get_new_co=
nnector_state(state,
> +											 conn);
>  	struct vkms_device *vkmsdev =3D drm_device_to_vkms_device(conn->dev);=

>  	struct vkms_output *output =3D &vkmsdev->output;
>  	struct drm_writeback_connector *wb_conn =3D &output->wb_connector;
> @@ -116,7 +119,7 @@ static void vkms_wb_atomic_commit(struct drm_connec=
tor *conn,
>  	crtc_state->active_writeback =3D conn_state->writeback_job->priv;
>  	crtc_state->wb_pending =3D true;
>  	spin_unlock_irq(&output->composer_lock);
> -	drm_writeback_queue_job(wb_conn, state);
> +	drm_writeback_queue_job(wb_conn, connector_state);
>  }
> =20
>  static const struct drm_connector_helper_funcs vkms_wb_conn_helper_fun=
cs =3D {
> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/drm=
_modeset_helper_vtables.h
> index f2de050085be..16ff3fa148f5 100644
> --- a/include/drm/drm_modeset_helper_vtables.h
> +++ b/include/drm/drm_modeset_helper_vtables.h
> @@ -1044,9 +1044,8 @@ struct drm_connector_helper_funcs {
>  	 * NOTE:
>  	 *
>  	 * This function is called in the check phase of an atomic update. Th=
e
> -	 * driver is not allowed to change anything outside of the free-stand=
ing
> -	 * state objects passed-in or assembled in the overall &drm_atomic_st=
ate
> -	 * update tracking structure.
> +	 * driver is not allowed to change anything outside of the
> +	 * &drm_atomic_state update tracking structure passed in.
>  	 *
>  	 * RETURNS:
>  	 *
> @@ -1056,7 +1055,7 @@ struct drm_connector_helper_funcs {
>  	 * for this.
>  	 */
>  	struct drm_encoder *(*atomic_best_encoder)(struct drm_connector *conn=
ector,
> -						   struct drm_connector_state *connector_state);
> +						   struct drm_atomic_state *state);
> =20
>  	/**
>  	 * @atomic_check:
> @@ -1097,15 +1096,15 @@ struct drm_connector_helper_funcs {
>  	 *
>  	 * This hook is to be used by drivers implementing writeback connecto=
rs
>  	 * that need a point when to commit the writeback job to the hardware=
=2E
> -	 * The writeback_job to commit is available in
> -	 * &drm_connector_state.writeback_job.
> +	 * The writeback_job to commit is available in the new connector stat=
e,
> +	 * in &drm_connector_state.writeback_job.
>  	 *
>  	 * This hook is optional.
>  	 *
>  	 * This callback is used by the atomic modeset helpers.
>  	 */
>  	void (*atomic_commit)(struct drm_connector *connector,
> -			      struct drm_connector_state *state);
> +			      struct drm_atomic_state *state);
> =20
>  	/**
>  	 * @prepare_writeback_job:
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer

--------------37B1580A73F4DB5ED3754C52
Content-Type: application/pgp-keys;
 name="OpenPGP_0x680DC11D530B7A23.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="OpenPGP_0x680DC11D530B7A23.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

xsBNBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdgX=
H47
fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0BeB5B=
bqP
5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4YchdHm3bkPj=
z9E
ErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB9GluwvIhSezPg=
nEm
imZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEBAAHNKFRob21hcyBaa=
W1t
ZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmNvbT7CwI4EEwEIADgCGwMFCwkIBwIGFQoJCAsCB=
BYC
AwECHgECF4AWIQRyF/usjOnPY0ShaOVoDcEdUwt6IwUCXvxIWAAKCRBoDcEdUwt6I+aZB/9ih=
Onf
G4Lgf1L87cvoXh95/bnaJ6aQhP6/ZeRleuCXflnyDajlm3c9loQr0r2bQUi7JeYwUKbBab2QS=
GJm
DMRGlLMnmzWB8mHmZ6bHAu+2Sth8SraE42p6BB9d8dlYEID+dl/D/xUBeulfkck5rloGtYqDi=
+1Q
DfkEZJaxVSZ6FFkXuQi/G9qcI4iklN2nv02iQ7mZe8WYAysix6s/6vIobhirEBreclSNxXqis=
p8n
91+v855JC11EgRdUXMRK81IAaCKXP8zLx3ixku7mvP9Om61yerHSbeU2HZbIggZYQlFh6llJm=
zF1
CjCWgPTJyk4t4kMTcNOw5ykD47vU/KW+wl0EEBECAB0WIQQn6OOmnzvP/7ktjmoud6EwEfXTw=
gUC
WzodVwAKCRAud6EwEfXTwidvAKDkOADDHfI0QNXqAZcg6i1kOndAYACeLXHBwpjnumkPSyoab=
IiL
+he8r3zCwHMEEAEIAB0WIQQeXZghmQijlU7YzFiqUDvJrg9HpwUCWznxsQAKCRCqUDvJrg9Hp=
42f
CADIvsZcAd04PDFclRltHr2huy6s7+ZZA6PgYlMblEBh4bJA+dNPBTvzpJ7FJv/bmHOa+phWy=
Urj
EpfFGuOKGuWAfzgVAEu52fMrW3/mm+O26z1AKIu8hiZ/x9OAe4AM71ZO2lZrV1/53ZdzWnRuO=
45N
GQcotU8oeVfT9okAfmozmWMmIMq7Q0K6bV8W3qiD5XfDNxjr2caxc/9WX1bZPUo3n0H23MNaA=
Tpy
Oz732UtDh6sKUAB1RfzBBd/REbjHD7+quwJGAdRScyDRncX1vNb2+wihy0ipA69XY3bkhR5iD=
u5r
A9enuiMe6J1IBMI1PZh+vOufB/M6cd2D9RULIJaJwsBzBBABCAAdFiEEuyNtt7Ge78bIRx1op=
/N8
GYw5MYEFAls6MrsACgkQp/N8GYw5MYEnLQf/dwqlDJVQL2q+i8FFaqTMAm0n9jLRV6pN8JxFH=
j0g
voyWUOnQuNdAFgtKd26ZhN8NkLoSMO8E19eBPfLoBIFK5yNNVmRHAZm07MzGbA0uNWINJhmdR=
bZM
RMh0nneXjcEU/IvUmd8TPFTAd24X2mbzHgcaHMLJSVx1ohd4alRJXHIqDobKmiVwekyPnInJn=
zWw
iuZUkIotTkQple1PT/dF3S+KtPXBL6ldQ4NkAeCjsz4wnzSa9+VKOxEhiHM0PMzXSbkCMP+4m=
Xy9
RMplBw9Dm9hN2PSouBPifIrSodiiSWZYXOEkzLiBAB0frCKR63Dnx9kvjCD9Pz5wLd/70rjqI=
c0n
VGhvbWFzIFppbW1lcm1hbm4gPHR6aW1tZXJtYW5uQHN1c2UuZGU+wsCOBBMBCAA4AhsDBQsJC=
AcC
BhUKCQgLAgQWAgMBAh4BAheAFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl78SF4ACgkQaA3BH=
VML
eiOpGAgAih6C1OnWms/N8eBMC4Q93y/nyywe5vCL22Dr1rwgn6Iw2jOGziJSi7zhY4sEk2NKJ=
5cd
lFrx8mP//b+xO4AGffwBD0Vwpf38Hj2Gt0KjpzRYccqqU+tJPO5c0pjI52ZIV3+kOEFvYGfkN=
PHE
flE+b81T8L2dSXCLtj4WAGUM1rmHn3bCYl+/RwkB+8XnoL5AvrmMcU4Uhb3FJpM4DHExccYkd=
eSL
ojBppOCztBCUpBx3le+8QPVvAvJDuur4wRmjk3sjKClAwzeqoYyUKcN3JDdb3mt3QcJal9rSh=
VEI
7B25IvfmEbs42oGm8GPzPkaNJu3gcska+l5PSTfurNETGsJdBBARAgAdFiEEJ+jjpp87z/+5L=
Y5q
LnehMBH108IFAls6HVcACgkQLnehMBH108LTkACgjLQdDYMENi6BDjY/gd/LF9lMi8oAnR+o0=
FwE
Vb1K1tEMQ/1x+k1U6/xgwsBzBBABCAAdFiEEHl2YIZkIo5VO2MxYqlA7ya4PR6cFAls58bMAC=
gkQ
qlA7ya4PR6cvTAgAzY1N5QMKh8ECRtYcZNmilyV59uHTEY9hAR+203JqWnSGfUKtU7s6xfl5O=
NGq
DI5rULk4Cw2CEIzg9Sat+/lxn36w2f1tEznS5Vb0gVGWrzDAFjj7tB6MnmCzsNb/S1kgxnqJM=
Yor
RYQ7uB3Yr2Fdp08FJxN0ipd5YfzaZ6KoSWcRAv4r1R4ZQGuS77URAg7HDOIrBMOVO+HIn7GYQ=
qPS
5ZFw5yXbvEtL1c5Y8Zdw1AG2VmEXx78TWQVG3kI8/lQF1QI3yrJ1Rp2x5eK9I0OJihv13IlIW=
3sb
QGrj9pxF63kA20ZFaynzFglBGiyxExYvTD0/xKIhzYhj8mtCunPb2cLAcwQQAQgAHRYhBLsjb=
bex
nu/GyEcdaKfzfBmMOTGBBQJbOjLAAAoJEKfzfBmMOTGBBoMIALIW4EtBY28tPwZMOpN/+ARPO=
a2g
Qzpivw7iNtiDTnGIXMCoxly1CybfMdqTHYmuKbEO9AlFAlDOnkgInsn8E65IvgUTVI95Ah+Ob=
iPI
FkYc/9a+AexPl7f5kI9489k77eKtqtMpWFpo/vROmRroSw4JnM7ovwPq1QOSHExfTKbLunzD1=
i3V
4PShSZ6bGsp1LW6Wk0lRMHDuAk3xsyjBWfJwSbrCe3E6OsLG7BuQqEUt2fR6NxdDRSR9tQUp9=
Tri
AYG5LndmUzxeU6FAQjD8Wt1ezOFH5ODcCDXfRyYmE6uCGA4EvO8l9R3o68NPlUjPRAZsCbxJa=
UAg
iazX1nyQGwvOwE0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRHU=
E9e
osYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgTRjP+q=
bU6
3Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+RdhgATnWWG=
KdD
egUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zbehDda8lvhFXod=
NFM
AgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r12+lqdsAEQEAAcLAf=
AQY
AQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkDwmcAAAoJEGgNwR1TC3ojp=
fcI
AInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2h9ifw9Nf2TjCZ6AMvC3thAN0r=
FDj
55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxUn+LSiRrOdywn6erjxRi9EYTVLCHcD=
hBE
jKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uIaMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU=
2y3
ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBWHE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/t=
sZv
yEX6zN8CtirPdPWu/VXNRYAl/lat7lSI3H26qrE=3D
=3DmxFq
-----END PGP PUBLIC KEY BLOCK-----

--------------37B1580A73F4DB5ED3754C52--

--bz8B8HexPuRcWNRBg0spz8zGF3aElBznR--

--fUJeeTA2wWhFMONRDS2kOKFeiD3EP7tep
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsB5BAABCAAjFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl+lCz8FAwAAAAAACgkQaA3BHVMLeiN9
bgf7BAMdXPOufp+Ec3KlVMBBTNksWd483tuIGOWZtarDw46L1NhOfcULqJlYD+apyGI0OYtUNJ6B
LJvcG8rI9uKZysMK5kBYABjVj/yVIiPv1nYSXipRJzSzrZaCDjwqOBO9CN/fhDIZsRMyg2Q+OSVS
5u9zeIGwk6rZojpJkIQHg2iS11McSL3rVB/beimFvjPu7ZDB0iPY9jRnTgLFRIjQCQjEosCkKGEy
QYrCrf6Bf5LQrwo/qxMeyrAVvHC69YUqJWPmCrxTtsHRjS7jppWVpK/4qv9LzlyZU/nt4w1pVfL9
ektvHEiYozmfYJxqHWPMt5dXtUyKxxHyTqsv8oswnA==
=Ib/h
-----END PGP SIGNATURE-----

--fUJeeTA2wWhFMONRDS2kOKFeiD3EP7tep--

--===============1038635848==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1038635848==--
