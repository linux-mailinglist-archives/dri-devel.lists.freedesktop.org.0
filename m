Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC449619623
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 13:21:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66FBE10E0B9;
	Fri,  4 Nov 2022 12:21:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CEC210E0B9;
 Fri,  4 Nov 2022 12:21:35 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D77BFB82D44;
 Fri,  4 Nov 2022 12:21:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E092C433D6;
 Fri,  4 Nov 2022 12:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1667564492;
 bh=ZXLJVpZXT+rWJ0ivseoUk9nwVTF3CBUlHi/ObsPKqIE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=OBM77ubcRT9a5w/v78iozP0L2hG7m4X1G75HVaBibLtU25YftqEBE5Ndooewxzy3c
 ZeXDb/WzrIW3iDDeLe4Em83u0w93DhzPQmMtj9RmUOPO3XwS5XJdmqw0PsmMQsVLCx
 9ol/afe0iVZEJMgO1GrPZGrYleovk/ZymFAuCfLC8DSoEr7FUooH063SvS4K+7chmp
 /3aBEwPTJ8JhMfRQcdmiwIdKPUIxu+WlNG4qvKCO9Dk5KZOq+fEq/zoRvG4nq3T8Ca
 GsbV7XySi5YaUfX3FD4wdayFLaLd9CeQpzjgb1XkzZhgmaBjNT3riekPEAydEpBMDw
 xKBYHv0MpVYIQ==
Received: by mail-lf1-f43.google.com with SMTP id g7so7198670lfv.5;
 Fri, 04 Nov 2022 05:21:32 -0700 (PDT)
X-Gm-Message-State: ACrzQf1jpH2v1/mKzOjDgvXnMEaChEx0d3C3Y45lfbpI5TjsEpB9OkKj
 a6bOi3eRgcjmJuZfM8GTDIsDTN+z3j+PlaTM6w==
X-Google-Smtp-Source: AMsMyM5kTNZDfNz1NMagVWEucdPQHrDVvMm1GNlzFfBYpRDW2nbr0fXNbF2H0V1PLZq0+l5VjjjYUpUH27KcZlOR9e0=
X-Received: by 2002:a19:5048:0:b0:4b1:3856:e422 with SMTP id
 z8-20020a195048000000b004b13856e422mr5516827lfj.368.1667564490584; Fri, 04
 Nov 2022 05:21:30 -0700 (PDT)
MIME-Version: 1.0
References: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20221024164225.3236654-1-dmitry.baryshkov@linaro.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Fri, 4 Nov 2022 07:21:21 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+_p36jCUTE+9V+eAyxF9ETcgk4gBDN7-+mgJVd7-ZYzg@mail.gmail.com>
Message-ID: <CAL_Jsq+_p36jCUTE+9V+eAyxF9ETcgk4gBDN7-+mgJVd7-ZYzg@mail.gmail.com>
Subject: Re: [PATCH v9 00/12] dt-bindings: display/msm: rework MDSS and DPU
 bindings
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Oct 24, 2022 at 11:42 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:
>
> Create separate YAML schema for MDSS devicesd$ (both for MDP5 and DPU
> devices). Cleanup DPU schema files, so that they do not contain schema
> for both MDSS and DPU nodes. Apply misc small fixes to the DPU schema
> afterwards. Add schema for the MDSS and DPU on sm8250 platform.
>
> Soft dependency on [1] to define qcom,dsi-phy-14nm-2290 binding used in
> examples
>
> [1] https://lore.kernel.org/linux-arm-msm/20220924121900.222711-1-dmitry.baryshkov@linaro.org/
>
> Changes since v8:
>  - Dropped DSI/DSI-PHY examples from the first patch. Proper example
>    generate a pile of warnings because of DSI schema deficiencies. I'll
>    add these examples back, once DSI schema is fixed.
>
> Changes since v7:
>  - Expanded examples to include MDSS child nodes (Krzysztof)
>
> Changes since v6:
>  - Removed extra newlines (Krzysztof)
>  - Added $ref to dpu-common.yaml#/ports/port@foo to enforce schema
>    for the port nodes (Rob)
>  - Removed unused allOf's (Rob)
>  - Fixed repeated interconnects descriptions (Rob)
>  - Fixed dpu-common.yaml and mdss-common.yaml descriptions (Rob)
>  - Fixed intentation of examples (Krzysztof)
>  - Renamed MDSS and DPU schema to follow compat names (Rob)
>
> Changes since v5:
>  - Dropped the core clock from mdss.yaml. It will be handled in a
>    separate patchset together with adding the clock itself.
>  - Fixed a typo in two commit subjects (mdm -> msm).
>
> Changes since v4:
>  - Created separate mdss-common.yaml
>  - Rather than squashing everything into mdss.yaml, create individual
>    schema files for MDSS devices.
>
> Changes since v3:
>  - Changed mdss->(dpu, dsi, etc.) relationship into the tight binding
>    depending on the mdss compatible string.
>  - Added sm8250 dpu schema and added qcom,sm8250-mdss to mdss.yaml
>
> Changes since v2:
>  - Added a patch to allow opp-table under the dpu* nodes.
>  - Removed the c&p issue which allowed the @0 nodes under the MDSS
>    device node.
>
> Changes since v1:
>  - Renamed DPU device nodes from mdp@ to display-controller@
>  - Described removal of mistakenly mentioned "lut" clock
>  - Switched mdss.yaml to use $ref instead of fixing compatible strings
>  - Dropped mdp-opp-table description (renamed by Krzysztof in his
>    patchset)
>  - Reworked DPU's ports definitions. Dropped description of individual
>    ports, left only /ports $ref and description in dpu-common.yaml.
>
> Dmitry Baryshkov (12):
>   dt-bindings: display/msm: split qcom,mdss bindings
>   dt-bindings: display/msm: add gcc-bus clock to dpu-smd845
>   dt-bindings: display/msm: add interconnects property to
>     qcom,mdss-smd845
>   dt-bindings: display/msm: move common DPU properties to
>     dpu-common.yaml
>   dt-bindings: display/msm: move common MDSS properties to
>     mdss-common.yaml
>   dt-bindings: display/msm: split dpu-sc7180 into DPU and MDSS parts
>   dt-bindings: display/msm: split dpu-sc7280 into DPU and MDSS parts
>   dt-bindings: display/msm: split dpu-sdm845 into DPU and MDSS parts
>   dt-bindings: display/msm: split dpu-msm8998 into DPU and MDSS parts
>   dt-bindings: display/msm: split dpu-qcm2290 into DPU and MDSS parts
>   dt-bindings: display/msm: add missing device nodes to mdss-* schemas
>   dt-bindings: display/msm: add support for the display on SM8250

This is now warning in linux-next:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.example.dtb:
dsi@ae94000: 'opp-table' does not match any of the regexes:
'pinctrl-[0-9]+'
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sm8250-mdss.example.dtb:
dsi@ae94000: 'opp-table' does not match any of the regexes:
'pinctrl-[0-9]+'
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb:
dsi@5e94000: compatible: 'oneOf' conditional failed, one must be
fixed:
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+-.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,(sa|sc)8[0-9]+[a-z][a-z]?-.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,[ak]pss-wdt-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,gcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,mmcc-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,pcie-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,rpm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' does not match
'^qcom,scm-(apq|ipq|mdm|msm|qcm|qcs|sa|sc|sdm|sdx|sm)[0-9]+.*$'
        'qcom,dsi-ctrl-6g-qcm2290' is not one of ['qcom,gpucc-sdm630',
'qcom,gpucc-sdm660', 'qcom,lcc-apq8064', 'qcom,lcc-ipq8064',
'qcom,lcc-mdm9615', 'qcom,lcc-msm8960', 'qcom,lpass-cpu-apq8016',
'qcom,usb-ss-ipq4019-phy', 'qcom,usb-hs-ipq4019-phy',
'qcom,vqmmc-ipq4019-regulator']
        'qcom,dsi-ctrl-6g-qcm2290' is not one of ['qcom,ipq806x-gmac',
'qcom,ipq806x-nand', 'qcom,ipq806x-sata-phy',
'qcom,ipq806x-usb-phy-ss', 'qcom,ipq806x-usb-phy-hs']
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/arm/qcom-soc.yaml
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.example.dtb:
dsi@ae94000: 'opp-table' does not match any of the regexes:
'pinctrl-[0-9]+'
        From schema:
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
