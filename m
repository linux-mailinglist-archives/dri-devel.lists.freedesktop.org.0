Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD4730EA7C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 03:56:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 229A06EC69;
	Thu,  4 Feb 2021 02:56:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FF1D6EC69
 for <dri-devel@lists.freedesktop.org>; Thu,  4 Feb 2021 02:56:22 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id r22so2212400edo.11
 for <dri-devel@lists.freedesktop.org>; Wed, 03 Feb 2021 18:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpW3Ky1drUwlFecwfnx3HP9HFWTcK7Ckd6mLp1ho73A=;
 b=YHVIVvQEFcABsDPIiTMD07s6HiyI15ikbyENtqZhgNr0sPUCXiiqHgpUHv3TpL3iEL
 MHKE716pZtDiXAsXg/m4vKQKub4LWpi/uSqLhh7/UGmu/c9xAtZhx8r32U1l0Nb8Juws
 XGkwNzHrnzLkeIs/kBssHKsMKnaunuNhzaxu1oyYZFAwJP5uU9lhwAI/xRUuDYwErtzj
 ygBGcrGaGF8pvwY35XGy5ZQyCCLAkG0WotlrtXvLQP/BGo3SnBZbaa3rMl05Pd6RQsAZ
 PhdULfNxaD722kiUwq3j4qekN59LmNMHR/vqgjIN1qEkg50R+zbRTGKB+O51yhLeTmqm
 VJbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpW3Ky1drUwlFecwfnx3HP9HFWTcK7Ckd6mLp1ho73A=;
 b=ivP2dddgVwK8lhSSX3uAdBixaq+GKYWOMtVI8LASdazslYUAQYo9PpcFFMsMlOo2sb
 A/zdzCP7tjkh1QHGD2JUZVDv0XoUyHVDyAEFQyV7LyBV7yqt9vwTkquwtvEIfWjfr+Lx
 aBpRVjPBTDeZhw/UMbGgB0o1VmiV8VSz63QlpcU8l+f7C1UxCej5zXki9cWGZxVxXNEi
 ibDE5p6ZOiZZWo+3D7fQGcIL32f4mWXFLKiTpciMriYD9b2GcK+KrBtG03iIAmHh83P2
 33/IhKssPECl5JyubBUa6hEnXevSwGuBEUYH6ssI3KrSbcnH7CIFKCDT+8VRfmHqJ7Oa
 mBUA==
X-Gm-Message-State: AOAM530QRfsCIBXwiici8b4I9o2tpNhpEQhifKfM8+OpS3lISUxkKVV+
 HOemkraEY5yTOP3Z1KuExSgZH2Ce/qn2JCZKUSQ=
X-Google-Smtp-Source: ABdhPJxyj/o7XR1+NjtDC/kW1Sa34CUe1xCFo6gBQ+8JL8CYUznTU3dazdYrsKyUpQhTrE6JMjCmz3HKkleHwfQY/xI=
X-Received: by 2002:aa7:d649:: with SMTP id v9mr6056996edr.383.1612407381187; 
 Wed, 03 Feb 2021 18:56:21 -0800 (PST)
MIME-Version: 1.0
References: <20210203232247.30902-1-chunkuang.hu@kernel.org>
In-Reply-To: <20210203232247.30902-1-chunkuang.hu@kernel.org>
From: Dave Airlie <airlied@gmail.com>
Date: Thu, 4 Feb 2021 12:56:09 +1000
Message-ID: <CAPM=9tyx82qNF7EDSfq0u6dHJRKjdsYU1RBROM29sS8vc5tNPw@mail.gmail.com>
Subject: Re: [GIT PULL] mediatek drm next for 5.12
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
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
Cc: Jitao Shi <jitao.shi@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Hsin-Yi Wang <hsinyi@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 4 Feb 2021 at 09:22, Chun-Kuang Hu <chunkuang.hu@kernel.org> wrote:
>
> Hi, Dave & Daniel:
>
> This includes:
>
> 1. Decouple Mediatek DRM sub driver
> 2. Share mtk mutex driver for both DRM and MDP
> 3. Add support for SoC MT8183

Hi Chun-Kuang,


dim: e83421b9acad ("drm/mediatek: Fix aal size config"): Subject in
fixes line doesn't match referenced commit:
dim:     0664d1392c26 (drm/mediatek: Add AAL engine basic function)
dim: de945f3098af ("drm/mediatek: Check if fb is null"): Subject in
fixes line doesn't match referenced commit:
dim:     b6b1bb980ec4 ( drm/mediatek: Turn off Alpha bit when plane
format has no alpha)

Can you fix the Fixes tags, it should have sha1 ("commit") they are
missing the quotations.

Thanks,
Dave.

>
> Regards,
> Chun-Kuang.
>
> The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:
>
>   Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)
>
> are available in the Git repository at:
>
>   https://git.kernel.org/pub/scm/linux/kernel/git/chunkuang.hu/linux.git tags/mediatek-drm-next-5.12
>
> for you to fetch changes up to f289eb1db7d7e6132c3ecf5049435ace2967b0fc:
>
>   drm/mediatek: Add matrix_bits private data for ccorr (2021-02-03 23:54:07 +0800)
>
> ----------------------------------------------------------------
> Mediatek DRM Next for Linux 5.12
>
> 1. Decouple Mediatek DRM sub driver
> 2. Share mtk mutex driver for both DRM and MDP
> 3. Add support for SoC MT8183
>
> ----------------------------------------------------------------
> CK Hu (15):
>       drm/mediatek: Separate getting larb device to a function
>       drm/mediatek: Move clk info from struct mtk_ddp_comp to sub driver private data
>       drm/mediatek: Move regs info from struct mtk_ddp_comp to sub driver private data
>       drm/mediatek: Remove irq in struct mtk_ddp_comp
>       drm/mediatek: Use struct cmdq_client_reg to gather cmdq variable
>       drm/mediatek: Move cmdq_reg info from struct mtk_ddp_comp to sub driver private data
>       drm/mediatek: Change sub driver interface from mtk_ddp_comp to device
>       drm/mediatek: Register vblank callback function
>       drm/mediatek: DRM driver directly refer to sub driver's function
>       drm/mediatek: Move mtk_ddp_comp_init() from sub driver to DRM driver
>       drm/mediatek: Remove redundant file including
>       drm/mediatek: Rename file mtk_drm_ddp to mtk_mutex
>       drm/mediatek: Change disp/ddp term to mutex in mtk mutex driver
>       drm/mediatek: Automatically search unclaimed mtk mutex in mtk_mutex_get()
>       soc / drm: mediatek: Move mtk mutex driver to soc folder
>
> Chun-Kuang Hu (2):
>       drm/mediatek: Get CMDQ client register for all ddp component
>       drm/mediatek: Use correct device pointer to get CMDQ client register
>
> Hsin-Yi Wang (2):
>       drm/mediatek: mtk_dpi: Create connector for bridges
>       drm/mediatek: Add mtk_dither_set_common() function
>
> Jitao Shi (1):
>       drm/mediatek: dsi: Use IRQF_TRIGGER_NONE for dsi irq trigger type
>
> Yongqiang Niu (15):
>       dt-bindings: mediatek: add description for mt8183 display
>       dt-bindings: mediatek: add description for mt8192 display
>       drm/mediatek: Check if fb is null
>       dt-bindings: mediatek: add rdma-fifo-size description for mt8183 display
>       dt-bindings: mediatek: add description for postmask
>       drm/mediatek: Fix aal size config
>       drm/mediatek: Add fifo_size into rdma private data
>       drm/mediatek: Separate gamma module
>       drm/mediatek: Add has_dither private data for gamma
>       drm/mediatek: Add support for SoC MT8183
>       drm/mediatek: Enable OVL_LAYER_SMI_ID_EN for multi-layer usecase
>       drm/mediatek: Enable dither function
>       drm/mediatek: Separate ccorr module
>       drm/mediatek: Fix ccorr size config
>       drm/mediatek: Add matrix_bits private data for ccorr
>
>  .../bindings/display/mediatek/mediatek,disp.txt    |  12 +-
>  drivers/gpu/drm/mediatek/Makefile                  |   5 +-
>  drivers/gpu/drm/mediatek/mtk_disp_ccorr.c          | 223 +++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_color.c          |  89 ++--
>  drivers/gpu/drm/mediatek/mtk_disp_drv.h            |  92 ++++
>  drivers/gpu/drm/mediatek/mtk_disp_gamma.c          | 197 ++++++++
>  drivers/gpu/drm/mediatek/mtk_disp_ovl.c            | 254 ++++++-----
>  drivers/gpu/drm/mediatek/mtk_disp_rdma.c           | 194 ++++----
>  drivers/gpu/drm/mediatek/mtk_dpi.c                 |  57 +--
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.c            | 107 ++---
>  drivers/gpu/drm/mediatek/mtk_drm_crtc.h            |   1 -
>  drivers/gpu/drm/mediatek/mtk_drm_ddp.h             |  28 --
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.c        | 503 ++++++++++-----------
>  drivers/gpu/drm/mediatek/mtk_drm_ddp_comp.h        | 100 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.c             |  88 ++--
>  drivers/gpu/drm/mediatek/mtk_drm_drv.h             |   5 +-
>  drivers/gpu/drm/mediatek/mtk_dsi.c                 |  50 +-
>  drivers/soc/mediatek/Makefile                      |   1 +
>  .../mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c}     | 328 +++++++-------
>  include/linux/soc/mediatek/mtk-mutex.h             |  26 ++
>  20 files changed, 1446 insertions(+), 914 deletions(-)
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_ccorr.c
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_drv.h
>  create mode 100644 drivers/gpu/drm/mediatek/mtk_disp_gamma.c
>  delete mode 100644 drivers/gpu/drm/mediatek/mtk_drm_ddp.h
>  rename drivers/{gpu/drm/mediatek/mtk_drm_ddp.c => soc/mediatek/mtk-mutex.c} (53%)
>  create mode 100644 include/linux/soc/mediatek/mtk-mutex.h
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
