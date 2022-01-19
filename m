Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21E84493333
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 03:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48A2110E1EF;
	Wed, 19 Jan 2022 02:56:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f45.google.com (mail-ot1-f45.google.com
 [209.85.210.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F092210E1EF;
 Wed, 19 Jan 2022 02:55:58 +0000 (UTC)
Received: by mail-ot1-f45.google.com with SMTP id
 c3-20020a9d6c83000000b00590b9c8819aso1189557otr.6; 
 Tue, 18 Jan 2022 18:55:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=aYGOrxWrMmyhDYJtkXEKiJPg0TbmVrdIyig6jKebhG4=;
 b=tD0Sh5GQxG+OB3JGUKF4XGi6HU/MeEuDxc1HiWWJ+CPqvJ1NVMx+q5YZb6PVSaanjj
 aI4QTgFnc48SCasBk3FvT2rHBMuR+hOE85f7rDFq/+xPeQtIRD44rOhTvcmrW9g+brUt
 vvHxVOywr9V9YMtyPBa4l3z+Ai9x73qlz++3og0bIosGiAm66KYmn1eWQp1lsfD4gFND
 kOPbU3aoWvuuCeZPtku7c13zJT9f//oEv/EehSYYCn0U/pm5d5ec9FuTd2lx9dANFOpO
 CuwgUGV3iffGjIWhaimoydCBU8isz4j7svkANmyijP/VVu6u5cjRmSQTIZS6R8HWTbqq
 LTgg==
X-Gm-Message-State: AOAM5300whdyVHDy/DmU93HYmdqBQHln/k5l2wbZeaMWoSQWfOn/x4vN
 rjTzB6zLU+IytWQoMo7+vw==
X-Google-Smtp-Source: ABdhPJye78t2zV61NtzOhBEOQse5eV0kxvXYcdbdYDIpDrUmNiEHgxOzsPJQ+2NG8mgEeTkvOFHfGA==
X-Received: by 2002:a9d:8cb:: with SMTP id 69mr8667451otf.185.1642560958118;
 Tue, 18 Jan 2022 18:55:58 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id o1sm8956588oic.7.2022.01.18.18.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 18:55:57 -0800 (PST)
Received: (nullmailer pid 2537494 invoked by uid 1000);
 Wed, 19 Jan 2022 02:55:53 -0000
From: Rob Herring <robh@kernel.org>
To: Rajeev Nandan <quic_rajeevny@quicinc.com>
In-Reply-To: <1642538320-1127-2-git-send-email-quic_rajeevny@quicinc.com>
References: <1642538320-1127-1-git-send-email-quic_rajeevny@quicinc.com>
 <1642538320-1127-2-git-send-email-quic_rajeevny@quicinc.com>
Subject: Re: [v3 1/3] dt-bindings: msm/dsi: Add 10nm dsi phy tuning properties
Date: Tue, 18 Jan 2022 20:55:53 -0600
Message-Id: <1642560953.436394.2537493.nullmailer@robh.at.kernel.org>
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
Cc: quic_kalyant@quicinc.com, devicetree@vger.kernel.org, jonathan@marek.ca,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, swboyd@chromium.org, sean@poorly.run,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 19 Jan 2022 02:08:38 +0530, Rajeev Nandan wrote:
> In most cases, the default values of DSI PHY tuning registers should be
> sufficient as they are fully optimized. However, in some cases where
> extreme board parasitics cause the eye shape to degrade, the override
> bits can be used to improve the signal quality.
> 
> The general guidelines for DSI PHY tuning include:
> - High and moderate data rates may benefit from the drive strength and
>   drive level tuning.
> - Drive strength tuning will affect the output impedance and may be used
>   for matching optimization.
> - Drive level tuning will affect the output levels without affecting the
>   impedance.
> 
> The clock and data lanes have a calibration circuitry feature. The drive
> strength tuning can be done by adjusting rescode offset for hstop/hsbot,
> and the drive level tuning can be done by adjusting the LDO output level
> for the HSTX drive.
> 
> Signed-off-by: Rajeev Nandan <quic_rajeevny@quicinc.com>
> ---
> 
> Changes in v2:
>  - More details in the commit text (Stephen Boyd)
>  - Use human understandable values (Stephen Boyd, Dmitry Baryshkov)
>  - Do not take values that are going to be unused (Dmitry Baryshkov)
> 
> Changes in v3:
>  - Use "qcom," prefix (Dmitry Baryshkov)
>  - Remove encoding from phy-drive-ldo-level (Dmitry Baryshkov)
>  - Use negative values instead of two's complement (Dmitry, Rob Herring)
> 
> 
>  .../bindings/display/msm/dsi-phy-10nm.yaml         | 34 ++++++++++++++++++++++
>  1 file changed, 34 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:qcom,phy-rescode-offset-bot: 'minimum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:qcom,phy-rescode-offset-bot: 'maximum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:qcom,phy-rescode-offset-bot: 'minimum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:qcom,phy-rescode-offset-bot: 'maximum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:qcom,phy-rescode-offset-top: 'minimum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:qcom,phy-rescode-offset-top: 'maximum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:qcom,phy-rescode-offset-top: 'minimum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: properties:qcom,phy-rescode-offset-top: 'maximum' should not be valid under {'enum': ['const', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'minimum', 'maximum', 'multipleOf', 'pattern']}
	hint: Scalar and array keywords cannot be mixed
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.yaml: ignoring, error in schema: properties: qcom,phy-rescode-offset-bot
Documentation/devicetree/bindings/display/msm/dsi-phy-10nm.example.dt.yaml:0:0: /example-0/dsi-phy@ae94400: failed to match any schema with compatible: ['qcom,dsi-phy-10nm']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1581518

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

