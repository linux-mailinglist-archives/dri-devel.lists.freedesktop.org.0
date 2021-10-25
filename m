Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 12F4D43980E
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 16:04:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E042D89F53;
	Mon, 25 Oct 2021 14:04:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00D5589F4F
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 14:04:13 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id g10so19021230edj.1
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 07:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lRz3CgFlSn7VynXZnvgJCMXyEuYvDuHSreaW3AYUDoc=;
 b=uiKJyxy1HlPhjZ8Qi3VptIu0aBU9Ul/6x7ftj0/5VvdglRe1z3B279lOUUA+27Qrpd
 bkYsZOA1cpWDOsFf+2w3QpZPc1fTVCrz5ke3LPCBNo31p2/t/etQTo4SucZC3YnW/AeG
 ZlZq6d2YP95Au7L+hNvxTDGFUlQ+Kl9T+huCKGR6dMQaZtG8c5YlMUYb+Sys1fjN70nX
 YaIYEb4bVOPYx0mYGnW/6nDvS5Gc/5n6aO9bEY3v/KY2DibA7KSwLS9De5HwYu0RAI6a
 9CB2UUrF2blgmUArx6029uHQiLleJtjAkII3uKn+nhQEHGteVU3L7ipQfBs5vjPtKD5K
 8PQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lRz3CgFlSn7VynXZnvgJCMXyEuYvDuHSreaW3AYUDoc=;
 b=b2mYQLkbYXXO8rmvN3fwXn05crYTUlrYwA73bKrEj7DNCMFU0TAZZeUIf7qegWpwuy
 tr+Yh1dlOrPRz/iu/pljnV9Gp65OkxqZUsqT9oAaUbO3bZXXsXyif6N7ujXp2dr0Vc86
 +JOvaJiSgaYNCHxRXyUIn9ihXUlLOGjQWm3Tw4WM/hWmR5rypTBZuZLR9sulTmAR4Gdg
 me9BUqvKvHIQap4BtFs7iPTFNvsBd4/956qCeB/7Yb8WHXNpISoRL2g9ZSTvPtSG81io
 XPLQPVD5BS1cUNOnG1ncvN5J0tRed4Jk12mxX2XrUJJ1jy7U4z06r1y6fMtOwA+UNd1Q
 rQ6g==
X-Gm-Message-State: AOAM5331IMe6MeyTp3/CMbRMXU84rzno8f/2eldzgCqzoOAAE21aYpq2
 hLdLmJZy/5az0qdsfXPqRa0DPKDCO4OG6MBcBBVm6Em3UL4JZA==
X-Google-Smtp-Source: ABdhPJx0lp0PHTjiXgV2IvMCh2GtrIee4/gYDuwcwV8DC7zDqHOMDrNmfKQMSgVZNLP5fYmtX4CKmhomDDLaBS4TJ1o=
X-Received: by 2002:a05:6402:26cb:: with SMTP id
 x11mr5219841edd.198.1635170489365; 
 Mon, 25 Oct 2021 07:01:29 -0700 (PDT)
MIME-Version: 1.0
References: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
In-Reply-To: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 25 Oct 2021 19:31:17 +0530
Message-ID: <CA+G9fYvdhk-H8wBDdaPmRMZS_egxndncUkbZ92HCnUFD1g_wSQ@mail.gmail.com>
Subject: Re: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
To: dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, 
 Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linus.walleij@linaro.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
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

On Mon, 25 Oct 2021 at 17:43, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
>
> Regression found on arm gcc-11 built with multi_v5_defconfig
> Following build warnings / errors reported on linux next 20211025.
>
> metadata:
>     git_describe: next-20211025
>     git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
>     git_short_log: 9ae1fbdeabd3 (\"Add linux-next specific files for 20211025\")
>     target_arch: arm
>     toolchain: gcc-11
>     config: multi_v5_defconfig
>
> build error :
> --------------
> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in
> function `drm_fb_cma_get_gem_obj':
> drivers/gpu/drm/drm_fb_cma_helper.c:46: undefined reference to
> `drm_gem_fb_get_obj'
> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46:
> undefined reference to `drm_gem_fb_get_obj'
> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46:
> undefined reference to `drm_gem_fb_get_obj'
> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in
> function `drm_fb_cma_sync_non_coherent':
> drivers/gpu/drm/drm_fb_cma_helper.c:133: undefined reference to
> `drm_atomic_helper_damage_iter_init'
> arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:135:
> undefined reference to `drm_atomic_helper_damage_iter_next'
> make[1]: *** [Makefile:1252: vmlinux] Error 1
> make[1]: Target '__all' not remade because of errors.
> make: *** [Makefile:226: __sub-make] Error 2
>
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

The bisection script pointed to the first bad commit,

commit 4b2b5e142ff499a2bef2b8db0272bbda1088a3fe
drm: Move GEM memory managers into modules

> build link:
> -----------
> https://builds.tuxbuild.com/1zzgFZBGjpQ5R0lawQFW9iJ39Hp/build.log
>
> build config:
> -------------
> https://builds.tuxbuild.com/1zzgFZBGjpQ5R0lawQFW9iJ39Hp/config
>
> # To install tuxmake on your system globally
> # sudo pip3 install -U tuxmake
> tuxmake --runtime podman --target-arch arm --toolchain gcc-11
> --kconfig multi_v5_defconfig
>
> --
> Linaro LKFT
> https://lkft.linaro.org

- Naresh
