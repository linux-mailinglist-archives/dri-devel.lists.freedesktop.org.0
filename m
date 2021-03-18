Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4E2340413
	for <lists+dri-devel@lfdr.de>; Thu, 18 Mar 2021 12:00:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E5F6E107;
	Thu, 18 Mar 2021 11:00:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CCB6E107
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Mar 2021 11:00:45 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 25E55AC75;
 Thu, 18 Mar 2021 11:00:44 +0000 (UTC)
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device node
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
 <CAMuHMdVa6hw89zr5nRFaKG0sZYLXdTOktGN7pU2LiAPPbsHEdw@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <eaa9a302-7c00-00d2-2308-86e885fc708e@suse.de>
Date: Thu, 18 Mar 2021 12:00:42 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVa6hw89zr5nRFaKG0sZYLXdTOktGN7pU2LiAPPbsHEdw@mail.gmail.com>
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
Cc: bluescreen_avenger@verizon.net,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 David Airlie <airlied@linux.ie>, Jonathan Corbet <corbet@lwn.net>,
 Emil Velikov <emil.l.velikov@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org, Hans de Goede <hdegoede@redhat.com>,
 Mark Brown <broonie@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: multipart/mixed; boundary="===============0756454579=="
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============0756454579==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="okoC2EK4ELgp4i8OVC04b8mh8PM0RZNio"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--okoC2EK4ELgp4i8OVC04b8mh8PM0RZNio
Content-Type: multipart/mixed; boundary="utyvLHxxSDV5Chs7hThFOl8N43JLq1tQV";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: bluescreen_avenger@verizon.net, Jonathan Corbet <corbet@lwn.net>,
 David Airlie <airlied@linux.ie>, Emil Velikov <emil.l.velikov@gmail.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 virtualization@lists.linux-foundation.org,
 Hans de Goede <hdegoede@redhat.com>, Mark Brown <broonie@kernel.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>
Message-ID: <eaa9a302-7c00-00d2-2308-86e885fc708e@suse.de>
Subject: Re: [PATCH v2 08/10] drm/simpledrm: Acquire clocks from DT device
 node
References: <20210318102921.21536-1-tzimmermann@suse.de>
 <20210318102921.21536-9-tzimmermann@suse.de>
 <CAMuHMdVa6hw89zr5nRFaKG0sZYLXdTOktGN7pU2LiAPPbsHEdw@mail.gmail.com>
In-Reply-To: <CAMuHMdVa6hw89zr5nRFaKG0sZYLXdTOktGN7pU2LiAPPbsHEdw@mail.gmail.com>

--utyvLHxxSDV5Chs7hThFOl8N43JLq1tQV
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 18.03.21 um 11:39 schrieb Geert Uytterhoeven:
> Hi Thomas,
>=20
> On Thu, Mar 18, 2021 at 11:29 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>> Make sure required hardware clocks are enabled while the firmware
>> framebuffer is in use.
>>
>> The basic code has been taken from the simplefb driver and adapted
>> to DRM. Clocks are released automatically via devres helpers.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
>=20
> Thanks for your patch!
>=20
>> --- a/drivers/gpu/drm/tiny/simpledrm.c
>> +++ b/drivers/gpu/drm/tiny/simpledrm.c
>=20
>> +static int simpledrm_device_init_clocks(struct simpledrm_device *sdev=
)
>> +{
>> +       struct drm_device *dev =3D &sdev->dev;
>> +       struct platform_device *pdev =3D sdev->pdev;
>> +       struct device_node *of_node =3D pdev->dev.of_node;
>> +       struct clk *clock;
>> +       unsigned int i;
>> +       int ret;
>> +
>> +       if (dev_get_platdata(&pdev->dev) || !of_node)
>> +               return 0;
>> +
>> +       sdev->clk_count =3D of_clk_get_parent_count(of_node);
>> +       if (!sdev->clk_count)
>> +               return 0;
>> +
>> +       sdev->clks =3D drmm_kzalloc(dev, sdev->clk_count * sizeof(sdev=
->clks[0]),
>> +                                 GFP_KERNEL);
>> +       if (!sdev->clks)
>> +               return -ENOMEM;
>> +
>> +       for (i =3D 0; i < sdev->clk_count; ++i) {
>> +               clock =3D of_clk_get(of_node, i);
>> +               if (IS_ERR(clock)) {
>> +                       ret =3D PTR_ERR(clock);
>> +                       if (ret =3D=3D -EPROBE_DEFER)
>> +                               goto err;
>> +                       drm_err(dev, "clock %u not found: %d\n", i, re=
t);
>> +                       continue;
>> +               }
>> +               ret =3D clk_prepare_enable(clock);
>> +               if (ret) {
>> +                       drm_err(dev, "failed to enable clock %u: %d\n"=
,
>> +                               i, ret);
>> +                       clk_put(clock);
>> +               }
>> +               sdev->clks[i] =3D clock;
>> +       }
>=20
> of_clk_bulk_get_all() + clk_bulk_prepare_enable()?
>=20
> There's also devm_clk_bulk_get_all(), but not for the OF variant.

Right, you mentioned this on the original patch set. I tried to use the=20
functions, but TBH I found them to obfuscate the overall logic of the=20
function. So I went back to the original code. Hopefully this is not too =

much of an issue.

Best regards
Thomas

>=20
> Gr{oetje,eeting}s,
>=20
>                          Geert
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--utyvLHxxSDV5Chs7hThFOl8N43JLq1tQV--

--okoC2EK4ELgp4i8OVC04b8mh8PM0RZNio
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmBTMtoFAwAAAAAACgkQlh/E3EQov+AS
rhAAh6JyaE+QDzVYCByXi61NkZYTH+D/XkDKloGEIHAYv+FRyu1KuU9IWxzC11A93wGV3Ox4UQiV
MI0+SSA3V6eShQ7BlmtmAK6Rk0O3UviVP9h62C59Oe7M7lml6SiW5wHgW6T9H9sIEnQFJIXyfdmv
V8QmpzQ3HgaPF5wsF1M5GOxLT4yDKLQSpZ244U6Q41AqHGCEaSgR+L2jzvd4zeimIPxDPSUpEobv
uTJmQrrBui65FqMSI/+wVs7Tn5aBd2/Km4x4lSxilctNi6WoY7fG0VQsQfN4+hmQVOJid4eBgHbZ
aLmeRuyNZ0tMT6c86ATm63Jd4ZTEYFbvSFxh4tz5cwrb0bWSsYxnNx5XFR11Rq67MHEqaH9ZXvz7
zob8y+sP3aKyYVyHUgB5RCwcgEeLqJIls14gudafyKmbGr9SMArxrwszfH7JdjzbuGN6lbMTMNFq
t8VvcIdl++wi3MFIEz9/FHmlbZ7Gvnx0buynPhx9xUav3CkIazq0pt9m99ZDJRQu+4/K0y+v/2CK
lVZiI+TdzMxvHq7wqjZh3w51fa9Su8DkcxKQyp3yKVtE5sf6obtjBmU7ciPrBqfzHNKkhWZMn/3C
thRlrYEN+igE+O0LXBFyIFk9WntRXWup78PdyjuedddAe7NdrJaTRqNnMZG7Azu9ZxpEgA6Sga9i
nTI=
=/ob6
-----END PGP SIGNATURE-----

--okoC2EK4ELgp4i8OVC04b8mh8PM0RZNio--

--===============0756454579==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel

--===============0756454579==--
