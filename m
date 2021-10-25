Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D466D4395C9
	for <lists+dri-devel@lfdr.de>; Mon, 25 Oct 2021 14:14:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296B089F0A;
	Mon, 25 Oct 2021 12:14:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 843D489F03
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 12:14:07 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id u13so18387146edy.10
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Oct 2021 05:14:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=6e5dClZNqugBonIUDa3xy+s+zikUwDcuCRtJDo7dWDc=;
 b=UI1SGw3rj6zDGc3ho5bxfEYVRrJF9huO+iOj4Qie1YJH0hJSitseo7xPTw1jcRfSPi
 WoJjDjaRVTb02lCF+m6/pvSs934gD4eLWpn/lgZds7N4DhkkFvoyP1uUHZqHmA7cn/ce
 0V/fpkuLITE14ueEoy6pnK/07x4z0HHmubYikqlqdRzWL9rh0PSyIiW5ffhSRreX1Mnv
 6ntxhX/GjxCokmfjfjxWPgkRTQDnkPShsqPmt1DMpYTy+8ioo50/8rPiCCsztdftd0Ip
 S6PvOuNIj5aBMw91TC00gKRGLlAbXQ+RTBnv/EwhnTfEnhqauHOYLJUpO62ZK/+PoiIS
 Pt/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=6e5dClZNqugBonIUDa3xy+s+zikUwDcuCRtJDo7dWDc=;
 b=ETZGOk1bzRhhlor/yH2CTy25lEXz/iL1Myio/xDvHdXHp4JQUuLejSXnzoBt1fl/0R
 zQ6YXqsa2SdzKY9Sjsp2fV2IkgWeRYHo+oCXyOqMA17r+IekvUKQG81uXbKpygj4Bicy
 QtzyNxFEvoqWAyr1u0PAuofgEcHSIz+F2XN1snzMjFjlxX22ig6lg/A3Jfq8VnLAdpUt
 BFge/469oKVOuYdjzWf2RqlLZOOPySdGs/D4rAZ4eXC8cn0kByARvIkczGMCa7OHJDR9
 Ljlv1QYPabxcANylB/sACiJGxgOPvYI2+rUnWs+MLPsTcqmKL/Upnfka9C/QWg56Ktnc
 wkDg==
X-Gm-Message-State: AOAM531yrPYpc/PEO/zHRE0N42niIpRtIBroWlYyRmHjmh66hylflEjL
 XKCPfBI/RM8LCCgglh+JwlkoCXVI76dNTrY6+WPxahG/KMpUMQ==
X-Google-Smtp-Source: ABdhPJwYIDzIsHOM44KEDTo1eeUMhc2q7IlHYTePt1GAveyFCSaLen+h5x5KtB67vFlUAnVpGwuzqiQ8tylPZDcOU4g=
X-Received: by 2002:a05:6402:3587:: with SMTP id
 y7mr25938248edc.182.1635164044795; 
 Mon, 25 Oct 2021 05:14:04 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 25 Oct 2021 17:43:53 +0530
Message-ID: <CA+G9fYvpyUbqLko+9Dza8h4=9yOd-n9J0dKoQtZxawstCCnsZw@mail.gmail.com>
Subject: gpu: drm_fb_cma_helper.c:46: undefined reference to
 `drm_gem_fb_get_obj'
To: dri-devel@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>, 
 Linux-Next Mailing List <linux-next@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, Arnd Bergmann <arnd@arndb.de>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Linus Walleij <linus.walleij@linaro.org>
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

Regression found on arm gcc-11 built with multi_v5_defconfig
Following build warnings / errors reported on linux next 20211025.

metadata:
    git_describe: next-20211025
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: 9ae1fbdeabd3 (\"Add linux-next specific files for 20211025\")
    target_arch: arm
    toolchain: gcc-11
    config: multi_v5_defconfig

build error :
--------------
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in
function `drm_fb_cma_get_gem_obj':
drivers/gpu/drm/drm_fb_cma_helper.c:46: undefined reference to
`drm_gem_fb_get_obj'
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46:
undefined reference to `drm_gem_fb_get_obj'
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:46:
undefined reference to `drm_gem_fb_get_obj'
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.o: in
function `drm_fb_cma_sync_non_coherent':
drivers/gpu/drm/drm_fb_cma_helper.c:133: undefined reference to
`drm_atomic_helper_damage_iter_init'
arm-linux-gnueabihf-ld: drivers/gpu/drm/drm_fb_cma_helper.c:135:
undefined reference to `drm_atomic_helper_damage_iter_next'
make[1]: *** [Makefile:1252: vmlinux] Error 1
make[1]: Target '__all' not remade because of errors.
make: *** [Makefile:226: __sub-make] Error 2

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>


build link:
-----------
https://builds.tuxbuild.com/1zzgFZBGjpQ5R0lawQFW9iJ39Hp/build.log

build config:
-------------
https://builds.tuxbuild.com/1zzgFZBGjpQ5R0lawQFW9iJ39Hp/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch arm --toolchain gcc-11
--kconfig multi_v5_defconfig

--
Linaro LKFT
https://lkft.linaro.org
