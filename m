Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A56F27B52E
	for <lists+dri-devel@lfdr.de>; Mon, 28 Sep 2020 21:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 301EA89EF7;
	Mon, 28 Sep 2020 19:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from z5.mailgun.us (z5.mailgun.us [104.130.96.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCECF89EF7
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Sep 2020 19:21:38 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1601320898; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=obVXhgTgepUWdTaJcXF5/0Z4MlxN7LlK1+bxFgWPPcM=;
 b=xIuWP1o5A45NeZfvkYunP4ae/4TXX8UVuNCQiWADQg/3L2PW+Zkfr824sRG0YKZoSC47VR7/
 8zXoFbh1Oknmmy9RQ9wgNoxjMNY1Ap1KqQTJGQprKQFMWt9nxLDsBwgCKK8GfReXRndg3crS
 t6cEhmwFe0iy1fW9AjrancaKo/A=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-east-1.postgun.com with SMTP id
 5f7237c2e6be23d0dfcc550a (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 28 Sep 2020 19:21:38
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 50D19C433CA; Mon, 28 Sep 2020 19:21:37 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id A9B0CC433C8;
 Mon, 28 Sep 2020 19:21:36 +0000 (UTC)
MIME-Version: 1.0
Date: Mon, 28 Sep 2020 12:21:36 -0700
From: abhinavk@codeaurora.org
To: Stephen Boyd <swboyd@chromium.org>
Subject: Re: [Freedreno] [PATCH] drm/msm/dpu: Add newline to printks
In-Reply-To: <20200928191657.1193583-1-swboyd@chromium.org>
References: <20200928191657.1193583-1-swboyd@chromium.org>
Message-ID: <ef9767b5088a9ce33aaceccae3f6d458@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2020-09-28 12:16, Stephen Boyd wrote:
> Printk messages need newlines. Add it here.
> 
> Cc: Abhinav Kumar <abhinavk@codeaurora.org>
> Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
> Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index f272a8d0f95b..cbe0461246f8 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -906,7 +906,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
> *crtc,
>  	}
> 
>  	mode = &state->adjusted_mode;
> -	DPU_DEBUG("%s: check", dpu_crtc->name);
> +	DPU_DEBUG("%s: check\n", dpu_crtc->name);
> 
>  	/* force a full mode set if active state changed */
>  	if (state->active_changed)
> @@ -1012,7 +1012,7 @@ static int dpu_crtc_atomic_check(struct drm_crtc 
> *crtc,
>  		}
> 
>  		pstates[i].dpu_pstate->stage = z_pos + DPU_STAGE_0;
> -		DPU_DEBUG("%s: zpos %d", dpu_crtc->name, z_pos);
> +		DPU_DEBUG("%s: zpos %d\n", dpu_crtc->name, z_pos);
>  	}
> 
>  	for (i = 0; i < multirect_count; i++) {
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
