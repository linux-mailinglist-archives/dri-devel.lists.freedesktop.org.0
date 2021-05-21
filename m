Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 931A438CDC9
	for <lists+dri-devel@lfdr.de>; Fri, 21 May 2021 20:54:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE59E6F8C4;
	Fri, 21 May 2021 18:54:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 010F96F8F8
 for <dri-devel@lists.freedesktop.org>; Fri, 21 May 2021 18:53:59 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1621623237; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mu9RUQYcbTZWSg9MNLdZB/1p1jix9ar6G5s93tv5TuI=;
 b=Yn/6ZaZZ15sui+JPvQFtzgD8FZw+ZQcxjTlwNXep1Co+KKWQify4H2GdHz1+7a6io9Kfcd
 66mOS6Vl8kdHZ00Bs9g8MUUjybLNLl5G1hu7iESZYR0kUIGmkxYR7jVEPIUWmL5A2GFrHk
 LlkDiEWLGWzXdxG0Z6oEMgy45bOlLis=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1621623237;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=mu9RUQYcbTZWSg9MNLdZB/1p1jix9ar6G5s93tv5TuI=;
 b=/xJuVYkDe9HZQFmMu6K2QILVLiS1Ij1/zT1X+EWGGkdktVhW8c/6tS0bhb2dF1M05fO0vq
 86a1wFcAKAzoFWDg==
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id D1012AAFD;
 Fri, 21 May 2021 18:53:57 +0000 (UTC)
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
References: <20210521131910.3000689-1-javierm@redhat.com>
 <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
 <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
 <bfd6fa47-497a-64bc-c2fc-a081bd41d5ec@redhat.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
Message-ID: <fc6540fa-1945-a15d-239d-e87bb4d3fa9e@suse.de>
Date: Fri, 21 May 2021 20:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <bfd6fa47-497a-64bc-c2fc-a081bd41d5ec@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Jgx8DprSxJqi78CATLaATuaOAirN5CN0Y"
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
--Jgx8DprSxJqi78CATLaATuaOAirN5CN0Y
Content-Type: multipart/mixed; boundary="BjyfcwIr0k6GaL1qcfPb2KgkCqS9B41Da";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Javier Martinez Canillas <javierm@redhat.com>,
 linux-kernel@vger.kernel.org, Peter Robinson <pbrobinson@gmail.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, dri-devel@lists.freedesktop.org
Message-ID: <fc6540fa-1945-a15d-239d-e87bb4d3fa9e@suse.de>
Subject: Re: [PATCH] drm/fb-helper: improve DRM fbdev emulation device names
References: <20210521131910.3000689-1-javierm@redhat.com>
 <YKfS2GDCXPJ/q8gT@phenom.ffwll.local>
 <3a6f9235-5375-b2cb-2d63-a47c5f9752bb@suse.de>
 <bfd6fa47-497a-64bc-c2fc-a081bd41d5ec@redhat.com>
In-Reply-To: <bfd6fa47-497a-64bc-c2fc-a081bd41d5ec@redhat.com>

--BjyfcwIr0k6GaL1qcfPb2KgkCqS9B41Da
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 21.05.21 um 19:18 schrieb Javier Martinez Canillas:
> On 5/21/21 6:53 PM, Thomas Zimmermann wrote:
>=20
> [snip]
>=20
>>>
>>> So what with all the drivers which do _not_ have drm in their name? A=
lso
>>> I'm never sure how much these are uapi or not ...
>>
>=20
> That someone could threat as an uapi is a fair point indeed.
>  =20
>> Why do we need a suffix anyway?
>>
>=20
> Yes, I thought the same and was torn about posting a patch to just remo=
ve
> the suffix. I don't think users care that much if is a fb device from a=

> fbdev driver or a DRM driver using the fbdev emulation.

Yup. I don't see how anything in userspace would depend on the exact=20
name; especially since fbdev emulation only provides basic features.=20
(I'd welcome a counter examples that proves me wrong.)

IMHO we can risk it to remove the suffix entirely. But that needs an ack =

from Daniel or Dave.

Best regards
Thomas

>=20
>>> -Daniel
>>>
>=20
> Best regards,
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--BjyfcwIr0k6GaL1qcfPb2KgkCqS9B41Da--

--Jgx8DprSxJqi78CATLaATuaOAirN5CN0Y
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmCoAcUFAwAAAAAACgkQlh/E3EQov+Bz
ihAAtKYtsAnGL/Q5knCfNp64XOjCmO2fc7BtgUcWJsOYZHE26YUP9WYd3vxxPUgPd6M9JA87R0vH
X+Xlgq6qBKD3m4TyKHf/JZs+do/Hzx5jFRYZauz5LuslmNKP/uUKfKQ23aY/pBvgfwHaDSkuQoeS
jNzuqRkRTXwFbJHtoutPKX+ctbHWB2EyzkRHpqJ6NhiyRAexuvPKpvRWMrtGu0HCp/HYd9OvoLG0
pLJs0lHxYU4aaJ5b+TkMwCAhy8f96k5gNnJ+mgZJJbowEKPGTvXC866u0/FxZHAr7QdRuzQaXW+p
prmmnk2hDvjRcV0vx9r8zCY90qMze0cB3WHGv0TEbSYB65hnKAZSrpRhznXC8HfeS7cyCZY+HRKB
PoedwQUT62zJ+Ae9+ZfosXQbT46yzRWWCZKpdWWgSQ2QUooXMbOuiQ/LUNJlOo6IngmKK+fuA/vP
uVNCQZ5N/kOHQFPhQIghHPAjnl0hP+4W1YOq6/LYbQbq/jV7Nl13IEIDVhOhbKQ/E0rig11yuF+K
r15mug3jtferVysuDCokzkG0UinJgqtY/bPdOGpA58bte7UNpBXVAU08Cbs91DqQ+U1oufA8CJj3
gvSaMey9S0viQVU/F2+kLyVuhfsvUL+cZ5jpmvUJnBBvFsSMzQZlzGQHUFB/02wzmbARRlmebSz+
V7o=
=G6g2
-----END PGP SIGNATURE-----

--Jgx8DprSxJqi78CATLaATuaOAirN5CN0Y--
