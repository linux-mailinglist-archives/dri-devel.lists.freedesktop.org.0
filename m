Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C22B8A2955
	for <lists+dri-devel@lfdr.de>; Fri, 12 Apr 2024 10:29:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2821710F3CD;
	Fri, 12 Apr 2024 08:29:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZJZU03Kh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BD910F3CD
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Apr 2024 08:29:53 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id F0849CE028A;
 Fri, 12 Apr 2024 08:29:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EA3C113CC;
 Fri, 12 Apr 2024 08:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1712910590;
 bh=yNUCTY3R96uKh6sdpi2i9suu0OKXHjTflNqHMb3g/Zw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ZJZU03Khdu2WdxWk9+7wNcvmgMETU1OMUS2cQ7EKe2zNGS1IZnCskHzuBG7e2Zowj
 1fTxSOA9v625MMNkgcQxWLNFl5t6/QWyjTEe0q7btzvTJ7V5orC7we2UYWN2T38Yd5
 Kabaa965su4ebVWb03h4WHpzo48YTdmWFA5LUPUg=
Date: Fri, 12 Apr 2024 10:29:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
 akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
 patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
 jonathanh@nvidia.com, f.fainelli@gmail.com,
 sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
 conor@kernel.org, allen.lkml@gmail.com, broonie@kernel.org,
 imx@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4.19 000/175] 4.19.312-rc1 review
Message-ID: <2024041240-drastic-crayon-e9d6@gregkh>
References: <20240411095419.532012976@linuxfoundation.org>
 <CA+G9fYuwCn0D6jzrn0dBKsa+X0zUBUMiuRqcYvc-qkKToXK5dA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+G9fYuwCn0D6jzrn0dBKsa+X0zUBUMiuRqcYvc-qkKToXK5dA@mail.gmail.com>
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

On Thu, Apr 11, 2024 at 07:50:57PM +0530, Naresh Kamboju wrote:
> On Thu, 11 Apr 2024 at 15:30, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > This is the start of the stable review cycle for the 4.19.312 release.
> > There are 175 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Sat, 13 Apr 2024 09:53:55 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.312-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
> 
> 
> The arm imx_v6_v7_defconfig build failed with gcc-12 and clang on Linux
> stable-rc linux-4.19.y.
> 
> Regressions:
>  - arm
>     * gcc-12-imx_v6_v7_defconfig - failed
> 
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> Build log:
> ----
> drivers/gpu/drm/imx/parallel-display.c: In function
> 'imx_pd_bridge_atomic_check':
> drivers/gpu/drm/imx/parallel-display.c:222:23: error: implicit
> declaration of function 'drm_bridge_get_next_bridge'
> [-Werror=implicit-function-declaration]
>   222 |         next_bridge = drm_bridge_get_next_bridge(bridge);
>       |                       ^~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> 
> Links:
>  - https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-4.19.y/build/v4.19.311-176-gf0cf5f6110a7/testrun/23411280/suite/build/test/gcc-12-imx_v6_v7_defconfig/details/
>  - https://storage.tuxsuite.com/public/linaro/lkft/builds/2ex1v6eevudbi33g4ozA7hJ4fvs/

Offending commit now dropped, thanks!

greg k-h
