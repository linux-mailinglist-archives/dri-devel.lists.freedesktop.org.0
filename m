Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E5FD865E30F
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 03:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2295710E626;
	Thu,  5 Jan 2023 02:54:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 084C510E0DC;
 Thu,  5 Jan 2023 02:54:01 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id m15so20502771ilq.2;
 Wed, 04 Jan 2023 18:54:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CNKaGonGu+I02QEZvEk7d0YSoCmtvT6lkDN3iBcVJcQ=;
 b=Gyw3NF0EU+q1rHZlkvvO5zzGzMgMOoxjt7i4UjNZwXnmIBGB2LBqh3DeA0WT6CfBdB
 VfVFlBy9HUfDmjJAQHUtQVyy3BIhrgO8t47V9NGJ+49q6xxKuB+lMRnONFW5V7UiCki3
 C4d8cYKb7iFWFlL25E3yiVzlZ+KnDImJzKr7yy1JJtOEWocdZZX5NIX0ld3ABrIwuETD
 VzvDykzn+UoPu+QGBdTUH+SJbgNVJx/H5chOfWPwrpErlXPnZ2JmMk+cx8yTD/Rd8tw+
 njB6m6BHa3ESiJOXL8gMM+PNt0+I9gAxw5a8bjo0tAbM5rlpKs1GAgviiAkfoWb0oN95
 WlXA==
X-Gm-Message-State: AFqh2kod8FMCgc6HLe3UN24LsOifnm206k/gC+n2IqLnpeLuTpRHWhVy
 JacZX8Eki0SnzUsd7qNysg==
X-Google-Smtp-Source: AMrXdXtYqUXNZ+i5YDmpzwIUU8B3ypJ+r8qwgK08X3a6FvGGIE7XfINtYr4VF10NsxsCe6SH+DudoA==
X-Received: by 2002:a05:6e02:60e:b0:302:aa41:43ad with SMTP id
 t14-20020a056e02060e00b00302aa4143admr43317218ils.20.1672887241190; 
 Wed, 04 Jan 2023 18:54:01 -0800 (PST)
Received: from robh_at_kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 y72-20020a02954e000000b0036332a07adcsm11236500jah.173.2023.01.04.18.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jan 2023 18:54:00 -0800 (PST)
Received: (nullmailer pid 3295146 invoked by uid 1000);
 Thu, 05 Jan 2023 02:53:58 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v1-2-9ccd7e652fcd@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v1-0-9ccd7e652fcd@linaro.org>
 <20230103-topic-sm8550-upstream-mdss-dsi-v1-2-9ccd7e652fcd@linaro.org>
Message-Id: <167288699522.3289711.11095242316401354794.robh@kernel.org>
Subject: Re: [PATCH 2/6] dt-bindings: display/msm: document the display
 hardware for SM8550
Date: Wed, 04 Jan 2023 20:53:58 -0600
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
Cc: Sean Paul <sean@poorly.run>, freedreno@lists.freedesktop.org,
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Wed, 04 Jan 2023 10:08:44 +0100, Neil Armstrong wrote:
> Document the MDSS and DPU blocks found on the Qualcomm SM8550
> platform.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8550-dpu.yaml      | 134 +++++++++
>  .../bindings/display/msm/qcom,sm8550-mdss.yaml     | 331 +++++++++++++++++++++
>  2 files changed, 465 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dts:21:18: fatal error: dt-bindings/clock/qcom,sm8550-dispcc.h: No such file or directory
   21 |         #include <dt-bindings/clock/qcom,sm8550-dispcc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:434: Documentation/devicetree/bindings/display/msm/qcom,sm8550-dpu.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1508: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230103-topic-sm8550-upstream-mdss-dsi-v1-2-9ccd7e652fcd@linaro.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

