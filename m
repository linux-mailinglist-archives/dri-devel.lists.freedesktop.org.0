Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D17A99E3E5E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Dec 2024 16:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF8E610E4CE;
	Wed,  4 Dec 2024 15:33:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KO0W2LUU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com
 [209.85.221.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BAF8E10E4CE
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Dec 2024 15:33:01 +0000 (UTC)
Received: by mail-vk1-f170.google.com with SMTP id
 71dfb90a1353d-5154fab9889so1724319e0c.0
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Dec 2024 07:33:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733326380; x=1733931180; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4BM7g2tnTxffenD3gAnjnDpzGPqkZZJws6+BF+fZajU=;
 b=KO0W2LUU8mesdovEFoYSJhkhUpoXBkZR6wwJ/bnXA2Sl1JPXGOWrgBuQKTyffloJSS
 lqgMG1iSyvTvZA6G6RtekROYaWSBss3jUT2hTBEOiqKVhPpq5HYHch5oCe2LkXxCSccp
 j8vFri7u+j0KE2t0LWJA8zBFQODWBLUOKDb+WdQedpRfzW4aj3TyDpOkR5d0SLJWuVBC
 fKoL99dpEguOiGwji3bWarHGpvusjBR1wSybW8AxLyQPzDlnSGJA6uuR07z3xS/hus2o
 yECeINDqqvvDYc9EvciuFY9E2TrnD2xRZuosCdnJDghxDWx1lU9CGHAhqS7JkNGyPkd0
 gvqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733326380; x=1733931180;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4BM7g2tnTxffenD3gAnjnDpzGPqkZZJws6+BF+fZajU=;
 b=wakFWa2q/R0u5xqGid1MgPWZ2lQKFprLGhkYm01W4PfiWeFq1VR10Xb1HdII3efO4e
 SggiZYGvZCz5r9IeM3/Isoj9/Ebq3E91ZSogWLRhXOdfcI49CuNPluSivLRj1JfwOgFl
 Jtu+6dqKRiTtnO1GT48Dp/Bb1h+ZM5WIewTu9Q3wIaP80fRxcg544SYKTov/L6tUAynR
 BHHU7lHcp9z+ptvG7fSce3oEl3WF3IgaHVp0ItyewPDT+672T0viy4qIyDdGzIYW86QK
 IWfcfY8UuVX4Ksyg+TmBR8o896Qhf+XuWyEHscBhCghMkCEk2UE/T0qkYqLbipkaRkok
 ZUNQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRcItt1/3BvOH9aw1QToUkkPIOzB/JS7MPdy2b1QnalsYIBkGznu8zFjhyT97FhIiiMRpryX3RWp4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpJ1Z7TYzRtlAAoBYQcyeR/n4RKvlULcAS7ese7NbH/iuj3dny
 FvGZ3R5n92BY+sqcvw/QLpz/D4jEm7F/JLtEyqzonJ9C37ikvq/4KDHXy8fkb8kHgcmD4qyn6mx
 JTpGX76P8lroFLJFOWa96KHHqhzXA3cfTHS5zFg==
X-Gm-Gg: ASbGncvN4MpGUYaBUEKHw0P9xxBBkkzbj3Iiksmiey2FgjHhVaRsP8jcJWelw+1q/Mz
 IrM3iSnat8eQc6Me/gUFZsozDb5RNzLs5
X-Google-Smtp-Source: AGHT+IF0RVZVCMdJkXYjBAAcJHezPOoWCH4jS8XQLyQLEPZuJ7e6SomQNYsR4Mx3bJ489e5yJU/yOjgwrrV33kHvO74=
X-Received: by 2002:a05:6122:1d04:b0:515:c769:9d33 with SMTP id
 71dfb90a1353d-515cf784e53mr6510755e0c.9.1733326380385; Wed, 04 Dec 2024
 07:33:00 -0800 (PST)
MIME-Version: 1.0
References: <20241203141923.524658091@linuxfoundation.org>
 <CA+G9fYtXS+Ze5Y8ddtOjZPiYP1NEDhArQhEJYfS3n5pcLdn9Hw@mail.gmail.com>
In-Reply-To: <CA+G9fYtXS+Ze5Y8ddtOjZPiYP1NEDhArQhEJYfS3n5pcLdn9Hw@mail.gmail.com>
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 4 Dec 2024 21:02:47 +0530
Message-ID: <CA+G9fYuDAAZkgNK4_0Y=wDcTUzs7=ggbni4iJDAPbD9ocq992g@mail.gmail.com>
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

On Wed, 4 Dec 2024 at 19:24, Naresh Kamboju <naresh.kamboju@linaro.org> wro=
te:
>
> On Tue, 3 Dec 2024 at 20:04, Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > ------------------
> > Note, this is the LAST 4.19.y kernel to be released.  After this one, i=
t
> > is end-of-life.  It's been 6 years, everyone should have moved off of i=
t
> > by now.
> > ------------------
> >
> > This is the start of the stable review cycle for the 4.19.325 release.
> > There are 138 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Thu, 05 Dec 2024 14:18:57 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >         https://www.kernel.org/pub/linux/kernel/v4.x/stable-review/patc=
h-4.19.325-rc1.gz
> > or in the git tree and branch at:
> >         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git linux-4.19.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>
> Results from Linaro=E2=80=99s test farm.
> Regressions on arm.
>
> The arm builds failed with gcc-12 and clang-19 due to following
> build warnings / errors.
>
> Build log:
> ---------
> drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c:177:9: error:
> 'DRM_GEM_CMA_DRIVER_OPS' undeclared here (not in a function)
>   177 |         DRM_GEM_CMA_DRIVER_OPS,
>       |         ^~~~~~~~~~~~~~~~~~~~~~
> make[5]: *** [scripts/Makefile.build:303:
> drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.o] Error 1
>

Anders bisected this down to,

# first bad commit:
   [5a8529fd9205b37df58a4fd756498407d956b385]
   drm/fsl-dcu: Use GEM CMA object functions

- Naresh
