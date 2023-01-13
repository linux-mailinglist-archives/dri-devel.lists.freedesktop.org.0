Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E780A669BFE
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jan 2023 16:26:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72E4A10EA20;
	Fri, 13 Jan 2023 15:26:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com
 [209.85.160.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C01610E198;
 Fri, 13 Jan 2023 15:26:54 +0000 (UTC)
Received: by mail-oa1-f46.google.com with SMTP id
 586e51a60fabf-15ee27bb0a8so2232673fac.7; 
 Fri, 13 Jan 2023 07:26:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=0PbROUEuIJk+HQe91NY18FTTLvUzGQXQDtdY40/ABZE=;
 b=4sFRT6TYT8O+MFTr6nRQy60U3rS/2U18f/66ueWxrZ1N6AGobuCSZoeQam9gDkcVLV
 LKZbimjVu4Ade5BYH3A2/AxQfANB5cJeZcqQRrGjd+kR8pCGOOwFFNtBXy72NA2dcyOV
 z6eUJgaQFsEjjpJlhY0zRLEQCM/umbSaUdhRcIFZaIxLYtmG67aY+/kPGJDm0c6BTjmY
 POhuLkRIZsXk8FfhWv2sdA+OuuQZfUexk1yrvve4+KCxzH7S8jaBXreq2TCcs6So0Oaz
 MYSPK8wyDCM3A3BSlf1lhqDo1/k+1qAzTm3SSMZcKrXQCA8pcwm/kYkGj94PzvnqJglk
 tdXg==
X-Gm-Message-State: AFqh2koZ95bUua4UgrOJHGQxBrJriVMQcc5vpqJoXdwZ4LiodU5SYAif
 CYdb7rd0HeLNCyEF0j/a1A==
X-Google-Smtp-Source: AMrXdXs3qrRsk35e5aDRYxcFeHO8M4hoHtTtK5NTH7ZKCs86bZQy6UFOAiOsRQojs+jf/ClrcsasKQ==
X-Received: by 2002:a05:6870:c905:b0:15e:ef68:67cf with SMTP id
 hj5-20020a056870c90500b0015eef6867cfmr1226310oab.59.1673623613356; 
 Fri, 13 Jan 2023 07:26:53 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 m34-20020a056870562200b00143ae7d4ccesm10612793oao.45.2023.01.13.07.26.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 07:26:53 -0800 (PST)
Received: (nullmailer pid 2224492 invoked by uid 1000);
 Fri, 13 Jan 2023 15:26:52 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230113083720.39224-5-dmitry.baryshkov@linaro.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-5-dmitry.baryshkov@linaro.org>
Message-Id: <167362341911.2212079.15291287366051593468.robh@kernel.org>
Subject: Re: [PATCH v6 04/11] dt-bindings: display/msm: rename mdss nodes to
 display-subsystem
Date: Fri, 13 Jan 2023 09:26:52 -0600
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 13 Jan 2023 10:37:13 +0200, Dmitry Baryshkov wrote:
> Follow the 'generic names' rule and rename mdss nodes to
> display-subsystem.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdss-common.yaml      | 8 ++++++++
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 5 ++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,sm6115-mdss.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.example.dtb: mdss@5e00000: $nodename:0: 'mdss@5e00000' does not match '^display-subsystem@[0-9a-f]+$'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/qcom,qcm2290-mdss.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230113083720.39224-5-dmitry.baryshkov@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

