Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C583C714914
	for <lists+dri-devel@lfdr.de>; Mon, 29 May 2023 14:08:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B491210E0AA;
	Mon, 29 May 2023 12:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 100C410E27C
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 12:08:22 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f3a9ad31dbso3640456e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 May 2023 05:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685362101; x=1687954101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6N4laHrxcBKrO6d+ex168wZrn7XIXcKY1PLtyo+eeeQ=;
 b=xl3LGI/KATO58nyEhF3efLAVdsd5fzMsg1ndnuSLwdETkQ3cHu1BKl8OrD3SPizH1e
 bZADKGAGzDBUPcuZQ53occ59IYE1bJhzCvVjcpLiNHRE1Pl1FpEU/duiZvsxfFTIZkbz
 PWxigzhQWgHwEJw3mWH7w6IOb6wE+dts2wD2Z57Anys6jEPGDC4Wl4hf3KO1eWZxo9fe
 saFbCRGovkVEBRjm7zh8zG0GZ9pzSDybfj4YKVYg/CSmR0FFJtLdZjy8Ui2y0Uu7UXfM
 Re55DAT6xmg6Sa8pP7Rw9S65VuKR8y9AIdPJKCnRUkstrp4/O/YsEe+U0dduw1pNpTYo
 vACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685362101; x=1687954101;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6N4laHrxcBKrO6d+ex168wZrn7XIXcKY1PLtyo+eeeQ=;
 b=Bq0V7NfGNx9sAey/W18LLCzLbO8MM0kTsrqfmYuFzzN+5xLWbB/krgarntm+ZdgdzS
 KC28cJWv3nktxmQhUvr/jJ2JdbR6iUU53T+O0cVvrEoS2722wkxuGoBBkqqRAotYn3Eu
 jdR0KdnaxsehWNImCR1KLjNLB0wJUveXuWEENkzmJxecZkU0ApEvq/f3WiLzmHRx2ofd
 hziQxkhKq3EPUsIcJmY+BFNVbCC2vo2HqMGX0FOoQyDq81e67/+a6sUEO2wr/uMbHuka
 b3faBOrh7DpjLTu9supbtavSkokexT3JFm0yoFi69NcOdnqqYYmJ/KutNTYbb/+XjHyW
 rBjQ==
X-Gm-Message-State: AC+VfDwEaoLlr5ElSHCs2cetyrqHBxe2hYgGupMvJ8EKhXrK2cX4en0G
 X5piGhVEeeHY+ZP+Q8HPD00INg==
X-Google-Smtp-Source: ACHHUZ4uum7Tu0iR7zATFyLuJQq5xux61yqQsRwmNNMm9BV9bTZ7ZRrezf4Gx3jdtD/dOpMWekhgsg==
X-Received: by 2002:a19:f60e:0:b0:4f4:b3eb:80f7 with SMTP id
 x14-20020a19f60e000000b004f4b3eb80f7mr3332241lfe.6.1685362100879; 
 Mon, 29 May 2023 05:08:20 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 q9-20020ac25109000000b004f252003071sm1946136lfb.37.2023.05.29.05.08.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 05:08:20 -0700 (PDT)
Message-ID: <c75fd8fa-65ba-db7a-5a38-776d19fe197d@linaro.org>
Date: Mon, 29 May 2023 14:08:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 5/7] drm/msm/dsi: Add configuration for MSM8226
Content-Language: en-US
To: Luca Weiss <luca@z3ntu.xyz>, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Andy Gross
 <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230308-msm8226-mdp-v1-0-679f335d3d5b@z3ntu.xyz>
 <20230308-msm8226-mdp-v1-5-679f335d3d5b@z3ntu.xyz>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230308-msm8226-mdp-v1-5-679f335d3d5b@z3ntu.xyz>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 29.05.2023 11:44, Luca Weiss wrote:
> Add the config for the v1.0.2 DSI found on MSM8226. We can reuse
> existing bits from other revisions that are identical for v1.0.2.
> 
> Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
> ---
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Konrad
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 29ccd755cc2e..8a5fb6df7210 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -245,6 +245,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0,
>  		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_0_2,
> +		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1,
>  		&msm8974_apq8084_dsi_cfg, &msm_dsi_6g_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V1_1_1,
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 91bdaf50bb1a..43f0dd74edb6 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -11,6 +11,7 @@
>  #define MSM_DSI_VER_MAJOR_V2	0x02
>  #define MSM_DSI_VER_MAJOR_6G	0x03
>  #define MSM_DSI_6G_VER_MINOR_V1_0	0x10000000
> +#define MSM_DSI_6G_VER_MINOR_V1_0_2	0x10000002
>  #define MSM_DSI_6G_VER_MINOR_V1_1	0x10010000
>  #define MSM_DSI_6G_VER_MINOR_V1_1_1	0x10010001
>  #define MSM_DSI_6G_VER_MINOR_V1_2	0x10020000
> 
