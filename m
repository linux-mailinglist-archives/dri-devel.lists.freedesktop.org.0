Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9975F4CACD6
	for <lists+dri-devel@lfdr.de>; Wed,  2 Mar 2022 19:02:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A98610E276;
	Wed,  2 Mar 2022 18:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com
 [209.85.161.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5665410E276;
 Wed,  2 Mar 2022 18:02:45 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id
 i6-20020a4ac506000000b0031c5ac6c078so2801469ooq.6; 
 Wed, 02 Mar 2022 10:02:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=VgE6mXj5k3v9QZZO5v/Knmz+OxYujVNrLAAks+xKJQ4=;
 b=p4fx1T+Qa26Vgot0pITD+6wHdGXmcPzLTSbRzdZGP81+2a8syId21UTZirFKLXHIkc
 MOS/Z+uvJejJO9GS4XS9VZBg/nke2knrRzFVr7LqHaB97fRDK7FUDBE/lhFuhUqdGcS3
 LGculDUHnUJRl2fbKWRvU2xPZ2wqSTF6oNlQ9fSiZ3Dqw76fThYcuyD8Y3xs//ZHbn4P
 RWSJcAheHnot3eeX0NNF1clMRIJyoNCOG3dbo6N62P3a49k3mgfTLKgpJ7L0xwrVA2pK
 iSL/VBlZIquPE7TpOq4ql271m9JxGgWiC4vQKDq6WnGZRsh3WixBTW7sEOGqd4eHoeLj
 y++g==
X-Gm-Message-State: AOAM53365KVgMXMSAFhEndcZJbTgQ1K+6Wvvs/ACA1Ws7RXv6If4gwlp
 LxnEYAn73Dao5DEGca0rXA==
X-Google-Smtp-Source: ABdhPJyA0Rt6qcpNxU14kgn7YYDpWhkXrSU6jmXb3jSq8JPxYyTQ880stHIx2uKruejT3XtNaFV2jA==
X-Received: by 2002:a05:6871:79b:b0:d3:4039:7e7c with SMTP id
 o27-20020a056871079b00b000d340397e7cmr814561oap.121.1646244164495; 
 Wed, 02 Mar 2022 10:02:44 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net.
 [66.90.148.213]) by smtp.gmail.com with ESMTPSA id
 t82-20020a4a3e55000000b0031847b47aaasm8196143oot.26.2022.03.02.10.02.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 10:02:43 -0800 (PST)
Received: (nullmailer pid 3971499 invoked by uid 1000);
 Wed, 02 Mar 2022 18:02:42 -0000
Date: Wed, 2 Mar 2022 12:02:42 -0600
From: Rob Herring <robh@kernel.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: msm: Add optional resets
Message-ID: <Yh+xQg7ycLMHLMcS@robh.at.kernel.org>
References: <20220302012931.4107196-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220302012931.4107196-1-bjorn.andersson@linaro.org>
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
Cc: devicetree@vger.kernel.org, Loic Poulain <loic.poulain@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-arm-msm@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 01, 2022 at 05:29:30PM -0800, Bjorn Andersson wrote:
> Add an optional reference to the MDSS_CORE reset, which when specified
> can be used by the implementation to reset the hardware blocks.
> 
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> Changes since v1:
> - New approach/patch
> 
>  .../devicetree/bindings/display/msm/dpu-qcm2290.yaml          | 4 ++++
>  Documentation/devicetree/bindings/display/msm/dpu-sc7180.yaml | 4 ++++
>  Documentation/devicetree/bindings/display/msm/dpu-sc7280.yaml | 4 ++++
>  Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml | 4 ++++
>  4 files changed, 16 insertions(+)

Acked-by: Rob Herring <robh@kernel.org>

