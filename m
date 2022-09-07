Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 633245B0D73
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 21:50:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2F510E85D;
	Wed,  7 Sep 2022 19:50:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f44.google.com (mail-oa1-f44.google.com
 [209.85.160.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D0210E85B;
 Wed,  7 Sep 2022 19:49:58 +0000 (UTC)
Received: by mail-oa1-f44.google.com with SMTP id
 586e51a60fabf-1274ec87ad5so23773159fac.0; 
 Wed, 07 Sep 2022 12:49:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=S2tqXAKzFdgTEY8hJUV312lMc/AuZ4H/XtQOwAe9qN4=;
 b=RX33CxBbNwWJjYVQ7Wwm41uOGlbaq7cF5yh4b5jvUSXzIcCrRZ4zvFokgMVKKEIhRI
 Lx/1R1SmXfWz+y0Ihnq1pc7Z9+G9jIWnCLOfh+vw3eVV8IUNNKbqUo7l5YcOYdhGWXuw
 5Jz5mdi0JD1TZKeZ8h7kd1PG+CVHpyhfMGSdcpf0Y+sURTaraLOpElzdvp+R1Gsh9ydK
 PcDJ2BTbV5uBvGDRsCqT1BW9FyRs8r84gFrA76IVDWfJgTvbA3sN3Vi/+biG2uQbNeS/
 a9qkPO0dz8yun+ashnhngFf13cMn6XhWsO2uy+kPYhI7XPHkNrmcAzBzlnUeAztmD9hB
 lzjg==
X-Gm-Message-State: ACgBeo09Ts2Wsq/hiOeCdXLuTqdL2+VXEbAYs7MPyKW/O1pVrP70tfMC
 YA8QjdkxZEdQpReho67CSA==
X-Google-Smtp-Source: AA6agR6YpjdriR+gjYVcWaT10okvnkrPhM3k1OlGBC1XKHdRf109xn0Mfl2916PTKfRqXPpZjU6e9w==
X-Received: by 2002:a05:6808:2127:b0:343:ce6:18ff with SMTP id
 r39-20020a056808212700b003430ce618ffmr33755oiw.165.1662580197669; 
 Wed, 07 Sep 2022 12:49:57 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 nw16-20020a056870bb1000b0010d4aba3339sm8544490oab.42.2022.09.07.12.49.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 12:49:57 -0700 (PDT)
Received: (nullmailer pid 95999 invoked by uid 1000);
 Wed, 07 Sep 2022 19:49:56 -0000
Date: Wed, 7 Sep 2022 14:49:56 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 01/12] dt-bindings: display/msm: split qcom,mdss
 bindings
Message-ID: <20220907194956.GA89981-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Sep 01, 2022 at 01:23:01PM +0300, Dmitry Baryshkov wrote:
> Split Mobile Display SubSystem (MDSS) root node bindings to the separate
> yaml file. Changes to the existing (txt) schema:
>  - Added optional "vbif_nrt_phys" region used by msm8996
>  - Made "bus" and "vsync" clocks optional (they are not used by some
>    platforms)
>  - Added (optional) "core" clock added recently to the mdss driver
>  - Added optional resets property referencing MDSS reset
>  - Defined child nodes pointing to corresponding reference schema.
>  - Dropped the "lut" clock. It was added to the schema by mistake (it is
>    a part of mdp4 schema, not the mdss).
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/mdp5.txt  |  30 +---
>  .../devicetree/bindings/display/msm/mdss.yaml | 166 ++++++++++++++++++
>  2 files changed, 167 insertions(+), 29 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/mdss.yaml

Reviewed-by: Rob Herring <robh@kernel.org>
