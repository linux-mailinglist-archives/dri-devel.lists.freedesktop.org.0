Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B9D66E79B
	for <lists+dri-devel@lfdr.de>; Tue, 17 Jan 2023 21:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 505A310E5C7;
	Tue, 17 Jan 2023 20:18:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com
 [209.85.160.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9905710E5B1;
 Tue, 17 Jan 2023 20:18:41 +0000 (UTC)
Received: by mail-oa1-f52.google.com with SMTP id
 586e51a60fabf-12c8312131fso33269973fac.4; 
 Tue, 17 Jan 2023 12:18:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eR8YbcfMepY76OiaErdLAV2Hc3g5AfoqFq4DC8Gzbb4=;
 b=V4xqy/HLDIY7e66C3/O5VQhuXq8p9J1xuvBwxRoaRet0ZFIPVxrBTFMmrxtD5GcgFQ
 13sR/XEgdK0jQKToW/dGApiB+ySqq7NqBdvDEpUIutvRhvE5RTPbXCwwhRJ4XvL6R1+a
 lMymCwPc9p+GlabXTGX09Qn4IylwB3wWPgHYS8Upz0ux6mMHr9vWkpgAhF56XSW3f8eA
 VSsDwTaGoUW6igwlOvsBImqs0++DdYRoYir3rRRCf4YAilQnEYKQ1ur1mihuBcCkWWIY
 xl3GrcIJphr/F4RqagdnqL/F5y8trEzQXH80FezLtc024O6hVicMd2kf7afkxXd+OhgP
 HUEg==
X-Gm-Message-State: AFqh2kqf5ruBS7IxBjCP3uz2Pac3yvremghDNnGbrmQNrnEWnFfLVAS0
 Q9MtfOauimkXeEFeRJodCA==
X-Google-Smtp-Source: AMrXdXv089TBvVd1Nm1c4yDRuJAsd/heqs9Z0JWT0biGb6hOr+GpAjpZXTc84rnYeIbCce/TeFamqg==
X-Received: by 2002:a05:6870:7b8a:b0:15f:18cb:9816 with SMTP id
 jf10-20020a0568707b8a00b0015f18cb9816mr2724591oab.4.1673986720766; 
 Tue, 17 Jan 2023 12:18:40 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 k18-20020a056870959200b0011d02a3fa63sm16805671oao.14.2023.01.17.12.18.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 12:18:40 -0800 (PST)
Received: (nullmailer pid 3639226 invoked by uid 1000);
 Tue, 17 Jan 2023 20:18:39 -0000
Date: Tue, 17 Jan 2023 14:18:39 -0600
From: Rob Herring <robh@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: Re: [PATCH v7 4/4] dt-bindings: display/msm: Add list of
 mdss-dsi-ctrl compats
Message-ID: <167398671860.3639169.11899100042089144320.robh@kernel.org>
References: <20230116152128.909646-1-bryan.odonoghue@linaro.org>
 <20230116152128.909646-5-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116152128.909646-5-bryan.odonoghue@linaro.org>
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
Cc: devicetree@vger.kernel.org, dianders@chromium.org,
 krzysztof.kozlowski+dt@linaro.org, freedreno@lists.freedesktop.org,
 andersson@kernel.org, konrad.dybcio@somainline.org, quic_abhinavk@quicinc.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 robh+dt@kernel.org, agross@kernel.org, david@ixit.cz,
 linux-arm-msm@vger.kernel.org, dmitry.baryshkov@linaro.org,
 swboyd@chromium.org, sean@poorly.run
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 16 Jan 2023 15:21:28 +0000, Bryan O'Donoghue wrote:
> Add the list of current compats absent the deprecated qcm2290 to the list
> of dsi compats listed here.
> 
> Several MDSS yaml files exist which document the dsi sub-node.
> For each existing SoC MDSS yaml, provide the right dsi compat string.
> 
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> ---
>  .../devicetree/bindings/display/msm/qcom,mdss.yaml        | 3 ++-
>  .../bindings/display/msm/qcom,msm8998-mdss.yaml           | 8 +++++---
>  .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml | 6 ++++--
>  .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml | 6 ++++--
>  .../devicetree/bindings/display/msm/qcom,sdm845-mdss.yaml | 8 +++++---
>  .../devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml | 8 +++++---
>  .../devicetree/bindings/display/msm/qcom,sm8250-mdss.yaml | 8 +++++---
>  .../devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml | 6 ++++--
>  .../devicetree/bindings/display/msm/qcom,sm8450-mdss.yaml | 4 +++-
>  9 files changed, 37 insertions(+), 20 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
