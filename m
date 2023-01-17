Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFB566E58E
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:03:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F73310E599;
	Tue, 17 Jan 2023 18:03:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E7BD10E598;
 Tue, 17 Jan 2023 18:03:31 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-15085b8a2f7so32832614fac.2; 
 Tue, 17 Jan 2023 10:03:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DOYPnyAt2J4Uh+rVJ+ehIUCeXiRFMPFo5jZlhneDgR4=;
 b=vJGf2FWvQRRQeMx37Q6l58KdIX+GvZzW2x9tXtOGW9y9CNcNMhLRC2we9cLKgO/AT5
 o6bp16Bl0NMQLUcGwLn85IcsM4LonQe6cYfxGXcgoDeN8wJJLUJDfNgTDnm7u+oDsuQj
 tTbvV6x+YVKA5LgEEakPix6gjZBx9jNCyCsX67lVDdLp6uoK7hhDXOPVMcSu9QzYDVus
 6Foly8749QAyNXBy6VOcJPGaHGb0X85e8rjwgXHQc1cHXoKWKTnhTQdq7t+sShe6g5Rv
 1u5p62q6myxR+lNukcLLP6S6xg2AiX4jkfS9ZQ+54ZO22llK18QP/BbDSPO+VfsPq9UR
 Lz4Q==
X-Gm-Message-State: AFqh2ko3GsCE9ma610F3DCogYtQ31IukaPyzFDdsCT8AFW973rHCr6Qt
 cEq6wi8IeLnS7dw06oQ80g==
X-Google-Smtp-Source: AMrXdXtXdEGZRX21HSHeHAgDRpQrycVFovajB2ZoPABGZ88wt1c/v3xzwZs6+aRiC5KlzuBvMMu+lw==
X-Received: by 2002:a05:6870:fd99:b0:15f:ed7:c02d with SMTP id
 ma25-20020a056870fd9900b0015f0ed7c02dmr2433421oab.55.1673978610488; 
 Tue, 17 Jan 2023 10:03:30 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 c6-20020a056870c08600b0014be94a12d0sm16837537oad.44.2023.01.17.10.03.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:03:29 -0800 (PST)
Received: (nullmailer pid 3323388 invoked by uid 1000);
 Tue, 17 Jan 2023 18:03:29 -0000
Date: Tue, 17 Jan 2023 12:03:29 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 01/11] dt-bindings: display/msm: convert MDP5 schema
 to YAML format
Message-ID: <167397860857.3323332.1645036328845035692.robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113083720.39224-2-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, freedreno@lists.freedesktop.org,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 13 Jan 2023 10:37:10 +0200, Dmitry Baryshkov wrote:
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

Reviewed-by: Rob Herring <robh@kernel.org>
