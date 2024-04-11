Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABD98A1704
	for <lists+dri-devel@lfdr.de>; Thu, 11 Apr 2024 16:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60D3110F102;
	Thu, 11 Apr 2024 14:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gg1oy/LN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com
 [209.85.222.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0BB610F102
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 14:21:10 +0000 (UTC)
Received: by mail-ua1-f46.google.com with SMTP id
 a1e0cc1a2514c-7e3b3e33ae3so2458672241.0
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Apr 2024 07:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712845269; x=1713450069; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=zNDwMXzZA9w/Ig5nKNfRn6E1/CKh9mEe7H9+Vh2hNJk=;
 b=gg1oy/LNC9QSikHaQDWzoZnDfO1KM3W7nRcJn7c/C50boU9mW+f6NZS7pt/1+u9qz8
 9puDJaA4HSRhf6OazF11D9OsO9G0RTJh0Z/qWFz948ZATofiV9jjKY4W/ogrkYPAqTf6
 bCp61I7EeuG/FcH7bO7SEUd25gxNaw9/lXIE+yqCLsmuhgQARA5w4ugZMPTrVb5TkvQo
 8QZJbVX/8ajqQSr5T+nB9b/4Zp7zriR+2i/EwT2ogX1Ix5k0/3ztrCuxbqxUi8mGxvsc
 JnQYBAyn4kP+DTkRbtC0hlcHv+OBZ5AzZLE2AfXduqL7xVZZ4DBPxM7nk25ljcEkkl7Y
 F+Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712845269; x=1713450069;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zNDwMXzZA9w/Ig5nKNfRn6E1/CKh9mEe7H9+Vh2hNJk=;
 b=OcpLVar1GDRv56GWA/4ijtAA9qQ9wHuHqAF8VK5xQt7+J8xfS7aw7RTy3Q3Vi3bO4u
 k6ukHQQpHc41rn1TjRJLHNjCr/jRSlL6vbGAK3Q7RXKx2QvAZsuHK0z2wNGAPaUJ3qkc
 npHdAJHdjDX3NXjdTd0OlmOuh84zRrbkdaxt3EtcPYS8b7YLMvOHlen/LFGw8RGVPdvQ
 iao+1FFRB8rP1VPZ0FJxK5W9OMF9GX4uDPPe5FhhnZkG6TsddoRYH0yKDpWjeyfJt3CB
 wXAbU5DsN7AO2maZmdhW+eaYsXh+i+n6KOMgcpmRG7C5Q+tqpOQVZxjriwmz1eAGT6iK
 V/og==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnPIoNRiXzBk+R2HF9k30IJgbJQnLJ1EnzwLhsBRjjvins7DbsigPYMcL/EjZ63lIzHD29B0lF2wAiUIXPtNAlVlSFcQFxcidlhfbmaE+G
X-Gm-Message-State: AOJu0YyJhrSLR2vLOu1JK28wcIeoMmsE/5MRAy+v4lVtzXSEjV8CmZwr
 mHFKHfiNYR5yyc+62D1PGGhxDod23hksRSNnZ9o6nuI1AAniDoW8NIWxwUFZkQtxBveMNKITLBM
 iYSyckeGqw/3zj3rESKYsZmPHMOU3p2L6SD+Erg==
X-Google-Smtp-Source: AGHT+IF8/NngFSDZwNmkAlmPTYphRoq7xTTCiaK3Q+0SqL/mTmu76XOg2HqetJzuAV/Spk74WCqBY17Kl/UR4GPRGL0=
X-Received: by 2002:a05:6122:4d04:b0:4d3:34b1:7211 with SMTP id
 fi4-20020a0561224d0400b004d334b17211mr6042749vkb.3.1712845269210; Thu, 11 Apr
 2024 07:21:09 -0700 (PDT)
MIME-Version: 1.0
References: <20240411095419.532012976@linuxfoundation.org>
In-Reply-To: <20240411095419.532012976@linuxfoundation.org>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 11 Apr 2024 19:50:57 +0530
Message-ID: <CA+G9fYuwCn0D6jzrn0dBKsa+X0zUBUMiuRqcYvc-qkKToXK5dA@mail.gmail.com>
Subject: Re: [PATCH 4.19 000/175] 4.19.312-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
 akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
 patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
 jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
 srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, allen.lkml@gmail.com, 
 broonie@kernel.org, imx@lists.linux.dev, dri-devel@lists.freedesktop.org
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

On Thu, 11 Apr 2024 at 15:30, Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 4.19.312 release.
> There are 175 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 13 Apr 2024 09:53:55 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.312-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h


The arm imx_v6_v7_defconfig build failed with gcc-12 and clang on Linux
stable-rc linux-4.19.y.

Regressions:
 - arm
    * gcc-12-imx_v6_v7_defconfig - failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

Build log:
----
drivers/gpu/drm/imx/parallel-display.c: In function
'imx_pd_bridge_atomic_check':
drivers/gpu/drm/imx/parallel-display.c:222:23: error: implicit
declaration of function 'drm_bridge_get_next_bridge'
[-Werror=implicit-function-declaration]
  222 |         next_bridge = drm_bridge_get_next_bridge(bridge);
      |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~


Links:
 - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-4.19.y/build/v4.19.311-176-gf0cf5f6110a7/testrun/23411280/suite/build/test/gcc-12-imx_v6_v7_defconfig/details/
 - https://storage.tuxsuite.com/public/linaro/lkft/builds/2ex1v6eevudbi33g4ozA7hJ4fvs/

--
Linaro LKFT
https://lkft.linaro.org
