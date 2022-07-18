Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31049578902
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 19:57:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A49B112445;
	Mon, 18 Jul 2022 17:57:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com
 [209.85.166.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D29410EA88;
 Mon, 18 Jul 2022 17:57:42 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id u20so9898342iob.8;
 Mon, 18 Jul 2022 10:57:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=FTLdYpYJWh+u6rozMPL/HAUqbA9FZq915QJ3J6E3duU=;
 b=UijZwupkZADXJaaWlmS62t3iWblNqtUfgnvM6cXYhR+KZOLdlKovLSab6DfWluVWn2
 J+4PZFCHJjYi1NYkmKhbFcHceScIcLCMpE0z72JHs07aklWMMtUa2/3rRx6xE/tUpo4K
 mIDFASQtZdMW/ZIUFvtQDzsb8US4m7zgGTOqhFSz67FzHrVvTXQbNO+5zPILIC8kw8Gp
 HBFTM8mFLPtD/2baKl+q+tR6cC6JGhUVJlbOBW6XGij2YBoEJEfr5CyGLRuYPv2nE1qh
 sRiEn81LG9upxd8dI6gxw79GFOUZr5Z98+ytpJicHVuZ9NNH7jz2u0B/5WQr+idrRObP
 LkMQ==
X-Gm-Message-State: AJIora+Fd4priBVaJFvN/TAp8coCYUZxnzZg3f1mDnst7cT9bragxc8/
 C8O5BV+0+ek1TWJnMIZXlg==
X-Google-Smtp-Source: AGRyM1tx/b++jpg+Ol3oUV5moVTNvNP37K9Pksh1j5pWxwTeOClNEHTx6PVmpsHHDupr9+kClnQBJQ==
X-Received: by 2002:a05:6638:2404:b0:33f:7105:ed23 with SMTP id
 z4-20020a056638240400b0033f7105ed23mr14455411jat.50.1658167061508; 
 Mon, 18 Jul 2022 10:57:41 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 z7-20020a92bf07000000b002dc10fd4b88sm5004376ilh.29.2022.07.18.10.57.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:57:41 -0700 (PDT)
Received: (nullmailer pid 3250964 invoked by uid 1000);
 Mon, 18 Jul 2022 17:57:39 -0000
Date: Mon, 18 Jul 2022 11:57:39 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 08/11] dt-bindings: display/msm: move
 qcom,qcm2290-mdss schema to mdss.yaml
Message-ID: <20220718175739.GA3250907-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-9-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-9-dmitry.baryshkov@linaro.org>
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 12:00:37 +0300, Dmitry Baryshkov wrote:
> Move schema for qcom,qcm2290-mdss from dpu-qcm2290.yaml to mdss.yaml so
> that the dpu file describes only the DPU schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dpu-qcm2290.yaml     | 140 +++++-------------
>  .../devicetree/bindings/display/msm/mdss.yaml |  24 +++
>  2 files changed, 57 insertions(+), 107 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
