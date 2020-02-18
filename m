Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C447D1636DA
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2020 00:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7A96EADE;
	Tue, 18 Feb 2020 23:06:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail26.static.mailgun.info (mail26.static.mailgun.info
 [104.130.122.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB12E6EADF
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Feb 2020 23:06:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1582067192; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Cc: To: From: Date: Sender;
 bh=c/Gl/+xaod6PXrjWKtPB7ywUhpAOGRUPvcwLQULGdyg=;
 b=toTVb7sJ+cWSxHu3T7oGCcA/Jx1L4kQgJOctoZXodiCkq+cJc95T8CU1ffjgrQWlxoDBlaoV
 5JTtjL8r+kW5QEODAWsm4FT3E7XiHv+RX5Ogi5r/Z6vL6MTyla5YPZ7DGWaMSnoT5iWiMoxA
 ntulsEgzhmcFOrvhLbZy3t3n03Q=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4c6df7.7fc5368d6998-smtp-out-n03;
 Tue, 18 Feb 2020 23:06:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 6E3AEC447A3; Tue, 18 Feb 2020 23:06:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from jcrouse1-lnx.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: jcrouse)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id D5598C4479C;
 Tue, 18 Feb 2020 23:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D5598C4479C
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date: Tue, 18 Feb 2020 16:06:27 -0700
From: Jordan Crouse <jcrouse@codeaurora.org>
To: Rob Clark <robdclark@gmail.com>
Subject: Re: [Freedreno] [PATCH] drm/msm: devcoredump should dump
 MSM_SUBMIT_BO_DUMP buffers
Message-ID: <20200218230627.GA8715@jcrouse1-lnx.qualcomm.com>
Mail-Followup-To: Rob Clark <robdclark@gmail.com>,
 dri-devel@lists.freedesktop.org, Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>
References: <20200218210021.1066100-1-robdclark@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200218210021.1066100-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 18, 2020 at 01:00:21PM -0800, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Also log buffers with the DUMP flag set, to ensure we capture all useful
> cmdstream in crashdump state with modern mesa.
> 
> Otherwise we miss out on the contents of "state object" cmdstream
> buffers.

One nit, but with that:

Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>

> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/gpu/drm/msm/msm_gem.h | 10 ++++++++++
>  drivers/gpu/drm/msm/msm_gpu.c | 28 +++++++++++++++++++++++-----
>  drivers/gpu/drm/msm/msm_rd.c  |  8 +-------
>  3 files changed, 34 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
> index 9e0953c2b7ce..22b4ccd7bb28 100644
> --- a/drivers/gpu/drm/msm/msm_gem.h
> +++ b/drivers/gpu/drm/msm/msm_gem.h
> @@ -160,4 +160,14 @@ struct msm_gem_submit {
>  	} bos[0];
>  };
>  
> +/* helper to determine of a buffer in submit should be dumped, used for both
> + * devcoredump and debugfs cmdstream dumping:
> + */
> +static bool

Static inline? Surprised you didn't get an unused warning or two.

> +should_dump(struct msm_gem_submit *submit, int idx)
> +{
> +	extern bool rd_full;
> +	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
> +}
> +
>  #endif /* __MSM_GEM_H__ */
> diff --git a/drivers/gpu/drm/msm/msm_gpu.c b/drivers/gpu/drm/msm/msm_gpu.c
> index 18f3a5c53ffb..615c5cda5389 100644
> --- a/drivers/gpu/drm/msm/msm_gpu.c
> +++ b/drivers/gpu/drm/msm/msm_gpu.c
> @@ -355,16 +355,34 @@ static void msm_gpu_crashstate_capture(struct msm_gpu *gpu,
>  	state->cmd = kstrdup(cmd, GFP_KERNEL);
>  
>  	if (submit) {
> -		int i;
> -
> -		state->bos = kcalloc(submit->nr_cmds,
> +		int i, nr = 0;
> +
> +		/* count # of buffers to dump: */
> +		for (i = 0; i < submit->nr_bos; i++)
> +			if (should_dump(submit, i))
> +				nr++;
> +		/* always dump cmd bo's, but don't double count them: */
> +		for (i = 0; i < submit->nr_cmds; i++)
> +			if (!should_dump(submit, submit->cmd[i].idx))
> +				nr++;
> +
> +		state->bos = kcalloc(nr,
>  			sizeof(struct msm_gpu_state_bo), GFP_KERNEL);
>  
> +		for (i = 0; i < submit->nr_bos; i++) {
> +			if (should_dump(submit, i)) {
> +				msm_gpu_crashstate_get_bo(state, submit->bos[i].obj,
> +					submit->bos[i].iova, submit->bos[i].flags);
> +			}
> +		}
> +
>  		for (i = 0; state->bos && i < submit->nr_cmds; i++) {
>  			int idx = submit->cmd[i].idx;
>  
> -			msm_gpu_crashstate_get_bo(state, submit->bos[idx].obj,
> -				submit->bos[idx].iova, submit->bos[idx].flags);
> +			if (!should_dump(submit, submit->cmd[i].idx)) {
> +				msm_gpu_crashstate_get_bo(state, submit->bos[idx].obj,
> +					submit->bos[idx].iova, submit->bos[idx].flags);
> +			}
>  		}
>  	}
>  
> diff --git a/drivers/gpu/drm/msm/msm_rd.c b/drivers/gpu/drm/msm/msm_rd.c
> index af7ceb246c7c..732f65df5c4f 100644
> --- a/drivers/gpu/drm/msm/msm_rd.c
> +++ b/drivers/gpu/drm/msm/msm_rd.c
> @@ -43,7 +43,7 @@
>  #include "msm_gpu.h"
>  #include "msm_gem.h"
>  
> -static bool rd_full = false;
> +bool rd_full = false;
>  MODULE_PARM_DESC(rd_full, "If true, $debugfs/.../rd will snapshot all buffer contents");
>  module_param_named(rd_full, rd_full, bool, 0600);
>  
> @@ -336,12 +336,6 @@ static void snapshot_buf(struct msm_rd_state *rd,
>  	msm_gem_put_vaddr(&obj->base);
>  }
>  
> -static bool
> -should_dump(struct msm_gem_submit *submit, int idx)
> -{
> -	return rd_full || (submit->bos[idx].flags & MSM_SUBMIT_BO_DUMP);
> -}
> -
>  /* called under struct_mutex */
>  void msm_rd_dump_submit(struct msm_rd_state *rd, struct msm_gem_submit *submit,
>  		const char *fmt, ...)
> -- 
> 2.24.1
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
