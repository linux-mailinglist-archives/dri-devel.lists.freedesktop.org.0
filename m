Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6291345A6D5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 16:50:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CBFB6E249;
	Tue, 23 Nov 2021 15:50:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B356E249
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 15:50:48 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id 28so18650743pgq.8
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 07:50:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=p5/dnjXoJ8teDVOSqiNUzGVK+QNLdlAM4nDDCgZROWw=;
 b=SZkGjoNNQtoublRXDZq9kgD0trOc0Q3U7nJiv1jg/3HrkIypSCJMhDm2r8+yI4mlNk
 wFndxsoxTZh4EX9CjzlM8JK1ivzYhc7Sib4z0ff7ifSmOdO23HtUVAM2g1V+TL1QhNDq
 p5q8jjV7FynYOzQdmJcOyaP1OyvIqyI2wNEf9+YGWW6VwpAHNjHnURtVWJuIzu6sr+qF
 mUn7Aqm/BHrSARXaf6omS1Xina4ZDNToYiAsaS3znXEVPkbyhoRiKxOVT5NTA2/CmrCp
 Z3TuNp85RgwLUhTTvyeaJBqKu2iMIweqZRtjp7IFx6uZW2CHflreaDUWP707y/lYeuY6
 stjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=p5/dnjXoJ8teDVOSqiNUzGVK+QNLdlAM4nDDCgZROWw=;
 b=xRnnnJgy8EaSFgb0+jcLL4NWHt3zohv2omTHc4iWhCuJocsFrEHMSAuwEwtSyjp6pT
 kyS1mQ+2r5pCBmbbpVcp7yKgY3GYdQZgAuROsc2uTfUZdvyw5q7PEvTndDW4R3Z1vrkK
 VsfSLqSJ9cClqgreDMUuYuV3XWYFYpbOaVrkJPojWrwUK6r2K2wv/i+B0YxRDCDTSmoy
 tWhnv1kr7u+Nfpi4SSGi+/e0590TivkyE2h63UzWJGCKcueztxsBfWLYGC/TUd/iMSx7
 RQ+AMPWB7buewSOTklnX7J572/UfDlOA40Uq0laqPUGwJDGtNuYD7ADNM68l30WAcxo8
 /ZHw==
X-Gm-Message-State: AOAM533fvNoa4AAzgONr/jotzQR2qV5gmUXhXh0VPbJ7GEcUJPoNfqrP
 94V5Bbn4XhD1GDGWVnCFQcOP2DzbQ1iSodm4lA9CJA==
X-Google-Smtp-Source: ABdhPJx911N+Fj7qf+H5dcOu/OnmfyUkA1zkkaVVKqEAufjOTT1k6nEfn/NtxZ2mTj/uwQ0jK+uc0rkOnN6MIwSWgRU=
X-Received: by 2002:aa7:9903:0:b0:49f:e368:4fc3 with SMTP id
 z3-20020aa79903000000b0049fe3684fc3mr6070106pff.1.1637682647615; Tue, 23 Nov
 2021 07:50:47 -0800 (PST)
MIME-Version: 1.0
References: <20211123154050.40984-1-bjorn.andersson@linaro.org>
In-Reply-To: <20211123154050.40984-1-bjorn.andersson@linaro.org>
From: Robert Foss <robert.foss@linaro.org>
Date: Tue, 23 Nov 2021 16:50:34 +0100
Message-ID: <CAG3jFytT1Bvagn8hQnVvE48X-jR+pyNuQtjcgJAYmBC97=BL7g@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dpu: Add more of the INTF interrupt regions
To: Bjorn Andersson <bjorn.andersson@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 23 Nov 2021 at 16:39, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> In addition to the other 7xxx INTF interrupt regions, SM8350 has
> additional INTF regions at 0x0ae37000, 0x0ae38000 and 0x0ae39000, define
> these. The 7xxx naming scheme of the bits are kept for consistency.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 18 ++++++++++++++++++
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  3 +++
>  2 files changed, 21 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index d2b6dca487e3..a77a5eaa78ad 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -30,6 +30,9 @@
>  #define MDP_AD4_INTR_STATUS_OFF                0x420
>  #define MDP_INTF_0_OFF_REV_7xxx             0x34000
>  #define MDP_INTF_1_OFF_REV_7xxx             0x35000
> +#define MDP_INTF_2_OFF_REV_7xxx             0x36000
> +#define MDP_INTF_3_OFF_REV_7xxx             0x37000
> +#define MDP_INTF_4_OFF_REV_7xxx             0x38000
>  #define MDP_INTF_5_OFF_REV_7xxx             0x39000
>
>  /**
> @@ -110,6 +113,21 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>                 MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_EN,
>                 MDP_INTF_1_OFF_REV_7xxx+INTF_INTR_STATUS
>         },
> +       {
> +               MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +               MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_EN,
> +               MDP_INTF_2_OFF_REV_7xxx+INTF_INTR_STATUS
> +       },
> +       {
> +               MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +               MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_EN,
> +               MDP_INTF_3_OFF_REV_7xxx+INTF_INTR_STATUS
> +       },
> +       {
> +               MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_CLEAR,
> +               MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_EN,
> +               MDP_INTF_4_OFF_REV_7xxx+INTF_INTR_STATUS
> +       },
>         {
>                 MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_CLEAR,
>                 MDP_INTF_5_OFF_REV_7xxx+INTF_INTR_EN,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> index d50e78c9f148..1ab75cccd145 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h
> @@ -26,6 +26,9 @@ enum dpu_hw_intr_reg {
>         MDP_AD4_1_INTR,
>         MDP_INTF0_7xxx_INTR,
>         MDP_INTF1_7xxx_INTR,
> +       MDP_INTF2_7xxx_INTR,
> +       MDP_INTF3_7xxx_INTR,
> +       MDP_INTF4_7xxx_INTR,
>         MDP_INTF5_7xxx_INTR,
>         MDP_INTR_MAX,
>  };

Reviewed-by: Robert Foss <robert.foss@linaro.org>
