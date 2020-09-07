Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4378E25FC14
	for <lists+dri-devel@lfdr.de>; Mon,  7 Sep 2020 16:29:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 681846E47E;
	Mon,  7 Sep 2020 14:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com
 [IPv6:2607:f8b0:4864:20::1042])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79AA6E41A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Sep 2020 09:18:32 +0000 (UTC)
Received: by mail-pj1-x1042.google.com with SMTP id u3so2975287pjr.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Sep 2020 02:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=kpwNni5DZsL81VsUzOEF6fgBNL8irinRHr++pS6DIH4=;
 b=O0nVzEt0to+Hpt5DmVNSrpKsB5pOnDvRJ8682q1tjqS9v/Qx3Bmbmcd8+okOLCi3Ci
 FjWoetYIYjZznCRSXunkH7DUavf55Gq7vRf958XI9iG/HYsQIrNfJpNlhebrFk0nL8sn
 Zht4yGQs7+PF5kJyNUh2Fn+CjmW4Vpp8DIzMgswenMi9y9jHnEeEoBy6OnYMcDqxYgkb
 0rmPSbRH8mKBId82tj1AdNhjksNhIqlXe7b0dbwEFqxCNq1T4a04DRFhs5vXccFg99Bo
 L/DoH3fIdmoqbfxRybBFcOB09axnPvtjZ2ivlNSmNFMInppDv8rhq+A27pmtroCDe0vq
 SwDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=kpwNni5DZsL81VsUzOEF6fgBNL8irinRHr++pS6DIH4=;
 b=ceyptZT12R6NMbmH9IMg5RZp9evBaI5UXrOQh9HeAS26EL7Wk3VchWFLQtceKVCih2
 gVDR98E5Gtz45xTtoJV6Rk6u94/+XlAgVZ6vIXQyrFKf1yxzPltcKTxE1wHfFXNW3sMX
 ojhDr2Llje0SilrSHid1cVfrdFPXXFR8b6vIL7tTiTFEWc75UppeMCeVseURoZHBe2U7
 LZOzvzKsjSZA9mL9Ymye4Tekt0arhs89hwjceILlmXkp2toeGktKZJwi4cQ5vkZG10p8
 MF79CSNdWcLmLv+I8EY2CVRycCGQymgAqbYDRc7XQIz3qgVBPSJbST1ZX4GW7w/nthLB
 Aybg==
X-Gm-Message-State: AOAM531dWQKelbdtCrwWS2fD82pa4iVwAQumcIo6e/CnRpClGYOJOldB
 kKzNBKiOsFrgBoHwZmJbsBw=
X-Google-Smtp-Source: ABdhPJz8OyFdACQ/fUoHKevIftBWifFC0ICyCifnJiqsqaCt6U+OjFvMmXblon5SpVeKNm99E3VMxA==
X-Received: by 2002:a17:902:8bc7:: with SMTP id
 r7mr17695124plo.92.1599470312191; 
 Mon, 07 Sep 2020 02:18:32 -0700 (PDT)
Received: from gmail.com ([106.201.26.241])
 by smtp.gmail.com with ESMTPSA id h1sm5934980pji.52.2020.09.07.02.18.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Sep 2020 02:18:31 -0700 (PDT)
Date: Mon, 7 Sep 2020 14:46:21 +0530
From: Vaibhav Gupta <vaibhavgupta40@gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
 Bjorn Helgaas <bjorn@helgaas.com>,
 Vaibhav Gupta <vaibhav.varodek@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Thierry Reding <treding@nvidia.com>, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Shuah Khan <skhan@linuxfoundation.org>,
 linux-kernel-mentees@lists.linuxfoundation.org
Subject: Re: [PATCH v1 0/2] video: fbdev: radeonfb: PCI PM framework upgrade
 and fix-ups.
Message-ID: <20200907091621.GA30377@gmail.com>
References: <20200806072256.585705-1-vaibhavgupta40@gmail.com>
 <20200907075559.GN2352366@phenom.ffwll.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200907075559.GN2352366@phenom.ffwll.local>
X-Mailman-Approved-At: Mon, 07 Sep 2020 14:29:04 +0000
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Sep 07, 2020 at 09:55:59AM +0200, Daniel Vetter wrote:
> On Thu, Aug 06, 2020 at 12:52:54PM +0530, Vaibhav Gupta wrote:
> > Linux Kernel Mentee: Remove Legacy Power Management. 
> > 
> > The original goal of the patch series is to upgrade the power management
> > framework of radeonfb fbdev driver. This has been done by upgrading .suspend()
> > and .resume() callbacks.
> > 
> > The upgrade makes sure that the involvement of PCI Core does not change the
> > order of operations executed in a driver. Thus, does not change its behavior.
> > 
> > During this process, it was found that "#if defined(CONFIG_PM)" at line 1434 is
> > redundant. This was introduced in the commit
> > 42ddb453a0cd ("radeon: Conditionally compile PM code").
> 
> I do wonder whether it wouldn't be better to just outright delete these,
> we have the drm radeon driver for pretty much all the same hardware ...
> -Daniel
> 
Hello Daniel,
I don't have any problem in either way. My priority is to get rid of the
legacy .suspend and .resume pointers from "struct pci_driver" . Hence, modifying
every driver that is using them.

Vaibhav Gupta
> > 
> > ------------
> > 
> > Before 42ddb453a0cd:
> > $ git show 65122f7e80b5:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > 
> > Based on output in terminal:
> > 
> > 547:#ifdef CONFIG_PM
> >        |-- 959:#ifdef CONFIG_PPC_PMAC
> >        |-- 972:#endif
> >        |-- 1291:#ifdef CONFIG_PPC_OF
> >        |-- 1301:#endif /* CONFIG_PPC_OF */
> >        |-- 1943:#ifdef CONFIG_PPC_OF
> >                    |-- 2206:#if 0 /* Not ready yet */
> >                    |-- 2508:#endif /* 0 */
> >        |-- 2510:#endif /* CONFIG_PPC_OF */
> >        |-- 2648:#ifdef CONFIG_PPC_PMAC
> >        |-- 2654:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2768:#ifdef CONFIG_PPC_PMAC
> >        |-- 2774:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2791:#ifdef CONFIG_PPC_OF__disabled
> >        |-- 2801:#endif /* CONFIG_PPC_OF */
> > 2803:#endif /* CONFIG_PM */
> > 
> > ------------
> > 
> > After 42ddb453a0cd:
> > $ git show 42ddb453a0cd:drivers/video/aty/radeon_pm.c | grep -n "#ifdef\|#if\|#else\|#endif\|#elif\|#ifndef"
> > 
> > Based on output in terminal:
> > 
> > 547:#ifdef CONFIG_PM
> >        |-- 959:#ifdef CONFIG_PPC_PMAC
> >        |-- 972:#endif
> >        |-- 1291:#ifdef CONFIG_PPC_OF
> >        |-- 1301:#endif /* CONFIG_PPC_OF */
> >        |-- 1430:#if defined(CONFIG_PM)
> >                    |-- 1431:#if defined(CONFIG_X86) || defined(CONFIG_PPC_PMAC)
> >                    |-- 1944:#endif
> >                    |-- 1946:#ifdef CONFIG_PPC_OF
> >                                |-- 1947:#ifdef CONFIG_PPC_PMAC
> >                                |-- 2208:#endif
> >                    |-- 2209:#endif
> >                    |-- 2211:#if 0 /* Not ready yet */
> >                    |-- 2513:#endif /* 0 */
> >        |-- 2515:#endif /* CONFIG_PPC_OF */
> >        |-- 2653:#ifdef CONFIG_PPC_PMAC
> >        |-- 2659:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2773:#ifdef CONFIG_PPC_PMAC
> >        |-- 2779:#endif /* CONFIG_PPC_PMAC */
> >        |-- 2796:#ifdef CONFIG_PPC_OF__disabled
> >        |-- 2806:#endif /* CONFIG_PPC_OF */
> > 2808:#endif /* CONFIG_PM */
> > 
> > ------------
> > 
> > This also affected the CONFIG_PPC_OF container (line 1943 at commit 65122f7e80b5)
> > 
> > The patch-series fixes it along with PM upgrade.
> > 
> > All patches are compile-tested only.
> > 
> > Test tools:
> >     - Compiler: gcc (GCC) 10.1.0
> >     - allmodconfig build: make -j$(nproc) W=1 all
> > 
> > Vaibhav Gupta (2):
> >   video: fbdev: aty: radeon_pm: remove redundant CONFIG_PM container
> >   fbdev: radeonfb:use generic power management
> > 
> >  drivers/video/fbdev/aty/radeon_base.c | 10 ++++---
> >  drivers/video/fbdev/aty/radeon_pm.c   | 38 ++++++++++++++++++++-------
> >  drivers/video/fbdev/aty/radeonfb.h    |  3 +--
> >  3 files changed, 35 insertions(+), 16 deletions(-)
> > 
> > -- 
> > 2.27.0
> > 
> > _______________________________________________
> > dri-devel mailing list
> > dri-devel@lists.freedesktop.org
> > https://lists.freedesktop.org/mailman/listinfo/dri-devel
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
