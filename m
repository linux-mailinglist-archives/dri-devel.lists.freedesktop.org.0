Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E4978868F
	for <lists+dri-devel@lfdr.de>; Fri, 25 Aug 2023 14:03:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40ABC10E662;
	Fri, 25 Aug 2023 12:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495F510E65C
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 12:03:24 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-500a8b2b73eso802598e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 25 Aug 2023 05:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692965002; x=1693569802;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=ELXgviMpgy4zGz/owwQPDHe5idVqY1uFQcUKibP3MzE=;
 b=jtkghKzqu7gJqdch+IO9/LhORTACcG+mZOqRbhSDwQV9o0nuQF3/6JXPufHz9RlT3S
 v5xjd6cgQdAbcRvKlLHoos1w5Ht5DykFOCSqflp6zJ2Gn3mf//S8cU6qeOU0Ktkm9QwO
 DHU7U1cv2H7u7pLJr8rorxWRNeRV5V4jup9aPgeSGHBn7w1aCSza0b9b0uo0G39So6/c
 jxr/brTiOfHxRSkDeYsaJXJ34pmYKadfK3V/ZD9b29E0FjTXv+xALx2+SYZbn2gbmtwf
 wtiaWh/5P86UC0bXh13v5w4YIPLld5NjdYQnfG47sPT4OcJgHi6us/96cZC6hmk7vrWw
 gMgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692965002; x=1693569802;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ELXgviMpgy4zGz/owwQPDHe5idVqY1uFQcUKibP3MzE=;
 b=JZSj9TiiEbvCJ8lnkCkTtfyhGzxoNba7CroaehVU3KnBSI3/kBAPibUHAjz45Q5cah
 LTDWpy3O5TFOUhXbf4x6Lsh0tpaedM1sH4z27BrD1s31INS0wzdZR1P4VoX0CEtNCQ/1
 VZ3+VOUM+46muWS1p9Y0obLkJSPCru2GZFGIcsM12VyOTsYvPCt6zKB61NgTkft2uH7E
 lnMaxImVsM3XcKuuiLWQYPyerEuG7mgCOCn+Ky4+098/zQ64YZ2LvZjMJLz9dR+3X/7m
 5AZw4RB5dr5ApGcwJd2NVW0htLmLFqBMSLaEEbuLbBiwTUAz9KaeEPxx36/HSMGDpabl
 E8MA==
X-Gm-Message-State: AOJu0YyXobNs+x3D+3t41/ufO3q7EOSx9g19DCs7AwjG5Jd6jUQ2hg3+
 /A5Ar4zAMSwH76FTzvi+sUc=
X-Google-Smtp-Source: AGHT+IEYHuTCMSGacmVO/PZ83kc0+/ZGpP5aVBCKbEkzT3bnw8tb579nu/KQZjIaX22UbWHpuZCSwg==
X-Received: by 2002:a05:6512:10d5:b0:4fe:7df0:41ab with SMTP id
 k21-20020a05651210d500b004fe7df041abmr14564564lfg.17.1692965002088; 
 Fri, 25 Aug 2023 05:03:22 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 z26-20020a19f71a000000b004fe8593b67fsm262633lfe.107.2023.08.25.05.03.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 05:03:21 -0700 (PDT)
Date: Fri, 25 Aug 2023 15:03:19 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH v2] drm/plane: Add documentation about software color
 conversion.
Message-ID: <20230825150319.015f59df@eldfell>
In-Reply-To: <20230825085545.168290-1-jfalempe@redhat.com>
References: <20230825085545.168290-1-jfalempe@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/+d8=Atb+mCSKfDc70egVF0t";
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
Cc: tzimmermann@suse.de, javierm@redhat.com, mripard@kernel.org,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/+d8=Atb+mCSKfDc70egVF0t
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Fri, 25 Aug 2023 10:55:35 +0200
Jocelyn Falempe <jfalempe@redhat.com> wrote:

> After discussions on IRC, the consensus is that the DRM drivers should
> avoid software color conversion, and only advertise the formats supported
> by hardware.
> Update the doc accordingly so that the rule and exceptions are clear for
> everyone.
>=20
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---
>  drivers/gpu/drm/drm_plane.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20

Hi,

thanks for revising the patch!

> diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
> index 24e7998d1731..7215521afddd 100644
> --- a/drivers/gpu/drm/drm_plane.c
> +++ b/drivers/gpu/drm/drm_plane.c
> @@ -140,6 +140,25 @@
>   *     DRM_FORMAT_MOD_LINEAR. Before linux kernel release v5.1 there hav=
e been
>   *     various bugs in this area with inconsistencies between the capabi=
lity
>   *     flag and per-plane properties.
> + *
> + *     All drivers must support XRGB8888, even if the hardware cannot su=
pport

Maybe "should" rather than "must"?

If a driver that never supported XRGB8888 before continues to not
support it, I would not count it as a bug.

> + *     it. This has become the de-facto standard and a lot of user-space=
 assume
> + *     it will be present. If XRGB8888 is not natively supported, then it
> + *     shouldn't be the default for preferred depth or fbdev emulation.
> + *
> + *     DRM drivers should not do software color conversion in dumb buffe=
rs, and

This seems to be the opposite of what I was trying to say. In my
opinion:

Dumb buffers are the only type of buffers where software color
conversion could be expected. I would never expect software color
conversion with non-dumb buffers or buffers imported from another
device.

But it has a catch: if software color conversion is needed, the dumb
buffers are better be allocated in sysram. The conversion performance
would likely be abysmal if dumb buffers were allocated from discrete
VRAM.

> + *     only advertise the formats they support in hardware. This is for
> + *     performance reason, and to avoid multiple conversions in userspac=
e and
> + *     kernel space.

Maybe also add:

KMS page flips are generally expected to be very cheap operations.

> + *     But there are two exceptions:
> + *     * To support XRGB8888 if it's not supported by the hardware.
> + *     * Any driver is free to modify its internal representation of the=
 format,
> + *       as long as it doesn't alter the visible content in any way. An =
example
> + *       would be to drop the padding component from a format to save so=
me memory
> + *       bandwidth.

This is fine as long as no-one can mistake this to refer to in-place
conversion. The driver must not modify the userspace submitted buffer's
contents.

> + *     Extra care should be taken when doing software conversion with
> + *     DRM_CAP_DUMB_PREFER_SHADOW, there are more detailed explanation h=
ere:
> + *     https://lore.kernel.org/dri-devel/20230818162415.2185f8e3@eldfell/
>   */
> =20
>  static unsigned int drm_num_planes(struct drm_device *dev)
>=20
> base-commit: 82d750e9d2f5d0594c8f7057ce59127e701af781


Thanks,
pq

--Sig_/+d8=Atb+mCSKfDc70egVF0t
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTomIcACgkQI1/ltBGq
qqceZxAAsKuOGcYkwMMLWRZ3MHpdlhVvsD8Wa/s9NmdZ1uCyyRqpwYnk9XExKEcQ
HGw6pJWEi87t4sAgkFMqOy0sCqoVf4DTzfIqJkIPl6ztpY2BELv7lZdMGnkWBR56
gXrkl0XSc7V3OWpx56aC1V4Gu4kxuMbSY0CZWPAURsTF1XFEy6EGghbcogQG1kHx
nd8SniUixe2Ww4oBj07nFjWlspYfr4K82TXaAv2Cl5cTWO83w0Hn1Q5Z4mYCHRKE
d+ilVfT19jbPrKGXFGu+RZLBdTiPx/EAGZTKEs/w9x0ygQweLNCPfHi4/6270rwW
3sLnv08JjUe2nWStrQa1nwAVqHTDWWR+7mxhLagX/4qGDsShJASwK0LI2eQpRizM
Sp6L6ChbBimDMQQQ5dV3wuaNowZlVYDBB5rDVQrUMB1HaOwR5wD+Bt8bcUbbwEzj
FSj3xmPEKKkvPcUfhSrD04GiKcwXgF+Ey3R0Og0OF/HUAIq+eKFsVb40TigYnykM
FBXFDqJ2Z8KBDl6+kfEENDwFuwzK5xvR/BDfkYyYoIIHsIyfnOllj58N5+hE9D+H
l9Ks5ZnTBZOyltvjwp/2VNB9vzWK022s+zLeH5Sa+D1cIkxmYqebe07GHG+9Tr0k
ICqDZ3OOcV/dZN3a0wAil5pq2w0bXSttPAgZRmMzgCP0Lp6mbG8=
=y86J
-----END PGP SIGNATURE-----

--Sig_/+d8=Atb+mCSKfDc70egVF0t--
