Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA7D3643675
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 22:08:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC3610E2A8;
	Mon,  5 Dec 2022 21:08:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com
 [209.85.167.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88D7810E29C;
 Mon,  5 Dec 2022 21:08:04 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id l127so14521517oia.8;
 Mon, 05 Dec 2022 13:08:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h7D2s6NnE8vYMQ/1od1mZ431L8A1FEXOo9mtdMb467A=;
 b=MMXe1NNmZKr7KAuo27eqDR6lmGzMcB9xqNC3TuADDV/WpwdDDj15XdHJyx0XWXSkVO
 7oQGPRHEkfEcdWrHCZppi2KwwkC5+j4jVN0BZDvq4aGNvFKxOFg1ys+iVNPyclJzXWvx
 3pfestzZ1j1t2XTHzQ13+ejb4BdetbwVN0QZaV0JqJrbDT46vt0HmE/IYFK5jDGXFm/y
 eSFnycClPfNDfzquiJ4m6RZ+oR2tCbBNgCXY+wPA5nB73cXsVzd9blO592ZICHlY1w9C
 s5q5VFATwG0Hj52qvxz6lQf9bsc5hzdrsqWRhe5cVW4ZREElMiXlydfvFvjGIFDXNsUu
 fHMw==
X-Gm-Message-State: ANoB5pmMDPlzYnIenRKHVdXmiR7DtAcmOmR64q0M+FQHVYnVSVebmvko
 D2EEAHXdyj7BbiKb1wLZtQ==
X-Google-Smtp-Source: AA0mqf7kB79NxvQBbpUMIQzxzhMvhuENJ0k1IumtXLM2ePDNaBA7cCNBU9POc3JkyXDrBtrsmYCj2w==
X-Received: by 2002:a05:6808:1902:b0:35d:d646:3d00 with SMTP id
 bf2-20020a056808190200b0035dd6463d00mr1388934oib.194.1670274483639; 
 Mon, 05 Dec 2022 13:08:03 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 j8-20020aca3c08000000b0035c21f1a570sm3252935oia.6.2022.12.05.13.08.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 13:08:03 -0800 (PST)
Received: (nullmailer pid 2623860 invoked by uid 1000);
 Mon, 05 Dec 2022 21:08:02 -0000
Date: Mon, 5 Dec 2022 15:08:02 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v3 02/11] dt-bindings: display: msm: Add qcom, sm8350-mdss
 binding
Message-ID: <167027448138.2623801.7062789699923957275.robh@kernel.org>
References: <20221205163754.221139-1-robert.foss@linaro.org>
 <20221205163754.221139-3-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221205163754.221139-3-robert.foss@linaro.org>
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
Cc: airlied@linux.ie, konrad.dybcio@somainline.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 vinod.koul@linaro.org, Jonathan Marek <jonathan@marek.ca>,
 quic_vpolimer@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, quic_kalyant@quicinc.com, loic.poulain@linaro.org,
 andersson@kernel.org, dianders@chromium.org, linux-kernel@vger.kernel.org,
 vkoul@kernel.org, dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 05 Dec 2022 17:37:45 +0100, Robert Foss wrote:
> Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for MDSS device
> tree bindings
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../display/msm/qcom,sm8350-mdss.yaml         | 221 ++++++++++++++++++
>  1 file changed, 221 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-mdss.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
