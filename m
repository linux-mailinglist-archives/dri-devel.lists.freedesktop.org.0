Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B492A114552
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2019 18:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E35E6E999;
	Thu,  5 Dec 2019 17:04:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9206B6E999
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2019 17:04:01 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id CEBA2AC4D;
 Thu,  5 Dec 2019 17:03:59 +0000 (UTC)
Subject: Re: [PATCH 2/2] drm/atomic: Spell CRTC consistently
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
References: <20191205164959.1926200-1-thierry.reding@gmail.com>
 <20191205164959.1926200-2-thierry.reding@gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Autocrypt: addr=tzimmermann@suse.de; keydata=
 mQENBFs50uABCADEHPidWt974CaxBVbrIBwqcq/WURinJ3+2WlIrKWspiP83vfZKaXhFYsdg
 XH47fDVbPPj+d6tQrw5lPQCyqjwrCPYnq3WlIBnGPJ4/jreTL6V+qfKRDlGLWFjZcsrPJGE0
 BeB5BbqP5erN1qylK9i3gPoQjXGhpBpQYwRrEyQyjuvk+Ev0K1Jc5tVDeJAuau3TGNgah4Yc
 hdHm3bkPjz9EErV85RwvImQ1dptvx6s7xzwXTgGAsaYZsL8WCwDaTuqFa1d1jjlaxg6+tZsB
 9GluwvIhSezPgnEmimZDkGnZRRSFiGP8yjqTjjWuf0bSj5rUnTGiyLyRZRNGcXmu6hjlABEB
 AAG0J1Rob21hcyBaaW1tZXJtYW5uIDx0emltbWVybWFubkBzdXNlLmRlPokBVAQTAQgAPhYh
 BHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsDBQkDwmcABQsJCAcCBhUKCQgLAgQWAgMB
 Ah4BAheAAAoJEGgNwR1TC3ojR80H/jH+vYavwQ+TvO8ksXL9JQWc3IFSiGpuSVXLCdg62AmR
 irxW+qCwNncNQyb9rd30gzdectSkPWL3KSqEResBe24IbA5/jSkPweJasgXtfhuyoeCJ6PXo
 clQQGKIoFIAEv1s8l0ggPZswvCinegl1diyJXUXmdEJRTWYAtxn/atut1o6Giv6D2qmYbXN7
 mneMC5MzlLaJKUtoH7U/IjVw1sx2qtxAZGKVm4RZxPnMCp9E1MAr5t4dP5gJCIiqsdrVqI6i
 KupZstMxstPU//azmz7ZWWxT0JzgJqZSvPYx/SATeexTYBP47YFyri4jnsty2ErS91E6H8os
 Bv6pnSn7eAq5AQ0EWznS4AEIAMYmP4M/V+T5RY5at/g7rUdNsLhWv1APYrh9RQefODYHrNRH
 UE9eosYbT6XMryR9hT8XlGOYRwKWwiQBoWSDiTMo/Xi29jUnn4BXfI2px2DTXwc22LKtLAgT
 RjP+qbU63Y0xnQN29UGDbYgyyK51DW3H0If2a3JNsheAAK+Xc9baj0LGIc8T9uiEWHBnCH+R
 dhgATnWWGKdDegUR5BkDfDg5O/FISymJBHx2Dyoklv5g4BzkgqTqwmaYzsl8UxZKvbaxq0zb
 ehDda8lvhFXodNFMAgTLJlLuDYOGLK2AwbrS3Sp0AEbkpdJBb44qVlGm5bApZouHeJ/+n+7r
 12+lqdsAEQEAAYkBPAQYAQgAJhYhBHIX+6yM6c9jRKFo5WgNwR1TC3ojBQJbOdLgAhsMBQkD
 wmcAAAoJEGgNwR1TC3ojpfcIAInwP5OlcEKokTnHCiDTz4Ony4GnHRP2fXATQZCKxmu4AJY2
 h9ifw9Nf2TjCZ6AMvC3thAN0rFDj55N9l4s1CpaDo4J+0fkrHuyNacnT206CeJV1E7NYntxU
 n+LSiRrOdywn6erjxRi9EYTVLCHcDhBEjKmFZfg4AM4GZMWX1lg0+eHbd5oL1as28WvvI/uI
 aMyV8RbyXot1r/8QLlWldU3NrTF5p7TMU2y3ZH2mf5suSKHAMtbE4jKJ8ZHFOo3GhLgjVrBW
 HE9JXO08xKkgD+w6v83+nomsEuf6C6LYrqY/tsZvyEX6zN8CtirPdPWu/VXNRYAl/lat7lSI
 3H26qrE=
Message-ID: <9084d547-5ba7-510f-0fa2-18d881ffe793@suse.de>
Date: Thu, 5 Dec 2019 18:03:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20191205164959.1926200-2-thierry.reding@gmail.com>
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Content-Type: multipart/mixed; boundary="===============0544132790=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0544132790==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="0jRffai8DLrYZ6AfLg6tbCNmYG93LIsHU"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--0jRffai8DLrYZ6AfLg6tbCNmYG93LIsHU
Content-Type: multipart/mixed; boundary="vlqk0KOqVRaZLnZ45ul53BhxOatLwBnXz";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org
Message-ID: <9084d547-5ba7-510f-0fa2-18d881ffe793@suse.de>
Subject: Re: [PATCH 2/2] drm/atomic: Spell CRTC consistently
References: <20191205164959.1926200-1-thierry.reding@gmail.com>
 <20191205164959.1926200-2-thierry.reding@gmail.com>
In-Reply-To: <20191205164959.1926200-2-thierry.reding@gmail.com>

--vlqk0KOqVRaZLnZ45ul53BhxOatLwBnXz
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Both patches:

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>

Am 05.12.19 um 17:49 schrieb Thierry Reding:
> From: Thierry Reding <treding@nvidia.com>
>=20
> CRTC is an abbreviation and should be all caps in prose. Update all
> kerneldoc comments to use a consistent spelling.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/gpu/drm/drm_atomic.c        | 20 ++++-----
>  drivers/gpu/drm/drm_atomic_helper.c | 68 ++++++++++++++---------------=

>  drivers/gpu/drm/drm_atomic_uapi.c   | 16 +++----
>  include/drm/drm_atomic.h            | 30 ++++++-------
>  include/drm/drm_atomic_helper.h     |  8 ++--
>  5 files changed, 71 insertions(+), 71 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.=
c
> index ab4508f25986..d33691512a8e 100644
> --- a/drivers/gpu/drm/drm_atomic.c
> +++ b/drivers/gpu/drm/drm_atomic.c
> @@ -251,7 +251,7 @@ EXPORT_SYMBOL(drm_atomic_state_clear);
>   * @ref: This atomic state to deallocate
>   *
>   * This frees all memory associated with an atomic state, including al=
l the
> - * per-object state for planes, crtcs and connectors.
> + * per-object state for planes, CRTCs and connectors.
>   */
>  void __drm_atomic_state_free(struct kref *ref)
>  {
> @@ -272,12 +272,12 @@ void __drm_atomic_state_free(struct kref *ref)
>  EXPORT_SYMBOL(__drm_atomic_state_free);
> =20
>  /**
> - * drm_atomic_get_crtc_state - get crtc state
> + * drm_atomic_get_crtc_state - get CRTC state
>   * @state: global atomic state object
> - * @crtc: crtc to get state object for
> + * @crtc: CRTC to get state object for
>   *
> - * This function returns the crtc state for the given crtc, allocating=
 it if
> - * needed. It will also grab the relevant crtc lock to make sure that =
the state
> + * This function returns the CRTC state for the given CRTC, allocating=
 it if
> + * needed. It will also grab the relevant CRTC lock to make sure that =
the state
>   * is consistent.
>   *
>   * Returns:
> @@ -1018,14 +1018,14 @@ static void drm_atomic_connector_print_state(st=
ruct drm_printer *p,
>  }
> =20
>  /**
> - * drm_atomic_add_affected_connectors - add connectors for crtc
> + * drm_atomic_add_affected_connectors - add connectors for CRTC
>   * @state: atomic state
> - * @crtc: DRM crtc
> + * @crtc: DRM CRTC
>   *
>   * This function walks the current configuration and adds all connecto=
rs
>   * currently using @crtc to the atomic configuration @state. Note that=
 this
>   * function must acquire the connection mutex. This can potentially ca=
use
> - * unneeded seralization if the update is just for the planes on one c=
rtc. Hence
> + * unneeded seralization if the update is just for the planes on one C=
RTC. Hence
>   * drivers and helpers should only call this when really needed (e.g. =
when a
>   * full modeset needs to happen due to some change).
>   *
> @@ -1078,9 +1078,9 @@ drm_atomic_add_affected_connectors(struct drm_ato=
mic_state *state,
>  EXPORT_SYMBOL(drm_atomic_add_affected_connectors);
> =20
>  /**
> - * drm_atomic_add_affected_planes - add planes for crtc
> + * drm_atomic_add_affected_planes - add planes for CRTC
>   * @state: atomic state
> - * @crtc: DRM crtc
> + * @crtc: DRM CRTC
>   *
>   * This function walks the current configuration and adds all planes
>   * currently used by @crtc to the atomic configuration @state. This is=
 useful
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_=
atomic_helper.c
> index 7bf245aa2d05..c00fcfc2406c 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -150,8 +150,8 @@ static int handle_conflicting_encoders(struct drm_a=
tomic_state *state,
>  	 * is not set, an error is returned. Userspace can provide a solution=

>  	 * through the atomic ioctl.
>  	 *
> -	 * If the flag is set conflicting connectors are removed from the crt=
c
> -	 * and the crtc is disabled if no encoder is left. This preserves
> +	 * If the flag is set conflicting connectors are removed from the CRT=
C
> +	 * and the CRTC is disabled if no encoder is left. This preserves
>  	 * compatibility with the legacy set_config behavior.
>  	 */
>  	drm_connector_list_iter_begin(state->dev, &conn_iter);
> @@ -556,27 +556,27 @@ mode_valid(struct drm_atomic_state *state)
>   * @state: the driver state object
>   *
>   * Check the state object to see if the requested state is physically =
possible.
> - * This does all the crtc and connector related computations for an at=
omic
> + * This does all the CRTC and connector related computations for an at=
omic
>   * update and adds any additional connectors needed for full modesets.=
 It calls
>   * the various per-object callbacks in the follow order:
>   *
>   * 1. &drm_connector_helper_funcs.atomic_best_encoder for determining =
the new encoder.
>   * 2. &drm_connector_helper_funcs.atomic_check to validate the connect=
or state.
>   * 3. If it's determined a modeset is needed then all connectors on th=
e affected
> - *    crtc are added and &drm_connector_helper_funcs.atomic_check is r=
un on them.
> + *    CRTC are added and &drm_connector_helper_funcs.atomic_check is r=
un on them.
>   * 4. &drm_encoder_helper_funcs.mode_valid, &drm_bridge_funcs.mode_val=
id and
>   *    &drm_crtc_helper_funcs.mode_valid are called on the affected com=
ponents.
>   * 5. &drm_bridge_funcs.mode_fixup is called on all encoder bridges.
>   * 6. &drm_encoder_helper_funcs.atomic_check is called to validate any=
 encoder state.
> - *    This function is only called when the encoder will be part of a =
configured crtc,
> + *    This function is only called when the encoder will be part of a =
configured CRTC,
>   *    it must not be used for implementing connector property validati=
on.
>   *    If this function is NULL, &drm_atomic_encoder_helper_funcs.mode_=
fixup is called
>   *    instead.
> - * 7. &drm_crtc_helper_funcs.mode_fixup is called last, to fix up the =
mode with crtc constraints.
> + * 7. &drm_crtc_helper_funcs.mode_fixup is called last, to fix up the =
mode with CRTC constraints.
>   *
>   * &drm_crtc_state.mode_changed is set when the input mode is changed.=

>   * &drm_crtc_state.connectors_changed is set when a connector is added=
 or
> - * removed from the crtc.  &drm_crtc_state.active_changed is set when
> + * removed from the CRTC.  &drm_crtc_state.active_changed is set when
>   * &drm_crtc_state.active changes, which is used for DPMS.
>   * See also: drm_atomic_crtc_needs_modeset()
>   *
> @@ -687,7 +687,7 @@ drm_atomic_helper_check_modeset(struct drm_device *=
dev,
> =20
>  	/*
>  	 * After all the routing has been prepared we need to add in any
> -	 * connector which is itself unchanged, but whose crtc changes its
> +	 * connector which is itself unchanged, but whose CRTC changes its
>  	 * configuration. This must be done before calling mode_fixup in case=
 a
>  	 * crtc only changed its mode but has the same set of connectors.
>  	 */
> @@ -736,13 +736,13 @@ EXPORT_SYMBOL(drm_atomic_helper_check_modeset);
>  /**
>   * drm_atomic_helper_check_plane_state() - Check plane state for valid=
ity
>   * @plane_state: plane state to check
> - * @crtc_state: crtc state to check
> + * @crtc_state: CRTC state to check
>   * @min_scale: minimum @src:@dest scaling factor in 16.16 fixed point
>   * @max_scale: maximum @src:@dest scaling factor in 16.16 fixed point
>   * @can_position: is it legal to position the plane such that it
> - *                doesn't cover the entire crtc?  This will generally
> + *                doesn't cover the entire CRTC?  This will generally
>   *                only be false for primary planes.
> - * @can_update_disabled: can the plane be updated while the crtc
> + * @can_update_disabled: can the plane be updated while the CRTC
>   *                       is disabled?
>   *
>   * Checks that a desired plane update is valid, and updates various
> @@ -839,7 +839,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_plane_state);=

>   * &drm_crtc_helper_funcs.atomic_check and &drm_plane_helper_funcs.ato=
mic_check
>   * hooks provided by the driver.
>   *
> - * It also sets &drm_crtc_state.planes_changed to indicate that a crtc=
 has
> + * It also sets &drm_crtc_state.planes_changed to indicate that a CRTC=
 has
>   * updated planes.
>   *
>   * RETURNS:
> @@ -903,7 +903,7 @@ EXPORT_SYMBOL(drm_atomic_helper_check_planes);
>   * @state: the driver state object
>   *
>   * Check the state object to see if the requested state is physically =
possible.
> - * Only crtcs and planes have check callbacks, so for any additional (=
global)
> + * Only CRTCs and planes have check callbacks, so for any additional (=
global)
>   * checking that a driver needs it can simply wrap that around this fu=
nction.
>   * Drivers without such needs can directly use this as their
>   * &drm_mode_config_funcs.atomic_check callback.
> @@ -956,14 +956,14 @@ crtc_needs_disable(struct drm_crtc_state *old_sta=
te,
>  		   struct drm_crtc_state *new_state)
>  {
>  	/*
> -	 * No new_state means the crtc is off, so the only criteria is whethe=
r
> +	 * No new_state means the CRTC is off, so the only criteria is whethe=
r
>  	 * it's currently active or in self refresh mode.
>  	 */
>  	if (!new_state)
>  		return drm_atomic_crtc_effectively_active(old_state);
> =20
>  	/*
> -	 * We need to run through the crtc_funcs->disable() function if the c=
rtc
> +	 * We need to run through the crtc_funcs->disable() function if the C=
RTC
>  	 * is currently on, if it's transitioning to self refresh mode, or if=

>  	 * it's in self refresh mode and needs to be fully disabled.
>  	 */
> @@ -1080,7 +1080,7 @@ disable_outputs(struct drm_device *dev, struct dr=
m_atomic_state *old_state)
>   * @old_state: atomic state object with old state structures
>   *
>   * This function updates all the various legacy modeset state pointers=
 in
> - * connectors, encoders and crtcs. It also updates the timestamping co=
nstants
> + * connectors, encoders and CRTCs. It also updates the timestamping co=
nstants
>   * used for precise vblank timestamps by calling
>   * drm_calc_timestamping_constants().
>   *
> @@ -1227,7 +1227,7 @@ crtc_set_mode(struct drm_device *dev, struct drm_=
atomic_state *old_state)
>   * This function shuts down all the outputs that need to be shut down =
and
>   * prepares them (if required) with the new mode.
>   *
> - * For compatibility with legacy crtc helpers this should be called be=
fore
> + * For compatibility with legacy CRTC helpers this should be called be=
fore
>   * drm_atomic_helper_commit_planes(), which is what the default commit=
 function
>   * does. But drivers with different needs can group the modeset commit=
s together
>   * and do the plane commits at the end. This is useful for drivers doi=
ng runtime
> @@ -1273,7 +1273,7 @@ static void drm_atomic_helper_commit_writebacks(s=
truct drm_device *dev,
>   * This function enables all the outputs with the new configuration wh=
ich had to
>   * be turned off for the update.
>   *
> - * For compatibility with legacy crtc helpers this should be called af=
ter
> + * For compatibility with legacy CRTC helpers this should be called af=
ter
>   * drm_atomic_helper_commit_planes(), which is what the default commit=
 function
>   * does. But drivers with different needs can group the modeset commit=
s together
>   * and do the plane commits at the end. This is useful for drivers doi=
ng runtime
> @@ -1403,12 +1403,12 @@ int drm_atomic_helper_wait_for_fences(struct dr=
m_device *dev,
>  EXPORT_SYMBOL(drm_atomic_helper_wait_for_fences);
> =20
>  /**
> - * drm_atomic_helper_wait_for_vblanks - wait for vblank on crtcs
> + * drm_atomic_helper_wait_for_vblanks - wait for vblank on CRTCs
>   * @dev: DRM device
>   * @old_state: atomic state object with old state structures
>   *
>   * Helper to, after atomic commit, wait for vblanks on all affected
> - * crtcs (ie. before cleaning up old framebuffers using
> + * CRTCs (ie. before cleaning up old framebuffers using
>   * drm_atomic_helper_cleanup_planes()). It will only wait on CRTCs whe=
re the
>   * framebuffers have actually changed to optimize for the legacy curso=
r and
>   * plane update use-case.
> @@ -1597,7 +1597,7 @@ static void commit_tail(struct drm_atomic_state *=
old_state)
> =20
>  	/*
>  	 * We cannot safely access new_crtc_state after
> -	 * drm_atomic_helper_commit_hw_done() so figure out which crtc's have=

> +	 * drm_atomic_helper_commit_hw_done() so figure out which CRTCs have
>  	 * self-refresh active beforehand:
>  	 */
>  	for_each_new_crtc_in_state(old_state, crtc, new_crtc_state, i)
> @@ -2197,7 +2197,7 @@ EXPORT_SYMBOL(drm_atomic_helper_wait_for_dependen=
cies);
>   * drm_atomic_helper_fake_vblank - fake VBLANK events if needed
>   * @old_state: atomic state object with old state structures
>   *
> - * This function walks all CRTCs and fake VBLANK events on those with
> + * This function walks all CRTCs and fakes VBLANK events on those with=


This fix could also go into patch 1.

>   * &drm_crtc_state.no_vblank set to true and &drm_crtc_state.event !=3D=
 NULL.
>   * The primary use of this function is writeback connectors working in=
 oneshot
>   * mode and faking VBLANK events. In this case they only fake the VBLA=
NK event
> @@ -2393,7 +2393,7 @@ static bool plane_crtc_active(const struct drm_pl=
ane_state *state)
>   * @flags: flags for committing plane state
>   *
>   * This function commits the new plane state using the plane and atomi=
c helper
> - * functions for planes and crtcs. It assumes that the atomic state ha=
s already
> + * functions for planes and CRTCs. It assumes that the atomic state ha=
s already
>   * been pushed into the relevant object state pointers, since this ste=
p can no
>   * longer fail.
>   *
> @@ -2514,15 +2514,15 @@ void drm_atomic_helper_commit_planes(struct drm=
_device *dev,
>  EXPORT_SYMBOL(drm_atomic_helper_commit_planes);
> =20
>  /**
> - * drm_atomic_helper_commit_planes_on_crtc - commit plane state for a =
crtc
> - * @old_crtc_state: atomic state object with the old crtc state
> + * drm_atomic_helper_commit_planes_on_crtc - commit plane state for a =
CRTC
> + * @old_crtc_state: atomic state object with the old CRTC state
>   *
>   * This function commits the new plane state using the plane and atomi=
c helper
> - * functions for planes on the specific crtc. It assumes that the atom=
ic state
> + * functions for planes on the specific CRTC. It assumes that the atom=
ic state
>   * has already been pushed into the relevant object state pointers, si=
nce this
>   * step can no longer fail.
>   *
> - * This function is useful when plane updates should be done crtc-by-c=
rtc
> + * This function is useful when plane updates should be done CRTC-by-C=
RTC
>   * instead of one global step like drm_atomic_helper_commit_planes() d=
oes.
>   *
>   * This function can only be savely used when planes are not allowed t=
o move
> @@ -2812,10 +2812,10 @@ EXPORT_SYMBOL(drm_atomic_helper_swap_state);
>   * @plane: plane object to update
>   * @crtc: owning CRTC of owning plane
>   * @fb: framebuffer to flip onto plane
> - * @crtc_x: x offset of primary plane on crtc
> - * @crtc_y: y offset of primary plane on crtc
> - * @crtc_w: width of primary plane rectangle on crtc
> - * @crtc_h: height of primary plane rectangle on crtc
> + * @crtc_x: x offset of primary plane on @crtc
> + * @crtc_y: y offset of primary plane on @crtc
> + * @crtc_w: width of primary plane rectangle on @crtc
> + * @crtc_h: height of primary plane rectangle on @crtc
>   * @src_x: x offset of @fb for panning
>   * @src_y: y offset of @fb for panning
>   * @src_w: width of source rectangle in @fb
> @@ -2921,7 +2921,7 @@ EXPORT_SYMBOL(drm_atomic_helper_disable_plane);
>   * @set: mode set configuration
>   * @ctx: lock acquisition context
>   *
> - * Provides a default crtc set_config handler using the atomic driver =
interface.
> + * Provides a default CRTC set_config handler using the atomic driver =
interface.
>   *
>   * NOTE: For backwards compatibility with old userspace this automatic=
ally
>   * resets the "link-status" property to GOOD, to force any link
> @@ -3334,7 +3334,7 @@ static int page_flip_common(struct drm_atomic_sta=
te *state,
> =20
>  /**
>   * drm_atomic_helper_page_flip - execute a legacy page flip
> - * @crtc: DRM crtc
> + * @crtc: DRM CRTC
>   * @fb: DRM framebuffer
>   * @event: optional DRM event to signal upon completion
>   * @flags: flip flags for non-vblank sync'ed updates
> @@ -3378,7 +3378,7 @@ EXPORT_SYMBOL(drm_atomic_helper_page_flip);
> =20
>  /**
>   * drm_atomic_helper_page_flip_target - do page flip on target vblank =
period.
> - * @crtc: DRM crtc
> + * @crtc: DRM CRTC
>   * @fb: DRM framebuffer
>   * @event: optional DRM event to signal upon completion
>   * @flags: flip flags for non-vblank sync'ed updates
> diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_at=
omic_uapi.c
> index 0d466d3b0809..a1e5e262bae2 100644
> --- a/drivers/gpu/drm/drm_atomic_uapi.c
> +++ b/drivers/gpu/drm/drm_atomic_uapi.c
> @@ -160,12 +160,12 @@ int drm_atomic_set_mode_prop_for_crtc(struct drm_=
crtc_state *state,
>  EXPORT_SYMBOL(drm_atomic_set_mode_prop_for_crtc);
> =20
>  /**
> - * drm_atomic_set_crtc_for_plane - set crtc for plane
> + * drm_atomic_set_crtc_for_plane - set CRTC for plane
>   * @plane_state: the plane whose incoming state to update
> - * @crtc: crtc to use for the plane
> + * @crtc: CRTC to use for the plane
>   *
> - * Changing the assigned crtc for a plane requires us to grab the lock=
 and state
> - * for the new crtc, as needed. This function takes care of all these =
details
> + * Changing the assigned CRTC for a plane requires us to grab the lock=
 and state
> + * for the new CRTC, as needed. This function takes care of all these =
details
>   * besides updating the pointer in the state object itself.
>   *
>   * Returns:
> @@ -279,12 +279,12 @@ drm_atomic_set_fence_for_plane(struct drm_plane_s=
tate *plane_state,
>  EXPORT_SYMBOL(drm_atomic_set_fence_for_plane);
> =20
>  /**
> - * drm_atomic_set_crtc_for_connector - set crtc for connector
> + * drm_atomic_set_crtc_for_connector - set CRTC for connector
>   * @conn_state: atomic state object for the connector
> - * @crtc: crtc to use for the connector
> + * @crtc: CRTC to use for the connector
>   *
> - * Changing the assigned crtc for a connector requires us to grab the =
lock and
> - * state for the new crtc, as needed. This function takes care of all =
these
> + * Changing the assigned CRTC for a connector requires us to grab the =
lock and
> + * state for the new CRTC, as needed. This function takes care of all =
these
>   * details besides updating the pointer in the state object itself.
>   *
>   * Returns:
> diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
> index 1c10e0d667e6..e43f9e0a9964 100644
> --- a/include/drm/drm_atomic.h
> +++ b/include/drm/drm_atomic.h
> @@ -363,7 +363,7 @@ struct drm_atomic_state {
>  	 * When a connector or plane is not bound to any CRTC, it's still imp=
ortant
>  	 * to preserve linearity to prevent the atomic states from being free=
d to early.
>  	 *
> -	 * This commit (if set) is not bound to any crtc, but will be complet=
ed when
> +	 * This commit (if set) is not bound to any CRTC, but will be complet=
ed when
>  	 * drm_atomic_helper_commit_hw_done() is called.
>  	 */
>  	struct drm_crtc_commit *fake_commit;
> @@ -476,12 +476,12 @@ drm_atomic_get_new_connector_for_encoder(struct d=
rm_atomic_state *state,
>  					 struct drm_encoder *encoder);
> =20
>  /**
> - * drm_atomic_get_existing_crtc_state - get crtc state, if it exists
> + * drm_atomic_get_existing_crtc_state - get CRTC state, if it exists
>   * @state: global atomic state object
> - * @crtc: crtc to grab
> + * @crtc: CRTC to grab
>   *
> - * This function returns the crtc state for the given crtc, or NULL
> - * if the crtc is not part of the global atomic state.
> + * This function returns the CRTC state for the given CRTC, or NULL
> + * if the CRTC is not part of the global atomic state.
>   *
>   * This function is deprecated, @drm_atomic_get_old_crtc_state or
>   * @drm_atomic_get_new_crtc_state should be used instead.
> @@ -494,12 +494,12 @@ drm_atomic_get_existing_crtc_state(struct drm_ato=
mic_state *state,
>  }
> =20
>  /**
> - * drm_atomic_get_old_crtc_state - get old crtc state, if it exists
> + * drm_atomic_get_old_crtc_state - get old CRTC state, if it exists
>   * @state: global atomic state object
> - * @crtc: crtc to grab
> + * @crtc: CRTC to grab
>   *
> - * This function returns the old crtc state for the given crtc, or
> - * NULL if the crtc is not part of the global atomic state.
> + * This function returns the old CRTC state for the given CRTC, or
> + * NULL if the CRTC is not part of the global atomic state.
>   */
>  static inline struct drm_crtc_state *
>  drm_atomic_get_old_crtc_state(struct drm_atomic_state *state,
> @@ -508,12 +508,12 @@ drm_atomic_get_old_crtc_state(struct drm_atomic_s=
tate *state,
>  	return state->crtcs[drm_crtc_index(crtc)].old_state;
>  }
>  /**
> - * drm_atomic_get_new_crtc_state - get new crtc state, if it exists
> + * drm_atomic_get_new_crtc_state - get new CRTC state, if it exists
>   * @state: global atomic state object
> - * @crtc: crtc to grab
> + * @crtc: CRTC to grab
>   *
> - * This function returns the new crtc state for the given crtc, or
> - * NULL if the crtc is not part of the global atomic state.
> + * This function returns the new CRTC state for the given CRTC, or
> + * NULL if the CRTC is not part of the global atomic state.
>   */
>  static inline struct drm_crtc_state *
>  drm_atomic_get_new_crtc_state(struct drm_atomic_state *state,
> @@ -967,11 +967,11 @@ drm_atomic_crtc_needs_modeset(const struct drm_cr=
tc_state *state)
>  }
> =20
>  /**
> - * drm_atomic_crtc_effectively_active - compute whether crtc is actual=
ly active
> + * drm_atomic_crtc_effectively_active - compute whether CRTC is actual=
ly active
>   * @state: &drm_crtc_state for the CRTC
>   *
>   * When in self refresh mode, the crtc_state->active value will be fal=
se, since
> - * the crtc is off. However in some cases we're interested in whether =
the crtc
> + * the CRTC is off. However in some cases we're interested in whether =
the CRTC
>   * is active, or effectively active (ie: it's connected to an active d=
isplay).
>   * In these cases, use this function instead of just checking active.
>   */
> diff --git a/include/drm/drm_atomic_helper.h b/include/drm/drm_atomic_h=
elper.h
> index bf4e07141d81..9db3cac48f4f 100644
> --- a/include/drm/drm_atomic_helper.h
> +++ b/include/drm/drm_atomic_helper.h
> @@ -152,7 +152,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_c=
rtc *crtc,
>  /**
>   * drm_atomic_crtc_for_each_plane - iterate over planes currently atta=
ched to CRTC
>   * @plane: the loop cursor
> - * @crtc:  the crtc whose planes are iterated
> + * @crtc:  the CRTC whose planes are iterated
>   *
>   * This iterates over the current state, useful (for example) when app=
lying
>   * atomic state after it has been checked and swapped.  To iterate ove=
r the
> @@ -166,7 +166,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_c=
rtc *crtc,
>  /**
>   * drm_crtc_atomic_state_for_each_plane - iterate over attached planes=
 in new state
>   * @plane: the loop cursor
> - * @crtc_state: the incoming crtc-state
> + * @crtc_state: the incoming CRTC state
>   *
>   * Similar to drm_crtc_for_each_plane(), but iterates the planes that =
will be
>   * attached if the specified state is applied.  Useful during for exam=
ple
> @@ -180,7 +180,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_c=
rtc *crtc,
>   * drm_crtc_atomic_state_for_each_plane_state - iterate over attached =
planes in new state
>   * @plane: the loop cursor
>   * @plane_state: loop cursor for the plane's state, must be const
> - * @crtc_state: the incoming crtc-state
> + * @crtc_state: the incoming CRTC state
>   *
>   * Similar to drm_crtc_for_each_plane(), but iterates the planes that =
will be
>   * attached if the specified state is applied.  Useful during for exam=
ple
> @@ -189,7 +189,7 @@ int drm_atomic_helper_legacy_gamma_set(struct drm_c=
rtc *crtc,
>   *
>   * Compared to just drm_atomic_crtc_state_for_each_plane() this also f=
ills in a
>   * const plane_state. This is useful when a driver just wants to peek =
at other
> - * active planes on this crtc, but does not need to change it.
> + * active planes on this CRTC, but does not need to change it.
>   */
>  #define drm_atomic_crtc_state_for_each_plane_state(plane, plane_state,=
 crtc_state) \
>  	drm_for_each_plane_mask(plane, (crtc_state)->state->dev, (crtc_state)=
->plane_mask) \
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--vlqk0KOqVRaZLnZ45ul53BhxOatLwBnXz--

--0jRffai8DLrYZ6AfLg6tbCNmYG93LIsHU
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3pOH8ACgkQaA3BHVML
eiNBCgf/cvPXB9koAhvZCRwJ8IaXjiXsyV/vrJ8iQAYBPMW7MDqT3n13m5UVon4c
TW7QY9dxiPhCBwHUp5o071d7gXocJP4bBTrONj/qwAc2M66ARy2Btvp48bQIbrOZ
cNIafa4U3BK3YNQ63rFUngBTueRLtBx3VZjR83btu1A3Hib83sdNflScPRuZ6wTk
JZzsosnxoI+fosPiBUEvst2XeRQl/uO1Yu1XvOVZJP23qwWe+KwR+O3YcEXFRzVr
nqkGaYiAwcZee9xNnhUhQEQFPJBPX9VymqKR3GhWT1EQlgJ27T0HQfOG3ZL3pgAD
P9L2Sn5Sc2Zcw6vw63KSMii8+Mkg7w==
=UdHN
-----END PGP SIGNATURE-----

--0jRffai8DLrYZ6AfLg6tbCNmYG93LIsHU--

--===============0544132790==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZHJpLWRldmVs
IG1haWxpbmcgbGlzdApkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZHJpLWRldmVs

--===============0544132790==--
