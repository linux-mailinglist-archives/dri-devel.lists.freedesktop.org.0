Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55AFA4B996C
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 07:46:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4AB010E945;
	Thu, 17 Feb 2022 06:46:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0705210E947
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Feb 2022 06:46:16 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id u20so8137419lff.2
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Feb 2022 22:46:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=aWFKmjSTHV/1Uy7sHNTLFB57odwAHYMJXSbwkdw6WT4=;
 b=YIa0i4ieE1eaH5m5gYuX+zksrscCOi3t4ujD/UWVuUJpVu7gPr+XmKBMepc7/Z0UFD
 gn4GgBcpHyPN2+lYhDgMRyc5r9nI22Qp8koxghYZj8o37kg8plt5LL5IpAcLbwCQw13G
 XtCHQ4FfaXTY0HnXTCuIomu98rE1YBUGqW3KrXMmew0S7BC92M6wjeea/vJCoqEYoSOx
 aSp7xdnkKm0F24W34p9nnkmdSU1l1JKh4D8gAgGDcPN7d0NF3l4CXuSEUWl3oyZJeSra
 rdrsyJqRf0qE/Uj8k511E19EF2ARa0FgDoJwAukjhiw4k2FRGokMglDtHJL3Ke+x7Mwp
 gUEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=aWFKmjSTHV/1Uy7sHNTLFB57odwAHYMJXSbwkdw6WT4=;
 b=8Oddyn25UngvgZbicFp5Itkx6ZZ/rtwn5Sy6eyOQBnaJqcrQoRjsSVBnpxInvVh543
 rN8kv0zO/bBEBpFNEJTBLhLRySBIHkMmKB4LWFfsDpePeXjJTO0qGfMu4NfUF/UjPph2
 DJTBT05POc/Y74berZOmUzuK0Wdvnnuelgq+yTNgguS3HHyTi+F5+UBPiwpWWaIWf4Cq
 duupMNu/IEYTnn4zfv2+5Lw19JBHhYsgYZ5a7HjLtFgo0zavNQWCZwNK3s5O/iU7mVcV
 l9GfvPYvtpdRKKQC/vk2CuNdeNEdNHVuhgmm85xRGtG3lZ9Hog5Zdfnw6dNof+2Xtx97
 KjUQ==
X-Gm-Message-State: AOAM530Hy67bx/ipycYtZLBjQpRScibOnBzxlRdGUqFoweWtxE4fhn82
 iQXwsLH6RPEmr97YOYiUep9yWw==
X-Google-Smtp-Source: ABdhPJwTmA8+bpvfuxQXEMcZ9qVRfdTf7xH/IPQHvG+6uIqEFJP3XicNP9Reesg25IqAybbsMTVmyg==
X-Received: by 2002:a05:6512:224b:b0:443:ac94:3de3 with SMTP id
 i11-20020a056512224b00b00443ac943de3mr148169lfu.60.1645080374335; 
 Wed, 16 Feb 2022 22:46:14 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id g20sm1872269lja.50.2022.02.16.22.46.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 22:46:13 -0800 (PST)
Message-ID: <82707bbf-5005-9765-292b-1f883a32946c@linaro.org>
Date: Thu, 17 Feb 2022 09:46:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v7 3/4] drm/msm/dpu: replace BIT(x) with correspond marco
 define string
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run, swboyd@chromium.org, vkoul@kernel.org,
 daniel@ffwll.ch, airlied@linux.ie, agross@kernel.org,
 bjorn.andersson@linaro.org
References: <1645049106-30481-1-git-send-email-quic_khsieh@quicinc.com>
 <1645049106-30481-4-git-send-email-quic_khsieh@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1645049106-30481-4-git-send-email-quic_khsieh@quicinc.com>
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/02/2022 01:05, Kuogee Hsieh wrote:
> To improve code readability, this patch replace BIT(x) with
> correspond register bit define string
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>

This patch should come first.

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index b68e696..8f10aab 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -61,6 +61,12 @@
>   
>   #define   INTF_MUX                      0x25C
>   
> +#define INTF_CFG_ACTIVE_H_EN    BIT(29)
> +#define INTF_CFG_ACTIVE_V_EN    BIT(30)
> +
> +#define INTF_CFG2_DATABUS_WIDEN BIT(0)
> +#define INTF_CFG2_DATA_HCTL_EN  BIT(4)
> +
>   static const struct dpu_intf_cfg *_intf_offset(enum dpu_intf intf,
>   		const struct dpu_mdss_cfg *m,
>   		void __iomem *addr,
> @@ -139,13 +145,13 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   
>   	if (active_h_end) {
>   		active_hctl = (active_h_end << 16) | active_h_start;
> -		intf_cfg |= BIT(29);
> +		intf_cfg |= INTF_CFG_ACTIVE_H_EN;
>   	} else {
>   		active_hctl = 0;
>   	}
>   
>   	if (active_v_end)
> -		intf_cfg |= BIT(30);
> +		intf_cfg |= INTF_CFG_ACTIVE_V_EN;
>   
>   	hsync_ctl = (hsync_period << 16) | p->hsync_pulse_width;
>   	display_hctl = (hsync_end_x << 16) | hsync_start_x;
> @@ -156,7 +162,7 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	 * if compression is enabled in 1 pixel per clock mode
>   	 */
>   	if (p->wide_bus_en)
> -		intf_cfg2 |=  (BIT(0) | BIT(4));
> +		intf_cfg2 |= (INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN);
>   
>   	data_width = p->width;
>   
> @@ -178,8 +184,8 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   		active_hctl = (active_h_end << 16) | active_h_start;
>   		display_hctl = active_hctl;
>   
> -		intf_cfg |= BIT(29);
> -		intf_cfg |= BIT(30);
> +		intf_cfg |= INTF_CFG_ACTIVE_H_EN;
> +		intf_cfg |= INTF_CFG_ACTIVE_V_EN;
>   	}
>   
>   	den_polarity = 0;


-- 
With best wishes
Dmitry
