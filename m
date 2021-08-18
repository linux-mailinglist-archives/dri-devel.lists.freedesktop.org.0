Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7CC03F08C9
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 18:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F4716E849;
	Wed, 18 Aug 2021 16:14:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com
 [209.85.210.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 828CB6E841;
 Wed, 18 Aug 2021 16:14:15 +0000 (UTC)
Received: by mail-ot1-f41.google.com with SMTP id
 f16-20020a056830205000b00519b99d3dcbso4756337otp.2; 
 Wed, 18 Aug 2021 09:14:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=yauHXJCxHoVp5aXAAes27TDBGWrBr9jVMGaMrDiigz8=;
 b=FuavDhbCc/bfEhGs3VMlzTuOas5h+Q34TCaTdIqdid8Td/hh97NSymwLbPALiKIG/U
 exAW+P7R5cVwVaDZqrb+EWggL4OO803auxlDxUkN3eu5ecZt8GoArD7pnOWJVUYN/8M6
 f7jeUEegsSsa+HATIEJJkpeV2tGSwmwiCbNQAi5G2D7t5X7CLB80WVlN2LGjgPBicLEH
 GaYFnBs+Wa/abddt8WV0l/z0yIqWSrN4qmtb8EHaGLRaxSFDhkari7oyi+lTdpnG0J89
 /yrP4lSf1/Q9iiEh1ocL/u/cdr/Cl4ZDwtKRcrauFGu+mGTj1zVr99+tdkBnxPZ3yl0D
 9rCQ==
X-Gm-Message-State: AOAM533GEdVM2AlMLSNFVi8IFwdl55Y+HkjTQ8BOh7FoIYn1TafuLIWX
 ANIcjC2iOvgdBpAgtq3BUQ==
X-Google-Smtp-Source: ABdhPJzzOuQIH8PiEiqnXaNNItIPBPXASTbgrSCmxUFvf7DxF43cogknZxmC20Q63vL+nLiIp/5AIg==
X-Received: by 2002:a05:6830:2807:: with SMTP id
 w7mr7528360otu.70.1629303254775; 
 Wed, 18 Aug 2021 09:14:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id 4sm97281oil.38.2021.08.18.09.14.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 09:14:14 -0700 (PDT)
Received: (nullmailer pid 2696510 invoked by uid 1000);
 Wed, 18 Aug 2021 16:14:13 -0000
From: Rob Herring <robh@kernel.org>
To: Krishna Manikandan <mkrishn@codeaurora.org>
Cc: rajeevny@codeaurora.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, bjorn.andersson@linaro.org,
 kalyan_t@codeaurora.org, robh+dt@kernel.org, abhinavk@codeaurora.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robdclark@gmail.com, linux-arm-msm@vger.kernel.org, khsieh@codeaurora.org,
 swboyd@chromium.org, sbillaka@codeaurora.org
In-Reply-To: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
References: <1629282424-4070-1-git-send-email-mkrishn@codeaurora.org>
Subject: Re: [PATCH v1 1/4] dt-bindings: msm: add DT bindings for sc7280
Date: Wed, 18 Aug 2021 11:14:13 -0500
Message-Id: <1629303253.016460.2696509.nullmailer@robh.at.kernel.org>
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

On Wed, 18 Aug 2021 15:57:01 +0530, Krishna Manikandan wrote:
> MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI, EDP etc. Add required DPU
> device tree bindings for SC7280.
> 
> Signed-off-by: Krishna Manikandan <mkrishn@codeaurora.org>
> ---
>  .../bindings/display/msm/dpu-sc7280.yaml           | 228 +++++++++++++++++++++
>  1 file changed, 228 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/dpu-sc7280.example.dts:19:18: fatal error: dt-bindings/clock/qcom,dispcc-sc7280.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,dispcc-sc7280.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:380: Documentation/devicetree/bindings/display/msm/dpu-sc7280.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1419: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1517976

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

