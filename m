Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E94227A880
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 09:25:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84A456E2E1;
	Mon, 28 Sep 2020 07:25:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA8D6E2E1
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 07:25:14 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 430EFABC1;
 Mon, 28 Sep 2020 07:25:13 +0000 (UTC)
Subject: Re: [PATCH 3/9] drm: Add simplekms driver
To: Maxime Ripard <maxime@cerno.tech>
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-4-tzimmermann@suse.de>
 <20200629090657.GN3278063@phenom.ffwll.local>
 <da512368-508d-15f5-823a-5a037364887a@suse.de>
 <20200925151410.zrivxvskxh3sr5n7@gilmour.lan>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <47d244c6-4bc5-e635-2c73-4b4d0490f6ab@suse.de>
Date: Mon, 28 Sep 2020 09:25:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200925151410.zrivxvskxh3sr5n7@gilmour.lan>
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
Cc: geert+renesas@glider.be, airlied@linux.ie, emil.l.velikov@gmail.com,
 lgirdwood@gmail.com, dri-devel@lists.freedesktop.org, hdegoede@redhat.com,
 broonie@kernel.org, kraxel@redhat.com, sam@ravnborg.org
Content-Type: multipart/mixed; boundary="===============1185053477=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1185053477==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8EjxTlQIFnmOyr6egDHzqmcpmJ0OUDjtx"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8EjxTlQIFnmOyr6egDHzqmcpmJ0OUDjtx
Content-Type: multipart/mixed; boundary="QOPiqDXoyu625bfeJzq38HLPg4lnYhFCx";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Maxime Ripard <maxime@cerno.tech>
Cc: Daniel Vetter <daniel@ffwll.ch>, maarten.lankhorst@linux.intel.com,
 airlied@linux.ie, kraxel@redhat.com, lgirdwood@gmail.com,
 broonie@kernel.org, robh@kernel.org, sam@ravnborg.org,
 emil.l.velikov@gmail.com, noralf@tronnes.org, geert+renesas@glider.be,
 hdegoede@redhat.com, dri-devel@lists.freedesktop.org
Message-ID: <47d244c6-4bc5-e635-2c73-4b4d0490f6ab@suse.de>
Subject: Re: [PATCH 3/9] drm: Add simplekms driver
References: <20200625120011.16168-1-tzimmermann@suse.de>
 <20200625120011.16168-4-tzimmermann@suse.de>
 <20200629090657.GN3278063@phenom.ffwll.local>
 <da512368-508d-15f5-823a-5a037364887a@suse.de>
 <20200925151410.zrivxvskxh3sr5n7@gilmour.lan>
In-Reply-To: <20200925151410.zrivxvskxh3sr5n7@gilmour.lan>

--QOPiqDXoyu625bfeJzq38HLPg4lnYhFCx
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 25.09.20 um 17:14 schrieb Maxime Ripard:
> Hi Thomas,
>=20
> On Fri, Sep 25, 2020 at 05:01:23PM +0200, Thomas Zimmermann wrote:
>>>> +					   ARRAY_SIZE(simplekms_formats),
>>>> +					   simplekms_format_modifiers,
>>>> +					   connector);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>>> +	drm_mode_config_reset(dev);
>>>
>>> This breaks fastboot. I think ideally we'd have the state represent
>>> everything is on, and allocate an fb + buffer with the current conten=
ts of
>>> the framebuffer. Since we can allocate an fb that matches this should=
n't
>>> be a problem, just a raw memcpy_fromio should do the job.
>>
>> I'm trying to wrap my head around how the fastboot setup is implemente=
d.
>>
>> Apparently, i915's fbdev code goes through the existing pipeline state=

>> and fills the fb_info structure with compatible settings.
>>
>> Where is the initial pipeline state created? If I write reset handlers=

>> that initialize the pipeline to the simple-framebuffer's fixed state,
>> whould that be sufficient? A later stage could then do the equivalent =
of
>> intel_fbdev_init_bios().
>>
>> The simple-kms helpers don't seem to support custom reset handlers or
>> atomic-state callbacks. I guess that would require and update as well?=

>=20
> You probably want to read the following :)
>=20
> https://lore.kernel.org/dri-devel/CAKMK7uHtqHy_oz4W7F+hmp9iqp7W5Ra8CxPv=
J=3D9BwmvfU-O0gg@mail.gmail.com/
>=20
> It's been on my todo-list since, but I never got to work on it :/

Thanks for the pointer. This looks like the optimal solution, although
overkill for this simple use case.

For now, I'll probably initialize the state during initialization. When
the readout helpers materialize, I'll convert the driver.

Best regards
Thomas

>=20
> Maxime
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=FCrnberg, Germany
(HRB 36809, AG N=FCrnberg)
Gesch=E4ftsf=FChrer: Felix Imend=F6rffer


--QOPiqDXoyu625bfeJzq38HLPg4lnYhFCx--

--8EjxTlQIFnmOyr6egDHzqmcpmJ0OUDjtx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9xj9gUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiODigf/S4FbKxuGmgCR2RQ/v9SeqHRIZV/R
zC0o6EOoxBSO7V48p1rRJWigyPUPflsxJumMmFFQNIuuXPi3nwvlqSJl7eg9s3wt
wOw/TNp+e+TbWVJ/ZedM6hjhVXKzf/anPqQjJ91F47OGYSMxHeQ8hCud5LAQ8N90
8QYHjHS7MvPzrYCS3+284t6SdDPw7mlFv4tuZqsVJcMX+NucAM5A1OJEHz01U7wu
i6eBiO+ARrcTK0UpVHOwE008/RPkL3VJZ59dK26fC6PO9giGlxrAzA1KbLCwMxgh
Zg4iSIrY0urtEQZR3gOG1NOo8uISs3Kzx57YaozoqpSG+J4XJ2JgXEYwcQ==
=UeQQ
-----END PGP SIGNATURE-----

--8EjxTlQIFnmOyr6egDHzqmcpmJ0OUDjtx--

--===============1185053477==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============1185053477==--
