Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68EA3324D66
	for <lists+dri-devel@lfdr.de>; Thu, 25 Feb 2021 11:02:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E51A88401;
	Thu, 25 Feb 2021 10:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C4F6EC76;
 Thu, 25 Feb 2021 10:02:04 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 053EDAD57;
 Thu, 25 Feb 2021 10:02:03 +0000 (UTC)
Subject: Re: udldrm does not recover from powersave? Re: udldrmfb: causes WARN
 in i915 on X60 (x86-32)
To: Pavel Machek <pavel@ucw.cz>
References: <20210224200912.GA27905@duo.ucw.cz>
 <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de> <20210225095322.GA5089@amd>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <4fb31ea5-ef20-4752-4782-8d9f1afdf51d@suse.de>
Date: Thu, 25 Feb 2021 11:02:02 +0100
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
Content-Type: multipart/mixed; boundary="===============0290893199=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0290893199==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="X2DaQC4Il6WpjwIgQOqtq9KoVhMR3abcd"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--X2DaQC4Il6WpjwIgQOqtq9KoVhMR3abcd
Content-Type: multipart/mixed; boundary="YZM2H7jd4XgYHrxtiacqjh2tEUVmut4TL";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Pavel Machek <pavel@ucw.cz>
Cc: intel-gfx@lists.freedesktop.org,
 kernel list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 rodrigo.vivi@intel.com, airlied@redhat.com, sean@poorly.run
Message-ID: <4fb31ea5-ef20-4752-4782-8d9f1afdf51d@suse.de>
Subject: Re: udldrm does not recover from powersave? Re: udldrmfb: causes WARN
 in i915 on X60 (x86-32)
References: <20210224200912.GA27905@duo.ucw.cz>
 <452585d5-9d18-f5a8-9d6b-6d39aa037480@suse.de> <20210225095322.GA5089@amd>
In-Reply-To: <20210225095322.GA5089@amd>

--YZM2H7jd4XgYHrxtiacqjh2tEUVmut4TL
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

Did it work before the regression?

For testing, could you please remove the fix and then do

   git revert 6eb0233ec2d0

This would restore the old version. Please report back on the results.

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


--YZM2H7jd4XgYHrxtiacqjh2tEUVmut4TL--

--X2DaQC4Il6WpjwIgQOqtq9KoVhMR3abcd
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmA3dZoFAwAAAAAACgkQlh/E3EQov+Br
KxAAgPufHafAtmMNZlOnuAFEDBVUSZ387D84R7WQiL7IhVN/HAaO/NZ2/qdIoUelN404JwuEv73b
/gGqJAhq3HpCgJfMC1dzb8ZMlW9zMISrl1F9orlB41mAFk/VzVI/2gup4tEa1OW3Nz99XApZ8qTN
c4K4Qi+VfMLhL//h1Ft5BbZ8rF50MV9V2XAIldxGSkI6GoT3ATfP5mreTMGdjdXEIC7SK7fjoz0R
hBJMiY2gAdDJ0CoyKmMwaXc+iJt2QMDLWLrEiYSoQbt8x0FcsjTOLu6ATcRFiUBqyQfIqN5iR+R8
YWeUcWJdNweSHG1ExQUoRuTHUI5pRHioYfML6jENDgbrWfEPvgYCJ2aeDRoXgpRCauG2EyqxzjJ9
/bEuLI2U2rF2E/546DRTC91oZDCYWoKuSLrso/LtO7kRAROz+/KAcuf8fC1Q0AFyVilEekpyMKU/
wWxzZWLcQP21zwEw0XcIMvV3e8iK3NS/OsZb1coapec3E41MtyZgRM/dbEbsaC0GpW5sx77qbt51
hQDlXMR//LJa6oELZEEt80Mjg7H2R5aMeoyRKf2phpx3+SGwBFlkso+vhs2kcZ8Jy+k7mmsIxcxH
wjUIqhF2+JdoJSGZDQ8mSL+TpBJl6b6UNto79ANLhGomVSN5zotvVAwfd0Z/X0XucGajhoxQTH7W
1ZA=
=tm2M
-----END PGP SIGNATURE-----

--X2DaQC4Il6WpjwIgQOqtq9KoVhMR3abcd--

--===============0290893199==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0290893199==--
