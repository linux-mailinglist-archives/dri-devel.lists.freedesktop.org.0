Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E59739B4E7
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 10:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D0E6E15D;
	Fri,  4 Jun 2021 08:32:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0E96E15D
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 08:32:33 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id r5so12912127lfr.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Jun 2021 01:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=zP2dna87z6RKrxkkJWo2LQdu7tVCeYap9nb/k2QVk5I=;
 b=BI1l2w090NvUuzjJirHDmxRkq5GWasjScNptw7r1C+4lSVHeu39FVyxAFCG19UwVsb
 QxNh+Il5+n5v+KRUCdKpM4b0uCO0sut+buOkmxGTq1IGt4oTCexVpen6XunnkT3+A6sb
 sJ5F3VD+VPhD66FtwJMqy7xgI4zXHyFKw9qbY+eymmVAtJEukFRIHGN4iZZ/+N9Ln3/T
 L2QlfItJLRowUqeTs7AE9ktEuVgQ7Yw/hNIz9CdbORDFFHYL8svVvvPJAK4kS5justFA
 io1E8bvEjd+eMlzxU2MoTjoqrZe3vFU9sleiCEEc1tVzGj9y6QmUkWq/w3WkeAl2+wcu
 HhdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=zP2dna87z6RKrxkkJWo2LQdu7tVCeYap9nb/k2QVk5I=;
 b=hUR+8XUOlo2qYdung+PUa+ZtAIeMk2K/XvWnAUIC18Kcbyl8/CryR2WqxY77dmfc7n
 abC8wrRuERjzTylPOn5Ykk+5fNanPvYChyHoP8/GvdiNAP2OvqnD+3AIzGtB5nMsRbKh
 yYicayN08cLDGWOStecPdbb7jRwhzZFC1B46DATI6mYx1gUinfudorovF09J2FsHpqyT
 Y9JGigAi0fR+yhgZY4YXfKh/+Tv5SS+HtN9P9ukUKyKFnQ+NMYY7NGT/qG4Z7HStHScf
 91ptO9OmzKjuBasK0YFvCx/WbGBiIpsvGfH1L2/0RcxwFHaeSC+8nQ8vADIMgHiI/Pcr
 u+/Q==
X-Gm-Message-State: AOAM531+IyOT+eSKED4vrdLa2BQBDFk7LSiQx2KYgqohltwOpFS3CUAq
 +jso412dNQ0NCrjMGB9NTlMBfg==
X-Google-Smtp-Source: ABdhPJykew9bOeZhphWWjOUQEebLS58YJSEt6mkLnOTlh99S+hukQhlFyBqTV9fKQ9UndvHQGxvMFA==
X-Received: by 2002:a05:6512:33cb:: with SMTP id
 d11mr2097111lfg.180.1622795551966; 
 Fri, 04 Jun 2021 01:32:31 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i127sm544870lfd.216.2021.06.04.01.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Jun 2021 01:32:31 -0700 (PDT)
Subject: Re: [RESEND 10/26] drm/msm/disp/dpu1/dpu_hw_interrupts: Demote a
 bunch of kernel-doc abuses
To: Lee Jones <lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-11-lee.jones@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <85bd6c24-0e4e-6f18-ccf0-6acf62d0f0ff@linaro.org>
Date: Fri, 4 Jun 2021 11:32:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-11-lee.jones@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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
Cc: Krishna Manikandan <mkrishn@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2021 17:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17: warning: expecting prototype for Register offsets in MDSS register file for the interrupt registers(). Prototype was for MDP_SSPP_TOP0_OFF() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:35: warning: expecting prototype for WB interrupt status bit definitions(). Prototype was for DPU_INTR_WB_0_DONE() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:42: warning: expecting prototype for WDOG timer interrupt status bit definitions(). Prototype was for DPU_INTR_WD_TIMER_0_DONE() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:51: warning: expecting prototype for Pingpong interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_DONE() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:71: warning: expecting prototype for Interface interrupt status bit definitions(). Prototype was for DPU_INTR_INTF_0_UNDERRUN() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:85: warning: expecting prototype for Pingpong Secondary interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:94: warning: expecting prototype for Pingpong TEAR detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TEAR_DETECTED() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:102: warning: expecting prototype for Pingpong TE detection interrupt status bit definitions(). Prototype was for DPU_INTR_PING_PONG_0_TE_DETECTED() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:110: warning: expecting prototype for Ctl start interrupt status bit definitions(). Prototype was for DPU_INTR_CTL_0_START() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:119: warning: expecting prototype for Concurrent WB overflow interrupt status bit definitions(). Prototype was for DPU_INTR_CWB_2_OVERFLOW() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:125: warning: expecting prototype for Histogram VIG done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_DONE() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:133: warning: expecting prototype for Histogram VIG reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_VIG_0_RSTSEQ_DONE() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:141: warning: expecting prototype for Histogram DSPP done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_DONE() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:149: warning: expecting prototype for Histogram DSPP reset Sequence done interrupt status bit definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:157: warning: expecting prototype for INTF interrupt status bit definitions(). Prototype was for DPU_INTR_VIDEO_INTO_STATIC() instead
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:170: warning: expecting prototype for AD4 interrupt status bit definitions(). Prototype was for DPU_INTR_BACKLIGHT_UPDATED() instead

Most of these defines are gone in msm/msm-next. Could you please rebase 
and repost just this patch? Other patches apply clearly.

> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
> ---
>   .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 32 +++++++++----------
>   1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 48c96b8121268..aaf251741dc27 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -10,7 +10,7 @@
>   #include "dpu_hw_util.h"
>   #include "dpu_hw_mdss.h"
>   
> -/**
> +/*
>    * Register offsets in MDSS register file for the interrupt registers
>    * w.r.t. to the MDP base
>    */
> @@ -29,14 +29,14 @@
>   #define MDP_INTF_1_OFF_REV_7xxx             0x35000
>   #define MDP_INTF_5_OFF_REV_7xxx             0x39000
>   
> -/**
> +/*
>    * WB interrupt status bit definitions
>    */
>   #define DPU_INTR_WB_0_DONE BIT(0)
>   #define DPU_INTR_WB_1_DONE BIT(1)
>   #define DPU_INTR_WB_2_DONE BIT(4)
>   
> -/**
> +/*
>    * WDOG timer interrupt status bit definitions
>    */
>   #define DPU_INTR_WD_TIMER_0_DONE BIT(2)
> @@ -45,7 +45,7 @@
>   #define DPU_INTR_WD_TIMER_3_DONE BIT(6)
>   #define DPU_INTR_WD_TIMER_4_DONE BIT(7)
>   
> -/**
> +/*
>    * Pingpong interrupt status bit definitions
>    */
>   #define DPU_INTR_PING_PONG_0_DONE BIT(8)
> @@ -65,7 +65,7 @@
>   #define DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE BIT(22)
>   #define DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE BIT(23)
>   
> -/**
> +/*
>    * Interface interrupt status bit definitions
>    */
>   #define DPU_INTR_INTF_0_UNDERRUN BIT(24)
> @@ -79,7 +79,7 @@
>   #define DPU_INTR_INTF_3_VSYNC BIT(31)
>   #define DPU_INTR_INTF_5_VSYNC BIT(23)
>   
> -/**
> +/*
>    * Pingpong Secondary interrupt status bit definitions
>    */
>   #define DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE BIT(0)
> @@ -88,7 +88,7 @@
>   #define DPU_INTR_PING_PONG_S0_TEAR_DETECTED BIT(22)
>   #define DPU_INTR_PING_PONG_S0_TE_DETECTED BIT(28)
>   
> -/**
> +/*
>    * Pingpong TEAR detection interrupt status bit definitions
>    */
>   #define DPU_INTR_PING_PONG_0_TEAR_DETECTED BIT(16)
> @@ -96,7 +96,7 @@
>   #define DPU_INTR_PING_PONG_2_TEAR_DETECTED BIT(18)
>   #define DPU_INTR_PING_PONG_3_TEAR_DETECTED BIT(19)
>   
> -/**
> +/*
>    * Pingpong TE detection interrupt status bit definitions
>    */
>   #define DPU_INTR_PING_PONG_0_TE_DETECTED BIT(24)
> @@ -104,7 +104,7 @@
>   #define DPU_INTR_PING_PONG_2_TE_DETECTED BIT(26)
>   #define DPU_INTR_PING_PONG_3_TE_DETECTED BIT(27)
>   
> -/**
> +/*
>    * Ctl start interrupt status bit definitions
>    */
>   #define DPU_INTR_CTL_0_START BIT(9)
> @@ -113,13 +113,13 @@
>   #define DPU_INTR_CTL_3_START BIT(12)
>   #define DPU_INTR_CTL_4_START BIT(13)
>   
> -/**
> +/*
>    * Concurrent WB overflow interrupt status bit definitions
>    */
>   #define DPU_INTR_CWB_2_OVERFLOW BIT(14)
>   #define DPU_INTR_CWB_3_OVERFLOW BIT(15)
>   
> -/**
> +/*
>    * Histogram VIG done interrupt status bit definitions
>    */
>   #define DPU_INTR_HIST_VIG_0_DONE BIT(0)
> @@ -127,7 +127,7 @@
>   #define DPU_INTR_HIST_VIG_2_DONE BIT(8)
>   #define DPU_INTR_HIST_VIG_3_DONE BIT(10)
>   
> -/**
> +/*
>    * Histogram VIG reset Sequence done interrupt status bit definitions
>    */
>   #define DPU_INTR_HIST_VIG_0_RSTSEQ_DONE BIT(1)
> @@ -135,7 +135,7 @@
>   #define DPU_INTR_HIST_VIG_2_RSTSEQ_DONE BIT(9)
>   #define DPU_INTR_HIST_VIG_3_RSTSEQ_DONE BIT(11)
>   
> -/**
> +/*
>    * Histogram DSPP done interrupt status bit definitions
>    */
>   #define DPU_INTR_HIST_DSPP_0_DONE BIT(12)
> @@ -143,7 +143,7 @@
>   #define DPU_INTR_HIST_DSPP_2_DONE BIT(20)
>   #define DPU_INTR_HIST_DSPP_3_DONE BIT(22)
>   
> -/**
> +/*
>    * Histogram DSPP reset Sequence done interrupt status bit definitions
>    */
>   #define DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE BIT(13)
> @@ -151,7 +151,7 @@
>   #define DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE BIT(21)
>   #define DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE BIT(23)
>   
> -/**
> +/*
>    * INTF interrupt status bit definitions
>    */
>   #define DPU_INTR_VIDEO_INTO_STATIC BIT(0)
> @@ -164,7 +164,7 @@
>   #define DPU_INTR_DSICMD_2_OUTOF_STATIC BIT(7)
>   #define DPU_INTR_PROG_LINE BIT(8)
>   
> -/**
> +/*
>    * AD4 interrupt status bit definitions
>    */
>   #define DPU_INTR_BACKLIGHT_UPDATED BIT(0)
> 


-- 
With best wishes
Dmitry
