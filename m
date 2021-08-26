Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EE0E3F8473
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 11:22:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003F389F38;
	Thu, 26 Aug 2021 09:22:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D7F6E598
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 09:22:45 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id b6so3900894wrh.10
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Aug 2021 02:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=Z5nGZgvsyXA2v5RBRhfghmqhLLrwrK3N/HAosQKFTGU=;
 b=gPVYqvarTNOfAMXnLrOwhAZEMjPHA9JBmY7uaVY5mZDlUw6TWlUKedc1ZYtK0GBZ1f
 Mwo/R9M9Fk9Fa9LVqGsfUKkr5xcapuuftVZBe4bxEQqm7oug5gtIaPjOyrnS5nc/ylnm
 8TaYJ9AZ76dyPC/sNv1v2ua8pWaTrWYynyuNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=Z5nGZgvsyXA2v5RBRhfghmqhLLrwrK3N/HAosQKFTGU=;
 b=G+3f5uSUQsCohIASe4vl5mFY3A7Dyms/UQEXixcVTf4hCJeWD7CxZasGeyd4c5BmGh
 Jg84Uy2KgREP1lOcyzjYiV9ncS7Ib1yw8YbHodp2J8zCJvxe2Fs84LwlX3pjjnSKBxPB
 Ofc70d56BtMvkj+VLxllZwYR+rpxapGh/sZHsKIckFEipC9wVX1UJjlQedc8cDKwWZwT
 6MtMMXWTu/NMCsy7fXIpgNJoM+MCI9tuD4Bagr0dUue9v3m2y3JstafezIXcFKBboQNf
 /bKnLf5D5ZvCASyCbi+lai31rLAim1ijB264JNLHK0vzAwCotSWcqbTIob6Aoj3nTHDo
 ZTmw==
X-Gm-Message-State: AOAM533njdIu/CN9pvxzQOFfXNro1hQ1BCY4hrvXDWUQAL7lQ5hGpKsY
 eXZ+cgrY5BxIkPHkynqFBStPMw==
X-Google-Smtp-Source: ABdhPJywIjK24u44KRC9Fyl/LBYQf/UtyuZhNV+15XNUicx6WL1eBmZ28GqU1x/tJY9ZhVWwQcJQoA==
X-Received: by 2002:a5d:438a:: with SMTP id i10mr2650396wrq.285.1629969764058; 
 Thu, 26 Aug 2021 02:22:44 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v21sm2697421wra.92.2021.08.26.02.22.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 02:22:43 -0700 (PDT)
Date: Thu, 26 Aug 2021 11:22:41 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
Cc: Zenghui Yu <yuzenghui@huawei.com>, tzimmermann@suse.de,
 Arnd Bergmann <arnd@arndb.de>, wanghaibin.wang@huawei.com,
 Jun Nie <jun.nie@linaro.org>, airlied@linux.ie,
 Shawn Guo <shawnguo@kernel.org>, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 linux-kernel@vger.kernel.org, mripard@kernel.org,
 devicetree@vger.kernel.org, maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH] drm: remove zxdrm driver
Message-ID: <YSddYSKvGneVKNjW@phenom.ffwll.local>
Mail-Followup-To: Rob Herring <robh@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>, tzimmermann@suse.de,
 Arnd Bergmann <arnd@arndb.de>, wanghaibin.wang@huawei.com,
 Jun Nie <jun.nie@linaro.org>, airlied@linux.ie,
 Shawn Guo <shawnguo@kernel.org>, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 mripard@kernel.org, devicetree@vger.kernel.org,
 maarten.lankhorst@linux.intel.com
References: <20210821031357.289-1-yuzenghui@huawei.com>
 <YSPuMqd1QgnRIVCB@robh.at.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YSPuMqd1QgnRIVCB@robh.at.kernel.org>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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

On Mon, Aug 23, 2021 at 01:51:30PM -0500, Rob Herring wrote:
> On Sat, 21 Aug 2021 11:13:57 +0800, Zenghui Yu wrote:
> > The zte zx platform had been removed in commit 89d4f98ae90d ("ARM: remove
> > zte zx platform"), so this driver is no longer needed.
> > 
> > Cc: Arnd Bergmann <arnd@arndb.de>
> > Cc: Jun Nie <jun.nie@linaro.org>
> > Cc: Shawn Guo <shawnguo@kernel.org>
> > Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> > ---
> >  .../devicetree/bindings/display/zte,vou.txt   | 120 ---
> >  drivers/gpu/drm/Kconfig                       |   2 -
> >  drivers/gpu/drm/Makefile                      |   1 -
> >  drivers/gpu/drm/zte/Kconfig                   |  10 -
> >  drivers/gpu/drm/zte/Makefile                  |  10 -
> >  drivers/gpu/drm/zte/zx_common_regs.h          |  28 -
> >  drivers/gpu/drm/zte/zx_drm_drv.c              | 190 ----
> >  drivers/gpu/drm/zte/zx_drm_drv.h              |  34 -
> >  drivers/gpu/drm/zte/zx_hdmi.c                 | 760 ---------------
> >  drivers/gpu/drm/zte/zx_hdmi_regs.h            |  66 --
> >  drivers/gpu/drm/zte/zx_plane.c                | 537 ----------
> >  drivers/gpu/drm/zte/zx_plane.h                |  26 -
> >  drivers/gpu/drm/zte/zx_plane_regs.h           | 120 ---
> >  drivers/gpu/drm/zte/zx_tvenc.c                | 400 --------
> >  drivers/gpu/drm/zte/zx_tvenc_regs.h           |  27 -
> >  drivers/gpu/drm/zte/zx_vga.c                  | 527 ----------
> >  drivers/gpu/drm/zte/zx_vga_regs.h             |  33 -
> >  drivers/gpu/drm/zte/zx_vou.c                  | 921 ------------------
> >  drivers/gpu/drm/zte/zx_vou.h                  |  64 --
> >  drivers/gpu/drm/zte/zx_vou_regs.h             | 212 ----
> >  20 files changed, 4088 deletions(-)
> >  delete mode 100644 Documentation/devicetree/bindings/display/zte,vou.txt
> >  delete mode 100644 drivers/gpu/drm/zte/Kconfig
> >  delete mode 100644 drivers/gpu/drm/zte/Makefile
> >  delete mode 100644 drivers/gpu/drm/zte/zx_common_regs.h
> >  delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.c
> >  delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.h
> >  delete mode 100644 drivers/gpu/drm/zte/zx_hdmi.c
> >  delete mode 100644 drivers/gpu/drm/zte/zx_hdmi_regs.h
> >  delete mode 100644 drivers/gpu/drm/zte/zx_plane.c
> >  delete mode 100644 drivers/gpu/drm/zte/zx_plane.h
> >  delete mode 100644 drivers/gpu/drm/zte/zx_plane_regs.h
> >  delete mode 100644 drivers/gpu/drm/zte/zx_tvenc.c
> >  delete mode 100644 drivers/gpu/drm/zte/zx_tvenc_regs.h
> >  delete mode 100644 drivers/gpu/drm/zte/zx_vga.c
> >  delete mode 100644 drivers/gpu/drm/zte/zx_vga_regs.h
> >  delete mode 100644 drivers/gpu/drm/zte/zx_vou.c
> >  delete mode 100644 drivers/gpu/drm/zte/zx_vou.h
> >  delete mode 100644 drivers/gpu/drm/zte/zx_vou_regs.h
> > 
> 
> Acked-by: Rob Herring <robh@kernel.org>

I just merged another patch to delete the zte driver.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
