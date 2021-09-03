Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D35D9400556
	for <lists+dri-devel@lfdr.de>; Fri,  3 Sep 2021 20:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 920436E8CC;
	Fri,  3 Sep 2021 18:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 206E96E8C7
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Sep 2021 18:51:52 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id s12so356705ljg.0
 for <dri-devel@lists.freedesktop.org>; Fri, 03 Sep 2021 11:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CGgzXCdE/Vq7B9miSyLOddv3Rnpk5fkhdhUAv/F6bFU=;
 b=j6uHwa3CYVqqxebmAZUpVozSQIY4vCnHYonuiFq2WdOpzYxZC4qv790QDk3DHG0O09
 7Hfu72FNXkNpUQI2bYtiHlhXp9w9Wv0M0brfzW+v2ifGhnO8lb3zjUF9a+n5vbYyePR0
 AVlxUwU/cJcTPe/aFsl+R2q5Nh19hTmNlUqV3d5mM1mrjv4fuLz68sd9LnDz+0BpTZOJ
 0/P0abPEeCsZZEG3/Qm0KCtcmXdneV4B5JCjpPVnZWTHZ8PGhcDkxCAJGCMHc9ZwB1ey
 te2M6vADtboCIrDx3C+2y9uEIYO4juBO+JmcibGxGmZmPJZSUebJJcI/trIXew0h/EzO
 T0gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CGgzXCdE/Vq7B9miSyLOddv3Rnpk5fkhdhUAv/F6bFU=;
 b=rs7d08lrIdYvWVEhi6JvNUQkBiXND5iiBjSUbvMElFZBK953C+oQPogue6aSnIR3yi
 aYXMzEEjZOW3G0DSqppGrns+ixebjJRs0KzpFNanUfPdRFRmtPg+4UWz6lTLD3NkRnMY
 yGC0OFi2A3ozKi9sWDyI3L7vjw1YqSwJHUz0Q8ANraKEl0UZkFFjemDw+xRHs4H2uSlk
 W6JBe78FfGruWYc02DV95r57OJMgtDeRet5XksJkuff+/Kk99TguWWf6WHwJjjtAmRQF
 K0LIw3Y5Cyq+vzbqxqzdEPvDkX/ocMksR5gZXNC8icY2nCqHMoxpiSjT7WvmQEKVfWLW
 TJnw==
X-Gm-Message-State: AOAM533/Tv6PxVUxaFNyOrxzWneRTgf/K8DShypyy98Yo5duGVmlP+Dt
 bfr7pOiJ1E+N6YCHC9jOT5hJMw==
X-Google-Smtp-Source: ABdhPJyrp1FHP6A/jWM2UEHJjZAjv8wE5xkA68qW9HBXTbA6YbMhGtQ4qIeBH1MvoLAQijDEs8Gbcg==
X-Received: by 2002:a2e:83d0:: with SMTP id s16mr322899ljh.328.1630695108904; 
 Fri, 03 Sep 2021 11:51:48 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id y1sm22335lfb.297.2021.09.03.11.51.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 11:51:48 -0700 (PDT)
Subject: Re: [PATCH] drm/msm: remove unneeded variable
To: cgel.zte@gmail.com, robdclark@gmail.com
Cc: sean@poorly.run, airlied@linux.ie, daniel@ffwll.ch, lyude@redhat.com,
 airlied@redhat.com, laurent.pinchart@ideasonboard.com,
 chi.minghao@zte.com.cn, treding@nvidia.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Zeal Robot <zealci@zte.com.cn>,
 Alexey Minnekhanov <alexeymin@postmarketos.org>,
 Brian Masney <masneyb@onstation.org>
References: <20210831115127.18236-1-chi.minghao@zte.com.cn>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <65f56c2b-591a-16c8-7f3a-41695b1147b3@linaro.org>
Date: Fri, 3 Sep 2021 21:51:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210831115127.18236-1-chi.minghao@zte.com.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit
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

On 31/08/2021 14:51, cgel.zte@gmail.com wrote:
> From: Chi Minghao <chi.minghao@zte.com.cn>
> 
> Fix the following coccicheck REVIEW:
> ./drivers/gpu/drm/msm/edp/edp_ctrl.c:1245:5-8 Unneeded variable
> 
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Chi Minghao <chi.minghao@zte.com.cn>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Glancing on msm/edp, as it was never supported by the in-kernel dts I 
wonder: maybe we should drop it completely? If the need arises the 
removal can be reverted anytime.

Does anybody hacking 8084/8074/8974 support has eDP port access?

> ---
>   drivers/gpu/drm/msm/edp/edp_ctrl.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/edp/edp_ctrl.c b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> index 4fb397ee7c84..3610e26e62fa 100644
> --- a/drivers/gpu/drm/msm/edp/edp_ctrl.c
> +++ b/drivers/gpu/drm/msm/edp/edp_ctrl.c
> @@ -1242,8 +1242,6 @@ bool msm_edp_ctrl_panel_connected(struct edp_ctrl *ctrl)
>   int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>   		struct drm_connector *connector, struct edid **edid)
>   {
> -	int ret = 0;
> -
>   	mutex_lock(&ctrl->dev_mutex);
>   
>   	if (ctrl->edid) {
> @@ -1278,7 +1276,7 @@ int msm_edp_ctrl_get_panel_info(struct edp_ctrl *ctrl,
>   	}
>   unlock_ret:
>   	mutex_unlock(&ctrl->dev_mutex);
> -	return ret;
> +	return 0;
>   }
>   
>   int msm_edp_ctrl_timing_cfg(struct edp_ctrl *ctrl,
> 


-- 
With best wishes
Dmitry
