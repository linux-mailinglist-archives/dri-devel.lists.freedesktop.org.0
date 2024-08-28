Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECDC962AAD
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 16:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52A7410E555;
	Wed, 28 Aug 2024 14:47:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="HAeSSRVh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f181.google.com (mail-oi1-f181.google.com
 [209.85.167.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96E9B10E556
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 14:47:36 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id
 5614622812f47-3dd25b2c3f2so917133b6e.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 07:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1724856456; x=1725461256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=C2J/mlh7F9J/cHv2coDYnbQkWETMcnLYeB1Bun1JXTs=;
 b=HAeSSRVhqtnbghcELYiDTzK9nXr4Mj7Ak3mOB3kf8+rUG7HVmYzbU0SX9eD9INMcSK
 WdCfp2FuJZCRMXVi8uFd2GQ7fKySjoSaArQq2LWNe7sVJrKk8iuTtpJGBfPDyFKj5IY0
 rbF40Xdexg7+unlQfvx/kenBVX8BHdB4O8CNpkrtS3Zk+CHyqUfMtADgmcripJU6Rd3o
 xJuXZ4FvWgpamzdtM5x9UpFJiQJ1yXBc4cKYhyAMIsal2KWFM6mFr+hQSichRwQtoL1N
 Pu6Z9h6u6YYf6KadZ1I2QsPfuiGFOOD0ZG6ewET3k4UMEVEe+Wmj+EexTjwp6y3mOfzc
 MV6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724856456; x=1725461256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2J/mlh7F9J/cHv2coDYnbQkWETMcnLYeB1Bun1JXTs=;
 b=rFv6VzlzDc26vG+WbAVCHP+U8SAdHxHF0/y0tDwomYAnSoR+2TAtGVjAembwcdSl9L
 wrm2EOW3TNNM5cKj3zZ5ts40RpIMubmtRHC3HcRVSsgO/bAOR+l1pGvQE26zeCXYj0Vj
 +W/37XvcSUnMfrxMOMAF0kgb4z3aS06t4QMQpPMyz5C1cpTMntGwAj1DpL00FZk5yC9G
 Qg0yGV509O8QkmF+7oBlaZN/H2fXC25R9t6BThyjw+oJ+9L5dcg4KGkqVGH5I48ZMR2t
 JQTXq1cCDYv0yDI/rzUJbHxcP4qJuWsf8lTbXMupwE/CxC90rZre4++qta12YEq7Grml
 T9yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX0ymsBR0obyoqr5SZTeqW0rFfXxhh6JUM1Xmyx5c1Z4H0ndSS4kjiAhQ8i3UkH7Wy8WepCf9yie2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxDw2qwTOrblCqU+5qTxoRKom+7UYdRHLgaqE5jY7qolC14MY3r
 Nm4qidIkomzixT6KE2tdISMz0z+JyWkm/KY2bDnlZGgreVAA4n4PNVyqTWn46b/D77iqbdaY2Gl
 LcbSSbKZ5U1fEsl+ipsTVDr1KrD8=
X-Google-Smtp-Source: AGHT+IGqwHaoxyu1Ts5VQmIVXsEqquzBr76T7mwGn/1PtJvwRe5HJ2RdrA7cRbmARI+4dOE1AHdiw5ivrw+mre8WJmA=
X-Received: by 2002:a05:6808:3c46:b0:3da:b336:7151 with SMTP id
 5614622812f47-3deffb9d3e4mr2196957b6e.40.1724856455677; Wed, 28 Aug 2024
 07:47:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240525142637.82586-1-melissa.srw@gmail.com>
 <2aa13716-daf9-4d07-a8ef-8b43b11725cd@igalia.com>
In-Reply-To: <2aa13716-daf9-4d07-a8ef-8b43b11725cd@igalia.com>
From: Melissa Wen <melissa.srw@gmail.com>
Date: Wed, 28 Aug 2024 11:47:23 -0300
Message-ID: <CAJeY4oEvjBJgF6O9h4bwMP8WMc9pfQw-+zLNtMGDpyYYGrNCwQ@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: remove myself as a VKMS maintainer
To: =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>
Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 dri-devel@lists.freedesktop.org, kernel-dev@igalia.com
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

On Mon, May 27, 2024 at 7:32=E2=80=AFAM Ma=C3=ADra Canal <mcanal@igalia.com=
> wrote:
>
> On 5/25/24 11:26, Melissa Wen wrote:
> > I haven't been able to follow or review the work on the driver for some
> > time now and I don't see the situation improving anytime soon. I'd like
> > to continue being listed as a reviewer.
> >
> > Signed-off-by: Melissa Wen <melissa.srw@gmail.com>
>
> Acked-by: Ma=C3=ADra Canal <mcanal@igalia.com>
>
> Thanks for all the good work you put into VKMS in the last couple of
> years!

Thanks, Ma=C3=ADra.

This patch somehow got lost. I just applied to drm-misc-next.

Melissa

>
> Best Regards,
> - Ma=C3=ADra
>
> > ---
> >   MAINTAINERS | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 7d735037a383..79fe536355b0 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7027,10 +7027,10 @@ F:    drivers/gpu/drm/udl/
> >
> >   DRM DRIVER FOR VIRTUAL KERNEL MODESETTING (VKMS)
> >   M:  Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
> > -M:   Melissa Wen <melissa.srw@gmail.com>
> >   M:  Ma=C3=ADra Canal <mairacanal@riseup.net>
> >   R:  Haneen Mohammed <hamohammed.sa@gmail.com>
> >   R:  Daniel Vetter <daniel@ffwll.ch>
> > +R:   Melissa Wen <melissa.srw@gmail.com>
> >   L:  dri-devel@lists.freedesktop.org
> >   S:  Maintained
> >   T:  git https://gitlab.freedesktop.org/drm/misc/kernel.git
