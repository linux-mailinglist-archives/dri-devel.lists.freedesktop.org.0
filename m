Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0467368E209
	for <lists+dri-devel@lfdr.de>; Tue,  7 Feb 2023 21:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A459010E5D3;
	Tue,  7 Feb 2023 20:40:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com
 [209.85.210.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B56910E5D3;
 Tue,  7 Feb 2023 20:40:55 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id
 e12-20020a0568301e4c00b0068bc93e7e34so4617798otj.4; 
 Tue, 07 Feb 2023 12:40:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3VTa7BOK0RGbDUdbwHDssuk11doisGgMTd26GS9ZN/k=;
 b=V+37itZfJ3V11+yrGmxbI1ep3DUfhMUWRWLvsnf9eiBLN2j1c56/D4Z/j9KE07L7gz
 thjNL99sszE3IGpETpy0MIh9nkPhu93GE+xFSnPLN9gzNu7aqA0u8VRQat7xvldNBPK+
 UHulVmZ0wYjNT+QSaZYygk2lcQkaH5FCZXDROBpKWjLR8ysGOVdd43ZCWzJe/XglinK3
 n7c/sum0vnCCFrz2QK0zZYKs3q/RY3x4Cz+1/HCTljvECRuo1xiXMlQ4+MwsVIYco1oD
 rnvS8YuSNWcYgoJR88kSaWCCiNPsHe3SO8S0zgSDXwdhhMHTF1lDS6ZXxkxG6MAHqV93
 VkLQ==
X-Gm-Message-State: AO0yUKU5iyKwGUeFeJeBmwdixBi+1AgPEL8aoFizsBUwURmdj65GfTvR
 Jpg0YAxXedH6uByo7MJH66fU09YsqQ==
X-Google-Smtp-Source: AK7set+HkyW9Hc3hWn26BhUdyJq8BIOVGjQyzpdrWQDGylxdn5msvGvfvq/OEieGD00dsYnNZ8LJkw==
X-Received: by 2002:a9d:4e06:0:b0:68b:d889:8b78 with SMTP id
 p6-20020a9d4e06000000b0068bd8898b78mr2336052otf.32.1675802454808; 
 Tue, 07 Feb 2023 12:40:54 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 cy22-20020a056830699600b0066b9a6bf3bcsm7081447otb.12.2023.02.07.12.40.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Feb 2023 12:40:54 -0800 (PST)
Received: (nullmailer pid 4118999 invoked by uid 1000);
 Tue, 07 Feb 2023 20:40:53 -0000
Date: Tue, 7 Feb 2023 14:40:53 -0600
From: Rob Herring <robh@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v2 1/8] dt-bindings: clock: Merge qcom,gpucc-sm8350 into
 qcom,gpucc.yaml
Message-ID: <167580245306.4118943.6938671659588578951.robh@kernel.org>
References: <20230206145707.122937-1-dmitry.baryshkov@linaro.org>
 <20230206145707.122937-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230206145707.122937-2-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Sean Paul <sean@poorly.run>,
 Bjorn Andersson <andersson@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Taniya Das <quic_tdas@quicinc.com>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Mon, 06 Feb 2023 16:57:00 +0200, Dmitry Baryshkov wrote:
> The GPU clock controller bindings for the Qualcomm sm8350 platform are
> not correct. The driver uses .fw_name instead of using indices to bind
> parent clocks, thus demanding the clock-names usage. With the proper
> clock-names in place, the bindings becomes equal to the bindings defined
> by qcom,gpucc.yaml, so it is impractical to keep them in a separate
> file.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  .../bindings/clock/qcom,gpucc-sm8350.yaml     | 71 -------------------
>  .../devicetree/bindings/clock/qcom,gpucc.yaml |  2 +
>  2 files changed, 2 insertions(+), 71 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/qcom,gpucc-sm8350.yaml
> 

Acked-by: Rob Herring <robh@kernel.org>

