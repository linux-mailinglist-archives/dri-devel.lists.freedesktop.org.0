Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B424D486D8E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 00:09:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C898010E30D;
	Thu,  6 Jan 2022 23:09:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [IPv6:2607:f8b0:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9B7710E305
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Jan 2022 23:09:20 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id t23so5911737oiw.3
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Jan 2022 15:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=Ellt6MjzLF5sLUldei4o9NxlFsmkksIJlVQvjDivSks=;
 b=CqQBSA9Fycf49Rqosg7w2As6sk5LjhU7gBBtMELfqTFoE5LTYaH0EAFx5MJJc1MISu
 /QlNcmT56A3epX0FVXHwV5WiJS6EiLIVIqyP4Ew5UvnPEeL95DYBjlcIVZmDa32IZofs
 hzTKsy+r1Ypb/I8H5g9k3AVOzr4FKAlnk4Bx9EShJ7lRADBi38f62utDApMIKae6o90B
 CzoehUttwZFiHdFzhqFJuy3vzUHPIz/dpp/lC2UjiY9uQfBjszH7Kb6Vthawtk8RYCo3
 ZYz6eicpbT/KC8zEJQtnob7ZRuKwU8pfwakGC88KPDYRORNCDFipx8gzoJ1a3XkopGpU
 TXXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Ellt6MjzLF5sLUldei4o9NxlFsmkksIJlVQvjDivSks=;
 b=J0ZaRp4VWpQ6fjKtakHQMq+eAfTA0u78QRFnTlQx/5hC3CyqsKV1l51aw/AU3yR/qY
 mduXAZ80A+5d+NumZdHb0gpBGIk1YyG/fUgXBEk2n4bZJuHK1cV1DMWa/EjTzwl1Mgjt
 4aAICwYjscSrRzysY3oglLhmwU34XkODw6PKJbH2vWa6qLEaxfo+y7O04G6Lkz154xRX
 r1jgoWVCF5DjSevwFxQxQW6XhXtI1ekWgJnABnpijmkZ6QdPDQEdBecGhpU6hmWwKY2O
 PC1586v4/RKmN+wQAIECy2cPK9TklrW0jDF5ttBhUt6odu0xs375n393SicAChsb/Iy5
 DF7g==
X-Gm-Message-State: AOAM533uHDM3vDbXM4MUPgRiwEKhXeStD7eGLrvK2NfXjeWd3JrzAVtY
 ItGto/sRioJpxgKDnGY8mY17GA==
X-Google-Smtp-Source: ABdhPJyq6sRzUeRRegPHrbZlM4MOy++XyhVktPJ6AqBMtRYyZCcV2eNcaXx6iApBKxUIexhmB6lTPg==
X-Received: by 2002:a54:4493:: with SMTP id v19mr2915886oiv.61.1641510560064; 
 Thu, 06 Jan 2022 15:09:20 -0800 (PST)
Received: from ripper (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id n26sm574272ooc.48.2022.01.06.15.09.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jan 2022 15:09:19 -0800 (PST)
Date: Thu, 6 Jan 2022 15:10:08 -0800
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Subject: Re: [PATCH v4] drm/msm/dp:  populate connector of struct  dp_panel
Message-ID: <Ydd20C+YP2w060Tn@ripper>
References: <1641501894-17563-1-git-send-email-quic_khsieh@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1641501894-17563-1-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, quic_abhinavk@quicinc.com, airlied@linux.ie,
 freedreno@lists.freedesktop.org, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, agross@kernel.org,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 aravindh@codeaurora.org, sean@poorly.run, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu 06 Jan 12:44 PST 2022, Kuogee Hsieh wrote:

> DP CTS test case 4.2.2.6 has valid edid with bad checksum on purpose
> and expect DP source return correct checksum. During drm edid read,
> correct edid checksum is calculated and stored at
> connector::real_edid_checksum.
> 

Interesting, thanks for adding this!

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> The problem is struct dp_panel::connector never be assigned, instead the
> connector is stored in struct msm_dp::connector. When we run compliance
> testing test case 4.2.2.6 dp_panel_handle_sink_request() won't have a valid
> edid set in struct dp_panel::edid so we'll try to use the connectors
> real_edid_checksum and hit a NULL pointer dereference error because the
> connector pointer is never assigned.
> 
> Changes in V2:
> -- populate panel connector at msm_dp_modeset_init() instead of at dp_panel_read_sink_caps()
> 
> Changes in V3:
> -- remove unhelpful kernel crash trace commit text
> -- remove renaming dp_display parameter to dp
> 
> Changes in V4:
> -- add more details to commit text
> 
> Fixes: 7948fe12d47 ("drm/msm/dp: return correct edid checksum after corrupted edid checksum read")
> Signee-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3449d3f..40a059d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1499,6 +1499,7 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>  			struct drm_encoder *encoder)
>  {
>  	struct msm_drm_private *priv;
> +	struct dp_display_private *dp_priv;
>  	int ret;
>  
>  	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
> @@ -1507,6 +1508,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>  	priv = dev->dev_private;
>  	dp_display->drm_dev = dev;
>  
> +	dp_priv = container_of(dp_display, struct dp_display_private, dp_display);
> +
>  	ret = dp_display_request_irq(dp_display);
>  	if (ret) {
>  		DRM_ERROR("request_irq failed, ret=%d\n", ret);
> @@ -1524,6 +1527,8 @@ int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>  		return ret;
>  	}
>  
> +	dp_priv->panel->connector = dp_display->connector;
> +
>  	priv->connectors[priv->num_connectors++] = dp_display->connector;
>  	return 0;
>  }
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
