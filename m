Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 72108500207
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 00:48:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C62210F18D;
	Wed, 13 Apr 2022 22:48:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9009710E444
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 22:48:15 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id x17so6048313lfa.10
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 15:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Rjljh0Ck2s5oy15NuHhlHI64zRd9D7mmJO/ww9jh6KI=;
 b=JWPPH9IH9OWhM3mr2yzedKc+0F9KJv9p7R8apF2V7A2kjsZ2XZjLnG7U+Erq4JMcRx
 j2aZMzjF3EF7sBHG7wuRccxwqgQNYhJG2OA0/8d2o+R2yGaG0xoo5pvUnEK1PZuSQQP/
 AyW5hTUWVYZtAj7V484d8mdQ9j0uPbLOCvGahkS47sUhfOoFCGP3FqhrVEnL7JSRowIp
 RtZnVrR/KSP5kqhTlXNlp/gsIzFfDR+pLFTCTcw8/UzMBDKm+T/mk7PcHJ7NiBZcINFb
 3p0MHtLW7uU+S0GMER/TNzg6r4fSv9A/7HnaUwX8zWdgS0A+iIoaMMrWi+GkBc4jU2m+
 ywbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Rjljh0Ck2s5oy15NuHhlHI64zRd9D7mmJO/ww9jh6KI=;
 b=aDHBtjHVaomwI1UBxRC6VSeBsgHT5CnnteOfngjAVom+k5/21ELywBrVPY4KRtqw83
 KdhtO9pA8yqQ9qxCWbyXWkQ2TPnDdji9+hiHb1oZnml66tjUVQmdHdi/lSZRrtPAnUUO
 dCgJLBifW9+YjAbnUQlKlRXxXx36r5H7tT/fetnI3bg1eCrXdU/sIiTGtUloK6GaxN0L
 MDcRxE0GIDfuVn88C3cFdw0aD7BzRSdbRCvtqES1BTZVyd9GvBDaQs8ZSMsKP0J5PfmK
 omI3SMQilMLdBJ2NMYkPhwUo1WrMnSz282q9uvk2Ar8I0r3AGy4a//xTlz/Xs0zonVDS
 j57g==
X-Gm-Message-State: AOAM5312jQ3F3Kr+YQOKrCOWSbOy4/UttkLyTnu6xwEOMrY4HKBqHrq9
 SV/+YRqsx10YyZ5i3xc0REQaEQ==
X-Google-Smtp-Source: ABdhPJwLGOXVgRQRnW/vis5ArNXs3GbeL5yfyHkCoVwhOuEEu/oGx5gTPf1dorzul0P6MeWE+j+AqQ==
X-Received: by 2002:ac2:4c53:0:b0:44a:4357:c285 with SMTP id
 o19-20020ac24c53000000b0044a4357c285mr29062315lfk.99.1649890093755; 
 Wed, 13 Apr 2022 15:48:13 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 k16-20020a192d10000000b0046ba99878a6sm31873lfj.17.2022.04.13.15.48.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 15:48:13 -0700 (PDT)
Message-ID: <d39dca75-4f0c-6a8a-8bb3-fb745116c6f8@linaro.org>
Date: Thu, 14 Apr 2022 01:48:12 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v8 1/2] drm/msm/disp/dpu1: add inline function to validate
 format support
Content-Language: en-GB
To: Vinod Polimera <quic_vpolimer@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org
References: <1649695021-19132-1-git-send-email-quic_vpolimer@quicinc.com>
 <1649695021-19132-2-git-send-email-quic_vpolimer@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1649695021-19132-2-git-send-email-quic_vpolimer@quicinc.com>
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
Cc: quic_kalyant@quicinc.com, linux-kernel@vger.kernel.org,
 dianders@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 11/04/2022 19:37, Vinod Polimera wrote:
> Check if the dpu format is supported or not using dpu_find_format.
> 
> Co-developed-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Signed-off-by: Vinod Polimera <quic_vpolimer@quicinc.com>

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h | 22 ++++++++++++++++++++++
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 10 +++-------
>   2 files changed, 25 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> index 418f5ae..84b8b32 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h
> @@ -21,6 +21,28 @@ const struct dpu_format *dpu_get_dpu_format_ext(
>   #define dpu_get_dpu_format(f) dpu_get_dpu_format_ext(f, 0)
>   
>   /**
> + * dpu_find_format - validate if the pixel format is supported
> + * @format:		dpu format
> + * @supported_formats:	supported formats by dpu HW
> + * @num_formatss:	total number of formats
> + *
> + * Return: false if not valid format, true on success
> + */
> +static inline bool dpu_find_format(u32 format, const u32 *supported_formats,
> +					size_t num_formats)
> +{
> +	int i;
> +
> +	for (i = 0; i < num_formats; i++) {
> +		/* check for valid formats supported */
> +		if (format == supported_formats[i])
> +			return true;
> +	}
> +
> +	return false;
> +}
> +
> +/**
>    * dpu_get_msm_format - get an dpu_format by its msm_format base
>    *                     callback function registers with the msm_kms layer
>    * @kms:             kms driver
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 6565682..3216cda 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -1411,13 +1411,9 @@ static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
>   	if (modifier == DRM_FORMAT_MOD_LINEAR)
>   		return true;
>   
> -	if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED) {
> -		int i;
> -		for (i = 0; i < ARRAY_SIZE(qcom_compressed_supported_formats); i++) {
> -			if (format == qcom_compressed_supported_formats[i])
> -				return true;
> -		}
> -	}
> +	if (modifier == DRM_FORMAT_MOD_QCOM_COMPRESSED)
> +		return dpu_find_format(format, qcom_compressed_supported_formats,
> +				ARRAY_SIZE(qcom_compressed_supported_formats));
>   
>   	return false;
>   }


-- 
With best wishes
Dmitry
