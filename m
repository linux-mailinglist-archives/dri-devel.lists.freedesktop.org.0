Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0617483CE96
	for <lists+dri-devel@lfdr.de>; Thu, 25 Jan 2024 22:27:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 487F710EE81;
	Thu, 25 Jan 2024 21:27:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1657810EB12
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 21:27:19 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-50e9e5c97e1so199195e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 25 Jan 2024 13:27:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706217977; x=1706822777; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=opr0EZwZFRd7qWwZr6ONiP97uq3gqlCbm0L08Nd9OHI=;
 b=X3rRa5Nsnfao+EYuL2cSAMWMCvlIAJLjBMI7SM00y16ELCS8qeh7VUwnwz8vLWDvCO
 mxLjhetj1F+4cwTMUfpAJT9GpB0DcXeCEbv6uAlAGLN4tsTmIs6I0NJCsBg+jyTtr/MM
 p/7maLSUDNYEK30ANX/uqE4gFqY+jiENZrbceLN2WJM6hBpa9kn/qjH3nf3iODCyLIkO
 9wB4Mfc9V8sbO6h8jNdQIQFvtDhFOn4gllIHufcafPx3ug2AL1yZiR8lI0ie4DGsSEez
 zK31y3yIhp+2nEEul7+fhVo9fkz/n6YKNaq0dkwuQpCzg6Cu/nWnNKZFH2n06rFbedsY
 eyqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706217977; x=1706822777;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=opr0EZwZFRd7qWwZr6ONiP97uq3gqlCbm0L08Nd9OHI=;
 b=NegBpjXxnC0fmz90/WyqTf/zdV851p7q54OOaTWJG9dCDiieb2U6V/gWnjIL3j/vls
 QCBV9a5LaxPPh3KRITNleOWgyC1x+RpLSzp3fM7kunIOY4t0SzLl6knNQt94Cj8GRob8
 VHzVnlSsSLd1D64f+In//M59W/qWJIuPSEsb0VkXo4CEePGBODqHL31bVFRhoRyqsLyj
 QXmVMLJeLwJ13ZKCogqijyn7ssQUQLRzhRed394wGKtKBLbR36MBKHSo/myDguqST+tL
 EFDwqUyPo8fhzHtpELIRJ6C+dtb6yT6PfdW1l5ngSGoAVOz8QidIJNk+sVTacBgdukif
 /GYg==
X-Gm-Message-State: AOJu0YyogZjSRtsU04NnCA5PS2EWZOkU2xnOfQT9u19I28jNJy5r4h3Y
 vhssnOAesM3nY/RT0rrSOkE7k45ePFy/LxVIsvybjuC5LpfVNYU5Ce81b9LWUts=
X-Google-Smtp-Source: AGHT+IEthVdS3oiU5SgGOGVij7Tqs27ox5N9f6J9OaKXHHoWrkKuT8IDlQFxTjG3KOLJhwasDUGdWQ==
X-Received: by 2002:a05:6512:2208:b0:510:ce9:b2d5 with SMTP id
 h8-20020a056512220800b005100ce9b2d5mr227864lfu.126.1706217977446; 
 Thu, 25 Jan 2024 13:26:17 -0800 (PST)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a196916000000b005102196b586sm131568lfc.152.2024.01.25.13.26.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 25 Jan 2024 13:26:17 -0800 (PST)
Message-ID: <301cdbe2-7377-4b0f-bd24-5131f8928c29@linaro.org>
Date: Thu, 25 Jan 2024 23:26:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] drm/msm/dpu: disallow widebus en in INTF_CONFIG2
 when DP is YUV420
Content-Language: en-GB
To: Paloma Arellano <quic_parellan@quicinc.com>,
 freedreno@lists.freedesktop.org
References: <20240125193834.7065-1-quic_parellan@quicinc.com>
 <20240125193834.7065-8-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20240125193834.7065-8-quic_parellan@quicinc.com>
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
Cc: neil.armstrong@linaro.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 swboyd@chromium.org, seanpaul@chromium.org, marijn.suijten@somainline.org,
 quic_jesszhan@quicinc.com, quic_khsieh@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25/01/2024 21:38, Paloma Arellano wrote:
> INTF_CONFIG2 register cannot have widebus enabled when DP format is
> YUV420. Therefore, program the INTF to send 1 ppc.

I think this is handled in the DP driver, where we disallow wide bus for 
YUV 4:2:0 modes.

> 
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> index 6bba531d6dc41..bfb93f02fe7c1 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> @@ -168,7 +168,9 @@ static void dpu_hw_intf_setup_timing_engine(struct dpu_hw_intf *ctx,
>   	 * video timing. It is recommended to enable it for all cases, except
>   	 * if compression is enabled in 1 pixel per clock mode
>   	 */
> -	if (p->wide_bus_en)
> +	if (dp_intf && fmt->base.pixel_format == DRM_FORMAT_YUV420)
> +		intf_cfg2 |= INTF_CFG2_DATA_HCTL_EN;
> +	else if (p->wide_bus_en)
>   		intf_cfg2 |= INTF_CFG2_DATABUS_WIDEN | INTF_CFG2_DATA_HCTL_EN;
>   
>   	data_width = p->width;

-- 
With best wishes
Dmitry

