Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AF93436D6B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 00:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D4776E4D4;
	Thu, 21 Oct 2021 22:25:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from so254-9.mailgun.net (so254-9.mailgun.net [198.61.254.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89E066E4D4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Oct 2021 22:25:19 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1634855119; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=oy4Ke29RPvTBtTqqlrgVweNHxSdPx8fieD6oBcjg70c=;
 b=Q7d1RDh2sMJLbiWus6AwHyRX0pPfh8pTJJ/7Sks3Tepofqx8mFRWOKcIF/9YtLUJYEmdz1eP
 0v0Q6epURfNFdKMSEr9WyU0aMJp+lB868oAMAHgrlmGaEVs6YbuOCoidt42BeBnK60+VfWif
 +EgcEHkyFtY3JiZXXX1XL+Pe+1o=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6171e8ce5ca800b6c1767f8d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 21 Oct 2021 22:25:18
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 69AC1C43617; Thu, 21 Oct 2021 22:25:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 98420C4338F;
 Thu, 21 Oct 2021 22:25:17 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 21 Oct 2021 15:25:17 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Clark
 <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, Jonathan Marek
 <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: Re: [Freedreno] [PATCH 03/11] drm/msm/dpu: drop pipe_name from struct
 dpu_plane
In-Reply-To: <20210930140002.308628-4-dmitry.baryshkov@linaro.org>
References: <20210930140002.308628-1-dmitry.baryshkov@linaro.org>
 <20210930140002.308628-4-dmitry.baryshkov@linaro.org>
Message-ID: <fed157cc7d06e79a7b96c493b89bc0e2@codeaurora.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-09-30 06:59, Dmitry Baryshkov wrote:
> Use plane->name instead of artificial pipe_name.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 88d726133b8b..ef3737642b0c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -115,7 +115,6 @@ struct dpu_plane {
>  	struct dpu_csc_cfg *csc_ptr;
> 
>  	const struct dpu_sspp_sub_blks *pipe_sblk;
> -	char pipe_name[DPU_NAME_SIZE];
> 
>  	/* debugfs related stuff */
>  	struct dentry *debugfs_root;
> @@ -1429,7 +1428,7 @@ static int _dpu_plane_init_debugfs(struct
> drm_plane *plane)
> 
>  	/* create overall sub-directory for the pipe */
>  	pdpu->debugfs_root =
> -		debugfs_create_dir(pdpu->pipe_name,
> +		debugfs_create_dir(plane->name,
>  				plane->dev->primary->debugfs_root);
> 
>  	/* don't error check these */
> @@ -1660,12 +1659,9 @@ struct drm_plane *dpu_plane_init(struct 
> drm_device *dev,
>  	/* success! finalize initialization */
>  	drm_plane_helper_add(plane, &dpu_plane_helper_funcs);
> 
> -	/* save user friendly pipe name for later */
> -	snprintf(pdpu->pipe_name, DPU_NAME_SIZE, "plane%u", plane->base.id);
> -
>  	mutex_init(&pdpu->lock);
> 
> -	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", 
> pdpu->pipe_name,
> +	DPU_DEBUG("%s created for pipe:%u id:%u virtual:%u\n", plane->name,
>  					pipe, plane->base.id, master_plane_id);
>  	return plane;
