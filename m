Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D09E678967
	for <lists+dri-devel@lfdr.de>; Mon, 23 Jan 2023 22:20:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44A7C10E58B;
	Mon, 23 Jan 2023 21:20:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com
 [209.85.167.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2F7910E58B;
 Mon, 23 Jan 2023 21:20:39 +0000 (UTC)
Received: by mail-oi1-f173.google.com with SMTP id v17so11562269oie.5;
 Mon, 23 Jan 2023 13:20:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UJETK3OSsznW7YVJ84aqO5Pm3VovO6KPLRPmFaeGzU8=;
 b=T8/G+yD5kd0F5VEIs6PogxBtHHLlkMtiI5WsjS2o5GlsIpl5ghgmDm89FEMnFswufG
 xDt2T8xPa3oKbvyjLg2j0IXHZq0lhw4MMexcXk7X8SHL2Gj456C+ux8KS4XLT0tLK5xZ
 TRAVW4vmIsXrCb4FDipp6isBMKgeN64CnYqmlxGr0SJReaYlFbc8eFVyuRtWnDyn98C1
 IDY5otYUX8GbU4+pSjex9Ommqs42OkYWuSh89pYK2fCxoNTGypCd5QMeXXQVTANMj5jW
 6YMbTlQgx3r2hgufA2pta6UN10A9K2MmHrUh/KgzencUZRWadF5qlmWYREPYcr30+1mm
 NcjQ==
X-Gm-Message-State: AFqh2kp4rXixDVKUO02ImnUwPQrHhAMuKLyms83eMj+ZOSv2aZv4vax9
 8PEsjWvQRO1mzEOfV0xoHg==
X-Google-Smtp-Source: AMrXdXtJ9Hc6xSNFXIXyN/NZ/8XRuK8JDpzti/x/t7iLm86yGhXfW5m3KZ4+rQbjzmzC3AT4qN3p0g==
X-Received: by 2002:a05:6808:404b:b0:36c:cc25:8bc4 with SMTP id
 cz11-20020a056808404b00b0036ccc258bc4mr9393700oib.26.1674508838860; 
 Mon, 23 Jan 2023 13:20:38 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net.
 [66.90.144.107]) by smtp.gmail.com with ESMTPSA id
 o8-20020a0568080bc800b003646062e83bsm218464oik.29.2023.01.23.13.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 13:20:38 -0800 (PST)
Received: (nullmailer pid 2659455 invoked by uid 1000);
 Mon, 23 Jan 2023 21:20:37 -0000
Date: Mon, 23 Jan 2023 15:20:37 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] dt-bindings: drop type for operating-points-v2
Message-ID: <167450883575.2659375.17323544164739111670.robh@kernel.org>
References: <20230119131033.117324-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230119131033.117324-1-krzysztof.kozlowski@linaro.org>
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>, devicetree@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Thierry Reding <thierry.reding@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Hunter <jonathanh@nvidia.com>, ", Kevin Hilman" <khilman@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 linux-tegra@vger.kernel.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org, Sowjanya Komatineni <skomatineni@nvidia.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org, =?utf-8?q?=2C?=linux-mmc@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On Thu, 19 Jan 2023 14:10:33 +0100, Krzysztof Kozlowski wrote:
> The type for operating-points-v2 property is coming from dtschema
> (/schemas/opp/opp.yaml), so individual bindings can just use simple
> "true".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> This depends on my pull request, at least logically:
> https://github.com/devicetree-org/dt-schema/pull/95
> 
> Patch could be applied in parallel but only if above PULL is
> accepted/correct.
> ---
>  .../devicetree/bindings/display/msm/dp-controller.yaml         | 3 +--
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-dc.yaml   | 3 +--
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-dsi.yaml  | 3 +--
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-epp.yaml  | 3 +--
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-gr2d.yaml | 3 +--
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-gr3d.yaml | 3 +--
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 3 +--
>  .../bindings/display/tegra/nvidia,tegra20-host1x.yaml          | 3 +--
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-mpe.yaml  | 3 +--
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-tvo.yaml  | 3 +--
>  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml   | 3 +--
>  .../devicetree/bindings/fuse/nvidia,tegra20-fuse.yaml          | 3 +--
>  .../devicetree/bindings/mmc/nvidia,tegra20-sdhci.yaml          | 3 +--
>  Documentation/devicetree/bindings/power/power-domain.yaml      | 3 ---
>  Documentation/devicetree/bindings/pwm/nvidia,tegra20-pwm.yaml  | 3 +--
>  15 files changed, 14 insertions(+), 31 deletions(-)
> 

Applied, thanks!
