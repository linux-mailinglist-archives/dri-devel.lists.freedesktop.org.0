Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F12935669BC
	for <lists+dri-devel@lfdr.de>; Tue,  5 Jul 2022 13:35:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200D311390E;
	Tue,  5 Jul 2022 11:31:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589DE10E021;
 Tue,  5 Jul 2022 07:44:39 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A6EB560B83;
 Tue,  5 Jul 2022 05:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E207C341C7;
 Tue,  5 Jul 2022 05:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1656998370;
 bh=Nan9B/WhP+R80VxCKfZuBKrlbu2KTkNVySZBPTQurr4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iDpdLIwL2W9I72GrLDRGUChEUERlHuAVoGfvfNCN1x6TXDlgw7YDLGnSq3RXmw+LS
 MEYpmdBgAhZs2XbSKEDhXvXKtzHiX9UOx3lRjwPKi7oOUxmD3yHYZzeD5TkpJVXoyE
 feE9Uh3m9NJ8FHM3cTYUB2roORHtAipczvvw8MoCNO5rcmxsJ3MZTEeXNj8oQSLNzM
 RGQapQE8jbfrUonx55SR15avYqRpPosB3M2TOhE5GSwfDbXmPfsyqyPlXG7jZgEsri
 9Fk1CJgZ87eZhPQBCwYq8nJRt09onEjvCR/FCI1S7U9fe6lYVCLSyJVQClTRC3v3nW
 77R30MRF/uR+Q==
Date: Tue, 5 Jul 2022 10:49:25 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: qcom,hdmi-phy-qmp: add
 clock-cells and XO clock
Message-ID: <YsPJ3Z5+N4ZmCmcS@matsya>
References: <20220704161148.814510-1-dmitry.baryshkov@linaro.org>
 <20220704161148.814510-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220704161148.814510-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Kishon Vijay Abraham I <kishon@ti.com>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-phy@lists.infradead.org, Stephen Boyd <swboyd@chromium.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 04-07-22, 19:11, Dmitry Baryshkov wrote:
> As the QMP HDMI PHY is a clock provider, add constant #clock-cells
> property. For the compatibility with older DTs the property is not
> marked as required. Also add the XO clock to the list of the clocks used
> by the driver.

Acked-By: Vinod Koul <vkoul@kernel.org>

> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/phy/qcom,hdmi-phy-qmp.yaml           | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> index eea2e02678ed..83fe4b39b56f 100644
> --- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> +++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
> @@ -28,12 +28,15 @@ properties:
>        - const: hdmi_phy
>  
>    clocks:
> -    maxItems: 2
> +    minItems: 2
> +    maxItems: 3
>  
>    clock-names:
> +    minItems: 2
>      items:
>        - const: iface
>        - const: ref
> +      - const: xo
>  
>    power-domains:
>      maxItems: 1
> @@ -44,6 +47,9 @@ properties:
>    vddio-supply:
>      description: phandle to VDD I/O supply regulator
>  
> +  '#clock-cells':
> +    const: 0
> +
>    '#phy-cells':
>      const: 0
>  
> @@ -75,9 +81,12 @@ examples:
>                    "hdmi_phy";
>  
>        clocks = <&mmcc 116>,
> -               <&gcc 214>;
> +               <&gcc 214>,
> +               <&xo_board>;
>        clock-names = "iface",
> -                    "ref";
> +                    "ref",
> +                    "xo";
> +      #clock-cells = <0>;
>        #phy-cells = <0>;
>  
>        vddio-supply = <&vreg_l12a_1p8>;
> -- 
> 2.35.1

-- 
~Vinod
