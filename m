Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7E6F666E85
	for <lists+dri-devel@lfdr.de>; Thu, 12 Jan 2023 10:44:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD28410E8BB;
	Thu, 12 Jan 2023 09:44:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4468510E8BB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 09:44:10 +0000 (UTC)
Received: by mail-ej1-x62b.google.com with SMTP id cf18so36990527ejb.5
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Jan 2023 01:44:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=3Oa5slRNBNNIqMVWPb21PTixUg0CS9e53tBflIIJxqM=;
 b=Z2l1L873yghsz5/eXnO7c1aI5LQBJRwUvPxhDN79sf2LupNS8aeUvpZCALFf8TIbjm
 2ROZeqvOl0YIyPMOx0YJOfED7Advsc80lP4gUJEuWg3PvP2Q7Xz2px5CH2XQgKUzr+jK
 OeRQ7K1Q6T/Z+uXhqUrRrcKsLMBq2wbWEiZsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3Oa5slRNBNNIqMVWPb21PTixUg0CS9e53tBflIIJxqM=;
 b=po80iUvst1eUy8sb3DAsw2tvShN5BEdbRDlFq5BdUEfSz9wD3OIQS/lDyKIYfCG9Ou
 62sFvk5eabWKHr3QU32NAwxfwlMGFJ06Vq1THFYX1YUPSY2KekgJ6XprTM6z/Wt9KS4Q
 WcQaHgg85ZtDShAJUtR/2BlwheE1cuHCkiuDKXAQFVe9i0WoItVjzbgKq4+YOLpPIeE0
 PtJ8f4lwq5oPi/B976z2HzNR+KRwdKr4nNOSwzu3sJd837ivhE/pf2LwxuKsgKT3gp5c
 04Y/0U588dgGwY5xiMfoFUoF1UEzopqNhIJ/lCdfD5S1EveHAQB6OTcRQhi+7QURop4T
 dnzQ==
X-Gm-Message-State: AFqh2kqWLs0okh2rrMyvePYb3UU/RxO6+yWG0gDWl/cPkiZDAHd6TiXi
 1jlkPBw6T2RPQo0yV8kxLFS+jw==
X-Google-Smtp-Source: AMrXdXtahSlcUV3YLcD8ZfB9I2NIcENT0/1vLmKd1QcVDlZ5lGrzjtBySQG1J+xhOiz2muS5ihmH/Q==
X-Received: by 2002:a17:906:7fc3:b0:7c1:10b8:e6a4 with SMTP id
 r3-20020a1709067fc300b007c110b8e6a4mr60890823ejs.19.1673516648682; 
 Thu, 12 Jan 2023 01:44:08 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 ky24-20020a170907779800b007c09a304eb5sm7149300ejc.201.2023.01.12.01.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Jan 2023 01:44:07 -0800 (PST)
Date: Thu, 12 Jan 2023 10:44:05 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [RESEND PATCH linux-next v2 00/10] drm: Remove some obsolete
 drivers(tdfx, mga, i810, savage, r128, sis, via)
Message-ID: <Y7/WZezKsjax7isu@phenom.ffwll.local>
Mail-Followup-To: Thomas Zimmermann <tzimmermann@suse.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Borislav Petkov <bp@suse.de>,
 Randy Dunlap <rdunlap@infradead.org>,
 Danilo Krummrich <dakr@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
References: <20221203102502.3185-1-cai.huoqing@linux.dev>
 <20221208124207.GA7628@chq-T47>
 <Y7bFNQ5a+qAcxWj+@phenom.ffwll.local>
 <d5d44da7-2ca9-d26d-7474-223abb8f6aa3@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d5d44da7-2ca9-d26d-7474-223abb8f6aa3@suse.de>
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
Cc: Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-kernel@vger.kernel.org, Cai Huoqing <cai.huoqing@linux.dev>,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@redhat.com>,
 Borislav Petkov <bp@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 02:01:50PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.01.23 um 13:40 schrieb Daniel Vetter:
> > On Thu, Dec 08, 2022 at 08:42:07PM +0800, Cai Huoqing wrote:
> > > On 03 12月 22 18:22:51, Cai Huoqing wrote:
> > > > Commit 399516ab0fee ("MAINTAINERS: Add a bunch of legacy (UMS) DRM drivers")
> > > > marked these drivers obsolete 7 years ago.
> > > > And the mesa UMD of these drm drivers already in deprecated list
> > > > in the link: https://docs.mesa3d.org/systems.html
> > > > 
> > > > 3dfx Glide-->driver/gpu/drm/tdfx
> > > > Matrox-->driver/gpu/drm/mga
> > > > Intel i810-->driver/gpu/drm/i810
> > > > S3 Savage-->drivers/gpu/drm/savage
> > > > ATI Rage 128->drivers/gpu/drm/r128
> > > > Silicon Integrated Systems->drivers/gpu/drm/sis
> > > > VIA Unichrome->drivers/gpu/drm/via
> > > > 
> > > > v1->v2:
> > > > 1.Add drm via driver to the patchset.
> > > > 2.Remove related drm_pciids.
> > > > 3.Remove related drm uapi header files.
> > > > 4.split to series avoid large patch email.
> > > Just ping these patch series.
> > > The v1 comments here,
> > > https://lore.kernel.org/lkml/39d8ac1a-d92f-7cdc-14cd-944342f78c1a@suse.de/
> > 
> > Are we really sure that all users of these are gone? Also, I'm not really
> > seeing the benefit of this, we've managed to split out the legacy code
> > quite well, so carrying around isn't hurting anything afaics?
> 
> My first reaction was 'no way'. But then I thought about possible users of
> this code and I cannot see anyone relying on it. You'd need an ancient
> userspace Mesa library plus the most recent kernel. And all the rendering is
> OpenGL 1.x. Are there even Linux programs for that?
> 
> So as far as I'm concerned
> 
> Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
> 
> DRM's legacy infrastructure could be kept for a few more releases. Just in
> case one of the drivers makes a comeback.
> 
> There is code in nouveau that uses legacy functionality for its ancient
> userspace. I think we should scrap that as well. (See
> NOUVEAU_LEGACY_CTX_SUPPORT.)

From the irc discussion:

Acked-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Acked-by: Dave Airlie <airlied@redhat.com>
> 
> Best regards
> Thomas
> 
> > -Daniel
> > 
> > > 
> > > Thanks,
> > > Cai
> > > > 
> > > > Cai Huoqing (10):
> > > >    drm: Remove the obsolete driver-i810
> > > >    drm: Remove the obsolete driver-mga
> > > >    drm: Remove the obsolete driver-r128
> > > >    drm: Remove the obsolete driver-savage
> > > >    drm: Remove the obsolete driver-sis
> > > >    drm: Remove the obsolete driver-tdfx
> > > >    drm: Remove the obsolete driver-via
> > > >    drm: Add comments to Kconfig
> > > >    drm: Remove some obsolete drm pciids(tdfx, mga, i810, savage, r128,
> > > >      sis, via)
> > > >    MAINTAINERS: Remove some obsolete drivers info(tdfx, mga, i810,
> > > >      savage, r128, sis)
> > > > 
> > > >   MAINTAINERS                           |   29 -
> > > >   drivers/gpu/drm/Kconfig               |   59 +-
> > > >   drivers/gpu/drm/Makefile              |    7 -
> > > >   drivers/gpu/drm/i810/Makefile         |    8 -
> > > >   drivers/gpu/drm/i810/i810_dma.c       | 1266 ---------
> > > >   drivers/gpu/drm/i810/i810_drv.c       |  101 -
> > > >   drivers/gpu/drm/i810/i810_drv.h       |  246 --
> > > >   drivers/gpu/drm/mga/Makefile          |   11 -
> > > >   drivers/gpu/drm/mga/mga_dma.c         | 1168 --------
> > > >   drivers/gpu/drm/mga/mga_drv.c         |  104 -
> > > >   drivers/gpu/drm/mga/mga_drv.h         |  685 -----
> > > >   drivers/gpu/drm/mga/mga_ioc32.c       |  197 --
> > > >   drivers/gpu/drm/mga/mga_irq.c         |  169 --
> > > >   drivers/gpu/drm/mga/mga_state.c       | 1099 --------
> > > >   drivers/gpu/drm/mga/mga_warp.c        |  167 --
> > > >   drivers/gpu/drm/r128/Makefile         |   10 -
> > > >   drivers/gpu/drm/r128/ati_pcigart.c    |  228 --
> > > >   drivers/gpu/drm/r128/ati_pcigart.h    |   31 -
> > > >   drivers/gpu/drm/r128/r128_cce.c       |  944 -------
> > > >   drivers/gpu/drm/r128/r128_drv.c       |  116 -
> > > >   drivers/gpu/drm/r128/r128_drv.h       |  544 ----
> > > >   drivers/gpu/drm/r128/r128_ioc32.c     |  199 --
> > > >   drivers/gpu/drm/r128/r128_irq.c       |  118 -
> > > >   drivers/gpu/drm/r128/r128_state.c     | 1641 -----------
> > > >   drivers/gpu/drm/savage/Makefile       |    9 -
> > > >   drivers/gpu/drm/savage/savage_bci.c   | 1082 --------
> > > >   drivers/gpu/drm/savage/savage_drv.c   |   91 -
> > > >   drivers/gpu/drm/savage/savage_drv.h   |  580 ----
> > > >   drivers/gpu/drm/savage/savage_state.c | 1169 --------
> > > >   drivers/gpu/drm/sis/Makefile          |   10 -
> > > >   drivers/gpu/drm/sis/sis_drv.c         |  143 -
> > > >   drivers/gpu/drm/sis/sis_drv.h         |   80 -
> > > >   drivers/gpu/drm/sis/sis_mm.c          |  363 ---
> > > >   drivers/gpu/drm/tdfx/Makefile         |    8 -
> > > >   drivers/gpu/drm/tdfx/tdfx_drv.c       |   90 -
> > > >   drivers/gpu/drm/tdfx/tdfx_drv.h       |   47 -
> > > >   drivers/gpu/drm/via/Makefile          |    8 -
> > > >   drivers/gpu/drm/via/via_3d_reg.h      | 1771 ------------
> > > >   drivers/gpu/drm/via/via_dri1.c        | 3630 -------------------------
> > > >   include/drm/drm_pciids.h              |  112 -
> > > >   include/uapi/drm/i810_drm.h           |  292 --
> > > >   include/uapi/drm/mga_drm.h            |  429 ---
> > > >   include/uapi/drm/r128_drm.h           |  336 ---
> > > >   include/uapi/drm/savage_drm.h         |  220 --
> > > >   include/uapi/drm/sis_drm.h            |   77 -
> > > >   include/uapi/drm/via_drm.h            |  282 --
> > > >   46 files changed, 1 insertion(+), 19975 deletions(-)
> > > >   delete mode 100644 drivers/gpu/drm/i810/Makefile
> > > >   delete mode 100644 drivers/gpu/drm/i810/i810_dma.c
> > > >   delete mode 100644 drivers/gpu/drm/i810/i810_drv.c
> > > >   delete mode 100644 drivers/gpu/drm/i810/i810_drv.h
> > > >   delete mode 100644 drivers/gpu/drm/mga/Makefile
> > > >   delete mode 100644 drivers/gpu/drm/mga/mga_dma.c
> > > >   delete mode 100644 drivers/gpu/drm/mga/mga_drv.c
> > > >   delete mode 100644 drivers/gpu/drm/mga/mga_drv.h
> > > >   delete mode 100644 drivers/gpu/drm/mga/mga_ioc32.c
> > > >   delete mode 100644 drivers/gpu/drm/mga/mga_irq.c
> > > >   delete mode 100644 drivers/gpu/drm/mga/mga_state.c
> > > >   delete mode 100644 drivers/gpu/drm/mga/mga_warp.c
> > > >   delete mode 100644 drivers/gpu/drm/r128/Makefile
> > > >   delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.c
> > > >   delete mode 100644 drivers/gpu/drm/r128/ati_pcigart.h
> > > >   delete mode 100644 drivers/gpu/drm/r128/r128_cce.c
> > > >   delete mode 100644 drivers/gpu/drm/r128/r128_drv.c
> > > >   delete mode 100644 drivers/gpu/drm/r128/r128_drv.h
> > > >   delete mode 100644 drivers/gpu/drm/r128/r128_ioc32.c
> > > >   delete mode 100644 drivers/gpu/drm/r128/r128_irq.c
> > > >   delete mode 100644 drivers/gpu/drm/r128/r128_state.c
> > > >   delete mode 100644 drivers/gpu/drm/savage/Makefile
> > > >   delete mode 100644 drivers/gpu/drm/savage/savage_bci.c
> > > >   delete mode 100644 drivers/gpu/drm/savage/savage_drv.c
> > > >   delete mode 100644 drivers/gpu/drm/savage/savage_drv.h
> > > >   delete mode 100644 drivers/gpu/drm/savage/savage_state.c
> > > >   delete mode 100644 drivers/gpu/drm/sis/Makefile
> > > >   delete mode 100644 drivers/gpu/drm/sis/sis_drv.c
> > > >   delete mode 100644 drivers/gpu/drm/sis/sis_drv.h
> > > >   delete mode 100644 drivers/gpu/drm/sis/sis_mm.c
> > > >   delete mode 100644 drivers/gpu/drm/tdfx/Makefile
> > > >   delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.c
> > > >   delete mode 100644 drivers/gpu/drm/tdfx/tdfx_drv.h
> > > >   delete mode 100644 drivers/gpu/drm/via/Makefile
> > > >   delete mode 100644 drivers/gpu/drm/via/via_3d_reg.h
> > > >   delete mode 100644 drivers/gpu/drm/via/via_dri1.c
> > > >   delete mode 100644 include/uapi/drm/i810_drm.h
> > > >   delete mode 100644 include/uapi/drm/mga_drm.h
> > > >   delete mode 100644 include/uapi/drm/r128_drm.h
> > > >   delete mode 100644 include/uapi/drm/savage_drm.h
> > > >   delete mode 100644 include/uapi/drm/sis_drm.h
> > > >   delete mode 100644 include/uapi/drm/via_drm.h
> > > > 
> > > > -- 
> > > > 2.25.1
> > > > 
> > 
> 
> -- 
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Maxfeldstr. 5, 90409 Nürnberg, Germany
> (HRB 36809, AG Nürnberg)
> Geschäftsführer: Ivo Totev




-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
