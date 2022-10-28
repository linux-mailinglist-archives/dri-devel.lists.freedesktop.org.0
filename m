Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5BC2611106
	for <lists+dri-devel@lfdr.de>; Fri, 28 Oct 2022 14:19:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAECD10E198;
	Fri, 28 Oct 2022 12:19:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F18ED10E198
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 12:19:38 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id b18so8086106ljr.13
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Oct 2022 05:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QqZ/Qc1FnrWIUAUi2q99TKdUttjkOnjxxLO746k/+Bc=;
 b=xQIEY0TpD09A33rkhem0UoVZkMXzm8P+7zxsKyfZ/5USRnotlVdQidMQ/sGyxSfPAn
 DAGt2yw5sjOOk6aAdNl7AWNUHKLXPzauaO5FnoO0gE9IINBKpc8+NSNOtqEOoe4D/LRR
 J77JJhA0SiSsmMCW3DZ/nY1O7+2GBpQNwI8H34aR/GHqsD+XMCyUFVX3PZpP5byBVO3A
 gdoTU1w0kCwOnobDWwdZtjxx5WUM20hZTSpmwfeU21FKJuHdqFcGcrGrDW/pQnkJwTUc
 wW234XtCtjy7o2e54x3+ijdRYyZUycCiIhh7cWnNoEIMkxNja/UiO2dFRoY3SuIB+L4b
 Drlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=QqZ/Qc1FnrWIUAUi2q99TKdUttjkOnjxxLO746k/+Bc=;
 b=x8MeQxAnrSFXg0h92one+/GCrdZXeAXoCpVbWNwo5sbReB6pepM+xNN4xcEMFuVRNs
 Gv4ivf4W2cEVDfICKG92VqZcQHIR2jPJCWYNWhDgSH57NUq01PwCXhkaTmUaYXipBocF
 mT2Q8qGfpIjlSwf51PEWcbo5io46mc5xv/4/4nx76gW4aIxMYzD9A+hH4IRmvaYuPJEN
 Sad7NkkUU/vJBj+3RW4rDM5CwQVKKwMIrE2hDvV0eLUXs+WgLbh6LT5y4n7OuVRweWFl
 GNU7r1uhfHdmrmvUVN1bjkLFJ6M35OYVDSzf+PDkxTA/pd2TFYxxdwWDIhR4GSYOZfOL
 XN7w==
X-Gm-Message-State: ACrzQf2hJeDxPDwJB0wkXUrsdKPfMMOjuWAiQ9c/E9QzbPRdzzpb0UXL
 WmmwsZSm7JJ72Eu1GLXFWfLsOQ==
X-Google-Smtp-Source: AMsMyM411sNvmz92ardTeuC0ToSlfgrGqncLtbJKx2D+HYetFJMO9ZYRene6rqwku/khHxngvmjs/g==
X-Received: by 2002:a2e:b60a:0:b0:26e:50f:2870 with SMTP id
 r10-20020a2eb60a000000b0026e050f2870mr20706767ljn.162.1666959577212; 
 Fri, 28 Oct 2022 05:19:37 -0700 (PDT)
Received: from [10.10.15.130] ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 w21-20020a194915000000b00498fd423cc3sm540119lfa.295.2022.10.28.05.19.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 28 Oct 2022 05:19:36 -0700 (PDT)
Message-ID: <0f8e73f6-d005-7e0b-ba38-c4d0161c1acd@linaro.org>
Date: Fri, 28 Oct 2022 15:19:35 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v1 1/9] drm/msm: Add compatibles for SM8350 display
Content-Language: en-GB
To: Robert Foss <robert.foss@linaro.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, konrad.dybcio@somainline.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_vpolimer@quicinc.com, vkoul@kernel.org, dianders@chromium.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 vinod.koul@linaro.org, quic_jesszhan@quicinc.com
References: <20221028120812.339100-1-robert.foss@linaro.org>
 <20221028120812.339100-2-robert.foss@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028120812.339100-2-robert.foss@linaro.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 28/10/2022 15:08, Robert Foss wrote:
> Add compatible string for "qcom,sm8350-dpu" and
> "qcom,sm8350-mdss".
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 1 +
>   drivers/gpu/drm/msm/msm_mdss.c          | 1 +
>   2 files changed, 2 insertions(+)

[skipped]

> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index e13c5c12b775..fd5a95cace16 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -447,6 +447,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc8180x-mdss" },
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
> +	{ .compatible = "qcom,sm8350-mdss" },
>   	{}
>   };
>   MODULE_DEVICE_TABLE(of, mdss_dt_match);


BTW: you probably also have to update the msm_mdss_enable() function 
with the 8350-specific code.

-- 
With best wishes
Dmitry

