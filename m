Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F032C1738
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:06:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4846E0D5;
	Mon, 23 Nov 2020 21:06:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 007AC6E0E3
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:06:52 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606165612; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=pVDvnBZoRhuxsGugrA9S3QxKjdkQCI4rMRDzzBJfqdg=;
 b=F9GdK+rMihKSGxfC2/VsUU5rBNhe6p0MBYLt2tnr6YLfyNUCd1HRQjgGVo9aaVTjZnlXcsn6
 gIiwhR949FgE2B68MHsmHvUWDlFal66nXEM4g56QMqeITEywqUUtQjEWK/TxBHToAGBnThux
 wOWMrBnaRviAAgQutsKhtH1tzYE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fbc246bd64ea0b7030e47c1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:06:51
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id E3BF3C43462; Mon, 23 Nov 2020 21:06:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A11C0C433C6;
 Mon, 23 Nov 2020 21:06:49 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:06:49 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 11/40] drm/msm/disp/dpu1/dpu_hw_blk: Add one
 missing and remove an extra param description
In-Reply-To: <20201123111919.233376-12-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-12-lee.jones@linaro.org>
Message-ID: <bd9e7b914116e49b60b082fe40daf78c@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:28: warning: Function
> parameter or member 'hw_blk' not described in 'dpu_hw_blk_init'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c:120: warning: Excess
> function parameter 'free_blk' description in 'dpu_hw_blk_put'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> index ca26666d2af91..819b26e660b9c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_blk.c
> @@ -19,6 +19,7 @@ static LIST_HEAD(dpu_hw_blk_list);
> 
>  /**
>   * dpu_hw_blk_init - initialize hw block object
> + * @hw_blk: pointer to hw block object
>   * @type: hw block type - enum dpu_hw_blk_type
>   * @id: instance id of the hw block
>   * @ops: Pointer to block operations
> @@ -114,7 +115,6 @@ struct dpu_hw_blk *dpu_hw_blk_get(struct
> dpu_hw_blk *hw_blk, u32 type, int id)
>  /**
>   * dpu_hw_blk_put - put hw_blk to free pool if decremented refcount is 
> zero
>   * @hw_blk: hw block to be freed
> - * @free_blk: function to be called when reference count goes to zero
>   */
>  void dpu_hw_blk_put(struct dpu_hw_blk *hw_blk)
>  {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
