Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76D8D13D616
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2020 09:45:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 454276EC42;
	Thu, 16 Jan 2020 08:45:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C02B86EC41;
 Thu, 16 Jan 2020 08:45:02 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id CB4F0AD7F;
 Thu, 16 Jan 2020 08:45:00 +0000 (UTC)
Subject: Re: [Intel-gfx] [PATCH v2 03/21] drm: Add get_vblank_timestamp() to
 struct drm_crtc_funcs
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-4-tzimmermann@suse.de>
 <20200115144938.GA13686@intel.com>
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
Message-ID: <5ce4974a-8a56-3827-f4a0-b5f74979ef4e@suse.de>
Date: Thu, 16 Jan 2020 09:44:55 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200115144938.GA13686@intel.com>
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thellstrom@vmware.com, sean@poorly.run,
 amd-gfx@lists.freedesktop.org, linux-graphics-maintainer@vmware.com,
 bskeggs@redhat.com, alexandre.torgue@st.com, sunpeng.li@amd.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com, vincent.abriou@st.com, rodrigosiqueiramelo@gmail.com,
 philippe.cornu@st.com, yannick.fertre@st.com, mcoquelin.stm32@gmail.com,
 alexander.deucher@amd.com, freedreno@lists.freedesktop.org,
 christian.koenig@amd.com
Content-Type: multipart/mixed; boundary="===============1807648305=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1807648305==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="KCvli6SNC6J4a680XFP26BkX9XmqiTGtT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--KCvli6SNC6J4a680XFP26BkX9XmqiTGtT
Content-Type: multipart/mixed; boundary="9ZgLiP5Ex5EzthhWgxh4JocUWA7qAU4W6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 alexandre.torgue@st.com, thellstrom@vmware.com, sean@poorly.run,
 linux-graphics-maintainer@vmware.com, bskeggs@redhat.com,
 mcoquelin.stm32@gmail.com, sunpeng.li@amd.com,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 rodrigo.vivi@intel.com, vincent.abriou@st.com,
 rodrigosiqueiramelo@gmail.com, philippe.cornu@st.com, yannick.fertre@st.com,
 alexander.deucher@amd.com, freedreno@lists.freedesktop.org,
 christian.koenig@amd.com
Message-ID: <5ce4974a-8a56-3827-f4a0-b5f74979ef4e@suse.de>
Subject: Re: [Intel-gfx] [PATCH v2 03/21] drm: Add get_vblank_timestamp() to
 struct drm_crtc_funcs
References: <20200115121652.7050-1-tzimmermann@suse.de>
 <20200115121652.7050-4-tzimmermann@suse.de>
 <20200115144938.GA13686@intel.com>
In-Reply-To: <20200115144938.GA13686@intel.com>

--9ZgLiP5Ex5EzthhWgxh4JocUWA7qAU4W6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.01.20 um 15:49 schrieb Ville Syrj=C3=A4l=C3=A4:
> On Wed, Jan 15, 2020 at 01:16:34PM +0100, Thomas Zimmermann wrote:
>> The callback get_vblank_timestamp() is currently located in struct
>> drm_driver, but really belongs into struct drm_crtc_funcs. Add an
>> equivalent there. Driver will be converted in separate patches.
>>
>> The default implementation is drm_calc_vbltimestamp_from_scanoutpos().=

>> The patch adds drm_crtc_vblank_helper_get_vblank_timestamp(), which is=

>> an implementation for the CRTC callback.
>>
>> v2:
>> 	* rename helper to drm_crtc_vblank_helper_get_vblank_timestamp()
>> 	* replace drm_calc_vbltimestamp_from_scanoutpos() with
>> 	  drm_crtc_vblank_helper_get_vblank_timestamp() in docs
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_vblank.c             | 236 +++++++++++++++++++++-=
-
>>  include/drm/drm_crtc.h                   |  46 ++++-
>>  include/drm/drm_modeset_helper_vtables.h |   4 +-
>>  include/drm/drm_vblank.h                 |  26 ++-
>>  4 files changed, 292 insertions(+), 20 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index abb085c67d82..1b7af316e6a5 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -333,7 +333,9 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc=
 *crtc)
>>  	u64 vblank;
>>  	unsigned long flags;
>> =20
>> -	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) && !dev->driver->get_vblank_=
timestamp,
>> +	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) &&
>> +		  !crtc->funcs->get_vblank_timestamp &&
>> +		  !dev->driver->get_vblank_timestamp,
>>  		  "This function requires support for accurate vblank timestamps.")=
;
>> =20
>>  	spin_lock_irqsave(&dev->vblank_time_lock, flags);
>> @@ -511,9 +513,9 @@ EXPORT_SYMBOL(drm_crtc_vblank_waitqueue);
>>   *
>>   * Calculate and store various constants which are later needed by vb=
lank and
>>   * swap-completion timestamping, e.g, by
>> - * drm_calc_vbltimestamp_from_scanoutpos(). They are derived from CRT=
C's true
>> - * scanout timing, so they take things like panel scaling or other ad=
justments
>> - * into account.
>> + * drm_crtc_vblank_helper_get_vblank_timestamp(). They are derived fr=
om
>> + * CRTC's true scanout timing, so they take things like panel scaling=
 or
>> + * other adjustments into account.
>>   */
>>  void drm_calc_timestamping_constants(struct drm_crtc *crtc,
>>  				     const struct drm_display_mode *mode)
>> @@ -577,8 +579,9 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
>>   *
>>   * Implements calculation of exact vblank timestamps from given drm_d=
isplay_mode
>>   * timings and current video scanout position of a CRTC. This can be =
directly
>> - * used as the &drm_driver.get_vblank_timestamp implementation of a k=
ms driver
>> - * if &drm_crtc_helper_funcs.get_scanout_position is implemented.
>> + * used as the &drm_crtc_funcs.get_vblank_timestamp implementation of=
 a kms
>> + * driver if &drm_crtc_helper_funcs.get_scanout_position or
>> + * &drm_driver.get_scanout_position is implemented.
>>   *
>>   * The current implementation only handles standard video modes. For =
double scan
>>   * and interlaced modes the driver is supposed to adjust the hardware=
 mode
>> @@ -742,15 +745,22 @@ static bool
>>  drm_get_last_vbltimestamp(struct drm_device *dev, unsigned int pipe,
>>  			  ktime_t *tvblank, bool in_vblank_irq)
>>  {
>> +	struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
>>  	bool ret =3D false;
>> =20
>>  	/* Define requested maximum error on timestamps (nanoseconds). */
>>  	int max_error =3D (int) drm_timestamp_precision * 1000;
>> =20
>>  	/* Query driver if possible and precision timestamping enabled. */
>> -	if (dev->driver->get_vblank_timestamp && (max_error > 0))
>> +	if (crtc->funcs->get_vblank_timestamp && (max_error > 0)) {
>=20
> Could drop the superfluous parens while at it.
>=20
> Are all drivers utilizing this guaranteed to have the crtc here?

Good point. This is part of the suspend and resume code. I don't think
it's possible to run this code without creating a CRTC.

But it's also called from drm_legacy_vblank_post_modeset(), which does
not have CRTCs. Legacy drivers don't implement get_vblank_timestamp() at
all. I think we can skip this entire block for legacy drivers.

>=20
>> +		struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
>> +
>> +		ret =3D crtc->funcs->get_vblank_timestamp(crtc, &max_error,
>> +							tvblank, in_vblank_irq);
>> +	} else if (dev->driver->get_vblank_timestamp && (max_error > 0)) {
>>  		ret =3D dev->driver->get_vblank_timestamp(dev, pipe, &max_error,
>>  							tvblank, in_vblank_irq);
>> +	}
>> =20
>>  	/* GPU high precision timestamp query unsupported or failed.
>>  	 * Return current monotonic/gettimeofday timestamp as best estimate.=

>> @@ -1059,11 +1069,19 @@ EXPORT_SYMBOL(drm_crtc_vblank_get);
>> =20
>>  static bool __vblank_disable_immediate(struct drm_device *dev, unsign=
ed int pipe)
>>  {
>> +	struct drm_crtc *crtc;
>> +
>>  	if (!dev->vblank_disable_immediate)
>>  		return false;
>> -	if (!dev->driver->get_vblank_timestamp)
>> -		return false;
>> -	return true;
>> +
>> +	crtc =3D drm_crtc_from_index(dev, pipe);
>> +	if (crtc && crtc->funcs->get_vblank_timestamp)
>=20
> Here you are expecting that the crtc might be NULL.

Because of legacy drivers.

>=20
>> +		return true;
>> +
>> +	if (dev->driver->get_vblank_timestamp)
>> +		return true;
>> +
>> +	return false;
>>  }
>> =20
>>  static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)=

>> @@ -1742,9 +1760,11 @@ int drm_wait_vblank_ioctl(struct drm_device *de=
v, void *data,
>> =20
>>  static void drm_handle_vblank_events(struct drm_device *dev, unsigned=
 int pipe)
>>  {
>> +	struct drm_crtc *crtc =3D drm_crtc_from_index(dev, pipe);
>>  	struct drm_pending_vblank_event *e, *t;
>>  	ktime_t now;
>>  	u64 seq;
>> +	bool high_prec;
>> =20
>>  	assert_spin_locked(&dev->event_lock);
>> =20
>> @@ -1764,8 +1784,10 @@ static void drm_handle_vblank_events(struct drm=
_device *dev, unsigned int pipe)
>>  		send_vblank_event(dev, e, seq, now);
>>  	}
>> =20
>> -	trace_drm_vblank_event(pipe, seq, now,
>> -			dev->driver->get_vblank_timestamp !=3D NULL);
>> +	high_prec =3D crtc->funcs->get_vblank_timestamp ||
>> +		    dev->driver->get_vblank_timestamp;
>=20
> Here again assuming the crtc can't be NULL.

There should probably be a check to handle legacy devices correctly.

>=20
>> +
>> +	trace_drm_vblank_event(pipe, seq, now, high_prec);
>>  }
>> =20
>>  /**
>> @@ -2020,3 +2042,193 @@ int drm_crtc_queue_sequence_ioctl(struct drm_d=
evice *dev, void *data,
>>  	kfree(e);
>>  	return ret;
>>  }
>> +
>> +/*
>> + * Helpers for struct drm_crtc_funcs
>> + */
>> +
>> +/**
>> + * drm_crtc_vblank_helper_get_vblank_timestamp_internal - precise vbl=
ank
>> + *                                                        timestamp h=
elper
>> + * @dev: DRM device
>> + * @pipe: index of CRTC whose vblank timestamp to retrieve
>> + * @max_error: Desired maximum allowable error in timestamps (nanosec=
s)
>> + *             On return contains true maximum error of timestamp
>> + * @vblank_time: Pointer to time which should receive the timestamp
>> + * @in_vblank_irq:
>> + *     True when called from drm_crtc_handle_vblank().  Some drivers
>> + *     need to apply some workarounds for gpu-specific vblank irq qui=
rks
>> + *     if flag is set.
>> + * @get_scanout_position:
>> + *     Callback function to retrieve the scanout position. See
>> + *     @struct drm_crtc_helper_funcs.get_scanout_position.
>> + *
>> + * Implements calculation of exact vblank timestamps from given drm_d=
isplay_mode
>> + * timings and current video scanout position of a CRTC.
>> + *
>> + * The current implementation only handles standard video modes. For =
double scan
>> + * and interlaced modes the driver is supposed to adjust the hardware=
 mode
>> + * (taken from &drm_crtc_state.adjusted mode for atomic modeset drive=
rs) to
>> + * match the scanout position reported.
>> + *
>> + * Note that atomic drivers must call drm_calc_timestamping_constants=
() before
>> + * enabling a CRTC. The atomic helpers already take care of that in
>> + * drm_atomic_helper_update_legacy_modeset_state().
>> + *
>> + * Returns:
>> + *
>> + * Returns true on success, and false on failure, i.e. when no accura=
te
>> + * timestamp could be acquired.
>> + */
>> +bool
>> +drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>> +	struct drm_crtc *crtc, int *max_error, ktime_t *vblank_time,
>> +	bool in_vblank_irq,
>> +	bool (*get_scanout_position)(struct drm_crtc *crtc,
>> +                                     bool in_vblank_irq, int *vpos, i=
nt *hpos,
>> +                                     ktime_t *stime, ktime_t *etime,
>> +                                     const struct drm_display_mode *m=
ode))
>> +{
>> +	struct drm_device *dev =3D crtc->dev;
>> +	unsigned int pipe =3D crtc->index;
>> +	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
>> +	struct timespec64 ts_etime, ts_vblank_time;
>> +	ktime_t stime, etime;
>> +	bool vbl_status;
>> +	const struct drm_display_mode *mode;
>> +	int vpos, hpos, i;
>> +	int delta_ns, duration_ns;
>> +
>> +	if (pipe >=3D dev->num_crtcs) {
>> +		DRM_ERROR("Invalid crtc %u\n", pipe);
>> +		return false;
>> +	}
>> +
>> +	/* Scanout position query not supported? Should not happen. */
>> +	if (!get_scanout_position) {
>> +		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
>> +		return false;
>> +	}
>> +
>> +	if (drm_drv_uses_atomic_modeset(dev))
>> +		mode =3D &vblank->hwmode;
>> +	else
>> +		mode =3D &crtc->hwmode;
>> +
>> +	/* If mode timing undefined, just return as no-op:
>> +	 * Happens during initial modesetting of a crtc.
>> +	 */
>> +	if (mode->crtc_clock =3D=3D 0) {
>> +		DRM_DEBUG("crtc %u: Noop due to uninitialized mode.\n", pipe);
>> +		WARN_ON_ONCE(drm_drv_uses_atomic_modeset(dev));
>> +		return false;
>> +	}
>> +
>> +	/* Get current scanout position with system timestamp.
>> +	 * Repeat query up to DRM_TIMESTAMP_MAXRETRIES times
>> +	 * if single query takes longer than max_error nanoseconds.
>> +	 *
>> +	 * This guarantees a tight bound on maximum error if
>> +	 * code gets preempted or delayed for some reason.
>> +	 */
>> +	for (i =3D 0; i < DRM_TIMESTAMP_MAXRETRIES; i++) {
>> +		/*
>> +		 * Get vertical and horizontal scanout position vpos, hpos,
>> +		 * and bounding timestamps stime, etime, pre/post query.
>> +		 */
>> +		vbl_status =3D get_scanout_position(crtc, in_vblank_irq, &vpos,
>> +						  &hpos, &stime, &etime, mode);
>> +
>> +		/* Return as no-op if scanout query unsupported or failed. */
>> +		if (!vbl_status) {
>> +			DRM_DEBUG("crtc %u : scanoutpos query failed.\n",
>> +				  pipe);
>> +			return false;
>> +		}
>> +
>> +		/* Compute uncertainty in timestamp of scanout position query. */
>> +		duration_ns =3D ktime_to_ns(etime) - ktime_to_ns(stime);
>> +
>> +		/* Accept result with <  max_error nsecs timing uncertainty. */
>> +		if (duration_ns <=3D *max_error)
>> +			break;
>> +	}
>> +
>> +	/* Noisy system timing? */
>> +	if (i =3D=3D DRM_TIMESTAMP_MAXRETRIES) {
>> +		DRM_DEBUG("crtc %u: Noisy timestamp %d us > %d us [%d reps].\n",
>> +			  pipe, duration_ns/1000, *max_error/1000, i);
>> +	}
>> +
>> +	/* Return upper bound of timestamp precision error. */
>> +	*max_error =3D duration_ns;
>> +
>> +	/* Convert scanout position into elapsed time at raw_time query
>> +	 * since start of scanout at first display scanline. delta_ns
>> +	 * can be negative if start of scanout hasn't happened yet.
>> +	 */
>> +	delta_ns =3D div_s64(1000000LL * (vpos * mode->crtc_htotal + hpos),
>> +			   mode->crtc_clock);
>> +
>> +	/* Subtract time delta from raw timestamp to get final
>> +	 * vblank_time timestamp for end of vblank.
>> +	 */
>> +	*vblank_time =3D ktime_sub_ns(etime, delta_ns);
>> +
>> +	if (!drm_debug_enabled(DRM_UT_VBL))
>> +		return true;
>> +
>> +	ts_etime =3D ktime_to_timespec64(etime);
>> +	ts_vblank_time =3D ktime_to_timespec64(*vblank_time);
>> +
>> +	DRM_DEBUG_VBL("crtc %u : v p(%d,%d)@ %lld.%06ld -> %lld.%06ld [e %d =
us, %d rep]\n",
>> +		      pipe, hpos, vpos,
>> +		      (u64)ts_etime.tv_sec, ts_etime.tv_nsec / 1000,
>> +		      (u64)ts_vblank_time.tv_sec, ts_vblank_time.tv_nsec / 1000,
>> +		      duration_ns / 1000, i);
>> +
>> +	return true;
>> +}
>> +EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp_internal);
>=20
> This looks like copy paste from the current thing. Why are you=20
> duplicating the entire function instead of refactoring what
> we already have?

It is copied with a small difference.

The original function is drm_calc_vbltimestamp_from_scanoutpos(). It
uses either drm_driver.get_scanout_position() or
drm_crtc_helper_funcs.get_scanout_position(). The former receives device
pointer and pipe index, the latter receives a pointer to a crtc. (see
patch 1)

This function, drm_crtc_vblank_helper_get_vblank_timestamp_internal(),
receives a get_scanout_position() as its argument with the same
signature as drm_crtc_helper_funcs.get_scanout_position().

The function is exported, so that i915 can use the algorithm and provide
it's own implementation of get_scanout_position(). i915 does not use
CRTC helpers, and therefore cannot set get_scanout_position() there.

Patch 21, when all drivers have been converted to use the CRTC
interface, removes drm_calc_vbltimestamp_from_scanoutpos() entirely.
It's only kept around for transitionng the driver over to the new interfa=
ce.

>=20
>> +
>> +/**
>> + * drm_crtc_vblank_helper_get_vblank_timestamp - precise vblank times=
tamp
>> + *                                               helper
>> + * @crtc: CRTC whose vblank timestamp to retrieve
>> + * @max_error: Desired maximum allowable error in timestamps (nanosec=
s)
>> + *             On return contains true maximum error of timestamp
>> + * @vblank_time: Pointer to time which should receive the timestamp
>> + * @in_vblank_irq:
>> + *     True when called from drm_crtc_handle_vblank().  Some drivers
>> + *     need to apply some workarounds for gpu-specific vblank irq qui=
rks
>> + *     if flag is set.
>> + *
>> + * Implements calculation of exact vblank timestamps from given drm_d=
isplay_mode
>> + * timings and current video scanout position of a CRTC. This can be =
directly
>> + * used as the &drm_crtc_funcs.get_vblank_timestamp implementation of=
 a kms
>> + * driver if &drm_crtc_helper_funcs.get_scanout_position is implement=
ed.
>> + *
>> + * The current implementation only handles standard video modes. For =
double scan
>> + * and interlaced modes the driver is supposed to adjust the hardware=
 mode
>> + * (taken from &drm_crtc_state.adjusted mode for atomic modeset drive=
rs) to
>> + * match the scanout position reported.
>> + *
>> + * Note that atomic drivers must call drm_calc_timestamping_constants=
() before
>> + * enabling a CRTC. The atomic helpers already take care of that in
>> + * drm_atomic_helper_update_legacy_modeset_state().
>> + *
>> + * Returns:
>> + *
>> + * Returns true on success, and false on failure, i.e. when no accura=
te
>> + * timestamp could be acquired.
>> + */
>> +bool drm_crtc_vblank_helper_get_vblank_timestamp(struct drm_crtc *crt=
c,
>> +						 int *max_error,
>> +						 ktime_t *vblank_time,
>> +						 bool in_vblank_irq)
>> +{
>> +	return drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>> +		crtc, max_error, vblank_time, in_vblank_irq,
>> +		crtc->helper_private->get_scanout_position);
>> +}
>> +EXPORT_SYMBOL(drm_crtc_vblank_helper_get_vblank_timestamp);
>> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
>> index 5e9b15a0e8c5..db46abbbf4e7 100644
>> --- a/include/drm/drm_crtc.h
>> +++ b/include/drm/drm_crtc.h
>> @@ -867,6 +867,47 @@ struct drm_crtc_funcs {
>>  	 * new drivers as the replacement of &drm_driver.disable_vblank hook=
=2E
>>  	 */
>>  	void (*disable_vblank)(struct drm_crtc *crtc);
>> +
>> +	/**
>> +	 * @get_vblank_timestamp:
>> +	 *
>> +	 * Called by drm_get_last_vbltimestamp(). Should return a precise
>> +	 * timestamp when the most recent vblank interval ended or will end.=

>> +	 *
>> +	 * Specifically, the timestamp in @vblank_time should correspond as
>> +	 * closely as possible to the time when the first video scanline of
>> +	 * the video frame after the end of vblank will start scanning out,
>> +	 * the time immediately after end of the vblank interval. If the
>> +	 * @crtc is currently inside vblank, this will be a time in the futu=
re.
>> +	 * If the @crtc is currently scanning out a frame, this will be the
>> +	 * past start time of the current scanout. This is meant to adhere
>> +	 * to the OpenML OML_sync_control extension specification.
>> +	 *
>> +	 * Parameters:
>> +	 *
>> +	 * crtc:
>> +	 *     CRTC for which timestamp should be returned.
>> +	 * max_error:
>> +	 *     Maximum allowable timestamp error in nanoseconds.
>> +	 *     Implementation should strive to provide timestamp
>> +	 *     with an error of at most max_error nanoseconds.
>> +	 *     Returns true upper bound on error for timestamp.
>> +	 * vblank_time:
>> +	 *     Target location for returned vblank timestamp.
>> +	 * in_vblank_irq:
>> +	 *     True when called from drm_crtc_handle_vblank().  Some drivers=

>> +	 *     need to apply some workarounds for gpu-specific vblank irq qu=
irks
>> +	 *     if flag is set.
>> +	 *
>> +	 * Returns:
>> +	 *
>> +	 * True on success, false on failure, which means the core should
>> +	 * fallback to a simple timestamp taken in drm_crtc_handle_vblank().=

>> +	 */
>> +	bool (*get_vblank_timestamp)(struct drm_crtc *crtc,
>> +				     int *max_error,
>> +				     ktime_t *vblank_time,
>> +				     bool in_vblank_irq);
>>  };
>> =20
>>  /**
>> @@ -974,11 +1015,12 @@ struct drm_crtc {
>>  	 * Programmed mode in hw, after adjustments for encoders, crtc, pane=
l
>>  	 * scaling etc. Should only be used by legacy drivers, for high
>>  	 * precision vblank timestamps in
>> -	 * drm_calc_vbltimestamp_from_scanoutpos().
>> +	 * drm_crtc_vblank_helper_get_vblank_timestamp().
>>  	 *
>>  	 * Note that atomic drivers should not use this, but instead use
>>  	 * &drm_crtc_state.adjusted_mode. And for high-precision timestamps
>> -	 * drm_calc_vbltimestamp_from_scanoutpos() used &drm_vblank_crtc.hwm=
ode,
>> +	 * drm_crtc_vblank_helper_get_vblank_timestamp() used
>> +	 * &drm_vblank_crtc.hwmode,
>>  	 * which is filled out by calling drm_calc_timestamping_constants().=

>>  	 */
>>  	struct drm_display_mode hwmode;
>> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/dr=
m_modeset_helper_vtables.h
>> index e398512bfd5f..0afaf58da40d 100644
>> --- a/include/drm/drm_modeset_helper_vtables.h
>> +++ b/include/drm/drm_modeset_helper_vtables.h
>> @@ -459,8 +459,8 @@ struct drm_crtc_helper_funcs {
>>  	 * Returns the current display scanout position from a CRTC and an
>>  	 * optional accurate ktime_get() timestamp of when the position was
>>  	 * measured. Note that this is a helper callback which is only used
>> -	 * if a driver uses drm_calc_vbltimestamp_from_scanoutpos() for the
>> -	 * @drm_driver.get_vblank_timestamp callback.
>> +	 * if a driver uses drm_crtc_vblank_helper_get_vblank_timestamp()
>> +	 * for the @drm_crtc_funcs.get_vblank_timestamp callback.
>>  	 *
>>  	 * Parameters:
>>  	 *
>> diff --git a/include/drm/drm_vblank.h b/include/drm/drm_vblank.h
>> index c16c44052b3d..248fbd5de177 100644
>> --- a/include/drm/drm_vblank.h
>> +++ b/include/drm/drm_vblank.h
>> @@ -174,13 +174,13 @@ struct drm_vblank_crtc {
>>  	unsigned int pipe;
>>  	/**
>>  	 * @framedur_ns: Frame/Field duration in ns, used by
>> -	 * drm_calc_vbltimestamp_from_scanoutpos() and computed by
>> +	 * drm_crtc_vblank_helper_get_vblank_timestamp() and computed by
>>  	 * drm_calc_timestamping_constants().
>>  	 */
>>  	int framedur_ns;
>>  	/**
>>  	 * @linedur_ns: Line duration in ns, used by
>> -	 * drm_calc_vbltimestamp_from_scanoutpos() and computed by
>> +	 * drm_crtc_vblank_helper_get_vblank_timestamp() and computed by
>>  	 * drm_calc_timestamping_constants().
>>  	 */
>>  	int linedur_ns;
>> @@ -190,8 +190,8 @@ struct drm_vblank_crtc {
>>  	 *
>>  	 * Cache of the current hardware display mode. Only valid when @enab=
led
>>  	 * is set. This is used by helpers like
>> -	 * drm_calc_vbltimestamp_from_scanoutpos(). We can't just access the=

>> -	 * hardware mode by e.g. looking at &drm_crtc_state.adjusted_mode,
>> +	 * drm_crtc_vblank_helper_get_vblank_timestamp(). We can't just acce=
ss
>> +	 * the hardware mode by e.g. looking at &drm_crtc_state.adjusted_mod=
e,
>>  	 * because that one is really hard to get from interrupt context.
>>  	 */
>>  	struct drm_display_mode hwmode;
>> @@ -238,4 +238,22 @@ void drm_calc_timestamping_constants(struct drm_c=
rtc *crtc,
>>  wait_queue_head_t *drm_crtc_vblank_waitqueue(struct drm_crtc *crtc);
>>  void drm_crtc_set_max_vblank_count(struct drm_crtc *crtc,
>>  				   u32 max_vblank_count);
>> +
>> +/*
>> + * Helpers for struct drm_crtc_funcs
>> + */
>> +
>> +bool
>> +drm_crtc_vblank_helper_get_vblank_timestamp_internal(
>> +	struct drm_crtc *crtc, int *max_error, ktime_t *vblank_time,
>> +	bool in_vblank_irq,
>> +	bool (*get_scanout_position)(struct drm_crtc *crtc,
>> +                                     bool in_vblank_irq, int *vpos, i=
nt *hpos,
>> +                                     ktime_t *stime, ktime_t *etime,
>> +                                     const struct drm_display_mode *m=
ode));
>=20
> Ugly alignment. Could maybe add a typedef for the function pointer if i=
t
> otherwise gets super horrible with proper alignment.

Email formatting might add to the ugliness here.

How would this be aligned properly?

I'm slightly reluctent to add a typedef for only this single function
and it's caller in i915. Typedefs are a form of code obfuscation IMHO.
But if that's the way to go, I won't mind of course.

Best regards
Thomas

>=20
>> +bool drm_crtc_vblank_helper_get_vblank_timestamp(struct drm_crtc *crt=
c,
>> +						 int *max_error,
>> +						 ktime_t *vblank_time,
>> +						 bool in_vblank_irq);
>> +
>>  #endif
>> --=20
>> 2.24.1
>>
>> _______________________________________________
>> Intel-gfx mailing list
>> Intel-gfx@lists.freedesktop.org
>> https://lists.freedesktop.org/mailman/listinfo/intel-gfx
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--9ZgLiP5Ex5EzthhWgxh4JocUWA7qAU4W6--

--KCvli6SNC6J4a680XFP26BkX9XmqiTGtT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4gIocACgkQaA3BHVML
eiNrxggAqpkW6CdD+Ox5LBuVO1RhA4Ka4ofuL5spLe/JBKqTLDOMGXWtAGLvnAni
Uo6RXCnZPADVE869bGsccbRCSMo9S+4ZnjKmSIVMUWvALGr7T8XgRK76MQJEwmxO
TOHlmU7WwxV71K1I1NV5MUASsNnmvC5EmUlyprng6U1SMQQ8kKIVZKQ/fW3smPhn
yvHju8leSSDfAzuzPQBv9zi10ZYCz/oy0CU4wIHh2N06GWMGQj7qxipOr1eTHnOp
iLmFS4xfYJbFQVQT5RsglR+pnGiSSMdQBDbCh3b2J2/wv8MlqNT8AmaIImYQY6R4
/iNLFl2I97NHTGp1fUHQ9RY11G4qFw==
=cSmF
-----END PGP SIGNATURE-----

--KCvli6SNC6J4a680XFP26BkX9XmqiTGtT--

--===============1807648305==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1807648305==--
