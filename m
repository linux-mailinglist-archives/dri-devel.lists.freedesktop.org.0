Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC01EB98594
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 08:07:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E59AB10E100;
	Wed, 24 Sep 2025 06:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="XjL2J32d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46D8510E100
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 06:07:49 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-4248b3204d4so19248555ab.3
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Sep 2025 23:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1758694068; x=1759298868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dasyWeqvVNrFPy7VboPpD0Yyy39SDT10f/tzxZcxFug=;
 b=XjL2J32d5QWxLBXzbSws6iJrH6r72Afdh7orJRZmEvhGlV8Gmbkt/ygBsqAuShNghY
 M9cw3eIT7RtWJ6ZvJOT1iuUUu/6kAdrRgxuBR34ygvwraZsaAY5tWQ1gYVOXexCscYgZ
 Eitww9mImhOJhA6sE9m/wjg7a1FXn2trOfWuPQOHxoS9wlG1HAUSqnv/THg2EPDLTNpK
 8mmhgzx7RYHVjqiX1styYNm3H88h+Hd2k/0eM8J55Oc5PMGh6SVaO1kKIrA2QncZxcst
 51AhJmp4aIaHcqaOZxK8UHoOvBOLecce/90+EUC4+gZPTifn0PaWQDxd1YsptBFIlL4V
 gXaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758694068; x=1759298868;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dasyWeqvVNrFPy7VboPpD0Yyy39SDT10f/tzxZcxFug=;
 b=Ok/mCQ2PYgPV4rb8mAUQ95GwnBdtpmO9OeltR7jpyLBY0VcBczrls+rt0xRZZHWKNB
 h92srOBqLdEi/IS/O07bXgaHxxXaWCAqr66IiUoVaGk9I787dLiQphbgvKXSyhZ++ACO
 bvVCkL5tzZ73tSnJI6G2b0ck0xQ4M2SWSWikCmH7L1Hzofodmbp40JnxAGoDZgU58u+u
 G/FmDeLuEGbzDUMPMCJWDHEBMV8wSt4+y7CPuMHcntIhZM690qTyai+6/8+LB1qWCzpS
 zt716OHWvFXqwkfUASgZoC80gtBb7OwzHzbI74oR/j9ns9whCCpBLPDYvcm0qTWrS/mN
 5d/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+/JjZxFx4H1iFLdYDlywB2b1JNgH3zYVMio1Wdq1644WaDyrIm4P46xGgu9T6lgGWm19dxkxRtd0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeqZl1HNkV3z1VKD1d4tYrHJ2zAFUUsQYE0Z1RqcGHTbfNLRwC
 3F2ZKjguQFT3lVNcJ38Xfk+twx/KBwOcmnSDTpdNW+ewiXuuGQ4d+sVySh2WZ58MhJnRK/px5pB
 vRvsWgtxcw0QUWIUCU1A2Zb3SPigc56Y=
X-Gm-Gg: ASbGnctNO5O/ljzFtxOeh6pVYXDSo4eGtQ+sddUxb8N5HYyZzErsuzpy6T4C6uJj+fc
 n27zWGw6CdM4UYpCFLctzOiOrbZp39VOZuGqUxvchjUZZjojToKDFsgCbIC2LXZdWqRhwffbUsW
 53IO42yh/xHBacin03SLDOX7XTMx8j/BJ2nRWQ8RxP+BIaSwD1hHzgY/RQyXUSNHuHe9UaKDFyG
 adQfg==
X-Google-Smtp-Source: AGHT+IF7Azm3CSbUgIQ4C9xp80mGayFs6CTpry8PZJSTktWx2LuSb+ASvg7efRnLQb4fysk7hEHLlIkaBjL07vspxo0=
X-Received: by 2002:a05:6e02:1d8a:b0:424:82a6:3105 with SMTP id
 e9e14a558f8ab-42581e7a637mr77513085ab.18.1758694068284; Tue, 23 Sep 2025
 23:07:48 -0700 (PDT)
MIME-Version: 1.0
References: <20250923110025.1358920-1-rk0006818@gmail.com>
 <712a27fc6c4060e67b3da58cb8564387b40b5971@intel.com>
In-Reply-To: <712a27fc6c4060e67b3da58cb8564387b40b5971@intel.com>
From: Rahul Kumar <rk0006818@gmail.com>
Date: Wed, 24 Sep 2025 11:37:36 +0530
X-Gm-Features: AS18NWD5IFOEWGCNPxL9ZnD6mR-sqY_bheO6aEH2LgX-tdaroQ-7z_CDe3m7m7E
Message-ID: <CAKY2RybJ+kyj=5E1pnu2RUEW3T7rXLrqyedR5LkfX=bUOv=_8A@mail.gmail.com>
Subject: Re: [PATCH] drm/tiny: Use kmalloc_array() instead of kmalloc()
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: lanzano.alex@gmail.com, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-kernel-mentees@lists.linuxfoundation.org, skhan@linuxfoundation.org
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

On Tue, Sep 23, 2025 at 7:21=E2=80=AFPM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Tue, 23 Sep 2025, Rahul Kumar <rk0006818@gmail.com> wrote:
> > Documentation/process/deprecated.rst recommends against the use of
> > kmalloc with dynamic size calculations due to the risk of overflow and
> > smaller allocation being made than the caller was expecting.
> >
> > Replace kmalloc() with kmalloc_array() in drivers/gpu/drm/tiny/repaper.=
c
> > to make the intended allocation size clearer and avoid potential overfl=
ow
> > issues.
> >
> > Signed-off-by: Rahul Kumar <rk0006818@gmail.com>
> > ---
> >  drivers/gpu/drm/tiny/repaper.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repa=
per.c
> > index 5c3b51eb0a97..4d439a2d973a 100644
> > --- a/drivers/gpu/drm/tiny/repaper.c
> > +++ b/drivers/gpu/drm/tiny/repaper.c
> > @@ -535,7 +535,7 @@ static int repaper_fb_dirty(struct drm_framebuffer =
*fb,
> >       DRM_DEBUG("Flushing [FB:%d] st=3D%ums\n", fb->base.id,
> >                 epd->factored_stage_time);
> >
> > -     buf =3D kmalloc(fb->width * fb->height / 8, GFP_KERNEL);
> > +     buf =3D kmalloc_array(fb->width, fb->height / 8, GFP_KERNEL);
>
> That's just not the same thing, though.
>

Thanks Jani, you are right. My change made the allocation size
different from the original (width * height / 8). The current code is
fine, so I will not change it.

Thanks,
Rahul


> BR,
> Jani.
>
> >       if (!buf) {
> >               ret =3D -ENOMEM;
> >               goto out_exit;
>
> --
> Jani Nikula, Intel
