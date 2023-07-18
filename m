Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2DF275737A
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 07:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF0610E161;
	Tue, 18 Jul 2023 05:55:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E18B110E2CE
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 05:55:33 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4f95bf5c493so8439698e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jul 2023 22:55:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689659731; x=1690264531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XsbhJmZRrUVfIREF/YaoFO31V/VuA36PYOF5vrsxTrY=;
 b=TvrjMYga2+Hgvom8TQQo8p7mOuPyE1lsM6aLnnwAunLKKI5uDVEpghkBORAr0HzOH/
 xIc1C3s6mgPRsJpem750XgLU/IMijtUI+QctrT66UalwLHcpZzg4I1Bp8r7T2F7zg09Q
 Kif7QO5PnGk6IBVkHTco/sJ//wBcq/eOJg69AzFX3mQ+NPj96mphWjHhb7NERZ2cmoI0
 Yhf2DcxtgNCf8ooikgeLgqIlQtxpT1zc0mcUpO57Zp6XNyZ23QSehn/DmudccnNrHFXZ
 fptm6ujDMnYcN2U0oGugmXDNNnpD5sM9euETJ50oVEMPynuQUoE6EMNhmNG7mLB2W/7t
 2iaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689659731; x=1690264531;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XsbhJmZRrUVfIREF/YaoFO31V/VuA36PYOF5vrsxTrY=;
 b=Ksx4XGiU3yYWTWjsRTcHy68o7cRV0FIOlt0cJYrDtCIqP5XBbrFq7Hw/KqIw8eJ1WB
 6eHu/ku7E/9FL24GOqHLL2YbWta47GZ5pAcN6tLP8dWmZt139v0HFZWGA8gGj57ey4bH
 FXUoyhDRD+hHZOGX6gKVhLtGo8emlTQGY64KTeIyTq8mRV4/y9I2MxKMNnwzTPoaGmb8
 65VMvGjW2rA/SlUJcd/bMMTvZymc87HWDE++npRstO4RTfWv+D/eWzeHsO3oZL3ZyPnr
 c87NHwrgp7wxGX7e1kk0hHSwaVkoG9ksHRxiwVRL3872I1Bh2/h/EMemdKPNjWItDy+O
 SxKw==
X-Gm-Message-State: ABy/qLbTpvPZCVBMMFw7K0trnKj+d69LWXnvjMR3EmtxnuvXydYgOgqA
 AYUkzrNUz3qkllQGWfWAQ2QnLg==
X-Google-Smtp-Source: APBJJlEKnXriHXhpepYUAwnNUDFbo9hDSR/GW0DhqttHRWYsNVESqVdXLfJaY6cJ5psPQjsT07aaVw==
X-Received: by 2002:ac2:5f09:0:b0:4fb:c740:326 with SMTP id
 9-20020ac25f09000000b004fbc7400326mr8149939lfq.55.1689659731275; 
 Mon, 17 Jul 2023 22:55:31 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 d14-20020ac25ece000000b004fdc0023a50sm264342lfq.232.2023.07.17.22.55.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Jul 2023 22:55:30 -0700 (PDT)
Message-ID: <69f56e09-2baa-be6f-3021-2c5afd5867c9@linaro.org>
Date: Tue, 18 Jul 2023 08:55:30 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] drm: remove drm_bridge_hpd_disable() from
 drm_bridge_connector_destroy()
Content-Language: en-GB
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
References: <20230717223451.16783-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230717223451.16783-1-quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Cc: andersson@kernel.org, linux-kernel@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, quic_jesszhan@quicinc.com,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/07/2023 01:34, Abhinav Kumar wrote:
> drm_bridge_hpd_enable()/drm_bridge_hpd_disable() callbacks call into
> the respective driver's hpd_enable()/hpd_disable() ops. These ops control
> the HPD enable/disable logic which in some cases like MSM can be a
> dedicate hardware block to control the HPD.
> 
> During probe_defer cases, a connector can be initialized and then later
> destroyed till the probe is retried. During connector destroy in these
> cases, the hpd_disable() callback gets called without a corresponding
> hpd_enable() leading to an unbalanced state potentially causing even
> a crash.
> 
> This can be avoided by the respective drivers maintaining their own
> state logic to ensure that a hpd_disable() without a corresponding
> hpd_enable() just returns without doing anything.
> 
> However, to have a generic fix it would be better to avoid the
> hpd_disable() callback from the connector destroy path and let
> the hpd_enable() / hpd_disable() balance be maintained by the
> corresponding drm_bridge_connector_enable_hpd() /
> drm_bridge_connector_disable_hpd() APIs.

Which should get called by the drm_kms_helper_disable_hpd().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>   drivers/gpu/drm/drm_bridge_connector.c | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_bridge_connector.c b/drivers/gpu/drm/drm_bridge_connector.c
> index 19ae4a177ac3..3d4e25c2f3d7 100644
> --- a/drivers/gpu/drm/drm_bridge_connector.c
> +++ b/drivers/gpu/drm/drm_bridge_connector.c
> @@ -187,12 +187,6 @@ static void drm_bridge_connector_destroy(struct drm_connector *connector)
>   	struct drm_bridge_connector *bridge_connector =
>   		to_drm_bridge_connector(connector);
>   
> -	if (bridge_connector->bridge_hpd) {
> -		struct drm_bridge *hpd = bridge_connector->bridge_hpd;
> -
> -		drm_bridge_hpd_disable(hpd);
> -	}
> -
>   	drm_connector_unregister(connector);
>   	drm_connector_cleanup(connector);
>   

-- 
With best wishes
Dmitry

