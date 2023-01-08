Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D14C6617DB
	for <lists+dri-devel@lfdr.de>; Sun,  8 Jan 2023 19:11:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5A810E20C;
	Sun,  8 Jan 2023 18:10:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
 [209.85.166.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9571E10E1FE;
 Sun,  8 Jan 2023 18:10:55 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id e129so3516153iof.3;
 Sun, 08 Jan 2023 10:10:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VaYtJSbg0m1h9v/y0oGBIF5OJEkln4UIHXOm49qosbk=;
 b=OQTSGGB4CBuhYcj5YgQ9xaZtPOorJt5+UdoC3vsd+NtuuMHa8CH+sxqjLO9/Y4xg72
 zFA/UWnEz83ylLD/P5aEArXh0nRJ7fl4FRi6Plv/7awnSJH1BzJMuFlqqDSzYpQ95AQP
 JoFAxlMHcJAu5Bxx+juEPKLrXQYyWUMV5SDzn8QXhs3w2yvL/jFTLy/sUWEslPPIC5fS
 3tmjJleCWR5br2yKv/Tis2SXirg0CivuRJiKqlwL6qtaNqQaWp/M1XNl7uMmYkZgtGv3
 F0tSoaUoM8kReIheCyGSE6pF2thofbs5fr99hQMnzRZe/35jSroU0woG0z2QcmgfsEWa
 d5nQ==
X-Gm-Message-State: AFqh2kpvL7SPBRbCAJ82jDF7hdKdL3YPjY5KGho6rBw8/K2ypO/suLA7
 jecqsx+wTaIoZwgbwtNnFA==
X-Google-Smtp-Source: AMrXdXvgwhlFhigBTBW17M60+YlCLJ0HiW7wQwdHfJos1G0hDrrz6tu/pH11pfTsb5vfGyTuyIE+Zw==
X-Received: by 2002:a05:6602:2183:b0:6bd:196e:da3 with SMTP id
 b3-20020a056602218300b006bd196e0da3mr40568542iob.8.1673201454659; 
 Sun, 08 Jan 2023 10:10:54 -0800 (PST)
Received: from robh_at_kernel.org ([2605:ef80:8069:516a:f2b0:691e:4315:7c0f])
 by smtp.gmail.com with ESMTPSA id
 d16-20020a6b6810000000b006de73a731dbsm2347201ioc.51.2023.01.08.10.10.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 10:10:54 -0800 (PST)
Received: (nullmailer pid 154605 invoked by uid 1000);
 Sun, 08 Jan 2023 18:10:51 -0000
Date: Sun, 8 Jan 2023 12:10:51 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: display: msm: drop redundant part of
 title
Message-ID: <167320145082.154531.12469565468633338851.robh@kernel.org>
References: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221225115925.55337-1-krzysztof.kozlowski@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, Loic Poulain <loic.poulain@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Sun, 25 Dec 2022 12:59:24 +0100, Krzysztof Kozlowski wrote:
> The Devicetree bindings document does not have to say in the title that
> contains "DT properties", but instead just describe the hardware.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dsi-phy-common.yaml    | 7 +++----
>  .../devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml  | 2 +-
>  .../devicetree/bindings/display/msm/qcom,qcm2290-dpu.yaml  | 2 +-
>  .../devicetree/bindings/display/msm/qcom,sc7180-dpu.yaml   | 2 +-
>  .../devicetree/bindings/display/msm/qcom,sc7280-dpu.yaml   | 2 +-
>  .../devicetree/bindings/display/msm/qcom,sdm845-dpu.yaml   | 2 +-
>  .../devicetree/bindings/display/msm/qcom,sm6115-dpu.yaml   | 2 +-
>  7 files changed, 9 insertions(+), 10 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
