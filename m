Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC3B5912B3
	for <lists+dri-devel@lfdr.de>; Fri, 12 Aug 2022 17:14:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C56D8B62FD;
	Fri, 12 Aug 2022 15:13:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com
 [209.85.166.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2ACB62DD;
 Fri, 12 Aug 2022 15:13:56 +0000 (UTC)
Received: by mail-il1-f181.google.com with SMTP id c5so617909ilh.3;
 Fri, 12 Aug 2022 08:13:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=message-id:date:subject:references:in-reply-to:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=qrYMH+Kwic0lNNdXlyACBjAld7jR6Z8oVCf9ilB6udQ=;
 b=7Xvl8x6tBqQKv2Yk7e3BMAqaUBegp+Xj5kQ0cSU9WPAybcpmetG+MqHwpowG1dghtI
 nYhknO+9W0IK2YgfkSa4TpEbabIf6V+mYGeM5oBEpT3cVwXPXA7TLS/ZgxF85G9eNemN
 1qNY+RsrQZaTBvjTDoeOF9Te4Jl3nj1DKoRj+ZV/O8AT36eD7zxzWTKZinEXERFCJ/lo
 obC3Tq4jfgjMaNo2z1LreWdEBcRARNP7XvNo0/IOnLNcJpNlOwTnEcf0DzuU9xvrO4vp
 Z8mNIk7lxb3/2/JsLFFTllcJhxZDemk42HgmKgqAwL1tjTarKk00nIpdCKWFJWTLDPsi
 GINg==
X-Gm-Message-State: ACgBeo1yl9oXrSQU1S4PtNvrUIXI0f7j4o3MFOoRoX4oG4b7wMIGB1kr
 sIZpdg0gQUA0J2hmOUzBag==
X-Google-Smtp-Source: AA6agR4LIkp2IQh8Xf1gwt2+DMWiriYNLrEfpR8rav2W8/cROciO1rzAEhb1njHS4Nnbwm7Gm0KzRg==
X-Received: by 2002:a05:6e02:19cc:b0:2dd:ad68:7443 with SMTP id
 r12-20020a056e0219cc00b002ddad687443mr2092242ill.141.1660317235332; 
 Fri, 12 Aug 2022 08:13:55 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 bq12-20020a056638468c00b00343617e8368sm793015jab.99.2022.08.12.08.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Aug 2022 08:13:54 -0700 (PDT)
Received: (nullmailer pid 168973 invoked by uid 1000);
 Fri, 12 Aug 2022 15:13:53 -0000
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <20220811040121.3775613-2-bjorn.andersson@linaro.org>
References: <20220811040121.3775613-1-bjorn.andersson@linaro.org>
 <20220811040121.3775613-2-bjorn.andersson@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: display/msm: Add binding for SC8280XP
 MDSS
Date: Fri, 12 Aug 2022 09:13:53 -0600
Message-Id: <1660317233.413609.168972.nullmailer@robh.at.kernel.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Aug 2022 21:01:19 -0700, Bjorn Andersson wrote:
> Add binding for the display subsystem and display processing unit in the
> Qualcomm SC8280XP platform.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>  .../bindings/display/msm/dpu-sc8280xp.yaml    | 284 ++++++++++++++++++
>  1 file changed, 284 insertions(+)
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
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/display/msm/dpu-sc8280xp.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

