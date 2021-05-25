Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3245A38FDCB
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 11:28:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D05F76E9D3;
	Tue, 25 May 2021 09:28:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C5DE6E9D3
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 09:28:15 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id p17so8747185uaw.4
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 02:28:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xFwTjrbAQ6Wink3J/nxMEJ2AJ3GtZHP9apTCPSAum9o=;
 b=V8SvgDBzNjR0jAKtsRC2/79Q977fzPnhXvsur7nqbK5ep3+lImjnYRtwQp+SwOlY2f
 fSbMppRLYhdAK6UuAj2RmYAirYJHwejTLYGbCUoI+Ly1TfFrdat4AYBMe1JJ6bCLIvOo
 oVqwUQAEQAHCNceyOYCBTkWfB9YYz9Ae9jaiPDqati//QJ80A2Pb8TjryrrNdFbfZc3L
 DV7uqyv1JQhmF9NJ9ddwFk4PiHK9NmH6DvMW1uPJNr9RK4zOLC+9pHSI+Hs938ySwzZW
 cnEbWvUdndheX91SEnYeJVIPMutHw+ZpDzHR873erCfCq+tqUx/Wn6KMFjGeBJywjXr8
 e/kg==
X-Gm-Message-State: AOAM533ZYSlgcFi2fgACN2xajFM+ZFOnjePQuu3m9JTZs5FfXPUxUJxt
 qErGxhNl1orQW298tMI3zOp80n4cHkajPKvu2ZY=
X-Google-Smtp-Source: ABdhPJwspwwZAikP8rNjU0g5iwIUdZBh/Wue7a4Squu0kZUx6WAUY+WNPWFeZGgOjz1KUQRWyMhB8vu8gC/psHCfilI=
X-Received: by 2002:ab0:2242:: with SMTP id z2mr24746785uan.58.1621934894214; 
 Tue, 25 May 2021 02:28:14 -0700 (PDT)
MIME-Version: 1.0
References: <20210415110040.23525-1-tzimmermann@suse.de>
 <20210415110040.23525-5-tzimmermann@suse.de>
In-Reply-To: <20210415110040.23525-5-tzimmermann@suse.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 25 May 2021 11:28:03 +0200
Message-ID: <CAMuHMdV2mspRiropAYquWd0RYxyzad3xZ8URwcYgD01q9d8Rkw@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: Remove DRM_KMS_FB_HELPER Kconfig option
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
Cc: Marek Vasut <marex@denx.de>, Sascha Hauer <kernel@pengutronix.de>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 David Airlie <airlied@linux.ie>, Sascha Hauer <s.hauer@pengutronix.de>,
 sroland@vmware.com, VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Shawn Guo <shawnguo@kernel.org>, NXP Linux Team <linux-imx@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Apr 15, 2021 at 1:15 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> It's only used by DRM_FBDEV_EMULATION, so inline it there.
>
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/Kconfig | 28 +++++++++++-----------------
>  1 file changed, 11 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 3c16bd1afd87..d3a9ca4b1cec 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -80,23 +80,6 @@ config DRM_KMS_HELPER
>         help
>           CRTC helpers for KMS drivers.
>
> -config DRM_KMS_FB_HELPER
> -       bool
> -       depends on DRM_KMS_HELPER
> -       select FB
> -       select FRAMEBUFFER_CONSOLE if !EXPERT
> -       select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
> -       select FB_SYS_FOPS
> -       select FB_SYS_FILLRECT
> -       select FB_SYS_COPYAREA
> -       select FB_SYS_IMAGEBLIT
> -       select FB_CFB_FILLRECT
> -       select FB_CFB_COPYAREA
> -       select FB_CFB_IMAGEBLIT
> -       select FB_DEFERRED_IO
> -       help
> -         FBDEV helpers for KMS drivers.
> -
>  config DRM_DEBUG_DP_MST_TOPOLOGY_REFS
>          bool "Enable refcount backtrace history in the DP MST helpers"
>         depends on STACKTRACE_SUPPORT
> @@ -117,6 +100,17 @@ config DRM_FBDEV_EMULATION
>         depends on DRM
>         select DRM_KMS_HELPER
>         select DRM_KMS_FB_HELPER

It's still selected here ^

> +       select FB
> +       select FB_CFB_FILLRECT
> +       select FB_CFB_COPYAREA
> +       select FB_CFB_IMAGEBLIT
> +       select FB_DEFERRED_IO
> +       select FB_SYS_FOPS
> +       select FB_SYS_FILLRECT
> +       select FB_SYS_COPYAREA
> +       select FB_SYS_IMAGEBLIT
> +       select FRAMEBUFFER_CONSOLE if !EXPERT
> +       select FRAMEBUFFER_CONSOLE_DETECT_PRIMARY if FRAMEBUFFER_CONSOLE
>         default y
>         help
>           Choose this option if you have a need for the legacy fbdev

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
