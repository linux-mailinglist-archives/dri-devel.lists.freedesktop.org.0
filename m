Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CB6E6E8616
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 01:53:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9DA10EB51;
	Wed, 19 Apr 2023 23:53:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F57C10EB51
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 23:53:32 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id x34so914109ljq.1
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Apr 2023 16:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681948410; x=1684540410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=vNfByshoyjqkggpUZm4KV9+i8uHaEm21yhuILnAoxFQ=;
 b=GggfLPCUiqfeSHJrj6P8FmwsZw0QiQ8fZ4ZQIfL2Jq3r/4vobPeWQ+MuTGHySvnjk6
 S+wB+8BGrooeS4Q4zN5PZu0Fm+tnI757qZ+e4NRIO5eBgieDINdrGTPQWf+aGuf4Senf
 hwB94WfCRNUIuDbFM+Fa1mL42QBPwpS1HYWP9Y+cdfjuEunR4nS3ClAcOiPVbBmdv33t
 o7WjAjCGDa1qRb/J7aIuWfz0/gloNazkIJP5kpKQkJK0+cir/SZQ9Mz3Eh8eO8BLDZO1
 hAutJ7sZ9EdTbhojc9h9VHDDJVijVNh7zT+VHchgCcNvDM5ZkAPSV1tPzJTfDbU6/aaT
 3OgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681948410; x=1684540410;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vNfByshoyjqkggpUZm4KV9+i8uHaEm21yhuILnAoxFQ=;
 b=eenCmjCxzpHZMRngEgQyPA+7lkFCrJylxLSt3Ui97FwBbFfoEcIIseYnlvm9AB78mu
 BUyOCyMJG24Acv7kyXedhBt8EeOmBAUpDCj0k5arf0+zbudFdAfIBfrXL4nL+SCUnNQ4
 um70NrWXOghNaesxqKAs0qmKUuOzQEM+scgvJiDDLlSsbki05KH3LdFXlQ5Pw4KHlOKi
 CClKybp4XjCdvTjnQXtD618KJ3Rr4jpwdfmob/pPIqyTfGrUu17DqEDqFP58zNqBOVR4
 ekK03695V8zUYRyyiIxrir2E5H9R1gqjyNBr6buNdhS/K86C6rpY+o/+x16kIw5eOd+Q
 Kysg==
X-Gm-Message-State: AAQBX9ekZJoa9AFLAS6x4YlMyshf9mw77X342xgsPFcaGwwX0UKlGJjr
 ljONrrR8FCDyo4nQDzktvYPwQA==
X-Google-Smtp-Source: AKy350biEzgLEyIpYHveGxLtCjMiXGmGu+3e1mnunIHc5qW3Ihz5GGf3Ox/yara6uiG/98fMFL2FRQ==
X-Received: by 2002:a2e:8852:0:b0:29a:9b26:4e25 with SMTP id
 z18-20020a2e8852000000b0029a9b264e25mr2398442ljj.6.1681948410594; 
 Wed, 19 Apr 2023 16:53:30 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5?
 (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
 by smtp.gmail.com with ESMTPSA id
 w9-20020ac24429000000b004ed149acc08sm47886lfl.93.2023.04.19.16.53.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Apr 2023 16:53:30 -0700 (PDT)
Message-ID: <9d7f81fc-945e-9704-4eb2-d2e5cb31297e@linaro.org>
Date: Thu, 20 Apr 2023 02:53:29 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH 1/4] drm/msm: add some cec register bitfield details
Content-Language: en-GB
To: Arnaud Vrac <avrac@freebox.fr>, Rob Clark <robdclark@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
References: <20230418-msm8998-hdmi-cec-v1-0-176479fb2fce@freebox.fr>
 <20230418-msm8998-hdmi-cec-v1-1-176479fb2fce@freebox.fr>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230418-msm8998-hdmi-cec-v1-1-176479fb2fce@freebox.fr>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 18/04/2023 21:10, Arnaud Vrac wrote:
> The register names and bitfields were determined from the downstream
> msm-4.4 driver.
> 
> Signed-off-by: Arnaud Vrac <avrac@freebox.fr>
> ---
>   drivers/gpu/drm/msm/hdmi/hdmi.xml.h | 62 ++++++++++++++++++++++++++++++++++++-
>   1 file changed, 61 insertions(+), 1 deletion(-)

I have opened MR against Mesa at 
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/22588.

The patch is:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Minor nit below

> 
> diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> index 973b460486a5a..b4dd6e8cba6b7 100644
> --- a/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> +++ b/drivers/gpu/drm/msm/hdmi/hdmi.xml.h
> @@ -76,6 +76,13 @@ enum hdmi_acr_cts {
>   	ACR_48 = 3,
>   };
>   
> +enum hdmi_cec_tx_status {
> +	CEC_TX_OK = 0,
> +	CEC_TX_NACK = 1,
> +	CEC_TX_ARB_LOSS = 2,
> +	CEC_TX_MAX_RETRIES = 3,
> +};
> +
>   #define REG_HDMI_CTRL						0x00000000
>   #define HDMI_CTRL_ENABLE					0x00000001
>   #define HDMI_CTRL_HDMI						0x00000002
> @@ -476,20 +483,73 @@ static inline uint32_t HDMI_DDC_REF_REFTIMER(uint32_t val)
>   #define REG_HDMI_HDCP_SW_LOWER_AKSV				0x00000288
>   
>   #define REG_HDMI_CEC_CTRL					0x0000028c
> +#define HDMI_CEC_CTRL_ENABLE					0x00000001
> +#define HDMI_CEC_CTRL_SEND_TRIGGER				0x00000002
> +#define HDMI_CEC_CTRL_FRAME_SIZE__MASK				0x000001f0
> +#define HDMI_CEC_CTRL_FRAME_SIZE__SHIFT				4
> +static inline uint32_t HDMI_CEC_CTRL_FRAME_SIZE(uint32_t val)
> +{
> +	return ((val) << HDMI_CEC_CTRL_FRAME_SIZE__SHIFT) & HDMI_CEC_CTRL_FRAME_SIZE__MASK;
> +}
> +#define HDMI_CEC_CTRL_LINE_OE					0x00000200
>   
>   #define REG_HDMI_CEC_WR_DATA					0x00000290
> +#define HDMI_CEC_WR_DATA_BROADCAST				0x00000001
> +#define HDMI_CEC_WR_DATA_DATA__MASK				0x0000ff00
> +#define HDMI_CEC_WR_DATA_DATA__SHIFT				8
> +static inline uint32_t HDMI_CEC_WR_DATA_DATA(uint32_t val)
> +{
> +	return ((val) << HDMI_CEC_WR_DATA_DATA__SHIFT) & HDMI_CEC_WR_DATA_DATA__MASK;
> +}
>   
> -#define REG_HDMI_CEC_CEC_RETRANSMIT				0x00000294
> +#define REG_HDMI_CEC_RETRANSMIT					0x00000294
> +#define HDMI_CEC_RETRANSMIT_ENABLE				0x00000001
> +#define HDMI_CEC_RETRANSMIT_COUNT__MASK				0x000000fe
> +#define HDMI_CEC_RETRANSMIT_COUNT__SHIFT			1
> +static inline uint32_t HDMI_CEC_RETRANSMIT_COUNT(uint32_t val)
> +{
> +	return ((val) << HDMI_CEC_RETRANSMIT_COUNT__SHIFT) & HDMI_CEC_RETRANSMIT_COUNT__MASK;
> +}
>   
>   #define REG_HDMI_CEC_STATUS					0x00000298
> +#define HDMI_CEC_STATUS_BUSY					0x00000001
> +#define HDMI_CEC_STATUS_TX_FRAME_DONE				0x00000008
> +#define HDMI_CEC_STATUS_TX_STATUS__MASK				0x000000f0
> +#define HDMI_CEC_STATUS_TX_STATUS__SHIFT			4
> +static inline uint32_t HDMI_CEC_STATUS_TX_STATUS(enum hdmi_cec_tx_status val)
> +{
> +	return ((val) << HDMI_CEC_STATUS_TX_STATUS__SHIFT) & HDMI_CEC_STATUS_TX_STATUS__MASK;
> +}
>   
>   #define REG_HDMI_CEC_INT					0x0000029c
> +#define HDMI_CEC_INT_TX_DONE					0x00000001
> +#define HDMI_CEC_INT_TX_DONE_MASK				0x00000002
> +#define HDMI_CEC_INT_TX_ERROR					0x00000004
> +#define HDMI_CEC_INT_TX_ERROR_MASK				0x00000008
> +#define HDMI_CEC_INT_MONITOR					0x00000010
> +#define HDMI_CEC_INT_MONITOR_MASK				0x00000020
> +#define HDMI_CEC_INT_RX_DONE					0x00000040
> +#define HDMI_CEC_INT_RX_DONE_MASK				0x00000080
>   
>   #define REG_HDMI_CEC_ADDR					0x000002a0
>   
>   #define REG_HDMI_CEC_TIME					0x000002a4
> +#define HDMI_CEC_TIME_ENABLE					0x00000001
> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK			0x0000ff80
> +#define HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT			7
> +static inline uint32_t HDMI_CEC_TIME_SIGNAL_FREE_TIME(uint32_t val)
> +{
> +	return ((val) << HDMI_CEC_TIME_SIGNAL_FREE_TIME__SHIFT) & HDMI_CEC_TIME_SIGNAL_FREE_TIME__MASK;
> +}
>   
>   #define REG_HDMI_CEC_REFTIMER					0x000002a8
> +#define HDMI_CEC_REFTIMER_ENABLE				0x00010000

I think this should come after the REFTIMER field.

> +#define HDMI_CEC_REFTIMER_REFTIMER__MASK			0x0000ffff
> +#define HDMI_CEC_REFTIMER_REFTIMER__SHIFT			0
> +static inline uint32_t HDMI_CEC_REFTIMER_REFTIMER(uint32_t val)
> +{
> +	return ((val) << HDMI_CEC_REFTIMER_REFTIMER__SHIFT) & HDMI_CEC_REFTIMER_REFTIMER__MASK;
> +}
>   
>   #define REG_HDMI_CEC_RD_DATA					0x000002ac
>   
> 

-- 
With best wishes
Dmitry

