Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 874A9629F6F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Nov 2022 17:45:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2992710E424;
	Tue, 15 Nov 2022 16:45:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com
 [209.85.167.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EEEC10E044;
 Tue, 15 Nov 2022 16:45:48 +0000 (UTC)
Received: by mail-oi1-f176.google.com with SMTP id n205so15471630oib.1;
 Tue, 15 Nov 2022 08:45:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bpB0DnIAvfrGbGP924nojTI5rkoGhC08JADkFVFEIXw=;
 b=LwcfhvBVBshEBHrSmOhoB9H0vvpL9FIArZWucrft2clqa8y1uf3KPZrT8KvvOV+6hl
 F+JnxkqNItlc8cuYsdi8oOb8sSr81gUTbZaVFy0VUE0YkdqD00P7WNYnXE0ZHaIwegoD
 foGsLttEcnP+fo4MzACPcx2UB6meQfjHuHjmKsDXDwTAvESZv2MaHH2ruMV8N6c8fNoN
 iW0bT8CptECjfctYoPLVAmL74d6aOEjDPisEyGQIMDemwTTpQYiC++parX9MsCKbrOpZ
 0GpQax8aKnWZ5E5zGQ3tVG7iHZu0/WqfnWeqpyt6Uc2IA9FTFbM9mpJMKP59O2V9dW+U
 X1qw==
X-Gm-Message-State: ANoB5pmxF9GWwjFg0Or6lsyxAp6pKrerb+Jcq/BOsH5aGB0oU0luhE1y
 m2ouSR8eMefADbocwQ+JMQ==
X-Google-Smtp-Source: AA0mqf5VUkKcLRvmerOG2+29l48fzbwkTMibacpwCXqHvIyVT9sdB9182Jgw1CU4ZxTjs6VTEzUywg==
X-Received: by 2002:a54:4685:0:b0:35a:1078:5f90 with SMTP id
 k5-20020a544685000000b0035a10785f90mr794917oic.117.1668530747395; 
 Tue, 15 Nov 2022 08:45:47 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 u29-20020a0568301f5d00b00660fe564e12sm5522176oth.58.2022.11.15.08.45.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 08:45:46 -0800 (PST)
Received: (nullmailer pid 1091300 invoked by uid 1000);
 Tue, 15 Nov 2022 16:45:47 -0000
Date: Tue, 15 Nov 2022 10:45:47 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Foss <robert.foss@linaro.org>
Subject: Re: [PATCH v2 01/12] dt-bindings: display: msm: Add qcom,sm8350-dpu
 binding
Message-ID: <20221115164547.GA1088214-robh@kernel.org>
References: <20221115111721.891404-1-robert.foss@linaro.org>
 <20221115111721.891404-2-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221115111721.891404-2-robert.foss@linaro.org>
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
 quic_abhinavk@quicinc.com, swboyd@chromium.org, sean@poorly.run,
 quic_kalyant@quicinc.com, loic.poulain@linaro.org, andersson@kernel.org,
 dianders@chromium.org, linux-kernel@vger.kernel.org, vkoul@kernel.org,
 dmitry.baryshkov@linaro.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Nov 15, 2022 at 12:17:10PM +0100, Robert Foss wrote:
> Mobile Display Subsystem (MDSS) encapsulates sub-blocks
> like DPU display controller, DSI etc. Add YAML schema for DPU device
> tree bindings
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  .../bindings/display/msm/qcom,sm8350-dpu.yaml | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,sm8350-dpu.yaml

Reviewed-by: Rob Herring <robh@kernel.org>

But since there is a dependency, no idea if this passes validation.
