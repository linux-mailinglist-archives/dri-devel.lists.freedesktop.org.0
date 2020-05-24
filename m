Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 080811E018C
	for <lists+dri-devel@lfdr.de>; Sun, 24 May 2020 20:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0220B89C2A;
	Sun, 24 May 2020 18:53:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DA2689C2A
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 18:53:19 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id j145so14415488oib.5
 for <dri-devel@lists.freedesktop.org>; Sun, 24 May 2020 11:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TMLYV07cbfSPWnrIAdUyiuv5pzgWkCg4U+syR/bfgW8=;
 b=R5lxnVUIz93U/VOUNmPUZR1/u41Ji6BDSrSgA60AX4C2Dee7vWebGJQYAPfK6ig9Ch
 dLHLLWpIyRr6H78gHrXieAHsP0Wjw542jYAKTRDnML42w3R82XUevFHtTCnEuZVOPIkU
 nw88kmg6KoXZwUgByP8nLV4YHl+8kj8cK5L80=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TMLYV07cbfSPWnrIAdUyiuv5pzgWkCg4U+syR/bfgW8=;
 b=kiv+LiywqasFqJwseDNGtguuNZ39U8ZMoXZetQByQbsibOK3+mclVr3aGj3aSSlibj
 Gt3ylSgeznJHKUsbh5CUFj3N25+wwd5NZYjbpmGA4X9bkrRZQFTSX3XOdmHUZf5Ti6gM
 kTgvXBghB6h6DJ0AbCAgevQbDL+gomOyAIn6KJZz+KZyG9XB1HkVYNayqpQVWZ7EF81G
 muoerDU9l+5XIYkiEkgSv2SEbLK9ttaSwBoVL/N9NoCtAKA8BcjcfQUIZGG+77aoBshw
 UEBRAfeyu2u9wFxvFT7VLeN3IA/LsGYvF76GUssf9tYCrIeteF7NwwsQZey9NqsQNqkw
 I0qA==
X-Gm-Message-State: AOAM530wxLt/9ya6HHKZMgOhwfwq11FNfVzjYC4AvSPWi4/aQhJ5CD+f
 SumMD1q1zJ083qam0qOQgpezuUPmM0PH44vNC+EgVg==
X-Google-Smtp-Source: ABdhPJzYQs8qTptkaEBREmKGmBLAPRD+p0MG0AM9VACafV1XhsnYOxo/FI5cN/l7xJlYOJevl1azC1alnQJH8a8KEDA=
X-Received: by 2002:aca:fd14:: with SMTP id b20mr9101162oii.14.1590346398668; 
 Sun, 24 May 2020 11:53:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200523154426.1088988-1-issor.oruam@gmail.com>
In-Reply-To: <20200523154426.1088988-1-issor.oruam@gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Sun, 24 May 2020 20:53:07 +0200
Message-ID: <CAKMK7uGKps4AfLKTSP2HZTHd1cm+1dMD9r8M9rKobqwXGgv5EQ@mail.gmail.com>
Subject: Re: [PATCH] xf86drm: add drmOpenByFB
To: Mauro Rossi <issor.oruam@gmail.com>
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
Cc: Robert Foss <robert.foss@collabora.com>, cwhuang@linux.org.tw,
 Emil Velikov <emil.l.velikov@gmail.com>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, May 23, 2020 at 5:44 PM Mauro Rossi <issor.oruam@gmail.com> wrote:
>
> OpenByFB is introduced to overcome GPU driver loading order issue
> on a device with multiple GPUs, e.g. Intel iGPU and Nvidia dGPU
> where the first drmfb kernel module loaded will become device file
> /dev/dri/card0 and the second will become /dev/dri/card1
>
> The use case is to prefer Intel iGPU over dGPU, or viceversa,
> in a deterministic and reliable manner.
>
> OpenByFB function opens the DRM device with specified fb and node type,
> thus enabling gralloc to open the correct device node of the primary fb,
> regardless of the GPU driver loading order.

The fbdev load ordering is as inconsistent/random as the dri node
loading. Well more so, because you might have random firmware fbdev
drivers hanging out there. Hence I'm not following how this solves
anything for your problem.

I think usually what userspace does it look at the boot_vga property
of the underlying device in sysfs, and prefer that one. Iirc (but
might be wrong) that's patched to essentially mean "primary display
device, the same the firmware used for boot-up screens". Either way I
think the proper way to solve this is you figure out matching rules
you care about using udev/sysfs, and then use that information to open
the right drm node. Opening by fbdev seems a most convoluted way to
get to a drm device (we're trying to deprecate fbdev outright as much
as possible), and you could even match for any specific device with
sysfs already if that's what you're doing using udev rules.
-Daniel


>
> Signed-off-by: Chih-Wei Huang <cwhuang@linux.org.tw>
> ---
>  core-symbols.txt |  1 +
>  xf86drm.c        | 42 ++++++++++++++++++++++++++++++++++++++++++
>  xf86drm.h        |  1 +
>  3 files changed, 44 insertions(+)
>
> diff --git a/core-symbols.txt b/core-symbols.txt
> index 1ff4ecaa..6bf8c70d 100644
> --- a/core-symbols.txt
> +++ b/core-symbols.txt
> @@ -146,6 +146,7 @@ drmModeSetCursor2
>  drmModeSetPlane
>  drmMsg
>  drmOpen
> +drmOpenByFB
>  drmOpenControl
>  drmOpenOnce
>  drmOpenOnceWithType
> diff --git a/xf86drm.c b/xf86drm.c
> index b49d42f7..229a54bf 100644
> --- a/xf86drm.c
> +++ b/xf86drm.c
> @@ -793,6 +793,48 @@ drm_public int drmOpenRender(int minor)
>      return drmOpenMinor(minor, 0, DRM_NODE_RENDER);
>  }
>
> +/**
> + * Open the DRM device with specified type of specified framebuffer.
> + *
> + * Looks up the associated DRM device with specified type of the
> + * specified framebuffer and opens it.
> + *
> + * \param fb the index of framebuffer.
> + * \param type the device node type to open, PRIMARY, CONTROL or RENDER
> + *
> + * \return a file descriptor on success, or a negative value on error.
> + *
> + */
> +drm_public int drmOpenByFB(int fb, int type)
> +{
> +#ifdef __linux__
> +    DIR *sysdir;
> +    struct dirent *ent;
> +    char buf[64];
> +    const char *name = drmGetMinorName(type);
> +    int fd = -1, len = strlen(name);
> +
> +    snprintf(buf, sizeof(buf), "/sys/class/graphics/fb%d/device/drm", fb);
> +    sysdir = opendir(buf);
> +    if (!sysdir)
> +        return -errno;
> +
> +    while ((ent = readdir(sysdir))) {
> +        if (!strncmp(ent->d_name, name, len)) {
> +            snprintf(buf, sizeof(buf), "%s/%s", DRM_DIR_NAME, ent->d_name);
> +            fd = open(buf, O_RDWR | O_CLOEXEC, 0);
> +            break;
> +        }
> +    }
> +
> +    closedir(sysdir);
> +    return fd;
> +#else
> +#warning "Missing implementation of drmOpenByFB"
> +    return -EINVAL;
> +#endif
> +}
> +
>  /**
>   * Free the version information returned by drmGetVersion().
>   *
> diff --git a/xf86drm.h b/xf86drm.h
> index 7b85079a..d45d696f 100644
> --- a/xf86drm.h
> +++ b/xf86drm.h
> @@ -605,6 +605,7 @@ extern int           drmOpenWithType(const char *name, const char *busid,
>
>  extern int           drmOpenControl(int minor);
>  extern int           drmOpenRender(int minor);
> +extern int           drmOpenByFB(int fb, int type);
>  extern int           drmClose(int fd);
>  extern drmVersionPtr drmGetVersion(int fd);
>  extern drmVersionPtr drmGetLibVersion(int fd);
> --
> 2.25.1
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel



-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
