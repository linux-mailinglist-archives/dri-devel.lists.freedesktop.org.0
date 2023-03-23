Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E75C6C6A31
	for <lists+dri-devel@lfdr.de>; Thu, 23 Mar 2023 14:58:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 75EE910EAA1;
	Thu, 23 Mar 2023 13:58:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A808D10E0C7;
 Thu, 23 Mar 2023 13:58:43 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id w133so16219766oib.1;
 Thu, 23 Mar 2023 06:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679579923;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=kLy7q/A/bSUpQB88gV+M1rWoFEj0u/mE7p9M7z5KPxc=;
 b=HKlxKXzo+j7MmK5FX/hhGGbg1k/eM0ERdut1IQv+tp+UDYVPSMhec+Txsrc1p4jkZx
 J2uNYTDitXALnteG0UU9AXfNPhrXf31wKrGBB8L64TaqghrXyiJrOoKPT852YvJzWHAQ
 739FH4ZuSA68yqv/PsVriJZeh0g5gNrK9SqVUGKNasdk+y0I9IHkNW8/7e7b2+ViFpCN
 IkOIODQmeVMcHVLg4FVLRsJHNi7QbK2DRZnD/JInLzJl3Rglj/UGqiiLVG9h3aFpOv8D
 qVw3FKCUwV3+9558Vh2etBCOsoSRzQpyUHFJ0vpr/4t7ciBDqhy/CYV1jjqFanqXujMu
 Dm3Q==
X-Gm-Message-State: AO0yUKX4YnTlffusMe2ESxraou+gkR45KInIIqQvlZSDR7UJUw9BnH0z
 CMiZcS6E7e985bAtjH7XAQ==
X-Google-Smtp-Source: AK7set8qwrjXII8gCt0viTsj6luC6GTMyRzo91grHXaVn2O6CN5v9bpYOQNNQI2X4OcnrQchlFDcpQ==
X-Received: by 2002:a05:6808:1a24:b0:387:1ad3:6c75 with SMTP id
 bk36-20020a0568081a2400b003871ad36c75mr3578090oib.1.1679579922898; 
 Thu, 23 Mar 2023 06:58:42 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 b1-20020a4a98c1000000b00524f47b4682sm7208582ooj.10.2023.03.23.06.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 06:58:42 -0700 (PDT)
Received: (nullmailer pid 3103742 invoked by uid 1000);
 Thu, 23 Mar 2023 13:58:37 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-3-3ead1e418fe4@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-3-3ead1e418fe4@linaro.org>
Message-Id: <167957963115.3095299.4593054829506617284.robh@kernel.org>
Subject: Re: [PATCH 3/8] dt-bindings: ufs: qcom: document the fact the UFS
 controller can have an ICE core
Date: Thu, 23 Mar 2023 08:58:37 -0500
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


On Thu, 23 Mar 2023 11:25:18 +0100, Neil Armstrong wrote:
> Move the qcom,sm8450-ufshc to the right allOf:if allowing the ICE clocks
> and registers to be specified.
> 
> Fixes: 462c5c0aa798 ("dt-bindings: ufs: qcom,ufs: convert to dtschema")
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  Documentation/devicetree/bindings/ufs/qcom,ufs.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.example.dtb: ufs@1d84000: clocks: [[4294967295, 151], [4294967295, 10], [4294967295, 150], [4294967295, 166], [4294967295, 0], [4294967295, 164], [4294967295, 160], [4294967295, 162]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.example.dtb: ufs@1d84000: clock-names: ['core_clk', 'bus_aggr_clk', 'iface_clk', 'core_clk_unipro', 'ref_clk', 'tx_lane0_sync_clk', 'rx_lane0_sync_clk', 'rx_lane1_sync_clk'] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.example.dtb: ufs@1d84000: reg: [[0, 30949376, 0, 12288]] is too short
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/ufs/qcom,ufs.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-3-3ead1e418fe4@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

