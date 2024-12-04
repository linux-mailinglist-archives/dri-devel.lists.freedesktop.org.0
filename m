Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C59B19E3BC5
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 14:54:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3015510ED3B;
	Wed,  4 Dec 2024 13:54:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uSmJgA13";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com
 [209.85.217.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1361210ED3B
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 13:54:45 +0000 (UTC)
Received: by mail-vs1-f46.google.com with SMTP id
 ada2fe7eead31-4af1ace57c7so492413137.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 05:54:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733320484; x=1733925284; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/TF0Nwn/uxbQ0jRBIOm8Y4E/+CokY8zgI5N0QMm7aiY=;
 b=uSmJgA13oUE/oUnsyHA7pJPlRmSiT2PS7CHRs9xuJgQRu0h2yWN7cdrSDEWX/mSHUl
 tqLAZSeoIRRhMp55XP/6cJh0MtCuS4KhTV3BAz1AQiOmZkZxTYbs+Kgl8fWxGuD4NTqG
 N0pd3dUNA9NsPROZHfw1Ar6ynJVM3qzvb7B3a0dJ8hrpo7iEQPzcZIXFx/hQOvVYsu4w
 8Y1imxSMQJ4RiMPhD6HnKpD0N4CsSinxQU9YfRjvmB+zu9vnnbTJeUWjXN7PDrYsC+Fo
 Z6UvwwOtdor0/qrQ3EX1xR1QLVyXMUYtHD4qfaJPN+VyDexUmwy6LJG8Sjr/t1LHd9CZ
 Jj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733320484; x=1733925284;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/TF0Nwn/uxbQ0jRBIOm8Y4E/+CokY8zgI5N0QMm7aiY=;
 b=aLWwrnPezagmDH+sXHl1dXpQfdmLlc8DfApWez6uqPg/LjK4bYTcTu2AKEP70LRBdv
 kiVPkg2G+ZVPbwktNZjsP2Pyx7h5VIufzGgrnvFf7Qb8FVQVAoFrx7DWjL6a1pO71GmA
 YbTP9z+aLm2Pp5kE4L5+mbn/jo3wEZzjGTfPCflY1d7kCS9w5+KROd4sk01HtGIIgha6
 Mx+07ia5TXhW+0z4gOHSMprE1voqbIZDn183/00pbSnbmwRBkTvZBOx48hJ7IksPkfRh
 dEu0EatPLj7KkOj3CMbKtZQR0IJQBfbk/I6Je3X+F1y4CEF2XcLjpVE2fzJXCzWsNDGg
 qtvA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTDddzetn1Cu67kOpXv1tIX4kjucibMObmf7oxLfToR4TNkpkXm3XeRlHL6Tzpc2aCK79WLaLYsts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YymansuLWsD5SYY/GLp2P/hxp7nBFYgDdTNV8D9dZrSzUzPzhVg
 MwsDQUjGVsxWifchcBDUSyJaGqQFxyR6Gmgdpn4OFJ+xE4swTlZCeIdxDidgrsFij7OjxF+AfnZ
 DTkGjL6is3YsWseTHdSqqHEc47GO6XmtjShUtig==
X-Gm-Gg: ASbGncsitgKH8ilSgGg/JBmRFiRIN5U5uPjAuswh7QwB4wSBkFzKjaoL2/JIl8aXllY
 JBG2+PEKZSXmeTshZ3UZu0vLgx+bjCQJj
X-Google-Smtp-Source: AGHT+IG+Art1DPLFfgwUGb/naey5bBX8ZjccqsZMWtS4P6ycFMuMbOku965u7UTYzIZeMUUL9MgjB0Okz9w4fvlkr/4=
X-Received: by 2002:a05:6102:836:b0:4af:456e:5427 with SMTP id
 ada2fe7eead31-4af555d7c00mr30536547137.4.1733320483835; Wed, 04 Dec 2024
 05:54:43 -0800 (PST)
MIME-Version: 1.0
References: <20241203141923.524658091@linuxfoundation.org>
In-Reply-To: <20241203141923.524658091@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 4 Dec 2024 19:24:32 +0530
Message-ID: <CA+G9fYtXS+Ze5Y8ddtOjZPiYP1NEDhArQhEJYfS3n5pcLdn9Hw@mail.gmail.com>
Subject: Re: [PATCH 4.19 000/138] 4.19.325-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
 akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
 patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
 jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
 srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
 broonie@kernel.org, Dan Carpenter <dan.carpenter@linaro.org>, 
 Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>, noralf@tronnes.org, 
 Sam Ravnborg <sam@ravnborg.org>, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 3 Dec 2024 at 20:04, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> ------------------
> Note, this is the LAST 4.19.y kernel to be released.  After this one, it
> is end-of-life.  It's been 6 years, everyone should have moved off of it
> by now.
> ------------------
>
> This is the start of the stable review cycle for the 4.19.325 release.
> There are 138 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 05 Dec 2024 14:18:57 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-=
4.19.325-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-4.19.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

Results from Linaro=E2=80=99s test farm.
Regressions on arm.

The arm builds failed with gcc-12 and clang-19 due to following
build warnings / errors.

Build log:
---------
drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c:177:9: error:
'DRM_GEM_CMA_DRIVER_OPS' undeclared here (not in a function)
  177 |         DRM_GEM_CMA_DRIVER_OPS,
      |         ^~~~~~~~~~~~~~~~~~~~~~
make[5]: *** [scripts/Makefile.build:303:
drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o] Error 1

Build link:
---------
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2piB6D5prhWVm3slY=
YXWoIGa8Rl/
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-4.19.y/build/v4=
.19.324-139-g1efbea5bef00/testrun/26176978/suite/build/test/gcc-12-defconfi=
g/log

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build
* kernel: 4.19.325-rc1
* git: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-=
rc.git
* git commit: 1efbea5bef007cc0efd372763792996843054d7c
* git describe: v4.19.324-139-g1efbea5bef00
* test details:
https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-4.19.y/build/v4.19=
.324-139-g1efbea5bef00

## Test Regressions (compared to v4.19.323-53-g3b4d1c2cc314)
* arm, build
  - clang-19-defconfig
  - clang-19-imx_v6_v7_defconfig
  - clang-19-omap2plus_defconfig
  - gcc-12-defconfig
  - gcc-12-imx_v6_v7_defconfig
  - gcc-12-lkftconfig
  - gcc-12-lkftconfig-debug
  - gcc-12-lkftconfig-kasan
  - gcc-12-lkftconfig-kunit
  - gcc-12-lkftconfig-libgpiod
  - gcc-12-lkftconfig-rcutorture
  - gcc-12-omap2plus_defconfig
  - gcc-8-defconfig
  - gcc-8-imx_v6_v7_defconfig
  - gcc-8-omap2plus_defconfig

## Metric Regressions (compared to v4.19.323-53-g3b4d1c2cc314)

## Test Fixes (compared to v4.19.323-53-g3b4d1c2cc314)

## Metric Fixes (compared to v4.19.323-53-g3b4d1c2cc314)

## Test result summary
total: 27904, pass: 22045, fail: 211, skip: 5623, xfail: 25

## Build Summary
* arc: 10 total, 10 passed, 0 failed
* arm: 101 total, 80 passed, 21 failed
* arm64: 26 total, 21 passed, 5 failed
* i386: 14 total, 11 passed, 3 failed
* mips: 20 total, 20 passed, 0 failed
* parisc: 3 total, 0 passed, 3 failed
* powerpc: 21 total, 21 passed, 0 failed
* s390: 6 total, 6 passed, 0 failed
* sh: 10 total, 10 passed, 0 failed
* sparc: 6 total, 6 passed, 0 failed
* x86_64: 22 total, 16 passed, 6 failed

## Test suites summary
* boot
* kunit
* libhugetlbfs
* log-parser-boot
* log-parser-test
* ltp-commands
* ltp-containers
* ltp-controllers
* ltp-cpuhotplug
* ltp-crypto
* ltp-cve
* ltp-dio
* ltp-fcntl-locktests
* ltp-fs
* ltp-fs_bind
* ltp-fs_perms_simple
* ltp-hugetlb
* ltp-ipc
* ltp-math
* ltp-mm
* ltp-nptl
* ltp-pty
* ltp-sched
* ltp-smoke
* ltp-syscalls
* ltp-tracing
* rcutorture

--
Linaro LKFT
https://lkft.linaro.org
