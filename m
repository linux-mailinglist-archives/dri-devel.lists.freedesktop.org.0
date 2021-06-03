Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 685D539AE11
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 00:30:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 745AE6F53B;
	Thu,  3 Jun 2021 22:30:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0744D6F53B
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 22:30:12 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 v27-20020a056830091bb02903cd67d40070so4215013ott.1
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9us/X29o3VT0A9yPJl6yvX/k+4UGGdwauIgNXt1rL50=;
 b=Ae4+I3or7ogynbEpsfQtXyErORg6YvYL19cfW+k2mIAWjUKF8FtNeKxN1JVYt+L/Cq
 swe/mwLSNf20XJihLEB2Gn2zeOVY20uCemPtSF4nI/rvPG46Nd3ArPzbp3b6z4OJK7dz
 DI9vOk+8E71HnUl41tmrEWe0HaVFmADnj7vwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9us/X29o3VT0A9yPJl6yvX/k+4UGGdwauIgNXt1rL50=;
 b=MAmA9WUIzGnLJMVEBET1R+lMUrjl8cwkhrCBccYbeCS+YRiXRfsW9BVPcGOarP46kD
 3yMF2zbZwr9mXgxpc/XExW8NSFwAwrGSKqh6ObaeOAMXMT7cDIwgLvgvvwujnVX42/nl
 su78LqhTF48Ov+h2sJNfENuAx/vONX2IDsVRVt/BZyMITQCrPFRKig6D8y6GXXyUrFXX
 ZGTwS56EddY13l8yPunDE1PyNDghzJ35zyt6TAgkXZoLQyrnlfBirU9wkJ1nQXBSlPLH
 hJ5IBXseJCN2Kb/QX++oLcozf1N4y20b8JVpDt35MkHAaSbRRWReD2+lvnuSr4iByewH
 1y8g==
X-Gm-Message-State: AOAM530OBK4YE5+HAb3ugnaPzs7WtvDtWH3oJCV7pZ5AyQWQYB+diPbI
 dF8bsh3fok4hAYML4sX2zfx+bSIt340k01i+lyOL4A==
X-Google-Smtp-Source: ABdhPJw9y4/jOJCkB2/176jBXW7Rl0wjqh/5ugEle6IRrPcBapG5B8JW+7gbN8S/7HIoRZVy5ZQiuqD1hEqLALTtt+A=
X-Received: by 2002:a05:6830:1155:: with SMTP id
 x21mr1249312otq.303.1622759411317; 
 Thu, 03 Jun 2021 15:30:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210603215819.3904733-1-keescook@chromium.org>
In-Reply-To: <20210603215819.3904733-1-keescook@chromium.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Fri, 4 Jun 2021 00:30:00 +0200
Message-ID: <CAKMK7uG7tDVUV3cVmtYMFdwVx1SuEWh6i+VsQ3nLP0Rb=-f0aw@mail.gmail.com>
Subject: Re: [PATCH] drm/pl111: Actually fix CONFIG_VEXPRESS_CONFIG depends
To: Kees Cook <keescook@chromium.org>
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
Cc: David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>, Emma Anholt <emma@anholt.net>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[gmail is funny]

On Thu, Jun 3, 2021 at 11:58 PM Kees Cook <keescook@chromium.org> wrote:
>
> VEXPRESS_CONFIG needs to either be missing, built-in, or modular when
> pl111 is modular. Update the Kconfig to reflect the need.
>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: dri-devel@lists.freedesktop.org
> Fixes: 4dc7c97d04dc ("drm/pl111: depend on CONFIG_VEXPRESS_CONFIG")
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---
>  drivers/gpu/drm/pl111/Kconfig | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/pl111/Kconfig b/drivers/gpu/drm/pl111/Kconfig
> index c5210a5bef1b..b84879ca430d 100644
> --- a/drivers/gpu/drm/pl111/Kconfig
> +++ b/drivers/gpu/drm/pl111/Kconfig
> @@ -2,7 +2,8 @@
>  config DRM_PL111
>         tristate "DRM Support for PL111 CLCD Controller"
>         depends on DRM
> -       depends on VEXPRESS_CONFIG
> +       depends on ARM || ARM64 || COMPILE_TEST
> +       depends on !VEXPRESS_CONFIG || VEXPRESS_CONFIG=DRM

I thought the canonical way to represent optional dependencies was
depends on FOO || FOO=n

Since we don't really care whether it's the same as DRM (that's
sufficient, but a bit too much), it needs to match DRM_PL111, or be
disabled. It's at least the pattern various drm drivers use for AGP.
If that still works in testing, can you pls respin?
-Daniel

>         depends on COMMON_CLK
>         select DRM_KMS_HELPER
>         select DRM_KMS_CMA_HELPER
> --
> 2.25.1
>


-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
