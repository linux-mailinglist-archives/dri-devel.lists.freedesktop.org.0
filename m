Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF07D56C17B
	for <lists+dri-devel@lfdr.de>; Fri,  8 Jul 2022 23:32:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E75410EA99;
	Fri,  8 Jul 2022 21:32:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f50.google.com (mail-io1-f50.google.com
 [209.85.166.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA3A10EA99;
 Fri,  8 Jul 2022 21:32:09 +0000 (UTC)
Received: by mail-io1-f50.google.com with SMTP id y3so172475iof.4;
 Fri, 08 Jul 2022 14:32:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
 :message-id;
 bh=vVYCFAFM3u7M5ctS+8Pi5ElwP8UGTsNsPbFnqh+Srfk=;
 b=GO0tRUhNkEtUlAXWUPQvGuMyqZuMD2CNVnEbfOGPK754PUUHyaDfv2NNaPNIQhGzHX
 SZ8Kju13ZETUiR1EuHuI5Dj6uCGtXL99jMsFCni/Grp5pugdgcVgD7xCu69k3OB4+fGI
 1BXn7RQNILT6ZYxG4bfJ9DeuXUZIkM8RsFwzDM0gXu0ZR5KAZbiSbiAGoVJWHksMLnij
 bguZbD6QPi6/7cs3yy7xkk7+RFX13DbKbJ8J9JfhTX3XtaQgBGXj1FB3E9mpwW1bEjCY
 Bqxhkh5XJw0Bjf/pcU8xREwiQVNBMOfJHNVMu08y4uxL62QPtPHqsRvaZH/CeLg8+VNi
 Z7vg==
X-Gm-Message-State: AJIora9PnUvbj0lqw+3cR9/wgcNG6kbz03fNyscfg8xA5IYSvPKiR0f+
 xHUkw7XADMf7bTmO9mECYA==
X-Google-Smtp-Source: AGRyM1sumiMM0+0KfOQZuDKX7asNwIIbBAJhw4KV3PPTXCSZPJWI1RTnSfkQKj91GRcwWUfAc6DP+A==
X-Received: by 2002:a05:6638:d51:b0:33c:b03e:8035 with SMTP id
 d17-20020a0566380d5100b0033cb03e8035mr3433812jak.251.1657315928727; 
 Fri, 08 Jul 2022 14:32:08 -0700 (PDT)
Received: from robh.at.kernel.org ([98.38.210.73])
 by smtp.gmail.com with ESMTPSA id
 e24-20020a022118000000b00331d764e5b5sm18707972jaa.97.2022.07.08.14.32.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 14:32:08 -0700 (PDT)
Received: (nullmailer pid 1508201 invoked by uid 1000);
 Fri, 08 Jul 2022 21:32:02 -0000
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
References: <20220707213204.2605816-1-dmitry.baryshkov@linaro.org>
 <20220707213204.2605816-2-dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH 1/9] dt-bindings: msm/dp: drop extra p1 region
Date: Fri, 08 Jul 2022 15:32:02 -0600
Message-Id: <1657315922.448144.1508200.nullmailer@robh.at.kernel.org>
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 08 Jul 2022 00:31:56 +0300, Dmitry Baryshkov wrote:
> The p1 region was probably added by mistake, none of the DTS files
> provides one (and the driver source code also doesn't use one). Drop it
> now.
> 
> Fixes: 687825c402f1 ("dt-bindings: msm/dp: Change reg definition")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 -
>  1 file changed, 1 deletion(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.example.dtb: displayport-controller@ae90000: reg: [[183042048, 512], [183042560, 512], [183043072, 3072], [183046144, 1024], [183047168, 1024]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/display/msm/dp-controller.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

