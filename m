Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D1B41F747B
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jun 2020 09:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85BDC89E15;
	Fri, 12 Jun 2020 07:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4A71898C7
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jun 2020 07:12:58 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id 40C2FAB76;
 Fri, 12 Jun 2020 07:13:01 +0000 (UTC)
Subject: Re: [PATCH 3/3] drm/ast: Use per-device logging macros
To: Sam Ravnborg <sam@ravnborg.org>
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-4-tzimmermann@suse.de>
 <20200611192406.GB160102@ravnborg.org>
 <59164816-57b4-0279-56e9-a49a333ce839@suse.de>
 <20200612070137.GA172811@ravnborg.org>
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
Message-ID: <fa3f9331-e9cb-b43d-3972-9b6f18f1a85a@suse.de>
Date: Fri, 12 Jun 2020 09:12:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
In-Reply-To: <20200612070137.GA172811@ravnborg.org>
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
Cc: airlied@redhat.com, chen@aspeedtech.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, emil.velikov@collabora.com
Content-Type: multipart/mixed; boundary="===============1978006393=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1978006393==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="PaQs0gCA7AeohkE4SGOGLAL8iaxYcDOYT"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--PaQs0gCA7AeohkE4SGOGLAL8iaxYcDOYT
Content-Type: multipart/mixed; boundary="WyhDUSFXaDd6nG3hRCNxDtiJj26HzMExY";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: airlied@redhat.com, chen@aspeedtech.com, kraxel@redhat.com,
 dri-devel@lists.freedesktop.org, emil.velikov@collabora.com
Message-ID: <fa3f9331-e9cb-b43d-3972-9b6f18f1a85a@suse.de>
Subject: Re: [PATCH 3/3] drm/ast: Use per-device logging macros
References: <20200611082809.7838-1-tzimmermann@suse.de>
 <20200611082809.7838-4-tzimmermann@suse.de>
 <20200611192406.GB160102@ravnborg.org>
 <59164816-57b4-0279-56e9-a49a333ce839@suse.de>
 <20200612070137.GA172811@ravnborg.org>
In-Reply-To: <20200612070137.GA172811@ravnborg.org>

--WyhDUSFXaDd6nG3hRCNxDtiJj26HzMExY
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 12.06.20 um 09:01 schrieb Sam Ravnborg:
> Hi Thomas
>=20
> On Fri, Jun 12, 2020 at 08:28:40AM +0200, Thomas Zimmermann wrote:
>> Hi Sam
>>
>> Am 11.06.20 um 21:24 schrieb Sam Ravnborg:
>>> Hi Thomas.
>>> On Thu, Jun 11, 2020 at 10:28:09AM +0200, Thomas Zimmermann wrote:
>>>> Converts the ast driver to drm_info() and drm_err(). No functional
>>>> changes are made.
>>>>
>>>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>>> Acked-by: Sam Ravnborg <sam@ravnborg.org>
>>>
>>> I hope you will later follow-up with a patch that introduces drm_WARN=
_*.
>>
>> I only found DRM_INFO and DRM_ERROR calls. Did I miss any other warnin=
g
>> macros?
>=20
> The following:
> ast_mode.c:     if (WARN_ON_ONCE(gpu_addr < 0))
> ast_mode.c:     if (WARN_ON_ONCE(fb->width > AST_MAX_HWC_WIDTH) ||
> ast_mode.c:         WARN_ON_ONCE(fb->height > AST_MAX_HWC_HEIGHT))
> ast_mode.c:             if (WARN_ON_ONCE(off < 0))
> ast_mode.c:     if (WARN_ON(!crtc->state))

Thanks! I'll fix those.

Best regards
Thomas

>=20
> can benefit from:
>=20
> /*
>  * struct drm_device based WARNs
>  *
>  * drm_WARN*() acts like WARN*(), but with the key difference of
>  * using device specific information so that we know from which device
>  * warning is originating from.
>  *
>  * Prefer drm_device based drm_WARN* over regular WARN*
>  */
>=20
> ...
>=20
> #define drm_WARN_ON(drm, x)                                            =
 \
>         drm_WARN((drm), (x), "%s",                                     =
 \
>                  "drm_WARN_ON(" __stringify(x) ")")
>=20
> #define drm_WARN_ON_ONCE(drm, x)                                       =
 \
>         drm_WARN_ONCE((drm), (x), "%s",                                =
 \
>                       "drm_WARN_ON_ONCE(" __stringify(x) ")")
>=20
>=20
> Also from drm/drm_print.h
>=20
> 	Sam
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


--WyhDUSFXaDd6nG3hRCNxDtiJj26HzMExY--

--PaQs0gCA7AeohkE4SGOGLAL8iaxYcDOYT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl7jKvUACgkQaA3BHVML
eiOHGwf+OjCMen1FS2nX49A4ERxiZ8cwn491azBXaCy3L2/XWlICABgm/ghSkbid
SrcWjX/xtcV6sVReVsMH/lkoVTjAMXRxuu1LIb57/YByb/9JaGf/hyf8UrhDHv3g
AGz8sspcr6baAR/K6FFEEJfyCPu9Sj+VJH9nHWIbrW8sdbHFOcacRmbZhLTQL4iS
GFExv+3fhP2/m7rAWo/8MQEuIF5/Nu1HBORD2n3+3VqvaoyUGb9J+961YMPk+46R
KHadkUE2H4dgzofhGzTRSyj762jlVC7EbUXZS4bZIoKba0EHVJ6aiD4wru1u4TFB
yxqGDMfmmQb5UvJ0Eqp8p2AQMFU0og==
=Deia
-----END PGP SIGNATURE-----

--PaQs0gCA7AeohkE4SGOGLAL8iaxYcDOYT--

--===============1978006393==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1978006393==--
