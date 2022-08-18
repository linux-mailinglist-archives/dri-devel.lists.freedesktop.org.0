Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCB12597F02
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 09:10:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36F3CBE362;
	Thu, 18 Aug 2022 07:10:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1619BBE345
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 07:10:29 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u1so1004757lfq.4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Aug 2022 00:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=4AkHVnmH3Qgljaq8kspzBsE5mDKEXgmNmBcNRLyZpfo=;
 b=gZpAZJTQ8l5SemqKeTwFepwZXG7wa1f6L0zrraK6KM5GRT2GfnEYaougqWwQRTJJ3R
 tlGuMAGBrfDDtjT8pks99gfOWY72Be1YUWjrYzeTLja605yzJegKFQauEfHWnj7Yoq7m
 UEVGM+trkCYe22YUFEGun9AyKKldYjuOoRa7dyvN7AhsjEOyVd266XcZDIghdjHyF4/A
 ca3ezFZ8E89j/fDFlb54QHxDJbfcy/GWC0O0cyD/U4rmE4DL/R1Ow7ZmDip8wG3LE61Q
 LbH35rWVo8ULcDGxY6pbLmqiVUo7xR1S3B5Mr2/G559dnG9g7QscHBJ/t6T7ibcWCs2O
 nDGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=4AkHVnmH3Qgljaq8kspzBsE5mDKEXgmNmBcNRLyZpfo=;
 b=uGAtPE223Zy5ENOQ7pDr9a2uf8c4UyRJS0svuwPReXSORcMIqwuXKNprCXBaq8L/Jo
 07BXZ79XP3s4M7V8GieNSHyyz0SbUPajY+7kw8gQUNdEoR96Tbyl6W/Crm1M/U39/r5v
 jIqTuwRi3sOTyU7SOvv4PQPcmdTNseIPNqptPif7ci1Ff2Q6D47ihtJ57mh7kdQ8prwL
 5fiQ8pJzWDoKe8/hV3ErvTBPz+RiL448fPCgggECmvtye5pY6cUdXekU1KJBELxB2mtH
 OAB1GonJ+sbjWK8mxjQpEu2zQgd+4MZeN/8GHNuF0nhF8a+zpCzyvJeaifGiYl3GQ8so
 I7Rw==
X-Gm-Message-State: ACgBeo2u+R3CSASyjx2TwKE4u5YlK92tEycBE0Jnc6HOdETgKe3/QoCJ
 NeD2wSx4E6nZHw3fetuaJdqX7w==
X-Google-Smtp-Source: AA6agR5zsBQpMggDPWPhCVXkH4YrDgWCTxmfyFBqg6rPVwRLM6tjQlIRLnwexY8i61elDwn4FUH6Ag==
X-Received: by 2002:a05:6512:114a:b0:492:84b9:b376 with SMTP id
 m10-20020a056512114a00b0049284b9b376mr555220lfg.450.1660806628262; 
 Thu, 18 Aug 2022 00:10:28 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5?
 (d15l54z9nf469l8226z-4.rev.dnainternet.fi.
 [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
 by smtp.gmail.com with ESMTPSA id
 c10-20020a056512074a00b0048aee10096fsm112529lfs.82.2022.08.18.00.10.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Aug 2022 00:10:27 -0700 (PDT)
Message-ID: <5a22d41a-f7cc-0be0-8bd1-d7d2c2133ace@linaro.org>
Date: Thu, 18 Aug 2022 10:10:25 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/5] clk: qcom: Allow custom reset ops
Content-Language: en-US
To: Akhil P Oommen <quic_akhilpo@quicinc.com>,
 freedreno <freedreno@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@gmail.com>, Bjorn Andersson
 <bjorn.andersson@linaro.org>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1660748274-39239-1-git-send-email-quic_akhilpo@quicinc.com>
 <20220817202609.v2.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220817202609.v2.2.I75baff799a363bbb960376539e3a0f737377c3f1@changeid>
Content-Type: text/plain; charset=UTF-8
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
Cc: Stephen Boyd <sboyd@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Andy Gross <agross@kernel.org>, linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/08/2022 17:57, Akhil P Oommen wrote:

Thank you for your patch. There is something to discuss/improve.

>  
>  	return regmap_update_bits(rst->regmap, map->reg, mask, 0);
> diff --git a/drivers/clk/qcom/reset.h b/drivers/clk/qcom/reset.h
> index 2a08b5e..d4213b4 100644
> --- a/drivers/clk/qcom/reset.h
> +++ b/drivers/clk/qcom/reset.h
> @@ -8,9 +8,17 @@
>  
>  #include <linux/reset-controller.h>
>  
> +struct qcom_reset_ops {
> +	int (*reset)(void *priv);
> +	int (*assert)(void *priv);
> +	int (*deassert)(void *priv);
> +};
> +
>  struct qcom_reset_map {
>  	unsigned int reg;
>  	u8 bit;
> +	struct qcom_reset_ops *ops;

This should be pointer to const.


Best regards,
Krzysztof
