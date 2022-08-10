Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D84B58ED3C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Aug 2022 15:29:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CCA110F97A;
	Wed, 10 Aug 2022 13:28:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f175.google.com (mail-il1-f175.google.com
 [209.85.166.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED2708FE07;
 Wed, 10 Aug 2022 13:28:22 +0000 (UTC)
Received: by mail-il1-f175.google.com with SMTP id t15so8257847ilm.7;
 Wed, 10 Aug 2022 06:28:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=aPwzZruCf3bXkkzrDIRag9i2rkzTdfTf/pZGSrZkBos=;
 b=LRbeF43ySUd4XGd41zi6rkvuuEFWdBy+yvFaTS4gWADrg0N16kAFDH5mX+k5+iQoKP
 noqEaCphfQL7WIUfxOLwSTp6BLX0aRvDTRrs6Fb5kjNpWvHyklpNEOg8z2DTOIUf65y0
 QDZgVP1pHlYzNDchXuIhqq+X6gLTZhP29Sgnq9DVUIDfX8PPR0CeXKNZGvdTzY/siGvc
 pdC3JrK7Yh8SlJTToEEU0apux5PMwmzrj855t+WO3FLogmY1vsqlFZSD11V/LzNu4SaV
 ecnoRzEhPkT9QpxFKmDCoJfPPfywdSs42EMZqWmv1NSJio/dYrRK4xo4C5ZHbuYIcvYO
 iPCg==
X-Gm-Message-State: ACgBeo3qhmjz1NNe7Qp1tuWn8vO+L7FmBKAVXLq5w7wsRGiRF0FHLUVf
 ZVG+v+N4hC00V5IFUEmHnA==
X-Google-Smtp-Source: AA6agR4XnCqkk9JeD6hE6gmWTKuY83GuCuUxysxitnnB7f9QG+QaPoKEStA0yP1UjClonJ80OEq0GA==
X-Received: by 2002:a05:6e02:1baf:b0:2e0:e64c:c68b with SMTP id
 n15-20020a056e021baf00b002e0e64cc68bmr7338210ili.200.1660138101974; 
 Wed, 10 Aug 2022 06:28:21 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 n1-20020a056e0208e100b002de1e1d7316sm2187564ilt.56.2022.08.10.06.28.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Aug 2022 06:28:21 -0700 (PDT)
Received: (nullmailer pid 3991546 invoked by uid 1000);
 Wed, 10 Aug 2022 13:28:15 -0000
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <20220810035013.3582848-2-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
 <20220810035013.3582848-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/7] dt-bindings: msm/dp: Add SDM845 and SC8280XP
 compatibles
Date: Wed, 10 Aug 2022 07:28:15 -0600
Message-Id: <1660138095.910244.3991545.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 09 Aug 2022 20:50:07 -0700, Bjorn Andersson wrote:
> Add compatibles for the DisplayPort and Embedded DisplayPort blocks in
> Qualcomm SDM845 and SC8280XP platforms.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +++
>  1 file changed, 3 insertions(+)
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/patch/


displayport-controller@ae90000: '#clock-cells', 'data-lanes', 'opp-table', 'vdda-0p9-supply', 'vdda-1p2-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb

displayport-controller@ae90000: '#clock-cells', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sc7180-idp.dtb
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

displayport-controller@ae90000: reg: [[0, 183042048, 0, 5120]] is too short
	arch/arm64/boot/dts/qcom/sc7180-idp.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-homestar-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r5.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-nots-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r4.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-limozeen-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r0.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-kb.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r9-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r2-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-pompom-r3-lte.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1.dtb
	arch/arm64/boot/dts/qcom/sc7180-trogdor-r1-lte.dtb
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: '#address-cells', '#clock-cells', '#size-cells', 'aux-bus', 'opp-table', 'vdda-0p9-supply', 'vdda-1p2-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb

edp@aea0000: '#address-cells', '#clock-cells', '#size-cells', 'opp-table' do not match any of the regexes: 'pinctrl-[0-9]+'
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: clock-names:0: 'core_iface' was expected
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: clock-names:1: 'core_aux' was expected
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: clock-names:2: 'ctrl_link' was expected
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: clock-names:3: 'ctrl_link_iface' was expected
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: clock-names:4: 'stream_pixel' was expected
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: clock-names: ['core_xo', 'core_ref', 'core_iface', 'core_aux', 'ctrl_link', 'ctrl_link_iface', 'stream_pixel'] is too long
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: clocks: [[39, 0], [42, 183], [286, 1], [286, 17], [286, 19], [286, 22], [286, 23]] is too long
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: clocks: [[39, 0], [42, 183], [291, 1], [291, 17], [291, 19], [291, 22], [291, 23]] is too long
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb

edp@aea0000: clocks: [[39, 0], [42, 183], [294, 1], [294, 17], [294, 19], [294, 22], [294, 23]] is too long
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb

edp@aea0000: clocks: [[39, 0], [42, 183], [299, 1], [299, 17], [299, 19], [299, 22], [299, 23]] is too long
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb

edp@aea0000: clocks: [[39, 0], [42, 183], [302, 1], [302, 17], [302, 19], [302, 22], [302, 23]] is too long
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb

edp@aea0000: reg: [[0, 183107584, 0, 512], [0, 183108096, 0, 512], [0, 183108608, 0, 3072], [0, 183111680, 0, 1024]] is too short
	arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp2.dtb
	arch/arm64/boot/dts/qcom/sc7280-idp.dtb

edp@aea0000: '#sound-dai-cells' is a required property
	arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb
	arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb

