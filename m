Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E8F64AFFD3
	for <lists+dri-devel@lfdr.de>; Wed,  9 Feb 2022 23:03:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B200D10E618;
	Wed,  9 Feb 2022 22:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D4C10E618
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Feb 2022 22:03:24 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id i17so6788926lfg.11
 for <dri-devel@lists.freedesktop.org>; Wed, 09 Feb 2022 14:03:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=m/jM298Q2lilwuRAcB9szC9CfZcuho3/psKjLfOmipk=;
 b=TBVPofOcDZHSNsfDSrK9N25wXlUqmiOwgAkzkjmAX7pRNqnzIlCv+Yazw38kCracB1
 PfVDsmtnw7AZxa6Rvn5RueZwpXPFbDHYD7wl8veFe5kS1uzo3pW+Q54NcX6wK7F4ifN9
 kCIpFQOmGPlWeI+F+Daz9XRNW0Np/b/ccFxBcKS7/6U+f2704dO9X6NRZidd5HhbDpDO
 jDr5wylLX3hFKJ2e6jweRbE0x4iGflbnv4rwQe6jxf7pTSNFufATUiEHoKNdn4H37ZiU
 l2QWN6u7oLNWiu3x7fhNSVxYWqN2s67IOWxnFQ+cHgpG4/KqiJottk6xQuvfFpjx+4zG
 p3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=m/jM298Q2lilwuRAcB9szC9CfZcuho3/psKjLfOmipk=;
 b=K8WsULmAJyyBuMveiaUkdSmIjYvrqeROewhyicmkMxAypzeXFDDVGSle6zmim7V64I
 Svpi/6rADeYAq/0ykEUBVJK2hr57LOMEkF3vxSz0B5+a7UX1neqbyCaJLyVuZlEZKj4W
 ZCWiqWyBjkXbUlcjQ1bfzRrLiZew3+csdOJkbRWtwB6gz7t0VjJge00YZbwzy/tj2jXS
 W40nDDa/SLBoFpVynuf2SkS3Gmse/dtPPfIUWflnanRVHnJKV3N5+eUf+yEt62Cjsqds
 LElnbrFJbG5EtxUkS+IpYlbKzFz9SIGGfPSMF6MyTpvsDbjrlgtdBNfiB7zQ5nrzAFyM
 iGMw==
X-Gm-Message-State: AOAM530CI5ESAYv68pr8aphhagRJ4+lUgmpLcMjY5F+s7aZToD/1ZLnF
 0JcArKYY3PLVIZNbpAL/NZywug==
X-Google-Smtp-Source: ABdhPJxwEImBidIbwgxkjiktuZ2LvjO6+doHOTUKPtcJPGxnGqzJVQKkxUsjyj77e/ZRZY8CKdu1Dg==
X-Received: by 2002:a05:6512:3a93:: with SMTP id
 q19mr3041722lfu.487.1644444202900; 
 Wed, 09 Feb 2022 14:03:22 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a27sm2541809lfg.140.2022.02.09.14.03.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Feb 2022 14:03:22 -0800 (PST)
Message-ID: <32259670-1261-a305-2bcb-57ebde792f24@linaro.org>
Date: Thu, 10 Feb 2022 01:03:21 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2 2/2] drm/msm/hdmi: Remove spurious IRQF_ONESHOT flag
Content-Language: en-GB
To: Daniel Thompson <daniel.thompson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20220201174734.196718-1-daniel.thompson@linaro.org>
 <20220201174734.196718-3-daniel.thompson@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220201174734.196718-3-daniel.thompson@linaro.org>
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 01/02/2022 20:47, Daniel Thompson wrote:
> Quoting the header comments, IRQF_ONESHOT is "Used by threaded interrupts
> which need to keep the irq line disabled until the threaded handler has
> been run.". When applied to an interrupt that doesn't request a threaded
> irq then IRQF_ONESHOT has a lesser known (undocumented?) side effect,
> which it to disable the forced threading of irqs. For "normal" kernels
> if there is no thread_fn then IRQF_ONESHOT is a nop.
> 
> In this case disabling forced threading is not appropriate because the
> driver calls wake_up_all() (via msm_hdmi_i2c_irq) and also directly uses
> the regular spinlock API for locking (in msm_hdmi_hdcp_irq() ). Neither
> of these APIs can be called from no-thread interrupt handlers on
> PREEMPT_RT systems.
> 
> Fix this by removing IRQF_ONESHOT.
> 
> Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
> index 719720709e9e7..e167817b42958 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.c
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
> @@ -306,7 +306,7 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
>   	}
>   
>   	ret = devm_request_irq(&pdev->dev, hdmi->irq,
> -			msm_hdmi_irq, IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
> +			msm_hdmi_irq, IRQF_TRIGGER_HIGH,
>   			"hdmi_isr", hdmi);
>   	if (ret < 0) {
>   		DRM_DEV_ERROR(dev->dev, "failed to request IRQ%u: %d\n",


-- 
With best wishes
Dmitry
