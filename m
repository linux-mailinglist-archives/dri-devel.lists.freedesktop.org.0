Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D3270B172
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 00:24:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F6D10E0EB;
	Sun, 21 May 2023 22:23:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com
 [209.85.210.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EFB10E0EB
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 22:23:53 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id
 46e09a7af769-6af7a84b2bdso357296a34.2
 for <dri-devel@lists.freedesktop.org>; Sun, 21 May 2023 15:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684707833; x=1687299833;
 h=date:subject:message-id:references:in-reply-to:cc:to:from
 :mime-version:content-transfer-encoding:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=KAY67UCuApho3EFGBTe+ZwXaOBBvqQRkfmzBqO+gFKk=;
 b=P7r8PtzWyTACd1+PwQqY+UTKbxOxSEaGXBrzrLclXPXfF55Jx/tYDdhTcr+BW67ou5
 wGQ808/HaEEdqhSna1m2A84cu7rIby6HjLucUr/fNdPU+ugDlVwZnal+h7kWywxQV90K
 w9IuJA1Vz37KPA44pcHJ2QbZzwsbp71F/p2HP0WMGcyqiHjDe/bDvPbCn1V3iaO1h9iJ
 oFYF54j1doW1J6/qnaAzxGcsFN2qayB2WLOM4lgXUjYFfTXVAU4xfASd5zlsD1rO8ZPs
 hrwDv5J27xlU/jP4Ouh+ATdrsmFL7Ikr3Noj8CG/1R0VTg+hrOls0hfTpj9WdpW/RhJ/
 Tp3w==
X-Gm-Message-State: AC+VfDwgmjjNcr0bdAO6w4bh0f4qU7mqBCygCwBoVJd/8Sgqr0JEA903
 mO3Xs3qf377Up/BFzPIEBA==
X-Google-Smtp-Source: ACHHUZ7L6bXXfCzbawGSRq/3weqfOYxW8zXa/PPv5VJnhrT+5whuhA5JYT6Gqt+riwr27cWsTCTAzA==
X-Received: by 2002:a9d:5e8f:0:b0:6af:793b:a87 with SMTP id
 f15-20020a9d5e8f000000b006af793b0a87mr901124otl.28.1684707832800; 
 Sun, 21 May 2023 15:23:52 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 q25-20020a9d7c99000000b006aaf82bd5a2sm1825160otn.43.2023.05.21.15.23.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 15:23:52 -0700 (PDT)
Received: (nullmailer pid 1541546 invoked by uid 1000);
 Sun, 21 May 2023 22:23:48 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
In-Reply-To: <20230521-drm-panels-sony-v1-9-541c341d6bee@somainline.org>
References: <20230521-drm-panels-sony-v1-0-541c341d6bee@somainline.org>
 <20230521-drm-panels-sony-v1-9-541c341d6bee@somainline.org>
Message-Id: <168470782808.1541521.2400870342628606112.robh@kernel.org>
Subject: Re: [PATCH RFC 09/10] dt-bindings: display: panel: Describe Sony
 Xperia 1 display
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


On Sun, 21 May 2023 23:23:11 +0200, Marijn Suijten wrote:
> Document an unnamed Samsung Display-IC and 1644x3840@60 6.5" panel found
> in the Sony Xperia 1.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  .../display/panel/sony,griffin-samsung.yaml        | 73 ++++++++++++++++++++++
>  1 file changed, 73 insertions(+)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
./Documentation/devicetree/bindings/display/panel/sony,griffin-samsung.yaml: $id: relative path/filename doesn't match actual path or filename
	expected: http://devicetree.org/schemas/display/panel/sony,griffin-samsung.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230521-drm-panels-sony-v1-9-541c341d6bee@somainline.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

