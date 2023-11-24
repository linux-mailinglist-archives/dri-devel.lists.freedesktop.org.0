Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 121C47F6A0C
	for <lists+dri-devel@lfdr.de>; Fri, 24 Nov 2023 02:14:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD9FD10E779;
	Fri, 24 Nov 2023 01:14:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26AB510E775
 for <dri-devel@lists.freedesktop.org>; Fri, 24 Nov 2023 01:14:40 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-548a2c20f50so1892159a12.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Nov 2023 17:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700788478; x=1701393278; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=63sQ1AH1I32ffRCwtEtkqR0j31IoAtIR8HssDvXhDlI=;
 b=mmhX87GjhttAkb+C9N9eyi/bmtS+L+bR0TnColw5ckGDYBtQZjaiZoEgYMSigWw/Xh
 yUFQxUgai8d7id5Qq9OhgEBEmtoosIwwo8XwCYNWPkGBjK57F4tj/cZDcLFluWZbc0yr
 kaVSGsM3VAaXtlE+3xdV5qbw7nsTaD4zakOjI/im/0us6pwINxelwvS+jEy99hlDwIQf
 gWMM3X+84nGB153XgQFo4LSFJ3hgg9jy5x0y/kVpw5S8ejVShdvRAkZ3jJkeXn7dASpb
 2S7sKgMbbVZSlAQjn9gQ01q1I5P1Xuu0adks3IfG4/YYD5wHgxTwN9rTCGHgEcmIcPH1
 hbww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700788478; x=1701393278;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=63sQ1AH1I32ffRCwtEtkqR0j31IoAtIR8HssDvXhDlI=;
 b=t6M3uZ9RJivGMyR2puR4f/GkEicTvw0AvL/GIn7H1ItBzwrYpC0pDQP2Hub3MRE6SC
 DOjLir38hu1MEgD417bES+C8ToM4hXygJtKjqXL0AaKBaJ59H/NftfnrR4yaQ7fJYBgg
 NzxNg1ZcxuZ0+BgzFKYyRqJakc1biWL7XAAxGG761T0MwNjwD6cMX6P+z+lCKK4hEpcK
 MUbbnPsDg5XCJtYahcH+kHjymBUutu+09RZ2RMRXGMPbVuWJFC9QvjEBGevTWEttiP85
 AiCv6tLCJURQO5fs46M+ZE4d2cUk8MW6OId8sSrEZ8emTmceDJkgx3W6fhHmvmfUki6q
 RiGg==
X-Gm-Message-State: AOJu0YxfEMHsCWKPrZtwRpCHUTCyywJJkxAcLvcYFYVlv/0rcdRp9NUr
 1q0ZWfb+lFs9Bgt0HC/rdqqSXE5yvr4x5im/28tBbAIaCo4=
X-Google-Smtp-Source: AGHT+IHLIX9nFgHWswrxl4QhZA1sMO6aysJc8mE548EEq2zaQNtD+vtju8Lr3kfPZInT9eHY959lN4T9+2J71dDRGtk=
X-Received: by 2002:a17:907:1310:b0:a04:8ee8:5e58 with SMTP id
 vj16-20020a170907131000b00a048ee85e58mr574460ejb.45.1700788477971; Thu, 23
 Nov 2023 17:14:37 -0800 (PST)
MIME-Version: 1.0
References: <CGME20231120225538epcas1p205a656dfe9771fc992ee1a6756ca67d3@epcas1p2.samsung.com>
 <20231120225537.1270358-1-inki.dae@samsung.com>
In-Reply-To: <20231120225537.1270358-1-inki.dae@samsung.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 24 Nov 2023 11:14:26 +1000
Message-ID: <CAPM=9txk2nqYykd5shh3Ux7Jff8hweQnhpNUtYmT9nbcKrHdsA@mail.gmail.com>
Subject: Re: [GIT PULL] exynos-drm-fixes
To: Inki Dae <inki.dae@samsung.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: airlied@linux.ie, linux-samsung-soc@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 21 Nov 2023 at 09:00, Inki Dae <inki.dae@samsung.com> wrote:
>
> Hi Dave and Daniel,
>
>    Two fixups - fixing a potential error pointer dereference and wrong
>    error checking.
Hi Inki,

This fails to build on arm32, and it seems one of the fixes is wrong

[airlied@dreadlord drm-fixes]$ make ARCH=3Darm
CROSS_COMPILE=3Darm-linux-gnu- O=3D../../arm-build-fixes/  -j16
make[1]: Entering directory '/home/airlied/devel/kernel/arm-build-fixes'
  GEN     Makefile
      CALL    /home/airlied/devel/kernel/dim/drm-fixes/scripts/checksyscall=
s.sh
  CC [M]  drivers/gpu/drm/exynos/exynos_drm_dma.o
/home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_drm_=
dma.c:
In function =E2=80=98exynos_drm_register_dma=E2=80=99:
/home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_drm_=
dma.c:119:40:
error: passing argument 1 of =E2=80=98PTR_ERR=E2=80=99 makes pointer from i=
nteger
without a cast [-Werror=3Dint-conversion]
  119 |                         return PTR_ERR(-ENODEV);
In file included from
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/string.h:9,
                 from
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/dma-mapping.h:7,
                 from
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/dma-map-ops.h:9,
                 from
/home/airlied/devel/kernel/dim/drm-fixes/drivers/gpu/drm/exynos/exynos_drm_=
dma.c:7:
/home/airlied/devel/kernel/dim/drm-fixes/include/linux/err.h:49:61:
note: expected =E2=80=98const void *=E2=80=99 but argument is of type =E2=
=80=98int=E2=80=99
   49 | static inline long __must_check PTR_ERR(__force const void *ptr)
      |                                                 ~~~~~~~~~~~~^~~
cc1: all warnings being treated as errors

I think it should just be return -ENODEV, since the function returns an int=
.

Please fix it up and resend.

Thanks,
Dave.



>
>    Ps. regarding the first patch, I had sent a GIT-PULL[1] but it seems
>        you missed.
>    [1] https://lore.kernel.org/dri-devel/20231006040950.4397-1-inki.dae@s=
amsung.com/T/#u
>
>    Please kindly let me know if there is any problem.
>
> Thanks,
> Inki Dae
>
> The following changes since commit 98b1cc82c4affc16f5598d4fa14b1858671b22=
63:
>
>   Linux 6.7-rc2 (2023-11-19 15:02:14 -0800)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/daeinki/drm-exynos tags/e=
xynos-drm-fixes-for-v6.7-rc3
>
> for you to fetch changes up to a30ba4bd7cdb5726d86a557c5df8df71c7bc7fad:
>
>   drm/exynos: fix a wrong error checking (2023-11-21 07:41:11 +0900)
>
> ----------------------------------------------------------------
> Two fixups
> - Fix a potential error pointer dereference by checking the return value
>   of exynos_drm_crtc_get_by_type() function before accessing to crtc
>   object.
> - Fix a wrong error checking in exynos_drm_dma.c modules, which was repor=
ted
>   by Dan[1]
>
> [1] https://lore.kernel.org/all/33e52277-1349-472b-a55b-ab5c3462bfcf@moro=
to.mountain/
>
> ----------------------------------------------------------------
> Inki Dae (1):
>       drm/exynos: fix a wrong error checking
>
> Xiang Yang (1):
>       drm/exynos: fix a potential error pointer dereference
>
>  drivers/gpu/drm/exynos/exynos_drm_dma.c | 8 +++-----
>  drivers/gpu/drm/exynos/exynos_hdmi.c    | 2 ++
>  2 files changed, 5 insertions(+), 5 deletions(-)
