Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7492399FDE
	for <lists+dri-devel@lfdr.de>; Thu,  3 Jun 2021 13:34:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7D176EA18;
	Thu,  3 Jun 2021 11:34:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C6E56E270
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Jun 2021 11:34:05 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id l1so8722155ejb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 04:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to; bh=6HvIM789SubGuMYbkNpXgOUOzv2hDzoCVUlTW74s4fU=;
 b=Icz+hjCozpAbugnKTylUiZbczne6xNvCGiJZU4Ly+Y0sTLpTodbh9k4gjcGfRsjGg/
 no7FFQmnsdBfKr9sK4hrwdOb1O14S9safSd/B9yMITPwQlvWCp+FhIUkoUgp/bmsqz9c
 88sMh5y11ExAwXNyPJkPGgqwn4tfntMA/Y84s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :content-transfer-encoding:in-reply-to;
 bh=6HvIM789SubGuMYbkNpXgOUOzv2hDzoCVUlTW74s4fU=;
 b=QobIxznja76a9v2DdztLh9VBLyFFE7epQoXm+DnnjuE8wGCz5WLpN1pwamE2IV50aw
 /jCysd6rz/1Blubx3upeD7wNSm2ed0LWu6jzAFFF1D5OIIZ2EMqrmeUfOTno0DrSMLAW
 HbNkT+8D5EPM6u8Bw7WStc5P9knf5moMevJVOM9bq+nSlxazAMQGwE7wwMjQxpl0geLh
 fqv8pYahGoGvnZ8DPIY71oKhRglkOjN7lDVyEfuCpOrUi8CjnHy9pzVLHXcIMkhU0aOb
 JDlCV6vW+qDxsji6tS3zLbrEGCbxQ2n5UlB2hVB8wz51aO6Kts7QeSPf0OPeFnl84K54
 u/Bw==
X-Gm-Message-State: AOAM533ruw3xaUINcAGFKHOMxUS2xkdcbJtDYgt0MUIND4LkkFotwjor
 hJA6aknwqSnGbxA67FMVgIA2eg==
X-Google-Smtp-Source: ABdhPJyCwjLRS9cmLZJ0uTIlfsEVYF9kSAF6LM5y2zAtZNY0+nXGguY0rzWF/YLHqYcWC2qrUHt3Fw==
X-Received: by 2002:a17:906:51d8:: with SMTP id
 v24mr23819138ejk.264.1622720043762; 
 Thu, 03 Jun 2021 04:34:03 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id p7sm1638842edw.43.2021.06.03.04.34.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Jun 2021 04:34:03 -0700 (PDT)
Date: Thu, 3 Jun 2021 13:34:00 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [RESEND 00/26] Rid W=1 warnings from GPU
Message-ID: <YLi+KJrLjKbdXLxH@phenom.ffwll.local>
Mail-Followup-To: Lee Jones <lee.jones@linaro.org>,
 linux-kernel@vger.kernel.org, Adam Jackson <ajax@redhat.com>,
 Ajay Kumar <ajaykumar.rs@samsung.com>,
 Akshu Agarwal <akshua@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Alistair Popple <apopple@nvidia.com>, amd-gfx@lists.freedesktop.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Ben Skeggs <bskeggs@redhat.com>, Ben Widawsky <ben@bwidawsk.net>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Christian Koenig <christian.koenig@amd.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org,
 Eric Anholt <eric@anholt.net>,
 Fabien Dessenne <fabien.dessenne@st.com>,
 freedreno@lists.freedesktop.org,
 Hans de Goede <hdegoede@redhat.com>,
 Harry Wentland <harry.wentland@amd.com>,
 Huang Rui <ray.huang@amd.com>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Inki Dae <inki.dae@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Krishna Manikandan <mkrishn@codeaurora.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Kuogee Hsieh <khsieh@codeaurora.org>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Leo Li <sunpeng.li@amd.com>, linaro-mm-sig@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Rossi <issor.oruam@gmail.com>,
 Michal Simek <michal.simek@xilinx.com>,
 nouveau@lists.freedesktop.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robdclark@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>,
 Stephen Boyd <swboyd@chromium.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Vincent Abriou <vincent.abriou@st.com>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210602143300.2330146-1-lee.jones@linaro.org>
X-Operating-System: Linux phenom 5.10.32scarlett+ 
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Mauro Rossi <issor.oruam@gmail.com>, dri-devel@lists.freedesktop.org,
 Huang Rui <ray.huang@amd.com>, Fabien Dessenne <fabien.dessenne@st.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>, Sam Ravnborg <sam@ravnborg.org>,
 Ajay Kumar <ajaykumar.rs@samsung.com>,
 Chandan Uddaraju <chandanu@codeaurora.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Ben Widawsky <ben@bwidawsk.net>,
 linux-samsung-soc@vger.kernel.org, Joonyoung Shim <jy0922.shim@samsung.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Vincent Abriou <vincent.abriou@st.com>, Alistair Popple <apopple@nvidia.com>,
 Michal Simek <michal.simek@xilinx.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Leo Li <sunpeng.li@amd.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Hans de Goede <hdegoede@redhat.com>, Akshu Agarwal <akshua@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-arm-kernel@lists.infradead.org,
 Krishna Manikandan <mkrishn@codeaurora.org>, Hyun Kwon <hyun.kwon@xilinx.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, linux-kernel@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, linaro-mm-sig@lists.linaro.org,
 Alex Deucher <alexander.deucher@amd.com>, linux-mediatek@lists.infradead.org,
 linux-media@vger.kernel.org, freedreno@lists.freedesktop.org,
 Christian Koenig <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jun 02, 2021 at 03:32:34PM +0100, Lee Jones wrote:
> Some off these patches have been knocking around for a while.
> 
> Who will hoover them up please?
> 
> This set is part of a larger effort attempting to clean-up W=1
> kernel builds, which are currently overwhelmingly riddled with
> niggly little warnings.
> 
> Lee Jones (26):
>   drm/mediatek/mtk_disp_color: Strip incorrect doc and demote header
>   drm/mediatek/mtk_disp_gamma: Strip and demote non-conformant
>     kernel-doc header
>   drm/mediatek/mtk_disp_ovl: Strip and demote non-conformant header
>   drm/mediatek/mtk_disp_rdma: Strip and demote non-conformant kernel-doc
>     header
>   drm/sti/sti_hdmi_tx3g4c28phy: Provide function names for kernel-doc
>     headers
>   drm/sti/sti_hda: Provide missing function names
>   drm/sti/sti_tvout: Provide a bunch of missing function names
>   drm/sti/sti_hqvdp: Fix incorrectly named function 'sti_hqvdp_vtg_cb()'
>   drm/msm/disp/dpu1/dpu_encoder_phys_cmd: Remove unused variable
>     'cmd_enc'
>   drm/msm/disp/dpu1/dpu_hw_interrupts: Demote a bunch of kernel-doc
>     abuses
>   drm/msm/disp/dpu1/dpu_plane: Fix a couple of naming issues
>   drm/msm/msm_gem: Demote kernel-doc abuses
>   drm/msm/dp/dp_catalog: Correctly document param 'dp_catalog'
>   drm/msm/dp/dp_link: Fix some potential doc-rot
>   drm/nouveau/nvkm/subdev/mc/tu102: Make functions called by reference
>     static
>   drm/amd/display/dc/dce/dce_transform: Remove superfluous
>     re-initialisation of DCFE_MEM_LIGHT_SLEEP_CNTL,
>   drm/xlnx/zynqmp_disp: Fix incorrectly named enum
>     'zynqmp_disp_layer_id'
>   drm/xlnx/zynqmp_dp: Fix incorrectly name function 'zynqmp_dp_train()'
>   drm/ttm/ttm_tt: Demote non-conformant kernel-doc header
>   drm/panel/panel-raspberrypi-touchscreen: Demote kernel-doc abuse
>   drm/panel/panel-sitronix-st7701: Demote kernel-doc abuse
>   drm/vgem/vgem_drv: Standard comment blocks should not use kernel-doc
>     format
>   drm/exynos/exynos7_drm_decon: Fix incorrect naming of
>     'decon_shadow_protect_win()'
>   drm/exynos/exynos_drm_ipp: Fix documentation for
>     'exynos_drm_ipp_get_{caps,res}_ioctl()'
>   drm/vboxvideo/hgsmi_base: Place function names into headers
>   drm/vboxvideo/modesetting: Provide function names for prototype
>     headers

Except for msm (Rob Clark promised on irc he'll pick them up for 5.14
soon) and amd (Alex is on top of things I think) I picked them all up and
merged into drm-misc-next.

Thanks, Daniel

> 
>  .../drm/amd/display/dc/dce/dce_transform.h    |  3 +-
>  drivers/gpu/drm/exynos/exynos7_drm_decon.c    |  2 +-
>  drivers/gpu/drm/exynos/exynos_drm_ipp.c       |  4 +--
>  drivers/gpu/drm/mediatek/mtk_disp_color.c     |  3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c     |  4 +--
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c       |  3 +-
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c      |  4 +--
>  .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  4 ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 32 +++++++++----------
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  4 +--
>  drivers/gpu/drm/msm/dp/dp_catalog.c           |  2 +-
>  drivers/gpu/drm/msm/dp/dp_link.c              |  6 ++--
>  drivers/gpu/drm/msm/msm_gem.c                 |  4 +--
>  .../gpu/drm/nouveau/nvkm/subdev/mc/tu102.c    |  6 ++--
>  .../drm/panel/panel-raspberrypi-touchscreen.c |  2 +-
>  drivers/gpu/drm/panel/panel-sitronix-st7701.c |  2 +-
>  drivers/gpu/drm/sti/sti_hda.c                 |  6 ++--
>  drivers/gpu/drm/sti/sti_hdmi_tx3g4c28phy.c    |  4 +--
>  drivers/gpu/drm/sti/sti_hqvdp.c               |  2 +-
>  drivers/gpu/drm/sti/sti_tvout.c               | 18 +++++------
>  drivers/gpu/drm/ttm/ttm_tt.c                  |  2 +-
>  drivers/gpu/drm/vboxvideo/hgsmi_base.c        | 19 +++++++----
>  drivers/gpu/drm/vboxvideo/modesetting.c       | 20 +++++++-----
>  drivers/gpu/drm/vgem/vgem_drv.c               |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_disp.c            |  2 +-
>  drivers/gpu/drm/xlnx/zynqmp_dp.c              |  2 +-
>  26 files changed, 80 insertions(+), 82 deletions(-)
> 
> Cc: Adam Jackson <ajax@redhat.com>
> Cc: Ajay Kumar <ajaykumar.rs@samsung.com>
> Cc: Akshu Agarwal <akshua@gmail.com>
> Cc: Alex Deucher <alexander.deucher@amd.com>
> Cc: Alistair Popple <apopple@nvidia.com>
> Cc: amd-gfx@lists.freedesktop.org
> Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
> Cc: Benjamin Gaignard <benjamin.gaignard@linaro.org>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Ben Widawsky <ben@bwidawsk.net>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: "Christian König" <christian.koenig@amd.com>
> Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: David Airlie <airlied@linux.ie>
> Cc: dri-devel@lists.freedesktop.org
> Cc: Eric Anholt <eric@anholt.net>
> Cc: Fabien Dessenne <fabien.dessenne@st.com>
> Cc: freedreno@lists.freedesktop.org
> Cc: Hans de Goede <hdegoede@redhat.com>
> Cc: Harry Wentland <harry.wentland@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: Hyun Kwon <hyun.kwon@xilinx.com>
> Cc: Inki Dae <inki.dae@samsung.com>
> Cc: Jagan Teki <jagan@amarulasolutions.com>
> Cc: Joonyoung Shim <jy0922.shim@samsung.com>
> Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> Cc: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: Kyungmin Park <kyungmin.park@samsung.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Leo Li <sunpeng.li@amd.com>
> Cc: linaro-mm-sig@lists.linaro.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-arm-msm@vger.kernel.org
> Cc: linux-mediatek@lists.infradead.org
> Cc: linux-media@vger.kernel.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Matthias Brugger <matthias.bgg@gmail.com>
> Cc: Mauro Rossi <issor.oruam@gmail.com>
> Cc: Michal Simek <michal.simek@xilinx.com>
> Cc: nouveau@lists.freedesktop.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Seung-Woo Kim <sw0312.kim@samsung.com>
> Cc: Stephen Boyd <swboyd@chromium.org>
> Cc: Sumit Semwal <sumit.semwal@linaro.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Vincent Abriou <vincent.abriou@st.com>
> -- 
> 2.31.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
