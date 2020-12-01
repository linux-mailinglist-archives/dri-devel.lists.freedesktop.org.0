Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4212C9E6A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Dec 2020 10:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5C806E4CF;
	Tue,  1 Dec 2020 09:58:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B34EC6E4CF
 for <dri-devel@lists.freedesktop.org>; Tue,  1 Dec 2020 09:58:15 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 2F6E3AC65;
 Tue,  1 Dec 2020 09:58:14 +0000 (UTC)
Subject: Re: [PATCH v2 08/28] video: fbdev: sis: Fix defined but not used
 warning of SiS_TVDelay
To: Sam Ravnborg <sam@ravnborg.org>
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-9-sam@ravnborg.org>
 <2b2809ab-a9ab-cf6d-248d-828ca584bdee@suse.de>
 <20201130190132.GB1502362@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <ebca0264-00e3-676d-c1f1-40e9fbbbae81@suse.de>
Date: Tue, 1 Dec 2020 10:58:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201130190132.GB1502362@ravnborg.org>
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
Cc: linux-fbdev@vger.kernel.org, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>, Lee Jones <lee.jones@linaro.org>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap <rdunlap@infradead.org>,
 Gustavo Silva <gustavoars@kernel.org>, Peilin Ye <yepeilin.cs@gmail.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>, Jingoo Han <jingoohan1@gmail.com>,
 Joe Perches <joe@perches.com>, Peter Rosin <peda@axentia.se>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: multipart/mixed; boundary="===============0531810285=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0531810285==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="NRbffqMogAfFUElMvRsOiHmPs9btjWeEX"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--NRbffqMogAfFUElMvRsOiHmPs9btjWeEX
Content-Type: multipart/mixed; boundary="yNgj5c9ZvHxjjDrhmXedYdfhnGovl1hBl";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Lee Jones <lee.jones@linaro.org>, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Florian Tobias Schandinat <FlorianSchandinat@gmx.de>,
 Evgeny Novikov <novikov@ispras.ru>,
 Saeed Mirzamohammadi <saeed.mirzamohammadi@oracle.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thomas Winischhofer <thomas@winischhofer.net>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Aditya Pakki <pakki001@umn.edu>,
 Xiaofei Tan <tanxiaofei@huawei.com>,
 Nathan Chancellor <natechancellor@gmail.com>,
 Alex Dewar <alex.dewar90@gmail.com>, Jason Yan <yanaijie@huawei.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Qilong Zhang <zhangqilong3@huawei.com>, Randy Dunlap
 <rdunlap@infradead.org>, Gustavo Silva <gustavoars@kernel.org>,
 Peter Rosin <peda@axentia.se>, George Kennedy <george.kennedy@oracle.com>,
 Kristoffer Ericson <kristoffer.ericson@gmail.com>,
 Alexander Klimov <grandmaster@al2klimov.de>,
 Jingoo Han <jingoohan1@gmail.com>, Joe Perches <joe@perches.com>,
 Peilin Ye <yepeilin.cs@gmail.com>, Mike Rapoport <rppt@kernel.org>
Message-ID: <ebca0264-00e3-676d-c1f1-40e9fbbbae81@suse.de>
Subject: Re: [PATCH v2 08/28] video: fbdev: sis: Fix defined but not used
 warning of SiS_TVDelay
References: <20201128224114.1033617-1-sam@ravnborg.org>
 <20201128224114.1033617-9-sam@ravnborg.org>
 <2b2809ab-a9ab-cf6d-248d-828ca584bdee@suse.de>
 <20201130190132.GB1502362@ravnborg.org>
In-Reply-To: <20201130190132.GB1502362@ravnborg.org>

--yNgj5c9ZvHxjjDrhmXedYdfhnGovl1hBl
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 30.11.20 um 20:01 schrieb Sam Ravnborg:
> Hi Thomas.
>=20
> On Mon, Nov 30, 2020 at 10:13:05AM +0100, Thomas Zimmermann wrote:
>>
>>
>> Am 28.11.20 um 23:40 schrieb Sam Ravnborg:
>>> Fix W=3D1 warning by commenting unused SiS_TVDelay* variables.
>>>
>>> The SiS_TVDelay* variables seem to contain some magic numbers
>>> so looks like data worth keeping around but not as code we build.
>>
>> I would remove it. sisfb is broken beyond repair and no one's going to=
 try
>> to use it anyway. In any case
>>
>> Acked-by: Thomas Zimemrmann <tzimmermann@suse.de>
>=20
> Thanks for your patience pointing out all my spelling and grammar error=
s.
> I once had codespell set up to catch some of this, will need to do so
> again.
>=20
> Ironically I copied the above "Acked-by:" line to most of the commits
> and just noticed it had a spelling error :-)

Perfect! :D

>=20
> I have applied everything that you acked and will push when
> I have fixed the above and verified I did not break anything.
> Will post a v3 with the remaining patches later.
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


--yNgj5c9ZvHxjjDrhmXedYdfhnGovl1hBl--

--NRbffqMogAfFUElMvRsOiHmPs9btjWeEX
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAl/GE7EFAwAAAAAACgkQlh/E3EQov+CR
1RAA0V5kqLWnj1ANMrgxvARswJ5AYSx9jeJOPzR3UMQhaA+6wJ1/SYfStHdN4JstreNKFZpf0zUe
WRtjdJYebkaMZMQzEs0qyXDmZGiHCClvCLDcrRmfuEweAWarTGNRu6gpFK9n0HDq3KK4qIgvqHdl
Tcl60sTCiHnxODp253q/DN7ZWndOiQSJ9VL5zu+YvA2DFXVZ0ad2p0ZQpdu9FHQU6yaszhkSRkMS
Jx16Gq82JpRtmadmzA9Gq2j/q2CY/sxeAeFNLgPmJhTX/xxxFmZlfQs3DQ/N8/G1EsZSrxKXgNRd
g2O3EmhoLLwU9VlJ9WJR12yaNZR9/gGaKPZnxHxkAylJUxvSkqmmfk+/fB5p3F31IlBN/d4iMLhV
vl+HjqHFs2svim53diCUoqJ9cZdi42o0t4Tt1AiTC7+9H8AHhhWFo8k2Q369XF6+dCq9AI182+bk
LqtwOXckyyIddJeS106sgoJ6S9KFRZ1qtMRVxLEAj/Jh6mCKUcJAy68OMWeWY8zv0WUQYK6ejstq
10ZOSwh19SUalA+R12fuNZVpUP7hsVgjrdtBOAl8JKZ80QdZyFDSx66X911mPGHvpYCBiGVE0B0Q
5QOjhj4aNWWPuP5zW6GA9l9xLr0aLZnXAxceemK0c4EzQ36SZ3Al0T+H5qvFRe6z3VIcj5KMxWJ1
pfs=
=oZNT
-----END PGP SIGNATURE-----

--NRbffqMogAfFUElMvRsOiHmPs9btjWeEX--

--===============0531810285==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0531810285==--
