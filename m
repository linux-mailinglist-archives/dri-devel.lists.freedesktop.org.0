Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E9815EFE59
	for <lists+dri-devel@lfdr.de>; Thu, 29 Sep 2022 22:05:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 718BA10EC9C;
	Thu, 29 Sep 2022 20:05:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com
 [209.85.160.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE15D10EC9C;
 Thu, 29 Sep 2022 20:05:11 +0000 (UTC)
Received: by mail-oa1-f51.google.com with SMTP id
 586e51a60fabf-131ea99262dso823082fac.9; 
 Thu, 29 Sep 2022 13:05:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
 bh=MAZaPmhMH81ZFK3hzfo7ftSkq3A3dLtmuscZb9eXXXw=;
 b=3LJJYmN7C+9TeiA7nZtpUEZ1CAluTsXfueJ282Ds48ZHgrM8XRSejVgV86G6CXvqSs
 8+JUCmc9Ho9kK7/EyeZo8PQQIixb2gc2LSOGo+6YAIIT8isI3epXuJYTbwoEZ+JD/5Zn
 ZHrIE+OR20oQFnHxfdCSEm32iVzi20VrGm+CKu2p90GvRGPlprjq83kALBVh0AEe/4nS
 q6wSHvd1/yMlhcBhYCc3l9BzH1bw8sxibsGtJt+Hgm1j2/Fu2sxVDWOW1gMDnbAbr9Um
 RgWG0wkzDXCt7fp61KAzjbd8m8qbYghTHyBRtTqt+OJ3CHdR/wbPZVw4mrS+FfpEAyZd
 PZ1A==
X-Gm-Message-State: ACrzQf1QMxp3TAqZs+OY3YXwG2e2fsKeBmDn2am9bAOnDQ5zDWlDz9Z3
 I5f5dAAI35jmDnhmPrPcVQ==
X-Google-Smtp-Source: AMsMyM7ho8pAJLMKCwavOlMmQbKr829I1Gk6tRHVNP7Tgz9uYQFVSsWoz9ak8WTgYikUcKSIsHdRQg==
X-Received: by 2002:a05:6870:ecaa:b0:131:e816:b6a5 with SMTP id
 eo42-20020a056870ecaa00b00131e816b6a5mr811258oab.229.1664481910457; 
 Thu, 29 Sep 2022 13:05:10 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 v4-20020a4a9744000000b00448a3ecdc9dsm93498ooi.22.2022.09.29.13.05.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Sep 2022 13:05:10 -0700 (PDT)
Received: (nullmailer pid 2653492 invoked by uid 1000);
 Thu, 29 Sep 2022 20:05:09 -0000
Date: Thu, 29 Sep 2022 15:05:09 -0500
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v8 09/12] dt-bindings: display/msm: split dpu-msm8998
 into DPU and MDSS parts
Message-ID: <166448190871.2653447.5106481921859395809.robh@kernel.org>
References: <20220924123611.225520-1-dmitry.baryshkov@linaro.org>
 <20220924123611.225520-10-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220924123611.225520-10-dmitry.baryshkov@linaro.org>
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
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Herring <robh+dt@kernel.org>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, 24 Sep 2022 15:36:08 +0300, Dmitry Baryshkov wrote:
> In order to make the schema more readable, split dpu-msm8998 into the DPU
> and MDSS parts, each one describing just a single device binding.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../display/msm/qcom,msm8998-dpu.yaml         | 95 +++++++++++++++++++
>  ...pu-msm8998.yaml => qcom,msm8998-mdss.yaml} | 47 ++-------
>  2 files changed, 101 insertions(+), 41 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,msm8998-dpu.yaml
>  rename Documentation/devicetree/bindings/display/msm/{dpu-msm8998.yaml => qcom,msm8998-mdss.yaml} (69%)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
