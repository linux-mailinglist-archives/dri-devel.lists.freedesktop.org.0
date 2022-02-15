Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EF84B6FDE
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 16:39:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A339810E63B;
	Tue, 15 Feb 2022 15:38:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E65A810E63C
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 15:38:56 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 o128-20020a4a4486000000b003181707ed40so23567468ooa.11
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Feb 2022 07:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=EmhmbCMLSvgMI/Yp90rzcqykoF7qOyKTGKjZUXBL3+Y=;
 b=TU+Z3LV0OTJmXTcz5t0PoFnUR7njNtbMnOQXcjnG2dnGd2Bg8aZNe+3GdsUYJCrUN/
 VpWNVZwOyfs/Jq6deASO/LkTWy7ltrhyfBUffXKevYiJseRsfvW15fY8iueeP154lVU+
 ujbSVOlVJEe/DONvxxT5RjK4vLdpr+TrvOe6bimVi5KNvQegpHhr1mSha2oBBwL+nhbR
 /cNVZ5+GJBAHw2A3O1/T1278Tp84hEg+yw+NPlNTtc4STYys+gPVar4xvIPbU4Yj9iuw
 ruuxK/6GQp9btXHgyvwHBNR0ahRcpvS28Y8LdrYFViMK5DhG3EdE66jAOW3yqPjKDdga
 lDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=EmhmbCMLSvgMI/Yp90rzcqykoF7qOyKTGKjZUXBL3+Y=;
 b=EI9zpef4eFPav6Pgt/1kQZP4y0VXquptW/GwiNavA1P7F/syt5gwwyF/yAQ/XzO1FZ
 mWvBfhysh0yEWeXjxbFGdLZMFYSckjchrCefrqx0HtLMG9AfNBakUg/cC6hphIjDoEK4
 vembx31JdA3BoFrVmik0LO+kkKKM5mdt6ImmdxIvN67xJdn3NNmspX6PiCd2d6kLcHx9
 iNcijcuArQirj+VlfxpLf2gYMIXbuXv50gkvdSFFbZf99KsCF/x2t1QD5J3OkN4PKTR9
 MQXjhylIdPuK0WHwHjO2xaWRqX+PUhaBfPMNsGS+r+fY3aex8CJ2Afj20Wi8AnOK+eNO
 Y8iw==
X-Gm-Message-State: AOAM530vtwnAiTUbsin4FrF+kq0rp9OLKL/jNObamjraTowVLx9gfdin
 I2c9O6AfH4Yw4eXCZIYAErgkeQ==
X-Google-Smtp-Source: ABdhPJwniUUrFyPY+itLrwf9hGIBFcNHVJBm03Um97xeABEfXlO/Cld1YQuGI24h53YLl0d3lJg+mw==
X-Received: by 2002:a4a:4ec6:: with SMTP id r189mr1430542ooa.31.1644939536187; 
 Tue, 15 Feb 2022 07:38:56 -0800 (PST)
Received: from yoga ([2600:1700:a0:3dc8:5c39:baff:fe03:898d])
 by smtp.gmail.com with ESMTPSA id z4sm13758586ota.7.2022.02.15.07.38.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 07:38:55 -0800 (PST)
Date: Tue, 15 Feb 2022 09:38:53 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 4/8] drm/msm/dpu: drop bus_scaling_client field
Message-ID: <YgvJDVHYfuns03W5@yoga>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
 <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215141643.3444941-5-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue 15 Feb 08:16 CST 2022, Dmitry Baryshkov wrote:

> We do not use MSM bus client, so drop bus_scaling_client field from
> dpu_encoder_virt.
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> index 401e37f50d54..480d02ccff8c 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> @@ -127,7 +127,6 @@ enum dpu_enc_rc_states {
>   *	Virtual encoder registers itself with the DRM Framework as the encoder.
>   * @base:		drm_encoder base class for registration with DRM
>   * @enc_spinlock:	Virtual-Encoder-Wide Spin Lock for IRQ purposes
> - * @bus_scaling_client:	Client handle to the bus scaling interface
>   * @enabled:		True if the encoder is active, protected by enc_lock
>   * @num_phys_encs:	Actual number of physical encoders contained.
>   * @phys_encs:		Container of physical encoders managed.
> @@ -172,7 +171,6 @@ enum dpu_enc_rc_states {
>  struct dpu_encoder_virt {
>  	struct drm_encoder base;
>  	spinlock_t enc_spinlock;
> -	uint32_t bus_scaling_client;
>  
>  	bool enabled;
>  
> -- 
> 2.34.1
> 
