Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 478526BEA46
	for <lists+dri-devel@lfdr.de>; Fri, 17 Mar 2023 14:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9004110E381;
	Fri, 17 Mar 2023 13:39:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2737710E111
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 13:39:35 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso3340256wmq.5
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 06:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679060373;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=CIfDp3gROtXKGXMIKzWbXAPrNmngywTi0JGEAejv9Ec=;
 b=KgVZec/idfHRzOWkDUQAv1fxhj6ksP5r2Vz1TcJ3E9/kHQ4hY9GmOivCfmTAPWCRv6
 NxQnp/PtQ31A8ORadVoraKxFz8MjJL0tQ0Is+q5juZ+bIsTWWnxGfP/auIJXlpEd6Ua1
 ZLPqmACUjwj5aaBko0Tbbi8EoA57sior9WgFJ377E3jKZEZP+rP647aYk+1CtCyc9TLc
 ZCJxQ0EPSU5jOjKj9paatgOAxvDm+rcaCHDgD/tls8WHM6HNzGBZ8V9dYBsdvMMegys8
 77IPAiDNlDM/Yh+cy917WV659x0SW5e67PYX3J7SrWJ8VnJTh/FSGa7UpW8+f0hqiNkP
 q39w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679060373;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CIfDp3gROtXKGXMIKzWbXAPrNmngywTi0JGEAejv9Ec=;
 b=QpHyFXbQ2lblPjKvR7CxP4eF79xU7eZ/OFtp30sPoXDDy4SQ625rZ7H76tO6kTuYH4
 7Ha2UDnvD9HdudezfvLdh1C+8nOUwvgywuK+Pfc3i7yS508tov+1ZOq8Fuk4E5xJtyuC
 9PjNSXOxAKf5UIaGmpvLPbP619lDjyCfmNrnyqKmtNNXFqhC0ocdWFqxEhHb4wM1WsgC
 vfh42PjPgd2vO5Kxl/piaVnP7S3gvd574brTs3JlOJ+XzBn6aGpscEUP15bhRH/yM2r8
 smoi2HP2VupOBCrnnlHNiZ2pmT1zCUsdks9b+PmGD663Bw5M0ZD60Y/MDe55oN5AFiEo
 1/2A==
X-Gm-Message-State: AO0yUKWn6CExC+j2naM0kKLja7XH9vrZWVsz3cr6kiG6WF/E1CDitEoT
 SQa3IOuAUi6G4ftLxWBe+bH0/g==
X-Google-Smtp-Source: AK7set8n4tLd/fOIgy+lUbYezWgQq3v0dockgttAJ/suRbNcRR+7qidJtQKNAjh4p+RY/8tPQDlbbQ==
X-Received: by 2002:a05:600c:1c1d:b0:3ea:edd7:1f1f with SMTP id
 j29-20020a05600c1c1d00b003eaedd71f1fmr24279049wms.40.1679060373534; 
 Fri, 17 Mar 2023 06:39:33 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:9ed5:bad0:e925:7938?
 ([2a01:e0a:982:cbb0:9ed5:bad0:e925:7938])
 by smtp.gmail.com with ESMTPSA id
 c9-20020a5d4cc9000000b002d21379bcabsm1972144wrt.110.2023.03.17.06.39.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Mar 2023 06:39:33 -0700 (PDT)
Message-ID: <9f7ffda5-8f7e-5b8a-15d9-4db60efdfb72@linaro.org>
Date: Fri, 17 Mar 2023 14:39:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v5 5/5] arm64: dts: qcom: sm8450: add dp controller
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Andy Gross <agross@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v5-0-a27f1b26ebe8@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v5-5-a27f1b26ebe8@linaro.org>
 <30b349bd-c083-ed17-1e20-c84e4b67d449@linaro.org>
Organization: Linaro Developer Services
In-Reply-To: <30b349bd-c083-ed17-1e20-c84e4b67d449@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/03/2023 13:19, Dmitry Baryshkov wrote:
> On 17/03/2023 11:12, Neil Armstrong wrote:
>> Add the Display Port controller subnode to the MDSS node.
>>
>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>> ---
>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 79 ++++++++++++++++++++++++++++++++++++
>>   1 file changed, 79 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> index 0b5a151ce138..41f5015e615b 100644
>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>> @@ -2751,6 +2751,13 @@ dpu_intf2_out: endpoint {
>>                           };
>>                       };
>> +                    port@2 {
>> +                        reg = <2>;
>> +                        dpu_intf0_out: endpoint {
>> +                            remote-endpoint = <&mdss_dp0_in>;
>> +                        };
>> +                    };
>> +
>>                   };
>>                   mdp_opp_table: opp-table {
>> @@ -2783,6 +2790,78 @@ opp-500000000 {
>>                   };
>>               };
>> +            mdss_dp0: displayport-controller@ae90000 {
>> +                compatible = "qcom,sm8450-dp", "qcom,sm8350-dp";
>> +                reg = <0 0xae90000 0 0x200>,
>> +                      <0 0xae90200 0 0x200>,
>> +                      <0 0xae90400 0 0xc00>,
>> +                      <0 0xae91000 0 0x400>,
>> +                      <0 0xae91400 0 0x400>;
>> +                interrupt-parent = <&mdss>;
>> +                interrupts = <12>;
>> +                clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> +                     <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +                clock-names = "core_iface",
>> +                          "core_aux",
>> +                          "ctrl_link",
>> +                                  "ctrl_link_iface",
>> +                          "stream_pixel";
>> +
>> +                assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> +                          <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +                assigned-clock-parents = <&usb_1_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +                             <&usb_1_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>> +
>> +                phys = <&usb_1_qmpphy QMP_USB43DP_DP_PHY>;
>> +                    phy-names = "dp";
>> +
>> +                    #sound-dai-cells = <0>;
>> +
>> +                operating-points-v2 = <&dp_opp_table>;
>> +                power-domains = <&rpmhpd SM8450_MMCX>;
>> +
>> +                status = "disabled";
>> +
>> +                ports {
>> +                    #address-cells = <1>;
>> +                    #size-cells = <0>;
>> +
>> +                    port@0 {
>> +                        reg = <0>;
>> +                        mdss_dp0_in: endpoint {
>> +                            remote-endpoint = <&dpu_intf0_out>;
>> +                        };
>> +                    };
>> +                };
>> +
>> +                dp_opp_table: opp-table {
>> +                    compatible = "operating-points-v2";
>> +
>> +                    opp-19200000 {
>> +                        opp-hz = /bits/ 64 <19200000>;
>> +                        required-opps = <&rpmhpd_opp_low_svs>;
>> +                    };
> 
> Yes, the vendor kernel has 19.2 MHz as a frequency for the low_svs. However I don't think we should do it this way, we list DP rates here, so the lowest entry should be RBR, 160000000.

Ok so v4 for ok for both patches 3 & 5

Will send v6 with those reverted

Neil

> 
>> +
>> +                    opp-270000000 {
>> +                        opp-hz = /bits/ 64 <270000000>;
>> +                        required-opps = <&rpmhpd_opp_svs>;
>> +                    };
>> +
>> +                    opp-540000000 {
>> +                        opp-hz = /bits/ 64 <540000000>;
>> +                        required-opps = <&rpmhpd_opp_svs_l1>;
>> +                    };
>> +
>> +                    opp-810000000 {
>> +                        opp-hz = /bits/ 64 <810000000>;
>> +                        required-opps = <&rpmhpd_opp_nom>;
>> +                    };
>> +                };
>> +            };
>> +
>>               mdss_dsi0: dsi@ae94000 {
>>                   compatible = "qcom,sm8450-dsi-ctrl", "qcom,mdss-dsi-ctrl";
>>                   reg = <0 0x0ae94000 0 0x400>;
>>
> 

