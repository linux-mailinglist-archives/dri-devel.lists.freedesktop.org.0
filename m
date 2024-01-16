Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C19682EF97
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 14:16:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E864D10E545;
	Tue, 16 Jan 2024 13:15:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3603B10E4C6;
 Tue, 16 Jan 2024 13:15:28 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-50ed808db11so7099081e87.2; 
 Tue, 16 Jan 2024 05:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705410866; x=1706015666; darn=lists.freedesktop.org;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=E5HYLxVw6fM3ypadLsACTrsy4pVl4M83eVfP/j5l+MM=;
 b=dZnPYSCWY5HeJFRprjojo3dcBVw/smJ2Oibl8Ls/asKnA6+DuiWKaIOC8IrbkLjUpC
 q4XoVoHaiDE9YYHm3R+1+wTH7xZHz4HK+thHCHUyQVvxJOS6TeEXHPtraQOZqhwOyYf2
 dHmyOYUY9RNUAxVDvwGACp81T/eXJNAre0nLZhiRc3SdpfhFBC5Vdaylloz57enYiZEx
 Dp2FDvJlKedbKyzZnROeTAIwcmQrVLaybFFbz50Zq2Z9XDmsWm7C4velum2Kbv2zbqAA
 Mo/9RXT5MKWxPbeOER7qunNFZB+VpHNkPPnYkCxkYkRuXR8NorHnwQefTD95P4C6zR/Z
 9sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705410866; x=1706015666;
 h=mime-version:references:in-reply-to:message-id:subject:cc:to:from
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=E5HYLxVw6fM3ypadLsACTrsy4pVl4M83eVfP/j5l+MM=;
 b=ez7KQOfByyijKD4OzAdfXUFOEr2etfojb2zxKtmvvxVz2Twy1tXy8bQY1LLf4ojJCA
 JCCHp8TTZ/cxYby9S7quN+ff+4p49PoaqudN19/bGXQ8Xnidw0p4CcB7oPlFl4cP4lGR
 o11bZ/o3qcMlu91B7MJNuZxuLR148Vi8vwHgSZ/tYYdH5TpkaF6REgcOy63pCXIHb64/
 u4DeKOxms6UJztokSXrwUkDDBfSRGNAbXHjCUy7rBNgOb6A/uriPAqwC/CXn+pkV2PNI
 bxOFrRNe4PzkiKGk2AZj53+RB/MM0ZRIVH58G3yesHjQqREtKD///m1hcL7H33qu1F9R
 5oyg==
X-Gm-Message-State: AOJu0Yw2/91rPMAnOPsahQUv432t1fKQ/d9m9M7p2lnoA87Goma5rMMm
 6HMkcv3SUVYW/TeRJVluWss=
X-Google-Smtp-Source: AGHT+IHYkDYUaH4R12WjJHu/IEaUkPCn6D0JlewBPNsBKwyAmM+WY5OUDQc/8qPQn00n0BWlGsKp1w==
X-Received: by 2002:a05:6512:3042:b0:50e:73fe:c4ab with SMTP id
 b2-20020a056512304200b0050e73fec4abmr3983941lfb.94.1705410865335; 
 Tue, 16 Jan 2024 05:14:25 -0800 (PST)
Received: from eldfell ([194.136.85.206]) by smtp.gmail.com with ESMTPSA id
 u9-20020a056512040900b0050e3615f608sm1750943lfk.209.2024.01.16.05.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jan 2024 05:14:24 -0800 (PST)
Date: Tue, 16 Jan 2024 15:14:14 +0200
From: Pekka Paalanen <ppaalanen@gmail.com>
To: =?UTF-8?B?QW5kcsOp?= Almeida <andrealmeid@igalia.com>
Subject: Re: [PATCH 0/2] drm/atomic: Allow drivers to write their own plane
 check for async
Message-ID: <20240116151414.10b831e6@eldfell>
In-Reply-To: <a6099681-1ae9-48ef-99bc-d3c919007413@igalia.com>
References: <20240116045159.1015510-1-andrealmeid@igalia.com>
 <20240116114522.5b83d8b6@eldfell>
 <a6099681-1ae9-48ef-99bc-d3c919007413@igalia.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/i2t6EBxqq.bTAjLBweow2/Q";
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
Cc: daniel@ffwll.ch, 'Marek =?UTF-8?B?T2zFocOhayc=?= <maraeo@gmail.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Xaver Hugl <xaver.hugl@gmail.com>, dri-devel@lists.freedesktop.org,
 kernel-dev@igalia.com, alexander.deucher@amd.com,
 Daniel Stone <daniel@fooishbar.org>, Dave Airlie <airlied@gmail.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

--Sig_/i2t6EBxqq.bTAjLBweow2/Q
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 16 Jan 2024 08:50:59 -0300
Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:

> Hi Pekka,
>=20
> Em 16/01/2024 06:45, Pekka Paalanen escreveu:
> > On Tue, 16 Jan 2024 01:51:57 -0300
> > Andr=C3=A9 Almeida <andrealmeid@igalia.com> wrote:
> >  =20
> >> Hi,
> >>
> >> AMD hardware can do more on the async flip path than just the primary =
plane, so
> >> to lift up the current restrictions, this patchset allows drivers to w=
rite their
> >> own check for planes for async flips. =20
> >=20
> > Hi,
> >=20
> > what's the userspace story for this, how could userspace know it could =
do more?
> > What kind of userspace would take advantage of this and in what situati=
ons?
> >=20
> > Or is this not meant for generic userspace? =20
>=20
> Sorry, I forgot to document this. So the idea is that userspace will=20
> query what they can do here with DRM_MODE_ATOMIC_TEST_ONLY calls,=20
> instead of having capabilities for each prop.

That's the theory, but do you have a practical example?

What other planes and props would one want change in some specific use
case?

Is it just "all or nothing", or would there be room to choose and pick
which props you change and which you don't based on what the driver
supports? If the latter, then relying on TEST_ONLY might be yet another
combinatorial explosion to iterate through.


Thanks,
pq

> >> I'm not sure if adding something new to drm_plane_funcs is the right w=
ay to do,
> >> because if we want to expand the other object types (crtc, connector) =
we would
> >> need to add their own drm_XXX_funcs, so feedbacks are welcome!
> >>
> >> 	Andr=C3=A9
> >>
> >> Andr=C3=A9 Almeida (2):
> >>    drm/atomic: Allow drivers to write their own plane check for async
> >>      flips
> >>    drm/amdgpu: Implement check_async_props for planes
> >>
> >>   .../amd/display/amdgpu_dm/amdgpu_dm_plane.c   | 30 +++++++++
> >>   drivers/gpu/drm/drm_atomic_uapi.c             | 62 ++++++++++++++---=
--
> >>   include/drm/drm_atomic_uapi.h                 | 12 ++++
> >>   include/drm/drm_plane.h                       |  5 ++
> >>   4 files changed, 92 insertions(+), 17 deletions(-)
> >> =20
> >  =20


--Sig_/i2t6EBxqq.bTAjLBweow2/Q
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmWmgSYACgkQI1/ltBGq
qqcJGhAAmfkcI63j+PXidMJLZ9COPIfRspF9wDzlPbiyZOH2nvffM9dDdNKWIm+j
8dMw6bbmp8/AjEdymqKUmqsI0u0G8/otViBEYHA5DPJTNZxmFDW5awvwPZo/86fL
i8jfM9XTDN637bQKorVUR+QEu/CXag/IH5R19YT5QSRfmKGwvfvOYKkdHwAoe29m
Zazcouunhbns8EeRQnxWrwFpn7+gQunM79AwaUt88CxyFFbpxN9t6iU0UThtNFnb
CYKjIwIvYsE3ncULhV47giKpd05tSP0yRDBdPCVgzZO80n16yzvtZDe3pzQGZd2p
4zxOzYmDlu8789qfQReCCzQWoAJ9Wn5H7o4WH09gygqbRtEhpaUbbjX+WQJVl5j5
WCyH2ezdqOSz6mGN1Un9t1thK9oE13fM5v/EdCj+DWUsJbUEeoMcI2ymcBoHWB9C
GSetbRreGTejPDnCvW7c5i4Aa1TxJHHuNWLeBH2MbjLIjzSE/TCBaSoyJr/lol1L
xkDBFD6fnIIK9aNzkAFLjHZDZU/xOz06JlG/CtEE4cOmXfWrm/3PCzCXBF2C5FZn
ppeC1BKzvDIlgA9+lwV+H1YIN7xAc4EDYbksjCWpQwmZAYTcfJrLv732nA7ysRdr
92k6OK5F8WoaaZor9qs2dIT6lUbUoATCzJnY2yoXNl6si+ERA3g=
=EpBy
-----END PGP SIGNATURE-----

--Sig_/i2t6EBxqq.bTAjLBweow2/Q--
