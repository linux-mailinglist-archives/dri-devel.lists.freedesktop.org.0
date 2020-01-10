Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 945FD136CB5
	for <lists+dri-devel@lfdr.de>; Fri, 10 Jan 2020 13:04:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C36289FD1;
	Fri, 10 Jan 2020 12:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 176FB89FD1;
 Fri, 10 Jan 2020 12:04:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 1133EADFF;
 Fri, 10 Jan 2020 12:04:18 +0000 (UTC)
Subject: Re: [PATCH 03/23] drm/i915: Don't use struct
 drm_driver.get_scanout_position()
To: Jani Nikula <jani.nikula@linux.intel.com>, airlied@linux.ie,
 daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com,
 patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run,
 benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com,
 philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-4-tzimmermann@suse.de> <87eew7o73u.fsf@intel.com>
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
Message-ID: <761ae94c-aaf1-9167-9c44-06824304fdfd@suse.de>
Date: Fri, 10 Jan 2020 13:04:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <87eew7o73u.fsf@intel.com>
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
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: multipart/mixed; boundary="===============1186626735=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1186626735==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="g0ySiYiVX9utuS5uln1yvyMTzIzQEdWXZ"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--g0ySiYiVX9utuS5uln1yvyMTzIzQEdWXZ
Content-Type: multipart/mixed; boundary="W0cGWnh782OoXLqtEz8FyBSMj6jTQys4k";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>, airlied@linux.ie,
 daniel@ffwll.ch, alexander.deucher@amd.com, christian.koenig@amd.com,
 David1.Zhou@amd.com, maarten.lankhorst@linux.intel.com,
 patrik.r.jakobsson@gmail.com, robdclark@gmail.com, sean@poorly.run,
 benjamin.gaignard@linaro.org, vincent.abriou@st.com, yannick.fertre@st.com,
 philippe.cornu@st.com, mcoquelin.stm32@gmail.com, alexandre.torgue@st.com,
 eric@anholt.net, rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 linux-graphics-maintainer@vmware.com, thellstrom@vmware.com,
 bskeggs@redhat.com, harry.wentland@amd.com, sunpeng.li@amd.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com
Cc: linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, freedreno@lists.freedesktop.org
Message-ID: <761ae94c-aaf1-9167-9c44-06824304fdfd@suse.de>
Subject: Re: [PATCH 03/23] drm/i915: Don't use struct
 drm_driver.get_scanout_position()
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-4-tzimmermann@suse.de> <87eew7o73u.fsf@intel.com>
In-Reply-To: <87eew7o73u.fsf@intel.com>

--W0cGWnh782OoXLqtEz8FyBSMj6jTQys4k
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 10.01.20 um 12:59 schrieb Jani Nikula:
> On Fri, 10 Jan 2020, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>> The callback struct drm_driver.get_scanout_position() is deprecated in=

>> favor of struct drm_crtc_helper_funcs.get_scanout_position().
>>
>> i915 doesn't use CRTC helpers. The patch duplicates the caller
>> drm_calc_vbltimestamp_from_scanoutpos() for i915, such that the callba=
ck
>> function is not needed.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/i915/i915_drv.c |   3 +-
>>  drivers/gpu/drm/i915/i915_irq.c | 117 ++++++++++++++++++++++++++++++-=
-
>>  drivers/gpu/drm/i915/i915_irq.h |   9 +--
>>  3 files changed, 119 insertions(+), 10 deletions(-)
>=20
> Not really enthusiastic about the diffstat in a "cleanup" series.

Well, the cleanup is about the content of drm_driver :)

>=20
> I wonder if you could add a generic helper version of
> drm_calc_vbltimestamp_from_scanoutpos where you pass the
> get_scanout_position function as a parameter. Both
> drm_calc_vbltimestamp_from_scanoutpos and the new
> i915_calc_vbltimestamp_from_scanoutpos would then be fairly thin
> wrappers passing in the relevant get_scanout_position function.

Of course. Will be in v2 of the series.

Best regards
Thomas

>=20
> This would reduce the almost identical duplication of the function in
> i915.
>=20
> BR,
> Jani.
>=20
>>
>> diff --git a/drivers/gpu/drm/i915/i915_drv.c b/drivers/gpu/drm/i915/i9=
15_drv.c
>> index f7385abdd74b..4a0a7fb85c53 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.c
>> +++ b/drivers/gpu/drm/i915/i915_drv.c
>> @@ -2769,8 +2769,7 @@ static struct drm_driver driver =3D {
>>  	.gem_prime_export =3D i915_gem_prime_export,
>>  	.gem_prime_import =3D i915_gem_prime_import,
>> =20
>> -	.get_vblank_timestamp =3D drm_calc_vbltimestamp_from_scanoutpos,
>> -	.get_scanout_position =3D i915_get_crtc_scanoutpos,
>> +	.get_vblank_timestamp =3D i915_calc_vbltimestamp_from_scanoutpos,
>> =20
>>  	.dumb_create =3D i915_gem_dumb_create,
>>  	.dumb_map_offset =3D i915_gem_dumb_mmap_offset,
>> diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i9=
15_irq.c
>> index afc6aad9bf8c..99d0c3b0feae 100644
>> --- a/drivers/gpu/drm/i915/i915_irq.c
>> +++ b/drivers/gpu/drm/i915/i915_irq.c
>> @@ -52,6 +52,11 @@
>>  #include "i915_trace.h"
>>  #include "intel_pm.h"
>> =20
>> +/* Retry timestamp calculation up to 3 times to satisfy
>> + * drm_timestamp_precision before giving up.
>> + */
>> +#define I915_TIMESTAMP_MAXRETRIES 3
>> +
>>  /**
>>   * DOC: interrupt handling
>>   *
>> @@ -762,10 +767,11 @@ static int __intel_get_crtc_scanline(struct inte=
l_crtc *crtc)
>>  	return (position + crtc->scanline_offset) % vtotal;
>>  }
>> =20
>> -bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int in=
dex,
>> -			      bool in_vblank_irq, int *vpos, int *hpos,
>> -			      ktime_t *stime, ktime_t *etime,
>> -			      const struct drm_display_mode *mode)
>> +static bool i915_get_crtc_scanoutpos(struct drm_device *dev,
>> +				     unsigned int index, bool in_vblank_irq,
>> +				     int *vpos, int *hpos,
>> +				     ktime_t *stime, ktime_t *etime,
>> +				     const struct drm_display_mode *mode)
>>  {
>>  	struct drm_i915_private *dev_priv =3D to_i915(dev);
>>  	struct intel_crtc *crtc =3D to_intel_crtc(drm_crtc_from_index(dev, i=
ndex));
>> @@ -879,6 +885,109 @@ bool i915_get_crtc_scanoutpos(struct drm_device =
*dev, unsigned int index,
>>  	return true;
>>  }
>> =20
>> +bool i915_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
>> +					    unsigned int pipe,
>> +					    int *max_error,
>> +					    ktime_t *vblank_time,
>> +					    bool in_vblank_irq)
>> +{
>> +	struct timespec64 ts_etime, ts_vblank_time;
>> +	ktime_t stime, etime;
>> +	bool vbl_status;
>> +	struct drm_crtc *crtc;
>> +	const struct drm_display_mode *mode;
>> +	struct drm_vblank_crtc *vblank =3D &dev->vblank[pipe];
>> +	int vpos, hpos, i;
>> +	int delta_ns, duration_ns;
>> +
>> +	crtc =3D drm_crtc_from_index(dev, pipe);
>> +
>> +	if (pipe >=3D dev->num_crtcs || !crtc) {
>> +		DRM_ERROR("Invalid crtc %u\n", pipe);
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
>> +
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
>> +	for (i =3D 0; i < I915_TIMESTAMP_MAXRETRIES; i++) {
>> +		/*
>> +		 * Get vertical and horizontal scanout position vpos, hpos,
>> +		 * and bounding timestamps stime, etime, pre/post query.
>> +		 */
>> +		vbl_status =3D i915_get_crtc_scanoutpos(dev, pipe, in_vblank_irq,
>> +						      &vpos, &hpos, &stime,
>> +						      &etime, mode);
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
>> +	if (i =3D=3D I915_TIMESTAMP_MAXRETRIES) {
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
>> +
>>  int intel_get_crtc_scanline(struct intel_crtc *crtc)
>>  {
>>  	struct drm_i915_private *dev_priv =3D to_i915(crtc->base.dev);
>> diff --git a/drivers/gpu/drm/i915/i915_irq.h b/drivers/gpu/drm/i915/i9=
15_irq.h
>> index 812c47a9c2d6..5f7b133ce721 100644
>> --- a/drivers/gpu/drm/i915/i915_irq.h
>> +++ b/drivers/gpu/drm/i915/i915_irq.h
>> @@ -101,10 +101,11 @@ void gen8_irq_power_well_post_enable(struct drm_=
i915_private *dev_priv,
>>  void gen8_irq_power_well_pre_disable(struct drm_i915_private *dev_pri=
v,
>>  				     u8 pipe_mask);
>> =20
>> -bool i915_get_crtc_scanoutpos(struct drm_device *dev, unsigned int pi=
pe,
>> -			      bool in_vblank_irq, int *vpos, int *hpos,
>> -			      ktime_t *stime, ktime_t *etime,
>> -			      const struct drm_display_mode *mode);
>> +bool i915_calc_vbltimestamp_from_scanoutpos(struct drm_device *dev,
>> +					    unsigned int pipe,
>> +					    int *max_error,
>> +					    ktime_t *vblank_time,
>> +					    bool in_vblank_irq);
>> =20
>>  u32 i915_get_vblank_counter(struct drm_crtc *crtc);
>>  u32 g4x_get_vblank_counter(struct drm_crtc *crtc);
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--W0cGWnh782OoXLqtEz8FyBSMj6jTQys4k--

--g0ySiYiVX9utuS5uln1yvyMTzIzQEdWXZ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4YaDoACgkQaA3BHVML
eiOXBAf9HUV8mqLeUV8/+NE/0SLN0UB9Pi+3B8webq9+eJZtervh+eIVVkl0rqVZ
r9gC8em5l4LLpjD44VUBj1XFMr4QnaS75xVONAjrRiP2TeiqVq7nahqSBerOTsUr
CB9nku3mlRhs48xSlqednBnVj2YpAVms7N9MnXv7Wa7UoQ/fJ8wIrPCUFRGxlKH3
wi9F39JSGG9A8Crtt1I1qCwaMGHRxe3LRMnLCEWeiBbcnBXLwQU5NQzkKxD90hmQ
ZvtC/aMpyUZTw2j7kZY+QCvKn74Ik4ZR/WU0UZL/iNk2jnN9I3ey7AETZT2D8pqc
uWWMFArLkw38YzLtN8ppWx4/03Q9yw==
=6Ly0
-----END PGP SIGNATURE-----

--g0ySiYiVX9utuS5uln1yvyMTzIzQEdWXZ--

--===============1186626735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1186626735==--
