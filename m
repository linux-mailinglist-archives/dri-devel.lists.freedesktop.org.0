Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9736578910
	for <lists+dri-devel@lfdr.de>; Mon, 18 Jul 2022 19:58:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0BE113025;
	Mon, 18 Jul 2022 17:58:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f182.google.com (mail-il1-f182.google.com
 [209.85.166.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6513C112C1A;
 Mon, 18 Jul 2022 17:58:27 +0000 (UTC)
Received: by mail-il1-f182.google.com with SMTP id f1so619834ilu.3;
 Mon, 18 Jul 2022 10:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=8LULo19hUFHmhHSaHd6yHFXBHNeiLMybwtS5/MObIek=;
 b=JRExPQHGIzSoiX7tHu0CduqRwLmss5DDP4ZQN3ycJFd2+JjgWsTmUkcEhGEFyRNXD+
 NIAKK+W2tBdy34eRQW1p9jlisoEi38T1bBpkYHTYwEjd0+9T+bHv8HtgXhWwSPc/eEGe
 gl8Gpyu2UYNxfnWuZgsJ8hKy+4EqIk40vtAetyRjKsDESlyYa/7iF5rA0x2ZlysnTFET
 7SedvqDeqctEKCpHQsBqm6Fu3rwPRJtxFABb0zOWzPqXUIxTSQxKXjU/KOuIRMlulC2c
 6Sn7eF7L3kjZQCiNLSZ2PGFRCgSvKdff2URgJYzbkrkYDkW2YaeL00V6OCoTeu/LomXN
 9xhA==
X-Gm-Message-State: AJIora8SM3pUBEurNGJeAdiD+d/E7BbYmVDkLsptIIP+s7/AOkSlGi+U
 Eobk/K7ZuLkqtT3dy7nUTQ==
X-Google-Smtp-Source: AGRyM1u5X1SGwuiqB2p5EVblsYNeo7rdYRw4UiHvXjBcEPO2IEJO0Bi/juR+tn25c8JSxj+HtoMATg==
X-Received: by 2002:a05:6e02:11ae:b0:2dc:d9db:585c with SMTP id
 14-20020a056e0211ae00b002dcd9db585cmr5304133ilj.236.1658167106722; 
 Mon, 18 Jul 2022 10:58:26 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 v11-20020a92c6cb000000b002dc911570f1sm4986389ilm.71.2022.07.18.10.58.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:58:26 -0700 (PDT)
Received: (nullmailer pid 3252391 invoked by uid 1000);
 Mon, 18 Jul 2022 17:58:25 -0000
Date: Mon, 18 Jul 2022 11:58:25 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 10/11] dt-bindings: display/mdm: add gcc-bus clock to
 dpu-smd845
Message-ID: <20220718175825.GA3252359-robh@kernel.org>
References: <20220710090040.35193-1-dmitry.baryshkov@linaro.org>
 <20220710090040.35193-11-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710090040.35193-11-dmitry.baryshkov@linaro.org>
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
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 12:00:39 +0300, Dmitry Baryshkov wrote:
> Add gcc-bus clock required for the SDM845 DPU device tree node. This
> change was made in the commit 111c52854102 ("arm64: dts: qcom: sdm845:
> move bus clock to mdp node for sdm845 target"), but was not reflected in
> the schema.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/dpu-sdm845.yaml        | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
