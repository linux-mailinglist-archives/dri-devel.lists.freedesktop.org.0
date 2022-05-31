Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20CE5539802
	for <lists+dri-devel@lfdr.de>; Tue, 31 May 2022 22:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA4810E381;
	Tue, 31 May 2022 20:34:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD4AF10E381;
 Tue, 31 May 2022 20:34:48 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id n185so623597wmn.4;
 Tue, 31 May 2022 13:34:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oaXYmwjs+IP8DfonFtLZlkC4gcR1bP5BMuLB+hURGTI=;
 b=Uo1QyPMQp8yyfSpNq3/lf50f4g6fet8bZdokB71yNpzIo46V63H3Kq2a5Ud0yvilVH
 Tqu6qpHFTSvRpYdkO2OmrDrZdFxI/+NJ7UFDeye65myT4SIYuQw9fdDzQKcjg/DHSlKQ
 4sGflAEksOAgt7SbEcmFnwHdgY4K4ck+OAUd76E4XSdNPifu4DK2UjXtuqpwDXA4RsE9
 T4p6ZFKiZ7kNnNOvugictDq813xCtokUCSNm60F5l2m0bb2e6Kd+UVdHH+sHyj+Y5HWA
 0/wOxNALIeGPDZ93ETwsT28DZ8P2vg8VHlTzhJ2oC5f91sp4jB8joWRpLDGXyIdA6HKE
 T62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oaXYmwjs+IP8DfonFtLZlkC4gcR1bP5BMuLB+hURGTI=;
 b=g2Z5v5DsOS+huPyOf6w7PtKtndtxqnr4972ddEBGVQwr3jx6fgh/O7pO9iVV4Y/Lko
 Gm1c66alaUL9yarA/fyND5Wv3gxF5I+TyYd1zMfjwxnFH5ALmTyLHf2YH7CG5GkY/avd
 e+wZ1KnCFg+zXbJnjos6ZCYuB+NSjM87lbHOyfR/OE0p3InTMi5ERKpwTzjHZJ9LzXoy
 b0DzDCRRl3qv5rzFxPkpObDZcGn76KM17iKfgLxbxmW4uv2IAHic1zD4XZ6DSgXP7GMX
 ZWjmF+JAUrcyu/9pb5EWIE/5IbMIQ3idTo4Pm/NFzMu5y5Q1YLugmFPc2rUJJxV3JcYx
 6khg==
X-Gm-Message-State: AOAM531NDhBlvJu2ZHgrnZ+tSk5bVMtGCy+uyOlyE0fW9zLL9bp/6CW0
 BKbBCNZjNBNH/IuoUB9j8ERY/4CBP7SBRq08RH8=
X-Google-Smtp-Source: ABdhPJxioJPukJE1d1hZFegw9lQmbEjjQn5EFNtdoGSzu/a+qBWwmNy2JHdPps/csufWkTTB/pZ+fRzCLuaCM0EYTD0=
X-Received: by 2002:a05:600c:4f93:b0:399:e654:4481 with SMTP id
 n19-20020a05600c4f9300b00399e6544481mr16363801wmq.164.1654029287263; Tue, 31
 May 2022 13:34:47 -0700 (PDT)
MIME-Version: 1.0
References: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
In-Reply-To: <1653896005-25168-1-git-send-email-baihaowen@meizu.com>
From: Rob Clark <robdclark@gmail.com>
Date: Tue, 31 May 2022 13:34:48 -0700
Message-ID: <CAF6AEGtsAH6LdE9douMMYEM2hW6_ifcqgM5mxaj43XAr=3uCTw@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Fix pointer dereferenced before checking
To: Haowen Bai <baihaowen@meizu.com>
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
Cc: freedreno <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, May 30, 2022 at 12:34 AM Haowen Bai <baihaowen@meizu.com> wrote:
>
> The ctx->hw is dereferencing before null checking, so move
> it after checking.
>
> Signed-off-by: Haowen Bai <baihaowen@meizu.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> index bcccce292937..e59680cdd0ce 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
> @@ -155,11 +155,13 @@ static void dpu_hw_wb_roi(struct dpu_hw_wb *ctx, struct dpu_hw_wb_cfg *wb)
>  static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
>                 struct dpu_hw_wb_qos_cfg *cfg)
>  {
> -       struct dpu_hw_blk_reg_map *c = &ctx->hw;
> +       struct dpu_hw_blk_reg_map *c;
>         u32 qos_ctrl = 0;
>
>         if (!ctx || !cfg)
>                 return;
> +
> +       c = &ctx->hw;

tbh, we should just drop both of these null checks.. there is no
codepath that can reach this with potential for either param to be
NULL

BR,
-R

>
>         DPU_REG_WRITE(c, WB_DANGER_LUT, cfg->danger_lut);
>         DPU_REG_WRITE(c, WB_SAFE_LUT, cfg->safe_lut);
> --
> 2.7.4
>
