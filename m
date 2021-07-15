Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549793C9CBD
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 12:34:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3855B6E509;
	Thu, 15 Jul 2021 10:34:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576FE6E509
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jul 2021 10:34:03 +0000 (UTC)
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 0C8B5227C4;
 Thu, 15 Jul 2021 10:34:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1626345242; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C3r+MoQUZftGFnoLGddjeoKLQ4Jj5UP2WoHBg7J4MxQ=;
 b=dBrJ9y99WLWDqycColkJmBYqNv/okAiBYmaifn3GyvmTS5Y70MlK75NgUsFTdpZghUt9xc
 gUtnFCCVez4U4PAGI24qiOMenU9a9o/PVUG4BwtQks0dePBrMMmsPbQImyNwyDqFAKf0aq
 ERb8jtiZuy0rM3f0+wjM8yTRkwgM2Xg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1626345242;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C3r+MoQUZftGFnoLGddjeoKLQ4Jj5UP2WoHBg7J4MxQ=;
 b=EEiHlCuyPF/SdBoCvwuZ2kMt+zt2eqp+Q04zCUNfWMDi0yr7tI54oTC852fFjDReNCnu2T
 +SQe8gCXy+muKXBA==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id CF27713D7E;
 Thu, 15 Jul 2021 10:34:01 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap1.suse-dmz.suse.de with ESMTPSA id tayqMBkP8GD9GgAAGKfGzw
 (envelope-from <tzimmermann@suse.de>); Thu, 15 Jul 2021 10:34:01 +0000
Subject: Re: [PATCH v2] drm/shmobile: Convert to Linux IRQ interfaces
To: Geert Uytterhoeven <geert@linux-m68k.org>
References: <20210715095729.6510-1-tzimmermann@suse.de>
 <CAMuHMdU6Dxod3pGo3pCjRsXu0O5YTJWTcTFnAzg4F_8kD7bdxg@mail.gmail.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <09c12fee-4698-18bc-0bb1-db8ae31caed5@suse.de>
Date: Thu, 15 Jul 2021 12:34:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdU6Dxod3pGo3pCjRsXu0O5YTJWTcTFnAzg4F_8kD7bdxg@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="QlEDNAiSROcThjuLbZwhf8SHcE7IAZqwl"
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
Cc: David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Sergei Shtylyov <sergei.shtylyov@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--QlEDNAiSROcThjuLbZwhf8SHcE7IAZqwl
Content-Type: multipart/mixed; boundary="cggzFFcQel5JbHQ8e5Pz6I6E79ipARwNv";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Sam Ravnborg <sam@ravnborg.org>, Sergei Shtylyov
 <sergei.shtylyov@gmail.com>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Message-ID: <09c12fee-4698-18bc-0bb1-db8ae31caed5@suse.de>
Subject: Re: [PATCH v2] drm/shmobile: Convert to Linux IRQ interfaces
References: <20210715095729.6510-1-tzimmermann@suse.de>
 <CAMuHMdU6Dxod3pGo3pCjRsXu0O5YTJWTcTFnAzg4F_8kD7bdxg@mail.gmail.com>
In-Reply-To: <CAMuHMdU6Dxod3pGo3pCjRsXu0O5YTJWTcTFnAzg4F_8kD7bdxg@mail.gmail.com>

--cggzFFcQel5JbHQ8e5Pz6I6E79ipARwNv
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 15.07.21 um 12:16 schrieb Geert Uytterhoeven:
> Hi Thomas,
>=20
> On Thu, Jul 15, 2021 at 11:57 AM Thomas Zimmermann <tzimmermann@suse.de=
> wrote:
>> Drop the DRM IRQ midlayer in favor of Linux IRQ interfaces. DRM's
>> IRQ helpers are mostly useful for UMS drivers. Modern KMS drivers
>> don't benefit from using it.
>>
>> v2:
>>          * handle errors in platform_get_irq() (Geert, Sergei)
>>          * store IRQ number in struct shmob_drm_device (Laurent)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>=20
> Thanks for the update!
>=20
>> --- a/drivers/gpu/drm/shmobile/shmob_drm_drv.c
>> +++ b/drivers/gpu/drm/shmobile/shmob_drm_drv.c
>> @@ -258,7 +256,15 @@ static int shmob_drm_probe(struct platform_device=
 *pdev)
>>                  goto err_modeset_cleanup;
>>          }
>>
>> -       ret =3D drm_irq_install(ddev, platform_get_irq(pdev, 0));
>> +       ret =3D platform_get_irq(pdev, 0);
>> +       if (ret) {
>=20
> if (ret < 0) {

Indeed :/

>=20
>> +               dev_err(&pdev->dev, "failed to get IRQ number\n");
>=20
> platform_get_irq() already prints an error message, so no need to
> repeat it.
>=20
>> +               goto err_modeset_cleanup;
>> +       }
>> +       sdev->irq =3D ret;
>> +
>> +       ret =3D request_irq(sdev->irq, shmob_drm_irq, 0, ddev->driver-=
>name,
>> +                         ddev);
>>          if (ret < 0) {
>>                  dev_err(&pdev->dev, "failed to install IRQ handler\n"=
);
>>                  goto err_modeset_cleanup;
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


--cggzFFcQel5JbHQ8e5Pz6I6E79ipARwNv--

--QlEDNAiSROcThjuLbZwhf8SHcE7IAZqwl
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDwDxkFAwAAAAAACgkQlh/E3EQov+Bk
EBAAgIhEvBHfKwf19G0lkreQfqww5H74xCJvVgA2iotGEW3Xq5ywzmsSdFjE0aEusqT7dJAgqz+v
6daRrqwn+sw8S2+3DdEvz1vt7JgWVyz5hbLcFhagOpDiTe2ylyGoaLAKV8ozrL/gjy6rRZvrAtnh
clEAus2qiP9MoWZjMy/2Kxynoa/bkTetfqbKv+K6NnYVy8I7ZZOjh2RNv/+eL4vgspotoT/LFbSs
W1tqnMZ2re8aKn3zDMozdYgWLcDr0Q+Hgy2zhF1fKhSVzAc/Pe2icPNYXWJUPtaVhNE3HPXMvIWt
arqbR4bVsYg3rPdcTtSVJOU9jmXwBaqUj1v1gae/mukswvW7MRaYpPnMo8hloc1SoTqN8ZRXrN+A
xJD2sdvXqQEYvjJ1v9WwR33B0ypmDK+3omMDWIvsy5971a5d6r8XESXBUsK84y85NsNGQdCvdVHk
Qmu5N2saR8JUWRwHXOxyLCvhcLE9b4z+gcuZ2YlVSASbZ7xMwCcP/e+9gbybTqOteOn8iKe1ZjPN
d6GQr0YR7b1znqTuSOWhaWYXcVIZa3b49oyNqJeBb/btrnlRmLhZTVphWTK+8569ApWFr6PWIUux
05Vf5eBQCj0ife8bQ1EjlqEJsdaRKrs77n+Sn5hxuyoT4Bz9uWNlcoF7bkr4Ef5Ni9AW58UKj6BT
XWo=
=l3ly
-----END PGP SIGNATURE-----

--QlEDNAiSROcThjuLbZwhf8SHcE7IAZqwl--
