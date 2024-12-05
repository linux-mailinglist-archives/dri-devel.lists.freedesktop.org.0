Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51FC99E516E
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 10:33:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 336B810E14B;
	Thu,  5 Dec 2024 09:33:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="XgjEUBZ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E446610E14B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 09:33:24 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 9A7FF5C724E;
 Thu,  5 Dec 2024 09:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A00F5C4CED1;
 Thu,  5 Dec 2024 09:33:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1733391203;
 bh=2Co+qpnjhsB51FwPGiIQaOPSEEkXuCq6KFXs2VtbA1A=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XgjEUBZ5S/eYxAgzoqIJ+gsVvFqDWpBpSxzwW37pyjEO7UEydOvSgcKQx29DePIKZ
 3nEaa95Lw7M12DO3Zcf4Thp2Ksq8AxXFvAqlKBfPsRrs0j/efxHAPhIR4+p9WqGDE6
 brE8QFzdYP7PvDzM/RF1Qobl/E/wG5+xMMMXc3vs=
Date: Thu, 5 Dec 2024 10:33:20 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev,
 linux-kernel@vger.kernel.org, torvalds@linux-foundation.org,
 akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org,
 patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de,
 jonathanh@nvidia.com, f.fainelli@gmail.com,
 sudipm.mukherjee@gmail.com, srw@sladewatkins.net, rwarsow@gmx.de,
 conor@kernel.org, hargar@microsoft.com, broonie@kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>,
 Matthias Schiffer <matthias.schiffer@tq-group.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, noralf@tronnes.org,
 Sam Ravnborg <sam@ravnborg.org>, simona@ffwll.ch,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 4.19 000/138] 4.19.325-rc1 review
Message-ID: <2024120512-chest-wanting-7a7d@gregkh>
References: <20241203141923.524658091@linuxfoundation.org>
 <CA+G9fYtXS+Ze5Y8ddtOjZPiYP1NEDhArQhEJYfS3n5pcLdn9Hw@mail.gmail.com>
 <CA+G9fYuDAAZkgNK4_0Y=wDcTUzs7=ggbni4iJDAPbD9ocq992g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+G9fYuDAAZkgNK4_0Y=wDcTUzs7=ggbni4iJDAPbD9ocq992g@mail.gmail.com>
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

On Wed, Dec 04, 2024 at 09:02:47PM +0530, Naresh Kamboju wrote:
> On Wed, 4 Dec 2024 at 19:24, Naresh Kamboju <naresh.kamboju@linaro.org> wrote:
> >
> > On Tue, 3 Dec 2024 at 20:04, Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > ------------------
> > > Note, this is the LAST 4.19.y kernel to be released.  After this one, it
> > > is end-of-life.  It's been 6 years, everyone should have moved off of it
> > > by now.
> > > ------------------
> > >
> > > This is the start of the stable review cycle for the 4.19.325 release.
> > > There are 138 patches in this series, all will be posted as a response
> > > to this one.  If anyone has any issues with these being applied, please
> > > let me know.
> > >
> > > Responses should be made by Thu, 05 Dec 2024 14:18:57 +0000.
> > > Anything received after that time might be too late.
> > >
> > > The whole patch series can be found in one patch at:
> > >         https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patch-4.19.325-rc1.gz
> > > or in the git tree and branch at:
> > >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-4.19.y
> > > and the diffstat can be found below.
> > >
> > > thanks,
> > >
> > > greg k-h
> >
> > Results from Linaro’s test farm.
> > Regressions on arm.
> >
> > The arm builds failed with gcc-12 and clang-19 due to following
> > build warnings / errors.
> >
> > Build log:
> > ---------
> > drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c:177:9: error:
> > 'DRM_GEM_CMA_DRIVER_OPS' undeclared here (not in a function)
> >   177 |         DRM_GEM_CMA_DRIVER_OPS,
> >       |         ^~~~~~~~~~~~~~~~~~~~~~
> > make[5]: *** [scripts/Makefile.build:303:
> > drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o] Error 1
> >
> 
> Anders bisected this down to,
> 
> # first bad commit:
>    [5a8529fd9205b37df58a4fd756498407d956b385]
>    drm/fsl-dcu: Use GEM CMA object functions

Thanks, now dropped.

greg k-h
