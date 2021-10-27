Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E6443C9E9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 14:44:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9250898A8;
	Wed, 27 Oct 2021 12:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A085898A8
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 12:44:14 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id 5so9980980edw.7
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 05:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=CUP4vrt1rUdvfDXyrscKzMJOp93zpu22SaFg7PrBhiA=;
 b=CcPOQ4OiOX2pt/+YZ+a+5+PtsWF58l5SIZlH7c0NMdqivhouLD+fqU1vUJ422nap8B
 pXvW4gzg5Z+Ti/2tVTyhRbxCD7rdEYI6XvjOMGWYQbKtmy/pc7QvOVhwNyQu184WqIC5
 2tV2MOHw276tD+nGtZmQG8Ba/v3g6qUs6plqIh/ut+JOLhXhZtwqwhtVKZkucfTLZabK
 9jdO5soJ/DOaLWObW8ethd2/N1Hps4tn1zIRZlUR+lKmFJg0biwKXf65CD45k1qXdJAt
 r0adfgL8DZmSWiXmeRX4XaBTp+PL5NT81t0OI1CJjwfUDicLP4x//QMngQR/4rme5oOn
 r9kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=CUP4vrt1rUdvfDXyrscKzMJOp93zpu22SaFg7PrBhiA=;
 b=vW9/LT/2HHBGigSXYlgud90O6viiLodFekNnD0Rh5SA1YVutdCN3GyTAkLs/saoZvI
 h0I7DMhrccWsuax2x6tkvxtzxKInaDxcalmk+yKsISNiEZ60lDFFme95Ev8qguadSspk
 8yibcEbT69WZhT2l7jckeyNQ8NfG8/WNoqXNCqqdjyQ+lVCfeXKPKibuLZ94QhLjTD4k
 irzqHGuA1Wlxz7L+4dkzMExqtuFblzQV3sA74DcjAyXwc7TXw/gyUNpaeXi4h7NKnx0E
 s7V+GJo8LzNu1pTZ1hZ3rTEiMnQsp3oRe2o3fnEGlek+QaHPupjta9JUubybex9PwENM
 gLOA==
X-Gm-Message-State: AOAM532KPk0sUcMDC4nTqmnsvd5PBWA5rKryqgnNltL4XofdR8TwMNfA
 OEQHJXriYc3B94tHpdn2ZVrbuQxP+57dD36u242gjQ==
X-Google-Smtp-Source: ABdhPJzwVWeqcvccpIgdrAd8nGZnO+VjAujcw0FniNnKHAKDWNnTXb7Z/uiWrqylHJantGjdST3K827hkeW2H4l5IBA=
X-Received: by 2002:a50:ff0a:: with SMTP id a10mr30220760edu.357.1635338652901; 
 Wed, 27 Oct 2021 05:44:12 -0700 (PDT)
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 27 Oct 2021 18:14:01 +0530
Message-ID: <CA+G9fYsOdhqbgRwuV7RD5k3Wh3n_Cb_EmMnkYOJ+4wZi-7MgrQ@mail.gmail.com>
Subject: ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap from
 namespace DMA_BUF, but does not import it.
To: Linux-Next Mailing List <linux-next@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, 
 open list <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Andrey Konovalov <andreyknvl@gmail.com>,
 Stephen Rothwell <sfr@canb.auug.org.au>, 
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

Regression found on arm64 gcc-10 and gcc-11 built with defconfig
Following build warnings / errors reported on linux next 20211027.

metadata:
    git_describe: next-20211027
    git_repo: https://gitlab.com/Linaro/lkft/mirrors/next/linux-next
    git_short_log: ae5179317e79 (\"Add linux-next specific files for 20211027\")
    target_arch: arm64
    toolchain: gcc-11

build error :
--------------
ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vunmap from
namespace DMA_BUF, but does not import it.
ERROR: modpost: module drm_cma_helper uses symbol dma_buf_vmap from
namespace DMA_BUF, but does not import it.
make[2]: *** [/builds/linux/scripts/Makefile.modpost:134:
modules-only.symvers] Error 1
make[2]: *** Deleting file 'modules-only.symvers'
make[2]: Target '__modpost' not remade because of errors.

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

build link:
-----------
https://builds.tuxbuild.com/205SAU159J0g6lSlRRS11o5hHyY/build.log

build config:
-------------
https://builds.tuxbuild.com/205SAU159J0g6lSlRRS11o5hHyY/config

# To install tuxmake on your system globally
# sudo pip3 install -U tuxmake
tuxmake --runtime podman --target-arch arm64 --toolchain gcc-11
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org
