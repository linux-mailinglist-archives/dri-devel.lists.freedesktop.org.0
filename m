Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DEAC3C2B43
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 00:16:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16FB6E99F;
	Fri,  9 Jul 2021 22:16:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC4856E922
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 22:16:32 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1625868993; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=eeQHufr8+f3/vvWV4baddcSAAJsNOUIhtreLB7ptIko=;
 b=O93/dChxtgPkO4UVv7yHS7cwAPKla4rxDpneVDauy5RoOgmV2QSF47xxMFgvsnLdzRI2M5qV
 U/mY0JSfYsH3FE/Q/2g5j085lb/SsJp14Wa0v+7af/qfmtlYs24qol0iUk/QyquFT6ShH7j+
 JmdIZ3hgroysyac2fs42aogc0hQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyJkOTU5ZSIsICJkcmktZGV2ZWxAbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60e8cabfc4cc54360268f545 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 09 Jul 2021 22:16:31
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 556B4C43460; Fri,  9 Jul 2021 22:16:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 936B3C4338A;
 Fri,  9 Jul 2021 22:16:30 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Fri, 09 Jul 2021 15:16:30 -0700
From: abhinavk@codeaurora.org
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [Freedreno] [PATCH v1 5/7] drm/msm/dp: stop calling
 set_encoder_mode callback
In-Reply-To: <20210708122833.363451-6-dmitry.baryshkov@linaro.org>
References: <20210708122833.363451-1-dmitry.baryshkov@linaro.org>
 <20210708122833.363451-6-dmitry.baryshkov@linaro.org>
Message-ID: <16be30732d3c2108f7a3ca640ed8285d@codeaurora.org>
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 David Airlie <airlied@linux.ie>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021-07-08 05:28, Dmitry Baryshkov wrote:
> None of the display drivers now implement set_encoder_mode callback.
> Stop calling it from the modeset init code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The change looks fine,
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

But has DP been re-verified with this change by Bjorn?
If not, I can verify this on my board and give my Tested-by

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c
> b/drivers/gpu/drm/msm/dp/dp_display.c
> index 051c1be1de7e..70b319a8fe83 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -102,8 +102,6 @@ struct dp_display_private {
>  	struct dp_display_mode dp_mode;
>  	struct msm_dp dp_display;
> 
> -	bool encoder_mode_set;
> -
>  	/* wait for audio signaling */
>  	struct completion audio_comp;
> 
> @@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct
> msm_dp *dp_display)
>  }
> 
> 
> -static void dp_display_set_encoder_mode(struct dp_display_private *dp)
> -{
> -	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
> -	struct msm_kms *kms = priv->kms;
> -
> -	if (!dp->encoder_mode_set && dp->dp_display.encoder &&
> -				kms->funcs->set_encoder_mode) {
> -		kms->funcs->set_encoder_mode(kms,
> -				dp->dp_display.encoder, false);
> -
> -		dp->encoder_mode_set = true;
> -	}
> -}
> -
>  static int dp_display_send_hpd_notification(struct dp_display_private 
> *dp,
>  					    bool hpd)
>  {
> @@ -369,8 +353,6 @@ static void dp_display_host_init(struct
> dp_display_private *dp, int reset)
>  	if (dp->usbpd->orientation == ORIENTATION_CC2)
>  		flip = true;
> 
> -	dp_display_set_encoder_mode(dp);
> -
>  	dp_power_init(dp->power, flip);
>  	dp_ctrl_host_init(dp->ctrl, flip, reset);
>  	dp_aux_init(dp->aux);
