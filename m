Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7EFD9968DC
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 13:32:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D241010E111;
	Wed,  9 Oct 2024 11:32:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="g7vkQ1op";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f175.google.com (mail-yb1-f175.google.com
 [209.85.219.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CF0410E111
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 11:32:39 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id
 3f1490d57ef6-e2908e8d45eso6435276.2
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Oct 2024 04:32:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1728473558; x=1729078358;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=008a6k3ZxIHkOV0CVfLapnrZh0drWKWmGkJbRnXXaRQ=;
 b=g7vkQ1opHkK9Fu1ARd0jgrAq72YWV5QenxyaMHq81DEVf2wqWSMGnlPtY6/4p5+/BU
 Ny42Ksz/+rykprzJ5EVYsCZBOD5QvqGLg46lY9iaLAr1wBZNOU0oDIZxirEtYUuHcQou
 qXTL3o32OcmEBh1pcLSW7RJ4f3c+YsMrWNtX3mNpgo0UfNhlTaVlzt06D4iNmpMICWCY
 g3detzmdHOTj6UZmaTg3+dWV1V2WODMwFSeHHje0O12/elT+/0scTNBYigrkG/R0uViY
 yMbVZwSgMJqDcOBoX4IE1w6t79EX/RYbsEPS0s77j6zlFZtIMS2ex5njIK0ztSvxlrvj
 1uJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728473558; x=1729078358;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=008a6k3ZxIHkOV0CVfLapnrZh0drWKWmGkJbRnXXaRQ=;
 b=MRTh1DP4b7s4qfGlSeNHdYSKvZtDp0mne6q3u6SAO2So0F/YOPW36eFeJpMMfIkmJ1
 vcukX3Phc8dwud9nYg50anmuoBtNUxQHsvRNO0xtaxDD5kSvVHTK56qBZfVq0JnSArly
 u11Ck3lmJhknw5ECqNQK8LkG58YMckOnHoQ58v8xA6uxdci21NDfBtSEwxKR85uR5oZe
 NhdKAkpYQd4bObLlSEIzpoF4XZg1Zc1DTWq4xo6RJzKbzfrH8e4aP8kI4P6xnITa37bd
 e8MAvpYxQ7keneECT+cCrrcIjXYz9HJk2guzCCPPXBJ6PjMvfCHlgeNq6q8sY+FA+BPS
 r0bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX6JKzJDbNFZWHj00L4sGt442FxdtTyqwBiOXGkM3BOCYBs/AoUkcZ+28uP8hidduolLEdaCBHktnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzd8x0qqfxcI9u+VNBEQFnfZ8rV2klKpsLoUQClxEjEeOedVjav
 lxppI8Jg2ziwoC0aU+GFLOxjULtR6OnHmM3c1hyllEVQOmfPTwOWtrFtQY9SZ0KkCeAaNjBtZdx
 UfO+38QB2Slg68we/Fx48K/084iKILY0TZbP0JA==
X-Google-Smtp-Source: AGHT+IGF6K2rkk5aK8OxRzvwgQwEZfKkBm8BbIv2Dv+dz+zXDULDbCRgjuRxw3SCMfT8bzTBK44ZnD9sD3fVbMuBX7w=
X-Received: by 2002:a05:6902:2b89:b0:e11:6348:5d95 with SMTP id
 3f1490d57ef6-e28fe32e09amr1681374276.7.1728473558552; Wed, 09 Oct 2024
 04:32:38 -0700 (PDT)
MIME-Version: 1.0
References: <20241008-drm-vc4-fixes-v1-0-9d0396ca9f42@raspberrypi.com>
 <20241008-drm-vc4-fixes-v1-3-9d0396ca9f42@raspberrypi.com>
 <a0922d76-0dc0-46a5-8408-a8eda3a07f26@igalia.com>
In-Reply-To: <a0922d76-0dc0-46a5-8408-a8eda3a07f26@igalia.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 9 Oct 2024 12:32:21 +0100
Message-ID: <CAPY8ntDTY-ybd8vViTP4vGuxT8DQsssTY_KJ2EQ6xhk2sV98UA@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm/vc4: Correct generation check in vc4_hvs_lut_load
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Maxime Ripard <mripard@kernel.org>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, dri-devel@lists.freedesktop.org, 
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

Hi Maira

Thanks for the review

On Wed, 9 Oct 2024 at 02:30, Ma=C3=ADra Canal <mcanal@igalia.com> wrote:
>
> Hi Dave,
>
> On 10/8/24 13:44, Dave Stevenson wrote:
> > Commit 24c5ed3ddf27 ("drm/vc4: Introduce generation number enum")
> > incorrectly swapped a check of hvs->vc4->is_vc5 to
> > hvs->vc4->gen =3D=3D VC4_GEN_4 in vc4_hvs_lut_load, hence breaking
> > loading the gamma look up table on Pi0-3.
> >
> > Correct that conditional.
> >
> > Fixes: 24c5ed3ddf27 ("drm/vc4: Introduce generation number enum")
> > Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
> > ---
> >   drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hv=
s.c
> > index c5ebc317188a..1edf6e3fa7e6 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -224,7 +224,7 @@ static void vc4_hvs_lut_load(struct vc4_hvs *hvs,
> >       if (!drm_dev_enter(drm, &idx))
> >               return;
> >
> > -     if (hvs->vc4->gen =3D=3D VC4_GEN_4)
> > +     if (hvs->vc4->gen !=3D VC4_GEN_4)
>
> Again, another nit: I believe `hvs->vc4->gen > VC4_GEN_4` is more
> semantic and it's the standard I usually see around the driver.

With 24c5ed3ddf27 which this is fixing, all instances in vc4_hvs.c
were changed to =3D=3D VC4_GEN_4 or =3D=3D VC4_GEN_5. So I guess =3D=3D VC4=
_GEN_5
would have been the better option here.

Yes downstream we now have GEN_6 (which I'm nearly at a point to send
to the list), and I'll need to update this conditional when that's
added.
I'll leave it as is for now, and ensure I've done an audit of all of
them before pushing GEN_6.

Thanks
  Dave

> But this isn't critical, so:
>
> Reviewed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> Best Regards,
> - Ma=C3=ADra
>
> >               goto exit;
> >
> >       /* The LUT memory is laid out with each HVS channel in order,
> >
