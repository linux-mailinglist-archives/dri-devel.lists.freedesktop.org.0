Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E010913AB68
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jan 2020 14:48:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 141106E3D0;
	Tue, 14 Jan 2020 13:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20D0D6E3C6;
 Tue, 14 Jan 2020 13:48:20 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 35C6CAD0F;
 Tue, 14 Jan 2020 13:48:18 +0000 (UTC)
Subject: Re: [PATCH 23/23] drm: Cleanup VBLANK callbacks in struct drm_driver
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-24-tzimmermann@suse.de>
 <20200112225312.GC5340@dvetter-linux.ger.corp.intel.com>
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
Message-ID: <b5f6ac70-0bbe-18d5-f944-3ebba3237a9d@suse.de>
Date: Tue, 14 Jan 2020 14:48:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200112225312.GC5340@dvetter-linux.ger.corp.intel.com>
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
Content-Type: multipart/mixed; boundary="===============0692502543=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0692502543==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="hnX2ORJn5vRIQccq9Tfc7COteUkRxx61k"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--hnX2ORJn5vRIQccq9Tfc7COteUkRxx61k
Content-Type: multipart/mixed; boundary="RAgxvS6j00AOrEMVpsfV7vPGxWhMlDzKn";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
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
Message-ID: <b5f6ac70-0bbe-18d5-f944-3ebba3237a9d@suse.de>
Subject: Re: [PATCH 23/23] drm: Cleanup VBLANK callbacks in struct drm_driver
References: <20200110092127.27847-1-tzimmermann@suse.de>
 <20200110092127.27847-24-tzimmermann@suse.de>
 <20200112225312.GC5340@dvetter-linux.ger.corp.intel.com>
In-Reply-To: <20200112225312.GC5340@dvetter-linux.ger.corp.intel.com>

--RAgxvS6j00AOrEMVpsfV7vPGxWhMlDzKn
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.01.20 um 23:53 schrieb Daniel Vetter:
> On Fri, Jan 10, 2020 at 10:21:27AM +0100, Thomas Zimmermann wrote:
>> All non-legacy users of VBLANK functions in struct drm_driver have bee=
n
>> converted to use the respective interfaces in struct drm_crtc_funcs. T=
he
>> remaining users of VBLANK callbacks in struct drm_driver are legacy dr=
ivers
>> with userspace modesetting.
>>
>> There are no users left of get_vblank_timestamp(), so the callback is
>> being removed. The other VBLANK callbacks are being moved to the legac=
y
>> section at the end of struct drm_driver.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> I think sprinkling some WARN_ON (in drm_dev_register or wherever) if ne=
w
> drivers try to use the legacy hooks would be really nice. Experience sa=
ys
> someone is going to copypaste this stuff around forever otherwise.

I've been thinking about moving these fields to separate structures, say
struct drm_legacy_device and struct drm_legacy_driver. Those would be
allocated for legacy drivers and KMS drivers would never see them
(except for their forward declaration).

Best regards
Thomas

>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
>> ---
>>  drivers/gpu/drm/drm_vblank.c |  39 +++++---------
>>  include/drm/drm_drv.h        | 101 ++--------------------------------=
-
>>  2 files changed, 17 insertions(+), 123 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank=
=2Ec
>> index 7cf436a4b908..ceff68474d4d 100644
>> --- a/drivers/gpu/drm/drm_vblank.c
>> +++ b/drivers/gpu/drm/drm_vblank.c
>> @@ -138,10 +138,9 @@ static u32 __get_vblank_counter(struct drm_device=
 *dev, unsigned int pipe)
>> =20
>>  		if (crtc->funcs->get_vblank_counter)
>>  			return crtc->funcs->get_vblank_counter(crtc);
>> -	}
>> -
>> -	if (dev->driver->get_vblank_counter)
>> +	} else if (dev->driver->get_vblank_counter) {
>>  		return dev->driver->get_vblank_counter(dev, pipe);
>> +	}
>> =20
>>  	return drm_vblank_no_hw_counter(dev, pipe);
>>  }
>> @@ -334,8 +333,7 @@ u64 drm_crtc_accurate_vblank_count(struct drm_crtc=
 *crtc)
>>  	unsigned long flags;
>> =20
>>  	WARN_ONCE(drm_debug_enabled(DRM_UT_VBL) &&
>> -		  !crtc->funcs->get_vblank_timestamp &&
>> -		  !dev->driver->get_vblank_timestamp,
>> +		  !crtc->funcs->get_vblank_timestamp,
>>  		  "This function requires support for accurate vblank timestamps.")=
;
>> =20
>>  	spin_lock_irqsave(&dev->vblank_time_lock, flags);
>> @@ -357,13 +355,11 @@ static void __disable_vblank(struct drm_device *=
dev, unsigned int pipe)
>>  		if (WARN_ON(!crtc))
>>  			return;
>> =20
>> -		if (crtc->funcs->disable_vblank) {
>> +		if (crtc->funcs->disable_vblank)
>>  			crtc->funcs->disable_vblank(crtc);
>> -			return;
>> -		}
>> +	} else {
>> +		dev->driver->disable_vblank(dev, pipe);
>>  	}
>> -
>> -	dev->driver->disable_vblank(dev, pipe);
>>  }
>> =20
>>  /*
>> @@ -791,9 +787,6 @@ drm_get_last_vbltimestamp(struct drm_device *dev, =
unsigned int pipe,
>> =20
>>  		ret =3D crtc->funcs->get_vblank_timestamp(crtc, &max_error,
>>  							tvblank, in_vblank_irq);
>> -	} else if (dev->driver->get_vblank_timestamp && (max_error > 0)) {
>> -		ret =3D dev->driver->get_vblank_timestamp(dev, pipe, &max_error,
>> -							tvblank, in_vblank_irq);
>>  	}
>> =20
>>  	/* GPU high precision timestamp query unsupported or failed.
>> @@ -1016,9 +1009,11 @@ static int __enable_vblank(struct drm_device *d=
ev, unsigned int pipe)
>> =20
>>  		if (crtc->funcs->enable_vblank)
>>  			return crtc->funcs->enable_vblank(crtc);
>> +	} else if (dev->driver->enable_vblank) {
>> +		return dev->driver->enable_vblank(dev, pipe);
>>  	}
>> =20
>> -	return dev->driver->enable_vblank(dev, pipe);
>> +	return -EINVAL;
>>  }
>> =20
>>  static int drm_vblank_enable(struct drm_device *dev, unsigned int pip=
e)
>> @@ -1109,13 +1104,10 @@ static bool __vblank_disable_immediate(struct =
drm_device *dev, unsigned int pipe
>>  		return false;
>> =20
>>  	crtc =3D drm_crtc_from_index(dev, pipe);
>> -	if (crtc && crtc->funcs->get_vblank_timestamp)
>> -		return true;
>> -
>> -	if (dev->driver->get_vblank_timestamp)
>> -		return true;
>> +	if (!crtc || !crtc->funcs->get_vblank_timestamp)
>> +		return false;
>> =20
>> -	return false;
>> +	return true;
>>  }
>> =20
>>  static void drm_vblank_put(struct drm_device *dev, unsigned int pipe)=

>> @@ -1798,7 +1790,6 @@ static void drm_handle_vblank_events(struct drm_=
device *dev, unsigned int pipe)
>>  	struct drm_pending_vblank_event *e, *t;
>>  	ktime_t now;
>>  	u64 seq;
>> -	bool high_prec;
>> =20
>>  	assert_spin_locked(&dev->event_lock);
>> =20
>> @@ -1818,10 +1809,8 @@ static void drm_handle_vblank_events(struct drm=
_device *dev, unsigned int pipe)
>>  		send_vblank_event(dev, e, seq, now);
>>  	}
>> =20
>> -	high_prec =3D crtc->funcs->get_vblank_timestamp ||
>> -		    dev->driver->get_vblank_timestamp;
>> -
>> -	trace_drm_vblank_event(pipe, seq, now, high_prec);
>> +	trace_drm_vblank_event(pipe, seq, now,
>> +			       crtc->funcs->get_vblank_timestamp !=3D NULL);
>>  }
>> =20
>>  /**
>> diff --git a/include/drm/drm_drv.h b/include/drm/drm_drv.h
>> index b704e252f3b2..e290b3aca6eb 100644
>> --- a/include/drm/drm_drv.h
>> +++ b/include/drm/drm_drv.h
>> @@ -268,104 +268,6 @@ struct drm_driver {
>>  	 */
>>  	void (*release) (struct drm_device *);
>> =20
>> -	/**
>> -	 * @get_vblank_counter:
>> -	 *
>> -	 * Driver callback for fetching a raw hardware vblank counter for th=
e
>> -	 * CRTC specified with the pipe argument.  If a device doesn't have =
a
>> -	 * hardware counter, the driver can simply leave the hook as NULL.
>> -	 * The DRM core will account for missed vblank events while interrup=
ts
>> -	 * where disabled based on system timestamps.
>> -	 *
>> -	 * Wraparound handling and loss of events due to modesetting is deal=
t
>> -	 * with in the DRM core code, as long as drivers call
>> -	 * drm_crtc_vblank_off() and drm_crtc_vblank_on() when disabling or
>> -	 * enabling a CRTC.
>> -	 *
>> -	 * This is deprecated and should not be used by new drivers.
>> -	 * Use &drm_crtc_funcs.get_vblank_counter instead.
>> -	 *
>> -	 * Returns:
>> -	 *
>> -	 * Raw vblank counter value.
>> -	 */
>> -	u32 (*get_vblank_counter) (struct drm_device *dev, unsigned int pipe=
);
>> -
>> -	/**
>> -	 * @enable_vblank:
>> -	 *
>> -	 * Enable vblank interrupts for the CRTC specified with the pipe
>> -	 * argument.
>> -	 *
>> -	 * This is deprecated and should not be used by new drivers.
>> -	 * Use &drm_crtc_funcs.enable_vblank instead.
>> -	 *
>> -	 * Returns:
>> -	 *
>> -	 * Zero on success, appropriate errno if the given @crtc's vblank
>> -	 * interrupt cannot be enabled.
>> -	 */
>> -	int (*enable_vblank) (struct drm_device *dev, unsigned int pipe);
>> -
>> -	/**
>> -	 * @disable_vblank:
>> -	 *
>> -	 * Disable vblank interrupts for the CRTC specified with the pipe
>> -	 * argument.
>> -	 *
>> -	 * This is deprecated and should not be used by new drivers.
>> -	 * Use &drm_crtc_funcs.disable_vblank instead.
>> -	 */
>> -	void (*disable_vblank) (struct drm_device *dev, unsigned int pipe);
>> -
>> -	/**
>> -	 * @get_vblank_timestamp:
>> -	 *
>> -	 * Called by drm_get_last_vbltimestamp(). Should return a precise
>> -	 * timestamp when the most recent VBLANK interval ended or will end.=

>> -	 *
>> -	 * Specifically, the timestamp in @vblank_time should correspond as
>> -	 * closely as possible to the time when the first video scanline of
>> -	 * the video frame after the end of VBLANK will start scanning out,
>> -	 * the time immediately after end of the VBLANK interval. If the
>> -	 * @crtc is currently inside VBLANK, this will be a time in the futu=
re.
>> -	 * If the @crtc is currently scanning out a frame, this will be the
>> -	 * past start time of the current scanout. This is meant to adhere
>> -	 * to the OpenML OML_sync_control extension specification.
>> -	 *
>> -	 * Paramters:
>> -	 *
>> -	 * dev:
>> -	 *     dev DRM device handle.
>> -	 * pipe:
>> -	 *     crtc for which timestamp should be returned.
>> -	 * max_error:
>> -	 *     Maximum allowable timestamp error in nanoseconds.
>> -	 *     Implementation should strive to provide timestamp
>> -	 *     with an error of at most max_error nanoseconds.
>> -	 *     Returns true upper bound on error for timestamp.
>> -	 * vblank_time:
>> -	 *     Target location for returned vblank timestamp.
>> -	 * in_vblank_irq:
>> -	 *     True when called from drm_crtc_handle_vblank().  Some drivers=

>> -	 *     need to apply some workarounds for gpu-specific vblank irq qu=
irks
>> -	 *     if flag is set.
>> -	 *
>> -	 * Returns:
>> -	 *
>> -	 * True on success, false on failure, which means the core should
>> -	 * fallback to a simple timestamp taken in drm_crtc_handle_vblank().=

>> -	 *
>> -	 * FIXME:
>> -	 *
>> -	 * We should move this hook to &struct drm_crtc_funcs like all the o=
ther
>> -	 * vblank hooks.
>> -	 */
>> -	bool (*get_vblank_timestamp) (struct drm_device *dev, unsigned int p=
ipe,
>> -				     int *max_error,
>> -				     ktime_t *vblank_time,
>> -				     bool in_vblank_irq);
>> -
>>  	/**
>>  	 * @irq_handler:
>>  	 *
>> @@ -720,6 +622,9 @@ struct drm_driver {
>>  	int (*dma_ioctl) (struct drm_device *dev, void *data, struct drm_fil=
e *file_priv);
>>  	int (*dma_quiescent) (struct drm_device *);
>>  	int (*context_dtor) (struct drm_device *dev, int context);
>> +	u32 (*get_vblank_counter)(struct drm_device *dev, unsigned int pipe)=
;
>> +	int (*enable_vblank)(struct drm_device *dev, unsigned int pipe);
>> +	void (*disable_vblank)(struct drm_device *dev, unsigned int pipe);
>>  	int dev_priv_size;
>>  };
>> =20
>> --=20
>> 2.24.1
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--RAgxvS6j00AOrEMVpsfV7vPGxWhMlDzKn--

--hnX2ORJn5vRIQccq9Tfc7COteUkRxx61k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl4dxp0ACgkQaA3BHVML
eiM2LAf+N0P4K1WKEoBwNNQG29y3+S5aPjHn2Z//V9UoNisKLZHcvcqsUvwN1Tev
N+DXjGdRzpgPCMu8IOfQBi+fob8CKgS5i+Y1t21sqJo1YqLGdeECeVvwofurAjEp
gNL6hGEG+TnzuuSQdn9JyAzLvwMHS9GR5aBXM3D3v8hBI5VDl3kP7RsvU6Cra2j+
iT+fKiSwpLbjeRK/tvquY5YD2IHGhThx0foDhYHtNM+Wtp8xuVjd/fkAa8087bfY
tbIkX44AnNJnkaSwic7tsl9YBKNnXaRDciqcblXWF8FHDpoUocuGJf9NUePvx8XU
wL9DGhUIxUSIeSr++09yBzi5jXc6vA==
=2kyn
-----END PGP SIGNATURE-----

--hnX2ORJn5vRIQccq9Tfc7COteUkRxx61k--

--===============0692502543==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0692502543==--
