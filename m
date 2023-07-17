Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 506A3755CE4
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jul 2023 09:30:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EC4D10E1FA;
	Mon, 17 Jul 2023 07:30:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb30.google.com (mail-yb1-xb30.google.com
 [IPv6:2607:f8b0:4864:20::b30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A2D110E1F1;
 Mon, 17 Jul 2023 07:30:24 +0000 (UTC)
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-c5e76dfcc36so4253390276.2; 
 Mon, 17 Jul 2023 00:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1689579024; x=1692171024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3wrNorCCyoVBq7yRsrry+BeI22Mt9EWPKKY4VMY3qWM=;
 b=HkrsKOI5IR4IcSjqVmdIVgyK4VMm64H2FGrb+MP5cbYr5meh864MrhhIbrirWqv9RO
 bTgTmaX2U4/iYaWs+M2d9Y99ix58w4iSm5WraawL2N9g272JZJx2x/PK0E25hYI+B0BU
 ca9M3ke2uwyE9UzBdIv7hKZNYsE3elw42GA11GyiW/9Lzi5FeXfx30P6td5VnTfs2hGQ
 +WnCreE2ShdNWyTF3wwqZ5gXQP7l2iVJ7I8f1SeuTAhH0mZ7KMeAM3vKxHDNKxvQyp0/
 /gEPNqh1Qa8ISmjfeSM9/6E2UKJAp4SON1lHBr4eWpJzl44CGPbbh1L4r7IC2ymaMR/b
 2y8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689579024; x=1692171024;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3wrNorCCyoVBq7yRsrry+BeI22Mt9EWPKKY4VMY3qWM=;
 b=a+Nl/csqR0hiCtWAotPbxCWPvnx626k4YnEFCORIJiSqNTO3C+Xxq1u+SML4mNncKl
 tRB27A3tmejwZgDEoya/KVN9r3C3/J6qsS7xW0M4A16BmhfaVaAANpwkydTkgMHLp+5q
 HJ3OueTqeDBv/G1WuLtqvyNPrqYc/PNx8FbMlNkCFLZK6q2QUVcwUtYIYxbS5Tl50NSn
 61HpdbDrfY8gjsTeWOAkiKriqGUdZpnkpvUmWnKp/UEaDvR519cHq0BqzCdQr+/u9NH0
 vPSf18RuRAXyoxosBzGcxJ797+zmXXkOAIZAttV2c8P/bmLijZoeXjAkAnbdUqnA7gus
 2bNw==
X-Gm-Message-State: ABy/qLa517fmHqb+x3hxMhZ/uYrWPwnMPGxqlTwWrBa5ZSyZx7b9WBgb
 weYB5mcfJ08FG/wP1bjU+Ns/ym5iTr5g+5Cr63M=
X-Google-Smtp-Source: APBJJlFxWLZzr2qfJg4Tg8dg1ARW0RzgGz6qMVxi4+GrLcJSLQvSh/wjqzLEC6AYoB4ojTQXio7+k2hSEnOs7BIqLG4=
X-Received: by 2002:a25:a265:0:b0:bfe:a882:c8ce with SMTP id
 b92-20020a25a265000000b00bfea882c8cemr9649606ybi.5.1689579023802; Mon, 17 Jul
 2023 00:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230630115651.354849-1-James.Zhu@amd.com>
 <wBFta68Nq7iIaszeM9WT6v04l1DSIEs2cM-dOQ3uMWbFM2B74j43LU4Vm3VvzLrTfJRtZ8zM2c3AAxtMsqKcVlNtBuaJlITqtIRZzBuT56M=@emersion.fr>
In-Reply-To: <wBFta68Nq7iIaszeM9WT6v04l1DSIEs2cM-dOQ3uMWbFM2B74j43LU4Vm3VvzLrTfJRtZ8zM2c3AAxtMsqKcVlNtBuaJlITqtIRZzBuT56M=@emersion.fr>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 17 Jul 2023 08:30:12 +0100
Message-ID: <CACvgo50YDLkavfidjQAmrsxHWJEtCD6QrC8duuz4F-C144RtDw@mail.gmail.com>
Subject: Re: [PATCH] drm: support up to 128 drm devices
To: Simon Ser <contact@emersion.fr>
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
Cc: jamesz@amd.com, Pekka Paalanen <pekka.paalanen@collabora.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org,
 wayland-devel <wayland-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, James Zhu <James.Zhu@amd.com>,
 christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 14 Jul 2023 at 11:32, Simon Ser <contact@emersion.fr> wrote:
>
> (cc Daniel Vetter and Pekka because this change has uAPI repercussions)
>
> On Friday, June 30th, 2023 at 13:56, James Zhu <James.Zhu@amd.com> wrote:
>
> > From: Christian K=C3=B6nig <ckoenig.leichtzumerken@gmail.com>
> >
> > This makes room for up to 128 DRM devices.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Signed-off-by: James Zhu <James.Zhu@amd.com>
> > ---
> >  drivers/gpu/drm/drm_drv.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
> > index 73b845a75d52..0d55c64444f5 100644
> > --- a/drivers/gpu/drm/drm_drv.c
> > +++ b/drivers/gpu/drm/drm_drv.c
> > @@ -137,7 +137,7 @@ static int drm_minor_alloc(struct drm_device *dev, =
unsigned int type)
> >               r =3D idr_alloc(&drm_minors_idr,
> >                       NULL,
> >                       64 * type,
> > -                     64 * (type + 1),
> > +                     64 * (type + 2),
>
> The type comes from this enum:
>
>     enum drm_minor_type {
>         DRM_MINOR_PRIMARY,
>         DRM_MINOR_CONTROL,
>         DRM_MINOR_RENDER,
>         DRM_MINOR_ACCEL =3D 32,
>     };
>
> Before this patch, 0..63 are for primary, 64..127 are for control (never
> exposed by the kernel), 128..191 are for render, 2048..2112 are for accel=
.
> After this patch, 0..127 are for primary, 64..191 are for control (never
> exposed by the kernel), 128..255 are for render, 2048..2176 are for accel=
.
>
> I'm worried what might happen with old user-space, especially old libdrm.

I also share the same concern. Although the bigger issue is not libdrm
- since we can update it and prod distributions to update it.
The biggest concern is software that cannot be rebuild/updated -
closed source and various open-source that has been abandoned.

As mentioned in the gitlab ticket - the current style of embedding the
uABI/uAPI in each and every application is not great IMHO. That is why
I've introduced the `drmGetDevices2` API, to consolidate most of the
chaos in a single place.

For going forward, here is one way we can shave this yak:
 - update libdrm to max 64 nodes
 - roll libdrm release, nag distributions to update to it // could be
folded with the next release below
 - update libdrm to use name driven type detection
 - roll libdrm release, nag distributions to update to it
 - once ^^ release hits most distributions, merge the above proposed
kernel patch
   - the commit message should explain the caveats and fixed libdrm version
   - we should be prepared to revert the commit, if it causes user
space regression - fix (see below) and re-introduce the kernel patch
1-2 releases later

In parallel to all the above, as a community we should collectively
audit and update open-source applications to the `drmDevices2` API.

As with other legacy (DRI1), this one will take some time but we can get th=
ere.

HTH
Emil
