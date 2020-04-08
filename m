Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 586ED1A1DCA
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 11:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FDB16E9DC;
	Wed,  8 Apr 2020 09:05:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB926E9DC
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 09:05:25 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id BAA0DACBA;
 Wed,  8 Apr 2020 09:05:22 +0000 (UTC)
Subject: Re: [PATCH v2 10/10] drm/fb-helper: Remove return value from
 drm_fbdev_generic_setup()
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200408082641.590-1-tzimmermann@suse.de>
 <20200408082641.590-11-tzimmermann@suse.de>
 <20200408085044.GA23972@ravnborg.org>
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
Message-ID: <3ee04af4-03ee-2813-571e-bce664ace95c@suse.de>
Date: Wed, 8 Apr 2020 11:05:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200408085044.GA23972@ravnborg.org>
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
Cc: airlied@linux.ie, dri-devel@lists.freedesktop.org, paul@crapouillou.net,
 kraxel@redhat.com, emil.velikov@collabora.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, tomi.valkeinen@ti.com, chunkuang.hu@kernel.org,
 puck.chen@hisilicon.com, hdegoede@redhat.com, jsarha@ti.com,
 matthias.bgg@gmail.com, sean@poorly.run, zourongrong@gmail.com,
 tiantao6@hisilicon.com
Content-Type: multipart/mixed; boundary="===============1208929548=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1208929548==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="J311umRTnUDCep8iQFPlzwyTPkPG855yh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--J311umRTnUDCep8iQFPlzwyTPkPG855yh
Content-Type: multipart/mixed; boundary="J8WheCClXi4SvS9IfrGwK5tCWvvh8I1y1";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: noralf@tronnes.org, daniel@ffwll.ch, airlied@linux.ie,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 xinliang.liu@linaro.org, zourongrong@gmail.com, john.stultz@linaro.org,
 kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
 paul@crapouillou.net, chunkuang.hu@kernel.org, p.zabel@pengutronix.de,
 matthias.bgg@gmail.com, jsarha@ti.com, tomi.valkeinen@ti.com,
 sean@poorly.run, hdegoede@redhat.com, kraxel@redhat.com,
 emil.velikov@collabora.com, yc_chen@aspeedtech.com, tiantao6@hisilicon.com,
 dri-devel@lists.freedesktop.org
Message-ID: <3ee04af4-03ee-2813-571e-bce664ace95c@suse.de>
Subject: Re: [PATCH v2 10/10] drm/fb-helper: Remove return value from
 drm_fbdev_generic_setup()
References: <20200408082641.590-1-tzimmermann@suse.de>
 <20200408082641.590-11-tzimmermann@suse.de>
 <20200408085044.GA23972@ravnborg.org>
In-Reply-To: <20200408085044.GA23972@ravnborg.org>

--J8WheCClXi4SvS9IfrGwK5tCWvvh8I1y1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi Sam

Am 08.04.20 um 10:50 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> You missed my ack on the first 9 patches:
> https://lore.kernel.org/dri-devel/20200407101354.GA12686@ravnborg.org/
> Not that it matters as others have acked/reviewed them.

This got lost. I'll add you acks. Thanks for taking another look at the
patches.

>=20
> On Wed, Apr 08, 2020 at 10:26:41AM +0200, Thomas Zimmermann wrote:
>> Generic fbdev emulation is a DRM client. Drivers should invoke the
>> setup function, but not depend on its success. Hence remove the return=

>> value.
>>
>> v2:
>> 	* warn if fbdev device has not been registered yet
>> 	* document the new behavior
>> 	* convert the existing warning to the new dev_ interface
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
>> Reviewed-by: Noralf Tr=C3=B8nnes <noralf@tronnes.org>
>> Acked-by: Gerd Hoffmann <kraxel@redhat.com>
>> ---
>>  drivers/gpu/drm/drm_fb_helper.c | 25 +++++++++++++------------
>>  include/drm/drm_fb_helper.h     |  5 +++--
>>  2 files changed, 16 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_fb_helper.c b/drivers/gpu/drm/drm_fb_=
helper.c
>> index 165c8dab50797..97f5e43837486 100644
>> --- a/drivers/gpu/drm/drm_fb_helper.c
>> +++ b/drivers/gpu/drm/drm_fb_helper.c
>> @@ -2169,7 +2169,9 @@ static const struct drm_client_funcs drm_fbdev_c=
lient_funcs =3D {
>>   *                 @dev->mode_config.preferred_depth is used if this =
is zero.
>>   *
>>   * This function sets up generic fbdev emulation for drivers that sup=
ports
>> - * dumb buffers with a virtual address and that can be mmap'ed.
>> + * dumb buffers with a virtual address and that can be mmap'ed. It's =
supposed
>> + * to run after the DRM driver registered the new DRM device with
>> + * drm_dev_register().
> OR maybe be more explicit - something like:
> drm_fbdev_generic_setup() shall be called after the DRM is registered
> with drm_dev_register().

I think this one is even better.

Best regards
Thomas

>=20
> Either way is fine.
>=20
> 	Sam
>=20
>>   *
>>   * Restore, hotplug events and teardown are all taken care of. Driver=
s that do
>>   * suspend/resume need to call drm_fb_helper_set_suspend_unlocked() t=
hemselves.
>> @@ -2186,29 +2188,30 @@ static const struct drm_client_funcs drm_fbdev=
_client_funcs =3D {
>>   * Setup will be retried on the next hotplug event.
>>   *
>>   * The fbdev is destroyed by drm_dev_unregister().
>> - *
>> - * Returns:
>> - * Zero on success or negative error code on failure.
>>   */
>> -int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int pref=
erred_bpp)
>> +void drm_fbdev_generic_setup(struct drm_device *dev,
>> +			     unsigned int preferred_bpp)
>>  {
>>  	struct drm_fb_helper *fb_helper;
>>  	int ret;
>> =20
>> -	WARN(dev->fb_helper, "fb_helper is already set!\n");
>> +	drm_WARN(dev, !dev->registered, "Device has not been registered.\n")=
;
>> +	drm_WARN(dev, dev->fb_helper, "fb_helper is already set!\n");
>> =20
>>  	if (!drm_fbdev_emulation)
>> -		return 0;
>> +		return;
>> =20
>>  	fb_helper =3D kzalloc(sizeof(*fb_helper), GFP_KERNEL);
>> -	if (!fb_helper)
>> -		return -ENOMEM;
>> +	if (!fb_helper) {
>> +		drm_err(dev, "Failed to allocate fb_helper\n");
>> +		return;
>> +	}
>> =20
>>  	ret =3D drm_client_init(dev, &fb_helper->client, "fbdev", &drm_fbdev=
_client_funcs);
>>  	if (ret) {
>>  		kfree(fb_helper);
>>  		drm_err(dev, "Failed to register client: %d\n", ret);
>> -		return ret;
>> +		return;
>>  	}
>> =20
>>  	if (!preferred_bpp)
>> @@ -2222,8 +2225,6 @@ int drm_fbdev_generic_setup(struct drm_device *d=
ev, unsigned int preferred_bpp)
>>  		drm_dbg_kms(dev, "client hotplug ret=3D%d\n", ret);
>> =20
>>  	drm_client_register(&fb_helper->client);
>> -
>> -	return 0;
>>  }
>>  EXPORT_SYMBOL(drm_fbdev_generic_setup);
>> =20
>> diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h=

>> index 208dbf87afa3e..fb037be83997d 100644
>> --- a/include/drm/drm_fb_helper.h
>> +++ b/include/drm/drm_fb_helper.h
>> @@ -269,7 +269,8 @@ int drm_fb_helper_debug_leave(struct fb_info *info=
);
>>  void drm_fb_helper_lastclose(struct drm_device *dev);
>>  void drm_fb_helper_output_poll_changed(struct drm_device *dev);
>> =20
>> -int drm_fbdev_generic_setup(struct drm_device *dev, unsigned int pref=
erred_bpp);
>> +void drm_fbdev_generic_setup(struct drm_device *dev,
>> +			     unsigned int preferred_bpp);
>>  #else
>>  static inline void drm_fb_helper_prepare(struct drm_device *dev,
>>  					struct drm_fb_helper *helper,
>> @@ -443,7 +444,7 @@ static inline void drm_fb_helper_output_poll_chang=
ed(struct drm_device *dev)
>>  {
>>  }
>> =20
>> -static inline int
>> +static inline void
>>  drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferre=
d_bpp)
>>  {
>>  	return 0;
>> --=20
>> 2.26.0

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--J8WheCClXi4SvS9IfrGwK5tCWvvh8I1y1--

--J311umRTnUDCep8iQFPlzwyTPkPG855yh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl6Nk88ACgkQaA3BHVML
eiPK6gf+LMIZxUiEF1IXdBIaB5ZuITgXaUTkG+EOeDKOiQP+ObRh1em/aGjtrqaA
+h8oojgrwDmlewAiI4VmZrLDtJ/pngmJnT7hd06UvoAfuOosNH51YjLnkC83/llT
+mPv1EPmUThkA6ZTR8PN+HcLmNAvxy+da9qBRttu7h1cdZcO3VpUj6QOYI8BADYw
l8tjsVDpcOZsYlhO/PvXbZDdvaKVPKxXRNOrmkUOfM3IMoF+hJa9PHuCShvlyG5o
7b9LVj0D96C7wqeQORUPsLXpGItY1xtPBXStqRO1vwFuMsJ3wE5tPMkQr//w0w4p
gSJDynuAZ4U4A4/qJMJyelMAtu23fg==
=iVE8
-----END PGP SIGNATURE-----

--J311umRTnUDCep8iQFPlzwyTPkPG855yh--

--===============1208929548==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1208929548==--
