Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E483191A8B2
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jun 2024 16:09:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B116310EAC2;
	Thu, 27 Jun 2024 14:09:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="SAsCjQB+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7CF110EAB6;
 Thu, 27 Jun 2024 14:09:50 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 4F3BCCE2F15;
 Thu, 27 Jun 2024 14:09:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5F37C4AF13;
 Thu, 27 Jun 2024 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1719497385;
 bh=N/OaLsIcQKk+az4MXyzNRYt8fiAoAVDEiwFfGH80yO8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=SAsCjQB+5D8MLWq0jIbFCQ6AdBh87ptZBB33QWJso5cte5CSKu+7Qo4xKjc4So14V
 D/MtC+0BeskwEoa2wRvCVsyZGNLhXIMa6JzKFR6KCZE2rNohlkoQIxBnayjvY2Zgw8
 9e8IJ82WTS+UxOBglr6uKcRW7XGcX5ZKT9YYHpxm3ytd6DkXJNvXYOvdtBEznJzuXI
 Ci8gsJOwcZebvsoUOfp11pX4fOb7OZABwwxnkiVVSe2vWTsbDsPuhWnKmUy7VPceHX
 9IbT5nWPdRwAQYJMyjiRBax6ipPqYg+eCDkM4kG4AOs4734e14ugNiAOAM54YuC+AE
 nB4E/wL3zPRaA==
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-52cdb9526e2so1717780e87.0; 
 Thu, 27 Jun 2024 07:09:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCWqSfhhG3vbFnGsiu6erdUVpXwLb9rKV1M2pUseVP7g3RwYKjgd8pOrr/CxyPrB12Iwakp0MrElR7o21QcnBGFzc7ZOneSi84sH75ykZPTpIEgF1aW5nRAGCLYHocu/kzIcNXeiHs/6gYmSGQIIId5c
X-Gm-Message-State: AOJu0Yy398yD+hxOhBBum+8he9bZgbzKaXh+OS8yszKjrs+ZQqeKjJNn
 BhK7OQ5Nzo5FMw7JNhTP1JjicS8ieJ4zfkzd3UX7RcFCuR2DZaqGea/ZpyZcXt9ztdpYhtiEtgH
 oV642zn7pRw5UC8KYV550mXO/+w==
X-Google-Smtp-Source: AGHT+IHfkgyQQA4gvyq2HH9PsGgzZGKPkIdmGjgdjtGkoMqcxNoy8z91RZBHjqrqy85lT8uGRsN+wJtK+ZV44Jy73Vo=
X-Received: by 2002:a05:6512:3d24:b0:52b:963d:277c with SMTP id
 2adb3069b0e04-52e703af548mr785682e87.33.1719497384167; Thu, 27 Jun 2024
 07:09:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240614215855.82093-1-danila@jiaxyga.com>
 <20240614215855.82093-4-danila@jiaxyga.com>
In-Reply-To: <20240614215855.82093-4-danila@jiaxyga.com>
From: Rob Herring <robh@kernel.org>
Date: Thu, 27 Jun 2024 08:09:31 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+vL2fBJBBj13A=qgTQX1rj7tK=ybn+7tXBdpobpRoi6Q@mail.gmail.com>
Message-ID: <CAL_Jsq+vL2fBJBBj13A=qgTQX1rj7tK=ybn+7tXBdpobpRoi6Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/4] dt-bindings: display/msm: Add SM7150 MDSS
To: Danila Tikhonov <danila@jiaxyga.com>
Cc: robdclark@gmail.com, quic_abhinavk@quicinc.com, 
 dmitry.baryshkov@linaro.org, sean@poorly.run, marijn.suijten@somainline.org, 
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, 
 airlied@gmail.com, daniel@ffwll.ch, krzk+dt@kernel.org, conor+dt@kernel.org, 
 quic_rmccann@quicinc.com, konrad.dybcio@linaro.org, neil.armstrong@linaro.org, 
 jonathan@marek.ca, swboyd@chromium.org, quic_khsieh@quicinc.com, 
 quic_jesszhan@quicinc.com, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jun 14, 2024 at 3:59=E2=80=AFPM Danila Tikhonov <danila@jiaxyga.com=
> wrote:
>
> Document the MDSS hardware found on the Qualcomm SM7150 platform.
>
> Signed-off-by: Danila Tikhonov <danila@jiaxyga.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../display/msm/qcom,sm7150-mdss.yaml         | 458 ++++++++++++++++++
>  1 file changed, 458 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm=
7150-mdss.yaml
>
> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-md=
ss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.ya=
ml
> new file mode 100644
> index 0000000000000..13c5d5ffabde9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
> @@ -0,0 +1,458 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/msm/qcom,sm7150-mdss.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm SM7150 Display MDSS
> +
> +maintainers:
> +  - Danila Tikhonov <danila@jiaxyga.com>
> +
> +description:
> +  SM7150 MSM Mobile Display Subsystem(MDSS), which encapsulates sub-bloc=
ks like
> +  DPU display controller, DSI and DP interfaces etc.
> +
> +$ref: /schemas/display/msm/mdss-common.yaml#
> +
> +properties:
> +  compatible:
> +    const: qcom,sm7150-mdss
> +
> +  clocks:
> +    items:
> +      - description: Display ahb clock from gcc
> +      - description: Display hf axi clock
> +      - description: Display sf axi clock
> +      - description: Display core clock
> +
> +  clock-names:
> +    items:
> +      - const: iface
> +      - const: bus
> +      - const: nrt_bus
> +      - const: core
> +
> +  iommus:
> +    maxItems: 1
> +
> +  interconnects:
> +    items:
> +      - description: Interconnect path from mdp0 port to the data bus
> +      - description: Interconnect path from mdp1 port to the data bus
> +      - description: Interconnect path from CPU to the reg bus
> +
> +  interconnect-names:
> +    items:
> +      - const: mdp0-mem
> +      - const: mdp1-mem
> +      - const: cpu-cfg
> +
> +patternProperties:
> +  "^display-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,sm7150-dpu
> +
> +  "^displayport-controller@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        const: qcom,sm7150-dp
> +
> +  "^dsi@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: true
> +    properties:
> +      compatible:
> +        items:
> +          - const: qcom,sm7150-dsi-ctrl
> +          - const: qcom,mdss-dsi-ctrl

You've added this compatible, but haven't updated the corresponding
schema. With a recent change to dtschema fixing a regression, we get
warnings about it:

/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/q=
com,sm7150-mdss.example.dtb:
dsi@ae94000: compatible: 'oneOf' conditional failed, one must be
fixed:
        ['qcom,sm7150-dsi-ctrl', 'qcom,mdss-dsi-ctrl'] is too long
        'qcom,sm7150-dsi-ctrl' is not one of ['qcom,apq8064-dsi-ctrl',
'qcom,msm8226-dsi-ctrl', 'qcom,msm8916-dsi-ctrl',
'qcom,msm8953-dsi-ctrl', 'qcom,msm8974-dsi-ctrl',
'qcom,msm8976-dsi-ctrl', 'qcom,msm8996-dsi-ctrl',
'qcom,msm8998-dsi-ctrl', 'qcom,qcm2290-dsi-ctrl',
'qcom,sc7180-dsi-ctrl', 'qcom,sc7280-dsi-ctrl',
'qcom,sdm660-dsi-ctrl', 'qcom,sdm670-dsi-ctrl',
'qcom,sdm845-dsi-ctrl', 'qcom,sm6115-dsi-ctrl',
'qcom,sm6125-dsi-ctrl', 'qcom,sm6350-dsi-ctrl',
'qcom,sm6375-dsi-ctrl', 'qcom,sm8150-dsi-ctrl',
'qcom,sm8250-dsi-ctrl', 'qcom,sm8350-dsi-ctrl',
'qcom,sm8450-dsi-ctrl', 'qcom,sm8550-dsi-ctrl',
'qcom,sm8650-dsi-ctrl']
        'qcom,sm7150-dsi-ctrl' is not one of
['qcom,dsi-ctrl-6g-qcm2290', 'qcom,mdss-dsi-ctrl']
        from schema $id:
http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#
/builds/robherring/linux-dt/Documentation/devicetree/bindings/display/msm/q=
com,sm7150-mdss.example.dtb:
dsi@ae94000: Unevaluated properties are not allowed ('compatible' was
unexpected)
        from schema $id:
http://devicetree.org/schemas/display/msm/dsi-controller-main.yaml#


Either you need to drop this node from here (and the example) or
update the DSI schema.

Rob
