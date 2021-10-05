Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B413E4233A4
	for <lists+dri-devel@lfdr.de>; Wed,  6 Oct 2021 00:41:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DCB3689F53;
	Tue,  5 Oct 2021 22:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EA6289BFF;
 Tue,  5 Oct 2021 22:41:34 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v25so2543592wra.2;
 Tue, 05 Oct 2021 15:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=innzCsihXomZmrhVK7jQXZcENUr7+ebtMDPo3Mzcujk=;
 b=F1Ahjb4KIfhWT/zPbY7Ny2zkSNa9mWESCa0UGJgHOkiEX/0LCFpCHxDYP1s+pPcOD3
 o8mJnKvFb7hBB4LQ1wfrfpFVA7mhepHTOCCdEWfppXAZq/VAF63pMl0VwnKmCClHqvdY
 y6nLitZOSwLgZVwXHH81jXntq8peAXkctdf2j+zmStkeIyg4ErGOtBAg1F8BFQEw5/TN
 dzRmYdsdb+MXSqHEgHGvVfGsk5L9tGuMTpxhKGGiD2Tzc8wzxSkhne99EWCvv3hx6nlt
 WinMtWY35qIZrERKR+RqgkThuxHZp135mzM2wpFo097yCWGj1NnSyPjy0eHmFk2fWboK
 CfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=innzCsihXomZmrhVK7jQXZcENUr7+ebtMDPo3Mzcujk=;
 b=yD7UhotG0bdApviaWTtjgKMeop5JGeT/gB1jcobRpr7XbWhxPedM0AKlfyWzjx9O1u
 3pwVP9QxyY9qKXQqYY4tV8aGCtUN11Z3Nwl9UDDMthGTsT9jVSqxzzGRgzVxwR5uASW3
 4Lql5j3qFE3KRbB3h8Y5BQNeADieYbnYT5ZMBFPFnF2fGAsZiXFMYI/vpW9tofE5/wfK
 emmUGKLm977J2QR2mFmmWNvNQ2fM9TacLcysKG4gWwQNUE8N90sjXwrR4yzohiQvyy0y
 l+OBw1J2WA4HAc18NQh9xtVTX0bRvyB+FTfVqMmxtNTtNveDwAkYuoh7O/C8kKmfX7kG
 nImg==
X-Gm-Message-State: AOAM532wIZsAb1tzMkJOi/eLyrPzFhAit3jjt77lKyexMGk/cC2MyAib
 YZ5wL6lDWg0w78GJwL9vS7mQmHUfxs541LG4EQc=
X-Google-Smtp-Source: ABdhPJyXyel7wd9XYQw7fOOTZFhFN7VZZTsgdvrlgxiXZZDrBBUd8nw8dfi1lXSx+UUe5JcmP8VTe1KQ5j60Dt1zwnk=
X-Received: by 2002:adf:bbd1:: with SMTP id z17mr24750497wrg.61.1633473692538; 
 Tue, 05 Oct 2021 15:41:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAF6AEGtD4u7yyiy+BQLmibUCbn=AdDRu7FrmdViHVx0QrcGf8g@mail.gmail.com>
In-Reply-To: <CAF6AEGtD4u7yyiy+BQLmibUCbn=AdDRu7FrmdViHVx0QrcGf8g@mail.gmail.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 5 Oct 2021 15:46:07 -0700
Message-ID: <CAF6AEGu0E8TQyW4Zykve5Y_ZG9kGWS_MCa2y1iVu+N6gR5XGtw@mail.gmail.com>
Subject: Re: [pull] drm/msm: drm-msm-fixes-2021-10-05 for v5.15-rc5
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel <dri-devel@lists.freedesktop.org>, 
 freedreno <freedreno@lists.freedesktop.org>, 
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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

+ dri-devel, sorry hit 'send' too quickly

On Tue, Oct 5, 2021 at 3:45 PM Rob Clark <robdclark@gmail.com> wrote:
>
> Hi Dave & Daniel,
>
> A few fixes for v5.15:
>
> * Fix a new crash on dev file close if the dev file was opened when
>   GPU is not loaded (such as missing fw in initrd)
> * Switch to single drm_sched_entity per priority level per drm_file
>   to unbreak multi-context userspace
> * Serialize GMU access to fix GMU OOB errors
> * Various error path fixes
> * A couple integer overflow fixes
> * Fix mdp5 cursor plane WARNs
>
> The following changes since commit 5816b3e6577eaa676ceb00a848f0fd65fe2adc29:
>
>   Linux 5.15-rc3 (2021-09-26 14:08:19 -0700)
>
> are available in the Git repository at:
>
>   https://gitlab.freedesktop.org/drm/msm.git drm-msm-fixes-2021-10-05
>
> for you to fetch changes up to c6921fbc88e120b2279c55686a071ca312d058e9:
>
>   drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
> (2021-10-04 08:08:07 -0700)
>
> ----------------------------------------------------------------
> Arnd Bergmann (1):
>       drm/msm/submit: fix overflow check on 64-bit architectures
>
> Colin Ian King (1):
>       drm/msm: Fix null pointer dereference on pointer edp
>
> Dan Carpenter (4):
>       drm/msm/a4xx: fix error handling in a4xx_gpu_init()
>       drm/msm/a3xx: fix error handling in a3xx_gpu_init()
>       drm/msm/dsi: Fix an error code in msm_dsi_modeset_init()
>       drm/msm/dsi: fix off by one in dsi_bus_clk_enable error handling
>
> Dmitry Baryshkov (2):
>       drm/msm/mdp5: fix cursor-related warnings
>       drm/msm/dsi/phy: fix clock names in 28nm_8960 phy
>
> Fabio Estevam (1):
>       drm/msm: Do not run snapshot on non-DPU devices
>
> Kuogee Hsieh (1):
>       drm/msm/dp: only signal audio when disconnected detected at dp_pm_resume
>
> Marek Vasut (1):
>       drm/msm: Avoid potential overflow in timeout_to_jiffies()
>
> Marijn Suijten (1):
>       drm/msm/dsi: dsi_phy_14nm: Take ready-bit into account in poll_for_ready
>
> Rob Clark (5):
>       drm/msm: Fix crash on dev file close
>       drm/msm/a6xx: Serialize GMU communication
>       drm/msm/a6xx: Track current ctx by seqno
>       drm/msm: A bit more docs + cleanup
>       drm/msm: One sched entity per process per priority
>
> Robert Foss (1):
>       drm/msm/dpu: Fix address of SM8150 PINGPONG5 IRQ register
>
> Stephan Gerhold (1):
>       drm/msm: Fix devfreq NULL pointer dereference on a3xx
>
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c           |  9 ++--
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c           |  9 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c           |  6 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h           |  3 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c           | 46 ++++++++++++----
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h           | 11 +++-
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c  |  2 +-
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c       | 16 ++++++
>  drivers/gpu/drm/msm/dp/dp_display.c             | 10 ++--
>  drivers/gpu/drm/msm/dsi/dsi.c                   |  4 +-
>  drivers/gpu/drm/msm/dsi/dsi_host.c              |  2 +-
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 30 +++++------
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  4 +-
>  drivers/gpu/drm/msm/edp/edp_ctrl.c              |  3 +-
>  drivers/gpu/drm/msm/msm_drv.c                   | 15 ++++--
>  drivers/gpu/drm/msm/msm_drv.h                   | 47 +---------------
>  drivers/gpu/drm/msm/msm_gem_submit.c            |  7 +--
>  drivers/gpu/drm/msm/msm_gpu.h                   | 66 ++++++++++++++++++++++-
>  drivers/gpu/drm/msm/msm_gpu_devfreq.c           |  6 +++
>  drivers/gpu/drm/msm/msm_submitqueue.c           | 72 ++++++++++++++++++++-----
>  20 files changed, 256 insertions(+), 112 deletions(-)
