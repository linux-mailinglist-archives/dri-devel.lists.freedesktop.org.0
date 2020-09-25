Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD25278180
	for <lists+dri-devel@lfdr.de>; Fri, 25 Sep 2020 09:26:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4ADC36EC2A;
	Fri, 25 Sep 2020 07:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EA776EC2C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Sep 2020 07:26:47 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4488CABC4;
 Fri, 25 Sep 2020 07:26:46 +0000 (UTC)
Subject: Re: [PATCH] drm/hisilicon: Deleted the drm_device declaration
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
References: <1601016580-5937-1-git-send-email-tiantao6@hisilicon.com>
 <5db712e8-d6cb-3de9-f48e-c2060442e4e0@suse.de>
Message-ID: <50c87a77-ffdd-42d2-0747-69c95305a48f@suse.de>
Date: Fri, 25 Sep 2020 09:26:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <5db712e8-d6cb-3de9-f48e-c2060442e4e0@suse.de>
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
Cc: linuxarm@huawei.com
Content-Type: multipart/mixed; boundary="===============1393629117=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1393629117==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="lBT0zcnKBm5cMYwZocXW7MsVmNo8ugeqh"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--lBT0zcnKBm5cMYwZocXW7MsVmNo8ugeqh
Content-Type: multipart/mixed; boundary="X0CXQW3wudERYlWGlr0QpqzVs5BZ1TsBC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Tian Tao <tiantao6@hisilicon.com>, airlied@linux.ie, daniel@ffwll.ch,
 kraxel@redhat.com, alexander.deucher@amd.com, tglx@linutronix.de,
 dri-devel@lists.freedesktop.org, xinliang.liu@linaro.org,
 linux-kernel@vger.kernel.org
Cc: linuxarm@huawei.com
Message-ID: <50c87a77-ffdd-42d2-0747-69c95305a48f@suse.de>
Subject: Re: [PATCH] drm/hisilicon: Deleted the drm_device declaration
References: <1601016580-5937-1-git-send-email-tiantao6@hisilicon.com>
 <5db712e8-d6cb-3de9-f48e-c2060442e4e0@suse.de>
In-Reply-To: <5db712e8-d6cb-3de9-f48e-c2060442e4e0@suse.de>

--X0CXQW3wudERYlWGlr0QpqzVs5BZ1TsBC
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.09.20 um 09:02 schrieb Thomas Zimmermann:
> Hi,
>=20
> just a few nits.
>=20
> Am 25.09.20 um 08:49 schrieb Tian Tao:
>> drm_framebuffer.h contains drm/drm_device.h and struct drm_device is
>=20
> contains -> includes
>=20
>> already declared in this file, so there is no need to declare struct
>=20
> declared -> defined

Wait a second. drm_framebuffer.h actually declares struct drm_device,
but does not include <drm/device.h>. So the commit messag should say
something like

  drm_framebuffer.h already declares struct drm_device, so there's no
need to declare it in hibm_drm_drv.h

>=20
>> drm_device in hibm_drm_drv.h.
>>
>> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
>=20
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
>> ---
>>  drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h | 2 --
>>  1 file changed, 2 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h b/drivers=
/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> index 87d2aad..6a63502 100644
>> --- a/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> +++ b/drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.h
>> @@ -22,8 +22,6 @@
>>  #include <drm/drm_fb_helper.h>
>>  #include <drm/drm_framebuffer.h>
>> =20
>> -struct drm_device;
>> -
>>  struct hibmc_connector {
>>  	struct drm_connector base;
>> =20
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--X0CXQW3wudERYlWGlr0QpqzVs5BZ1TsBC--

--lBT0zcnKBm5cMYwZocXW7MsVmNo8ugeqh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9tm7IUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPS6QgAtrpfFkftAONP8hjUjzlnukbRhky7
nefoa2MI6FoTK/rK24Ixv/jVh5U98t0TD7xAtVSh6G5DekAT/yajeyCCc6nSs3GO
jlAyfFq3w2Xlp8T63LYeAPPRLpartcsyP35bKSvX9PCUe636mLxQin8wnW710rGY
PnljCc4NnV7VhBkKB587QBwuuAr1D/jmUlgL/CzKoIBRzK3VEhkBneWwK7xsLOnb
YOdK7wuo9dczfQNmSq7C9hXCoqlJaWzApKCExb224uIFI+n3IPEIV86je6jd5yFk
uZuKa682BdvvBSV623Eosp97eBaYviCKbk7H0Bl8+5gX639k1VdG4LaYYg==
=qeDT
-----END PGP SIGNATURE-----

--lBT0zcnKBm5cMYwZocXW7MsVmNo8ugeqh--

--===============1393629117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1393629117==--
