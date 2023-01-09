Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CFB08662886
	for <lists+dri-devel@lfdr.de>; Mon,  9 Jan 2023 15:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 910E710E42B;
	Mon,  9 Jan 2023 14:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com
 [209.85.210.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E66010E1E7;
 Mon,  9 Jan 2023 14:30:42 +0000 (UTC)
Received: by mail-ot1-f43.google.com with SMTP id
 r2-20020a9d7cc2000000b006718a7f7fbaso5251233otn.2; 
 Mon, 09 Jan 2023 06:30:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UE++8EdSaegTLJvzSEIrReUrSk6uUX3CF0ejl5VTJTI=;
 b=Qoplc4yXu9swRBXtDeO+zfqmfKkrTdMW8L96GI87E2AIQX62vG6yz7I1VjZjacAeci
 Et34pn4e4p7J7+80QLeB5zJsat9yEcGV6ZszdBCX5YRAaY22oiZtx1V/IqfER9z9hBXq
 0wmASWeCqaVQRG3fcc3c6NObQnWWIgvJxf5Ug/nw1yvBPVbf5W3nGl60FtJFDgDoVn1h
 LxmB14cYiF3wPOKRmXW4Tj8wArGKayBcWOPChvuF5H4b0IPonraa46zoAtkRB+YqUK+K
 pv7ykqRhK3384hYBsvQlTrVvx0NNJqQO/H9my1popjlY/UBe6KPOAez0Cwzr09RUeDrM
 zCUw==
X-Gm-Message-State: AFqh2kqFbnBqHnkCfCwcNWU6/ZDEds4ywvEpwwKv/lawC+G7Ygt7gpll
 N2QLEAVta19mqYGQLMjV+A==
X-Google-Smtp-Source: AMrXdXsMx6Hp7QO+rlvaMC7V61ifGq2ozMwS7h1TMz+wwTEzEqLkxvI56aVPEgKY0QSPaC7YYZhgzg==
X-Received: by 2002:a05:6830:1da6:b0:670:a09e:c7d2 with SMTP id
 z6-20020a0568301da600b00670a09ec7d2mr41532583oti.30.1673274641141; 
 Mon, 09 Jan 2023 06:30:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 l21-20020a9d7a95000000b0067c87f23476sm4554359otn.57.2023.01.09.06.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 06:30:39 -0800 (PST)
Received: (nullmailer pid 237527 invoked by uid 1000);
 Mon, 09 Jan 2023 14:30:36 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
References: <20230109050152.316606-1-dmitry.baryshkov@linaro.org>
 <20230109050152.316606-2-dmitry.baryshkov@linaro.org>
Message-Id: <167327380589.69610.9769499605356993935.robh@kernel.org>
Subject: Re: [PATCH v5 1/4] dt-bindings: display/msm: convert MDP5 schema to
 YAML format
Date: Mon, 09 Jan 2023 08:30:36 -0600
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 09 Jan 2023 07:01:49 +0200, Dmitry Baryshkov wrote:
> Convert the mdp5.txt into the yaml format. Changes to the existing (txt) schema:
>  - MSM8996 has additional "iommu" clock, define it separately
>  - Add new properties used on some of platforms:
>    - interconnects, interconnect-names
>    - iommus
>    - power-domains
>    - operating-points-v2, opp-table
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  | 132 -----------------
>  .../bindings/display/msm/qcom,mdp5.yaml       | 138 ++++++++++++++++++
>  2 files changed, 138 insertions(+), 132 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/display/msm/mdp5.txt
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,mdp5.yaml
> 

Running 'make dtbs_check' with the schema in this patch gives the
following warnings. Consider if they are expected or the schema is
incorrect. These may not be new warnings.

Note that it is not yet a requirement to have 0 warnings for dtbs_check.
This will change in the future.

Full log is available here: https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230109050152.316606-2-dmitry.baryshkov@linaro.org


mdp@1a01000: compatible:0: 'qcom,mdp5' was expected
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

mdp@1a01000: compatible: ['qcom,msm8953-mdp5', 'qcom,mdp5'] is too long
	arch/arm64/boot/dts/qcom/sdm632-fairphone-fp3.dtb

