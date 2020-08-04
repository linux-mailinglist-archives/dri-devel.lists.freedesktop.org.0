Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BB1823B546
	for <lists+dri-devel@lfdr.de>; Tue,  4 Aug 2020 08:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 064516E42F;
	Tue,  4 Aug 2020 06:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com
 [IPv6:2a00:1450:4864:20::643])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93B116E42C
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Aug 2020 06:54:24 +0000 (UTC)
Received: by mail-ej1-x643.google.com with SMTP id kq25so28256490ejb.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Aug 2020 23:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jAD7axU7Dn+KBW9it92fCcSPMEJ+N2HZXcb+HA+Kkoc=;
 b=LB+iaGkcw9BNq17JvOftQtWJyrkcy38uFKxIk6eE2+XMaYpAroNJuyqAZO+wopPava
 kER51c3+eBgUL/0flM27baZZnqI/dla2/3slpeU26q40+F5/W/AWXpr89AtGSzPIG996
 SR8np7+hQP92ko0BVdVlc9CJv0qb5eCntb2mOa+tyDWJcHobzmdA2hX/4DWfNsS9LRMK
 h4D0zDdgbODQ7VqNb44rwGx3WD6bBVtR9MWnK9RJdgeLsYLy+GdO+xjRitZ6mUH9Pcj0
 PSnuMG1ptF71sI1Cmd/YXNez/uaU9v8lC48brCUU2XNeaLWOqUPjx90lbna1Q2Gcbhu+
 GyRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jAD7axU7Dn+KBW9it92fCcSPMEJ+N2HZXcb+HA+Kkoc=;
 b=qFNoSUgr6Pnymaik+LPNPFD1XNb5HNENNuS5UGaa24JsbZCEB1cdRqasUCGf5NJcvB
 FUDIgXeAPkJarfQkWgLE7Z5aIZVj2wWwZ7Lr2l4bVTaJSjWXsJk3eTRXcBcpu6AYdP9w
 Bo6Cg2eS66tVYYnspEfuBr7MBdDbgThzJiQphMU21D47uOsRQdUQj3QlWEYfXbGGsdhd
 WjU3/g3nt5UpZKV4QdGrkUqk0YmoBGuLMrVQq0JtOTJgq0fUhHks3kC/elvnY5g/RNLp
 JD0vcfe7b6BTYS/+broSqn1h876u64Ags5EdvxNEAyBSw23eTzOdVdrPsp1PmROAeVKc
 FpRQ==
X-Gm-Message-State: AOAM5311BZUrF6ec3DNdJ3Kn+G6mOqf8CaJQ2GtUYHYTsksXX26E/Pwk
 bAkHWc0cBjydHeI9tpWO9xxd4D+mLJAfCylUHg0=
X-Google-Smtp-Source: ABdhPJy9+/ylEp/d8DMsgjZGjOPE007Rc9dZd5zLVjaQoFa/mYmYtWFBoVnjNQDrqAiSPpXDKezsOPEb8GP/QGutO6Y=
X-Received: by 2002:a17:906:8782:: with SMTP id
 za2mr19711449ejb.419.1596524063161; 
 Mon, 03 Aug 2020 23:54:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200804065158.21049-1-tzimmermann@suse.de>
In-Reply-To: <20200804065158.21049-1-tzimmermann@suse.de>
From: Dave Airlie <airlied@gmail.com>
Date: Tue, 4 Aug 2020 16:54:11 +1000
Message-ID: <CAPM=9txb7qv3oEmQW5LaiSQy-jDmYT4ikbMSZhBiMA8Lxhn13w@mail.gmail.com>
Subject: Re: [PATCH] drm/mgag200: Set PCI option register in G200SE models
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: kernel test robot <lkp@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, Gerd Hoffmann <kraxel@redhat.com>,
 Dave Airlie <airlied@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Emil Velikov <emil.velikov@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 4 Aug 2020 at 16:52, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> The initial value of the PCI option register got lost while refactoring
> the driver init code. Restore the setting.
>

Ooops,

Reviewed-by: Dave Airlie <airlied@redhat.com>

> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 2021708e0d6e ("drm/mgag200: Initialize PCI registers early during device setup")
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> ---
>  drivers/gpu/drm/mgag200/mgag200_drv.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.c b/drivers/gpu/drm/mgag200/mgag200_drv.c
> index 5c854bc7dc86..09170d46aa53 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_drv.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_drv.c
> @@ -74,6 +74,7 @@ static int mgag200_regs_init(struct mga_device *mdev)
>                 break;
>         case G200_SE_A:
>         case G200_SE_B:
> +               option = 0x40049120;
>                 if (mgag200_has_sgram(mdev))
>                         option |= PCI_MGA_OPTION_HARDPWMSK;
>                 option2 = 0x00008000;
> --
> 2.28.0
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
