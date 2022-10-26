Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B36D460E0CE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 14:36:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B12410E4F4;
	Wed, 26 Oct 2022 12:36:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com
 [209.85.160.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F2BF10E4E7;
 Wed, 26 Oct 2022 12:36:03 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id
 586e51a60fabf-13ae8117023so19733725fac.9; 
 Wed, 26 Oct 2022 05:36:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=kV4Oxfken2/ulM3nGzbwK4CyKckevFO7gguVOI5Hhm4=;
 b=179N1tlZpWllWr3jomxugsIhy0zTy77Hv81RmUCGHzrkM73iq/7V/1R9o37IdtqFL2
 y5ZBswbfLliCwYvovo5z3l9XHdH3peiv3fVHkaIHEtVrM9EbbdqopjNu7goSyZorxZxt
 /vkLg5PKT3fbdNPkucrzMA8uGTjKvkIDJ0FH1vWKLLp0SHyAVlL8SsmXfC2ehJyibQJJ
 C5RDGBm5TWUx8NElSi5Mj9n3WvEYJCheAIjZf4Yg57dgH76kjbpgF31wU+oqWibv2s8i
 HHegedqnfy/t6LE0tBUfB4GwRodhbae1+q+w+4z4USM/arPFfxiEw2fqDkpbWCW8ZZsM
 X0IA==
X-Gm-Message-State: ACrzQf2foDuVVTVYN2pURG33UcKR7/6QK+laYFpg4qAOTSk+UT+xrpOd
 sFuOg1gJ81PdZYyZkBERhQ==
X-Google-Smtp-Source: AMsMyM7avrAhnzOr2x6d70zZ/hy8bXiFehrVQMoacKHi/oBio7h7PU7naRlNqMgIa18WyCNJRmnZHg==
X-Received: by 2002:a05:6870:8910:b0:131:2f31:dc1c with SMTP id
 i16-20020a056870891000b001312f31dc1cmr2029210oao.290.1666787762448; 
 Wed, 26 Oct 2022 05:36:02 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 d22-20020a4ad356000000b004805e9e9f3dsm2123538oos.1.2022.10.26.05.36.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Oct 2022 05:36:01 -0700 (PDT)
Received: (nullmailer pid 277720 invoked by uid 1000);
 Wed, 26 Oct 2022 12:36:02 -0000
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <quic_bjorande@quicinc.com>
In-Reply-To: <20221026032624.30871-2-quic_bjorande@quicinc.com>
References: <20221026032624.30871-1-quic_bjorande@quicinc.com>
 <20221026032624.30871-2-quic_bjorande@quicinc.com>
Message-Id: <166678762718.274656.14416161449532771853.robh@kernel.org>
Subject: Re: [PATCH v3 01/12] dt-bindings: display/msm: Add binding for
 SC8280XP MDSS
Date: Wed, 26 Oct 2022 07:36:02 -0500
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
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 25 Oct 2022 20:26:13 -0700, Bjorn Andersson wrote:
> From: Bjorn Andersson <bjorn.andersson@linaro.org>
> 
> Add binding for the display subsystem and display processing unit in the
> Qualcomm SC8280XP platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> 
> Changes since v2:
> - Cleaned up description and interconnect definitions
> - Added opp-table
> 
>  .../bindings/display/msm/dpu-sc8280xp.yaml    | 287 ++++++++++++++++++
>  1 file changed, 287 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.example.dts:21:18: fatal error: dt-bindings/clock/qcom,dispcc-sc8280xp.h: No such file or directory
   21 |         #include <dt-bindings/clock/qcom,dispcc-sc8280xp.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:406: Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

