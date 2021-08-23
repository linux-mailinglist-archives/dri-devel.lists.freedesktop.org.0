Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C563F50C8
	for <lists+dri-devel@lfdr.de>; Mon, 23 Aug 2021 20:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24FB48938F;
	Mon, 23 Aug 2021 18:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com
 [209.85.210.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 115CE895CA
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 18:51:33 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id
 i3-20020a056830210300b0051af5666070so29241186otc.4
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Aug 2021 11:51:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=wdgHBs4jqcab0Nca0Wa4pPNHM3gmB9i3TY5nzR3jzD0=;
 b=Od0EKSjfXZ9dVLIxV0p/xiDO9v6WFxRYRNsCciLkNTSHVks0KnQAgMX/1UjgoWF8Xx
 eR77maxUQ7AcIxt7SUEDaqHv1YDHQcU+hDrz08HOCFmoBA2ad02kVQQ4pTDMk1gJz38n
 uUqy1GrikCY+aPbo5A0zROkPkjsPfYPQjzsAki8lBwXmi0KrSYMZ38BvxiP74Bvc7oAO
 yEzDULrxnMIGOqSW1mY8A3oGT1Wr1exLwndrxEbF2rpJkUpf27erOi0lQRyxds7UABCW
 OfQ6A2k0AX/hiJgg9j2R5QeJ+XycY2bmDX+tuXGF3qz4cY1EfhICt/FgY8jHqRg10JV5
 0syg==
X-Gm-Message-State: AOAM531BoTwXALljT+L0xZUZEouMMSBURJlJeaBSorNnWi580usMtjez
 KPdKc3VfGH5gj8vfCmvVpQ==
X-Google-Smtp-Source: ABdhPJxvnG6wdrGM3ED6xV8CXtjfI+vHLk44/i9f1eGqIcHuh2RHVLuZtfJfpY7ClH4k6nOeWoUm+g==
X-Received: by 2002:a9d:730a:: with SMTP id e10mr3153668otk.120.1629744692283; 
 Mon, 23 Aug 2021 11:51:32 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id v5sm3560150oos.17.2021.08.23.11.51.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Aug 2021 11:51:31 -0700 (PDT)
Received: (nullmailer pid 2511997 invoked by uid 1000);
 Mon, 23 Aug 2021 18:51:30 -0000
Date: Mon, 23 Aug 2021 13:51:30 -0500
From: Rob Herring <robh@kernel.org>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: tzimmermann@suse.de, Arnd Bergmann <arnd@arndb.de>,
 wanghaibin.wang@huawei.com, Jun Nie <jun.nie@linaro.org>, airlied@linux.ie,
 Shawn Guo <shawnguo@kernel.org>, robh+dt@kernel.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch, linux-kernel@vger.kernel.org,
 mripard@kernel.org, devicetree@vger.kernel.org,
 maarten.lankhorst@linux.intel.com
Subject: Re: [PATCH] drm: remove zxdrm driver
Message-ID: <YSPuMqd1QgnRIVCB@robh.at.kernel.org>
References: <20210821031357.289-1-yuzenghui@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210821031357.289-1-yuzenghui@huawei.com>
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

On Sat, 21 Aug 2021 11:13:57 +0800, Zenghui Yu wrote:
> The zte zx platform had been removed in commit 89d4f98ae90d ("ARM: remove
> zte zx platform"), so this driver is no longer needed.
> 
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Jun Nie <jun.nie@linaro.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
> ---
>  .../devicetree/bindings/display/zte,vou.txt   | 120 ---
>  drivers/gpu/drm/Kconfig                       |   2 -
>  drivers/gpu/drm/Makefile                      |   1 -
>  drivers/gpu/drm/zte/Kconfig                   |  10 -
>  drivers/gpu/drm/zte/Makefile                  |  10 -
>  drivers/gpu/drm/zte/zx_common_regs.h          |  28 -
>  drivers/gpu/drm/zte/zx_drm_drv.c              | 190 ----
>  drivers/gpu/drm/zte/zx_drm_drv.h              |  34 -
>  drivers/gpu/drm/zte/zx_hdmi.c                 | 760 ---------------
>  drivers/gpu/drm/zte/zx_hdmi_regs.h            |  66 --
>  drivers/gpu/drm/zte/zx_plane.c                | 537 ----------
>  drivers/gpu/drm/zte/zx_plane.h                |  26 -
>  drivers/gpu/drm/zte/zx_plane_regs.h           | 120 ---
>  drivers/gpu/drm/zte/zx_tvenc.c                | 400 --------
>  drivers/gpu/drm/zte/zx_tvenc_regs.h           |  27 -
>  drivers/gpu/drm/zte/zx_vga.c                  | 527 ----------
>  drivers/gpu/drm/zte/zx_vga_regs.h             |  33 -
>  drivers/gpu/drm/zte/zx_vou.c                  | 921 ------------------
>  drivers/gpu/drm/zte/zx_vou.h                  |  64 --
>  drivers/gpu/drm/zte/zx_vou_regs.h             | 212 ----
>  20 files changed, 4088 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/zte,vou.txt
>  delete mode 100644 drivers/gpu/drm/zte/Kconfig
>  delete mode 100644 drivers/gpu/drm/zte/Makefile
>  delete mode 100644 drivers/gpu/drm/zte/zx_common_regs.h
>  delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.c
>  delete mode 100644 drivers/gpu/drm/zte/zx_drm_drv.h
>  delete mode 100644 drivers/gpu/drm/zte/zx_hdmi.c
>  delete mode 100644 drivers/gpu/drm/zte/zx_hdmi_regs.h
>  delete mode 100644 drivers/gpu/drm/zte/zx_plane.c
>  delete mode 100644 drivers/gpu/drm/zte/zx_plane.h
>  delete mode 100644 drivers/gpu/drm/zte/zx_plane_regs.h
>  delete mode 100644 drivers/gpu/drm/zte/zx_tvenc.c
>  delete mode 100644 drivers/gpu/drm/zte/zx_tvenc_regs.h
>  delete mode 100644 drivers/gpu/drm/zte/zx_vga.c
>  delete mode 100644 drivers/gpu/drm/zte/zx_vga_regs.h
>  delete mode 100644 drivers/gpu/drm/zte/zx_vou.c
>  delete mode 100644 drivers/gpu/drm/zte/zx_vou.h
>  delete mode 100644 drivers/gpu/drm/zte/zx_vou_regs.h
> 

Acked-by: Rob Herring <robh@kernel.org>
