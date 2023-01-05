Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B9765EAD3
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 13:40:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3A6C10E70E;
	Thu,  5 Jan 2023 12:40:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B4FA10E709
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 12:40:26 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 ay2-20020a05600c1e0200b003d22e3e796dso1216826wmb.0
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 04:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=u72AB24+qa4e+mmlqHTng43rKK5tJgT0XJ4X1hFnOZY=;
 b=PQxfCtFMvTLRPftYbZmPlE8qhfBja8J3rxwqwsvaMY6MYMkhXLA8MdRbStUcxPiSfx
 aOn87eQmEvxv9cfm0z5Og6/KFKLOgXJUK64eWvMnzoQgQH0AUsefRfMqKrz5uzGBZ3pM
 4Rw8y2KgDs9h5GqjY0vXK866VcaannZlZS7Ak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=u72AB24+qa4e+mmlqHTng43rKK5tJgT0XJ4X1hFnOZY=;
 b=7SlVuU6AENRXtN1qGy+VPdI1cNrOLIDpVF47cp8JLaqTtQrx8vyz17pZZqxDubq8mh
 ++6XbAimb/3Td8rIQSCjA2w3zu62U8VaSoiG1TJsy+7uHGJP8bcAZoJ2gw3ZTUqgyDUf
 j0qczjMLMhXd2MKEHENEJbLPBHEaYShJpd0GxaWNmM4SDz5AjI2A24QITTq3f14yePj0
 IMo4XzXr+u4zLRaGX0lcmQQIWe++93UJ8RYphyCD7e7ptkCgRsYbH4LF82idESH61T5Z
 37V7krCRrauQ9YeaPZILbq2OWQd0QbtSL66/ffxX0nu4+ithY4+OHyZumGbawxBAW9DH
 KdnQ==
X-Gm-Message-State: AFqh2kqHACAxsL06pxpXzSFwAxKOHpibtvA47x/vhO2OhLClLtsqtjfj
 ReBPZ89qQd43MArF/bLd4924eBQ9jxLLziGg
X-Google-Smtp-Source: AMrXdXsu5VxnTPAKKJBYcokTLsPEF/4yGSQsqnxh/kx+LZL+INiQeTim0IqPUr5XsEi9jpjChc526A==
X-Received: by 2002:a05:600c:3d91:b0:3d9:103d:9078 with SMTP id
 bi17-20020a05600c3d9100b003d9103d9078mr35017703wmb.22.1672922425144; 
 Thu, 05 Jan 2023 04:40:25 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 l10-20020a05600c1d0a00b003d9862ec435sm2466122wms.20.2023.01.05.04.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 04:40:24 -0800 (PST)
Date: Thu, 5 Jan 2023 13:40:21 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Cai Huoqing <cai.huoqing@linux.dev>
Subject: Re: [RESEND PATCH linux-next v2 00/10] drm: Remove some obsolete
 drivers(tdfx, mga, i810, savage, r128, sis, via)
Message-ID: <Y7bFNQ5a+qAcxWj+@phenom.ffwll.local>
Mail-Followup-To: Cai Huoqing <cai.huoqing@linux.dev>, tzimmermann@suse.de,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Borislav Petkov <bp@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Danilo Krummrich <dakr@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221203102502.3185-1-cai.huoqing@linux.dev>
 <20221208124207.GA7628@chq-T47>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221208124207.GA7628@chq-T47>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: tzimmermann@suse.de, Sam Ravnborg <sam@ravnborg.org>,
 Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>, dri-devel@lists.freedesktop.org,
 Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 08, 2022 at 08:42:07PM +0800, Cai Huoqing wrote:
> On 03 12月 22 18:22:51, Cai Huoqing wrote:
> > Commit 399516ab0fee ("MAINTAINERS: Add a bunch of legacy (UMS) DRM drivers")
> > marked these drivers obsolete 7 years ago.
> > And the mesa UMD of these drm drivers already in deprecated list
> > in the link: https://docs.mesa3d.org/systems.html
> > 
> > 3dfx Glide-->driver/gpu/drm/tdfx
> > Matrox-->driver/gpu/drm/mga
> > Intel i810-->driver/gpu/drm/i810
> > S3 Savage-->drivers/gpu/drm/savage
> > ATI Rage 128->drivers/gpu/drm/r128
> > Silicon Integrated Systems->drivers/gpu/drm/sis
> > VIA Unichrome->drivers/gpu/drm/via
> > 
> > v1->v2:
> > 1.Add drm via driver to the patchset.
> > 2.Remove related drm_pciids.
> > 3.Remove related drm uapi header files.
> > 4.split to series avoid large patch email.
> Just ping these patch series.
> The v1 comments here,
> https://lore.kernel.org/lkml/39d8ac1a-d92f-7cdc-14cd-944342f78c1a@suse.de/

Are we really sure that all users of these are gone? Also, I'm not really
seeing the benefit of this, we've managed to split out the legacy code
quite well, so carrying around isn't hurting anything afaics?
-Daniel

> 
> Thanks,
> Cai
> > 
> > Cai Huoqing (10):
> >   drm: Remove the obsolete driver-i810
> >   drm: Remove the obsolete driver-mga
> >   drm: Remove the obsolete driver-r128
> >   drm: Remove the obsolete driver-savage
> >   drm: Remove the obsolete driver-sis
> >   drm: Remove the obsolete driver-tdfx
> >   drm: Remove the obsolete driver-via
> >   drm: Add comments to Kconfig
> >   drm: Remove some obsolete drm pciids(tdfx, mga, i810, savage, r128,
> >     sis, via)
> >   MAINTAINERS: Remove some obsolete drivers info(tdfx, mga, i810,
> >     savage, r128, sis)
> > 
> >  MAINTAINERS                           |   29 -
> >  drivers/gpu/drm/Kconfig               |   59 +-
> >  drivers/gpu/drm/Makefile              |    7 -
> >  drivers/gpu/drm/i810/Makefile         |    8 -
> >  drivers/gpu/drm/i810/i810_dma.c       | 1266 ---------
> >  drivers/gpu/drm/i810/i810_drv.c       |  101 -
> >  drivers/gpu/drm/i810/i810_drv.h       |  246 --
> >  drivers/gpu/drm/mga/Makefile          |   11 -
> >  drivers/gpu/drm/mga/mga_dma.c         | 1168 --------
> >  drivers/gpu/drm/mga/mga_drv.c         |  104 -
> >  drivers/gpu/drm/mga/mga_drv.h         |  685 -----
> >  drivers/gpu/drm/mga/mga_ioc32.c       |  197 --
> >  drivers/gpu/drm/mga/mga_irq.c         |  169 --
> >  drivers/gpu/drm/mga/mga_state.c       | 1099 --------
> >  drivers/gpu/drm/mga/mga_warp.c        |  167 --
> >  drivers/gpu/drm/r128/Makefile         |   10 -
> >  drivers/gpu/drm/r128/ati_pcigart.c    |  228 --
> >  drivers/gpu/drm/r128/ati_pcigart.h    |   31 -
> >  drivers/gpu/drm/r128/r128_cce.c       |  944 -------
> >  drivers/gpu/drm/r128/r128_drv.c       |  116 -
> >  drivers/gpu/drm/r128/r128_drv.h       |  544 ----
> >  drivers/gpu/drm/r128/r128_ioc32.c     |  199 --
> >  drivers/gpu/drm/r128/r128_irq.c       |  118 -
> >  drivers/gpu/drm/r128/r128_state.c     | 1641 -----------
> >  drivers/gpu/drm/savage/Makefile       |    9 -
> >  drivers/gpu/drm/savage/savage_bci.c   | 1082 --------
> >  drivers/gpu/drm/savage/savage_drv.c   |   91 -
> >  drivers/gpu/drm/savage/savage_drv.h   |  580 ----
> >  drivers/gpu/drm/savage/savage_state.c | 1169 --------
> >  drivers/gpu/drm/sis/Makefile          |   10 -
> >  drivers/gpu/drm/sis/sis_drv.c         |  143 -
> >  drivers/gpu/drm/sis/sis_drv.h         |   80 -
> >  drivers/gpu/drm/sis/sis_mm.c          |  363 ---
> >  drivers/gpu/drm/tdfx/Makefile         |    8 -
> >  drivers/gpu/drm/tdfx/tdfx_drv.c       |   90 -
> >  drivers/gpu/drm/tdfx/tdfx_drv.h       |   47 -
> >  drivers/gpu/drm/via/Makefile          |    8 -
> >  drivers/gpu/drm/via/via_3d_reg.h      | 1771 ------------
> >  drivers/gpu/drm/via/via_dri1.c        | 3630 -------------------------
> >  include/drm/drm_pciids.h              |  112 -
> >  include/uapi/drm/i810_drm.h           |  292 --
> >  include/uapi/drm/mga_drm.h            |  429 ---
> >  include/uapi/drm/r128_drm.h           |  336 ---
> >  include/uapi/drm/savage_drm.h         |  220 --
> >  include/uapi/drm/sis_drm.h            |   77 -
> >  include/uapi/drm/via_drm.h            |  282 --
> >  46 files changed, 1 insertion(+), 19975 deletions(-)
> >  delete mode 100644 drivers/gpu/drm/i810/Makefile
> >  delete mode 100644 drivers/gpu/drm/i810/i810_dma.c
> >  delete mode 100644 drivers/gpu/drm/i810/i810_drv.c
> >  delete mode 100644 drivers/gpu/drm/i810/i810_drv.h
> >  delete mode 100644 drivers/gpu/drm/mga/Makefile
> >  delete mode 100644 drivers/gpu/drm/mga/mga_dma.c
> >  delete mode 100644 drivers/gpu/drm/mga/mga_drv.c
> >  delete mode 100644 drivers/gpu/drm/mga/mga_drv.h
> >  delete mode 100644 drivers/gpu/drm/mga/mga_ioc32.c
> >  delete mode 100644 drivers/gpu/drm/mga/mga_irq.c
> >  delete mode 100644 drivers/gpu/drm/mga/mga_state.c
> >  delete mode 100644 drivers/gpu/drm/mga/mga_warp.c
> >  delete mode 100644 drivers/gpu/drm/r128/Makefile
> >  delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.c
> >  delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.h
> >  delete mode 100644 drivers/gpu/drm/r128/r128_cce.c
> >  delete mode 100644 drivers/gpu/drm/r128/r128_drv.c
> >  delete mode 100644 drivers/gpu/drm/r128/r128_drv.h
> >  delete mode 100644 drivers/gpu/drm/r128/r128_ioc32.c
> >  delete mode 100644 drivers/gpu/drm/r128/r128_irq.c
> >  delete mode 100644 drivers/gpu/drm/r128/r128_state.c
> >  delete mode 100644 drivers/gpu/drm/savage/Makefile
> >  delete mode 100644 drivers/gpu/drm/savage/savage_bci.c
> >  delete mode 100644 drivers/gpu/drm/savage/savage_drv.c
> >  delete mode 100644 drivers/gpu/drm/savage/savage_drv.h
> >  delete mode 100644 drivers/gpu/drm/savage/savage_state.c
> >  delete mode 100644 drivers/gpu/drm/sis/Makefile
> >  delete mode 100644 drivers/gpu/drm/sis/sis_drv.c
> >  delete mode 100644 drivers/gpu/drm/sis/sis_drv.h
> >  delete mode 100644 drivers/gpu/drm/sis/sis_mm.c
> >  delete mode 100644 drivers/gpu/drm/tdfx/Makefile
> >  delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.c
> >  delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.h
> >  delete mode 100644 drivers/gpu/drm/via/Makefile
> >  delete mode 100644 drivers/gpu/drm/via/via_3d_reg.h
> >  delete mode 100644 drivers/gpu/drm/via/via_dri1.c
> >  delete mode 100644 include/uapi/drm/i810_drm.h
> >  delete mode 100644 include/uapi/drm/mga_drm.h
> >  delete mode 100644 include/uapi/drm/r128_drm.h
> >  delete mode 100644 include/uapi/drm/savage_drm.h
> >  delete mode 100644 include/uapi/drm/sis_drm.h
> >  delete mode 100644 include/uapi/drm/via_drm.h
> > 
> > -- 
> > 2.25.1
> > 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
