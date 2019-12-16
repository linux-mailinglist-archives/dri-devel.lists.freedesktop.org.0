Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8FAA120E6F
	for <lists+dri-devel@lfdr.de>; Mon, 16 Dec 2019 16:53:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB656E5CA;
	Mon, 16 Dec 2019 15:53:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail25.static.mailgun.info (mail25.static.mailgun.info
 [104.130.122.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4CF1F6E5CA
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Dec 2019 15:53:55 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1576511635; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=D61wg0YKs0GJoXGtAmt02CkXp7OUcIuxpmefn8nqekE=;
 b=jXs6yZQKgTzIy53s2BfAvLTIp//7+tZ78KsuarDW77Gt/6ENa49J6kmkvv2eKuAVv9N0X08X
 QzRwjoiESUll5XqEf2ex3rkc6AENC4XGR1yDOyIx11P+sBizIvGxzpiXvGKcdfQ7vOLs32bl
 srWbG2hp+witdWDEClOTYbbJz3Y=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5df7a764.7feddbcf0df8-smtp-out-n03;
 Mon, 16 Dec 2019 15:48:52 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9C61DC447A2; Mon, 16 Dec 2019 15:48:51 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 6BC29C4479D;
 Mon, 16 Dec 2019 15:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6BC29C4479D
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 16 Dec 2019 08:48:48 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: zhengbin <zhengbin13@huawei.com>
Subject: Re: [PATCH 3/4] drm/msm/dpu: Remove unneeded semicolon in dpu_plane.c
Message-ID: <20191216154848.GC487@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: zhengbin <zhengbin13@huawei.com>, robdclark@gmail.com,
 sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <1576315910-124558-1-git-send-email-zhengbin13@huawei.com>
 <1576315910-124558-4-git-send-email-zhengbin13@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1576315910-124558-4-git-send-email-zhengbin13@huawei.com>
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Dec 14, 2019 at 05:31:49PM +0800, zhengbin wrote:
> Fixes coccicheck warning:
> 
> drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c:741:2-3: Unneeded semicolon
> 

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: zhengbin <zhengbin13@huawei.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 58d5acb..8d4fdc3 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -738,7 +738,7 @@ int dpu_plane_validate_multirect_v2(struct dpu_multirect_plane_states *plane)
>  	} else {
>  		pstate[R0]->multirect_index = DPU_SSPP_RECT_0;
>  		pstate[R1]->multirect_index = DPU_SSPP_RECT_1;
> -	};
> +	}
> 
>  	DPU_DEBUG_PLANE(dpu_plane[R0], "R0: %d - %d\n",
>  		pstate[R0]->multirect_mode, pstate[R0]->multirect_index);
> --
> 2.7.4
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
