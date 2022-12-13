Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9737864B73F
	for <lists+dri-devel@lfdr.de>; Tue, 13 Dec 2022 15:22:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0318E10E325;
	Tue, 13 Dec 2022 14:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com
 [209.85.161.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E09AF10E325;
 Tue, 13 Dec 2022 14:22:42 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id
 t15-20020a4a96cf000000b0049f7e18db0dso2376155ooi.10; 
 Tue, 13 Dec 2022 06:22:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9nPYc70xBGK0Wj8psANEn98FZZPcSq92yTHRO99EQSs=;
 b=2agEKmqnwUkwhVetF15etLgeg4xAbyhMgU2NxZAkn+dFViNxoG6rf876znZcqwnZuO
 BF6f0cLB+Rv5PHCveueUV2jxROHIq7sq4BvsyyXcWOt+SGlKRv5xXjUT0QzE7hGZY1xa
 X59OH4pTqdQchxT0sWAWv47kIe1WpKASxsRfpJI9y4EzKC8zLDhiCa1wvmnMGKmqh3pa
 OFnZs1q3JcmQijmgnse3gUwW5ryRRJIl+2OllM/lI3KsgkT4AxRxUYy3ve9WGAOauPp0
 YEyhH+1sxQuCMrDiVBE77lxXTtwGY73a6emEgK3j52p7XYuMuw64inQmTIZZnV3UgcmU
 1wRQ==
X-Gm-Message-State: ANoB5pldsGAGmvLOYUoagDw8VnpB1mOZqH9mtNteLCe1KbCuFNlcWmIy
 YEEkuHQ/GMiT66cToRNfsw==
X-Google-Smtp-Source: AA0mqf4KHNeZUBFBK8Dd0lGGuku2C3O9bcj5/PiV07nJKuDygyrL2XX0a1nldxe/GxB6Cg/4thpJPQ==
X-Received: by 2002:a4a:d84c:0:b0:4a3:986e:3e07 with SMTP id
 g12-20020a4ad84c000000b004a3986e3e07mr8839675oov.5.1670941361968; 
 Tue, 13 Dec 2022 06:22:41 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 z15-20020a4a304f000000b004a065c72a05sm1206791ooz.2.2022.12.13.06.22.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Dec 2022 06:22:41 -0800 (PST)
Received: (nullmailer pid 958687 invoked by uid 1000);
 Tue, 13 Dec 2022 14:22:40 -0000
Date: Tue, 13 Dec 2022 08:22:40 -0600
From: Rob Herring <robh@kernel.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: Re: [PATCH 1/3] dt-bindings: display/msm: Add SM8150 MDSS & DPU
Message-ID: <167094136007.958629.14485580510491889552.robh@kernel.org>
References: <20221212093315.11390-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221212093315.11390-1-konrad.dybcio@linaro.org>
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, krzysztof.kozlowski@linaro.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>, agross@kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 12 Dec 2022 10:33:12 +0100, Konrad Dybcio wrote:
> Add bindings for the display hardware on SM8150.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8150-dpu.yaml |  92 +++++
>  .../display/msm/qcom,sm8150-mdss.yaml         | 330 ++++++++++++++++++
>  2 files changed, 422 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8150-dpu.yaml
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8150-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
