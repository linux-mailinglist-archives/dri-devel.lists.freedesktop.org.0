Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 11C562C8FE9
	for <lists+dri-devel@lfdr.de>; Mon, 30 Nov 2020 22:23:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23F436E8C4;
	Mon, 30 Nov 2020 21:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE4CD6E8C4
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Nov 2020 21:23:24 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606771406; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dbZGdUcFmNG53loMl2JmT/iUQISOLMxPK14YsDoFSQ4=;
 b=u4QVxJFYqIwrS1KynwbbnYXHjgqCUl4P7JGArKIJJtHpk8uVhwmMQS0i8tHFlcSx0HQ6TK2H
 g1GhqIkyqObT6jCgRxAxZ7X4DVHxiuo2EDkphhBDf8vFY3R9tNcOIVqpk+ylxwioHB+lzqzs
 gp0LlPwIEXbKduv5OiuNcdgJxS0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fc562c6f653ea0cd8e3cb3b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 21:23:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 86B37C43460; Mon, 30 Nov 2020 21:23:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 1DE4BC433ED;
 Mon, 30 Nov 2020 21:23:17 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 30 Nov 2020 13:23:17 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH 15/40] drm/msm/disp/dpu1/dpu_hw_interrupts: Demote
 kernel-doc formatting misuse
In-Reply-To: <20201126134240.3214176-16-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
 <20201126134240.3214176-16-lee.jones@linaro.org>
Message-ID: <7ecb21f6b65de4014b2bbe9dcc5762a0@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, Shubhashree Dhar <dhar@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-26 05:42, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:246: error: Cannot
> parse struct or union!
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:756: error: Cannot
> parse struct or union!
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Shubhashree Dhar <dhar@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> index 38482b1047745..5c521de715670 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
> @@ -189,7 +189,7 @@ struct dpu_irq_type {
>  	u32 reg_idx;
>  };
> 
> -/**
> +/*
>   * struct dpu_intr_reg -  List of DPU interrupt registers
>   */
>  static const struct dpu_intr_reg dpu_intr_set[] = {
> @@ -245,7 +245,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
>  	}
>  };
> 
> -/**
> +/*
>   * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx 
> in this
>   *			 table that have a matching interface type and
>   *			 instance index.
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
