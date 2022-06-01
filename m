Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7B7F539BAF
	for <lists+dri-devel@lfdr.de>; Wed,  1 Jun 2022 05:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B5A112AEE;
	Wed,  1 Jun 2022 03:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x2d.google.com (mail-oa1-x2d.google.com
 [IPv6:2001:4860:4864:20::2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48A30112AEE
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Jun 2022 03:31:49 +0000 (UTC)
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-f2e0a41009so1060438fac.6
 for <dri-devel@lists.freedesktop.org>; Tue, 31 May 2022 20:31:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ZXANg1Xbh102jrQayjOuezZ9O/gFRLgsMRDupXP1QUA=;
 b=QCRv/9hjjsPosXK8+SozzTvw4mbpn5cVmMRPrTx8zbtfJZ8P6yp6nrPikH5M3Bb/zY
 9zj+RzSvXK0g8rzpgjMmty2pyBIC2N8frbv66r+wBgGh1aQpLT8s8K+9i7Krw1YN9LgX
 sVhAm8KDz42ZHGje/8QwEcJtsvASD/rChgUVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ZXANg1Xbh102jrQayjOuezZ9O/gFRLgsMRDupXP1QUA=;
 b=4ubRxGSBbXmo1UqvjRGSsHkgYujOXYwmAUg+Kt1hOsI6xVTszKAKWHWv5L0/sMUluh
 omhiZ3eC8QBH8gbICffw45vfgOPQybg+jXkevhBdMbp3GKkTZyDkH8Doz64Aq3+FVl1V
 uBpa5x2F1w7/b8NsCIBMzIZYPDPUqrwWVsmfLgh5HUYUcgbozbH5fb8QlY42dZkKw3aq
 P6adfLiIkDShDa2Xxu8yt8i5VwJF6CwoBwXcqBraVU0u5qr37rza1J/5hfB41brGZV68
 igev+nEVHy8tvS0z35sl5etY30JqFvM/KcvMKne4kbIUODH8uhH0FG410NjliYP15qmY
 Hxdg==
X-Gm-Message-State: AOAM530lL8hxzzliPsOW4fp1V7rWQ6C/rP8L8z/G2algh8S1u/NXAQJF
 LFjfW+LkbS6BwahK2H8CGRBO/7SlkGjOGofjI05xNg==
X-Google-Smtp-Source: ABdhPJxWg/wQ47t6UdY8plKB4yDS5oiLWxRUVa6tt3bSryEz8iA4tslZ3JT274/cfraEHMrjdCaYi12Re0wyLgqxBE8=
X-Received: by 2002:a05:6870:240d:b0:f1:b878:e97c with SMTP id
 n13-20020a056870240d00b000f1b878e97cmr14788774oap.193.1654054308492; Tue, 31
 May 2022 20:31:48 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Tue, 31 May 2022 20:31:47 -0700
MIME-Version: 1.0
In-Reply-To: <20220531160059.v2.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
References: <20220531160059.v2.1.Ie7f6d4bf8cce28131da31a43354727e417cae98d@changeid>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Tue, 31 May 2022 20:31:47 -0700
Message-ID: <CAE-0n53E+J9osr2ajviwFLwrtFrS2_i9fgW=d1P5=7UZ+s1Kew@mail.gmail.com>
Subject: Re: [PATCH v2] drm/msm/dpu: Move min BW request and full BW disable
 back to mdss
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Vinod Polimera <quic_vpolimer@quicinc.com>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Douglas Anderson (2022-05-31 16:01:26)
> In commit a670ff578f1f ("drm/msm/dpu: always use mdp device to scale
> bandwidth") we fully moved interconnect stuff to the DPU driver. This
> had no change for sc7180 but _did_ have an impact for other SoCs. It
> made them match the sc7180 scheme.
>
> Unfortunately, the sc7180 scheme seems like it was a bit broken.
> Specifically the interconnect needs to be on for more than just the
> DPU driver's AXI bus. In the very least it also needs to be on for the
> DSI driver's AXI bus. This can be seen fairly easily by doing this on
> a ChromeOS sc7180-trogdor class device:
>
>   set_power_policy --ac_screen_dim_delay=5 --ac_screen_off_delay=10
>   sleep 10
>   cd /sys/bus/platform/devices/ae94000.dsi/power
>   echo on > control
>
> When you do that, you'll get a warning splat in the logs about
> "gcc_disp_hf_axi_clk status stuck at 'off'".
>
> One could argue that perhaps what I have done above is "illegal" and
> that it can't happen naturally in the system because in normal system
> usage the DPU is pretty much always on when DSI is on. That being
> said:
> * In official ChromeOS builds (admittedly a 5.4 kernel with backports)
>   we have seen that splat at bootup.
> * Even though we don't use "autosuspend" for these components, we
>   don't use the "put_sync" variants. Thus plausibly the DSI could stay
>   "runtime enabled" past when the DPU is enabled. Techncially we
>   shouldn't do that if the DPU's suspend ends up yanking our clock.
>
> Let's change things such that the "bare minimum" request for the
> interconnect happens in the mdss driver again. That means that all of
> the children can assume that the interconnect is on at the minimum
> bandwidth. We'll then let the DPU request the higher amount that it
> wants.
>
> It should be noted that this isn't as hacky of a solution as it might
> initially appear. Specifically:
> * Since MDSS and DPU individually get their own references to the
>   interconnect then the framework will actually handle aggregating
>   them. The two drivers are _not_ clobbering each other.
> * When the Qualcomm interconnect driver aggregates it takes the max of
>   all the peaks. Thus having MDSS request a peak, as we're doing here,
>   won't actually change the total interconnect bandwidth (it won't be
>   added to the request for the DPU). This perhaps explains why the
>   "average" requested in MDSS was historically 0 since that one
>   _would_ be added in.
>
> NOTE also that in the downstream ChromeOS 5.4 and 5.15 kernels, we're
> also seeing some RPMH hangs that are addressed by this fix. These
> hangs are showing up in the field and on _some_ devices with enough
> stress testing of suspend/resume. Specifically right at suspend time
> with a stack crawl that looks like this (from chromeos-5.15 tree):
>   rpmh_write_batch+0x19c/0x240
>   qcom_icc_bcm_voter_commit+0x210/0x420
>   qcom_icc_set+0x28/0x38
>   apply_constraints+0x70/0xa4
>   icc_set_bw+0x150/0x24c
>   dpu_runtime_resume+0x50/0x1c4
>   pm_generic_runtime_resume+0x30/0x44
>   __genpd_runtime_resume+0x68/0x7c
>   genpd_runtime_resume+0x12c/0x20c
>   __rpm_callback+0x98/0x138
>   rpm_callback+0x30/0x88
>   rpm_resume+0x370/0x4a0
>   __pm_runtime_resume+0x80/0xb0
>   dpu_kms_enable_commit+0x24/0x30
>   msm_atomic_commit_tail+0x12c/0x630
>   commit_tail+0xac/0x150
>   drm_atomic_helper_commit+0x114/0x11c
>   drm_atomic_commit+0x68/0x78
>   drm_atomic_helper_disable_all+0x158/0x1c8
>   drm_atomic_helper_suspend+0xc0/0x1c0
>   drm_mode_config_helper_suspend+0x2c/0x60
>   msm_pm_prepare+0x2c/0x40
>   pm_generic_prepare+0x30/0x44
>   genpd_prepare+0x80/0xd0
>   device_prepare+0x78/0x17c
>   dpm_prepare+0xb0/0x384
>   dpm_suspend_start+0x34/0xc0
>
> We don't completely understand all the mechanisms in play, but the
> hang seemed to come and go with random factors. It's not terribly
> surprising that the hang is gone after this patch since the line of
> code that was failing is no longer present in the kernel.
>
> Fixes: a670ff578f1f ("drm/msm/dpu: always use mdp device to scale bandwidth")
> Fixes: c33b7c0389e1 ("drm/msm/dpu: add support for clk and bw scaling for display")
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
