Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A3605B0E01
	for <lists+dri-devel@lfdr.de>; Wed,  7 Sep 2022 22:19:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE38A10E86F;
	Wed,  7 Sep 2022 20:19:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com
 [209.85.210.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DE410E86D;
 Wed,  7 Sep 2022 20:19:23 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id
 92-20020a9d0be5000000b0063946111607so11010699oth.10; 
 Wed, 07 Sep 2022 13:19:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=sDfHYqJNdpt4s6mbrazgo41Cj9IhFISlCIaxBIkFjDk=;
 b=rTh3ig4moFqzG+5Zsm8hwGTprrgqxmRuxMJPJ8PYQ826ZH7VIVqptrKte4O2sabI3r
 e9vz4fkLBTXRStTT4faG1s5CcNlh3FqQCMXjBNWzvm6VMkdOhJbvBopSkN7aUyr1/J+r
 sWcuhIakvkDSjOVsoRmCxT7lT6BiyQqqhmC6tLjRosQB5mIFa+fAwd9GZ4j4t71EU8r1
 9w8iKMNdMPO7jtfaEYPjLIMHzyfySvnwPkPbZa46qS3lU22cJY/LnRF7HpTHn08/d80h
 uBR7pU8PTV+TeUAB1K+7vVfOwfiyQBFu7tjxRspaiIKfAPNc2brQTc1YA4Jiv1gpjwCh
 jDfg==
X-Gm-Message-State: ACgBeo0+7x6/22MWdTiKffaLFirFmsVdr2ZeYks2Y1CnSrwBRkg735ss
 wglgZyGxcGGj592PHC4inQ==
X-Google-Smtp-Source: AA6agR4quhswC9Vja62b/KnMIP5TL7CvGOyOyG4Br7RtGdY4gtHBkPmnDDKIwklqA1A4rmgKRhWztw==
X-Received: by 2002:a05:6830:4d2:b0:63b:2434:cbd5 with SMTP id
 s18-20020a05683004d200b0063b2434cbd5mr2212865otd.79.1662581962948; 
 Wed, 07 Sep 2022 13:19:22 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v2-20020a056830140200b006391bdbb361sm7257933otp.31.2022.09.07.13.19.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Sep 2022 13:19:22 -0700 (PDT)
Received: (nullmailer pid 216153 invoked by uid 1000);
 Wed, 07 Sep 2022 20:19:21 -0000
Date: Wed, 7 Sep 2022 15:19:21 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 11/12] dt-bindings: display/msm: add missing device
 nodes to mdss-* schemas
Message-ID: <20220907201921.GA216074-robh@kernel.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-12-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220901102312.2005553-12-dmitry.baryshkov@linaro.org>
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
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 01 Sep 2022 13:23:11 +0300, Dmitry Baryshkov wrote:
> Add missing device nodes (DSI, PHYs, DP/eDP) to the existing MDSS
> schemas.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/mdss-msm8998.yaml    | 12 +++++++++
>  .../bindings/display/msm/mdss-qcm2290.yaml    |  6 +++++
>  .../bindings/display/msm/mdss-sc7180.yaml     | 18 +++++++++++++
>  .../bindings/display/msm/mdss-sc7280.yaml     | 26 +++++++++++++++++++
>  .../bindings/display/msm/mdss-sdm845.yaml     | 12 +++++++++
>  5 files changed, 74 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
