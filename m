Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73620509FC5
	for <lists+dri-devel@lfdr.de>; Thu, 21 Apr 2022 14:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DA9210E106;
	Thu, 21 Apr 2022 12:39:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85A7910E106
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 12:39:20 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id n8so4745918plh.1
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Apr 2022 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nssjfya3+9VTlrQeOXbk1Fnunfs1cJh58vKzBuqD+5w=;
 b=pIeQUahUEw73/0XELeSGeveLsVNRSo3mUBldB2hgxa51jomlq8h+OiyitGRnWJ+4BK
 Bvwc7ENq6ZVhtbzcIxC52/o3UeA3ag5bciQsHqThadcTnSmQFJPT9i5NHauFMmNkMZND
 27haqYujf2wKniMfksGkGof29htMzGVVzPhNzDu5YhaeO3By25BLa3LZILWbm7Hg8X8z
 9W1g/5HjhR2uOiRGl2pLNsAOGzQON1T7vHNHiAmGOSOA1Th3j7uZpzCfm6u7zse/hG91
 D1xLqeRFu1Bfufg+PxXA044rlFO2dp6PsGX/J9yHFtOS7rX06qTnS1b2M9FTyUV2IotV
 uPJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nssjfya3+9VTlrQeOXbk1Fnunfs1cJh58vKzBuqD+5w=;
 b=sxs6fewH8jJZAlt4gYJ7E/58eUJQeE4tFZNmqLGaQE2WFj5aMISFBC8YuYVV9LgWO2
 HkOwnGKnxMrdRu+71zlDHrg8jqeb+C8QVLjtHCELvXxw2ETFvnfT1ZhZvntQ89oWvr1w
 0Jj4ziKOZ2wuk9CRQhzWeRq0+oOJqf0SQOAkQuTLzNLHS2Jzi1hEKA/Ij+nsRKhNwZ/t
 HPEGnKOZJgnkF9x3K9fQ3DZpOuNe8LdSwEwSeD61QokroxBSt7vjrbzD9eH2H3WTPxdp
 QfL+HjCy/c6KT75ojI9UyFnauyewa0Q8TlWD5dHqwVjsVe4bAn5Wuj4mYMz5BzLT8+/q
 nbEQ==
X-Gm-Message-State: AOAM531F1s2qDSUOAaXNIHiqkZSc/ai75cCcFodLa7OzLoPIq0BLOV7L
 8G54qKwfpi9KVS41sigapzsyygHsBU1UnGsJeGk=
X-Google-Smtp-Source: ABdhPJydPCqhqGo0Ypkm47vjMGBgOdnq/oMsB6raDz0GdtqLPYfAOOwVPepZ7ZvInejprP2fCo8W0387QvKQTPdm/yc=
X-Received: by 2002:a17:90b:1a8a:b0:1d2:e93e:6604 with SMTP id
 ng10-20020a17090b1a8a00b001d2e93e6604mr10172088pjb.233.1650544760102; Thu, 21
 Apr 2022 05:39:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220409042321.3184493-1-james.hilliard1@gmail.com>
 <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
In-Reply-To: <b3f7e288-3341-8c6f-1b95-e553ac5ebc35@suse.de>
From: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>
Date: Thu, 21 Apr 2022 14:39:08 +0200
Message-ID: <CAMeQTsbh-Fy4CORBTX=AfZ+K-fZYUQ=hY=ctLFyu9KcJ5NgFUA@mail.gmail.com>
Subject: Re: [PATCH v3] drm/gma500: depend on framebuffer
To: Thomas Zimmermann <tzimmermann@suse.de>
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
Cc: David Airlie <airlied@linux.ie>, James Hilliard <james.hilliard1@gmail.com>,
 Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 21, 2022 at 1:49 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 09.04.22 um 06:23 schrieb James Hilliard:
> > Select the efi framebuffer if efi is enabled.
> >
> > This appears to be needed for video output to function correctly.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> > Changes v2 -> v3:
> >    - select EFI_FB instead of depending on it
> > Changes v1 -> v2:
> >    - use depends instead of select
> > ---
> >   drivers/gpu/drm/gma500/Kconfig | 2 ++
> >   1 file changed, 2 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/gma500/Kconfig b/drivers/gpu/drm/gma500/Kconfig
> > index 0cff20265f97..a422fa84d53b 100644
> > --- a/drivers/gpu/drm/gma500/Kconfig
> > +++ b/drivers/gpu/drm/gma500/Kconfig
> > @@ -2,11 +2,13 @@
> >   config DRM_GMA500
> >       tristate "Intel GMA500/600/3600/3650 KMS Framebuffer"
> >       depends on DRM && PCI && X86 && MMU
> > +     depends on FB
>
> Why do we need FB here? Framebuffer support should be hidden by DRM's
> fbdev helpers.

It is not needed but gives him video output since it enables the drm
fbdev emulation.

I looked some more at the logs and it seems weston doesn't work on his
system without the fbdev backend. So the question is why weston isn't
working without fbdev? Perhaps this is just a Weston configuration
issue?
