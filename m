Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 473343D4B5E
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 06:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B83C737F1;
	Sun, 25 Jul 2021 04:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com
 [IPv6:2607:f8b0:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F826737F1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 04:08:12 +0000 (UTC)
Received: by mail-oi1-x22a.google.com with SMTP id z26so6833745oih.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 21:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=VMaB3vY2dufbHq4l3p72oIac6AlNtvIq05CVprUMmII=;
 b=p7mTtrsn+eU1+Xe9EUhFCAN3TifiVNSH7Ikny4Cl5I9RPHw1Ow4Ufh9ysP4r3e9VC8
 S1E0yz2Qts+9Zefyyj3nc+eV7bOGn65dFktOFSQYbS2SKVHY2n4qMLKRk7mLcgrMZXUw
 gr36j5GIBtzfXfB2datfx59ILOoPKjMPPirFgjeio/fxAGxzkmdRa9EfUONwxzNOZvv8
 ANJhkjXeIrpyoXVZHpicXS3A9DfcYVE26j8I0sWHuIs3kL7wjivBSALkFToBr9a/v1PU
 C0+dpKdxQJ06dMrVFbY4+RG4pg1x88NMg/aJ5gEMN0QUnZbxfZxt2w7iLbA5I5NA4CqX
 SBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VMaB3vY2dufbHq4l3p72oIac6AlNtvIq05CVprUMmII=;
 b=GcdIUOGDJN/srDXKXuyCeCN8CxYZ6SMrESKLMjLxtXqbIZnMvGWkustkHOB/8Qgksu
 hOPGfdEcynIZ2iMe8ca7EXU5AotJnW5P5s5kVeeiqeNNHBAjAqGm95nSWDvhpeF965MY
 xSfiGBAp+0UJ8jbFw7K3onLcbCeC5nO21uY0fcMI6LgoB1ru4Xvh4IoVbfHwoYcOm+Xb
 WmJ8VEzQg9/Ce2YqCBOqCBe5TW/JrU7J/XgbPZKDYcUP/LXWCkiSuV0hxEBPatqDD1yY
 gi5e8xqi5Paobrua9keIz6Oy563huZ7P94Y4sJqlXdNeFcUHo8OpD2AtPh32bsZ9QQRB
 vXAA==
X-Gm-Message-State: AOAM532D+65bP9yJD8S7wMSwoghoWx8nsyvpLsxQzjg4yzQhWEsM79hu
 SHE+A2RD64+Bksmno7Cc6tEYyg==
X-Google-Smtp-Source: ABdhPJyES/Xh7ilkq1oDNnPV7WeA0Q9JIif9yMQxTMwm78l+CsYTi6M0FP1UUnJH73UCZSxPUHJ0CQ==
X-Received: by 2002:aca:1215:: with SMTP id 21mr13005806ois.37.1627186091976; 
 Sat, 24 Jul 2021 21:08:11 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id x31sm6593605ota.24.2021.07.24.21.08.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:08:11 -0700 (PDT)
Date: Sat, 24 Jul 2021 23:08:09 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 5/7] drm/msm/dp: stop calling set_encoder_mode callback
Message-ID: <YPzjqYLVM/G/YzrD@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-6-dmitry.baryshkov@linaro.org>
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
 Abhinav Kumar <abhinavk@codeaurora.org>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat 17 Jul 07:40 CDT 2021, Dmitry Baryshkov wrote:

> None of the display drivers now implement set_encoder_mode callback.
> Stop calling it from the modeset init code.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
>  1 file changed, 18 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
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
> @@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
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
>  static int dp_display_send_hpd_notification(struct dp_display_private *dp,
>  					    bool hpd)
>  {
> @@ -369,8 +353,6 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
>  	if (dp->usbpd->orientation == ORIENTATION_CC2)
>  		flip = true;
>  
> -	dp_display_set_encoder_mode(dp);
> -
>  	dp_power_init(dp->power, flip);
>  	dp_ctrl_host_init(dp->ctrl, flip, reset);
>  	dp_aux_init(dp->aux);
> -- 
> 2.30.2
> 
