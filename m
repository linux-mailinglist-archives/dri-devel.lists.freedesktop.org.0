Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE16C70B171
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 00:23:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2903C10E210;
	Sun, 21 May 2023 22:23:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com
 [209.85.167.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E24310E0EB
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 22:23:51 +0000 (UTC)
Received: by mail-oi1-f177.google.com with SMTP id
 5614622812f47-394c7ba4cb5so1810704b6e.1
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 15:23:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684707830; x=1687299830;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=UTDXznobr9OPk+Kds1D2lbqkYdCbNQhB7fj/Qh9tqKo=;
 b=cE40VdWOQMPfHmjo7Z90Iw8MzGEAcQ8BI5NNAUz/eoXZ3TC0R0EDCKdHniFpKIt/OS
 KwnwtMBbKIHc8RboW4mqkoPxz2v3lcCl28fArzWnPJbEBLuBQzwSeeqRx6IT8sOogyuP
 725dHwKiXawpVsbun7aaLfGLOd3gBM0aZNOpHn79t544B0MhgQ30dX9wrDtzuGgHg5/2
 avT6w71LvMeA7H1s/yURbGCXxCuJ4evjMTwRs3vxaOvBuY8uybT7/LghzY2ziZQaKCio
 9M5Pw46vIYb1LzqX6tjuIi22BdYqi69wA9//s/jqsUN5GAvfHMbmqxNvOZxZdhcFUWam
 TKSg==
X-Gm-Message-State: AC+VfDwfTniWc7qW3PfvMNX6zDZ4azM1aOw6dgBP4AgVq1FZIgnjQ12r
 EO5iyWW7yJi9NUXGxGunIQ==
X-Google-Smtp-Source: ACHHUZ4mXZIQJRPImk5ZQVXVSf87ZYMaE7QQotlJ+SeOXmbjEFs6/lL9AYO1x/bwqPZ9UK6CS+zBbA==
X-Received: by 2002:a05:6808:601:b0:396:38a9:cd80 with SMTP id
 y1-20020a056808060100b0039638a9cd80mr4357194oih.12.1684707830411; 
 Sun, 21 May 2023 15:23:50 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 p25-20020a4adc19000000b005476712364bsm1760475oov.19.2023.05.21.15.23.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 15:23:49 -0700 (PDT)
Received: (nullmailer pid 1541543 invoked by uid 1000);
 Sun, 21 May 2023 22:23:48 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20230521-drm-panels-sony-v1-5-541c341d6bee@somainline.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-5-541c341d6bee@somainline.org>
Message-Id: <168470782726.1541479.18410268198759128308.robh@kernel.org>
Subject: Re: [PATCH RFC 05/10] dt-bindings: display: panel: Describe
 Samsung SOFEF01-M Display-IC
Date: Sun, 21 May 2023 17:23:48 -0500
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
Cc: dri-devel@lists.freedesktop.org, Caleb Connolly <caleb@connolly.tech>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Sam Ravnborg <sam@ravnborg.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Andy Gross <agross@kernel.org>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jami Kettunen <jami.kettunen@somainline.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 21 May 2023 23:23:07 +0200, Marijn Suijten wrote:
> Document the SOFEF01-M Display-IC and 1080x2520 panels found in the Sony
> Xperia 5 (6.1") and Sony Xperia 10 II (6.0").
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../bindings/display/panel/samsung,sofef01-m.yaml  | 109 +++++++++++++++++++++
>  1 file changed, 109 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.example.dtb: panel@0: 'vci-supply' does not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/panel/samsung,sofef01-m.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230521-drm-panels-sony-v1-5-541c341d6bee@somainline.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

