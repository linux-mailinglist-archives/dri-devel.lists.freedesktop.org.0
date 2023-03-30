Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D93BD6D04C6
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:33:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AB5210E2C7;
	Thu, 30 Mar 2023 12:33:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 695E010E119
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:33:10 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id c9so13876403lfb.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 05:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680179588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Acz7a75RYn2MxRh03BFFRpFoesYJbXn4si/ao0hsblE=;
 b=ZreaFzd/EtdSzQQric5+NR9EFi92/hXcWMc00rZQQSy5/pi3dXb8VSEXAvUKrqtgbC
 HLYH6o3SN+03YnkIpQy6ovxtIGSNwrowOdOcWWLFrSwR+Cziz64kquZCAyFcRUhk9Yb9
 RMdaZiQF6V8oW8qZbWPknPqk0UyYxRdr+gazcbY6fqFPxUpkmduso2paG+HK7B2o5AP4
 lE4vAj3vJGR2Rlo1uy8eyEt1F3SO/aD8jRVsGikfhKQpRcVoZXaxOzpO5K/SGvS0xH/B
 I/A+G6KhpCWJ0PHHEbsefnHvNv6SCl2s9oCQI4d6VONXOPnJBv1iZSXq0gG+j7GwH5qd
 jBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680179588;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Acz7a75RYn2MxRh03BFFRpFoesYJbXn4si/ao0hsblE=;
 b=UWiguAykNG3btXV+86SPPdpqNKm1ytsICxUddd0ekha+frnuYZqMEQrCIWr+EvjNt3
 D0nw/o2qhoxUGtvF8DLeqscLEFkdgDFbrvJjIqgZ7PqoZtpdrfJ/MjZMbDo3mMMzKHD/
 SyigVuwGTlp9ZNXageU9jFHUIdnH0jy1rt46ehF1GJh2N/tIUvH2t3WkvVoav1nFu2fG
 8q6Flx0G9rXKPKB4N0C4av6axCpqiOI08HfB+cEyrs2+EZtlxtvJF6dumjPkP4cqLBLX
 EWohhBeVqd2SJzQYt7hKIGLpemT6/W3exTQ+tUNCY+Jzd817aiua3EZbuKxRw4EGmSAK
 LDmw==
X-Gm-Message-State: AAQBX9favI6+ZT4q0ZThTw+dzAAxZTQtEGe6D8JMa20SQDNWdhgW8Hm0
 sQr3F+JQMmVXQPQpTYjaVhlfBA==
X-Google-Smtp-Source: AKy350a/C7gpK0XWIX2hQ5sqZMeXGHJsJLkoa2vvQ4uj15b43N76cax8WAThLRhKaNSyQ8x5Zdr6YA==
X-Received: by 2002:ac2:51d9:0:b0:4dc:8215:5524 with SMTP id
 u25-20020ac251d9000000b004dc82155524mr6877428lfm.31.1680179588573; 
 Thu, 30 Mar 2023 05:33:08 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 q3-20020ac25143000000b004cb43c9bf9asm5870128lfd.208.2023.03.30.05.33.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Mar 2023 05:33:08 -0700 (PDT)
Message-ID: <c7961d64-dc15-11d3-6269-74555c1c1b70@linaro.org>
Date: Thu, 30 Mar 2023 14:33:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [v2,38/50] drm/msm/dpu: enable DSPP_2/3 for LM_2/3 on sm8450
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20230211231259.1308718-39-dmitry.baryshkov@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230211231259.1308718-39-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 12.02.2023 00:12, Dmitry Baryshkov wrote:
> Mark DSPP_2 and DSPP_3 as used for LM_2 and LM_3
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
Could you point me to where it's specified downstream? I can't find it.

Also, deserves a Fixes.

Konrad
>  drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> index a3faaab2226c..3d95f2472e7a 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
> @@ -107,9 +107,9 @@ static const struct dpu_lm_cfg sm8450_lm[] = {
>  	LM_BLK("lm_1", LM_1, 0x45000, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_1, LM_0, DSPP_1),
>  	LM_BLK("lm_2", LM_2, 0x46000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_2, LM_3, 0),
> +		&sdm845_lm_sblk, PINGPONG_2, LM_3, DSPP_2),
>  	LM_BLK("lm_3", LM_3, 0x47000, MIXER_SDM845_MASK,
> -		&sdm845_lm_sblk, PINGPONG_3, LM_2, 0),
> +		&sdm845_lm_sblk, PINGPONG_3, LM_2, DSPP_3),
>  	LM_BLK("lm_4", LM_4, 0x48000, MIXER_SDM845_MASK,
>  		&sdm845_lm_sblk, PINGPONG_4, LM_5, 0),
>  	LM_BLK("lm_5", LM_5, 0x49000, MIXER_SDM845_MASK,
