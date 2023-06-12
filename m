Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D23FB72CBC8
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jun 2023 18:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD6F010E0A6;
	Mon, 12 Jun 2023 16:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3289310E2B8
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 16:51:03 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f63ea7bfb6so5143726e87.3
 for <dri-devel@lists.freedesktop.org>; Mon, 12 Jun 2023 09:51:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686588660; x=1689180660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=bc2XJlWre4e2gBDTdr+40bFjaee8RTH5UZuMdlZsuEU=;
 b=eZRgWXqo4hq6/oz9ha7x5zEK9V63CWuGLWH1lCsWH+9SQalC9QrdW9+Z8Sm1vPaZQW
 zjNDfoE6ARzQMwD+LgcM11ZFKqNHjtoz+e6al+L+ysHRyViWSg9iEGWzZDxB3xHFSiAL
 YyQ7LU2QpfIixZ3vpyayhXQh+zlMwNl/Vuk1TEiBH7bWjHFTRbVcVAfCeCygiqzO3BXU
 HdOIrIvijxV28fZ/XvnLZHMiz0XOdVl3768Q6DVJ/Zp68oUbRDTUzMEw17/bABFys7pQ
 OSG5P2bTuU7z6msDQPCa4G7wqBEjVeeirRTCPaUG9r3ebjQdOhvysO5ex8DjjOzNDAmz
 XoUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686588660; x=1689180660;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=bc2XJlWre4e2gBDTdr+40bFjaee8RTH5UZuMdlZsuEU=;
 b=W8FRXWylF7P4VbmTYkuwdfcl8+wJeLvkWzcJzfOWr6vPGx05FTQtgh6mdmgH5R7o9W
 jQ/S0/Ui4TEMnaOaT46O64tgh/QWdQ+yW5Fxs/42/OAw4ls/B7xv6bvNLeTh/0++Z3uC
 CWq28w5wMHs3ZUaP3X9JR9jPNvxLiCzh719OzVY3Jptu/vnYEydZrVDB+F+4+920KPL8
 kiL8qDRqR6Sa2Xf0nPRVBksJ4dlvp0/CM9srRoOOHXjImti3P+Y+J3ff062DKTST1DQL
 o1h34EdAKTc5PsswwdNQnA3qsEv9YpKk+JEhzl8csUKvB10KGFS0IFSgU0tWrU92x+SV
 4RwA==
X-Gm-Message-State: AC+VfDxxcc5guvDDRKASMYhkYotcuPz7Kwi3Ogc12U0xLhMvQo116lmH
 auL04W86ZkY3EavKkLxNIYrRLw==
X-Google-Smtp-Source: ACHHUZ6EkKBZ+W8P5v+lv3YaBBS6PyGdorCb5izxLPIOXCqPw9kHf6veSA7sPnKJFqZWW7ZxSuYXRA==
X-Received: by 2002:a19:5f1c:0:b0:4f3:a69e:1d80 with SMTP id
 t28-20020a195f1c000000b004f3a69e1d80mr3863304lfb.0.1686588659862; 
 Mon, 12 Jun 2023 09:50:59 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 j4-20020ac253a4000000b004f262997496sm1479085lfh.76.2023.06.12.09.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Jun 2023 09:50:59 -0700 (PDT)
Message-ID: <ce7c4402-b58e-b5df-c864-9f1a959132d0@linaro.org>
Date: Mon, 12 Jun 2023 18:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v3 1/2] arm64: dts: qcom: sm8550: fix low_svs RPMhPD labels
Content-Language: en-US
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
References: <20230601-topic-sm8550-upstream-dp-v3-0-5f9ffdcb8369@linaro.org>
 <20230601-topic-sm8550-upstream-dp-v3-1-5f9ffdcb8369@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20230601-topic-sm8550-upstream-dp-v3-1-5f9ffdcb8369@linaro.org>
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



On 12.06.2023 17:26, Neil Armstrong wrote:
> "low" was written "lov", fix this.
> 
> Fixes: 99d33ee61cb0 ("arm64: dts: qcom: sm8550: Add missing RPMhPD OPP levels")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
https://lore.kernel.org/linux-arm-msm/1d3c05f5-c1bd-6844-1788-8df0b863a02e@linaro.org/

somebody forgot to run `b4 trailers -u` :P

Konrad
>  arch/arm64/boot/dts/qcom/sm8550.dtsi | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> index 75cd374943eb..972df1ef86ee 100644
> --- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
> @@ -3649,15 +3649,15 @@ rpmhpd_opp_min_svs: opp-48 {
>  						opp-level = <RPMH_REGULATOR_LEVEL_MIN_SVS>;
>  					};
>  
> -					rpmhpd_opp_lov_svs_d2: opp-52 {
> +					rpmhpd_opp_low_svs_d2: opp-52 {
>  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D2>;
>  					};
>  
> -					rpmhpd_opp_lov_svs_d1: opp-56 {
> +					rpmhpd_opp_low_svs_d1: opp-56 {
>  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D1>;
>  					};
>  
> -					rpmhpd_opp_lov_svs_d0: opp-60 {
> +					rpmhpd_opp_low_svs_d0: opp-60 {
>  						opp-level = <RPMH_REGULATOR_LEVEL_LOW_SVS_D0>;
>  					};
>  
> 
