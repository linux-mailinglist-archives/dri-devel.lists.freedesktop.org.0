Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED7DC269709
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 22:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 024256E59F;
	Mon, 14 Sep 2020 20:51:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-f66.google.com (mail-io1-f66.google.com
 [209.85.166.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B60566E59F
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 20:51:20 +0000 (UTC)
Received: by mail-io1-f66.google.com with SMTP id g128so1602357iof.11
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Sep 2020 13:51:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=q5BuFwXqgWUyM2oW2u+tt0CE/M323vwAM6Qm21hju84=;
 b=I8EoER/t0D8rH9I53VL/0sWLQGhAUn4gifB4S+aqKm0tP4kC1j6rBG45Kia1lAptg6
 M/IxPsApCxdvVEPMiDQl/y0tsQakQ1icSUy7tcRFL6+fnV29UP+3NxYrsTp5eGy4Aou5
 dIJePx9icPIdu7pDMxwMRt89S8hrVSQYftlehdbw0Q7sCAmVpqqB9xf5+1IKL3sOVOsm
 Q2owRTe5hS7mZNyM3TSg/wDy0yPkr+Vit/zZYp7XSDquZOskGAtDwVLB9cZVaqznBPwU
 IjHvEzCYN4go70E3aMQFwutGDAzmhRh3UoxJjYN9CVA6f1pGZ2a07J/Aq4onYtfekHly
 UeqA==
X-Gm-Message-State: AOAM53353JWk8r3UPTtcNZo4Xf4Pe1oTF6HjIePVaDwjmZPIbmv5oHZ5
 z/gtjMyKJajatBdEqJkS6w==
X-Google-Smtp-Source: ABdhPJxE2UxbjL3QpfM0FOA4k43+/+Tgm72pSVHJj60Dn1909MAmkzZSXMCLRYo9mu9sX4x7/Aw5ZQ==
X-Received: by 2002:a05:6638:1381:: with SMTP id
 w1mr15242941jad.34.1600116680100; 
 Mon, 14 Sep 2020 13:51:20 -0700 (PDT)
Received: from xps15 ([64.188.179.253])
 by smtp.gmail.com with ESMTPSA id r17sm7702364ilj.72.2020.09.14.13.51.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Sep 2020 13:51:19 -0700 (PDT)
Received: (nullmailer pid 223842 invoked by uid 1000);
 Mon, 14 Sep 2020 20:51:17 -0000
Date: Mon, 14 Sep 2020 14:51:17 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH v2 1/6] dt-bindings: gpu: arm, mali-midgard: Add missing
 properties
Message-ID: <20200914205117.GA223785@bogus>
References: <20200903191438.12781-1-krzk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200903191438.12781-1-krzk@kernel.org>
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
Cc: devicetree@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, dri-devel@lists.freedesktop.org,
 Kukjin Kim <kgene@kernel.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 03 Sep 2020 21:14:33 +0200, Krzysztof Kozlowski wrote:
> Add common properties appearing in DTSes (opp-table) to fix dtbs_check
> warnings like:
> 
>   arch/arm64/boot/dts/exynos/exynos5433-tm2.dt.yaml: gpu@14ac0000:
>     'opp-table' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Changes since v1:
> 1. Add properties instead of using unevaluated
> ---
>  Documentation/devicetree/bindings/gpu/arm,mali-midgard.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Applied, thanks!
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
