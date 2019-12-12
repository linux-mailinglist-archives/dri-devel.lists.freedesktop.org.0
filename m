Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4BE11CAAB
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 11:26:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF6026ED06;
	Thu, 12 Dec 2019 10:26:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39F986ED06
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2019 10:26:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 9575FAECA;
 Thu, 12 Dec 2019 10:26:19 +0000 (UTC)
Subject: Re: [PATCH v2 0/3] drm/vram-helper: Various cleanups
To: Sam Ravnborg <sam@ravnborg.org>
References: <20191212074117.29283-1-tzimmermann@suse.de>
 <20191212094930.GA32429@ravnborg.org>
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
Message-ID: <be0dd588-961a-a43e-7550-b8286431b015@suse.de>
Date: Thu, 12 Dec 2019 11:26:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191212094930.GA32429@ravnborg.org>
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
Cc: puck.chen@hisilicon.com, dri-devel@lists.freedesktop.org,
 kong.kongxinwei@hisilicon.com, kraxel@redhat.com, zourongrong@gmail.com,
 airlied@redhat.com
Content-Type: multipart/mixed; boundary="===============1909129206=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1909129206==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="wuNzd44fP2Hdu4qJiH67brDECmZsomrkm"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--wuNzd44fP2Hdu4qJiH67brDECmZsomrkm
Content-Type: multipart/mixed; boundary="avYabaiIsilsmEERrCxPEsPKVTzH4KgQm";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, daniel@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, zourongrong@gmail.com, kong.kongxinwei@hisilicon.com,
 puck.chen@hisilicon.com, kraxel@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <be0dd588-961a-a43e-7550-b8286431b015@suse.de>
Subject: Re: [PATCH v2 0/3] drm/vram-helper: Various cleanups
References: <20191212074117.29283-1-tzimmermann@suse.de>
 <20191212094930.GA32429@ravnborg.org>
In-Reply-To: <20191212094930.GA32429@ravnborg.org>

--avYabaiIsilsmEERrCxPEsPKVTzH4KgQm
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 12.12.19 um 10:49 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Thu, Dec 12, 2019 at 08:41:14AM +0100, Thomas Zimmermann wrote:
>> A number of cleanups that I wanted to apply for some time. The first
>> two patches simplify the public interface. The third patch adds suppor=
t
>> for struct drm_driver.gem_create_object. All tested by running fbdev,
>> X11 and Weston on ast HW.
>>
>> v2:
>> 	* make drm_gem_vram_create() still work if GEM object is not
>> 	  first in struct
>>
>> Thomas Zimmermann (3):
>>   drm/vram-helper: Remove interruptible flag from public interface
>>   drm/vram-helper: Remove BO device from public interface
>>   drm/vram-helper: Support struct drm_driver.gem_create_object
>=20
> I have browsed the code changes - everything now looks fine.
> As I miss the high-level picture (which is just my lack of DRM
> knowledge) this is not a review. But you can add my:
> Acked-by: Sam Ravnborg <sam@ravnborg.org>

Thanks, Sam.

>=20
> 	Sam
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--avYabaiIsilsmEERrCxPEsPKVTzH4KgQm--

--wuNzd44fP2Hdu4qJiH67brDECmZsomrkm
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl3yFccACgkQaA3BHVML
eiPAAwf/b/icJzG9L+Q483FjSHuqsGZm3CgTIE3nh+DaA5elOUobxJ5JoEZRrbLc
iuR1xkFkEma63KWtbGMhuucIBNazh3YjSuvobVoKGB+kPsxC7y2Q6S3QFxhr9B7h
x+V9Ec+hlRswo22Naao+EkshSmlccvRPj2CvuXnDmqVVwVqd3HRnn10KnMUmZeOg
kIqGJBBvgrV6mWkEQLsabzPN3eyCMRJlWymV/uzAHy5wqb1ldVn3m0fv33WtTdc9
VSHz9/SR/m0wa9rcBQvpS8v2urpEDKAqe9FStLVF1sfJp5K+G/BuOgDi1zThvXMI
3v+U7jdYugW7uVzOzo+Wzka2I5NIhw==
=5859
-----END PGP SIGNATURE-----

--wuNzd44fP2Hdu4qJiH67brDECmZsomrkm--

--===============1909129206==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1909129206==--
