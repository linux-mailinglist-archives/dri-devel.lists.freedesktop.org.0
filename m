Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A1BA4BAA87
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 21:03:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDB4110E74B;
	Thu, 17 Feb 2022 20:02:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B175710E74B
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 20:02:58 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id r20so1125516ljj.1
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 12:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=KQR8LCJbjQjXzcxrSAYZuk3yAvGZoRDFWFTfgMCscjE=;
 b=InOmyOIc3UKHzULdSjo/eX57m68E6HkyQvI6Cc+ZLjM6vdVvycLA3wsmc7w1252CPj
 DVRgcAQWAhM2VR+9nbM+7xT11OVWNGOWiYRysVtnEWE7clIYd3oGlXzuODvAGGovkgab
 8SJK19kkOYhAWcY/fi7R9uSHMbnTfDbmDHfy8yHI0AIae1LndRlawz/moFGM6uLqJtBB
 TkaCi1xHAlUPTCH7LjWVcBXwNlTO8VTrpx/+qNTjvWmnQsrpakdBAuQYbr29xT1vz163
 qDUcTWP+hXJlVqHfqAXplop0lKdiZTWTszmrbbdDpSslMmQ/kst4wS4NuGyhVOMjg5P7
 66dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KQR8LCJbjQjXzcxrSAYZuk3yAvGZoRDFWFTfgMCscjE=;
 b=mBCMOt9ROndT8HjF6QDu7ol2xB1q50UZHz30xATufZv4ajJkPUj0Bv4H099dlVBq/0
 wCOI1lS53KGNiJr3wqUfIyo2kFuxefgA4BEqVcdeRr+w/qjioCijaBzmsL4n20PN4ju2
 D14MM/YU6SfmalmlDEJnzQvIfLlHQO0sBoJ38b6/GDGFjnSrMSKEeZwV1TwJCAiUd69J
 17RxO73zCd6lcDVnR70OkzuqAkkOwhT/LhGv3LivWV0L1PqnjIv4FB1+/EtoTuma6YWN
 m/eU9qxfrUEsmGfPu0tBlCJcw0zT7ptmMKUgk+vc7gAwrS/+wwGbYrfd5/MibkerJDSR
 lSAg==
X-Gm-Message-State: AOAM533IZMoaUR69vk822EMO30ae0xrcvdGXE4ZbQ/nO8Ogco1+nKx//
 MRf4v0+P8g5YHmPUZhVfdck=
X-Google-Smtp-Source: ABdhPJzvaBZWOYC6umpuobEIYSMG4QFjsdwfwEO2xcJuAguncF4cG1MX1DNFVdyK/lsgeIjKQEmPXw==
X-Received: by 2002:a05:651c:1725:b0:244:bbe7:2433 with SMTP id
 be37-20020a05651c172500b00244bbe72433mr3346794ljb.144.1645128176835; 
 Thu, 17 Feb 2022 12:02:56 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id v6sm71113ljd.86.2022.02.17.12.02.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Feb 2022 12:02:54 -0800 (PST)
Message-ID: <fb059f6f-013a-4a7e-55a7-81acbdda80fc@gmail.com>
Date: Thu, 17 Feb 2022 23:02:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 00/25] Update Tegra support
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <20220217191625.2534521-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

17.02.2022 22:16, Thierry Reding пишет:
> From: Thierry Reding <treding@nvidia.com>
> 
> Hi all,
> 
> this is the userspace part of the kernel patches that were recently
> merged into drm-next:
> 
>   https://patchwork.freedesktop.org/series/92378/
> 
> The goal is to provide a userspace implementation of the UAPI exposed by
> the kernel and show its usage in some test programs that can also be
> used for basic sanity testing. More complete userspace implementations
> are available here:
> 
>   * https://github.com/cyndis/vaapi-tegra-driver
>   * https://github.com/grate-driver/xf86-video-opentegra
>   * https://github.com/grate-driver/grate
> 
> Changes in v2:
> - implement vic_clear() as a helper using ->fill() (Michał Mirosław)
> - rebase and fix a couple of Meson errors/warnings
> 
> Thierry
> 
> Thierry Reding (25):
>   tegra: Indent according to .editorconfig
>   tegra: Remove unused IOCTL implementations
>   tegra: Extract common buffer object allocation code
>   tegra: Fix mmap() of GEM buffer objects
>   tegra: Add flink helpers
>   tegra: Add PRIME support helpers
>   tegra: Make API more consistent
>   tegra: Install tegra-openclose test
>   tegra: Update for new UABI
>   tegra: Include private.h in list of source files
>   tegra: Add channel APIs
>   tegra: Add job and push buffer APIs
>   tegra: Add syncpoint APIs
>   tests: tegra: Add helper library for tests
>   tests: tegra: Add gr2d-fill test
>   tests: tegra: Add syncpt-wait test
>   tests: tegra: Add syncpoint timeout test
>   tests: tegra: Add VIC support
>   tests: tegra: Add VIC 3.0 support
>   tests: tegra: Add VIC 4.0 support
>   tests: tegra: Add VIC 4.1 support
>   tests: tegra: Add VIC 4.2 support
>   tests: tegra: Add VIC clear test
>   tests: tegra: Add VIC blit test
>   tests: tegra: Add VIC flip test
> 
>  include/drm/tegra_drm.h      | 429 +++++++++++++++++++++++--
>  tegra/channel.c              | 195 ++++++++++++
>  tegra/job.c                  | 187 +++++++++++
>  tegra/meson.build            |   7 +-
>  tegra/private.h              |  85 ++++-
>  tegra/pushbuf.c              | 184 +++++++++++
>  tegra/syncpt.c               | 101 ++++++
>  tegra/tegra-symbols.txt      |  27 +-
>  tegra/tegra.c                | 386 +++++++++++-----------
>  tegra/tegra.h                |  95 +++++-
>  tests/tegra/.gitignore       |   3 +-
>  tests/tegra/drm-test-tegra.c | 147 +++++++++
>  tests/tegra/drm-test-tegra.h |  55 ++++
>  tests/tegra/drm-test.c       | 248 +++++++++++++++
>  tests/tegra/drm-test.h       |  72 +++++
>  tests/tegra/gr2d-fill.c      | 146 +++++++++
>  tests/tegra/host1x.h         |  34 ++
>  tests/tegra/meson.build      |  88 +++++-
>  tests/tegra/openclose.c      |  52 +--
>  tests/tegra/syncpt-timeout.c | 163 ++++++++++
>  tests/tegra/syncpt-wait.c    | 151 +++++++++
>  tests/tegra/vic-blit.c       | 333 +++++++++++++++++++
>  tests/tegra/vic-clear.c      | 173 ++++++++++
>  tests/tegra/vic-flip.c       | 333 +++++++++++++++++++
>  tests/tegra/vic.c            | 184 +++++++++++
>  tests/tegra/vic.h            | 181 +++++++++++
>  tests/tegra/vic30.c          | 458 +++++++++++++++++++++++++++
>  tests/tegra/vic30.h          | 439 ++++++++++++++++++++++++++
>  tests/tegra/vic40.c          | 370 ++++++++++++++++++++++
>  tests/tegra/vic40.h          | 285 +++++++++++++++++
>  tests/tegra/vic41.c          | 374 ++++++++++++++++++++++
>  tests/tegra/vic41.h          | 372 ++++++++++++++++++++++
>  tests/tegra/vic42.c          | 374 ++++++++++++++++++++++
>  tests/tegra/vic42.h          | 597 +++++++++++++++++++++++++++++++++++
>  34 files changed, 7068 insertions(+), 260 deletions(-)


Why do we need these tests in libdrm? Why not IGT?

