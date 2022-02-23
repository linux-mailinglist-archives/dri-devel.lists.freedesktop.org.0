Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE7F4C1ADF
	for <lists+dri-devel@lfdr.de>; Wed, 23 Feb 2022 19:23:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 84ED110E1E9;
	Wed, 23 Feb 2022 18:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7441D10E1E9
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 18:23:02 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id w27so14930505lfa.5
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Feb 2022 10:23:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=UcfKUY8k6DfusGlB9NHQqjnpCyDgS+dIotRNb+VfCyc=;
 b=IObjJMN9fHOnyEyJ0aJDey85yPPsoViPxmgGKaVMA3hEjIE2nvqI+cofTHI4qasIae
 weoRPaJYonOyL3PSsWk7e+miHckCLOgtaYM7UGfznm/fLKckN/O5FDhHtW4BrfNi5V7T
 Aw0jhRDgyuUCCXlqhgpSp83kQryactg9p4HVTNh9GnNq14N6NADt4wz58PJ+oVuMd4ZK
 aFxBzFjv1xNebc664fpkf0LmSmR+G/q5YYI/QvuH4Xl2z8MF07H4yyoAs3HBB7/bs7D9
 3pY4fsAUjisqrEofV8486ghmXDO4wMb5PbY+/MD9zeB9ulVtfJvCuZDZ/qIlt86le346
 dT6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=UcfKUY8k6DfusGlB9NHQqjnpCyDgS+dIotRNb+VfCyc=;
 b=FGUJxak2orwwKDneU0sxM1IyYgM54+rsf2OrofOLFzyMqv3MB1D39bVTcJQi/UAqoo
 fbXMf6RcC+WPo7Z3xHvoVHorYWw8SgFngufZwOPEebHla9wzun2cKBAP49Wb/ild1h9T
 wmyXEWtpamDwNSdPhz987QLRuXX4hGAOdRknme9C3nDyq9yNVGwYM3NL/Ms5evLEVQ2c
 bbI51aUL7SWLHEyZGELEq2DeWkOCHUtpArzdJjQq9FULcWo6EZ2gVYFL3eQeOovt8MPE
 BnTKNeCHMRQrdkVqhoHqXdTpupPCGZlaUvvRdllpEteb+M6Phj0gos7B8GgPA/uJwXL1
 SndQ==
X-Gm-Message-State: AOAM532Vt/johqQvmZ3zTpan1+612V9hzYrJF2r0hMOI2U6I+FJrE9B4
 ToZQGkKv8QXeIB1oLlvbYKYNXA==
X-Google-Smtp-Source: ABdhPJy91F+Mbo8jJlYlZJcsqZe4RbeEeGZOT+ZTbsyaJhmTFsGkGPpbyJrY2zH3Nq7tqGZz9KI8bQ==
X-Received: by 2002:a05:6512:3f1d:b0:443:3c8b:58f5 with SMTP id
 y29-20020a0565123f1d00b004433c8b58f5mr569305lfa.669.1645640579350; 
 Wed, 23 Feb 2022 10:22:59 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a28sm20252lfm.251.2022.02.23.10.22.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 10:22:58 -0800 (PST)
Message-ID: <493749c1-6305-1a94-4e05-519c825e9d4d@linaro.org>
Date: Wed, 23 Feb 2022 21:22:57 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.0
Subject: Re: [RFC PATCH v2 4/5] drm/msm/dp: replace dp_connector with
 drm_bridge_connector
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, Stephen Boyd <swboyd@chromium.org>
References: <20220211224006.1797846-1-dmitry.baryshkov@linaro.org>
 <20220211224006.1797846-5-dmitry.baryshkov@linaro.org>
 <572c0402-55da-077b-1809-3d1caf7ce743@quicinc.com>
 <b25d422e-cdd8-bcb9-1815-1d89f170d421@linaro.org>
 <CAE-0n51afuHURLHaZBa77H_n+cm4Tj1Du-rpLH-HsrkY5xQVJA@mail.gmail.com>
 <CAA8EJpobtpc5mB48g6K=+KaZQ-o8m_QTZr-dQvwz-9cEwiJ_Kg@mail.gmail.com>
 <7f9e2181-bb1a-c734-2e90-c5922952acb4@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7f9e2181-bb1a-c734-2e90-c5922952acb4@quicinc.com>
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 23/02/2022 20:21, Kuogee Hsieh wrote:
> 
> On 2/18/2022 6:22 PM, Dmitry Baryshkov wrote:
>> On Sat, 19 Feb 2022 at 03:55, Stephen Boyd <swboyd@chromium.org> wrote:
>>> Quoting Dmitry Baryshkov (2022-02-18 14:32:53)
>>>> On 19/02/2022 00:31, Kuogee Hsieh wrote:
>>>>> On 2/11/2022 2:40 PM, Dmitry Baryshkov wrote:
>>>>>> There is little point in having both connector and root bridge
>>>>>> implementation in the same driver. Move connector's functionality 
>>>>>> to the
>>>>>> bridge to let next bridge in chain to override it.
>>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>> This patch break primary (edp) display
>>>>>
>>>>> -- right half of screen garbled
>>>>>
>>>>> -- screen shift vertically
>>>>>
>>>>> below are error messages seen --
>>>>>
>>>>> [   36.679216] panel-edp soc@0:edp_panel: No display modes
>>>>> [   36.687272] panel-edp soc@0:edp_panel: No display modes
>>>>> [   40.593709] panel-edp soc@0:edp_panel: No display modes
>>>>> [   40.600285] panel-edp soc@0:edp_panel: No display modes
>>>> So, before the patch the drm core was getting modes from the
>>>> drm_connector (which means, modes from drm driver itself). With this
>>>> patch the panel-edp tries to get modes.
>>>>
>>>> Could you please check, why panel_edp_get_modes() fails? Assuming that
>>>> you use platform panel-edp binding (rather than 'edp-panel') could you
>>>> please check you have either of the following:
>>>> - ddc bus for EDID?
>>> I don't see anywhere where the ddc pointer is set for the dp bridge in
>>> msm_dp_bridge_init(). Is that required though? I'd think simple panel is
>>> still being used here so reading EDID isn't required.
>> I meant the 'ddc-i2c-bus' property for the corresponding eDP panel.
>>
>>>> - either num_timing or num_modes in your panel desc.
>> After reading the panel-edp's code I don't have another cause for
>> panel_edp_get_modes(). It should either have a DDC bus specified using
>> the mentioned device tree property, or it should have specified the
>> timings.
>>
>> Kuogee, which platform were you using when testing this patch? Could
>> you please share the dts fragment?
> 
> I cherry-picked your patches on top of our internal release which is 
> usually have some (or many) patches behind msm-next.
> 
> where is "ddc-i2c-bus" located?

In the panel device node.

Can you please share it too?

> 
>                          msm_edp: edp@aea0000 {
>                                  compatible = "qcom,sc7280-edp";
> 
>                                  reg = <0 0xaea0000 0 0x200>,
>                                        <0 0xaea0200 0 0x200>,
>                                        <0 0xaea0400 0 0xc00>,
>                                        <0 0xaea1000 0 0x400>;
> 
>                                  interrupt-parent = <&mdss>;
>                                  interrupts = <14>;
> 
>                                  clocks = <&rpmhcc RPMH_CXO_CLK>,
>                                           <&gcc GCC_EDP_CLKREF_EN>,
>                                           <&dispcc DISP_CC_MDSS_AHB_CLK>,
>                                           <&dispcc 
> DISP_CC_MDSS_EDP_AUX_CLK>,
>                                           <&dispcc 
> DISP_CC_MDSS_EDP_LINK_CLK>,
>                                           <&dispcc 
> DISP_CC_MDSS_EDP_LINK_INTF_CLK>,
>                                           <&dispcc 
> DISP_CC_MDSS_EDP_PIXEL_CLK>;
>                                  clock-names = "core_xo",
>                                                "core_ref",
>                                                "core_iface",
>                                                "core_aux",
>                                                "ctrl_link",
>                                                "ctrl_link_iface",
>                                                "stream_pixel";
>                                  #clock-cells = <1>;
>                                  assigned-clocks = <&dispcc 
> DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
>                                                    <&dispcc 
> DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
>                                  assigned-clock-parents = <&edp_phy 0>, 
> <&edp_phy 1>;
> 
>                                  phys = <&edp_phy>;
>                                  phy-names = "dp";
> 
>                                  operating-points-v2 = <&edp_opp_table>;
>                                  power-domains = <&rpmhpd SC7280_CX>;
> 
>                                  #address-cells = <1>;
>                                  #size-cells = <0>;
> 
>                                  status = "disabled";
> 
>                                  ports {
>                                          #address-cells = <1>;
>                                          #size-cells = <0>;
>                                          port@0 {
>                                                  reg = <0>;
>                                                  edp_in: endpoint {
> remote-endpoint = <&dpu_intf5_out>;
>                                                  };
>                                          };
>                                  };
> 
>                              edp_opp_table: opp-table {
>                                          compatible = 
> "operating-points-v2";
> 
>                                          opp-160000000 {
>                                                  opp-hz = /bits/ 64 
> <160000000>;
>                                                  required-opps = 
> <&rpmhpd_opp_low_svs>;
>                                          };
> 
>                                          opp-270000000 {
>                                                  opp-hz = /bits/ 64 
> <270000000>;
>                                                  required-opps = 
> <&rpmhpd_opp_svs>;
>                                          };
> 
>                                          opp-540000000 {
>                                                  opp-hz = /bits/ 64 
> <540000000>;
>                                                  required-opps = 
> <&rpmhpd_opp_nom>;
>                                          };
> 
>                                          opp-810000000 {
>                                                  opp-hz = /bits/ 64 
> <810000000>;
>                                                  required-opps = 
> <&rpmhpd_opp_nom>;
>                                          };
>                                  };
>                          };
> 


-- 
With best wishes
Dmitry
