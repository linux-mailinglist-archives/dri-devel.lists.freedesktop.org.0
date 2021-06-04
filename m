Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7828B39AF3B
	for <lists+dri-devel@lfdr.de>; Fri,  4 Jun 2021 02:51:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9592C6F54E;
	Fri,  4 Jun 2021 00:51:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB5986F54C
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Jun 2021 00:51:34 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id 131so9439800ljj.3
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Jun 2021 17:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CT2K/qS5lVIs3YEMDQdZKAD8IbCCmQONZ9+FgWAvX24=;
 b=JOmB2bGuNQSVZesELXq7kgWG5GtOYXhL8kI/x3kQrNHvB7/M6fmmDaKhhsnlOeywzR
 pUWUYbqF8f/aZ27tG2QiZSg793i3bBd89UkP2aCQMm5cKEQE5LRgha9N8azIYpZ8EnMA
 Q932dDMGQt4UMgB1aq/XdlGEPRXTXr6HdmazmGBQ0P5LYdc8lP9NKZngQMYq51XpNB9r
 O6uX2Tb3t4YL84IRQYvvC6SaUJMr9PDp5zC6rZ9dMfVRGi2UfwghPuN7hZRGsndI0ST+
 PFhY2vqVwNrjH6h+YtALzUeOMjHf94TJ72x3BWZxTFWYyzd7pyDDb6VcXkVM3HXJ48SV
 RKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CT2K/qS5lVIs3YEMDQdZKAD8IbCCmQONZ9+FgWAvX24=;
 b=lfwOGzFOz5QYZQybn9E4tWsgftiP2T5V43BTwE8VkOQHHSC2/SpfDPNu9tCx8JucCK
 6OPlwLA145oi6DbkEv2rc3AO1YIKuMl+wRTPviIIU7xTwlriNpZiS8t8UniK9mKlVGkJ
 30DDAfxIF9GRY1Ih2dK1Yn/4zSmizg0H0feWOy6W1moyXr3GlNlwtSFqqmjgJsvRF2zL
 Olv8mZuDYMFaGAhXmZ9XgZlny4VLTYaUSOOVmb1OnoglvZdXKJ8vC7Ttg8FKq2x/Dax8
 Hrb1Lx7waKGStS9JT0wSG0Upg4EL3kDaR3Zpi/aEC/p+V7Hy/VhJXNUlF7rZDhaP7DRN
 iNDg==
X-Gm-Message-State: AOAM531LDqGLNGncPpO5uEf1DHA2Te4F0GEgQvmDlZC/BfqH+vKM1iF3
 no/rSTgUOWJnMGM1n2Gr3EoF7A==
X-Google-Smtp-Source: ABdhPJwqxUWLj44z5pV1IxYjRC/4BbSsQYK/woXmzbgMRsur3QtiLC9JK1TbDTSqoIVXvRm2UjIBew==
X-Received: by 2002:a2e:350f:: with SMTP id z15mr1394722ljz.303.1622767893346; 
 Thu, 03 Jun 2021 17:51:33 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id d24sm459811lfn.213.2021.06.03.17.51.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Jun 2021 17:51:33 -0700 (PDT)
Subject: Re: [RESEND 14/26] drm/msm/dp/dp_link: Fix some potential doc-rot
To: Lee Jones <lee.jones@linaro.org>
References: <20210602143300.2330146-1-lee.jones@linaro.org>
 <20210602143300.2330146-15-lee.jones@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Message-ID: <c6f630b6-715a-2dec-0b91-f918adcbdbd3@linaro.org>
Date: Fri, 4 Jun 2021 03:51:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210602143300.2330146-15-lee.jones@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/06/2021 17:32, Lee Jones wrote:
> Fixes the following W=1 kernel build warning(s):
> 
>   drivers/gpu/drm/msm/dp/dp_link.c:374: warning: expecting prototype for dp_parse_video_pattern_params(). Prototype was for dp_link_parse_video_pattern_params() instead
>   drivers/gpu/drm/msm/dp/dp_link.c:573: warning: expecting prototype for dp_parse_phy_test_params(). Prototype was for dp_link_parse_phy_test_params() instead
>   drivers/gpu/drm/msm/dp/dp_link.c:975: warning: expecting prototype for dp_link_process_downstream_port_status_change(). Prototype was for dp_link_process_ds_port_status_change() instead
> 
> Cc: Rob Clark <robdclark@gmail.com>
> Cc: Sean Paul <sean@poorly.run>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Cc: Chandan Uddaraju <chandanu@codeaurora.org>
> Cc: Kuogee Hsieh <khsieh@codeaurora.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Signed-off-by: Lee Jones <lee.jones@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_link.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_link.c b/drivers/gpu/drm/msm/dp/dp_link.c
> index be986da78c4a5..1099604bd1c86 100644
> --- a/drivers/gpu/drm/msm/dp/dp_link.c
> +++ b/drivers/gpu/drm/msm/dp/dp_link.c
> @@ -364,7 +364,7 @@ static int dp_link_parse_timing_params3(struct dp_link_private *link,
>   }
>   
>   /**
> - * dp_parse_video_pattern_params() - parses video pattern parameters from DPCD
> + * dp_link_parse_video_pattern_params() - parses video pattern parameters from DPCD
>    * @link: Display Port Driver data
>    *
>    * Returns 0 if it successfully parses the video link pattern and the link
> @@ -563,7 +563,7 @@ static int dp_link_parse_link_training_params(struct dp_link_private *link)
>   }
>   
>   /**
> - * dp_parse_phy_test_params() - parses the phy link parameters
> + * dp_link_parse_phy_test_params() - parses the phy link parameters
>    * @link: Display Port Driver data
>    *
>    * Parses the DPCD (Byte 0x248) for the DP PHY link pattern that is being
> @@ -961,7 +961,7 @@ static int dp_link_process_link_status_update(struct dp_link_private *link)
>   }
>   
>   /**
> - * dp_link_process_downstream_port_status_change() - process port status changes
> + * dp_link_process_ds_port_status_change() - process port status changes
>    * @link: Display Port Driver data
>    *
>    * This function will handle downstream port updates that are initiated by
> 


-- 
With best wishes
Dmitry
