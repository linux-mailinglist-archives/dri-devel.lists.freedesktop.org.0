Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A8D4F63FF
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 17:52:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FE8810E3DA;
	Wed,  6 Apr 2022 15:52:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFB810E3DA
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:52:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B9B7561CF4
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:52:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BB5C385A6
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:52:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1649260337;
 bh=tAGDiffASCPLzAGh0QMeMOX8y+VFM4qhhes4PoMGJPk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=PVSieYNeih4eKJw7FsmLdj4sc9BCMwSz+NKreIZNs3emrlljOYXXGwVKSbmuKx2dL
 TwBw8JGiPpBs7fWbrFSwgVvEHPqQzCrHGyOgrU8Rewpsbh1ZfWRSeXG7zM3Czut2d6
 tOOg+ssu440PGPHy8TZcU3EbQmtPDAliAJGJs2UvpP0Xc/YxtRenAw7LRYyb9TBLHx
 17fOzQbOY6LwtOHydQMbfcRyTYwiF0578/fI1T+qkrwF85N6JM83MgrEeuUN4Qp2Th
 84gyIYUWs8jXRB68nbzIWG2+JtplKIDKa0q1K4KVQBH5zUzTrtvu9kHEWl/wdPaUPK
 czdiRbVN5a/mA==
Received: by mail-wr1-f45.google.com with SMTP id w21so3922338wra.2
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Apr 2022 08:52:17 -0700 (PDT)
X-Gm-Message-State: AOAM532nwulzoqlZuG+TDS9F6NZfOPbiAj5VOTaQGYaooIm2xn/Aqa17
 UgMdM+rlp8oe5r7VxoUHn+vYqMdYi3NDmYPjaAQ=
X-Google-Smtp-Source: ABdhPJxuQVZDOXTwHfHUhN6rYr9chzDHoRUTmEEWMvLzUT41VlgfbbHjcXqIC5wmAwO16H4vhKyYXMITJkCMs99y5Hg=
X-Received: by 2002:adf:d081:0:b0:1ef:9378:b7cc with SMTP id
 y1-20020adfd081000000b001ef9378b7ccmr7309154wrh.407.1649260335398; Wed, 06
 Apr 2022 08:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220316183708.1505846-1-arnd@kernel.org>
 <20220316183708.1505846-2-arnd@kernel.org> <Yk2TwyteFgeqkZE1@orome>
In-Reply-To: <Yk2TwyteFgeqkZE1@orome>
From: Arnd Bergmann <arnd@kernel.org>
Date: Wed, 6 Apr 2022 17:51:59 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3AdgMbAtf9SmrjXo61j=bAB3jxytJ6TALRid+ykdRtPw@mail.gmail.com>
Message-ID: <CAK8P3a3AdgMbAtf9SmrjXo61j=bAB3jxytJ6TALRid+ykdRtPw@mail.gmail.com>
Subject: Re: [PATCH] drm/tegra: vic: fix unused-function warnings
To: Thierry Reding <thierry.reding@gmail.com>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 "open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>,
 Dmitry Osipenko <digetx@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>,
 Robin Murphy <robin.murphy@arm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 6, 2022 at 3:21 PM Thierry Reding <thierry.reding@gmail.com> wrote:
> On Wed, Mar 16, 2022 at 07:36:47PM +0100, Arnd Bergmann wrote:
> >  static const struct dev_pm_ops vic_pm_ops = {
> > -     SET_RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
> > -     SET_SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend,
> > -                             pm_runtime_force_resume)
> > +     RUNTIME_PM_OPS(vic_runtime_suspend, vic_runtime_resume, NULL)
> > +     SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
> >  };
> >
> >  struct platform_driver tegra_vic_driver = {
>
> Hi Arnd,
>
> is this a replacement for __maybe_unused annotations that we would
> typically use to address these? Is the ternary operator in PTR_IF enough
> to eliminate the warning? Does that work the same way for structure
> definitions as it does for conditionals where we use IS_ENABLED() to use
> the compiler's DCE for improved coverage?

Yes to all three.

> It looks like it, but just making sure because there's another patch
> that fixes this warning by adding __maybe_unused.

I sent a lot of patches in the past to add __maybe_unused, but this was
mainly because we could never come up with a good replacement.
Paul Cercueil has finally come up with a good solution, so this is how
we should do it from now on.

        Arnd
