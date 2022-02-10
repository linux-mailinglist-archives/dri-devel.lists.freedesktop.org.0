Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 281724B0D89
	for <lists+dri-devel@lfdr.de>; Thu, 10 Feb 2022 13:25:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD7CC10E839;
	Thu, 10 Feb 2022 12:25:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C3BE10E836
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 12:25:29 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id u6so10118570lfc.3
 for <dri-devel@lists.freedesktop.org>; Thu, 10 Feb 2022 04:25:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=O4VNG/Up45qwhiOzHf3sf/AW6zbqebmgwvUUBdlvIRY=;
 b=t4iAQUmzzIZ4nWhbIv7yV/jH8WTb4wTlTajvT6ktaaAoXd5mkaWOeTanf006NbN7Pz
 6ntCpCjr0/WJG9rBKL43oG7GL3auqVW/oHrM1tH2Hj3xQrMzgix7Xu2xTOK2IlTrealo
 QUhIKvQ+Y8LBtfP4JxhzlztebsCXPYVuHIXEx37qKb6k2kqev3TdvkXR457Jb3c+zOwo
 SSknw85NZ2dpGxJqUsG6Bz+vwig1Q7sXlu4UC1J32HssiyKRPE9zwhpb4586LGF1HkvZ
 jfMVN84Fy/RzuBCTFDKmd9+05bYSngG9wpu+aa2kxqYhPxYDZiUJbYFv/MXd25OTgkku
 enAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=O4VNG/Up45qwhiOzHf3sf/AW6zbqebmgwvUUBdlvIRY=;
 b=zCVhTzI63RXnU8hFXJEGGyxX1H+tqmsDewVkPlhv7/+xhGiHPccZgpXnG0JIhRCjjE
 bh5MReUdchJjKutKF0LmJykpV752ULxcXQUkXNcPsZFVk14stMR0MSPCDWfhkqlULlbh
 M//n8IOpzV7lh170e6B/QUyvzTMUM/j+cqyYhi4ZiiMZlMP8gJ61DmgyZ3tfjGwvKzds
 kg4EFouIPfLeNkosT0jQve6/A2G/3F7S9v8RMXTWXjpTuBhh6tY6+/TS26SW6ZkiRLOo
 pK4LeVXPljIA0vr40aBK2ziQ0O/Rx+wrCJgwv4XPlWiqoWZJh+OOIRTKrRIgJluUy56k
 a3bA==
X-Gm-Message-State: AOAM531WiPFh3KLAVV/V+nBIUF8tswM//zqyMvXkf7n4ZrdEzI7Vrt83
 4R79do9czh5/EOjYedLjR0DLKA==
X-Google-Smtp-Source: ABdhPJxK86barz0NVPBX19n7F1+rZNGle/QgGipkfT+1rpX8fZHByOsef/Y8lbcNGRTXKvz0k+BqTw==
X-Received: by 2002:a05:6512:4012:: with SMTP id
 br18mr4801599lfb.533.1644495927370; 
 Thu, 10 Feb 2022 04:25:27 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id h6sm500455lfj.178.2022.02.10.04.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Feb 2022 04:25:26 -0800 (PST)
Message-ID: <00e9ade6-1830-f19c-4dd8-0673809166b2@linaro.org>
Date: Thu, 10 Feb 2022 15:25:26 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 3/4] drm/panel-edp: Add eDP sharp panel support
Content-Language: en-GB
To: Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, agross@kernel.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, robdclark@gmail.com, seanpaul@chromium.org,
 swboyd@chromium.org, dianders@chromium.org,
 krzysztof.kozlowski@canonical.com, thierry.reding@gmail.com,
 sam@ravnborg.org, airlied@linux.ie, daniel@ffwll.ch
References: <1644396932-17932-1-git-send-email-quic_sbillaka@quicinc.com>
 <1644396932-17932-4-git-send-email-quic_sbillaka@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1644396932-17932-4-git-send-email-quic_sbillaka@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, quic_vproddut@quicinc.com,
 quic_mkrishn@quicinc.com, quic_abhinavk@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 09/02/2022 11:55, Sankeerth Billakanti wrote:
> Add support for the 14" sharp,lq140m1jw46 eDP panel.
> 
> Signed-off-by: Sankeerth Billakanti <quic_sbillaka@quicinc.com>

Please excuse my ignorance, is there any reason, why we can't use 
generic panel-edp here?

> ---
> 
> Changes in v3:
>    None
> 
>   drivers/gpu/drm/panel/panel-edp.c | 31 +++++++++++++++++++++++++++++++
>   1 file changed, 31 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index a394a15..5d13ccc 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1605,6 +1605,34 @@ static const struct panel_desc sharp_lq123p1jx31 = {
>   	},
>   };
>   
> +static const struct drm_display_mode sharp_lq140m1jw46_mode = {
> +	.clock = 144370,
> +	.hdisplay = 1920,
> +	.hsync_start = 1920 + 48,
> +	.hsync_end = 1920 + 48 + 32,
> +	.htotal = 1920 + 48 + 32 + 80,
> +	.vdisplay = 1080,
> +	.vsync_start = 1080 + 3,
> +	.vsync_end = 1080 + 3 + 5,
> +	.vtotal = 1080 + 3 + 5 + 69,
> +	.flags = DRM_MODE_FLAG_NVSYNC | DRM_MODE_FLAG_NHSYNC,
> +};
> +
> +static const struct panel_desc sharp_lq140m1jw46 = {
> +	.modes = &sharp_lq140m1jw46_mode,
> +	.num_modes = 1,
> +	.bpc = 8,
> +	.size = {
> +		.width = 309,
> +		.height = 174,
> +	},
> +	.delay = {
> +		.hpd_absent = 80,
> +		.enable = 50,
> +		.unprepare = 500,
> +	},
> +};
> +
>   static const struct drm_display_mode starry_kr122ea0sra_mode = {
>   	.clock = 147000,
>   	.hdisplay = 1920,
> @@ -1719,6 +1747,9 @@ static const struct of_device_id platform_of_match[] = {
>   		.compatible = "sharp,lq123p1jx31",
>   		.data = &sharp_lq123p1jx31,
>   	}, {
> +		.compatible = "sharp,lq140m1jw46",
> +		.data = &sharp_lq140m1jw46,
> +	}, {
>   		.compatible = "starry,kr122ea0sra",
>   		.data = &starry_kr122ea0sra,
>   	}, {


-- 
With best wishes
Dmitry
