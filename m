Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 22AAB518AAF
	for <lists+dri-devel@lfdr.de>; Tue,  3 May 2022 19:03:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E42D1120B1;
	Tue,  3 May 2022 17:03:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B1A112092;
 Tue,  3 May 2022 17:02:59 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id a1so20585806edt.3;
 Tue, 03 May 2022 10:02:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0ebsl3t9Q4A5ZhggZdMt0K6huVQ4nPLjVF1HT4eHwHY=;
 b=HaGnyx7pBoke+0aSLZ+0Cl9i2Z3rtc277xsE07lgnGx2lIPgKNR+/cHf1BHMJd+tWY
 xLxDVjfXM0LpLkK6W47aSnLqvt4qcngT1GxJ9qnMFGWSSL68ZSpCJur0Qp+flnz9TG9V
 8iSPz7fXNdaty2uNHB4TWoNsqJrz0v03bb5rxLo5UKkUbCeepA8IK+d4f511ABt2QcWd
 ZpC42ODRQgilCYofK3JnmcBW/XdrLxgbLavwJlZDJe38uRpGjKQRfb1xNvaHi8pmKFwS
 8RYFI+ibpzWIAh8L22MX0fUODrvS/rlJYgws3AcC0d8zDmBJEhPw91evXIyGqHtd9B1w
 9Xiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0ebsl3t9Q4A5ZhggZdMt0K6huVQ4nPLjVF1HT4eHwHY=;
 b=WyqOks+4qIIq2QxZFHB4sZFBCsHY8qjb6z4diu97ccDgFpMnfjCIZjkoda0b+cSMxa
 UTA4NXWaiN+kfQwQWOyFEv8eaOGOIzhF6LYN3tNBIq+9vYZeaiQZqQ6bxdeFg1SWO4G1
 4eJNk1grTvf0epclWb3PGQZ3Ci/8xmREHms9gzK/hOVjsraiCH1J6W07SCTXjO94jjoH
 Dn6Or68hJsvHCtMsFb1mo3QjW8iHswrvlmLTDErIdfa7bBlj4JVZ57fD1jUvf6FF02VB
 Q8Rq/9PRJ/q3SV0CrdmLAjTtgXQQb0VHApXbrKVgsK8AL+8/hz63OR76unHNLAbXnlbB
 4F0w==
X-Gm-Message-State: AOAM530BFHH+k3r1oXK8xf/lGzoL7bxB6/H8S/k4QUUnTDd4XYTN2bi2
 1KmIvS8e9V6opryEk8siOYI=
X-Google-Smtp-Source: ABdhPJwhqGbymFuBTyPLL+yyc+nnpILMy/ni7d7XOhYbnZCBoZ0oS8dRxaoc/0h9PTlfn8SevSJmlw==
X-Received: by 2002:a05:6402:1941:b0:413:2822:9c8 with SMTP id
 f1-20020a056402194100b00413282209c8mr18716302edz.13.1651597377548; 
 Tue, 03 May 2022 10:02:57 -0700 (PDT)
Received: from kista.localnet (cpe1-3-76.cable.triera.net. [213.161.3.76])
 by smtp.gmail.com with ESMTPSA id
 q8-20020aa7cc08000000b0042617ba637esm8000905edt.8.2022.05.03.10.02.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 May 2022 10:02:56 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: linux-kernel@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>
Subject: Re: [PATCH v3 2/3] drm/fb-helper: Rename preferred_bpp
 drm_fbdev_generic_setup() parameter
Date: Tue, 03 May 2022 19:02:54 +0200
Message-ID: <2626921.mvXUDI8C0e@kista>
In-Reply-To: <20220503071540.471667-3-javierm@redhat.com>
References: <20220503071540.471667-1-javierm@redhat.com>
 <20220503071540.471667-3-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: linux-aspeed@lists.ozlabs.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Javier Martinez Canillas <javierm@redhat.com>, dri-devel@lists.freedesktop.org,
 linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, spice-devel@lists.freedesktop.org,
 linux-amlogic@lists.infradead.org, virtualization@lists.linux-foundation.org,
 linux-sunxi@lists.linux.dev, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dne torek, 03. maj 2022 ob 09:15:39 CEST je Javier Martinez Canillas 
napisal(a):
> By default the bits per pixel for the emulated framebuffer device is set
> to dev->mode_config.preferred_depth, but some devices need another value.
> 
> Since this second parameter is only used by a few drivers, and to allow
> drivers to use it for passing other configurations when registering the
> fbdev, rename @preferred_bpp to @options and make it a multi-field param.
> 
> The DRM_FB_OPTION() and DRM_FB_GET_OPTION() macros are provided to drivers
> for computing options bitfield values and getting the values respectively
> 
> For now, only the DRM_FB_BPP option exists but other options can be added.
> 
> Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
> Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> ---
> 
> Changes in v3:
> - Drop the preferred_bpp local variable (Laurent Pinchart).
> - Add a const qualifier to options parameter (Laurent Pinchart).
> 
> Changes in v2:
> - Rename DRM_FB_SET_OPTION() to DRM_FB_OPTION() and make more clear in
>   the kernel-doc what this macro does (Laurent Pinchart).
> - Fix some kernel-doc issues I didn't notice in v1.
> - Add Reviewed-by tags from Thomas and Laurent.
> 
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  6 +++--
>  drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
>  drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
>  drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
>  drivers/gpu/drm/ast/ast_drv.c                 |  2 +-
>  drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_dc.c  |  2 +-
>  drivers/gpu/drm/drm_drv.c                     |  2 +-
>  drivers/gpu/drm/drm_fb_helper.c               | 26 ++++++++++++-------
>  drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
>  .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
>  drivers/gpu/drm/imx/dcss/dcss-kms.c           |  2 +-
>  drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
>  drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  2 +-
>  drivers/gpu/drm/mcde/mcde_drv.c               |  2 +-
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 +-
>  drivers/gpu/drm/meson/meson_drv.c             |  2 +-
>  drivers/gpu/drm/mxsfb/mxsfb_drv.c             |  2 +-
>  drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
>  drivers/gpu/drm/qxl/qxl_drv.c                 |  2 +-
>  drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
>  drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
>  drivers/gpu/drm/stm/drv.c                     |  2 +-
>  drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-

For sun4i:
Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regard,
Jernej

>  drivers/gpu/drm/tidss/tidss_drv.c             |  2 +-
>  drivers/gpu/drm/tilcdc/tilcdc_drv.c           |  2 +-
>  drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
>  drivers/gpu/drm/tiny/bochs.c                  |  2 +-
>  drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
>  drivers/gpu/drm/vboxvideo/vbox_drv.c          |  2 +-
>  drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
>  drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c           |  2 +-
>  include/drm/drm_fb_helper.h                   | 14 +++++++++-
>  33 files changed, 64 insertions(+), 42 deletions(-)



