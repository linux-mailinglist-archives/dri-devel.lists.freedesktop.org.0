Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F0E6C6B62
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 15:45:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9052410E11F;
	Thu, 23 Mar 2023 14:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5AF2510E0F1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 14:45:23 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v1so14692005wrv.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Mar 2023 07:45:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679582722;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=W4MzrlpTb4Yhk+gf2dIUjuh7tsdX9/TNDTntW+YKJvQ=;
 b=VNwqpfZrV6vnFmwiRhLKz9jY1Ib2cmBxdbakZRZrHeSHzA9AKpPVstW5bUCEJCE5Dq
 Rprv/C1AYM3gKWrk0hpsmQZpmZMTCBD5Mhd9nkaP6QHffhntf1hkEhmDTI6s/SXZSxho
 6jRUFnSso3D7ypelnHOflwy+xoxZSJo9rcG8mUvDwqMVtb16X1CfTci70fPpd0d5ZMYg
 dv8C2R78hJroZ7ldiETHkKLa9e9Nxxtq0/XEz3SwiugYytzGgyfvtKgcBNCc6kWgnOiD
 KFOtM5WsAYQPvBIsypLEo1OkcmcV1YT/tc0KBwnXhEv9vzn1JPdiWBxzk9AgQTm/NQcg
 pncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679582722;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W4MzrlpTb4Yhk+gf2dIUjuh7tsdX9/TNDTntW+YKJvQ=;
 b=tdmg55hgGpOfWXtCIv0Wn9hhGfTSVBAQ63DHrj5poIG7kW5cn2sYf4H1T2FJ9GPwMr
 dNFfRFy8fNpOH9Y91kAxZ57YiwnLRl9jVJ4fkktLCsGJCXCw/GgQMKA0RQnZpw7s7uD9
 /dyNH1s35la5pJjNOOmRSXRCCvfiDd4zUpy/SSa21H3Kspx2QYc0ORyQjcSpM2MzGy1A
 htAgvp89OqOCgFiLxy1CP8/f6vCRZCAqihFpZTz+etP4UcJ55+aj6M/UOwEW94mEXxhO
 sXGgYS8B2gLYCjOU1mLTJeBBd66HNwfSgoZsb77NfPBpgzPmMKVjDr+fimOwdBxXCcz3
 xjmg==
X-Gm-Message-State: AAQBX9dWQSp+ZEuUdKLNQqzH/fzKNMZLErif98C2d+LJiaAJotXk6uQT
 SupPVIfRNMlDTFKOUW6v4xQIvg==
X-Google-Smtp-Source: AKy350YwaJwmjXC3UxTKUTSA0ajmbVXL4atAUE52yKdngL+u+dc4euwmiy4LP0GSK7l3dnIU6r4mCw==
X-Received: by 2002:a5d:4d82:0:b0:2db:11f3:f7ee with SMTP id
 b2-20020a5d4d82000000b002db11f3f7eemr2473114wru.63.1679582721738; 
 Thu, 23 Mar 2023 07:45:21 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899?
 ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
 by smtp.gmail.com with ESMTPSA id
 p7-20020a1c5447000000b003dd1bd0b915sm2121364wmi.22.2023.03.23.07.45.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 07:45:21 -0700 (PDT)
Message-ID: <d16ebe42-e462-b1dd-0ea3-c368b8721ba5@linaro.org>
Date: Thu, 23 Mar 2023 15:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/8] dt-bindings: ufs: qcom: document the fact the UFS
 controller can have an ICE core
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-3-3ead1e418fe4@linaro.org>
 <167957963115.3095299.4593054829506617284.robh@kernel.org>
Organization: Linaro Developer Services
In-Reply-To: <167957963115.3095299.4593054829506617284.robh@kernel.org>
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
Reply-To: neil.armstrong@linaro.org
Cc: Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/03/2023 14:58, Rob Herring wrote:
> 
> On Thu, 23 Mar 2023 11:25:18 +0100, Neil Armstrong wrote:
>> Move the qcom,sm8450-ufshc to the right allOf:if allowing the ICE clocks
>> and registers to be specified.
>>
>> Fixes: 462c5c0aa798 ("dt-bindings: ufs: qcom,ufs: convert to dtschema")
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
> 
> My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
> on your patch (DT_CHECKER_FLAGS is new in v5.13):
> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.example.dtb: ufs@1d84000: clocks: [[4294967295, 151], [4294967295, 10], [4294967295, 150], [4294967295, 166], [4294967295, 0], [4294967295, 164], [4294967295, 160], [4294967295, 162]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.example.dtb: ufs@1d84000: clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk'] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.example.dtb: ufs@1d84000: reg: [[0, 30949376, 0, 12288]] is too short
> 	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml

Same as patch 1, I forgot to fix the example...

Neil

> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-3-3ead1e418fe4@linaro.org
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

