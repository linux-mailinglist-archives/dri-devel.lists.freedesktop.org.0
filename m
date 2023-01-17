Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC7A366E5AC
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 19:11:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0C6C10E31F;
	Tue, 17 Jan 2023 18:11:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com
 [209.85.167.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 556D510E31B;
 Tue, 17 Jan 2023 18:11:55 +0000 (UTC)
Received: by mail-oi1-f179.google.com with SMTP id r9so15842440oie.13;
 Tue, 17 Jan 2023 10:11:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i9bR2toKRsd+a4vnzgdTNirWsngBZI9w5cbicVD+Etg=;
 b=KucK9HJKN8Tel/Q2u6/db+0sRxU1aqHTpiAaf9jBSezmcOegJx28H0vf8DUI4e0e2R
 fuzXobJNGIYdiMd3+0xOW3bwN6IJBDcLSP0CCYkIzQSep5ef1jFpdDnKgcyjCfGJCzJs
 3CLOUzXN+vdgeJBvz9tPOwW1KzGGYu1lyDR/hCIwwrlf3IjqzuDXenPqc5mj92NhW370
 EFqwLQ8bUav2jBOQzzoubE81Af7Z5+13ATOY8jUwdRk8fkFSsCPeYPSPZH2V6gzsWIxd
 GUVcS2DhUjZf2Vmgavoq1vjWaBrZH4kH3om2bspVMguYYz/yqFRkgd89ZGUEo8E6JHcF
 PRfA==
X-Gm-Message-State: AFqh2kqqggjtLRvM84kXF5gCQj8O4cLv9yzaA1gDlRj2iEdkDk1i1zbT
 TvdiIPAFamgrGuvOkcNW0w==
X-Google-Smtp-Source: AMrXdXsu8gdmXHhUdvUZwiISvgeSQBVWS1KQ28ogMeBnmlUMQUB3NQkyYTfCvw5u9t5VG4hWgX1YjQ==
X-Received: by 2002:aca:5804:0:b0:35e:7dd2:aa96 with SMTP id
 m4-20020aca5804000000b0035e7dd2aa96mr1783317oib.21.1673979114515; 
 Tue, 17 Jan 2023 10:11:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 e8-20020a544f08000000b0035aa617156bsm15101211oiy.17.2023.01.17.10.11.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 10:11:54 -0800 (PST)
Received: (nullmailer pid 3386962 invoked by uid 1000);
 Tue, 17 Jan 2023 18:11:53 -0000
Date: Tue, 17 Jan 2023 12:11:53 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 05/11] dt-bindings: display/msm: rename mdp nodes to
 display-controller
Message-ID: <167397911283.3386904.11601634517098506944.robh@kernel.org>
References: <20230113083720.39224-1-dmitry.baryshkov@linaro.org>
 <20230113083720.39224-6-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113083720.39224-6-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>, Andy Gross <agross@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Fri, 13 Jan 2023 10:37:14 +0200, Dmitry Baryshkov wrote:
> Follow the 'generic names' rule and rename mdp nodes to
> display-controller.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-common.yaml       | 8 ++++++++
>  .../devicetree/bindings/display/msm/qcom,mdp5.yaml        | 3 +++
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 6 +++---
>  3 files changed, 14 insertions(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
