Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281958739C1
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 15:49:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AAE81128B0;
	Wed,  6 Mar 2024 14:49:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="at8hu8yk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F905113258
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 14:49:29 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5645960cd56so2704250a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 06:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1709736567; x=1710341367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EAkc1OHDacbLTatYDw+lBf1IqKACMXV+5rXIO07fBAo=;
 b=at8hu8yk44Ud3MTiz8uV7sA8Vz5sM9hEZAd5OlcUx9O2mTqTBFifUc/qjoG85BO8pO
 sU+pDN7vx/mGwGW9OiiYAfAniclvDmZr80FnTOOVYsO/s8bVSUMZkINrWJtLjytDKMLd
 Gu82BXBI3t0867Dul2GZy5IsyCzbqtzyly3dy8a3L7iutWbyAjv5qm3rPUvVvWkhCu+6
 zLMKgWNZhXjxNOyj1+YjJ039djNFL4kgSYE9gRF7Ppuh//F3luyfpdFF5bhYICOKc4WL
 tZxiyWeyhGYbicY5aXYpTFRALLrQ76MiHEvtT2XUIL6bd9KengoYdhKiDS/IS6Omk0bP
 KHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709736567; x=1710341367;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EAkc1OHDacbLTatYDw+lBf1IqKACMXV+5rXIO07fBAo=;
 b=kI/2Xrcximx26uDUGQy4Ge+pGG7fkg2iPvaNX5eLC9tRkbcvybIwOxOFZrWfnfMLO2
 BT4d1o3nQilTe+gx6X3Rs8cyXHmi9KEZb/gMis6BhTLgg6eAnkoK6XNTTPr4v7gbaO7s
 +NxUyoLlHetqdunyAZslLge2HFhPuN2Q/ODimdXDLM6eei+liyGtDy7czulsfKZgUsQz
 NwmaM4c/PiO0ZrdIa+vWEUOEsG3O0C6YPPpw/xMyxmv0lUdRkitrEE4r4sbpiU8tWHAv
 I39GCuveqKv48ppPzxfMEENRIwMb5J8j9MkuvhBF/yVx4/fZNvEEOs6+blGd1rt+QDNE
 xBHA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVzJgECJ3OIx6Auvi/R/128NJ1QqEq1R9PD24dfewlzzXcnovzAWdsK7FrN0EGongRszrQ5flpGHeXrHOtgI9jN1Pqy96eqIVbiOTjW1xcv
X-Gm-Message-State: AOJu0Yym6w9na5H5PA7Ug5gfbmYPZdHstNpxrq82fj8+mYXznWk6YcZt
 MqWv/oLwNC4mTKrxlMI9dMm4FBVmUvEoeKbds/vBLpeV+l9wMEPzmaAe2kxQhkK53GuSkgy1p6Z
 CPHYRq64Ykt5PQmeqCaHWr5SVGs8=
X-Google-Smtp-Source: AGHT+IGpzGXwfAEXyPE1R2p6+5ryRp3o0dtuvz8V70oDQzqGHjU35trofjh01j1cedUDehM15sSsDGsocB7kbpcnnhs=
X-Received: by 2002:a05:6402:2151:b0:566:6a0e:7625 with SMTP id
 bq17-20020a056402215100b005666a0e7625mr10360598edb.7.1709736567251; Wed, 06
 Mar 2024 06:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20240227141928.1.I24ac8d51544e4624b7e9d438d95880c4283e611b@changeid>
 <60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de>
In-Reply-To: <60dc7697-d7a0-4bf4-a22e-32f1bbb792c2@suse.de>
From: Rob Clark <robdclark@gmail.com>
Date: Wed, 6 Mar 2024 06:49:15 -0800
Message-ID: <CAF6AEGs2zCP1SWPzxz4v2CU--yyEsN0+PS3dKM1nOuGyVkCpLg@mail.gmail.com>
Subject: Re: [PATCH] drm/udl: Add ARGB8888 as a format
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org, 
 Rob Clark <robdclark@chromium.org>,
 Javier Martinez Canillas <javierm@redhat.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 David Airlie <airlied@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, Sean Paul <sean@poorly.run>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 linux-kernel@vger.kernel.org
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

On Wed, Mar 6, 2024 at 4:18=E2=80=AFAM Thomas Zimmermann <tzimmermann@suse.=
de> wrote:
>
> Hi,
>
> sorry that I did not see the patch before.
>
> Am 27.02.24 um 23:19 schrieb Douglas Anderson:
> > Even though the UDL driver converts to RGB565 internally (see
> > pixel32_to_be16() in udl_transfer.c), it advertises XRGB8888 for
> > compatibility. Let's add ARGB8888 to that list.
>
> We had a heated discussion about the emulation of color formats. It was
> decided that XRGB8888 is the only format to support; and that's only
> because legacy userspace sometimes expects it. Adding other formats to
> the list should not be done easily.

OTOH it is fixing a kernel change that broke userspace

> >
> > This makes UDL devices work on ChromeOS again after commit
> > c91acda3a380 ("drm/gem: Check for valid formats"). Prior to that
> > commit things were "working" because we'd silently treat the ARGB8888
> > that ChromeOS wanted as XRGB8888.
>
> This problem has been caused by userspace. Why can it not be fixed there?
>
> And udl is just one driver. Any other driver without ARGB8888, such as
> simpledrm or ofdrm, would be affected. Do these work?

Probably any driver where ARGB8888 is equivalent to XRGB8888 (ie.
single primary plane, etc) should advertise both.

BR,
-R

> Best regards
> Thomas
>
> >
> > Fixes: c91acda3a380 ("drm/gem: Check for valid formats")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
> > ---
> >
> >   drivers/gpu/drm/udl/udl_modeset.c | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/drivers/gpu/drm/udl/udl_modeset.c b/drivers/gpu/drm/udl/ud=
l_modeset.c
> > index 7702359c90c2..0f8d3678770e 100644
> > --- a/drivers/gpu/drm/udl/udl_modeset.c
> > +++ b/drivers/gpu/drm/udl/udl_modeset.c
> > @@ -253,6 +253,7 @@ static int udl_handle_damage(struct drm_framebuffer=
 *fb,
> >   static const uint32_t udl_primary_plane_formats[] =3D {
> >       DRM_FORMAT_RGB565,
> >       DRM_FORMAT_XRGB8888,
> > +     DRM_FORMAT_ARGB8888,
> >   };
> >
> >   static const uint64_t udl_primary_plane_fmtmods[] =3D {
>
> --
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
>
