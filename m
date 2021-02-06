Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D000311795
	for <lists+dri-devel@lfdr.de>; Sat,  6 Feb 2021 01:05:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B736F6F525;
	Sat,  6 Feb 2021 00:05:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so15.mailgun.net (so15.mailgun.net [198.61.254.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576606F52A
 for <dri-devel@lists.freedesktop.org>; Sat,  6 Feb 2021 00:05:02 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1612569902; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=+/uIP87vJEaaYUqbVLHKGTP87A5yWxtIFnA2Yl8Y65Y=;
 b=kM4CZe6SwjaiQ3FXMqpb32KP36afwBPACSFqD7pkR4jq9BiG5krUyJeeAdedPYR1goAgWkcd
 bqbmPBuOqfifYJzQgENzUd0RT5Ns8p4wu6M2ExxAOjiRe0i6mMK23Xcj9mId/iClH1bSzxFL
 0A9iAYXGDbVOd05FmV5Qpk2B1Zs=
X-Mailgun-Sending-Ip: 198.61.254.15
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 601ddd2d8e43a988b7a034cf (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Sat, 06 Feb 2021 00:05:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id AB4A3C43467; Sat,  6 Feb 2021 00:05:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA5EEC433ED;
 Sat,  6 Feb 2021 00:04:59 +0000 (UTC)
MIME-Version: 1.0
Date: Fri, 05 Feb 2021 16:04:59 -0800
From: abhinavk@codeaurora.org
To: Yang Li <yang.lee@linux.alibaba.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: remove unneeded semicolon
In-Reply-To: <1612321727-25156-1-git-send-email-yang.lee@linux.alibaba.com>
References: <1612321727-25156-1-git-send-email-yang.lee@linux.alibaba.com>
Message-ID: <4efdd6c16dacc1909c9253c355c3c810@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean@poorly.run
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-02-02 19:08, Yang Li wrote:
> Eliminate the following coccicheck warning:
> ./drivers/gpu/drm/msm/dp/dp_ctrl.c:1161:2-3: Unneeded semicolon
> 
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c 
> b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index e3462f5..61ed67b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1158,7 +1158,7 @@ static int dp_ctrl_link_rate_down_shift(struct
> dp_ctrl_private *ctrl)
>  	default:
>  		ret = -EINVAL;
>  		break;
> -	};
> +	}
> 
>  	if (!ret)
>  		DRM_DEBUG_DP("new rate=0x%x\n", ctrl->link->link_params.rate);
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
