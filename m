Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F7051FBAFF
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 18:16:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F1BB6E5C0;
	Tue, 16 Jun 2020 16:16:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C7556E5C0
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 16:16:34 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id 190so11746665vsr.9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jun 2020 09:16:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j0f7aQbEfhsw24ZMy40vxFz161lgqQWF2rmVXfxppeU=;
 b=mH9A5mQ3ouroig2SXDtIPCJ2Xh+w/YtCly1FlWr0h6/txUnYBBZdQcU9XKf2FhrlJU
 W53l5Mp6VTv694VILrKENUTo30e1FeQi5CLtdbc2gh/CzkY8ZrMMpxsROT2zHf8Ml0nf
 TCbSMG7Qcsykr4zHuBNb4uJBqX2SJwz0yQciutxchw1fi4ByfPmHGMbpBeI+/ygEFfMK
 pOYoxY4dM7Y6pjNIlYoCZQozLVop1Kw+lckxIwjX33448TvZec9MunV5S0p52f1SFGsz
 8KMVPlWibjuMbMZiHAc+hSYymGMmnIzFEpN7JxY5Klo/o/n2ScZOmXDolAxqpiWvNs2S
 KkmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j0f7aQbEfhsw24ZMy40vxFz161lgqQWF2rmVXfxppeU=;
 b=VL/AUT7yNdaQRKZityrfKX9f08PUePJDbKtgFKGMFMNsP1VDG48zcjEe1nyckM448Q
 gydK3IJl2epidkcINLnzVWNvoSZ2RzOaM9b2nG4+VS19yFiUEo1Oeo4BNeKya3LBQGfF
 yYTHcCBNnwbAPOviP0XbP0YzurZMVlrrNBLf8rAB4AktN4lR9BBp4dkftPGJ4TKnXogG
 tnnUOJWYhzk5RboBV2tTi/NMD8vqx4rXFiSXbRk9+UfQC527DB7ny03irqVsZQ2Fr+mS
 FJT8JhpNWge+eY4Jab8qApwuDxFxLk+z3Md4UZbqb1mpH0Z/MUgYvzg5RawRSe2/H1E8
 VQUQ==
X-Gm-Message-State: AOAM530dE/DrFuFlCDnINaeQa8/RjgM++dwSbe5K6BtST/meK1fWasH2
 VPhH3Po0yOnauxtEGOeb92aVqL4HN0ZbNfAMohE=
X-Google-Smtp-Source: ABdhPJwEOfuAZpDyAicRuaHACbGkk742F1Urk0jRcNhWYHdVilvKR9a1h7RpgtkV/So8XeSKrSzT5XbL89p/SceswGI=
X-Received: by 2002:a67:c18a:: with SMTP id h10mr2320162vsj.186.1592324193305; 
 Tue, 16 Jun 2020 09:16:33 -0700 (PDT)
MIME-Version: 1.0
References: <20200609200446.153209-4-linus.walleij@linaro.org>
 <202006101538.mV5c2loX%lkp@intel.com>
In-Reply-To: <202006101538.mV5c2loX%lkp@intel.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Tue, 16 Jun 2020 17:12:51 +0100
Message-ID: <CACvgo536CxAynhx3zcamS2-e=a7j++X7X66N4zG_L_HrjLk77A@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm: pl111: Update documentation
To: kernel test robot <lkp@intel.com>
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
Cc: kbuild-all@lists.01.org, Russell King <linux@armlinux.org.uk>,
 ML dri-devel <dri-devel@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 LAKML <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi all,

Inspired by Linus and my personal confusion with the report, allow me
to put some suggestions. Followed by an illustrative example.

On Wed, 10 Jun 2020 at 08:38, kernel test robot <lkp@intel.com> wrote:
>
> Hi Linus,
>
> I love your patch! Perhaps something to improve:
>
> [auto build test WARNING on drm-exynos/exynos-drm-next]
> [also build test WARNING on drm-intel/for-linux-next tegra-drm/drm/tegra/for-next linus/master v5.7 next-20200609]
One thing which was always inclear me - is the warning identical in
all the branches listed.

> [cannot apply to drm-tip/drm-tip drm/drm-next]
> [if your patch is applied to the wrong git tree, please drop us a note to help
> improve the system. BTW, we also suggest to use '--base' option to specify the
> base tree in git format-patch, please see https://stackoverflow.com/a/37406982]
>
Reference to the manual tends to be better than an old SO thread.

> url:    https://github.com/0day-ci/linux/commits/Linus-Walleij/drm-pl111-Credit-where-credit-is-due/20200610-041025
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos.git exynos-drm-next
> reproduce: make htmldocs
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
Please do not list old warnings/errors. They only distract and dilute
what/where the problem is.


> vim +1 drivers/gpu/drm/pl111/pl111_drv.c
>
> e559355a9da60a Thomas Gleixner 2019-06-01  @1  // SPDX-License-Identifier: GPL-2.0-only
> bed41005e6174d Tom Cooksey     2017-04-12   2  /*
> bed41005e6174d Tom Cooksey     2017-04-12   3   * (C) COPYRIGHT 2012-2013 ARM Limited. All rights reserved.
> bed41005e6174d Tom Cooksey     2017-04-12   4   *
> bed41005e6174d Tom Cooksey     2017-04-12   5   * Parts of this file were based on sources as follows:
> bed41005e6174d Tom Cooksey     2017-04-12   6   *
> bed41005e6174d Tom Cooksey     2017-04-12   7   * Copyright (c) 2006-2008 Intel Corporation
> bed41005e6174d Tom Cooksey     2017-04-12   8   * Copyright (c) 2007 Dave Airlie <airlied@linux.ie>
> bed41005e6174d Tom Cooksey     2017-04-12   9   * Copyright (C) 2011 Texas Instruments
> bed41005e6174d Tom Cooksey     2017-04-12  10   */
> bed41005e6174d Tom Cooksey     2017-04-12  11
>
> :::::: The code at line 1 was first introduced by commit
> :::::: e559355a9da60a2388893d9e9da66c79fd604b9a treewide: Replace GPLv2 boilerplate/reference with SPDX - rule 443
>
> :::::: TO: Thomas Gleixner <tglx@linutronix.de>
> :::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>
All of this seems useful when debugging the kernel test robot itself.
Which in this case is misleading as hell.


Here is something which is much shorter, with clearer structure and
reads much easier.

---
Hi Linus,

This is an automated message from your friendly test robot.
We've noticed some issues with your patch although being a robot,
kindly double-check the results.

Branches:
[if the warning/errors are the same group them, otherwise split them
in separate sections]

- drm-exynos/exynos-drm-next [1]: WARNING
- drm-intel/for-linux-next [2]: WARNING
- .... : WARNING
drivers/gpu/drm/pl111/pl111_drv.c:1: warning: 'ARM PrimeCell PL111
CLCD Driver' not found
- tegra-drm/drm/tegra/for-next [3]: WARNING
some other warning
- drm-tip/drm-tip [4] drm/drm-next [5]: cannot apply series

Note: when submitting patches, please use `--base` as documented in
https://git-scm.com/docs/git-format-patch.


To reproduce:
 - wget https://url/to/build/toolchain // when applicable
 - wget https://url/to/config // when applicable
 - make htmldocs // use explicit make command instead of magic shell
script, as seen in the cross build reports


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

Thank you
The LKP team

[1] URI to the drm-exynos/exynos-drm-next repo
[2] URI to the drm-intel/for-linux-next repo
[3] URI to the ...
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
