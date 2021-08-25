Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E47C3F7BFD
	for <lists+dri-devel@lfdr.de>; Wed, 25 Aug 2021 20:02:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1616A6E400;
	Wed, 25 Aug 2021 18:02:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAD46E408
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 18:02:49 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 9F29120136;
 Wed, 25 Aug 2021 18:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1629914567; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=02mROBSNtuVmN1YKGZjTrCufvt1t0M72LRmSlyZ4s5s=;
 b=Z0rDg8dS+Tvv7D4j0yaIZ4Iy2kJqgrP4OTcocekvtSHnKSW8p5WxV7RKmPLZzs61H5M6yY
 zwPqJsTk0ca5f5/sK8H0o0M88wt0/TAeCEuji6GpT/XH5mJUsg5ZZHCqhm8Ly0hxdSY4vM
 NBZMasFJeMXqgyNOsmybh//Y6QCPqpo=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1629914567;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=02mROBSNtuVmN1YKGZjTrCufvt1t0M72LRmSlyZ4s5s=;
 b=IfRZocIKtxEbgrpp/qNkgxZa6UTq47vBv8c2ny420MVp7BHjTiA7IFNNGxTKmYzb1GO1F0
 ovQuQgha8FBO0YCQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 85D6813A8D;
 Wed, 25 Aug 2021 18:02:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id LSUCH8eFJmFedwAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Wed, 25 Aug 2021 18:02:47 +0000
To: Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
Message-ID: <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
Date: Wed, 25 Aug 2021 20:02:46 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="pUUhFK9X4LLnoXiGzMA3LIDJMqcLjxNRl"
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
--pUUhFK9X4LLnoXiGzMA3LIDJMqcLjxNRl
Content-Type: multipart/mixed; boundary="UbP0MMq8qoyYQ7c21QKtO1Rm4lrz0MTte";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Amanoel Dawod <kernel@amanoeldawod.com>
Cc: dri-devel@lists.freedesktop.org
Message-ID: <7486abc7-ce39-915f-b697-b9adb356f98f@suse.de>
Subject: Re: drm: simpledrm: fbdev emulation error with CONFIG_DRM_SIMPLEDRM
 enabled
References: <5186020a-192f-4e04-adc2-25a34305fea6@www.fastmail.com>
 <e80ae664-7184-69dd-5e6e-e228c720bb85@suse.de>
 <2ec3ae15-e8d7-4db3-baef-04b8ab9dc467@www.fastmail.com>
 <e3343649-a96d-7306-67d0-5f8fc9427429@suse.de>
 <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>
In-Reply-To: <ab196ef1-44d5-4aef-a1ab-e43bed2a87e4@www.fastmail.com>

--UbP0MMq8qoyYQ7c21QKtO1Rm4lrz0MTte
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.08.21 um 18:01 schrieb Amanoel Dawod:
> On Wed, Aug 25, 2021, at 8:56 AM, Thomas Zimmermann wrote:
>> In the attached log, the amdgpu driver is too noisy. Would it be
>> possible to disable the amdgpu and radeon drivers for this test? So on=
ly
>> simpledrm should be active. Likely this doesn't produce any graphical
>> output and you may have to be able to login remotely to get the log.
>>
>> Best regards
>> Thomas
>>
>=20
> Please find attached dmesg log without amdgpu/radeon drivers.
>=20

Oh, now simpledrm itself fills up the log with pointless messages. :/=20
Looking at the file, there's plenty of Gnome buffer swapping. I suspect=20
that Gnome works? It's just the console that's not available?

Could you please boot directly into a text terminal? That should be=20
possible by adding systemd.unit=3Dmulti-user.target to the kernel command=
=20
line if your distro uses systemd. Due to the issue, you probably won't=20
see anything on the screen, so you may need remote access.

Thanks for your help with debugging and sorry for sending you through so =

many hops.

Best regards
Thomas

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--UbP0MMq8qoyYQ7c21QKtO1Rm4lrz0MTte--

--pUUhFK9X4LLnoXiGzMA3LIDJMqcLjxNRl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEmhcYFAwAAAAAACgkQlh/E3EQov+Ce
5hAAtbetf6sJxvYbK22Qb049PD2/JajEvxIiYxXNJPQqZFlfLBjMwQtGS3p5BcXTfslijI3TW3kq
6JLIZ0rdCO4p5bFF0V6LnSnKc19B95dWeLtgyvN1S/NBWuRcNtUXQdvWdT5XzjsB+kgxCmUimdVB
o27c5hfP6vy4kxcRWXS1Pams0WBlqHhKiezoIHzcVdBwQBqlkK6H57UnqLbD+ylTDt+u5MryV8IS
19sWUTmPa4SfT5G7HgicVQbiIT3T2CbfEvVjDehWc88r93Dw+nX5GxCxGrV3abe5g0mPkDUDc7kO
wRjwUhvjgrVJgXl9bztBXU3RfCRp+V0QJ8S0wB/iBo8DU1E0adl0MWK9/SPSsBDH2R8E+0nsVhj8
FX9x2J0dV1JGq9OlUU/zk53AjaJTgPDdtF3J2OPn4eKsPimLBmO3j1KAQwZ+p2rRbjDFboPlLfLN
ZLCe8t3oCoDYnGWv7MM/dUfOvTnzRqoj8KElmZcNrVRdgmqVk6OsXRd5oI9gm6wEhg2qlVwdaJ+L
8ipXiqDbH3HduhBSZmm0+m3C5BwlllcUaiB4CaeIW1EG2d0+zt04w9NQa9P2oMIvR4F5KNpWHDVc
+JPUrb9MtQn7sNgJb6ytEykXzNzrRJJA6woO58qGSY3dpfoCSX3J+yZF9zyLDrGDcaLraoEtSxyt
qME=
=QKg2
-----END PGP SIGNATURE-----

--pUUhFK9X4LLnoXiGzMA3LIDJMqcLjxNRl--
