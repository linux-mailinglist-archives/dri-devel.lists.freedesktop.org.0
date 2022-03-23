Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF2234E5037
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 11:19:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A9210E0B4;
	Wed, 23 Mar 2022 10:19:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A8710E0B4
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 10:19:36 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bu29so1942115lfb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Mar 2022 03:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=jwtA3pgAKVmewmwW2CEap5jLxzJfz+i4doALRThTG/0=;
 b=Ozm3WAqOjbC0V3L/SexsRDLgqPGbQ+k9Dtlbs+44tZzQAxPVOUmDuiUtozcEUvrsLV
 cWCXozTIQ11E03wMEVVx/hHBc29OhUv9Myl8UkTsmVjav5OI9tOg+E6jvKHKF4dUPUS7
 ungFFhBemjEuyNPXv6RdsSgOluIODx0ZfWwuD0L8GbsnsxeSAkjyZzggbgTu0S2BRXTS
 Ncy8LgG4UUjiiuw20bZ02ZKfNcZTSrLSyFwujCGI9pszouqSAWVh3I5sM7VkNs+vvsPQ
 dyhFWt5J9v8lJx/qvlgFWt0pWcKZcwfGxHBmh2B1c6cDsHXhs/3hFtEZPzPq+bbpxa7/
 +iTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=jwtA3pgAKVmewmwW2CEap5jLxzJfz+i4doALRThTG/0=;
 b=JaMyTzJdE/9fWzuqx9Q1UCJKkdNnzqSfgHWgY4E6soWgs3yZhOGOaWrjvvOCEo8+QG
 XE6PqyQ0rHEuDgYGMdTuyg+8A0Dz+WEKz6l3v3/YeRW8m2nwQeNww6zD6kC7k0HizKbc
 wPOIvV/ZjtJ/tkhxELNWIT0RXlP5kZ07ySPsUu7nfCoPth2PbO+OY0BYeEPc112OquKy
 hdFVoauFzLaIML0iJaAiER7uDgzZ5BuJdlNiFiPUjLrG0s0FkdCpoUOGECZZNbydI9ye
 mPYAjHouNSBBkDvpKOfPxUbzVIIFSC2rjCXYZIdhixgW/Zo1dw5RTGnGNN1AFketeywz
 BlNg==
X-Gm-Message-State: AOAM533ocJ2oA+GlsL6ahd9ki9kZXe4SPUMM8KC2QbnTlqWwluRUokJC
 Wd4C3RLXDxOviwJUjMVew+YmSw==
X-Google-Smtp-Source: ABdhPJxbtenqDf8ffjjp86dT+ADLbGZK3u3Ely90YnIqBwOcBYrFmxDEgjlPMaX8dGIge+Yb7sJADA==
X-Received: by 2002:a05:6512:3d13:b0:449:fd85:f61d with SMTP id
 d19-20020a0565123d1300b00449fd85f61dmr20090668lfv.368.1648030775062; 
 Wed, 23 Mar 2022 03:19:35 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 c6-20020a19e346000000b00448ac0a351dsm2484589lfk.221.2022.03.23.03.19.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Mar 2022 03:19:34 -0700 (PDT)
Message-ID: <5b2a478f-9864-8fcd-574d-1527cc9b3333@linaro.org>
Date: Wed, 23 Mar 2022 13:19:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH 10/22] drm/msm: Nuke weird on stack mode copy
Content-Language: en-GB
To: Ville Syrjala <ville.syrjala@linux.intel.com>,
 dri-devel@lists.freedesktop.org
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
 <20220218100403.7028-11-ville.syrjala@linux.intel.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220218100403.7028-11-ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/02/2022 13:03, Ville Syrjala wrote:
> From: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> This on stack middle man mode looks entirely pointless.
> Just duplicate the original mode directly.
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>

I took a glance at the surrounding piece of code.
The dp_connector_get_modes() calls dp_display_get_modes() in attempt to 
fill the dp_mode argument. However the dp_display_get_modes() function 
just calls dp_panel_get_modes(), which does not touch dp_mode argument 
since the commit ab205927592b ("drm/msm/dp: remove mode hard-coding in 
case of DP CTS") dating September 2020. I think we can drop this piece 
of code completely.

> ---
>   drivers/gpu/drm/msm/dp/dp_drm.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index d4d360d19eba..09188d02aa1e 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -56,7 +56,7 @@ static int dp_connector_get_modes(struct drm_connector *connector)
>   	int rc = 0;
>   	struct msm_dp *dp;
>   	struct dp_display_mode *dp_mode = NULL;
> -	struct drm_display_mode *m, drm_mode;
> +	struct drm_display_mode *m;
>   
>   	if (!connector)
>   		return 0;
> @@ -82,13 +82,11 @@ static int dp_connector_get_modes(struct drm_connector *connector)
>   			return rc;
>   		}
>   		if (dp_mode->drm_mode.clock) { /* valid DP mode */
> -			memset(&drm_mode, 0x0, sizeof(drm_mode));
> -			drm_mode_copy(&drm_mode, &dp_mode->drm_mode);
> -			m = drm_mode_duplicate(connector->dev, &drm_mode);
> +			m = drm_mode_duplicate(connector->dev, &dp_mode->drm_mode);
>   			if (!m) {
>   				DRM_ERROR("failed to add mode %ux%u\n",
> -				       drm_mode.hdisplay,
> -				       drm_mode.vdisplay);
> +					  dp_mode->drm_mode.hdisplay,
> +					  dp_mode->drm_mode.vdisplay);
>   				kfree(dp_mode);
>   				return 0;
>   			}


-- 
With best wishes
Dmitry
