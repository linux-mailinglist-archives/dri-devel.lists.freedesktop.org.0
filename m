Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 832903C14A5
	for <lists+dri-devel@lfdr.de>; Thu,  8 Jul 2021 15:48:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A9D6E056;
	Thu,  8 Jul 2021 13:48:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC3796E056
 for <dri-devel@lists.freedesktop.org>; Thu,  8 Jul 2021 13:48:21 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 7A32522386;
 Thu,  8 Jul 2021 13:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1625752100; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MAkLkcemREm+lrBukA5TYpxggBw7GUW1D7NBfa4F72U=;
 b=NINyR7DM+IfbtVaL6lnf1KtWMiox4H1RdwjiCritwMc/vJ4Nj+/dFYhPHqNa32yXe/381R
 tAYvjPlojsbRjUPT+8KBUGuQ/J57mHYh/Hli/1Uk9WO8yylNl0BHI8NyE+HdU0GHGei5sG
 EZFhYogVJJTxYqV8Y3R1zGXIuOP+xhw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1625752100;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MAkLkcemREm+lrBukA5TYpxggBw7GUW1D7NBfa4F72U=;
 b=OXqiJrJXjv0CfnderL6u+BI69zdtDVpXuspJz83apOUa0c4nQNHtzYT/FSHPNyH1L/rTKk
 UxS5SLvtBtEs/PCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 4B60E13B00;
 Thu,  8 Jul 2021 13:48:20 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id A+FXESQC52BLcgAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Thu, 08 Jul 2021 13:48:20 +0000
Subject: Re: [PATCH] drm/meson: Convert to Linux IRQ interfaces
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
References: <20210706074545.8763-1-tzimmermann@suse.de>
 <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <248d2ec3-eb13-7e6b-8f8d-567988e4067f@suse.de>
Date: Thu, 8 Jul 2021 15:48:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="2wt4mlFKmwNWomYFLP8pknF4t058Wy6vq"
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
Cc: Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--2wt4mlFKmwNWomYFLP8pknF4t058Wy6vq
Content-Type: multipart/mixed; boundary="WO76d9LKIKCRnzgXKc77r8vHUvzgCnUAD";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>, airlied@linux.ie,
 khilman@baylibre.com, dri-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 jbrunet@baylibre.com
Message-ID: <248d2ec3-eb13-7e6b-8f8d-567988e4067f@suse.de>
Subject: Re: [PATCH] drm/meson: Convert to Linux IRQ interfaces
References: <20210706074545.8763-1-tzimmermann@suse.de>
 <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>
In-Reply-To: <CAFBinCAio=-Lj=xQJ-EBXnhw1ygyyRv6M0cDZcod5NZO3YqcTQ@mail.gmail.com>

--WO76d9LKIKCRnzgXKc77r8vHUvzgCnUAD
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 08.07.21 um 15:31 schrieb Martin Blumenstingl:
> Hi Thomas,
>=20
> On Tue, Jul 6, 2021 at 9:45 AM Thomas Zimmermann <tzimmermann@suse.de> =
wrote:
>>
>> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>> don't benefit from using it.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Tested-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> and also (although I am no drm subsystem expert):
> Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
>=20

Oh, just when I committed the patch. But thanks for your reply.


> [...]
>> -       ret =3D drm_irq_install(drm, priv->vsync_irq);
>> +       ret =3D request_irq(priv->vsync_irq, meson_irq, 0, drm->driver=
->name, drm);
> I'd like to use dev_name(dev) instead of drm->driver->name in the
> future as that'll make it much easier to identify the corresponding
> IRQ in /proc/interrupts for example
> your patch makes this possible - thanks for this!

I also thought about this, but every driver in DRM and apparently most=20
drivers in general pass the driver's name here. I think the change would =

make a lot of sense, but it's probably worth a kernel-wide effort.

Best regards
Thomas

>=20
>=20
> Best regards,
> Martin
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WO76d9LKIKCRnzgXKc77r8vHUvzgCnUAD--

--2wt4mlFKmwNWomYFLP8pknF4t058Wy6vq
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDnAiMFAwAAAAAACgkQlh/E3EQov+B5
Wg/8CWkpUGkNltHOYEPmJqBvQbagB09fuF1j0Sp/qPJ3+dBmYx+ZQpwUv0/n9dwH+lFEiongrj/+
PqZeRiRmN4345mgxy29AqUoeoghfuHdU0VoOeKcvJWI8uBtO3yuOyvOZLQovynWKRdohBPw4sYtr
BfIq6p/rjOh91Lmv2HWPRCzWs1UVpZ9+uGhSQrVP+Mmx9UiHgQ74LqULMBGInljWLULWlpWF3Wo3
yMXCZfcRQ8/j1u49upjaOoCtGZlcZVa8La98ECG32Hu0Ofy3Kd5y3rKAVBSTVq9owYolTnVl3udD
JSFPExmW+QaXgelrLJYHwS29OZQyZUE/iE3A7dNoQQeM9rAn8cGGWs4zbuh8wVHivUMFfNz2G3E8
b8ooZP6GT4h/CJ3oCs9P32bFF5VF9OwGHI8RfYmBEG4005S7ywyonZbPaZHPeT1i3gjz0mNiYHta
4n3r35nNacM1MPhpwt37DiBaStZ17r1ozABZmleQpx4dL8O822qmoMOUfhvS3EQc9mS/qZsMjcRS
JatfbK5FNljpeDa71pZUORLx7qpuiN0iqDlH9MUi08KlFy/usm6VLSIa5KYsTqrcPz4E4B6y5plp
tMwbLaqiYN0kZOHIbJ9SLw5EBjJ4Zs7psjdstagfZe1wIXGpT2q6YRd/k/Z92ntU5cdmJepmEstY
Ay0=
=zUAy
-----END PGP SIGNATURE-----

--2wt4mlFKmwNWomYFLP8pknF4t058Wy6vq--
