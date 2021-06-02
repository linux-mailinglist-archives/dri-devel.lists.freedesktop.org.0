Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D988F3991C1
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 19:33:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFBAA6EE21;
	Wed,  2 Jun 2021 17:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C71AA6EE21
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 17:33:10 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1622655193; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=2KQ5pbUkuVLz0g4ULlzdLTQV82EOvasoEirQWds9J0I=;
 b=LC+HvUm/2NPOsDGsF1oMaZldjemkIucigpqT03t+Fh5bZBeoWNtmPeWa4pFTbhrIbRod6+xn
 ps5Hbo20zG+sArnf8MHFLa02IJ9q2adPzV5wybAf/xBF9lM4cmOABJ0q8ynQ5xmblS6oZdNc
 LtH4vTqPcZBDv609zWOmBbmP2xw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 60b7c0d06ddc3305c4536914 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 02 Jun 2021 17:33:04
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id C75C9C433D3; Wed,  2 Jun 2021 17:33:03 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 695D9C43217;
 Wed,  2 Jun 2021 17:33:02 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 02 Jun 2021 10:33:02 -0700
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [RESEND 10/26] drm/msm/disp/dpu1/dpu_hw_interrupts:
 Demote a bunch of kernel-doc abuses
In-Reply-To: <20210602143300.2330146-11-lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-11-lee.jones@linaro.org>
Message-ID: <b0ee71fedeacd0c7efc4fcb406b085c6@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
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
Cc: Sean Paul <sean@poorly.run>, Krishna Manikandan <mkrishn@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-06-02 07:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:17: warning:
> expecting prototype for Register offsets in MDSS register file for the
> interrupt registers(). Prototype was for MDP_SSPP_TOP0_OFF() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:35: warning:
> expecting prototype for WB interrupt status bit definitions().
> Prototype was for DPU_INTR_WB_0_DONE() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:42: warning:
> expecting prototype for WDOG timer interrupt status bit definitions().
> Prototype was for DPU_INTR_WD_TIMER_0_DONE() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:51: warning:
> expecting prototype for Pingpong interrupt status bit definitions().
> Prototype was for DPU_INTR_PING_PONG_0_DONE() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:71: warning:
> expecting prototype for Interface interrupt status bit definitions().
> Prototype was for DPU_INTR_INTF_0_UNDERRUN() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:85: warning:
> expecting prototype for Pingpong Secondary interrupt status bit
> definitions(). Prototype was for
> DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:94: warning:
> expecting prototype for Pingpong TEAR detection interrupt status bit
> definitions(). Prototype was for DPU_INTR_PING_PONG_0_TEAR_DETECTED()
> instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:102: warning:
> expecting prototype for Pingpong TE detection interrupt status bit
> definitions(). Prototype was for DPU_INTR_PING_PONG_0_TE_DETECTED()
> instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:110: warning:
> expecting prototype for Ctl start interrupt status bit definitions().
> Prototype was for DPU_INTR_CTL_0_START() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:119: warning:
> expecting prototype for Concurrent WB overflow interrupt status bit
> definitions(). Prototype was for DPU_INTR_CWB_2_OVERFLOW() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:125: warning:
> expecting prototype for Histogram VIG done interrupt status bit
> definitions(). Prototype was for DPU_INTR_HIST_VIG_0_DONE() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:133: warning:
> expecting prototype for Histogram VIG reset Sequence done interrupt
> status bit definitions(). Prototype was for
> DPU_INTR_HIST_VIG_0_RSTSEQ_DONE() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:141: warning:
> expecting prototype for Histogram DSPP done interrupt status bit
> definitions(). Prototype was for DPU_INTR_HIST_DSPP_0_DONE() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:149: warning:
> expecting prototype for Histogram DSPP reset Sequence done interrupt
> status bit definitions(). Prototype was for
> DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:157: warning:
> expecting prototype for INTF interrupt status bit definitions().
> Prototype was for DPU_INTR_VIDEO_INTO_STATIC() instead
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:170: warning:
> expecting prototype for AD4 interrupt status bit definitions().
> Prototype was for DPU_INTR_BACKLIGHT_UPDATED() instead
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Krishna Manikandan <mkrishn@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 48c96b8121268..aaf251741dc27 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -10,7 +10,7 @@
>  #include "dpu_hw_util.h"
>  #include "dpu_hw_mdss.h"
> 
> -/**
> +/*
>   * Register offsets in MDSS register file for the interrupt registers
>   * w.r.t. to the MDP base
>   */
> @@ -29,14 +29,14 @@
>  #define MDP_INTF_1_OFF_REV_7xxx             0x35000
>  #define MDP_INTF_5_OFF_REV_7xxx             0x39000
> 
> -/**
> +/*
>   * WB interrupt status bit definitions
>   */
>  #define DPU_INTR_WB_0_DONE BIT(0)
>  #define DPU_INTR_WB_1_DONE BIT(1)
>  #define DPU_INTR_WB_2_DONE BIT(4)
> 
> -/**
> +/*
>   * WDOG timer interrupt status bit definitions
>   */
>  #define DPU_INTR_WD_TIMER_0_DONE BIT(2)
> @@ -45,7 +45,7 @@
>  #define DPU_INTR_WD_TIMER_3_DONE BIT(6)
>  #define DPU_INTR_WD_TIMER_4_DONE BIT(7)
> 
> -/**
> +/*
>   * Pingpong interrupt status bit definitions
>   */
>  #define DPU_INTR_PING_PONG_0_DONE BIT(8)
> @@ -65,7 +65,7 @@
>  #define DPU_INTR_PING_PONG_2_AUTOREFRESH_DONE BIT(22)
>  #define DPU_INTR_PING_PONG_3_AUTOREFRESH_DONE BIT(23)
> 
> -/**
> +/*
>   * Interface interrupt status bit definitions
>   */
>  #define DPU_INTR_INTF_0_UNDERRUN BIT(24)
> @@ -79,7 +79,7 @@
>  #define DPU_INTR_INTF_3_VSYNC BIT(31)
>  #define DPU_INTR_INTF_5_VSYNC BIT(23)
> 
> -/**
> +/*
>   * Pingpong Secondary interrupt status bit definitions
>   */
>  #define DPU_INTR_PING_PONG_S0_AUTOREFRESH_DONE BIT(0)
> @@ -88,7 +88,7 @@
>  #define DPU_INTR_PING_PONG_S0_TEAR_DETECTED BIT(22)
>  #define DPU_INTR_PING_PONG_S0_TE_DETECTED BIT(28)
> 
> -/**
> +/*
>   * Pingpong TEAR detection interrupt status bit definitions
>   */
>  #define DPU_INTR_PING_PONG_0_TEAR_DETECTED BIT(16)
> @@ -96,7 +96,7 @@
>  #define DPU_INTR_PING_PONG_2_TEAR_DETECTED BIT(18)
>  #define DPU_INTR_PING_PONG_3_TEAR_DETECTED BIT(19)
> 
> -/**
> +/*
>   * Pingpong TE detection interrupt status bit definitions
>   */
>  #define DPU_INTR_PING_PONG_0_TE_DETECTED BIT(24)
> @@ -104,7 +104,7 @@
>  #define DPU_INTR_PING_PONG_2_TE_DETECTED BIT(26)
>  #define DPU_INTR_PING_PONG_3_TE_DETECTED BIT(27)
> 
> -/**
> +/*
>   * Ctl start interrupt status bit definitions
>   */
>  #define DPU_INTR_CTL_0_START BIT(9)
> @@ -113,13 +113,13 @@
>  #define DPU_INTR_CTL_3_START BIT(12)
>  #define DPU_INTR_CTL_4_START BIT(13)
> 
> -/**
> +/*
>   * Concurrent WB overflow interrupt status bit definitions
>   */
>  #define DPU_INTR_CWB_2_OVERFLOW BIT(14)
>  #define DPU_INTR_CWB_3_OVERFLOW BIT(15)
> 
> -/**
> +/*
>   * Histogram VIG done interrupt status bit definitions
>   */
>  #define DPU_INTR_HIST_VIG_0_DONE BIT(0)
> @@ -127,7 +127,7 @@
>  #define DPU_INTR_HIST_VIG_2_DONE BIT(8)
>  #define DPU_INTR_HIST_VIG_3_DONE BIT(10)
> 
> -/**
> +/*
>   * Histogram VIG reset Sequence done interrupt status bit definitions
>   */
>  #define DPU_INTR_HIST_VIG_0_RSTSEQ_DONE BIT(1)
> @@ -135,7 +135,7 @@
>  #define DPU_INTR_HIST_VIG_2_RSTSEQ_DONE BIT(9)
>  #define DPU_INTR_HIST_VIG_3_RSTSEQ_DONE BIT(11)
> 
> -/**
> +/*
>   * Histogram DSPP done interrupt status bit definitions
>   */
>  #define DPU_INTR_HIST_DSPP_0_DONE BIT(12)
> @@ -143,7 +143,7 @@
>  #define DPU_INTR_HIST_DSPP_2_DONE BIT(20)
>  #define DPU_INTR_HIST_DSPP_3_DONE BIT(22)
> 
> -/**
> +/*
>   * Histogram DSPP reset Sequence done interrupt status bit definitions
>   */
>  #define DPU_INTR_HIST_DSPP_0_RSTSEQ_DONE BIT(13)
> @@ -151,7 +151,7 @@
>  #define DPU_INTR_HIST_DSPP_2_RSTSEQ_DONE BIT(21)
>  #define DPU_INTR_HIST_DSPP_3_RSTSEQ_DONE BIT(23)
> 
> -/**
> +/*
>   * INTF interrupt status bit definitions
>   */
>  #define DPU_INTR_VIDEO_INTO_STATIC BIT(0)
> @@ -164,7 +164,7 @@
>  #define DPU_INTR_DSICMD_2_OUTOF_STATIC BIT(7)
>  #define DPU_INTR_PROG_LINE BIT(8)
> 
> -/**
> +/*
>   * AD4 interrupt status bit definitions
>   */
>  #define DPU_INTR_BACKLIGHT_UPDATED BIT(0)
