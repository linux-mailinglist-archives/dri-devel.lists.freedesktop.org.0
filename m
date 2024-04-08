Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C55589CCC4
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 22:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E509911285A;
	Mon,  8 Apr 2024 20:05:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="N74Cd/iy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59EE511285A;
 Mon,  8 Apr 2024 20:05:56 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2a5595eecdaso449401a91.3; 
 Mon, 08 Apr 2024 13:05:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712606756; x=1713211556; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NUqdZE6kzzC+YTBzuDMEGCl6gVl6Zy5qnlm5WmWCMEw=;
 b=N74Cd/iy7BhMAVXheYyUwzR7qEzkm4h4Ln49BYh+6bG7TzlVuAvfK21WjxxbmoTvQH
 wPmkkzpLceby8zB37KFDsEDC8p1hAlIu8091eGwi349uV+adwXCJgMhNvZemPc2zOE5O
 jPicrSIp25ZfofXJOhWKKKxvMti54hP+HzXjWCgy3oz209pOowFdKmU0JRvZdkHWKpV5
 lGJnoFVT/jjoaYMDzr89t+7Ad42ivDoeu9vxPXqBqFstKi5S9eYTnJH7Oc0e2IeIXQ61
 O9EeXVOUOH5YrnQe3DjXn6ULAF081lmCP/a+On6iZzHIe/ypLXUb1A3e0873T1CBO/rf
 bVBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712606756; x=1713211556;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NUqdZE6kzzC+YTBzuDMEGCl6gVl6Zy5qnlm5WmWCMEw=;
 b=QTzqBVQLpKtupIJ7Wz6rZgAB/Iy1PEXd98Lxfyi8JUbonysLBcYMvnhWH3n/P9udJy
 G1zV/CsZgFnv7FbY+LdYVT9aM4S/G+5ZaEnIGywh3OEP5Kc2oavSYUed6GWZYUfxMcH2
 O67Wt+1oCIQBKQ675gHnDHqF92RzhB2IFO+4Yn1lwnkTnL0Qtq3ULz4wiNywdl6byohC
 +av7hZUGCcmrfxxkdpMqhKjdICxY9xMtRF2qaXAPBkv2AM8a3JAdLokDacskLtTF343d
 X60RNlx6pGPQz+NYDf/IaKT2HL/ZqmKVpXdPKAFlYq1NHwzFLJOa8sqEmQG7jJjCgPng
 grAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5DMKC41UFRP/s8w9CYL0oJq/PojpJ3EY68PMw1plv3CalRa6fJgkKn1b5SH0YKdo5r20CdpT0xoSjIrn0dCrvYFIKimMXVWtQZ84ygIUmeLPXwTeyXTevXrTxt/YCTh8u7GSXvEwQHEY3e8t/Zw==
X-Gm-Message-State: AOJu0YzHDkCXB64RAdl8o24Q9W8ioIo/tG7mZvyewbebP1p3KFhZETih
 Htan1H6B3gD7R+7w5soGkxOA+TKskythyBlSuidPceICP1Pm92Wpl+4HEfvyWG4oPy6PpLWpgsW
 JsQ4R8acz9+z5FbCVR85JdVtbIbA=
X-Google-Smtp-Source: AGHT+IFAsAW5Q31/Vc72tX8MYJxjAXGXGJkMw6FDJT5agkQzF72ip3OaPkCp8oywDbR6fsOAlW6JqIPz8LjboQowH2U=
X-Received: by 2002:a17:90a:a38a:b0:2a2:7693:399e with SMTP id
 x10-20020a17090aa38a00b002a27693399emr7380737pjp.4.1712606755689; Mon, 08 Apr
 2024 13:05:55 -0700 (PDT)
MIME-Version: 1.0
References: <AS8PR02MB723799AFF24E7524364F66708B392@AS8PR02MB7237.eurprd02.prod.outlook.com>
 <c2182ac1-368c-441b-b6ed-b5d15a8f9f38@amd.com>
In-Reply-To: <c2182ac1-368c-441b-b6ed-b5d15a8f9f38@amd.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Mon, 8 Apr 2024 16:05:43 -0400
Message-ID: <CADnq5_OsJ+VxY9z_iqOscvWAoRqK2hZ0thUOHtBzhfo3De4EoA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/radeon/radeon_display: Decrease the size of
 allocated memory
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Erick Archer <erick.archer@outlook.com>,
 Alex Deucher <alexander.deucher@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Kees Cook <keescook@chromium.org>, 
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Apr 1, 2024 at 8:35=E2=80=AFAM Christian K=C3=B6nig <christian.koen=
ig@amd.com> wrote:
>
> Am 30.03.24 um 17:34 schrieb Erick Archer:
> > This is an effort to get rid of all multiplications from allocation
> > functions in order to prevent integer overflows [1] [2].
> >
> > In this case, the memory allocated to store RADEONFB_CONN_LIMIT pointer=
s
> > to "drm_connector" structures can be avoided. This is because this
> > memory area is never accessed.
> >
> > Also, in the kzalloc function, it is preferred to use sizeof(*pointer)
> > instead of sizeof(type) due to the type of the variable can change and
> > one needs not change the former (unlike the latter).
> >
> > At the same time take advantage to remove the "#if 0" block, the code
> > where the removed memory area was accessed, and the RADEONFB_CONN_LIMIT
> > constant due to now is never used.
> >
> > Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#op=
en-coded-arithmetic-in-allocator-arguments [1]
> > Link: https://github.com/KSPP/linux/issues/160 [2]
> > Signed-off-by: Erick Archer <erick.archer@outlook.com>
>
> Well in general we don't do any new feature development any more for the
> radeon driver.
>
> But this cleanup looks so straight forward that the risk of breaking
> something is probably very low.
>
> Acked-by from my side, but Alex should probably take a look as well.

I can't remember why that was done that way.  Maybe some leftover from
the early KMS days before we finalized the fbdev interactions?
Anyway, patch applied.  Thanks.

Alex

>
> Regards,
> Christian.
>
> > ---
> > Changes in v2:
> > - Rebase against linux-next.
> >
> > Previous versions:
> > v1 -> https://lore.kernel.org/linux-hardening/20240222180431.7451-1-eri=
ck.archer@gmx.com/
> >
> > Hi everyone,
> >
> > Any comments would be greatly appreciated. The first version was
> > not commented.
> >
> > Thanks,
> > Erick
> > ---
> >   drivers/gpu/drm/radeon/radeon.h         | 1 -
> >   drivers/gpu/drm/radeon/radeon_display.c | 8 +-------
> >   2 files changed, 1 insertion(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/radeon/radeon.h b/drivers/gpu/drm/radeon/r=
adeon.h
> > index 3e5ff17e3caf..0999c8eaae94 100644
> > --- a/drivers/gpu/drm/radeon/radeon.h
> > +++ b/drivers/gpu/drm/radeon/radeon.h
> > @@ -132,7 +132,6 @@ extern int radeon_cik_support;
> >   /* RADEON_IB_POOL_SIZE must be a power of 2 */
> >   #define RADEON_IB_POOL_SIZE                 16
> >   #define RADEON_DEBUGFS_MAX_COMPONENTS               32
> > -#define RADEONFB_CONN_LIMIT                  4
> >   #define RADEON_BIOS_NUM_SCRATCH                     8
> >
> >   /* internal ring indices */
> > diff --git a/drivers/gpu/drm/radeon/radeon_display.c b/drivers/gpu/drm/=
radeon/radeon_display.c
> > index efd18c8d84c8..5f1d24d3120c 100644
> > --- a/drivers/gpu/drm/radeon/radeon_display.c
> > +++ b/drivers/gpu/drm/radeon/radeon_display.c
> > @@ -683,7 +683,7 @@ static void radeon_crtc_init(struct drm_device *dev=
, int index)
> >       struct radeon_device *rdev =3D dev->dev_private;
> >       struct radeon_crtc *radeon_crtc;
> >
> > -     radeon_crtc =3D kzalloc(sizeof(struct radeon_crtc) + (RADEONFB_CO=
NN_LIMIT * sizeof(struct drm_connector *)), GFP_KERNEL);
> > +     radeon_crtc =3D kzalloc(sizeof(*radeon_crtc), GFP_KERNEL);
> >       if (radeon_crtc =3D=3D NULL)
> >               return;
> >
> > @@ -709,12 +709,6 @@ static void radeon_crtc_init(struct drm_device *de=
v, int index)
> >       dev->mode_config.cursor_width =3D radeon_crtc->max_cursor_width;
> >       dev->mode_config.cursor_height =3D radeon_crtc->max_cursor_height=
;
> >
> > -#if 0
> > -     radeon_crtc->mode_set.crtc =3D &radeon_crtc->base;
> > -     radeon_crtc->mode_set.connectors =3D (struct drm_connector **)(ra=
deon_crtc + 1);
> > -     radeon_crtc->mode_set.num_connectors =3D 0;
> > -#endif
> > -
> >       if (rdev->is_atom_bios && (ASIC_IS_AVIVO(rdev) || radeon_r4xx_ato=
m))
> >               radeon_atombios_init_crtc(dev, radeon_crtc);
> >       else
>
