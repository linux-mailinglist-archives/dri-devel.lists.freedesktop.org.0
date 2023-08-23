Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C8B785266
	for <lists+dri-devel@lfdr.de>; Wed, 23 Aug 2023 10:11:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D905A10E3E2;
	Wed, 23 Aug 2023 08:11:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D390710E3E2
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 08:11:17 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id
 2adb3069b0e04-500760b296aso4210074e87.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Aug 2023 01:11:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1692778276; x=1693383076;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=upYcNSp8ISKUu5lc18qA/MqbxbHBjX+P4BZKrg/Zf1k=;
 b=gacpjNbfWohQms6zk4ntwchYLIruxNzjR2ClBLPr3ht4fJuPstqjraEWgOT0Ltw+n0
 4+a9l0aUljIGYhmfcFE5ApTkdtOkupXOiiLbOvxNlUYlD1uiiKOCOZCEqkRJgR/YJEol
 sunStqlubLnjlCxGgJgHAG2cczN1ewVVq9j8MVkRe0LLo4P/xjGuUOvLta+ZTgHUoGIW
 oiVdvMGoYBiojmyX0iI5mShBeJzUNOAN8iUczaxfigy+VqbBgcWJJSyoevTAgjKb5qsp
 y7VS0eqIKTLXq6JOpgJZkAh9+PkaLQDr4G1nbCTlpq//vm0LyKnnJZYvAMm1Ri+9LTHD
 W0jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692778276; x=1693383076;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=upYcNSp8ISKUu5lc18qA/MqbxbHBjX+P4BZKrg/Zf1k=;
 b=Nz0mOotRN7JF0AopxNOU306nP5p3jPjyyiWl1WL3wY3bgIB2Cq0utfp+Qn3SPGXVx6
 +hXFzLoUSCTQ/lpU7IJnnN/CULzc1z6os2XLIJO9adbLJndh1/ifYMWJMFdMI2yJKLo1
 UEKDw8Og2XEFmOCI0ryIPxzGEfSPvcqFFom6A1LS5GK161NDuJe/SWCvxczKVdr8pmF+
 NPjEiGBupQk2e3HP/ZKXYqWpbedPwIos4XMblXN5UeTm3mlqtNTk+Uk3mLithyJcgsB8
 QfFED3QU0DSslEtQ76rNg/0kR7JLCoZUpXtv7qZ7fW7E/OxX2KXFrJd2AHcFpxnpFkLK
 398w==
X-Gm-Message-State: AOJu0YyArfMekaJD2YEoZg9qiOkn7ZCenvYyq6FeRrOiwl3UMbQi5o13
 94yiyt8kOgPGuwAroUpVWzk=
X-Google-Smtp-Source: AGHT+IF9M7fI+hvyxvbYp7YjpMFKu09RdCd4JGlRlsp2s8lxJkSrG0GHn62TYEgsKmpwhQf2Az9BFQ==
X-Received: by 2002:a05:6512:2348:b0:500:8be5:1cb8 with SMTP id
 p8-20020a056512234800b005008be51cb8mr1724697lfu.30.1692778275499; 
 Wed, 23 Aug 2023 01:11:15 -0700 (PDT)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 10-20020ac2484a000000b004ff6fa3f038sm2558958lfy.144.2023.08.23.01.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Aug 2023 01:11:15 -0700 (PDT)
Date: Wed, 23 Aug 2023 11:11:05 +0300
From: Pekka Paalanen <ppaalanen@gmail.com>
To: Jocelyn Falempe <jfalempe@redhat.com>
Subject: Re: [PATCH 1/1] drm/fourcc: Add documentation about software color
 conversion.
Message-ID: <20230823111105.1281a980@eldfell>
In-Reply-To: <b2074198-2176-5e63-ce18-02bb14ea5749@redhat.com>
References: <20230807140317.26146-1-jfalempe@redhat.com>
 <20230807140317.26146-2-jfalempe@redhat.com>
 <iadbqczfvboqyxebbnjkjef3dttcaa76vu3e4ylve6cxaypbqf@oz5hhu3xrryr>
 <20230818162415.2185f8e3@eldfell>
 <36prxupvl72tmamorquaunss27kckoq5zegmrwxdr3v3ynqz4s@xiypdbs4pbga>
 <20230822112004.3599df53@eldfell>
 <b2074198-2176-5e63-ce18-02bb14ea5749@redhat.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.37; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/TTFwBYAG8VlDnuPUx3mhWvK";
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
Cc: tzimmermann@suse.de, javierm@redhat.com, Maxime Ripard <mripard@kernel.org>,
 dri-devel@lists.freedesktop.org, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/TTFwBYAG8VlDnuPUx3mhWvK
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 22 Aug 2023 17:49:08 +0200
Jocelyn Falempe <jfalempe@redhat.com> wrote:

> On 22/08/2023 10:20, Pekka Paalanen wrote:
> > On Mon, 21 Aug 2023 17:55:33 +0200
> > Maxime Ripard <mripard@kernel.org> wrote:
> >  =20
> >> Hi Pekka,
> >>
> >> Thanks for answering
> >>
> >> On Fri, Aug 18, 2023 at 04:24:15PM +0300, Pekka Paalanen wrote: =20
> >>> On Thu, 10 Aug 2023 09:45:27 +0200
> >>> Maxime Ripard <mripard@kernel.org> wrote: =20
> >>>> On Mon, Aug 07, 2023 at 03:45:15PM +0200, Jocelyn Falempe wrote: =20
> >>>>> After discussions on IRC, the consensus is that the DRM drivers sho=
uld
> >>>>> not do software color conversion, and only advertise the supported =
formats.
> >>>>> Update the doc accordingly so that the rule and exceptions are clea=
r for
> >>>>> everyone.
> >>>>>
> >>>>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> >>>>> ---
> >>>>>   include/uapi/drm/drm_fourcc.h | 7 +++++++
> >>>>>   1 file changed, 7 insertions(+)

...

> > In the XRGB8888 to RGB888 case, the kernel doing the conversion may
> > allow for higher resolutions, but it may also hurt framerate more than
> > userspace doing conversion, theoretically. For lower resolution where
> > XRGB8888 could be scanned out directly from VRAM, the conversion would
> > be strictly hurting.
> >  =20
> I think that depends on the hardware. For the Matrox, the bandwidth=20
> between system RAM and VRAM is so low, that doing the conversion is much=
=20
> faster than copying XRGB8888 to the VRAM. It also uses less CPU cycles,=20
> because the copy is done with memcpy(), (DMA is broken or even slower on=
=20
> most mgag200 hardware).
> To get numbers, on my test machine, copying the 5MB framebuffer XRGB8888=
=20
> to VRAM takes 125ms. Copying 3.75MB RGB888 framebuffer takes 95ms. The=20
> conversion has no measurable impact, as it is done on the fly during the=
=20
> memcpy, when the CPU is waiting for the bus to accept more data.
> Doing the conversion in user-space would actually be slower, even with=20
> SSE, because they won't use the "wasted" cpu cycle. But anyway the=20
> conversion can take a few micro-seconds on the CPU, which is still=20
> negligible compared to the memory transfer.

I stand corrected!

Always exceptions. :-)

I suppose you have dumb alloc returning sysmem, and PREFER_SHADOW set
to false to go with that? Sounds good for XRGB8888. I guess there is
not enough VRAM to alloc dumb buffers from there anyway?

> Before sending the v2, Simon Ser proposed to move the paragraph to=20
> https://elixir.bootlin.com/linux/latest/source/drivers/gpu/drm/drm_plane.=
c#L132=20
> instead of fourcc.h.
> I'm wondering what other thinks about this.

I like moving it out of drm_fourcc.h. drm_fourcc.h is about format
definitions which are used by things like EGL, Wayland, and whatnot
which are not KMS specific.


Thanks,
pq

--Sig_/TTFwBYAG8VlDnuPUx3mhWvK
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmTlvxoACgkQI1/ltBGq
qqcbZQ/7Bv2Nr/b/f2hKwwbZvFMIVTyoaR/Mm/UXqGB2Sy4yUrNna6OUzLeKq8kY
dRIyd223IAoN21kWt2JOnxcQSmqdtszdWaZYc36dlBduskbhRf/BWyThyfUpZ921
40bPJm3/FDdgAJe/8f0Yu+Q88Ah4/VraQoJFDOPGos7qprAKxxkZBRegnNntqrcS
cJIZAn4OCIiKutAQm8HsFSrnQdx97vpgeQ0J5k5rOeCY67ViHu28I5AKtppvWy64
3GAKSM7UYZ4vO826mZA6cq8yZ4psW8qIbV2rK39kb2u9eGGJr0xDwC5ltcF8dgdX
yqqavcKVamhq82AIlrmiTfSjzdDX35rGKIpgfli70XGiK1Z1pDn1Ir54fi86ydgN
rMEkQNiyymYj+Z7nXO0WGDUbrgPrxyAdkYuAGFMvnRuUuSsAkE/tRY4d5WwMdv+f
A7zLJyTCzyAokJ2D1CORDUAzypDGm/ORMaFTYnfmo92uQaTCMZcQs5tkc5xlUxpi
BZTGBwLAgRHNQROhlhfEuZlXoggo4OSDMEcNeBLetA1PQkmbPLE5H5yA0lPzNESl
IxKE070k5DBPKHzRXLQ9bjyPnTfSm9v2FqDMLVKRf4w7fHVstqy3NHw4IzYjv47G
hGygN15i263xXpKbCSH5RpBhuXtAQnSjCzn3hAYUpWm4cAUJQfc=
=9vby
-----END PGP SIGNATURE-----

--Sig_/TTFwBYAG8VlDnuPUx3mhWvK--
