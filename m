Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59C6A570E22
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 01:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6A5113B9D;
	Mon, 11 Jul 2022 23:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com
 [209.85.166.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED6BA113B9D;
 Mon, 11 Jul 2022 23:18:03 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id b12so3908290ilh.4;
 Mon, 11 Jul 2022 16:18:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=f2XdMFBhc4NMn9EddNPRLfQF2c+R/KA29L/gSecYKXo=;
 b=5srZZd4tlb76futg6Wzp7/EVK6PTPB6wvKZeuZ/zczxnYdVMOKOWlLLfDNHUmBcb5w
 fljQnJkBECtm84/EyPPk+oTCWwLpUShXfcJXZTUV+Cro1JcMPAKCatpoGHffYXGjjJ4p
 CaGNLAOAA8MlWtUzUJdvfnjAT4t9XB6/zuvgs0dj/5KvNjqfdtRcC/UrZqJHz/Qbood3
 N9pbQhO6RI1Ggq2A6UJ0ZZZX2JtpO4BivPAmZW0VUx/SL3SQr+oFKp1v7R8MkIzp8Gn0
 E/kURmYmndqjpIXmbaUpwyF3oFXoOvxElGyTseYpIafBX1Os3nJdc+0pj1eOR3ZG0Mop
 DH3Q==
X-Gm-Message-State: AJIora/1BlloanAAynpfADM5DvcNlLiUBcYFfaLGttioq3ggEsvQWjru
 BlLxm/txcP2+/lj2qXnn0Q==
X-Google-Smtp-Source: AGRyM1vyZvWaglhF2DL7o6k5C8/S6j/KTfpHBn+DP8hkEMeq6ZO4RWF3/NwePI2b96seJBq9DrQ2Gw==
X-Received: by 2002:a05:6e02:188f:b0:2dc:7291:fd02 with SMTP id
 o15-20020a056e02188f00b002dc7291fd02mr6293244ilu.321.1657581483045; 
 Mon, 11 Jul 2022 16:18:03 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
 by smtp.gmail.com with ESMTPSA id
 f12-20020a056638328c00b00339e6168237sm3344152jav.34.2022.07.11.16.18.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jul 2022 16:18:02 -0700 (PDT)
Received: (nullmailer pid 454950 invoked by uid 1000);
 Mon, 11 Jul 2022 23:18:00 -0000
Date: Mon, 11 Jul 2022 17:18:00 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 9/9] dt-bindings: msm/dp: handle DP vs eDP difference
Message-ID: <20220711231800.GA454897-robh@kernel.org>
References: <20220710084133.30976-1-dmitry.baryshkov@linaro.org>
 <20220710084133.30976-10-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710084133.30976-10-dmitry.baryshkov@linaro.org>
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
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, freedreno@lists.freedesktop.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sun, 10 Jul 2022 11:41:33 +0300, Dmitry Baryshkov wrote:
> The #sound-dai-cells property should be used only for DP controllers. It
> doesn't make sense for eDP, there is no support for audio output. The
> aux-bus should not be used for DP controllers. Also p1 MMIO region
> should be used only for DP controllers.
> 
> Take care of these differences.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/display/msm/dp-controller.yaml   | 26 ++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
