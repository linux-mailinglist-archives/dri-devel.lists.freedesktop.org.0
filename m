Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C549EEBEA
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 16:29:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E43BE10E538;
	Thu, 12 Dec 2024 15:29:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="la9d5ffE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C5AB10E538
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 15:29:35 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e38938a55e7so522982276.2
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 07:29:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google; t=1734017375; x=1734622175;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ziTdzSVRBojAh7UOXHpRETilYMYbJPc01s+yNskJcaw=;
 b=la9d5ffEsSVSKr2BsyMqc7trX0hLKopaA46YXt9ex8xsoT+by9hcvccAMOM8mvVbPn
 MiYXwMvY0wS2sdwtlOmDOTHReQsZLoo/4/kJPbS7iQuFH2lBW3B1+oTFOHLF9roTE0zf
 b+9wGbrptbm6dU6e3COSMDzYl9uZcnLVa972s2zj8KotUZk22Zc2REEe/QrD2Fk/LXxP
 h6YO2+NCr8YvKu0OlwZ6/WoJ32nIWUMnsWwY2iLXIr6+injVh1lD+P5fRCC5m8OvCRZ2
 hbwYT+1K8b38S0yUAht8bWGacra0HJE1y9+KE2o/CsikqxyyQpwSrOwE/88+7B25e1N4
 8+JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734017375; x=1734622175;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ziTdzSVRBojAh7UOXHpRETilYMYbJPc01s+yNskJcaw=;
 b=pGJQv9ZlofP1GZIIK6YNAknNJGJovh1Sl1sO+zS+zf+C5vQygioYuVv/VK+NzYPvtH
 u49M73cLDr1B/CvB//ajIAgJEp6RTMRa6ltVUJyfJk5ngogydlSJVRACO/ir6BAmQ+Zj
 C1mnMzspP9K6gLmgS4zNXYi9xPulEgjjuuT1uuletBAg4lRoOqUWD79euoePZ3z/+/Wi
 wUA+98nJYEZ9VYnMTLM83KO2Gx5YD1QE6WMnEHPo+Fe0knwNZPTzmJZ5Ifvw9yCGn4C4
 fb1ClcCsHaICH4uiJeIW+LRaSyOKQbTl9gzM0rF/bV1KDEuaf9M6jxaKXmRRsy5y5pro
 KzQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWqXBTHfF5VMet+Cc2Fy6mG+RY16dO6edKVOaAwnPkMF0YT0Lb9IDlXnOcPlg3JVQ0enwThOWaS33w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysmJBKz/Ajke/60x5H/NndLKgphenORMwHE4uZ6TpOogHefyKc
 bHpU1zaWrhPkyORdFq6zZ7oJc/gNVd0TBGpnzvAlMjGsp32xeAfBt2FaFNjVHdTahs5oEYJPZ6I
 YXRkvexCoeL+Zjp5JPy4q0Bcbtw7PosxApgp3sQ==
X-Gm-Gg: ASbGnctjG8BbYHPRkFvoZqX7QiF4HRp2rYJBdEGsNTvytPvZ9i+QurRhGyXYjDjhaSL
 FuW2goTwxwp8FNKtB3yHJ/YG7vB6tN1FPTMbfRg==
X-Google-Smtp-Source: AGHT+IHSTvaRuk1a2h/8SW5H+X92KkYTlzLgic62LoMhq1Fpy7zQqRHv7pSca18JZvBcyW3l9eExwNR4jPCmNVbk61k=
X-Received: by 2002:a05:6902:118b:b0:e35:dac9:bd5a with SMTP id
 3f1490d57ef6-e41c3620479mr965142276.25.1734017374713; Thu, 12 Dec 2024
 07:29:34 -0800 (PST)
MIME-Version: 1.0
References: <b61a81b2-0101-43bd-a4f6-09cf3a016484@stanley.mountain>
 <CAPY8ntBkQ9PrNx51g+W6TPTLhFjQrTC1vitbV6TVCwq8GUOLwA@mail.gmail.com>
In-Reply-To: <CAPY8ntBkQ9PrNx51g+W6TPTLhFjQrTC1vitbV6TVCwq8GUOLwA@mail.gmail.com>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 12 Dec 2024 15:29:15 +0000
Message-ID: <CAPY8ntDSi5hHWX8fUoiVq93n6bnwu+PVE3JYDxDi=0rGudvm2g@mail.gmail.com>
Subject: Re: [PATCH v2 next] drm/vc4: unlock on error in
 vc4_hvs_get_fifo_frame_count()
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 12 Dec 2024 at 14:33, Dave Stevenson
<dave.stevenson@raspberrypi.com> wrote:
>
> On Thu, 12 Dec 2024 at 12:47, Dan Carpenter <dan.carpenter@linaro.org> wrote:
> >
> > The default statement is never used in real life.  However, if it were
> > used for some reason then call drm_dev_exit() before returning.
> >
> > Fixes: 8f2fc64773be ("drm/vc4: Fix reading of frame count on GEN5 / Pi4")
> > Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
>
> Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>

Applied to drm-misc-next

> Thanks for the update.
>   Dave
>
> > ---
> > v2: style fixes
> >
> >  drivers/gpu/drm/vc4/vc4_hvs.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/vc4/vc4_hvs.c b/drivers/gpu/drm/vc4/vc4_hvs.c
> > index b42027636c71..4811d794001f 100644
> > --- a/drivers/gpu/drm/vc4/vc4_hvs.c
> > +++ b/drivers/gpu/drm/vc4/vc4_hvs.c
> > @@ -522,7 +522,7 @@ u8 vc4_hvs_get_fifo_frame_count(struct vc4_hvs *hvs, unsigned int fifo)
> >                 break;
> >         default:
> >                 drm_err(drm, "Unknown VC4 generation: %d", vc4->gen);
> > -               return 0;
> > +               break;
> >         }
> >
> >         drm_dev_exit(idx);
> > --
> > 2.45.2
> >
