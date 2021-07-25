Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E92503D4B5A
	for <lists+dri-devel@lfdr.de>; Sun, 25 Jul 2021 06:07:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35BFD735C9;
	Sun, 25 Jul 2021 04:07:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com
 [IPv6:2607:f8b0:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD041737F1
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Jul 2021 04:07:45 +0000 (UTC)
Received: by mail-oi1-x232.google.com with SMTP id z26so6833115oih.10
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Jul 2021 21:07:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=qPcNovK3Jzv6MtpyivEjOb1iOtKi6VllcBgW2npDIL4=;
 b=OAm2GVtDtg6CScF2A4zXsPXLM+2JKdKs1pxzF6fFyt1dJ97jQVWjIsxU5oajipFb69
 qdnbXOJzsJ6fn5Ud9acHbo+Eef3gDSniSJU7UDnl0SOBK+xfD8ulvDjS1LbXVNHmuMdg
 Mg4AJXGMcIHn+NqtSZqHjTLnAtAw4LSpkRGFjnTLwsgn52mdiRrSR5ShoR5bcTWNQJYP
 Ui8cSqAVxvlFn9L0pVll7l/oOqDYN1RKKLZTdfjd7gdwue3vX1p0dbZYl3SJckqYGUnx
 jFrAkzalrRSyWiLZUoRTofSEyGsXCLNYh8rjakhFVlCQg7kfFeWj8xJnqKSQB/HkdKsy
 4jNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=qPcNovK3Jzv6MtpyivEjOb1iOtKi6VllcBgW2npDIL4=;
 b=I3JK+Rk4kzWunR9pcCr/4WEU2uCZ/5NwMKBn20z85evJPowXsLs3otkK147aerHU/n
 XxeqFwBLrHgsT4Oniiebvn5WAi8XkJ3VboyddP+X52fyWuk3q1NnhK09TrS8vYGBojE1
 jR/o4OemULAVBs5MTlhnwCDELs3d7BNPFjwnktvWzSZRFOef2rOAcsPuQ1erA7OSZEB1
 fGDkNB1VJ4+kIzPx/icPLfWXhIfyrPIuYX/BQFF0nT2/Bx1dCVHxRVwRVMwXY8jlvGdO
 VtM/+r/hNdJ2pgmPnusBvCKj/UUrFmskKuxM16rU43V9e39PL+envzebQGtbhdSpjjsI
 6vig==
X-Gm-Message-State: AOAM531Bfpx1+/zBrB3RsrXx1teA4Ud8P9r+iGTlweH2ahr1HgCYbmrD
 XLPgCGDGX4EkAJKqEGrAAoOWuw==
X-Google-Smtp-Source: ABdhPJwkPlnCB+1QqkdkHxGlKCOfc40Jrh5YdNvYb30Pc3if3sEKq8nTavHZ0IXJG7z9aIQmeFg5Pw==
X-Received: by 2002:aca:a8cf:: with SMTP id r198mr7266642oie.143.1627186065231; 
 Sat, 24 Jul 2021 21:07:45 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id w75sm1564575oiw.12.2021.07.24.21.07.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 Jul 2021 21:07:44 -0700 (PDT)
Date: Sat, 24 Jul 2021 23:07:42 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 4/7] drm/msm/mdp5: move mdp5_encoder_set_intf_mode
 after msm_dsi_modeset_init
Message-ID: <YPzjjkXv2orcG739@yoga>
References: <20210717124016.316020-1-dmitry.baryshkov@linaro.org>
 <20210717124016.316020-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210717124016.316020-5-dmitry.baryshkov@linaro.org>
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

> Move a call to mdp5_encoder_set_intf_mode() after
> msm_dsi_modeset_init(), removing set_encoder_mode callback.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
>  drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> index 15aed45022bc..b3b42672b2d4 100644
> --- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> +++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
> @@ -209,13 +209,6 @@ static int mdp5_set_split_display(struct msm_kms *kms,
>  							  slave_encoder);
>  }
>  
> -static void mdp5_set_encoder_mode(struct msm_kms *kms,
> -				  struct drm_encoder *encoder,
> -				  bool cmd_mode)
> -{
> -	mdp5_encoder_set_intf_mode(encoder, cmd_mode);
> -}
> -
>  static void mdp5_kms_destroy(struct msm_kms *kms)
>  {
>  	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
> @@ -287,7 +280,6 @@ static const struct mdp_kms_funcs kms_funcs = {
>  		.get_format      = mdp_get_format,
>  		.round_pixclk    = mdp5_round_pixclk,
>  		.set_split_display = mdp5_set_split_display,
> -		.set_encoder_mode = mdp5_set_encoder_mode,
>  		.destroy         = mdp5_kms_destroy,
>  #ifdef CONFIG_DEBUG_FS
>  		.debugfs_init    = mdp5_kms_debugfs_init,
> @@ -448,6 +440,9 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
>  		}
>  
>  		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
> +		if (!ret)
> +			mdp5_encoder_set_intf_mode(encoder, msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
> +
>  		break;
>  	}
>  	default:
> -- 
> 2.30.2
> 
