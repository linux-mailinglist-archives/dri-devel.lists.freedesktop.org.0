Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B5D4246CB5
	for <lists+dri-devel@lfdr.de>; Mon, 17 Aug 2020 18:26:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3229F899AB;
	Mon, 17 Aug 2020 16:26:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail29.static.mailgun.info (mail29.static.mailgun.info
 [104.130.122.29])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3351899AB
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Aug 2020 16:26:04 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1597681566; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=3AJR1rabANV+5oYOKdD6QLeJhKliqDUS2dV6N7xL9LU=;
 b=qKqalnObtWsNHT0mmsG1cf1KX32qxF36UdanWArZtAn5yAvh/+6nBpeye9xGLTyrwKVfeZaR
 xdjSsTe4PKYq3VUu7SLfJW0AWo9OTYFVrxjf0AiTyKIktLqC888BY4XkyE3HWhATFR75tzRL
 WQP4pt+Z/2sG4QHBldjbOVmu1lQ=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-east-1.postgun.com with SMTP id
 5f3aaf9a61f1d41834ee7a4f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 17 Aug 2020 16:26:02
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B3A5AC4339C; Mon, 17 Aug 2020 16:26:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
 autolearn=ham autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3201BC433C6;
 Mon, 17 Aug 2020 16:26:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3201BC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Mon, 17 Aug 2020 10:25:57 -0600
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [PATCH] drm/msm/adreno: fix updating ring fence
Message-ID: <20200817162556.GD3221@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>,
 Brian Masney <masneyb@onstation.org>, Takashi Iwai <tiwai@suse.de>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>
References: <20200813000311.708728-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200813000311.708728-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>,
 Brian Masney <masneyb@onstation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Aug 12, 2020 at 05:03:09PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We need to set it to the most recent completed fence, not the most
> recent submitted.  Otherwise we have races where we think we can retire
> submits that the GPU is not finished with, if the GPU doesn't manage to
> overwrite the seqno before we look at it.
> 
> This can show up with hang recovery if one of the submits after the
> crashing submit also hangs after it is replayed.

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Fixes: f97decac5f4c ("drm/msm: Support multiple ringbuffers")
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> index f9e3badf2fca..34e6242c1767 100644
> --- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> +++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
> @@ -405,7 +405,7 @@ int adreno_hw_init(struct msm_gpu *gpu)
>  		ring->next = ring->start;
>  
>  		/* reset completed fence seqno: */
> -		ring->memptrs->fence = ring->seqno;
> +		ring->memptrs->fence = ring->fctx->completed_fence;
>  		ring->memptrs->rptr = 0;
>  	}
>  
> -- 
> 2.26.2
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
