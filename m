Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1635549332E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 03:55:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E34E210E2EB;
	Wed, 19 Jan 2022 02:55:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com
 [209.85.167.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2EC610E1EF
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 02:55:55 +0000 (UTC)
Received: by mail-oi1-f172.google.com with SMTP id s22so1944029oie.10
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 18:55:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=gWjvLvQKqG87eCtKAWR8mJd0SzTtFBqwrDZXd6cPHFM=;
 b=jDnboz/Q+/A3rLgsXrsl44gnpRVWXwOy2lWDLIOOTn/YKAOdGVj4XU2YeJ4Vk3HrLL
 0nPYXy9e23oDxvLzJvMFd+KZRbe1uyEVCMS5SQALlodUnWngEnydNRNWrcRUjV7yQUdN
 JZlx7oOaZ+UsZKJasP2eUcqE/aRxb2Ey0W3sR/VpWF7vZYKMMPgBkPDtoeiezagwimBu
 htvac6dH95sA2BPXZl1yWXYo5urxKbqMqHCGzzbPvaiGYS42+ezqnQU9iSYmfhIbjDpc
 ubQNgCxSRas6Fe8eIMb/V7dQvtpNY0Ih4mwz2+oZlGyKJi2JrnOBdoeCoF+I02677C+Z
 VIvQ==
X-Gm-Message-State: AOAM5310cVfFDM9KUyBx7kqeZbgh6NaTJUScFzGhyXy4Jga4Q+c+OkP+
 1YYah1xJhNgHJIuvIYfQhQ==
X-Google-Smtp-Source: ABdhPJzt0HX0H5IspL5Mwz1wTyXRAg5G67yYxFxUFYBiDAM3yMEWIBGL/me9onXebe2mYb6A0kLtrw==
X-Received: by 2002:a05:6808:b38:: with SMTP id
 t24mr1335742oij.25.1642560954835; 
 Tue, 18 Jan 2022 18:55:54 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213])
 by smtp.gmail.com with ESMTPSA id b24sm7976693oti.68.2022.01.18.18.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 18:55:54 -0800 (PST)
Received: (nullmailer pid 2537489 invoked by uid 1000);
 Wed, 19 Jan 2022 02:55:53 -0000
From: Rob Herring <robh@kernel.org>
To: Loic Poulain <loic.poulain@linaro.org>
In-Reply-To: <1642520854-32196-2-git-send-email-loic.poulain@linaro.org>
References: <1642520854-32196-1-git-send-email-loic.poulain@linaro.org>
 <1642520854-32196-2-git-send-email-loic.poulain@linaro.org>
Subject: Re: [PATCH 2/2] dt-bindings: msm: disp: add yaml schemas for QCM2290
 DPU bindings
Date: Tue, 18 Jan 2022 20:55:53 -0600
Message-Id: <1642560953.410200.2537488.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 robh+dt@kernel.org, dmitry.baryshkov@linaro.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 18 Jan 2022 16:47:34 +0100, Loic Poulain wrote:
> QCM2290 MSM Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
> 
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
> ---
>  .../bindings/display/msm/dpu-qcm2290.yaml          | 214 +++++++++++++++++++++
>  1 file changed, 214 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-qcm2290.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dts:19:18: fatal error: dt-bindings/clock/qcom,dispcc-qcm2290.h: No such file or directory
   19 |         #include <dt-bindings/clock/qcom,dispcc-qcm2290.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:373: Documentation/devicetree/bindings/display/msm/dpu-qcm2290.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1413: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/1581387

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

