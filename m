Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5383F7571
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 14:56:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A54D4899A7;
	Wed, 25 Aug 2021 12:56:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67D70899A7
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 12:56:24 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C916121F19;
 Wed, 25 Aug 2021 12:56:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629896182; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yvA6tAh6I0oSBfIwCIRyevnaIUHyjh8MsooWV2QRBZM=;
 b=KES+MoZc0CDPaJ2jkwEqN9fRfp5EDlLFNct4i3O+WgELiWjxg5h6lhpJZp5+czzo9YF/S4
 vW0viJLc09SWEjoaXtXMu3UM4gKqx9sAs/OWoqfxlsOtVf6G+eR7n9I+X8uLl95DjmG27V
 f35FrV0gGey1YJxzOClGLxRq36rAb0c=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629896182;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yvA6tAh6I0oSBfIwCIRyevnaIUHyjh8MsooWV2QRBZM=;
 b=gR2lHvo9xcWNGDx9Htjik4hAVsDSxJE1g2xnw4me6YX+mTAbwLPSRp+aJ0sjIvLruIGLmu
 Qvp6OAR57+zyLiDw==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id B3A9313887;
 Wed, 25 Aug 2021 12:56:22 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id rtjDKvY9JmGcMwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Aug 2021 12:56:22 +0000
To: Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
Message-ID: <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
Date: Wed, 25 Aug 2021 14:56:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="EufKAshwY5ymAozO3GjSFt5HKMCj74Q4r"
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--EufKAshwY5ymAozO3GjSFt5HKMCj74Q4r
Content-Type: multipart/mixed; boundary="WNmYeXMtvfuUTsKmSHQaSxHKvZ8rDuKAA";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
In-Reply-To: <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>

--WNmYeXMtvfuUTsKmSHQaSxHKvZ8rDuKAA
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.08.21 um 20:17 schrieb Amanoel Dawod:
>=20
> Thanks for your reply.
>=20
> This is on x86 platform. Specifically, Gigabyte B450i board with AMD Ry=
zen 3400G
> (integrated graphics). Up to date bios version.
>=20
> Resolution is 3840 x 2160.

Simpledrm is probably slow with this resolution, but that's an unrelated =

issue.

>=20
> Please find attached dmesg output related to DRM as requested.
>=20

I hope to get one of the internal debug error messages that
  the DRM console prints.

In the attached log, the amdgpu driver is too noisy. Would it be=20
possible to disable the amdgpu and radeon drivers for this test? So only =

simpledrm should be active. Likely this doesn't produce any graphical=20
output and you may have to be able to login remotely to get the log.

Best regards
Thomas

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--WNmYeXMtvfuUTsKmSHQaSxHKvZ8rDuKAA--

--EufKAshwY5ymAozO3GjSFt5HKMCj74Q4r
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEmPfYFAwAAAAAACgkQlh/E3EQov+Bo
vg/+MhO83i00bMOlYKKS/HT/iCy9jxmapUJ2Q083dR8BPHAJqnrUwQW12CjXZVC3kqb29J6DoBWY
ucTUNbl9jSp/9ZfThUKAwjVf3sB+gazWZjBhSvggpTcxB7b7qbB4orXops4y1xzn/tDLQfa7+gNF
W9cN60ySZLZBRjZUJPnTSuoHW29aiI6TQey1QxkAqu4UaX+Ju3TG0o8Rm0QfZ1IjbYJYeYAMNuYp
jgyAIzN1efNmbkE+PKNsX9Bs52cZ+JBGIedWnT9h6/8Y8LWjuExnYrlukLsDhbYI4hnQERldBfgh
ybjqxcyj+afLJtlT5xtn24p/CkaIMwRr87EeChTSxUnMLc+3Qnqf+AKtKDdnyPShqYzmg62im9kW
MCBKsV81Em8W0F5IhnaII93KNNrlH9xiI1PusEUmuUGfWx/FdCbMfibiAn8SPmHVbNf9HXlWHobO
n8YWfmigR8iZ0AqtAF3RmgrwaVLhb8vldqS2oeQ1Vpci8Qh1ihoSmKaUCQtGqJkzD4tAUOT7uzuI
4IlKIaxoXtTDv8e4rp/cLVRj6ELGh5IUzUJivBwsQuhPI8lz7P4/FuNU/+YIMiXUG+8yRGu10Q6C
2yodB1My9nX5Cb3UroopKhlwzXqpqFDhx7xwrad6wSg6QhkukALdi3flkxH/aY9SFpnGLkpPPFIW
WSs=
=neXW
-----END PGP SIGNATURE-----

--EufKAshwY5ymAozO3GjSFt5HKMCj74Q4r--
