Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E028A204DB9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jun 2020 11:19:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB7B6E985;
	Tue, 23 Jun 2020 09:19:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E0A36E418
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jun 2020 09:19:21 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 75E15B03B;
 Tue, 23 Jun 2020 09:19:19 +0000 (UTC)
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
To: Deepak Rawat <drawat.floss@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622151913.GA655276@ravnborg.org>
 <ea38c268-01e6-e43e-343d-a413142d450f@suse.de>
 <2699290fb7ab566987da8f648a9234c6a4fbc24e.camel@gmail.com>
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
Message-ID: <215ad0dc-64ed-939e-5eee-e4b1b6cefe74@suse.de>
Date: Tue, 23 Jun 2020 11:19:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <2699290fb7ab566987da8f648a9234c6a4fbc24e.camel@gmail.com>
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
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser <jloeser@microsoft.com>,
 Wei Hu <weh@microsoft.com>, K Y Srinivasan <kys@microsoft.com>
Content-Type: multipart/mixed; boundary="===============1807753581=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1807753581==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="B6nPgP0u8ekIr8pgfFX1H4OZIjK39tzgG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--B6nPgP0u8ekIr8pgfFX1H4OZIjK39tzgG
Content-Type: multipart/mixed; boundary="zfw343xoU3AzHKa6HTwJKTEFqTqX2BbHT";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Deepak Rawat <drawat.floss@gmail.com>, Sam Ravnborg <sam@ravnborg.org>
Cc: linux-hyperv@vger.kernel.org, Stephen Hemminger <sthemmin@microsoft.com>,
 David Airlie <airlied@linux.ie>, Haiyang Zhang <haiyangz@microsoft.com>,
 Wei Liu <wei.liu@kernel.org>, dri-devel@lists.freedesktop.org,
 Michael Kelley <mikelley@microsoft.com>, Jork Loeser
 <jloeser@microsoft.com>, Wei Hu <weh@microsoft.com>,
 K Y Srinivasan <kys@microsoft.com>
Message-ID: <215ad0dc-64ed-939e-5eee-e4b1b6cefe74@suse.de>
Subject: Re: [RFC PATCH 1/2] drm/hyperv: Add DRM driver for hyperv synthetic
 video device
References: <20200622110623.113546-1-drawat.floss@gmail.com>
 <20200622110623.113546-2-drawat.floss@gmail.com>
 <20200622151913.GA655276@ravnborg.org>
 <ea38c268-01e6-e43e-343d-a413142d450f@suse.de>
 <2699290fb7ab566987da8f648a9234c6a4fbc24e.camel@gmail.com>
In-Reply-To: <2699290fb7ab566987da8f648a9234c6a4fbc24e.camel@gmail.com>

--zfw343xoU3AzHKa6HTwJKTEFqTqX2BbHT
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 23.06.20 um 11:12 schrieb Deepak Rawat:
> On Tue, 2020-06-23 at 09:59 +0200, Thomas Zimmermann wrote:
>> Hi Deepak
>>
>> I did not receive you pat series, so I can only comment on Sam's
>> reply.
>> See below for some points.
>=20
> Hi Thomas, Thanks for the review. I wanted to add you in cc list but
> messed it up with final git send-email. Sorry about that. I am not sure=

> why you didn't received it via dri-devel. The patch series do show up
> in dri-devel archive. I wonder if other people also have similar
> issues.

I think it's related to a problem on my side. Some of my email
infrastructure was not available over the weekend.

Best regards
Thomas

>=20
>=20
>>>>
>>>> +	struct hv_device *hdev;
>>>> +};
>>>> +
>>>> +#define to_hv(_dev) container_of(_dev, struct hyperv_device,
>>>> dev)
>>
>> Could this be a function?
>=20
> Is there a reason to use a function here?
>=20
>>
>>>> +
>>>> +/* -----------------------------------------------------------
>>>> ----------- */
>>>> +/* Hyper-V Synthetic Video
>>>> Protocol                                       */
>>
>> The comments look awkward. Unless this style has been used within
>> DRM,
>> maybe just use
>>
>>  /*
>>   * ...
>>   */
>>
>=20
> This style is copy-paste from cirrus, and bochs also have same style.
> Perhaps historical. Anyway I agree to I should get rid of this.
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


--zfw343xoU3AzHKa6HTwJKTEFqTqX2BbHT--

--B6nPgP0u8ekIr8pgfFX1H4OZIjK39tzgG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7xyRQACgkQaA3BHVML
eiOr4Af/QHNBylMCn5mX6VPxXHsRbGDMgQawCEY9wG5TvVOze7v3eEGr7lVnW/Bf
Z59w6M4XiRatWz5TRiB1FuZMB+Vdf4kSLtS8FQZolEU2/8diTyYKQYhOBmm8Y92f
jrUyaKurOJBA8aTi73OqxWkZgSIyTsjPPuIglklnF46Dgd53vnyZ4BVojh8AZO66
Egsf63P6iz4m98TyYgD2N/y+UkOGmXc5F5xYfaGpEPWNxArWx4euM0f5mnNHelwM
AtLUWIh1CG1dbFORWlDIXkbTh1F2VCYxAi6pSgVx8aH6SzNz1Fx1C7bz7OkLbHix
9ekfyZY8KtX7LTPvEBhlGnP8mu+5sQ==
=za5W
-----END PGP SIGNATURE-----

--B6nPgP0u8ekIr8pgfFX1H4OZIjK39tzgG--

--===============1807753581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1807753581==--
