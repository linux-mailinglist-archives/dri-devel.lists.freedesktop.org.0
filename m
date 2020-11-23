Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2828F2C1761
	for <lists+dri-devel@lfdr.de>; Mon, 23 Nov 2020 22:12:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DE726E0E1;
	Mon, 23 Nov 2020 21:12:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FBF26E0E1
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Nov 2020 21:12:12 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1606165933; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=sLXph1fVaBzXxkzR1k1mDUs2s3xMx2NERmjF55dg/ps=;
 b=QQaKLZYFZg+JKftdqfTe88l/X4rj+UAfD9kIkk0agu/5JiS9t4j3qhIdw0u+NCYKDxT4w8DO
 f7xf2smh032gqNxb2hRWq/xkecF0m4FKo4S4Rq8ShHAwSqt/46TBCwWGXw+bq+5+0gzgzOPI
 x5Ksyn6apI4XGyWvtfPAuT0SEWk=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5fbc25a177b63cdb340484d0 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Nov 2020 21:12:01
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 9C209C43463; Mon, 23 Nov 2020 21:12:01 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id AA8E8C433ED;
 Mon, 23 Nov 2020 21:12:00 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 23 Nov 2020 13:12:00 -0800
From: abhinavk@codeaurora.org
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [Freedreno] [PATCH 20/40] drm/msm/disp/dpu1/dpu_hw_sspp: Fix
 kernel-doc formatting abuse
In-Reply-To: <20201123111919.233376-21-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
 <20201123111919.233376-21-lee.jones@linaro.org>
Message-ID: <d05b5aabd35debc9edc800c62e5075c2@codeaurora.org>
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
Cc: Sean Paul <sean@poorly.run>, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-11-23 03:18, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function
> parameter or member 'ctx' not described in 'dpu_hw_sspp_setup_format'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function
> parameter or member 'fmt' not described in 'dpu_hw_sspp_setup_format'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function
> parameter or member 'flags' not described in
> 'dpu_hw_sspp_setup_format'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function
> parameter or member 'rect_mode' not described in
> 'dpu_hw_sspp_setup_format'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function
> parameter or member 'ctx' not described in 'dpu_hw_sspp_setup_rects'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function
> parameter or member 'cfg' not described in 'dpu_hw_sspp_setup_rects'
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function
> parameter or member 'rect_index' not described in
> 'dpu_hw_sspp_setup_rects'
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Jonathan Marek <jonathan@marek.ca>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> index c940b69435e16..2c2ca5335aa8c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
> @@ -231,7 +231,7 @@ static void _sspp_setup_csc10_opmode(struct
> dpu_hw_pipe *ctx,
>  	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx, opmode);
>  }
> 
> -/**
> +/*
>   * Setup source pixel format, flip,
>   */
>  static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
> @@ -437,7 +437,7 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct
> dpu_hw_pipe *ctx)
>  	return dpu_hw_get_scaler3_ver(&ctx->hw, idx);
>  }
> 
> -/**
> +/*
>   * dpu_hw_sspp_setup_rects()
>   */
>  static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
