Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377A23C1DBD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 05:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3009E6E954;
	Fri,  9 Jul 2021 03:10:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB4DA6E95B
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 03:10:16 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625800216; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=gNgKFi+Rx9humaRZZCWImHDoeRjYG58E4EAJrmsAsoY=;
 b=Uw4h5Cdr6p+MxXawd7c1prSMHiFPjJZSK3zElYRPoFMBXAIRjMrpHsipC4iesMA6gr715h0I
 ZSHJz/Lx0XysWgdEgZf/0whm+U5B9uMR0uiFhhDbPEAez4g2HIhoYZLMt86rCDi2CgcEMICD
 7F9t+a+m9ZaVLES7o1cSDZiFoYw=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60e7be1601dd9a94317d8228 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 03:10:14
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id BE0C4C4338A; Fri,  9 Jul 2021 03:10:14 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 0A96CC433D3;
 Fri,  9 Jul 2021 03:10:12 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 08 Jul 2021 20:10:12 -0700
From: abhinavk@codeaurora.org
To: Souptick Joarder <jrdr.linux@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: Remove unused variable
In-Reply-To: <20210709024834.29680-1-jrdr.linux@gmail.com>
References: <20210709024834.29680-1-jrdr.linux@gmail.com>
Message-ID: <63f89dfce0b33d16c3f774e2a1962b03@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, kernel test robot <lkp@intel.com>,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 tanmay@codeaurora.org, swboyd@chromium.org, khsieh@codeaurora.org,
 dri-devel@lists.freedesktop.org, dmitry.baryshkov@linaro.org, sean@poorly.run,
 chandanu@codeaurora.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-08 19:48, Souptick Joarder wrote:
> Kernel test roobot throws below warning ->
> 
> drivers/gpu/drm/msm/dp/dp_display.c:1017:21:
> warning: variable 'drm' set but not used [-Wunused-but-set-variable]
> 
> Removed unused variable drm.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Souptick Joarder <jrdr.linux@gmail.com>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 051c1be1de7e..d42635a86d20 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1014,10 +1014,8 @@ int dp_display_get_test_bpp(struct msm_dp *dp)
>  void msm_dp_snapshot(struct msm_disp_state *disp_state, struct msm_dp 
> *dp)
>  {
>  	struct dp_display_private *dp_display;
> -	struct drm_device *drm;
> 
>  	dp_display = container_of(dp, struct dp_display_private, dp_display);
> -	drm = dp->drm_dev;
> 
>  	/*
>  	 * if we are reading registers we need the link clocks to be on
