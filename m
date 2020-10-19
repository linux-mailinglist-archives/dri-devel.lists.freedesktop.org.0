Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF982929C1
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 16:49:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA2576E9D7;
	Mon, 19 Oct 2020 14:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m42-4.mailgun.net (m42-4.mailgun.net [69.72.42.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30DCF6E9E8
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Oct 2020 14:49:29 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1603118971; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=SdjfHLMdpVTBMrEL+U0iqbpL1vfRm8mz6fh4D3U3ygg=;
 b=lUWq0qUyYjPeaByDmLLik0Bz95+MyV/0AZ771vk0MWPVG/8LpiIPbEAPW4VHjkB0/1/1ywK9
 x8eJUQNzj9XeBJEIiAV1/EPYfs+BSC3+5rQzgB96QMs3BWRP1p3lHfGogb1dYhOwC88dx7qP
 JFZ/EqWJJ6hXoQ5XMZhNWFL4TS0=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-west-2.postgun.com with SMTP id
 5f8da772ad37af35ec004d71 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 19 Oct 2020 14:49:22
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BB4A8C433C9; Mon, 19 Oct 2020 14:49:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED, BAYES_00,
 SPF_FAIL, 
 URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 62E40C433CB;
 Mon, 19 Oct 2020 14:49:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 62E40C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 19 Oct 2020 08:49:17 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Tian Tao <tiantao6@hisilicon.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: Remove redundant null check
Message-ID: <20201019144917.GA31882@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Tian Tao <tiantao6@hisilicon.com>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <1603087462-37505-1-git-send-email-tiantao6@hisilicon.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1603087462-37505-1-git-send-email-tiantao6@hisilicon.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 19, 2020 at 02:04:22PM +0800, Tian Tao wrote:
> clk_prepare_enable() and clk_disable_unprepare() will check
> NULL clock parameter, so It is not necessary to add additional checks.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
> ---
>  drivers/gpu/drm/msm/msm_gpu.c | 7 ++-----
>  1 file changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 57ddc94..25bc654 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -175,15 +175,12 @@ static int disable_clk(struct msm_gpu *gpu)
>  
>  static int enable_axi(struct msm_gpu *gpu)
>  {
> -	if (gpu->ebi1_clk)
> -		clk_prepare_enable(gpu->ebi1_clk);
> -	return 0;
> +	return clk_prepare_enable(gpu->ebi1_clk);
>  }
>  
>  static int disable_axi(struct msm_gpu *gpu)
>  {
> -	if (gpu->ebi1_clk)
> -		clk_disable_unprepare(gpu->ebi1_clk);
> +	clk_disable_unprepare(gpu->ebi1_clk);
>  	return 0;
>  }
>  
> -- 
> 2.7.4
> 
> _______________________________________________
> Freedreno mailing list
> Freedreno@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/freedreno

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
