Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8891D13BA57
	for <lists+dri-devel@lfdr.de>; Wed, 15 Jan 2020 08:31:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF0696E85C;
	Wed, 15 Jan 2020 07:31:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD186E14D;
 Wed, 15 Jan 2020 07:31:24 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 0261FAD3C;
 Wed, 15 Jan 2020 07:31:21 +0000 (UTC)
Subject: Re: [PATCH 01/23] drm: Add get_scanout_position() to struct
 drm_crtc_helper_funcs
To: Yannick FERTRE <yannick.fertre@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, "eric@anholt.net"
 <eric@anholt.net>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "linux-graphics-maintainer@vmware.com"
 <linux-graphics-maintainer@vmware.com>,
 "thellstrom@vmware.com" <thellstrom@vmware.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-2-tzimmermann@suse.de>
 <921ff745-0f2a-0bb6-c758-07174ac26e40@st.com>
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
Message-ID: <fdef25cd-8784-c8b5-4cd0-1ffcf5e27695@suse.de>
Date: Wed, 15 Jan 2020 08:31:16 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <921ff745-0f2a-0bb6-c758-07174ac26e40@st.com>
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
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Content-Type: multipart/mixed; boundary="===============0752273078=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0752273078==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="dy8utQKQWBe6XuW8macqRBBoPSguKlppq"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--dy8utQKQWBe6XuW8macqRBBoPSguKlppq
Content-Type: multipart/mixed; boundary="SmewxxS8D8HCScoDniLEP9bGTKtCgtZAO";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Yannick FERTRE <yannick.fertre@st.com>,
 "airlied@linux.ie" <airlied@linux.ie>, "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "alexander.deucher@amd.com" <alexander.deucher@amd.com>,
 "christian.koenig@amd.com" <christian.koenig@amd.com>,
 "David1.Zhou@amd.com" <David1.Zhou@amd.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "patrik.r.jakobsson@gmail.com" <patrik.r.jakobsson@gmail.com>,
 "robdclark@gmail.com" <robdclark@gmail.com>,
 "sean@poorly.run" <sean@poorly.run>,
 "benjamin.gaignard@linaro.org" <benjamin.gaignard@linaro.org>,
 Vincent ABRIOU <vincent.abriou@st.com>,
 Philippe CORNU <philippe.cornu@st.com>,
 "mcoquelin.stm32@gmail.com" <mcoquelin.stm32@gmail.com>,
 Alexandre TORGUE <alexandre.torgue@st.com>, "eric@anholt.net"
 <eric@anholt.net>,
 "rodrigosiqueiramelo@gmail.com" <rodrigosiqueiramelo@gmail.com>,
 "hamohammed.sa@gmail.com" <hamohammed.sa@gmail.com>,
 "linux-graphics-maintainer@vmware.com"
 <linux-graphics-maintainer@vmware.com>,
 "thellstrom@vmware.com" <thellstrom@vmware.com>,
 "bskeggs@redhat.com" <bskeggs@redhat.com>,
 "harry.wentland@amd.com" <harry.wentland@amd.com>,
 "sunpeng.li@amd.com" <sunpeng.li@amd.com>,
 "jani.nikula@linux.intel.com" <jani.nikula@linux.intel.com>,
 "joonas.lahtinen@linux.intel.com" <joonas.lahtinen@linux.intel.com>,
 "rodrigo.vivi@intel.com" <rodrigo.vivi@intel.com>
Cc: "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "freedreno@lists.freedesktop.org" <freedreno@lists.freedesktop.org>
Message-ID: <fdef25cd-8784-c8b5-4cd0-1ffcf5e27695@suse.de>
Subject: Re: [PATCH 01/23] drm: Add get_scanout_position() to struct
 drm_crtc_helper_funcs
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-2-tzimmermann@suse.de>
 <921ff745-0f2a-0bb6-c758-07174ac26e40@st.com>
In-Reply-To: <921ff745-0f2a-0bb6-c758-07174ac26e40@st.com>

--SmewxxS8D8HCScoDniLEP9bGTKtCgtZAO
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 14.01.20 um 16:31 schrieb Yannick FERTRE:
> Thanks for the patch.
>=20
> Tested-by: Yannick Fertr=C3=A9 <yannick.fertre@st.com>=20

Thanks for testing all these patches.

Best regards
Thomas

>=20
> BR
> Yannick Fertr=C3=A9
>=20
>=20
> On 1/10/20 10:21 AM, Thomas Zimmermann wrote:
>> The new callback get_scanout_position() reads the current location of
>> the scanout process. The operation is currentyl located in struct
>> drm_driver, but really belongs to the CRTC. Drivers will be converted
>> in separate patches.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/drm_vblank.c             | 24 ++++++++----
>>  include/drm/drm_drv.h                    |  7 +---
>>  include/drm/drm_modeset_helper_vtables.h | 47 +++++++++++++++++++++++=
+
>>  3 files changed, 65 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index 1659b13b178c..c12f0b333e14 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -30,6 +30,7 @@
>>  #include <drm/drm_crtc.h>
>>  #include <drm/drm_drv.h>
>>  #include <drm/drm_framebuffer.h>
>> +#include <drm/drm_modeset_helper_vtables.h>
>>  #include <drm/drm_print.h>
>>  #include <drm/drm_vblank.h>
>> =20
>> @@ -590,7 +591,7 @@ EXPORT_SYMBOL(drm_calc_timestamping_constants);
>>   * Implements calculation of exact vblank timestamps from given drm_d=
isplay_mode
>>   * timings and current video scanout position of a CRTC. This can be =
directly
>>   * used as the &drm_driver.get_vblank_timestamp implementation of a k=
ms driver
>> - * if &drm_driver.get_scanout_position is implemented.
>> + * if &drm_crtc_helper_funcs.get_scanout_position is implemented.
>>   *
>>   * The current implementation only handles standard video modes. For =
double scan
>>   * and interlaced modes the driver is supposed to adjust the hardware=
 mode
>> @@ -632,8 +633,9 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struct =
drm_device *dev,
>>  	}
>> =20
>>  	/* Scanout position query not supported? Should not happen. */
>> -	if (!dev->driver->get_scanout_position) {
>> -		DRM_ERROR("Called from driver w/o get_scanout_position()!?\n");
>> +	if (!dev->driver->get_scanout_position ||
>> +	    !crtc->helper_private->get_scanout_position) {
>> +		DRM_ERROR("Called from CRTC w/o get_scanout_position()!?\n");
>>  		return false;
>>  	}
>> =20
>> @@ -664,11 +666,17 @@ bool drm_calc_vbltimestamp_from_scanoutpos(struc=
t drm_device *dev,
>>  		 * Get vertical and horizontal scanout position vpos, hpos,
>>  		 * and bounding timestamps stime, etime, pre/post query.
>>  		 */
>> -		vbl_status =3D dev->driver->get_scanout_position(dev, pipe,
>> -							       in_vblank_irq,
>> -							       &vpos, &hpos,
>> -							       &stime, &etime,
>> -							       mode);
>> +		if (crtc->helper_private->get_scanout_position) {
>> +			vbl_status =3D
>> +				crtc->helper_private->get_scanout_position(
>> +					crtc, in_vblank_irq, &vpos, &hpos,
>> +					&stime, &etime, mode);
>> +		} else {
>> +			vbl_status =3D
>> +				dev->driver->get_scanout_position(
>> +					dev, pipe, in_vblank_irq, &vpos,
>> +					&hpos, &stime, &etime, mode);
>> +		}
>> =20
>>  		/* Return as no-op if scanout query unsupported or failed. */
>>  		if (!vbl_status) {
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index cf13470810a5..d0049e5786fc 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -362,11 +362,8 @@ struct drm_driver {
>>  	 * True on success, false if a reliable scanout position counter cou=
ld
>>  	 * not be read out.
>>  	 *
>> -	 * FIXME:
>> -	 *
>> -	 * Since this is a helper to implement @get_vblank_timestamp, we sho=
uld
>> -	 * move it to &struct drm_crtc_helper_funcs, like all the other
>> -	 * helper-internal hooks.
>> +	 * This is deprecated and should not be used by new drivers.
>> +	 * Use &drm_crtc_helper_funcs.get_scanout_position instead.
>>  	 */
>>  	bool (*get_scanout_position) (struct drm_device *dev, unsigned int p=
ipe,
>>  				      bool in_vblank_irq, int *vpos, int *hpos,
>> diff --git a/include/drm/drm_modeset_helper_vtables.h b/include/drm/dr=
m_modeset_helper_vtables.h
>> index 5a87f1bd7a3f..e398512bfd5f 100644
>> --- a/include/drm/drm_modeset_helper_vtables.h
>> +++ b/include/drm/drm_modeset_helper_vtables.h
>> @@ -450,6 +450,53 @@ struct drm_crtc_helper_funcs {
>>  	 */
>>  	void (*atomic_disable)(struct drm_crtc *crtc,
>>  			       struct drm_crtc_state *old_crtc_state);
>> +
>> +	/**
>> +	 * @get_scanout_position:
>> +	 *
>> +	 * Called by vblank timestamping code.
>> +	 *
>> +	 * Returns the current display scanout position from a CRTC and an
>> +	 * optional accurate ktime_get() timestamp of when the position was
>> +	 * measured. Note that this is a helper callback which is only used
>> +	 * if a driver uses drm_calc_vbltimestamp_from_scanoutpos() for the
>> +	 * @drm_driver.get_vblank_timestamp callback.
>> +	 *
>> +	 * Parameters:
>> +	 *
>> +	 * crtc:
>> +	 *     The CRTC.
>> +	 * in_vblank_irq:
>> +	 *     True when called from drm_crtc_handle_vblank(). Some drivers
>> +	 *     need to apply some workarounds for gpu-specific vblank irq
>> +	 *     quirks if the flag is set.
>> +	 * vpos:
>> +	 *     Target location for current vertical scanout position.
>> +	 * hpos:
>> +	 *     Target location for current horizontal scanout position.
>> +	 * stime:
>> +	 *     Target location for timestamp taken immediately before
>> +	 *     scanout position query. Can be NULL to skip timestamp.
>> +	 * etime:
>> +	 *     Target location for timestamp taken immediately after
>> +	 *     scanout position query. Can be NULL to skip timestamp.
>> +	 * mode:
>> +	 *     Current display timings.
>> +	 *
>> +	 * Returns vpos as a positive number while in active scanout area.
>> +	 * Returns vpos as a negative number inside vblank, counting the num=
ber
>> +	 * of scanlines to go until end of vblank, e.g., -1 means "one scanl=
ine
>> +	 * until start of active scanout / end of vblank."
>> +	 *
>> +	 * Returns:
>> +	 *
>> +	 * True on success, false if a reliable scanout position counter cou=
ld
>> +	 * not be read out.
>> +	 */
>> +	bool (*get_scanout_position)(struct drm_crtc *crtc,
>> +				     bool in_vblank_irq, int *vpos, int *hpos,
>> +				     ktime_t *stime, ktime_t *etime,
>> +				     const struct drm_display_mode *mode);
>>  };
>> =20
>>  /**
>=20
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--SmewxxS8D8HCScoDniLEP9bGTKtCgtZAO--

--dy8utQKQWBe6XuW8macqRBBoPSguKlppq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4ev8cACgkQaA3BHVML
eiPQPAgAhNBXxz0tZEzNlLqbwwfpcEJrCLZf/o7JVn07uUaHaDDU/MOgY7tyis90
qcfe1ZSVJsNiKyd81M5WVhxnzywTZbhJOlifgzdF0QJV8j+oPYSoNyUf2FkFdI25
Z0qCKYBW/07bNezPyl8OWD4teGOvMmQFCM7u6ZmaWL7O0kXgAb18zp2d8gZ47Cua
eoVZ6Dkz339eNR/o+N13BcSQH0G5WY736lmO/NI3jAkPpdv09v1L1HzNjrbkEGqb
E5WzMu+rDk0N7MHxa16XNSv9a9WCmLRfeqnQTxmCJ5B/CH5l/OXGFjytPMC9vAjp
SFw+EjFt/J9IAV9D/CxaWttoRrzadg==
=NncW
-----END PGP SIGNATURE-----

--dy8utQKQWBe6XuW8macqRBBoPSguKlppq--

--===============0752273078==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0752273078==--
