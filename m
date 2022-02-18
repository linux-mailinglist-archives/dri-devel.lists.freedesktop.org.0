Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B3A64BBA83
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 15:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6664F10EABF;
	Fri, 18 Feb 2022 14:16:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BB910EABF
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 14:16:44 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id c15so4476440ljf.11
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 06:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=uF68xvWcLx76IR6CWRwh/pPzuX0RgzE30BHq223TBtE=;
 b=FzdIE5ExskgQXsPsUcc/+PrxvJEenKLjZkIpwhU1v6DSIt8OcIxW6RlcnaZQ3OxZxU
 ARjBptI9pkzMDE6zcLGAqZi3FdhGGFiyEZsc/V+H5+rDDNhYXwdmalEDcAgJFoO+40M/
 auFXBjLNRX7NZa3FyVMIxmfxkVPhvYS4Vyu+vd2jlXzMLskgcrHUG/aWAQYgO45SWeAR
 RoySGtc+51y/m7blHTGBdkmYDrVwURA4kDBBTIG0vncukAAW/oyc3dlEPI7sVOgJJg30
 Z+urn37MUd5lmpcSvjsEjYmmRIYeeb0a+539nXscyVOcrV3Sj8hQUu27cZRd5ppEm4tw
 984w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uF68xvWcLx76IR6CWRwh/pPzuX0RgzE30BHq223TBtE=;
 b=4aH4UNP5iWXXzi41Ll3b3RLAJE8ChoQHLEayHVT5nBNB58lcebXPpvRjOKHIez+SvO
 OvEoRYsHJBDpfmImpKdS4X7cQA6t12nmY6XOy+Mo+c2hATWrZ6YRlMpP+meZbGyEGmHo
 2GunNZ/8GKLZ7V1to+GIUOn3M6Vz4CWA1eDCLSmDuXfbxEPgXNuOJ0aL43wjHZ+3mzqC
 PAjFKrxkvrH5Nz5Md/H4Rm56UvQiKMz1PBezCBfT/dNrI6/aANrAb2gqssu1lhiHTFJ8
 OIwb0XqcRFLQN2sprAOJjh/OsjtLJYeu/6lkU5it5LRxVbSiTQBwCn/hWJPuI2/Yire9
 AmGw==
X-Gm-Message-State: AOAM531pY9L50O+9bD7gWl2gftbFlYZI3bJ+K+295FHnV0BAJ3nwFJMZ
 vWUzyE34Eqhaijdh61U+B/7R/gnm6c8=
X-Google-Smtp-Source: ABdhPJy4TANF3ZWP7o81wk90zI7oXc9TbkAP3k0Y6qF9Amiv/qj+iJGq7IKqH4PJbO4d6Qn5OHR1Fw==
X-Received: by 2002:a05:651c:901:b0:245:f621:55ff with SMTP id
 e1-20020a05651c090100b00245f62155ffmr5781816ljq.247.1645193802865; 
 Fri, 18 Feb 2022 06:16:42 -0800 (PST)
Received: from [192.168.2.145] (109-252-138-165.dynamic.spd-mgts.ru.
 [109.252.138.165])
 by smtp.googlemail.com with ESMTPSA id e30sm321572ljb.89.2022.02.18.06.16.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Feb 2022 06:16:42 -0800 (PST)
Message-ID: <0e936e9a-57a2-3881-1a55-50682b859acc@gmail.com>
Date: Fri, 18 Feb 2022 17:16:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH libdrm v2 00/25] Update Tegra support
Content-Language: en-US
To: Thierry Reding <thierry.reding@gmail.com>
References: <20220217191625.2534521-1-thierry.reding@gmail.com>
 <fb059f6f-013a-4a7e-55a7-81acbdda80fc@gmail.com> <Yg7ANdIhSiEsZf8E@orome>
From: Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <Yg7ANdIhSiEsZf8E@orome>
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

18.02.2022 00:37, Thierry Reding пишет:
> On Thu, Feb 17, 2022 at 11:02:53PM +0300, Dmitry Osipenko wrote:
>> 17.02.2022 22:16, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> Hi all,
>>>
>>> this is the userspace part of the kernel patches that were recently
>>> merged into drm-next:
>>>
>>>   https://patchwork.freedesktop.org/series/92378/
>>>
>>> The goal is to provide a userspace implementation of the UAPI exposed by
>>> the kernel and show its usage in some test programs that can also be
>>> used for basic sanity testing. More complete userspace implementations
>>> are available here:
>>>
>>>   * https://github.com/cyndis/vaapi-tegra-driver
>>>   * https://github.com/grate-driver/xf86-video-opentegra
>>>   * https://github.com/grate-driver/grate
>>>
>>> Changes in v2:
>>> - implement vic_clear() as a helper using ->fill() (Michał Mirosław)
>>> - rebase and fix a couple of Meson errors/warnings
>>>
>>> Thierry
>>>
>>> Thierry Reding (25):
>>>   tegra: Indent according to .editorconfig
>>>   tegra: Remove unused IOCTL implementations
>>>   tegra: Extract common buffer object allocation code
>>>   tegra: Fix mmap() of GEM buffer objects
>>>   tegra: Add flink helpers
>>>   tegra: Add PRIME support helpers
>>>   tegra: Make API more consistent
>>>   tegra: Install tegra-openclose test
>>>   tegra: Update for new UABI
>>>   tegra: Include private.h in list of source files
>>>   tegra: Add channel APIs
>>>   tegra: Add job and push buffer APIs
>>>   tegra: Add syncpoint APIs
>>>   tests: tegra: Add helper library for tests
>>>   tests: tegra: Add gr2d-fill test
>>>   tests: tegra: Add syncpt-wait test
>>>   tests: tegra: Add syncpoint timeout test
>>>   tests: tegra: Add VIC support
>>>   tests: tegra: Add VIC 3.0 support
>>>   tests: tegra: Add VIC 4.0 support
>>>   tests: tegra: Add VIC 4.1 support
>>>   tests: tegra: Add VIC 4.2 support
>>>   tests: tegra: Add VIC clear test
>>>   tests: tegra: Add VIC blit test
>>>   tests: tegra: Add VIC flip test
>>>
>>>  include/drm/tegra_drm.h      | 429 +++++++++++++++++++++++--
>>>  tegra/channel.c              | 195 ++++++++++++
>>>  tegra/job.c                  | 187 +++++++++++
>>>  tegra/meson.build            |   7 +-
>>>  tegra/private.h              |  85 ++++-
>>>  tegra/pushbuf.c              | 184 +++++++++++
>>>  tegra/syncpt.c               | 101 ++++++
>>>  tegra/tegra-symbols.txt      |  27 +-
>>>  tegra/tegra.c                | 386 +++++++++++-----------
>>>  tegra/tegra.h                |  95 +++++-
>>>  tests/tegra/.gitignore       |   3 +-
>>>  tests/tegra/drm-test-tegra.c | 147 +++++++++
>>>  tests/tegra/drm-test-tegra.h |  55 ++++
>>>  tests/tegra/drm-test.c       | 248 +++++++++++++++
>>>  tests/tegra/drm-test.h       |  72 +++++
>>>  tests/tegra/gr2d-fill.c      | 146 +++++++++
>>>  tests/tegra/host1x.h         |  34 ++
>>>  tests/tegra/meson.build      |  88 +++++-
>>>  tests/tegra/openclose.c      |  52 +--
>>>  tests/tegra/syncpt-timeout.c | 163 ++++++++++
>>>  tests/tegra/syncpt-wait.c    | 151 +++++++++
>>>  tests/tegra/vic-blit.c       | 333 +++++++++++++++++++
>>>  tests/tegra/vic-clear.c      | 173 ++++++++++
>>>  tests/tegra/vic-flip.c       | 333 +++++++++++++++++++
>>>  tests/tegra/vic.c            | 184 +++++++++++
>>>  tests/tegra/vic.h            | 181 +++++++++++
>>>  tests/tegra/vic30.c          | 458 +++++++++++++++++++++++++++
>>>  tests/tegra/vic30.h          | 439 ++++++++++++++++++++++++++
>>>  tests/tegra/vic40.c          | 370 ++++++++++++++++++++++
>>>  tests/tegra/vic40.h          | 285 +++++++++++++++++
>>>  tests/tegra/vic41.c          | 374 ++++++++++++++++++++++
>>>  tests/tegra/vic41.h          | 372 ++++++++++++++++++++++
>>>  tests/tegra/vic42.c          | 374 ++++++++++++++++++++++
>>>  tests/tegra/vic42.h          | 597 +++++++++++++++++++++++++++++++++++
>>>  34 files changed, 7068 insertions(+), 260 deletions(-)
>>
>>
>> Why do we need these tests in libdrm? Why not IGT?
> 
> Oops, sorry. I had meant to reply to your question in the previous
> version. The idea was to have this minimal set of tests in libdrm as a
> way to demonstrate how to use the various APIs. At the same time, this
> is meant to serve as an easy way to validate that everything works from
> the comparatively simple libdrm package.

Who will be validating libdrm on Tegra?

> But yes, adding more tests on top of this to IGT is something that I've
> been pondering and I certainly wouldn't object if anyone else was going
> to attempt to do so. I don't think IGT and libdrm need to be mutually
> exclusive, though.

I know that IGT tests are regularly run by the KernelCI at least on TK1.
