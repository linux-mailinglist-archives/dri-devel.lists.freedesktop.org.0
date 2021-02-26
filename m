Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E011325F69
	for <lists+dri-devel@lfdr.de>; Fri, 26 Feb 2021 09:48:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD2EF6E902;
	Fri, 26 Feb 2021 08:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13FFB6E8FC;
 Fri, 26 Feb 2021 08:48:12 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 93B73ACD4;
 Fri, 26 Feb 2021 08:48:10 +0000 (UTC)
Subject: Re: udldrm does not recover from powersave? Re: udldrmfb: causes WARN
 in i915 on X60 (x86-32)
To: Pavel Machek <pavel@ucw.cz>
References: <20210224200912.GA27905@duo.ucw.cz>
 <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de> <20210225095322.GA5089@amd>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ece8d515-5de1-6303-e62e-8ab7bce61102@suse.de>
Date: Fri, 26 Feb 2021 09:48:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210225095322.GA5089@amd>
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
Cc: intel-gfx@lists.freedesktop.org, kernel list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, airlied@redhat.com,
 sean@poorly.run
Content-Type: multipart/mixed; boundary="===============0909774966=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0909774966==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="R9SctC0uQGGWA18ld3uV2EUoWdWXbdHcF"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--R9SctC0uQGGWA18ld3uV2EUoWdWXbdHcF
Content-Type: multipart/mixed; boundary="5YbiRPKFIGwMzBdTT84emkODExBeeAPmC";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pavel Machek <pavel@ucw.cz>
Cc: intel-gfx@lists.freedesktop.org,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, airlied@redhat.com, sean@poorly.run
Message-ID: <ece8d515-5de1-6303-e62e-8ab7bce61102@suse.de>
Subject: Re: udldrm does not recover from powersave? Re: udldrmfb: causes WARN
 in i915 on X60 (x86-32)
References: <20210224200912.GA27905@duo.ucw.cz>
 <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de> <20210225095322.GA5089@amd>
In-Reply-To: <20210225095322.GA5089@amd>

--5YbiRPKFIGwMzBdTT84emkODExBeeAPmC
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.02.21 um 10:53 schrieb Pavel Machek:
> Hi!
>=20
>>> This is in -next, but I get same behaviour on 5.11; and no, udl does
>>
>> Thanks for reporting. We are in the process of fixing the issue. The l=
atest
>> patch is at [1].
>>
>=20
> Thank you, that fixes the DMA issue, and I can use the udl.
>=20
> ...for a while. Then screensaver blanks laptop screen, udl screen
> blanks too. Upon hitting a key, internal screen shows up, udl does
> not.
>=20
> I try rerunning xrandr ... --auto, but could not recover it.
>=20
> Any ideas?

Seems unrelated. I tested for the issue with the last good revision and=20
with the latest fix applied. I use Gnome/X11.

With both kernels, the udl adapter's display came back after suspending. =

So I'd attribute the problem to something else.

Best regards
Thomas

>=20
> Best regards,
> 								Pavel
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
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--5YbiRPKFIGwMzBdTT84emkODExBeeAPmC--

--R9SctC0uQGGWA18ld3uV2EUoWdWXbdHcF
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA4tcQFAwAAAAAACgkQlh/E3EQov+Ci
ng//WJBJQMFY2/H+nPFNVaVndjuuoD5EU9nKdbgzA8jvKxHcbFVkcGieeUvFZydB3yEC80UYioes
YF5KaWKtAAt4BqiIR+s1afZ64dWXXtfy2/40ynpkd7bSwotj9B6T614avMu/4N3B+++oeB8l6Kkh
ejo1CcNzxLM2P8k1gzxDSzdz9R+to3cKPe8hGw9TnQs5SVU5uOkLPwp3upO4/UrVhG5y2xBV0V0m
l72f/aXUx/zH37EEMPdv4O/YkWfwYl4j0LY/TCxY72kKO0ACyGmtB4hbqysLHQYlPR/0gF++BU9f
nNjWVjS4lUx9dEyxKsssGP5pu6QA/3ReGhZY65gaNvxe+Czo1sLaljoY/fuTZH+LGyVAkVKzY+zw
910fw5LR+hgalsfBzt2URyYxbZ2JRISSLZNaGt3pw/zYFO/sWpulVdsJydTG40bg0OaUlixFRxWi
9AiSk605jtBlYAGz9EnKVQOXvGtI+dIkwMTVOiqj4o/LT48rDOjm5yQAt9zdcSrS6lHAtFXC7LAw
BnXzhnW3jjxlHt/tc9r5YSwFH0Fg706nQbOn6Df3YZVjk6ByvdvzgNV0iYPygwrqSq4l0f5m/F2O
+HPPtahhFB8JCEJTA/xGqAkFUZ6ESaoY7UE/S0CS8k0WuMJemJB4XqEt48shQUKhnUITYat6GY7K
OSI=
=E5MT
-----END PGP SIGNATURE-----

--R9SctC0uQGGWA18ld3uV2EUoWdWXbdHcF--

--===============0909774966==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0909774966==--
