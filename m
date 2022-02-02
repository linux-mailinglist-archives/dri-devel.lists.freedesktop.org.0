Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD764A6DCC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Feb 2022 10:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E79210F07F;
	Wed,  2 Feb 2022 09:29:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB2210F07F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:29:04 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 601886137F
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:29:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C603BC340FA
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Feb 2022 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643794142;
 bh=7QxGtICQB5cmZ++I+mRVmxhX4XJtfYR55xPHHVUU4DE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=g6/BDkz7FPysB17PbVuL9wB2zX/nJb+Xpam+mC9i3wBg+0pIGeODqtjWG4IsChNyA
 3yng5h3p3ImbnQYSx2smV+oJ/bq6o4ZC16j8N08NYvxjx4Ed1N2iJMtIfI9VsXabNz
 pZyh8pT5AiUjhI42jtU65YQERhkY2XzeZGGAYjYk/SZt154SBfMZ6WF1a8KPf0BojX
 WhMixEg6ha4uJ8vmX3SEiA8Zh4GtTRHhU0iOKO6PTjQEdlIwGyICM5NVrAlkzvuk/E
 ZwinrLmiwJT3GSKaQdV65GPuwpCct3EZCGvuwTrtU5BlrGcdWmkw0TSKhvbSc2Q88T
 QdQGWVHYhEwnQ==
Received: by mail-wm1-f51.google.com with SMTP id
 f80-20020a1c1f53000000b0035399b8bedcso3779201wmf.0
 for <dri-devel@lists.freedesktop.org>; Wed, 02 Feb 2022 01:29:02 -0800 (PST)
X-Gm-Message-State: AOAM530FbVATyapoEI1XXagE2ab7xsSny/CzdjM7aNB+Qey0JOWGpURB
 puaJQQDn7SXWlR2Eka659FORA5SeLLGmWLJVAuM=
X-Google-Smtp-Source: ABdhPJwbXkPcC946J/ORBc9u0ZiogNAeFutxGktiuwSzkf9/t6UckD2rpbnwtLHhV6uTZGmZPUxbCdHxemzTcZI/hWM=
X-Received: by 2002:a05:600c:4248:: with SMTP id
 r8mr5295324wmm.56.1643794140848; 
 Wed, 02 Feb 2022 01:29:00 -0800 (PST)
MIME-Version: 1.0
References: <CA+G9fYvN0NyaVkRQmA1O6rX7H8PPaZrUAD7=RDy33QY9rUU-9g@mail.gmail.com>
 <76ff2848-3af4-6758-6e98-91a4c9ad26d8@suse.de>
In-Reply-To: <76ff2848-3af4-6758-6e98-91a4c9ad26d8@suse.de>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 2 Feb 2022 10:28:49 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE6Q9uW45Q5A-TuPDiXTPOGrGjUn_8FUBKNGQ1g9bd3Rg@mail.gmail.com>
Message-ID: <CAMj1kXE6Q9uW45Q5A-TuPDiXTPOGrGjUn_8FUBKNGQ1g9bd3Rg@mail.gmail.com>
Subject: Re: [next] arm: panel-edp.c:(.text+0xb74): undefined reference to
 `drm_panel_dp_aux_backlight'
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
Cc: Marek Vasut <marex@denx.de>, Stephen Rothwell <sfr@canb.auug.org.au>,
 regressions@lists.linux.dev, Arnd Bergmann <arnd@arndb.de>,
 Yunlong Jia <yunlong.jia@ecs.corp-partner.google.com>,
 David Airlie <airlied@linux.ie>, Naresh Kamboju <naresh.kamboju@linaro.org>,
 open list <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Douglas Anderson <dianders@chromium.org>,
 Linux-Next Mailing List <linux-next@vger.kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>, lkft-triage@lists.linaro.org,
 Grace Mi <grace.mi@ecs.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 2 Feb 2022 at 10:08, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>
> Hi
>
> Am 02.02.22 um 10:02 schrieb Naresh Kamboju:
> > Following builds failed on Linux next 20220202 arm architecture.
> >    - arm-gcc-10-omap2plus_defconfig
> >    - arm-clang-nightly-shmobile_defconfig
> >    - arm-gcc-8-lpc32xx_defconfig
> >    - arm-clang-13-shmobile_defconfig
> >    - arm-gcc-10-shmobile_defconfig
> >    - arm-clang-11-shmobile_defconfig
> >    - arm-clang-11-omap2plus_defconfig
> >    - arm-clang-13-omap2plus_defconfig
> >    - arm-clang-11-lpc32xx_defconfig
> >    - arm-gcc-8-omap2plus_defconfig
> >    - arm-gcc-9-vexpress_defconfig
> >    - arm-clang-nightly-lpc32xx_defconfig
> >    - arm-gcc-9-shmobile_defconfig
> >    - arm-clang-13-lpc32xx_defconfig
> >    - arm-gcc-10-sama5_defconfig
> >    - arm-clang-11-vexpress_defconfig
> >    - arm-clang-11-sama5_defconfig
> >    - arm-gcc-9-omap2plus_defconfig
> >    - arm-clang-nightly-sama5_defconfig
> >    - arm-clang-13-vexpress_defconfig
> >    - arm-clang-nightly-vexpress_defconfig
> >    - arm-gcc-9-lpc32xx_defconfig
> >    - arm-clang-12-vexpress_defconfig
> >    - arm-gcc-10-vexpress_defconfig
> >    - arm-clang-12-shmobile_defconfig
> >    - arm-gcc-11-omap2plus_defconfig
> >    - arm-gcc-9-sama5_defconfig
> >    - arm-gcc-8-shmobile_defconfig
> >    - arm-gcc-10-lpc32xx_defconfig
> >    - arm-clang-12-omap2plus_defconfig
> >    - arm-gcc-8-vexpress_defconfig
> >    - arm-clang-12-sama5_defconfig
> >    - arm-clang-nightly-omap2plus_defconfig
> >    - arm-gcc-11-lpc32xx_defconfig
> >    - arm-gcc-11-sama5_defconfig
> >    - arm-gcc-11-shmobile_defconfig
> >    - arm-gcc-11-vexpress_defconfig
> >    - arm-gcc-8-sama5_defconfig
> >    - arm-clang-13-sama5_defconfig
> >    - arm-clang-12-lpc32xx_defconfig
> >
> >
> > make --silent --keep-going --jobs=8  ARCH=arm
> > CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
> > arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc' vexpress_defconfig
> > make --silent --keep-going --jobs=8  ARCH=arm
> > CROSS_COMPILE=arm-linux-gnueabihf- 'CC=sccache
> > arm-linux-gnueabihf-gcc' 'HOSTCC=sccache gcc'
> > arm-linux-gnueabihf-ld: drivers/gpu/drm/panel/panel-edp.o: in function
> > `panel_edp_probe':
> > panel-edp.c:(.text+0xb74): undefined reference to `drm_panel_dp_aux_backlight'
> > make[1]: *** [/builds/linux/Makefile:1222: vmlinux] Error 1
> >
> >
> > Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> >
> > meta data:
> > -----------
> >      git describe: next-20220202
> >      git_repo: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> >      target_arch: arm
> >      kconfig: vexpress_defconfig
> >      toolchain: gcc-11
> >
> > Build log:
> > -------------
> > https://builds.tuxbuild.com/24XRim72vFXix6l6MdAJNENy6je/
> >
> > Steps to reproduce:
> > --------------------
> > # To install tuxmake on your system globally:
> > # sudo pip3 install -U tuxmake
> > #
> > # See https://docs.tuxmake.org/ for complete documentation.
> > # Original tuxmake command with fragments listed below.
> >
> > tuxmake --runtime podman --target-arch arm --toolchain gcc-11
> > --kconfig vexpress_defconfig
> >
> > tuxmake --runtime podman --target-arch arm --toolchain gcc-11
> > --kconfig https://builds.tuxbuild.com/24XRim72vFXix6l6MdAJNENy6je/config
>
> You'll now need
>
>    CONFIG_DRM_DP_HELPER=y
>
> in your config.
>

That should never be the solution for linker errors such as this one.

If CONFIG_DRM_PANEL_EDP relies on something provided by
CONFIG_DRM_DP_HELPER, it should select it or depend on it in Kconfig.
