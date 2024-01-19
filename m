Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40468832975
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 13:26:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB85610E1B3;
	Fri, 19 Jan 2024 12:26:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C88210E1B3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 12:26:52 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-2cda523725bso7981961fa.3
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 04:26:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705667150; x=1706271950; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hqhTqrBIc5uDH6fwpRfixlVihTnIVffqasa79uAYaJo=;
 b=C/RiLvMbV8zSmb30mjOr4JnwLhUek9rxTKdoxqW+4PyTsyXLGoZBx5DwM5YMTSmtqQ
 WK/g3x9AXvJoIxZs3BOdz5XOU0HUSmmWoKHK7kdQBg4jmhsIoiJ7TmWsb0gUvSmpWxsY
 sXESJjmqB91+dOkS+83Ts+GReBEEhv0XgsffADSXTIzwCxzA1pDZ313o6cPfuFNEHBnz
 +FHgUbiAGHVAJjFXKDN40csS/9ye3x0ALhuoFLFhFPYXVM6kW7qDoJtPn1TVudqGaLrt
 3V7rywVyTNBcnCD1RopI4zFu1PhOX02xEzT2kqxvqRtf3JVF91PBEgEDS1SFZxn5TaAE
 YfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705667150; x=1706271950;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hqhTqrBIc5uDH6fwpRfixlVihTnIVffqasa79uAYaJo=;
 b=hD93CJATmAUoYaIYyXYxXDpqJeAtCxY0K7uwYu4hXcH87YpvyGlZIK11FZp8bKtkz3
 Y7GL2TB0WcX1OirPDJ8x+2UBm23ZxjIuw/Nm0F+NweyAY7J7LAzhqnCl4dZC2JL3jX2Y
 +Zx+ye6s+/WisZo8ePdNP+e5flIy5ou9FzqhQjq6LQjro4XkA3n+jgRXdVYCU3IyS9Jz
 zwaLqJtoRcYKFoA0KIccGUuvDQpBJTKmE3QoUDJ30UhewmvFwAV8Kg8cfkKaMSEBrJPr
 XO+g6xIwjn6uHHN23V4nF3soF93fQJmOSFRdhNiqf5vap0Bm3hwMEigp8S0BJmKWfuoJ
 afRQ==
X-Gm-Message-State: AOJu0Yz+1I5bM9k0LbT8YItZdqMS+MSJ9XBb42A0LmlWdPEly1tsc2eG
 O2vczkAGmmatpjCxQ+QEhOvBwjFCuRFXrYfQlrN17V9DoI2OySdt
X-Google-Smtp-Source: AGHT+IE07uAO9XILmQmIja9AFikW9eIr8qYxbLkah1UZDOPA0SC9nlIyoVEcwPvKB/xIkuiqDcPAXw==
X-Received: by 2002:a05:6512:e84:b0:50e:696e:168d with SMTP id
 bi4-20020a0565120e8400b0050e696e168dmr475487lfb.10.1705667149637; 
 Fri, 19 Jan 2024 04:25:49 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 h13-20020a056512220d00b0050f0a6888f7sm956759lfu.142.2024.01.19.04.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jan 2024 04:25:49 -0800 (PST)
Date: Fri, 19 Jan 2024 14:25:36 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v7 1/9] drm/format-helper: Add drm_fb_blit_from_r1 and
 drm_fb_fill
Message-ID: <20240119142536.5023860b@eldfell>
In-Reply-To: <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
References: <20240104160301.185915-1-jfalempe@redhat.com>
 <20240104160301.185915-2-jfalempe@redhat.com>
 <d15c8fd1-a0f5-4dc9-8e8c-30a9200ef7fb@suse.de>
 <b3ac22f6-9553-491f-94c3-2d93474b87c0@redhat.com>
 <8f8f3cce-3fb3-4f94-a7d5-7c089672a68b@suse.de>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/aANLQBjB.JfQ3J3=L.QruPF";
 protocol="application/pgp-signature"; micalg=pgp-sha256
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
Cc: Jocelyn Falempe <jfalempe@redhat.com>, bluescreen_avenger@verizon.net,
 javierm@redhat.com, mripard@kernel.org, gpiccoli@igalia.com,
 noralf@tronnes.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/aANLQBjB.JfQ3J3=L.QruPF
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 19 Jan 2024 11:58:38 +0100
Thomas Zimmermann <tzimmermann@suse.de> wrote:

> Hi
>=20
> Am 17.01.24 um 17:40 schrieb Jocelyn Falempe:

...

> > The last thing, is if I plan to add YUV support, with this=20
> > implementation, I only need to write one function that convert one=20
> > pixel. Otherwise I would need to add the drm_fb_r1_to_yuvxxx_line() and=
=20
> > drm_fb_r1_to_yuvxxxx() boilerplate. =20
>=20
> 8) YUVs are multi-plane formats IIRC. So it's likely a bit more=20
> complicated.And I'm not aware of any current use case for YUV. If the=20
> framebuffer console doesn't support it, the panic helper probably won't=20
> either.

Kernel panic during a fullscreen video playback, maybe?

That use case is likely to have an YUV FB as the only visible KMS plane
FB, either primary or overlay plane depending on which is capable of
displaying it. Sub-titles might not exist, or might be in a fairly
small RGB overlay.

I don't know if such case is important enough to handle.


Thanks,
pq

--Sig_/aANLQBjB.JfQ3J3=L.QruPF
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWqakAACgkQI1/ltBGq
qqfPkA/8DFsLBb4bdLaRHOHkNsoeq+w/I5OH2TqxKPmvWTIUX+W8EqddvOf4aa6D
ZYWOHI9Vzbhf7UY/jyRP/sA1r5e6Okbs2rVjfZP7CivWvAGQVhHxsrU3FMY4g+lR
L5qPCaS07RVZl2DULdG7ZlpUM0LmSvXK/dqkQmKAEN9l/dDw1B2rbdpz/XG8LiE6
SaQH/YlB4fHF/v6hIYKhLNZ52hE70Lz4/1Rq984y211drrhix2XHeIzCEqD4mOGv
lEzqlLxvrNFE5GtNjH0k5rDNA74lT+W6QNSU0LMJ+4t65LxI/mmBExWCz4H5NDwM
1iKWBVDolPO44B4JOLmUHpisJ9sO+dMa5rhYmf+hcg9oneKfZoF1gu4a9C5TqJ2c
fHra1Ox+KTGxMZWzWBFaJ+Pz8LRnSsbP8hIvJiISea5NfM9qouXkgyDX3AoG+WOi
tMOT7G+XTP5GZIfdvp+W9exkNkDv74W3TCiWy5q/TIngkyiBHBSv3hk6bjlJ4rSX
2zrPY9aWj+/d7M93jWMczCUpyWTJUbefZohRS2UUMhqhwIS3RbBznHEgy4SEILvz
oCL+lWDfeS7aQDGzpF7j38RznwhNUP2qUc38wZq5NwQk96uwcTLl4m5aAz6tHy8R
+X+KvVEMnaR3BTeIMCnt1+ZcohUsTScgS0ciNHUJQ3DLm/h49EU=
=8qg0
-----END PGP SIGNATURE-----

--Sig_/aANLQBjB.JfQ3J3=L.QruPF--
