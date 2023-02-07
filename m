Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A59CE68DCC6
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 16:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5356710E531;
	Tue,  7 Feb 2023 15:20:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1551910E517
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Feb 2023 15:20:37 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v13so15929982eda.11
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Feb 2023 07:20:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=rhCNOcyRpNLZBCgbM6oSGWNvw1+XdQSGy3BecVAhAEw=;
 b=E4nJecrnv18zMkprVCsirCNTaU/ult/DZ/EWlQU1Z3ZQ+p+7EM1R7UREVIUi4i2rPz
 Ek11py0bXP2n8N2tEHbHewXjZj/BW7UMX6y4tFZI7aFBmfdGWJFRPSznsAaWVIesF01z
 8+Q+5Mw2rdApzpzRBVou+ivV7aZyRfAW48d6dR1jkoR1Q/gn1Q9NXZ2DY3yyUp9tgKj+
 wXMcqSvQ2mwlbeBy0mO8dPVRtOcAoM9rke//W7yFdud9x/QN6McDu3rnGJQvdZEsEcTY
 tW9ek2yD7v3kFpuweMQowWPEFQtBlQRaQ89Brb8ShcVUF8ldI0MAxBIbcuGq64MfKndg
 D5lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=rhCNOcyRpNLZBCgbM6oSGWNvw1+XdQSGy3BecVAhAEw=;
 b=rC/dEm0nMaBk77ZO1d6ZURQDX28eYOrDxd9e26KYD8rHYHe0/a3uP0dQPzOGtCUD1n
 Z3OwBzd/YPKV8n1pqBw0HnXp8m6AOGDXQwi+qL70opswzMYQkZVRXQoBhBqjbn0hepiC
 aRCRKMzEk9lZJ+pxCC9k2z/pkFH6FloO3xhJbzmp8f36WdQv8yEWG9sJMX+6JHnKqR2Y
 W+Xh+n9KVcjB6eusdSBddjFWl+HGwB7qlkXaVK1WX3tdZiuR00nQWBGWMrbMH9iYO511
 EsaBfXyiQFvovCCL3ykSogCaCeF13Y8Sq10qd9xjb9S+/ggDKoQeB3s13UGIy+QFAUoZ
 AkCw==
X-Gm-Message-State: AO0yUKWNvwrlANTegvODYHblqTZCLb0bhh1I4haD7K6hcq0AbSEvSqGe
 BOYZ4zejeKy2bZoIFW8QPn8g3g==
X-Google-Smtp-Source: AK7set86e/LGn+ZCVqFVYC53Q4uR7aJ0HPCsmm5q9Ewnkb/wUQdVK8zCIeUfGl9odi9ZER2D5QOSqA==
X-Received: by 2002:a50:d783:0:b0:481:420e:206d with SMTP id
 w3-20020a50d783000000b00481420e206dmr3723824edi.42.1675783235575; 
 Tue, 07 Feb 2023 07:20:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 u2-20020a509502000000b0049e08f781e3sm6695629eda.3.2023.02.07.07.20.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Feb 2023 07:20:35 -0800 (PST)
Message-ID: <0b14695d-31c2-75cf-5c8c-9171136500f9@linaro.org>
Date: Tue, 7 Feb 2023 17:20:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v2 1/4] drm/msm/dpu: clear DSPP reservations in rm release
Content-Language: en-GB
To: Kalyan Thota <quic_kalyant@quicinc.com>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <1675780196-3076-1-git-send-email-quic_kalyant@quicinc.com>
 <1675780196-3076-2-git-send-email-quic_kalyant@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <1675780196-3076-2-git-send-email-quic_kalyant@quicinc.com>
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
Cc: robdclark@chromium.org, dianders@chromium.org, quic_abhinavk@quicinc.com,
 linux-kernel@vger.kernel.org, quic_vpolimer@quicinc.com,
 marijn.suijten@somainline.org, swboyd@chromium.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/02/2023 16:29, Kalyan Thota wrote:
> Clear DSPP reservations from the global state during
> rm release
> 
> Fixes: e47616df008b ("drm/msm/dpu: add support for color
> 		     processing blocks in dpu driver")

This should fit into a single line (even it is longer than the 
recommended length).

And no empty lines between Fixes and next tags.

> 
> Signed-off-by: Kalyan Thota <quic_kalyant@quicinc.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> index 73b3442..718ea0a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> @@ -572,6 +572,8 @@ void dpu_rm_release(struct dpu_global_state *global_state,
>   		ARRAY_SIZE(global_state->ctl_to_enc_id), enc->base.id);
>   	_dpu_rm_clear_mapping(global_state->dsc_to_enc_id,
>   		ARRAY_SIZE(global_state->dsc_to_enc_id), enc->base.id);
> +	_dpu_rm_clear_mapping(global_state->dspp_to_enc_id,
> +		ARRAY_SIZE(global_state->dspp_to_enc_id), enc->base.id);
>   }
>   
>   int dpu_rm_reserve(

-- 
With best wishes
Dmitry

