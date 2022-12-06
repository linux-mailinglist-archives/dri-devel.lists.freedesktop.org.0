Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA2A64436A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 13:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE7DC10E31A;
	Tue,  6 Dec 2022 12:47:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f47.google.com (mail-oa1-f47.google.com
 [209.85.160.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09CE10E31A;
 Tue,  6 Dec 2022 12:47:28 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-14455716674so11106328fac.7; 
 Tue, 06 Dec 2022 04:47:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=jRbJnoAPdyVeKSpAdDaecdS/ZR6oAJxEcKGzEYJMYw0=;
 b=que+cAU46YIEye+RpLEBPorAsAacRwqRQGBeLGGgb+3TZj1qrXTgMykoGE9C/CJIGn
 dIYArkaVbslgbNbMB3lAYAxLHzK+nakRfB2UzAbBsAa10O6/wrh1GM23/Z9MvJQU/z8N
 WJgjQlIlb6FmqCbBQS3nyfVdJs/kISwkF2JG1zPcJOPodvpscueo0gS3UdL6AqjQD0fS
 VY/y+cGJdIuj1RWcpg+dcGJrWJRsWEaRh+fJRTbFYoCPUrpG5gts6RQzVheC5t26Pfds
 xJ2QRmOkZrnXe/rpdUi/9x8md/03mzXXFAxuiLyibzBrW9h03jvGcVIoTaAliitHEDVy
 fLLQ==
X-Gm-Message-State: ANoB5pkB1tnfuBew6huDxcwE04sS1RDTBCsbh/ZLpOEQqW1D5OlFUawG
 hdql/KbEej3sFx7AqTJV6g==
X-Google-Smtp-Source: AA0mqf5Rm0o3BU5PrNXKP/4vKT9EPUdrmyLN5uG/7ZjQ/O4xf0ra3tTsNcE89VV/V15aEllCorbAZw==
X-Received: by 2002:a05:6870:5781:b0:13b:c610:e30b with SMTP id
 i1-20020a056870578100b0013bc610e30bmr39970200oap.134.1670330848000; 
 Tue, 06 Dec 2022 04:47:28 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 r16-20020a4a3710000000b004a0b424f99dsm3656548oor.43.2022.12.06.04.47.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 04:47:27 -0800 (PST)
Received: (nullmailer pid 176446 invoked by uid 1000);
 Tue, 06 Dec 2022 12:47:26 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <1670281694-13281-3-git-send-email-quic_khsieh@quicinc.com>
References: <1670281694-13281-1-git-send-email-quic_khsieh@quicinc.com>
 <1670281694-13281-3-git-send-email-quic_khsieh@quicinc.com>
Message-Id: <167033052405.165993.699264089064134340.robh@kernel.org>
Subject: Re: [PATCH v9 2/5] dt-bindings: msm/dp: add data-lanes and
 link-frequencies property
Date: Tue, 06 Dec 2022 06:47:26 -0600
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
Cc: vkoul@kernel.org, quic_sbillaka@quicinc.com, dianders@chromium.org,
 devicetree@vger.kernel.org, airlied@linux.ie, sean@poorly.run,
 andersson@kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org, quic_abhinavk@quicinc.com,
 agross@kernel.org, dri-devel@lists.freedesktop.org,
 krzysztof.kozlowski+dt@linaro.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 05 Dec 2022 15:08:11 -0800, Kuogee Hsieh wrote:
> Add both data-lanes and link-frequencies property into endpoint
> 
> Changes in v7:
> -- split yaml out of dtsi patch
> -- link-frequencies from link rate to symbol rate
> -- deprecation of old data-lanes property
> 
> Changes in v8:
> -- correct Bjorn mail address to kernel.org
> 
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>`
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:
./Documentation/devicetree/bindings/display/msm/dp-controller.yaml:108:21: [error] syntax error: mapping values are not allowed here (syntax)

dtschema/dtc warnings/errors:
make[1]: *** Deleting file 'Documentation/devicetree/bindings/display/msm/dp-controller.example.dts'
Documentation/devicetree/bindings/display/msm/dp-controller.yaml:108:21: mapping values are not allowed here
make[1]: *** [Documentation/devicetree/bindings/Makefile:26: Documentation/devicetree/bindings/display/msm/dp-controller.example.dts] Error 1
make[1]: *** Waiting for unfinished jobs....
./Documentation/devicetree/bindings/display/msm/dp-controller.yaml:108:21: mapping values are not allowed here
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/msm/dp-controller.yaml: ignoring, error parsing file
make: *** [Makefile:1492: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1670281694-13281-3-git-send-email-quic_khsieh@quicinc.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

