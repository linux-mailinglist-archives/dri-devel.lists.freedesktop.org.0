Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9F363DABBE
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 21:18:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2EFC6EE35;
	Thu, 29 Jul 2021 19:18:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD0B6EE31;
 Thu, 29 Jul 2021 19:18:33 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id DE36B1FD6C;
 Thu, 29 Jul 2021 19:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1627586311; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARi7fzuP6PspqOeeSxIq7f++s/zF6k625nFKZfwFtBY=;
 b=KsG6VOhcgqdVeyqYhniNovQGNCc1rM1BVsnW7Tu3idQfSVON7/FrE7sBEhzvCfDf5fPPou
 r8p2JRdLAGbxUw6iboJ0UMMTNFpnqkV584up9x5KvJrd4nOkn3ZJ5bGxO0DVSI/c7CtBdV
 kM73nyRjX+p30DK+2gYtiSeONxj9sHw=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1627586311;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ARi7fzuP6PspqOeeSxIq7f++s/zF6k625nFKZfwFtBY=;
 b=PnOg9mOoda2BHjNEHphWHZ3PsVj5irQTGyAoXXZ+3hb2iy0d7cMsljAzjdkoG2nRRe8TQT
 UHhhtCs/na9gD1AQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 159FC13756;
 Thu, 29 Jul 2021 19:18:31 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id umyQAwf/AmFiaAAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 29 Jul 2021 19:18:31 +0000
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
To: Sam Ravnborg <sam@ravnborg.org>, Dan.Sneddon@microchip.com
References: <20210727182721.17981-4-tzimmermann@suse.de>
 <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
Date: Thu, 29 Jul 2021 21:18:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <YQG5+/9lPexU3Dn3@ravnborg.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="7KdZdn9qKKUSuKkMys46FDSsbCZWJFWg8"
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
Cc: airlied@linux.ie, liviu.dudau@arm.com, amd-gfx@lists.freedesktop.org,
 anitha.chrisanthus@intel.com, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, edmund.j.dea@intel.com,
 s.hauer@pengutronix.de, alison.wang@nxp.com, dri-devel@lists.freedesktop.org,
 sean@poorly.run, linux-arm-kernel@lists.infradead.org, tomba@kernel.org,
 bbrezillon@kernel.org, jyri.sarha@iki.fi, Nicolas.Ferre@microchip.com,
 christian.koenig@amd.com, kernel@pengutronix.de, alexander.deucher@amd.com,
 shawnguo@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--7KdZdn9qKKUSuKkMys46FDSsbCZWJFWg8
Content-Type: multipart/mixed; boundary="k8RKRzHP1SDzHIj8TPo5gmhRo3stMnzU2";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Sam Ravnborg <sam@ravnborg.org>, Dan.Sneddon@microchip.com
Cc: daniel@ffwll.ch, airlied@linux.ie, alexander.deucher@amd.com,
 christian.koenig@amd.com, liviu.dudau@arm.com, brian.starkey@arm.com,
 bbrezillon@kernel.org, Nicolas.Ferre@microchip.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, stefan@agner.ch,
 alison.wang@nxp.com, patrik.r.jakobsson@gmail.com,
 anitha.chrisanthus@intel.com, robdclark@gmail.com, edmund.j.dea@intel.com,
 sean@poorly.run, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, jyri.sarha@iki.fi, tomba@kernel.org,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Message-ID: <1df22406-2e91-c15a-49dc-1cf33522a142@suse.de>
Subject: Re: [PATCH 03/14] drm/atmel-hlcdc: Convert to Linux IRQ interfaces
References: <20210727182721.17981-4-tzimmermann@suse.de>
 <YQFi96yaYbTG4OO7@ravnborg.org>
 <e28b1a2f-015c-c81b-eb64-5323df9ed35d@microchip.com>
 <YQF7bKyeup8n3awU@ravnborg.org>
 <3d2f6b84-dd07-d925-a8b8-2bfd5fc736d9@microchip.com>
 <YQGdxtV0BGZ8VOpm@ravnborg.org>
 <2f04b986-6b41-62f9-1587-23818b841655@suse.de>
 <793514f6-0270-771b-fe36-f82edf4e5fd2@microchip.com>
 <YQGrMH36Udg3eKQY@ravnborg.org>
 <dcc5cd1e-d0de-bdda-32f3-623b85085756@microchip.com>
 <YQG5+/9lPexU3Dn3@ravnborg.org>
In-Reply-To: <YQG5+/9lPexU3Dn3@ravnborg.org>

--k8RKRzHP1SDzHIj8TPo5gmhRo3stMnzU2
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 28.07.21 um 22:11 schrieb Sam Ravnborg:
> Hi Dan,
>=20
>>>
>>> I think I got it - we need to set irq_enabled to true.
>>> The documentation says so:
>>> "
>>>            * @irq_enabled:
>>>            *
>>>            * Indicates that interrupt handling is enabled, specifical=
ly vblank
>>>            * handling. Drivers which don't use drm_irq_install() need=
 to set this
>>>            * to true manually.
>>> "
>>>
>>> Can you try to add the following line:
>>>
>>>
>>> +static int atmel_hlcdc_dc_irq_install(struct drm_device *dev, unsign=
ed int irq)
>>> +{
>>> +       int ret;
>>> +
>>> +       if (irq =3D=3D IRQ_NOTCONNECTED)
>>> +               return -ENOTCONN;
>>> +
>>>
>>>           dev->irq_enabled =3D true;                <=3D THIS LINE
>>>
>>>
>>> +       atmel_hlcdc_dc_irq_disable(dev);
>>> +
>>> +       ret =3D request_irq(irq, atmel_hlcdc_dc_irq_handler, 0, dev->=
driver->name, dev);
>>> +       if (ret)
>>> +               return ret;
>>>
>>> I hope this fixes it.
>>
>> It does!  With the irq_enabled line added everything is looking good.

Are you sure, you're testing with the latest drm-misc-next or drm-tip?=20
Because using irq_enabled is deprecated and the flag was recently=20
replaced by commit 1e4cd78ed493 ("drm: Don't test for IRQ support in=20
VBLANK ioctls").

Best regards
Thomas

>=20
> Great, thanks for testing.
>=20
> Thomas - I assume you will do a re-spin and there is likely some fixes
> for the applied IRQ conversions too.
>=20
> Note - irq_enabled must be cleared if request_irq fails. I did not
> include this in the testing here.
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


--k8RKRzHP1SDzHIj8TPo5gmhRo3stMnzU2--

--7KdZdn9qKKUSuKkMys46FDSsbCZWJFWg8
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmEC/wYFAwAAAAAACgkQlh/E3EQov+B2
7Q//UVCwvB5dM0KBGIxYZP4EX3WE120wH55oAGYqSC297HYUYtiK0ao/Tnl3VjwrBTpVtys/tufE
Ytjsrbt3HqISjsU+ii3u87Ep/0p6Fd6RfqjH8JzzRSt8COjfNPdAGmlyugZvS0fwfywgZw/4FCP6
dg0Jhzft+YzF3XsF8I3/2C+xOGlV/85T2OY+WHNLjXfrD8Q4YaK+0Kd05P/HIIJscHeR/ttRsmdB
WyxCwb1wiYYfNb2lfet/slXQo5LqSSVZwsO06DDFxg6PvrhMls7mB+q8jZnsMJ3llI7NQm9UXkn/
Qy2fGTBQIcgI7n2avq7cBEwdRMupuqCli43/tk+TLGJuiKoa/dT8e88E+ktm6zCIDq9/qv0I1JyU
o7ccJI6aVI8fgQROHEPkBXqnZgDFAPJMnejjErb7mLvfCdrPb1E0yTH1yHlu3hAqA+BTWUsxD+HQ
AYWEK07ne2rn7x5rzJivWXvZBaFzf3RqU5SO0h+pjLW0Reez3l8AlvXwt/rjdug0TtEpNv0J9XyV
1hnCNvBn24cQ2TrL0ETZ9GNljADsV416eECymXsLG2/A8sescEJ6LVjjXTaMo12G/1rlduaBSF5U
JWMQR7qWFMRmfU/xaN+ccZXxe+JwWAfsnhRWmuDYgUWyQXparjHKTUshRg+BmBvB+Sl9CIFhDYln
Duw=
=lqN7
-----END PGP SIGNATURE-----

--7KdZdn9qKKUSuKkMys46FDSsbCZWJFWg8--
