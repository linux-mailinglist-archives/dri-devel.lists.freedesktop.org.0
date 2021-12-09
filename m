Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D4546F248
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 18:41:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E58A810E179;
	Thu,  9 Dec 2021 17:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9E7410E178
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 17:40:55 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id t26so13409745lfk.9
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 09:40:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=zJn8EMJ3bNTEj0rup3ByEhFgEv6FqrmSjpgYx9Y6/fs=;
 b=THwfLzEETO2LotDmBtfbO7GVo9RpDWd/aau1pNnNfsL6iDlKF9rpdpO1h3BsBtGnhA
 oNeqsvZXCU1qeXPhTr4vG+yWl6NMh8+Wsfo7HT50hxY+ZjFl3uYp4t18U4MpPo4ln7eZ
 SxdNiF7oQN9JM2NE+8KH++oZIRxEumMj/LFAE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=zJn8EMJ3bNTEj0rup3ByEhFgEv6FqrmSjpgYx9Y6/fs=;
 b=iXdvIf+hDIMkW3icTIMs1ZBVOFm2K1VL2evOHeU/R0kRyDCV5VqcJunOtAua+mlT5g
 XKNyhEFdiqELWX/l0+/cZxjf6IAuqgAbR2wSPJL1Y5RBT8R3bD89zXf8NSxh01Tvih5V
 l/AD4kFr9N0GWNduGahGEXoNqExNk+ZJq8g18ZKABdz+FNGZNDOK0PWvvIHDZYeL4Esf
 5qPHquK99gdguQR/Ik2vrD2VGevpbkuTL+f1XnJJZvt10CijtDV4rFq3DXTjdp/pNxgK
 SxdYTE6efpTW8nIEWbaXehXpa9hiLF+Brd6X3iQw38vNkWf5o8NdVW3nFsovUuQZi03E
 cpPg==
X-Gm-Message-State: AOAM5319uSXQITPH0kGNAq7xQi3ahBJ5+hdgrOrx+c59BTMo5nBVu8XP
 siUh9DSQZW9/kfnsJgy2E+uFxRSdYR/ddLsdfZpxPg==
X-Google-Smtp-Source: ABdhPJxRc2UmoPypurDhZ/h36kJMpMBzWRNG3CHeSoDYXQgKpHDaTngOxX39repphKbLrvMBnrfWmkuPkEZQBYrwrUQ=
X-Received: by 2002:a05:6512:1510:: with SMTP id
 bq16mr6888001lfb.628.1639071654062; 
 Thu, 09 Dec 2021 09:40:54 -0800 (PST)
MIME-Version: 1.0
References: <20211027162806.2014022-1-markyacoub@chromium.org>
 <CAAOTY_9xG5NrPZjxcV-SY1q+44WDLLk3UsDJt74FEEnx6kVYug@mail.gmail.com>
In-Reply-To: <CAAOTY_9xG5NrPZjxcV-SY1q+44WDLLk3UsDJt74FEEnx6kVYug@mail.gmail.com>
From: Mark Yacoub <markyacoub@chromium.org>
Date: Thu, 9 Dec 2021 12:40:43 -0500
Message-ID: <CAJUqKUrZcd4KX3zHbPMS=XJddqedSmdELSdv5jzU9ouB9JdSBQ@mail.gmail.com>
Subject: Re: [PATCH] drm/mediatek: Set the default value of rotation to
 DRM_MODE_ROTATE_0
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Sean Paul <seanpaul@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Mark Yacoub <markyacoub@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Dec 8, 2021 at 7:16 PM Chun-Kuang Hu <chunkuang.hu@kernel.org> wrot=
e:
>
> Hi Mark:
>
> Mark Yacoub <markyacoub@chromium.org> =E6=96=BC 2021=E5=B9=B410=E6=9C=882=
8=E6=97=A5 =E9=80=B1=E5=9B=9B =E4=B8=8A=E5=8D=8812:28=E5=AF=AB=E9=81=93=EF=
=BC=9A
> >
> > From: Mark Yacoub <markyacoub@google.com>
> >
> > At the reset hook, call __drm_atomic_helper_plane_reset which is
> > called at the initialization of the plane and sets the default value of
> > rotation on all planes to DRM_MODE_ROTATE_0 which is equal to 1.
>
> This patch looks good to me, but please fix this checkpatch warning:
Uploaded a new revision. Thanks!
>
> WARNING: From:/Signed-off-by: email address mismatch: 'From: Mark
> Yacoub <markyacoub@google.com>' !=3D 'Signed-off-by: Mark Yacoub
> <markyacoub@chromium.org>'
>
> total: 0 errors, 1 warnings, 11 lines checked
>
> Regards,
> Chun-Kuang.
>
> >
> > Tested on Jacuzzi (MTK).
> > Resolves IGT@kms_properties@plane-properties-{legacy,atomic}
> >
> > Signed-off-by: Mark Yacoub <markyacoub@chromium.org>
> > ---
> >  drivers/gpu/drm/mediatek/mtk_drm_plane.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/mediatek/mtk_drm_plane.c b/drivers/gpu/drm=
/mediatek/mtk_drm_plane.c
> > index e6dcb34d30522..accd26481b9fb 100644
> > --- a/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > +++ b/drivers/gpu/drm/mediatek/mtk_drm_plane.c
> > @@ -44,9 +44,10 @@ static void mtk_plane_reset(struct drm_plane *plane)
> >                 state =3D kzalloc(sizeof(*state), GFP_KERNEL);
> >                 if (!state)
> >                         return;
> > -               plane->state =3D &state->base;
> >         }
> >
> > +       __drm_atomic_helper_plane_reset(plane, &state->base);
> > +
> >         state->base.plane =3D plane;
> >         state->pending.format =3D DRM_FORMAT_RGB565;
> >  }
> > --
> > 2.33.0.1079.g6e70778dc9-goog
> >
