Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D043629ADF
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 14:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 485C310E3FA;
	Tue, 15 Nov 2022 13:43:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CEB110E3F6
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 13:42:57 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id d3so17576774ljl.1
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Nov 2022 05:42:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fCqAsBzIYqwnKg+sxRUK0clUHkV80l++z9LwleH3TLc=;
 b=AUHd9Vl5XP7LwggKtY0uN5sgsYZiCX11QgiYSD/c+2+rtQ6+Jout/Ghg6QdWN2Qbo9
 x5sSBRJ5fWqochfRzBHxwpEJ3eWCKo0vZ0EJkYX0sXssEZul7nrA+GuFTiRVN+Cc+drY
 zGeVJUBf4HXYPi+Ry4d0vSfJWJznx2ZPxGh9CAA+98EdXmjm17QHoPIHllnON+AA1NXp
 QJZmkTvQJUALIfdpm/INLAuq6SFbvq75Z2AYmM7cLD9I5q5qVrcWZ9hPZpbJ/T6fljgw
 CPm00n1HJQDmrJG8PqqJxutx3LaeUVa0R4f7IFQ6q9VZPQVnSDtV+kEn+Zw5muVgjdRR
 USgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=fCqAsBzIYqwnKg+sxRUK0clUHkV80l++z9LwleH3TLc=;
 b=zDYeAPsOYYCcxBL5VCh/TYxcQO8AdGBnNog847glb0lV55HtFxVwF+vkRR3m+jKWXo
 HzQf6BzItlJM4xlkKBY17c3fp2TKBxBCmPLPO+8GqYDz/2qOpofjAM0ELNOJmQvnHYu3
 q2vGWvZDsh5r4IG+S4QETHJ/F5fvNXx4pb4V/WmUexQ6FU8YtUf5MvSd9jQhmytxRrk+
 J2TWQ3imAgG7a14H6lVt0fSJlQO9kOfsCzZRY0Y4tC5XRw+FFfbM7Xc198BZG8jGMQmF
 AG8PPY/oBcsp8xgZhEBTXlyEBtiPKiZHrQ1SRCegsXQFBIbfIEhr1uOLxl9XAGQfH1E/
 3cXA==
X-Gm-Message-State: ANoB5pkdsh8BZ7j9FOvsIXFmAVm5xB8uUJ+6LnIi6KyiNY2WBOf4MDQv
 POS5SfQJ0WDH1wkc4tWZXGsEQA==
X-Google-Smtp-Source: AA0mqf4jM/aaIEgxVl/vgYByJ08SwHmGqaXCY2GmD+dfUWrVFiHIuOPXAH4wPeBOtq/q5Y2zoAogbA==
X-Received: by 2002:a2e:9a88:0:b0:276:b134:b04c with SMTP id
 p8-20020a2e9a88000000b00276b134b04cmr5684299lji.492.1668519775520; 
 Tue, 15 Nov 2022 05:42:55 -0800 (PST)
Received: from [192.168.31.208] ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 d13-20020ac244cd000000b004ac980a1ba1sm2215836lfm.24.2022.11.15.05.42.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Nov 2022 05:42:55 -0800 (PST)
Message-ID: <fed78af8-015b-e57d-76c7-68c8ba317952@linaro.org>
Date: Tue, 15 Nov 2022 14:42:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v2 06/12] drm/msm: Add support for SM8350
To: Robert Foss <robert.foss@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, dmitry.baryshkov@linaro.org, sean@poorly.run,
 airlied@linux.ie, daniel@ffwll.ch, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, agross@kernel.org,
 bjorn.andersson@linaro.org, quic_kalyant@quicinc.com, swboyd@chromium.org,
 angelogioacchino.delregno@somainline.org, loic.poulain@linaro.org,
 quic_khsieh@quicinc.com, quic_vpolimer@quicinc.com, vkoul@kernel.org,
 dianders@chromium.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Jonathan Marek <jonathan@marek.ca>, vinod.koul@linaro.org,
 quic_jesszhan@quicinc.com, andersson@kernel.org
References: <20221115133105.980877-1-robert.foss@linaro.org>
 <20221115133105.980877-7-robert.foss@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20221115133105.980877-7-robert.foss@linaro.org>
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



On 15/11/2022 14:30, Robert Foss wrote:
> Add compatibles string, "qcom,sm8350-mdss", for the multimedia display
> subsystem unit used on Qualcomm SM8350 platform.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>   drivers/gpu/drm/msm/msm_mdss.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
> index a2264fb517a1..39746b972cdd 100644
> --- a/drivers/gpu/drm/msm/msm_mdss.c
> +++ b/drivers/gpu/drm/msm/msm_mdss.c
> @@ -293,6 +293,9 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
>   		/* UBWC_2_0 */
>   		msm_mdss_setup_ubwc_dec_20(msm_mdss, 0x1e);
>   		break;
> +	case DPU_HW_VER_700:
> +		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 1, 1);
> +		break;
Shouldn't the second-last argument be 2 or 3 depending on DDR type?

Konrad
>   	case DPU_HW_VER_720:
>   		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
>   		break;
> @@ -530,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
>   	{ .compatible = "qcom,sc8180x-mdss" },
>   	{ .compatible = "qcom,sm8150-mdss" },
>   	{ .compatible = "qcom,sm8250-mdss" },
> +	{ .compatible = "qcom,sm8350-mdss" },
>   	{ .compatible = "qcom,sm8450-mdss" },
>   	{}
>   };
